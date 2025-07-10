---
title: Verify Defender for Containers deployment on AWS (EKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed and functioning on your Amazon EKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on AWS (EKS)

After deploying Defender for Containers on your EKS clusters, use this guide to verify all components are functioning correctly.

## Validation checklist

Complete these verification steps in order:

- [ ] [AWS connector shows as Connected](#check-environment-connection)
- [ ] [EKS clusters appear in Inventory](#verify-discovered-resources)
- [ ] [Arc agents are running](#check-arc-connection) (azure-arc namespace)
- [ ] [Defender sensor pods are running](#verify-defender-sensor) (mdc namespace)
- [ ] [Policy pods are running](#verify-azure-policy-extension) (azurepolicy namespace)
- [ ] [Test security alert generated successfully](#generate-a-test-security-alert)
- [ ] [Container images are being scanned](#verify-image-scanning)
- [ ] [Security recommendations are appearing](#check-security-recommendations)
- [ ] [Logs are flowing to Log Analytics](#verify-data-collection)
- [ ] [No error messages in component logs](#check-defender-sensor-logs)

> [!TIP]
> If any validation step fails, see the [Troubleshooting](#troubleshooting-verification-failures) section for that component.

## Verify in Microsoft Defender for Cloud

### Check environment connection

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Locate your AWS connector and verify:
   - Status shows as **Connected**
   - Last sync time is recent (within the last hour)
   - No error messages are displayed

### Verify discovered resources

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**.

1. Apply these filters:
   - **Environment**: AWS
   - **Resource type**: Kubernetes service

1. Verify that your EKS clusters appear in the list.

1. Check that each cluster shows:
   - Defender coverage status
   - Monitored resources count
   - Security findings (if any)

### Check security coverage

1. Navigate to **Workload protections** > **Containers**.

1. In the coverage section, verify:
   - Number of protected EKS clusters
   - Number of monitored container images
   - Active security policies

## Verify on EKS clusters

### Check Arc connection

```bash
# Set cluster context
aws eks update-kubeconfig --name <cluster-name> --region <region>

# Check Arc agents
kubectl get pods -n azure-arc
```

Expected output:

```
NAME                                         READY   STATUS    RESTARTS   AGE
clusteridentityoperator-xxx                  1/1     Running   0          1h
config-agent-xxx                             1/1     Running   0          1h
controller-manager-xxx                       1/1     Running   0          1h
flux-logs-agent-xxx                          1/1     Running   0          1h
resource-sync-agent-xxx                      1/1     Running   0          1h
```

### Verify Defender sensor

```bash
# Check Defender pods
kubectl get pods -n mdc

# Check DaemonSet status
kubectl get daemonsets -n mdc
```

Expected output:

```
NAME                    DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE
azuredefender-sensor    3         3         3       3            3
```

### Verify Azure Policy extension

```bash
# Check Policy pods
kubectl get pods -n azurepolicy

# Verify Policy deployment
kubectl get deployment -n azurepolicy
```

Expected components:

- azure-policy pod
- gatekeeper-controller pods
- gatekeeper-audit pod

### Check extension status in portal

Navigate to your Arc-enabled cluster to see installed extensions:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png" alt-text="Azure Arc page for checking the status of all installed extensions on a Kubernetes cluster." lightbox="media/defender-for-kubernetes-azure-arc/extension-installed-clusters-page.png":::

View detailed extension information:

:::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-details-page.png" alt-text="Full details of an Azure Arc extension on a Kubernetes cluster.":::

## Test functionality

### Generate a test security alert

1. Run a test command to trigger a benign alert:

    ```bash
    kubectl run test-alert \
        --image=nginx \
        --rm -it \
        --restart=Never \
        -- bash -c "echo 'test' > /etc/passwd"
    ```

1. Wait 5-10 minutes for the alert to appear.

1. Navigate to **Security alerts** in Defender for Cloud.

1. Look for an alert titled "Attempt to write to /etc/passwd detected".

### Verify image scanning

1. Push a test image to your ECR repository:

    ```bash
    # Tag and push a test image
    docker pull nginx:latest
    docker tag nginx:latest <account-id>.dkr.ecr.<region>.amazonaws.com/test:latest
    docker push <account-id>.dkr.ecr.<region>.amazonaws.com/test:latest
    ```

1. Wait for scanning to complete (typically 5-15 minutes).

1. Navigate to **Recommendations** > **Container images should have vulnerability findings resolved**.

1. Verify the image appears with vulnerability findings.

### Check security recommendations

1. Navigate to **Recommendations**.

1. Filter by **Resource type** = **Kubernetes service**.

1. Verify you see EKS-specific recommendations such as:
   - "Kubernetes clusters should disable automounting API credentials"
   - "Container images should be deployed from trusted registries only"
   - "Containers should run with a read only root file system"

## Verify logs and metrics

### Check Defender sensor logs

```bash
# View sensor logs
kubectl logs -n mdc -l app=azuredefender-sensor --tail=50

# Check for errors
kubectl logs -n mdc -l app=azuredefender-sensor | grep -i error
```

### Verify data collection

1. In Azure portal, navigate to your Log Analytics workspace.

1. Run this query to verify data ingestion:

    ```kusto
    ContainerLog
    | where TimeGenerated > ago(1h)
    | where ClusterName contains "eks"
    | summarize count() by ClusterName, ContainerName
    ```

1. Check for security events:

    ```kusto
    SecurityAlert
    | where TimeGenerated > ago(24h)
    | where ResourceId contains "eks"
    | project TimeGenerated, AlertName, Severity, ResourceId
    ```

## Troubleshooting verification failures

### Arc agents not running

```bash
# Check Arc connectivity
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group>

# Re-run Arc connection if needed
az connectedk8s connect \
    --name <cluster-name> \
    --resource-group <resource-group>
```

### Defender sensor issues

```bash
# Check sensor configuration
kubectl describe configmap -n mdc azuredefender-config

# Restart sensor pods
kubectl rollout restart daemonset/azuredefender-sensor -n mdc
```

### No security data appearing

1. Verify network connectivity:

    ```bash
    # Test connectivity to Azure endpoints
    kubectl run test-connectivity \
        --image=busybox \
        --rm -it \
        --restart=Never \
        -- nslookup ods.opinsights.azure.com
    ```

1. Check IAM permissions in AWS:

```bash
aws iam get-role --role-name DefenderForCloud-Containers-K8s
```

### Missing recommendations

If recommendations don't appear:

1. Ensure Azure Policy extension is installed.
1. Wait up to 24 hours for initial assessment.
1. Check Policy assignment status in Azure portal.

## Health monitoring

### Set up alerts for component health

1. Navigate to **Azure Monitor** > **Alerts**.

1. Create alert rules for:
   - Arc-enabled Kubernetes cluster availability
   - Extension health status changes
   - Failed security assessments

### Regular health checks

Create a monitoring routine:

```bash
#!/bin/bash
# health-check.sh

echo "Checking Arc connection..."
az connectedk8s show --name $CLUSTER_NAME --resource-group $RG --query connectivityStatus

echo "Checking Defender pods..."
kubectl get pods -n mdc --no-headers | grep -v Running

echo "Checking Policy pods..."
kubectl get pods -n azurepolicy --no-headers | grep -v Running

echo "Checking recent alerts..."
az security alert list --resource-group $RG --query "[?contains(resourceId, '$CLUSTER_NAME')]" --output table
```

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-aws-configure.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md) - If you need to uninstall
