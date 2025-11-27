---
title: Verify Defender for Containers deployment on Azure (AKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your AKS clusters.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Verify Defender for Containers deployment on Azure (AKS)

After you enable Defender for Containers, use this guide to verify all components are functioning correctly.

## Validation checklist

Complete these verification steps in order:

- [ ] [Defender plan shows as enabled](#verify-plan-enablement)
- [ ] [Defender sensor pods are running](#verify-sensor-deployment) (kube-system namespace)
- [ ] [Azure Policy add-on is enabled](#verify-azure-policy-add-on)
- [ ] [Test security alert generated successfully](#test-security-detection)
- [ ] [No error messages in component logs](#check-defender-sensor-logs)

> [!TIP]
> If any validation step fails, see the [Troubleshooting](#common-verification-issues) section for that component.

## Verify plan enablement

### Using Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your subscription.
1. Verify that **Containers** shows as **On**.
1. Select **Settings** next to Containers and verify all extensions are enabled.

### Using Azure CLI

```azurecli
# Check pricing tier
az security pricing show --name 'Containers' --query pricingTier

# Check extensions
az security pricing extension list --name 'Containers'

# Verify all extensions are enabled
az security pricing show --name 'Containers' --query "properties.extensions[].isEnabled"
```

### Using PowerShell

```powershell
# Check plan status
Get-AzSecurityPricing -Name "Containers"

# Verify workspace configuration
Get-AzSecurityWorkspaceSetting -Name "default"

# Check if auto-provisioning is enabled
Get-AzSecurityAutoProvisioningSetting | Where-Object {$_.Name -eq "default"}
```

### Using REST API

```bash
# Set variables
SUBSCRIPTION_ID="<subscription-id>"
TOKEN="<bearer-token>"

# Check plan configuration
curl -X GET \
  "https://management.azure.com/subscriptions/${SUBSCRIPTION_ID}/providers/Microsoft.Security/pricings/Containers?api-version=2024-01-01" \
  -H "Authorization: Bearer ${TOKEN}"

# Verify response shows pricingTier as "Standard" and extensions as enabled
```

## Verify sensor deployment

### Check DaemonSet status

```bash
# Check if the Defender sensor DaemonSet is running
kubectl get daemonset -n kube-system | grep defender

# Expected output:
# microsoft-defender-collector-ds   3         3         3       3            3           <none>          5m
```

### Check using Azure CLI

```azurecli
# Verify Defender profile is enabled on AKS cluster
az aks show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query "securityProfile.defender"

# Expected output shows securityMonitoring.enabled as true
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

### Check security events

```kusto
SecurityEvent
| where TimeGenerated > ago(1h)
| where Computer contains "aks"
| summarize count() by Activity
| take 10
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

This alert type generates: "Attempt to access sensitive files detected"

#### Test 2: Container escape attempt

```bash
kubectl run escape-test \
    --image=nginx \
    --rm -it \
    --restart=Never \
    --overrides='{"spec":{"hostPID":true}}' \
    -- /bin/bash -c "ps aux"
```

This alert type generates: "Container running with high privileges detected"

#### Test 3: Crypto mining behavior

```bash
kubectl run crypto-test \
    --image=busybox \
    --rm -it \
    --restart=Never \
    -- /bin/sh -c "echo 'stratum+tcp://pool.example.com' > /tmp/test"
```

This alert type generates: "Digital currency mining behavior detected"

### Verify alerts

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Set the filter to:
   - Resource type: Kubernetes service
   - Time: Last 24 hours
   - Severity: All

1. Select an alert to view:
   - Full description
   - Affected resources
   - Remediation steps
   - Investigation path

> [!NOTE]
> Test alerts can take 5-10 minutes to appear. Some alerts only trigger in production scenarios with real malicious behavior.

## Advanced security alert simulations

To validate that your Defender for Containers deployment is working correctly, simulate various security alerts. These simulations trigger real alerts without causing actual harm to your clusters.

### Prerequisites for alert simulation

- Defender sensor is deployed and running
- Runtime protection is enabled
- Wait 5-10 minutes for alerts to appear after simulation

### Basic alert simulations

#### Simulate file modification alert

Simulate unauthorized modification of sensitive files:

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

### Verify simulated alert generation

After running simulations, verify that simulated alerts appear:

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.
1. Set the filter to:
   - **Resource type**: Kubernetes service
   - **Time range**: Last hour
   - **Severity**: All

1. Check that the alerts show:
   - Correct resource identification
   - Accurate timestamp
   - Appropriate severity level
   - Actionable remediation steps

### Alert response best practices

When alerts are generated, follow these best practices:

1. **Don't dismiss immediately**: Review the alert details.
1. **Check affected resources**: Verify the cluster and namespace.
1. **Review remediation steps**: Follow the provided guidance.
1. **Document false positives**: If simulation alerts persist.

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

1. **Wait longer**: Some alerts might take up to 15 minutes

## Common verification issues

### Sensor pods not running

If sensor pods aren't running:

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

### Missing recommendations

If recommendations are missing:

1. Check that you enabled the Azure Policy add-on.
1. Wait up to 24 hours for the initial assessment.
1. Verify you enabled agentless discovery.
1. Make sure you didn't exclude clusters through tags.

### No vulnerability scan results

If vulnerability scans are missing:

1. Check that you configured ACR integration.
1. Verify you recently pushed images.
1. Make sure you enabled vulnerability assessment.
1. Wait up to 4 hours for the initial scans.

## Related content

- [Configure advanced settings](defender-for-containers-azure-configure.md)
- [Remove Defender for Containers](defender-for-containers-azure-remove.md)
