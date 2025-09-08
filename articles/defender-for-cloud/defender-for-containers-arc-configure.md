---
title: Configure Defender for Containers on Arc-enabled Kubernetes
description: Learn how to configure advanced settings for Microsoft Defender for Containers on Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 06/04/2025
ai-usage: ai-assisted
---

# Configure Defender for Containers on Arc-enabled Kubernetes

This article explains how to configure advanced settings for Defender for Containers on your Arc-enabled Kubernetes clusters. It includes how to add or remove components after the initial deployment.

## Configuration areas

Jump to the configuration you need:

### Component management

- [Add or remove components](#add-or-remove-components)
- [Configure component exclusions](#configure-component-exclusions)

### Core settings

- [Configure runtime protection](#configure-runtime-protection)
- [Configure vulnerability scanning](#configure-vulnerability-scanning)
- [Configure security policies](#configure-security-policies)

### Distribution-specific

- [Rancher configuration](#rancher-specific-configuration)
- [VMware Tanzu configuration](#configure-for-vmware-tanzu)

### Advanced features

- [Configure alerts](#configure-alerts-and-notifications)
- [Resource optimization](#configure-resource-optimization)
- [Multi-cluster policies](#configure-multicluster-policies)

## Add or remove components

### Check component deployment status

To see which components are currently deployed:

1. Go to **Inventory** and filter by Arc-enabled Kubernetes resources.
1. Check each cluster for:
   - Arc connectivity status
   - Defender extension status
   - Policy extension status

### Enable or disable components through portal settings

1. In Defender for Cloud, select **Environment Settings**, then select the relevant subscription.

1. In **Defender plans**, select **Containers** > **Settings**.

1. Turn on or off the relevant components:

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

    > [!NOTE]
    > - When you turn off Defender for Containers, the components are set to **Off****.** They're not deployed to any more containers, but they're not removed from containers where they're already installed.
    > - To disable automatic installation of components during the onboarding process, select **Edit configuration** for the **Containers** plan. The advanced options appear, and you can disable automatic installation for each component.

### Deploy missing components

If you deployed specific components initially and want to add others:

#### Add Defender sensor to existing deployment

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.
1. Search for "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".
1. Select the clusters missing the sensor.
1. Select **Fix** to deploy.

#### Add Azure Policy extension

1. Go to your Arc-enabled Kubernetes cluster.
1. Under **Settings**, select **Extensions**.
1. Select **+ Add**.
1. Search for and add **Azure Policy for Kubernetes**.

> [!TIP]
> You can also use the **azure-defender-extension-arm-template.json** Resource Manager template from the Defender for Cloud [installation examples](https://aka.ms/kubernetes-extension-installation-examples) for automated deployment.

### Remove specific components

To remove components while keeping others:

1. Go to your Arc-enabled Kubernetes cluster.
1. Under **Settings**, select **Extensions**.
1. Select the extension to remove (Microsoft Defender or Azure Policy).
1. Select **Uninstall**.

## Configure component exclusions

### Exclude clusters from automatic provisioning

To prevent automatic component deployment on specific Arc-enabled clusters:

1. Go to your Arc-enabled Kubernetes cluster.
1. Under **Overview**, select **Tags**.
1. Add tags to control deployment:
   - For Defender sensor: `ms_defender_container_exclude_sensors` = `true`
   - For Azure Policy: `ms_defender_container_exclude_azurepolicy` = `true`

### Configure namespace exclusions

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-config
  namespace: mdc
data:
  excludedNamespaces: |
    - kube-system
    - kube-public
    - azure-arc
    - mdc
```

Apply the configuration:

```bash
kubectl apply -f defender-config.yaml
kubectl rollout restart deployment/microsoft-defender-controller -n mdc
```

## Configure custom workspace assignment

By default, Defender for Containers uses a default Log Analytics workspace. You can assign a custom workspace through Azure Policy for consistent workspace assignment across multiple clusters:

### Using Azure Policy

1. Go to **Azure Policy** in the Azure portal.

1. Search for the policy definition "Configure Arc-enabled Kubernetes clusters to use Log Analytics workspace for Defender".

1. Create a new assignment with these parameters:
   - **Scope**: Your subscription or resource group containing Arc clusters
   - **Workspace Resource Id**: Your custom Log Analytics workspace ID
   - **Effect**: DeployIfNotExists

1. Save the assignment. The policy configures all Arc-enabled clusters in scope to use the specified workspace.

### Using Azure CLI

```azurecli
# Assign custom workspace via policy
az policy assignment create \
    --name "DefenderWorkspaceAssignment" \
    --scope "/subscriptions/<subscription-id>/resourceGroups/<resource-group>" \
    --policy "/providers/Microsoft.Authorization/policyDefinitions/[workspace-policy-id]" \
    --params '{
        "workspaceResourceId": {
            "value": "/subscriptions/<subscription-id>/resourceGroups/<rg>/providers/Microsoft.OperationalInsights/workspaces/<workspace-name>"
        }
    }'
```

> [!TIP]
> For deployment-time workspace configuration, you can specify the workspace when deploying the Defender extension. See [Enable Defender for Containers on Arc-enabled Kubernetes](defender-for-containers-arc-enable-portal.md#configure-log-analytics-workspace).

## Configure runtime protection

### Exclude namespaces from monitoring

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-config
  namespace: mdc
data:
  excludedNamespaces: |
    - kube-system
    - kube-public
    - azure-arc
    - mdc
```

Apply the configuration:

```bash
kubectl apply -f defender-config.yaml
kubectl rollout restart deployment/microsoft-defender-controller -n mdc
```

### Configure monitoring scope

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-scope
  namespace: mdc
data:
  monitoringScope: |
    includeNamespaces:
      - production
      - staging
    excludeLabels:
      - monitoring: disabled
      - defender: exclude
```

### Configure for on-premises clusters

For on-premises Arc-enabled clusters:

1. **Configure private registries**:

   ```bash
   kubectl create secret docker-registry regcred \
     --namespace mdc \
     --docker-server=<registry> \
     --docker-username=<username> \
     --docker-password=<password>
   ```

1. **Set proxy configuration** (if required):

   ```bash
   az k8s-extension update \
       --name microsoft.azuredefender.kubernetes \
       --cluster-type connectedClusters \
       --cluster-name <cluster-name> \
       --resource-group <resource-group> \
       --configuration-settings \
           httpProxy="http://proxy.company.com:3128" \
           httpsProxy="http://proxy.company.com:3128" \
           noProxy="10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
   ```

## Configure for specific distributions

### Rancher-specific configuration

For Rancher RKE and RKE2 clusters:

1. Configure the audit log path:
   - RKE: `/var/log/kubernetes/audit.log`
   - RKE2: `/var/log/kube-audit/audit.log`

1. Apply Rancher-specific configuration:

   ```yaml
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: microsoft-defender-rancher
     namespace: mdc
   data:
     rancherConfig: |
       monitorCattleSystem: false
       excludeRancherNamespaces: true
       customAuditPath: /var/log/rancher/audit.log
   ```

1. Update the extension with the correct audit path:

   ```bash
   az k8s-extension update \
       --name microsoft.azuredefender.kubernetes \
       --cluster-type connectedClusters \
       --cluster-name <cluster-name> \
       --resource-group <resource-group> \
       --configuration-settings \
           auditLogPath="/var/log/kube-audit/audit.log"  # For RKE2
   ```

### Configure for VMware Tanzu

For Tanzu clusters:

1. Ensure audit logging is enabled.
1. Set appropriate PSP or PSA policies.
1. Configure network policies if required.
1. Apply Tanzu-specific configuration:

   ```yaml
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: microsoft-defender-tanzu
     namespace: mdc
   data:
     tanzuConfig: |
       enablePSP: true
       monitorSystemNamespaces: false
       customLogPath: /var/log/kubernetes/audit.log
   ```

## Configure vulnerability scanning

### Set up private registry scanning

```bash
# Create registry credentials
kubectl create secret docker-registry registry-creds \
    --docker-server=<registry-url> \
    --docker-username=<username> \
    --docker-password=<password> \
    --namespace=mdc

# Update Defender configuration
kubectl patch configmap microsoft-defender-config -n mdc --type merge -p '
{
  "data": {
    "registryCredentials": "registry-creds"
  }
}'
```

### Configure scan frequency

```azurecli
# Update extension configuration
az k8s-extension update \
    --name microsoft.azuredefender.kubernetes \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --configuration-settings \
        scanFrequency=24h \
        scanOnPush=true
```

### Air-gapped registry configuration

For disconnected environments:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-airgap
  namespace: mdc
data:
  airgapConfig: |
    localRegistry: "internal-registry.company.com"
    skipTLSVerify: false
    caCertificate: |
      -----BEGIN CERTIFICATE-----
      [Your CA Certificate]
      -----END CERTIFICATE-----
```

## Configure security policies

### Apply custom policies

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-policies
  namespace: mdc
data:
  customPolicies: |
    - name: "block-privileged-pods"
      enabled: true
      enforcement: "deny"
    - name: "require-resource-limits"
      enabled: true
      enforcement: "audit"
    - name: "restrict-host-network"
      enabled: true
      enforcement: "deny"
```

### Configure CIS benchmark settings

```bash
# Enable specific CIS controls
az k8s-extension update \
    --name microsoft.azuredefender.kubernetes \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --configuration-settings \
        cisControls="1.1.1,1.2.1,2.1.1,3.1.1,4.1.1"
```

## Configure alerts and notifications

### Set up alert rules

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-alerts-config
  namespace: mdc
data:
  alertRules: |
    - name: "high-severity-only"
      severity: ["High", "Critical"]
      enabled: true
      notification:
        email: security-team@company.com
        webhook: https://webhook.company.com/defender
    - name: "privilege-escalation"
      categories: ["PrivilegeEscalation", "DefenseEvasion"]
      enabled: true
      notification:
        teams: true
```

### Configure webhook notifications

```bash
# Set webhook URL
kubectl create secret generic webhook-config \
    --from-literal=url=https://webhook.company.com/defender \
    --from-literal=token=<webhook-token> \
    -n mdc
```

## Configure resource optimization

### Adjust resource limits

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-resources
  namespace: mdc
data:
  resourceLimits: |
    sensor:
      memory: "512Mi"
      cpu: "200m"
    collector:
      memory: "256Mi"
      cpu: "100m"
```

### Configure node affinity

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: microsoft-defender-sensor
  namespace: mdc
spec:
  template:
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: node-role.kubernetes.io/worker
                operator: Exists
              - key: kubernetes.io/os
                operator: In
                values:
                - linux
```

### Edge deployment optimization

For resource-constrained edge environments:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-edge-config
  namespace: mdc
data:
  edgeOptimization: |
    reducedTelemetry: true
    localProcessing: true
    batchSize: 100
    flushInterval: 300s
```

## Configure multicluster policies

For organizations with multiple Arc clusters:

```azurecli
# Apply policy initiative to resource group
az policy assignment create \
    --name "DefenderForContainersArc" \
    --scope "/subscriptions/<sub-id>/resourceGroups/<rg-name>" \
    --policy-set-definition "/providers/Microsoft.Authorization/policySetDefinitions/[defender-arc-initiative-id]" \
    --params '{
        "logAnalyticsWorkspace": {"value": "<workspace-id>"},
        "excludedNamespaces": {"value": ["kube-system", "azure-arc"]},
        "enableAutoProvisioning": {"value": true}
    }'
```

## Configure compliance scanning

### Enable specific compliance standards

```bash
# Configure compliance standards
az k8s-extension update \
    --name microsoft.azuredefender.kubernetes \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --cluster-type connectedClusters \
    --configuration-settings \
        complianceStandards="CIS,PCI-DSS,NIST" \
        complianceScanInterval="12h"
```

### Custom compliance rules

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-compliance-custom
  namespace: mdc
data:
  customRules: |
    - id: "CUSTOM-001"
      name: "Ensure custom labels"
      description: "All pods must have company labels"
      query: |
        .metadata.labels."company.com/team" != null and
        .metadata.labels."company.com/env" != null
```

## Configure for specific scenarios

### High-security environments

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-high-security
  namespace: mdc
data:
  securityConfig: |
    enforceNetworkPolicies: true
    blockPrivilegedContainers: true
    requireSignedImages: true
    enableAuditAllActions: true
```

### Development environments

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-dev-config
  namespace: mdc
data:
  devConfig: |
    reducedAlerts: true
    excludeTestNamespaces: true
    suppressInfoAlerts: true
```

## Monitor configuration changes

```kusto
// Query configuration changes
ConfigurationChange
| where Computer contains "<cluster-name>"
| where ConfigChangeType == "Files" or ConfigChangeType == "Software"
| where TimeGenerated > ago(24h)
| project TimeGenerated, Computer, ConfigChangeType, FieldsChanged
| order by TimeGenerated desc
```

## Troubleshooting configuration

If configuration changes don't take effect, try the following steps:

1. Verify you applied the ConfigMap.

   ```bash
   kubectl get configmap -n mdc microsoft-defender-config -o yaml
   ```

1. Restart Defender components.

   ```bash
   kubectl rollout restart deployment -n mdc
   ```

1. Check logs for configuration errors.

   ```bash
   kubectl logs -n mdc deployment/microsoft-defender-controller | grep -i config
   ```

## Related content

- [Verify your configuration](defender-for-containers-arc-verify.md)
- [Remove Defender for Containers](defender-for-containers-arc-remove.md)
