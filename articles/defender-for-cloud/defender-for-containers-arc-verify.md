---
title: Verify Defender for Containers Deployment on Arc-Enabled Kubernetes
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 06/04/2025
ai-usage: ai-assisted
---

# Verify Microsoft Defender for Containers deployment on Arc-enabled Kubernetes

After you enable Defender for Containers, use this article to verify all components are functioning correctly on your Arc-enabled clusters.

## Validation checklist

Complete these verification steps in order:

- [ ] [Arc connection is healthy](#verify-arc-connection)
- [ ] [Defender extension shows as installed](#verify-defender-extension)
- [ ] [Sensor pods are running](#verify-sensor-deployment) (mdc namespace)
- [ ] [Azure Policy is active](#verify-azure-policy-extension) (if enabled)
- [ ] [Data flowing to Log Analytics](#verify-data-collection)
- [ ] [Test alert generated successfully](#test-security-detection)
- [ ] [Recommendations appearing](#verify-security-insights)
- [ ] [No errors in logs](#check-component-logs)

> [!TIP]
> If any step fails, see the troubleshooting section for that component.

## Verify Arc connection

### Check Arc agent status

```bash
# Check Arc agent pods
kubectl get pods -n azure-arc

# Verify Arc operators
kubectl get deployments -n azure-arc

# Check connectivity status
kubectl logs -n azure-arc -l app.kubernetes.io/component=connect-agent --tail=50
```

### Using Azure CLI

```azurecli
# Verify cluster connection
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query connectivityStatus
```

## Verify Defender extension

### Check extension status

```azurecli
# Get extension details
az k8s-extension show \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>

# Check provisioning state
az k8s-extension show \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --query provisioningState
```

### Verify extension components

```bash
# List Defender pods
kubectl get pods -n mdc

# Check DaemonSet
kubectl get daemonset -n mdc

# Expected output:
# NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE
# microsoft-defender-sensor   5         5         5       5            5
```

### Verify extension deployment

1. In your Arc-enabled cluster, go to **Extensions**.

1. Verify both extensions show as **Succeeded**:
   - Microsoft Defender for Containers
   - Azure Policy for Kubernetes (if deployed)

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Screenshot that shows the Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

1. Select each extension to view configuration details:

   :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Screenshot that shows full details of an Azure Arc extension on a Kubernetes cluster.":::

## Verify sensor deployment

### Check sensor health

```bash
# View sensor logs
kubectl logs -n mdc -l app=microsoft-defender --tail=100

# Check for errors
kubectl logs -n mdc -l app=microsoft-defender | grep -i error

# Describe pods for issues
kubectl describe pods -n mdc -l app=microsoft-defender
```

### Verify resource consumption

```bash
# Check CPU and memory usage
kubectl top pods -n mdc

# View resource requests and limits
kubectl describe daemonset -n mdc microsoft-defender-sensor | grep -A 5 Resources
```

### Verify sensor deployment

After deployment, verify the sensor is running:

```bash
# Check sensor pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check DaemonSet status
kubectl get daemonset -n kube-system microsoft-defender-sensor
```

All nodes should have a running sensor pod within 5-10 minutes.

### Check sensor pods

```bash
# List all Defender pods
kubectl get pods -n mdc -l app=microsoft-defender

# Check pod logs for any errors
kubectl logs -n mdc -l app=microsoft-defender --tail=50
```

## Verify Azure Policy extension

If you deployed Azure Policy for Kubernetes:

```bash
# Check Azure Policy pods
kubectl get pods -n kube-system -l app=azure-policy

# Verify Gatekeeper deployment
kubectl get pods -n gatekeeper-system

# List constraint templates
kubectl get constrainttemplates
```

### Check policy compliance

```azurecli
# Get policy compliance state
az policy state list \
    --resource "/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Kubernetes/connectedClusters/<cluster-name>" \
    --query "[?complianceState=='NonCompliant'].{Policy:policyDefinitionName, State:complianceState}"
```

## Verify data collection

### Check Log Analytics connection

```bash
# Verify OMS agent (if deployed)
kubectl get daemonset -n kube-system omsagent

# Check logs are being sent
kubectl logs -n kube-system -l component=oms-agent --tail=50
```

### Query data in Log Analytics

Run these queries in your Log Analytics workspace:

```kusto
// Check if data is flowing
KubeEvents
| where TimeGenerated > ago(1h)
| summarize count() by Computer, _ResourceId
| take 10

// Verify security events
SecurityEvent
| where TimeGenerated > ago(1h)
| where Computer contains "arc"
| summarize count() by Activity
```

## Test security detection

### Generate a test alert

Run this benign test to verify threat detection:

```bash
# This command triggers a test alert
kubectl run test-alert \
    --image=nginx \
    --rm \
    -it \
    --restart=Never \
    -- /bin/bash -c "echo 'Testing Arc Defender' > /etc/hosts"
```

### Test the deployment

Generate a test security alert:

```bash
# Run this command in your cluster to trigger a benign test alert
kubectl run test-alert --image=nginx --rm -it --restart=Never -- bash -c "echo 'test' > /etc/passwd"
```

Check for the alert in Defender for Cloud within 5-10 minutes.

### Simulate security alerts from Microsoft Defender for Containers

Test security detection on your Arc-enabled clusters:

#### Test 1: Container escape attempt

```bash
kubectl run escape-test \
    --image=busybox \
    --rm -it \
    --restart=Never \
    --overrides='{"spec":{"hostNetwork":true}}' \
    -- /bin/sh -c "ping kubernetes.default"
```

Expected alert: "Container with host network access detected"

#### Test 2: Suspicious binary execution

```bash
kubectl run binary-test \
    --image=ubuntu \
    --rm -it \
    --restart=Never \
    -- /bin/bash -c "apt-get update && apt-get install -y netcat"
```

Expected alert: "Suspicious tool installed in container"

#### Test 3: Cluster admin binding

```bash
kubectl create clusterrolebinding test-admin \
    --clusterrole=cluster-admin \
    --serviceaccount=default:default

# Clean up immediately
kubectl delete clusterrolebinding test-admin
```

Expected alert: "Cluster admin role assigned"

### Distribution-specific tests

For **Rancher**:

```bash
kubectl run rancher-test --image=busybox --rm -it --restart=Never \
    -- /bin/sh -c "wget http://rancher-metadata/latest"
```

### View and investigate alerts

1. Go to **Security alerts** in Defender for Cloud.
1. Filter by your Arc-enabled clusters.
1. Select an alert to see investigation details.

## Verify security insights

### Check recommendations

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.
1. Set the filter for **Resource type** to **Kubernetes services (Azure Arc)**.
1. Make sure recommendations appear for your clusters.

### Review inventory

1. Go to **Inventory** > **Containers**.
1. Set the filter for **Environment** to **Azure Arc**.
1. Confirm your clusters are listed with security status.

### View security insights

After deployment completes:

1. **Inventory**: See all your Arc-enabled clusters and their security status.

1. **Recommendations**: View Arc-specific security recommendations:
   - Kubernetes API servers should be accessible only through private endpoints
   - Kubernetes clusters should use RBAC
   - Container images should come from trusted registries

1. **Security alerts**: Monitor runtime threats and suspicious activities.

### Monitor deployment progress

1. Go to **Microsoft Defender for Cloud** > **Workload protections**.

1. Select **Containers**.

1. Wait 15-30 minutes for your Arc-enabled clusters to appear.

## Check component logs

### Extension controller logs

```bash
# Check extension controller
kubectl logs -n azure-arc deployment/extension-agent

# Check configuration sync
kubectl logs -n azure-arc deployment/config-agent
```

### Defender component logs

```bash
# Check all Defender pods
kubectl logs -n mdc -l app=microsoft-defender --all-containers

# Check specific component
kubectl logs -n mdc deployment/microsoft-defender-publisher
kubectl logs -n mdc deployment/microsoft-defender-controller
```

## Distribution-specific verification

### Rancher

```bash
# Check Rancher-specific namespaces
kubectl get ns | grep -E "(cattle-|rancher-)"

# Verify exclusions are working
kubectl logs -n mdc deployment/microsoft-defender-controller | grep "excluded"
```

## Performance impact verification

### Check cluster performance

```bash
# Overall cluster metrics
kubectl top nodes

# Defender component usage
kubectl top pods -n mdc
kubectl top pods -n azure-arc
```

### Expected resource usage

Typical resource consumption:

- Arc agents: less than 200 Mi memory, less than 100m CPU per node
- Defender sensor: less than 300 Mi memory, less than 150m CPU per node
- Policy agent: less than 100 Mi memory, less than 50m CPU

## Common verification issues

### Extension stuck in creating state

1. Check Arc connectivity
1. Verify network connectivity to Azure
1. Review extension logs for errors
1. Ensure sufficient cluster resources

### No security data appearing

1. Verify Log Analytics workspace configuration
1. Check firewall rules for outbound connectivity
1. Confirm audit logs are accessible
1. Wait up to 30 minutes for initial data

### Missing recommendations

1. Ensure the Azure Policy extension is installed.
1. Wait 24 hours for the initial assessment.
1. Check that clusters aren't excluded by tags.
1. Verify RBAC permissions.

## Related content

- [Configure advanced settings](defender-for-containers-arc-configure.md)
- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
