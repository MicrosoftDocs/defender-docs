---
title: Configure Defender for Containers on AWS (EKS)
description: Learn how to configure and customize Microsoft Defender for Containers settings for your Amazon EKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on AWS (EKS)

After deploying Defender for Containers on your EKS clusters, you can configure various settings to customize the security coverage according to your needs.

## Configure plan components

You can enable or disable specific Defender for Containers components:

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select your AWS connector.

1. Select **Settings** for the Containers plan.

1. Toggle components on or off:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment**
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

1. Select **Continue** and **Save**.

## Configure custom Log Analytics workspace

By default, Defender for Containers uses an automatically created workspace. To use a custom workspace:

### Using Azure portal

1. Navigate to **Azure Policy**.

1. Search for "Configure Arc-enabled Kubernetes clusters to use Defender's sensor with custom workspace".

1. Select **Assign**.

1. Configure the assignment:
   - **Scope**: Select your subscription or resource group
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

Modify the data collection interval for performance optimization:

```bash
kubectl edit configmap -n mdc azuredefender-config
```

Add or modify:

```yaml
data:
  collection.interval: "60" # seconds
  batch.size: "1000" # events
```

### Configure audit log collection

For comprehensive security monitoring, ensure audit logs are properly configured:

1. In AWS Console, navigate to your EKS cluster.

1. Select the **Logging** tab.

1. Enable these log types:
   - **API server**: API requests and responses
   - **Audit**: Detailed audit trail
   - **Authenticator**: Authentication decisions
   - **Controller manager**: State changes
   - **Scheduler**: Scheduling decisions

### Exclude specific namespaces

To exclude namespaces from monitoring:

```bash
kubectl annotate namespace <namespace-name> \
    microsoft.defender.cloud/exclude="true"
```

## Configure container image scanning

### ECR scanning settings

1. Navigate to your AWS connector in **Environment settings**.

1. Select **Container registries** configuration.

1. Configure scanning options:
   - **Scan frequency**: How often to rescan images
   - **Scan on push**: Enable/disable immediate scanning
   - **Vulnerability threshold**: Set severity levels

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

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Email notifications**.

1. Configure:
   - Email recipients for different alert severities
   - Alert aggregation settings
   - Notification frequency

### Create custom alert rules

Using Azure Monitor:

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

1. Navigate to **Security alerts**.

1. Select an alert type to suppress.

1. Choose **Create suppression rule**.

1. Define suppression criteria:
   - Specific clusters
   - Container names or patterns
   - Time windows

## Configure compliance policies

### Enable regulatory standards

1. Navigate to **Regulatory compliance**.

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

2. Configure Defender to use private endpoints:

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

1. Navigate to your Log Analytics workspace.

1. Select **Usage and estimated costs**.

1. Select **Data retention**.

1. Set retention period (default is 30 days, can extend to 730 days).

## Integration settings

### SIEM integration

Export security alerts to your SIEM:

1. Navigate to **Continuous export**.

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

## Best practices

1. **Regular reviews**: Review configuration monthly
2. **Test changes**: Test configuration changes in non-production first
3. **Document settings**: Maintain documentation of custom configurations
4. **Monitor impact**: Watch for performance impact after changes
5. **Backup settings**: Export configurations before major changes

## Next steps

- [Verify deployment](defender-for-containers-aws-verify.md) - Confirm configuration changes
- [Remove Defender for Containers](defender-for-containers-aws-remove.md) - If you need to uninstall
