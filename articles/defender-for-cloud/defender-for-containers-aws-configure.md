---
title: Configure Defender for Containers on AWS (EKS)
description: Learn how to configure and customize Microsoft Defender for Containers settings for your Amazon EKS clusters, including how to add or remove components after initial deployment.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on AWS

After deploying Defender for Containers on your EKS clusters, configure various settings to customize the security coverage to meet your needs. This article also explains how to add or remove components after initial deployment.

## Configuration areas

Jump to the configuration you need:

### Component management

- [Add or remove components](#add-or-remove-components)
- [Deploy components selectively](#deploy-components-selectively)

### Core settings

- [Enable or disable plan components](#configure-plan-components)
- [Custom Log Analytics workspace](#configure-custom-log-analytics-workspace)
- [Data collection settings](#configure-data-collection-settings)

### Security features

- [Container image scanning](#configure-container-image-scanning)
- [Alert settings and rules](#configure-alert-settings)
- [Compliance policies](#configure-compliance-policies)
- [Network security](#configure-network-security)

### Advanced configuration

- [Performance tuning](#performance-tuning)
- [Integration settings](#integration-settings)
- [Monitoring configuration](#monitoring-configuration-health)

> [!TIP]
> Most organizations start with [configuring plan components](#configure-plan-components) and [alert settings](#configure-alert-settings). If you need to add or remove components after initial deployment, see [Add or remove components](#add-or-remove-components).

## Add or remove components

After initial deployment, you may need to add components that were skipped or remove unnecessary ones.

### Check component deployment status

1. Go to **Inventory** > filter by AWS resources.

1. Check each EKS cluster for:
   - Arc connectivity status
   - Defender extension status
   - Policy extension status

### Add missing components

#### Connect EKS clusters to Azure Arc

If clusters aren't connected to Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about EKS clusters that need Arc connection.

1. Follow the recommendation to connect your clusters.

1. Use the provided scripts to connect each cluster to Azure Arc.

Or use CLI:

```azurecli
# Connect cluster to Arc
az connectedk8s connect \
    --name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $REGION
```

#### Deploy Defender sensor to existing clusters

After connecting your EKS clusters to Azure Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for recommendations about installing the Defender extension on Arc-enabled clusters.

1. Select the recommendation and follow the remediation steps.

Or deploy using CLI:

```azurecli
# Install Defender extension
az k8s-extension create \
    --name microsoft-defender \
    --extension-type microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

Or using Helm (for more control):

```bash
# Add Defender Helm repository
helm repo add mdc https://azuredefender.azurecr.io/helm/v1/repo
helm repo update

# Install Defender sensor
helm install defender-sensor mdc/azuredefender \
    --namespace mdc \
    --create-namespace \
    --set cluster.name=$CLUSTER_NAME
```

See [Deploy Defender sensor using Helm](deploy-helm.md) for detailed Helm configuration options.

#### Add Azure Policy extension

To add policy assessment to existing deployments:

```azurecli
# Install Azure Policy extension
az k8s-extension create \
    --name azurepolicy \
    --extension-type Microsoft.PolicyInsights \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

### Remove specific components

To remove components while keeping others:

1. Go to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Extensions**.

1. Select the extension to remove (Microsoft Defender or Azure Policy).

1. Select **Uninstall**.

Or use CLI:

```azurecli
# Remove Defender sensor only
az k8s-extension delete \
    --name microsoft-defender \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP

# Remove Policy extension only
az k8s-extension delete \
    --name azurepolicy \
    --cluster-type connectedClusters \
    --cluster-name $CLUSTER_NAME \
    --resource-group $RESOURCE_GROUP
```

## Deploy components selectively

### Deploy to specific clusters only

To deploy the sensor only to selected EKS clusters:

1. First connect specific clusters to Azure Arc (not all clusters).

1. Go to **Recommendations** and find "Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for selected clusters only.

### Configure ECR scanning for specific registries

To scan only specific ECR registries:

1. In the connector configuration, enable **Agentless container vulnerability assessment**.

1. Use AWS IAM policies to limit scanner access to specific registries.

1. Tag registries to include/exclude from scanning.

### Deploy Azure Policy extension selectively

To deploy policy assessment only to specific clusters:

1. After Arc connection, go to **Policy** > **Definitions**.

1. Search for "Configure Azure Policy extension on Arc-enabled Kubernetes".

1. Create an assignment scoped to specific resource groups or clusters.

## Configure plan components

You can enable or disable specific Defender for Containers components:

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your AWS connector.

1. Select **Settings** for the Containers plan.

1. Turn components on or off:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

1. Select **Continue** and **Save**.

## Configure custom Log Analytics workspace

By default, Defender for Containers uses an automatically created workspace. To use a custom workspace:

### Using Azure portal

1. Go to **Azure Policy**.

1. Search for "Configure Arc-enabled Kubernetes clusters to use Defender's sensor with custom workspace".

1. Select **Assign**.

1. Set up the assignment:
   - **Scope**: Choose your subscription or resource group
   - **Parameters**: Enter your custom workspace resource ID
   - **Remediation**: Create a remediation task

1. Select **Review + create**.

### Using Azure CLI

```azurecli
# Assign policy for custom workspace
az policy assignment create \
    --name "DefenderCustomWorkspace" \
    --policy "/providers/Microsoft.Authorization/policyDefinitions/708b60a6-d253-4fe0-9114-4be4c00f012c" \
    --scope "/subscriptions/{subscriptionId}" \
    --params '{
        "logAnalyticsWorkspaceResourceId": {
            "value": "/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}"
        }
    }'
```

### Update existing deployments

For clusters already deployed with the default workspace:

```bash
# Update extension configuration
az k8s-extension update \
    --name microsoft-defender \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --configuration-settings \
        "logAnalyticsWorkspaceResourceID=/subscriptions/{subscriptionId}/resourceGroups/{resourceGroup}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}"
```

## Configure data collection settings

### Adjust collection frequency

Change the data collection interval to optimize performance:

```bash
kubectl edit configmap -n mdc azuredefender-config
```

Add or change values:

```yaml
data:
  collection.interval: "60" # seconds
  batch.size: "1000" # events
```

### Configure audit log collection

To monitor security thoroughly, make sure audit logs are correctly set up:

1. In AWS Console, go to your EKS cluster.

1. Select the **Logging** tab.

1. Turn on these log types:
   - **API server**: API requests and responses
   - **Audit**: Detailed audit trail
   - **Authenticator**: Authentication decisions
   - **Controller manager**: State changes
   - **Scheduler**: Scheduling decisions

Or enable audit logging selectively using CLI:

```bash
# For specific cluster
aws eks update-cluster-config \
    --name <specific-cluster> \
    --logging '{"clusterLogging":[{"types":["audit"],"enabled":true}]}'
```

### Exclude specific namespaces

To exclude namespaces from monitoring:

```bash
kubectl annotate namespace <namespace-name> \
    microsoft.defender.cloud/exclude="true"
```

## Configure container image scanning

### ECR scanning settings

1. Go to your AWS connector in **Environment settings**.

1. Select **Container registries** configuration.

1. Set up the scanning options:
   - **Scan frequency**: Choose how often to rescan images.
   - **Scan on push**: Turn immediate scanning on or off.
   - **Vulnerability threshold**: Set the severity levels.

### Configure scanning exclusions

Exclude specific repositories from scanning:

```bash
# Tag ECR repository to exclude from scanning
aws ecr put-image-scanning-configuration \
    --repository-name <repository-name> \
    --image-scanning-configuration scanOnPush=false
```

## Configure alert settings

### Customize alert rules

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Email notifications**.

1. Set up:
   - Email recipients for different alert severities.
   - Alert aggregation settings.
   - Notification frequency.

### Create custom alert rules

Use Azure Monitor:

```azurecli
# Create custom alert for suspicious pod creation
az monitor activity-log alert create \
    --name "SuspiciousPodCreation" \
    --resource-group <resource-group> \
    --condition category=Security and \
                operationName=Microsoft.ContainerService/managedClusters/pods/write and \
                level=Warning \
    --action-group <action-group-id>
```

### Configure alert suppression

To suppress specific alerts:

1. Go to **Security alerts**.

1. Select an alert type to suppress.

1. Choose **Create suppression rule**.

1. Define suppression criteria:
   - Specific clusters
   - Container names or patterns
   - Time windows

## Configure compliance policies

### Enable regulatory standards

1. Go to **Regulatory compliance**.

1. Select **Manage compliance policies**.

1. Enable standards relevant to your organization:
   - CIS Kubernetes Benchmark
   - PCI DSS 3.2.1
   - ISO 27001
   - NIST SP 800-53

### Customize policy parameters

```azurecli
# Example: Set maximum privileged container age
az policy assignment create \
    --name "MaxPrivilegedContainerAge" \
    --policy "enforce-container-age-limit" \
    --scope "/subscriptions/{subscriptionId}" \
    --params '{
        "maximumAgeDays": {"value": 30},
        "excludedNamespaces": {"value": ["kube-system", "aws-system"]}
    }'
```

## Configure network security

### Network policy integration

Deploy network policies that work with Defender:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: defender-sensor-policy
  namespace: mdc
spec:
  podSelector:
    matchLabels:
      app: azuredefender-sensor
  policyTypes:
  - Ingress
  - Egress
  egress:
  - to:
    - namespaceSelector: {}
    ports:
    - protocol: TCP
      port: 443
  - to:
    - podSelector:
        matchLabels:
          k8s-app: kube-dns
    ports:
    - protocol: UDP
      port: 53
```

### Configure private endpoints

For clusters without direct internet access:

1. Set up Azure Private Link for:
   - Log Analytics workspace
   - Azure Monitor
   - Azure Arc services

1. Configure Defender to use private endpoints:

```bash
kubectl edit configmap -n mdc azuredefender-config
```

Add:

```yaml
data:
  use.private.link: "true"
  private.link.scope: "/subscriptions/{subscriptionId}/resourceGroups/{rg}/providers/Microsoft.Network/privateLinkScopes/{scopeName}"
```

## Performance tuning

### Resource limits

Adjust resource allocations for the Defender sensor:

```yaml
kubectl edit daemonset -n mdc azuredefender-sensor
```

Modify resource limits:

```yaml
resources:
  limits:
    cpu: "500m"      # Adjust based on cluster size
    memory: "512Mi"  # Adjust based on workload
  requests:
    cpu: "200m"
    memory: "256Mi"
```

### Configure data retention

1. Go to your Log Analytics workspace.

1. Select **Usage and estimated costs**.

1. Select **Data retention**.

1. Set the retention period (default is 30 days, can extend to 730 days).

## Integration settings

### SIEM integration

Export security alerts to your SIEM:

1. Go to **Continuous export**.

1. Configure export to:
   - Event Hub (for real-time streaming)
   - Log Analytics workspace
   - Third-party SIEM

### API access configuration

Generate API credentials for programmatic access:

```azurecli
# Create service principal for API access
az ad sp create-for-rbac \
    --name "DefenderContainersAPI" \
    --role "Security Reader" \
    --scopes "/subscriptions/{subscriptionId}"
```

## Monitoring configuration health

### Health metrics

Monitor configuration effectiveness:

```kusto
// Check configuration changes
AzureActivity
| where OperationNameValue contains "Microsoft.Security"
| where ActivityStatusValue == "Succeeded"
| project TimeGenerated, OperationNameValue, Caller, Properties
| order by TimeGenerated desc
```

### Configuration drift detection

Set up alerts for configuration changes:

```azurecli
az monitor activity-log alert create \
    --name "DefenderConfigChange" \
    --resource-group <resource-group> \
    --condition category=Administrative and \
                operationName=Microsoft.Security/pricings/write \
    --action-group <action-group-id>
```

## Troubleshooting component issues

### Fix Arc connectivity issues

For clusters showing as disconnected:

1. Re-run the Arc connection script.

1. Verify network connectivity from cluster to Azure.

1. Check Arc agent logs: `kubectl logs -n azure-arc -l app.kubernetes.io/component=cluster-agent`

### Fix sensor deployment issues

For clusters missing the Defender sensor:

1. Verify Arc connection is healthy.

1. Check for conflicting policies or admission controllers.

1. Deploy manually if needed: Use remediation from the recommendation.

### Sensor pods not starting

```bash
# Check pod status
kubectl describe pods -n kube-system -l app=microsoft-defender

# Common issues:
# - Image pull errors: Check network connectivity
# - Permission denied: Verify RBAC settings
# - Resource constraints: Check node resources
```

## Best practices

1. **Regular reviews**: Review configuration monthly.
1. **Test changes**: Test configuration changes in non-production first.
1. **Document settings**: Maintain documentation of custom configurations.
1. **Monitor impact**: Watch for performance impact after changes.
1. **Backup settings**: Export configurations before major changes.
1. **Track exclusions**: Document why certain clusters or components are excluded.

## Related content

- [Verify your configuration](defender-for-containers-aws-verify.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
- [Deploy sensor using Helm](deploy-helm.md)
