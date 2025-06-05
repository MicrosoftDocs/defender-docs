---
title: Deploy Defender for Containers on Arc-enabled Kubernetes
description: Learn how to enable Microsoft Defender for Containers on Arc-enabled Kubernetes clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on Arc-enabled Kubernetes

This article explains how to enable Microsoft Defender for Containers on your Arc-enabled Kubernetes clusters.

## Prerequisites

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

- Kubernetes cluster already connected to Azure Arc
- Azure CLI with `connectedk8s` and `k8s-configuration` extensions installed
- `cluster-admin` role on the Kubernetes cluster
- Helm 3 installed on your local machine

## Verify Arc connection

Before enabling Defender, verify your cluster is properly connected to Arc:

```azurecli
# List Arc-enabled Kubernetes clusters
az connectedk8s list --resource-group <resource-group> --output table

# Check cluster status
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query "{name:name, state:connectivityStatus, distribution:distribution}"
```

## Enable Defender for Containers

### Using Azure portal

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

3. Select the subscription containing your Arc-enabled clusters.

4. In the Defender plans page, toggle **Containers** to **On**.

5. Select **Settings** and ensure all components are enabled:
   - **Agentless discovery for Kubernetes** - On
   - **Runtime threat protection** - On

6. Select **Save**.

### Using Azure CLI

```azurecli
# Enable Defender for Containers
az security pricing create \
    --name 'Containers' \
    --tier 'Standard'

# Enable extensions
az security pricing extension create \
    --name 'Containers' \
    --pricing-tier 'Standard' \
    --extension-name 'AgentlessDiscoveryForKubernetes' \
    --extension-value '{"isEnabled":"true"}'
```

## Deploy the Defender extension

The Defender extension is automatically deployed through Azure Policy. To manually deploy:

### Using Azure portal

1. Navigate to your Arc-enabled Kubernetes cluster.
2. Select **Extensions** under **Settings**.
3. Select **+ Add**.
4. Search for **Microsoft Defender for Containers**.
5. Select **Create** and follow the wizard.

### Using Azure CLI

```azurecli
# Install the Defender extension
az k8s-extension create \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --extension-type microsoft.azuredefender.kubernetes \
    --configuration-settings \
        logAnalyticsWorkspaceResourceID="<workspace-resource-id>" \
        auditLogPath="/var/log/kube-apiserver/audit.log"
```

### Using Helm (alternative method)

```bash
# Add the Defender Helm repository
helm repo add mdc https://azuredefender.blob.core.windows.net/azuredefender/helm/mdc/
helm repo update

# Install the Defender chart
helm install defender-sensor mdc/azuredefender \
    --namespace kube-system \
    --set credentials.workspaceId=<WORKSPACE_ID> \
    --set credentials.workspaceKey=<WORKSPACE_KEY> \
    --set credentials.domain=<AZURE_DOMAIN>
```

## Deploy Azure Policy for Kubernetes

Azure Policy for Kubernetes provides additional security recommendations:

```azurecli
# Install Azure Policy extension
az k8s-extension create \
    --name azurepolicy \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group> \
    --extension-type Microsoft.PolicyInsights.AzurePolicy
```

## Configure data collection

### Enable audit log collection

For clusters that store audit logs in a custom location:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-config
  namespace: kube-system
data:
  auditLogPath: "/var/log/kubernetes/audit/audit.log"
  collectAuditLogs: "true"
```

### Configure Log Analytics agent

If not using the Azure Monitor agent:

```bash
# Deploy Log Analytics agent
kubectl apply -f https://raw.githubusercontent.com/microsoft/OMS-docker/master/Kubernetes/omsagent-daemonset.yaml

# Configure with your workspace
kubectl create secret generic omsagent-secret \
    --from-literal=WSID=<WORKSPACE_ID> \
    --from-literal=KEY=<WORKSPACE_KEY> \
    -n kube-system
```

## Configure container registry connections

### For on-premises registries

Create a secret for private registry authentication:

```bash
# Create registry secret
kubectl create secret docker-registry regcred \
    --docker-server=<registry-url> \
    --docker-username=<username> \
    --docker-password=<password> \
    --docker-email=<email> \
    -n kube-system

# Patch the Defender service account
kubectl patch serviceaccount microsoft-defender \
    -n kube-system \
    -p '{"imagePullSecrets": [{"name": "regcred"}]}'
```

### Configure registry scanning

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-registry-config
  namespace: kube-system
data:
  registries: |
    - url: "myregistry.local:5000"
      authentication: "basic"
      username: "scanner"
      insecure: false
    - url: "harbor.company.com"
      authentication: "token"
      insecure: false
```

## Configure network policies (if required)

For clusters with strict network policies:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: defender-network-policy
  namespace: kube-system
spec:
  podSelector:
    matchLabels:
      app: microsoft-defender
  policyTypes:
  - Ingress
  - Egress
  egress:
  - to:
    - namespaceSelector: {}
  - to:
    - podSelector: {}
  - ports:
    - protocol: TCP
      port: 443  # HTTPS to Azure
    - protocol: TCP
      port: 80   # HTTP for metadata
```

## Verify deployment

```bash
# Check extension status
az k8s-extension show \
    --name microsoft.azuredefender.kubernetes \
    --cluster-type connectedClusters \
    --cluster-name <cluster-name> \
    --resource-group <resource-group>

# Verify pods are running
kubectl get pods -n kube-system -l app=microsoft-defender

# Check daemonset status
kubectl get daemonset -n kube-system microsoft-defender-sensor
```

## Enable on multiple clusters

For deploying to multiple Arc clusters, use Azure Policy:

1. Create a policy assignment at the subscription or management group level.
2. Use the built-in policy definition: **Deploy Defender for Containers components**.
3. Configure parameters for all clusters.

Or use a script:

```bash
#!/bin/bash
CLUSTERS=("cluster1" "cluster2" "cluster3")
RG="my-resource-group"

for cluster in "${CLUSTERS[@]}"; do
    echo "Enabling Defender on $cluster"
    az k8s-extension create \
        --name microsoft.azuredefender.kubernetes \
        --cluster-type connectedClusters \
        --cluster-name $cluster \
        --resource-group $RG \
        --extension-type microsoft.azuredefender.kubernetes
done
```

## Next steps

- [Verify your Defender for Containers deployment](defender-for-containers-arc-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-arc-configure.md)
- [Troubleshoot common deployment issues](defender-for-containers-troubleshooting.md)