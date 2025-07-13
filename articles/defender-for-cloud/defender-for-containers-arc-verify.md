---
title: Verify Defender for Containers deployment on Arc-enabled Kubernetes
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on Arc-enabled Kubernetes

After enabling Defender for Containers, use this guide to verify all components are functioning correctly on your Arc-enabled clusters.

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

## Verify Azure Policy extension

If Azure Policy for Kubernetes is deployed:

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

```bash
# Run a benign test that triggers an alert
kubectl run test-pod \
    --image=busybox \
    --rm -it \
    --restart=Never \
    -- /bin/sh -c "echo 'Testing Arc Defender' > /etc/hosts"
```

### Verify alert generation

1. Wait 5-10 minutes for processing.
1. Navigate to **Microsoft Defender for Cloud** > **Security alerts**.
1. Look for alerts related to your Arc-enabled cluster.

## Verify security insights

### Check recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.
1. Filter by **Resource type** = **Kubernetes services (Azure Arc)**.
1. Verify recommendations are appearing for your clusters.

### Review inventory

1. Go to **Inventory** > **Containers**.
1. Filter by **Environment** = **Azure Arc**.
1. Confirm your clusters are listed with security status.

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

### OpenShift

```bash
# Check SCC assignment
oc get scc | grep defender

# Verify audit log access
kubectl exec -n mdc deployment/microsoft-defender-controller -- ls -la /var/log/openshift-apiserver/
```

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

- Arc agents: < 200Mi memory, < 100m CPU per node
- Defender sensor: < 300Mi memory, < 150m CPU per node
- Policy agent: < 100Mi memory, < 50m CPU

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

1. Ensure Azure Policy extension is installed
1. Wait 24 hours for initial assessment
1. Check that clusters aren't excluded by tags
1. Verify RBAC permissions

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-arc-configure.md)
- [Deploy to additional clusters](defender-for-containers-arc-deploy.md)
- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
