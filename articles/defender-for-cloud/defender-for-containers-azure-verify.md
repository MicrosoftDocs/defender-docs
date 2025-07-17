---
title: Verify Defender for Containers deployment on Azure (AKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your AKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on Azure (AKS)

After enabling Defender for Containers, use this guide to verify all components are functioning correctly.

## Validation checklist

Complete these verification steps in order:

- [ ] [Defender plan shows as enabled](#verify-plan-enablement)
- [ ] [Defender sensor pods are running](#verify-sensor-deployment) (kube-system namespace)
- [ ] [Azure Policy add-on is enabled](#verify-azure-policy-add-on)
- [ ] [Log Analytics data is flowing](#verify-data-collection)
- [ ] [Container images are being scanned](#verify-container-image-scanning)
- [ ] [Test security alert generated successfully](#test-security-detection)
- [ ] [Security recommendations are appearing](#verify-recommendations)
- [ ] [No error messages in component logs](#check-defender-sensor-logs)

> [!TIP]
> If any validation step fails, see the [Troubleshooting](#common-verification-issues) section for that component.

## Verify plan enablement

### Using Azure portal

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your subscription.
1. Verify that **Containers** shows as **On**.
1. Select **Settings** next to Containers and verify all extensions are enabled.

### Using Azure CLI

```azurecli
# Check pricing tier
az security pricing show --name 'Containers' --query pricingTier

# Check extensions
az security pricing extension list --name 'Containers'
```

## Verify sensor deployment

### Check DaemonSet status

```bash
# Check if the Defender sensor DaemonSet is running
kubectl get daemonset -n kube-system | grep defender

# Expected output:
# microsoft-defender-collector-ds   3         3         3       3            3           <none>          5m
```

### Check pod status

```bash
# List Defender pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check pod logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=50
```

### Check Defender sensor logs

```bash
# View recent logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=100

# Check for errors
kubectl logs -n kube-system -l app=microsoft-defender | grep ERROR
```

## Verify Azure Policy add-on

```azurecli
# Check if Azure Policy is enabled
az aks show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query addonProfiles.azurepolicy

# Expected output shows enabled:true
```

## Verify data collection

### Check Log Analytics connection

1. In the Azure portal, navigate to your AKS cluster.
1. Select **Logs** under **Monitoring**.
1. Run this query to verify data flow:

```kusto
ContainerLog
| where TimeGenerated > ago(1h)
| summarize count() by Computer, ContainerID
| take 10
```

### Check security events

```kusto
SecurityEvent
| where TimeGenerated > ago(1h)
| where Computer contains "aks"
| summarize count() by Activity
| take 10
```

## Verify container image scanning

### For Azure Container Registry

1. Navigate to your Azure Container Registry.
1. Select **Security** > **Defender for Cloud**.
1. Verify that vulnerability scanning is enabled.
1. Check recent scan results for your images.

### Using Azure CLI

```azurecli
# List vulnerability assessments
az security assessment list \
    --query "[?contains(name, 'container')]" \
    --output table
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
    -- /bin/bash -c "echo 'This is a test alert for Defender for Containers' > /etc/passwd"
```

Check for the alert in Defender for Cloud within 5-10 minutes.

### Simulate security alerts from Microsoft Defender for Containers

To test different alert types, run these simulated scenarios:

#### Test 1: Suspicious process execution

```bash
kubectl run suspicious-process \
    --image=busybox \
    --rm -it \
    --restart=Never \
    -- /bin/sh -c "cat /etc/shadow"
```

This generates: "Attempt to access sensitive files detected"

#### Test 2: Container escape attempt

```bash
kubectl run escape-test \
    --image=nginx \
    --rm -it \
    --restart=Never \
    --overrides='{"spec":{"hostPID":true}}' \
    -- /bin/bash -c "ps aux"
```

This generates: "Container running with high privileges detected"

#### Test 3: Crypto mining behavior

```bash
kubectl run crypto-test \
    --image=busybox \
    --rm -it \
    --restart=Never \
    -- /bin/sh -c "echo 'stratum+tcp://pool.example.com' > /tmp/test"
```

This generates: "Digital currency mining behavior detected"

### Verify alerts

1. Navigate to **Microsoft Defender for Cloud** > **Security alerts**.

1. Filter by:
   - Resource type: Kubernetes service
   - Time: Last 24 hours
   - Severity: All

1. Select an alert to view:
   - Full description
   - Affected resources
   - Remediation steps
   - Investigation path

> [!NOTE]
> Test alerts may take 5-10 minutes to appear. Some alerts only trigger in production scenarios with real malicious behavior.

## Verify recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.
1. Filter by **Resource type** = **Kubernetes services**.
1. Verify you see recommendations for your AKS clusters.

## Simulate security alerts from Microsoft Defender for Containers

To validate that your Defender for Containers deployment is working correctly, you can simulate various security alerts. These simulations trigger real alerts without causing actual harm to your clusters.

### Prerequisites for alert simulation

- Defender sensor must be deployed and running
- Runtime protection must be enabled
- Allow 5-10 minutes for alerts to appear after simulation

### Basic alert simulations

#### Simulate file modification alert

This simulates unauthorized modification of sensitive files:

```bash
# Connect to your cluster
kubectl run simulate-file-alert \
    --image=nginx \
    --rm \
    -it \
    --restart=Never \
    -- /bin/bash -c "echo 'test' > /etc/passwd"
```

Expected alert: "Sensitive file modification detected"

#### Simulate suspicious process execution

```bash
kubectl run simulate-process-alert \
    --image=ubuntu \
    --rm \
    -it \
    --restart=Never \
    -- /bin/bash -c "curl http://malicious-domain.com || echo 'simulated threat'"
```

Expected alert: "Suspicious process execution detected"

### Advanced alert simulations

#### Simulate cryptomining activity

```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: crypto-simulation
spec:
  containers:
  - name: crypto
    image: ubuntu
    command: ["/bin/bash", "-c"]
    args:
      - |
        # Simulate cryptomining behavior (harmless)
        while true; do
          echo "Mining simulation..." | base64
          sleep 1
        done
  restartPolicy: Never
EOF

# Clean up after verification
kubectl delete pod crypto-simulation
```

Expected alert: "Digital currency mining activity detected"

#### Simulate container escape attempt

```bash
kubectl run escape-simulation \
    --image=ubuntu \
    --rm \
    -it \
    --restart=Never \
    --overrides='{"spec":{"containers":[{"name":"escape","image":"ubuntu","command":["nsenter","--mount=/proc/1/ns/mnt","--","echo","escape-test"],"securityContext":{"privileged":true}}]}}' \
    || echo "Escape simulation triggered"
```

Expected alert: "Container escape attempt detected"

### Simulate Kubernetes-specific threats

#### Suspicious kubectl commands

```bash
# This simulates reconnaissance activity
kubectl auth can-i --list --namespace=kube-system

# This simulates privilege escalation attempt
kubectl create clusterrolebinding test-admin-binding \
    --clusterrole=cluster-admin \
    --serviceaccount=default:default \
    --dry-run=client -o yaml
```

Expected alerts: 
- "Kubernetes reconnaissance activity detected"
- "Privilege escalation attempt detected"

### Verify alert generation

After running simulations:

1. Navigate to **Microsoft Defender for Cloud** > **Security alerts**
1. Filter by:
   - **Resource type**: Kubernetes service
   - **Time range**: Last hour
   - **Severity**: All

1. Verify alerts appear with:
   - Correct resource identification
   - Accurate timestamp
   - Appropriate severity level
   - Actionable remediation steps

### Alert response best practices

When alerts are generated:

1. **Don't dismiss immediately**: Review the alert details
1. **Check affected resources**: Verify the cluster and namespace
1. **Review remediation steps**: Follow the provided guidance
1. **Document false positives**: If simulation alerts persist

### Clean up test resources

```bash
# Remove any test pods
kubectl delete pods -l run=test-alert
kubectl delete pods -l run=simulate-file-alert
kubectl delete pods -l run=simulate-process-alert
kubectl delete pods -l run=escape-simulation

# Remove test bindings
kubectl delete clusterrolebinding test-admin-binding 2>/dev/null || true
```

### Troubleshooting alert generation

If alerts don't appear:

1. **Verify sensor is running**:
   ```bash
   kubectl get pods -n kube-system -l app=microsoft-defender
   ```

1. **Check runtime protection is enabled**:
   - Go to Environment settings > Subscription > Containers
   - Verify Defender DaemonSet is enabled

1. **Review sensor logs**:
   ```bash
   kubectl logs -n kube-system -l app=microsoft-defender | grep -i alert
   ```

1. **Wait longer**: Some alerts may take up to 15 minutes

## Common verification issues

### Sensor pods not running

If sensor pods are not running:

```bash
# Check pod events
kubectl describe pods -n kube-system -l app=microsoft-defender

# Check resource constraints
kubectl top nodes
kubectl top pods -n kube-system
```

Common causes:
- **Insufficient resources**: Increase node size or add nodes
- **Network policies**: Ensure egress to Azure endpoints is allowed
- **RBAC issues**: Verify cluster has proper permissions

### No security alerts

If you're not seeing security alerts:

1. Ensure diagnostic logs are enabled
1. Verify Log Analytics workspace connection
1. Check that runtime protection is enabled in Defender settings
1. Wait 5-10 minutes after generating test events

### Missing recommendations

If recommendations are missing:

1. Verify Azure Policy add-on is enabled
1. Wait up to 24 hours for initial assessment
1. Check that agentless discovery is enabled
1. Ensure clusters aren't excluded via tags

### No vulnerability scan results

For missing vulnerability scans:

1. Verify ACR integration is configured
1. Check that images have been pushed recently
1. Ensure vulnerability assessment is enabled
1. Wait up to 4 hours for initial scans

## Performance validation

### Check resource usage

```bash
# Check Defender sensor resource usage
kubectl top pods -n kube-system -l app=microsoft-defender

# Monitor over time
watch kubectl top pods -n kube-system -l app=microsoft-defender
```

### Verify minimal impact

Defender sensors should use:
- CPU: < 100m per node (typical)
- Memory: < 200Mi per node (typical)

## Related content

- [Configure advanced settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
