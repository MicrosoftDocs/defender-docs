---
title: Deploy Defender for Containers on Arc-enabled Kubernetes using Azure portal
description: Learn how to enable Microsoft Defender for Containers on Arc-enabled Kubernetes clusters using the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on Arc-enabled Kubernetes using Azure portal

This article explains how to enable Microsoft Defender for Containers on your Arc-enabled Kubernetes clusters using the Azure portal.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional prerequisites for Arc-enabled Kubernetes:
- Kubernetes cluster connected to Azure Arc
- Azure Arc-enabled Kubernetes version 1.19 or later
- Cluster must have outbound connectivity to Azure services

## Connect your Kubernetes cluster to Azure Arc

If your cluster isn't already connected to Azure Arc:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Azure Arc** > **Kubernetes clusters**.

1. Select **Add**.

1. Follow the instructions to:
   - Install the Azure Arc agents
   - Connect your cluster to Azure Arc
   - Verify the connection

For detailed instructions, see [Connect an existing Kubernetes cluster to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Enable the Defender for Containers plan

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant Azure subscription containing your Arc-enabled clusters.

1. On the Defender plans page, toggle the **Containers** plan to **On**.

1. Select **Settings** to configure the plan components.

## Configure plan components

1. In the Settings page, ensure the following components are toggled **On**:
   - **Agentless discovery for Kubernetes**
   - **Agentless container vulnerability assessment** 
   - **Defender DaemonSet**
   - **Azure Policy for Kubernetes**

1. Select **Continue**.

1. Review the changes and select **Save**.

## Deploy extensions to your Arc-enabled clusters

After enabling Defender for Containers, you need to deploy the extensions to your Arc-enabled Kubernetes clusters:

### Deploy using recommendations

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for the recommendation "Azure Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select the recommendation to see affected clusters.

1. Select the clusters you want to protect.

1. Select **Fix** to deploy the extension automatically.

### Deploy manually via Azure portal

1. Navigate to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Extensions**.

1. Select **+ Add**.

1. Search for and select **Microsoft Defender for Containers**.

1. Select **Create** and follow the installation wizard:
   - Review the terms
   - Configure the Log Analytics workspace
   - Complete the installation

1. Repeat the process to add the **Azure Policy for Kubernetes** extension.

## Configure Log Analytics workspace

The Defender extension requires a Log Analytics workspace:

1. During extension installation, select an existing workspace or create a new one.

1. Choose the DefaultWorkspace-[subscription-id]-[region] or a custom workspace.

1. Ensure the workspace is in a [supported region](support-matrix-defender-for-containers.md).

## Enable Azure Policy for Kubernetes

To get security recommendations for your Arc-enabled clusters:

1. In your Arc-enabled cluster, under **Settings**, select **Extensions**.

1. Select **+ Add** and search for **Azure Policy for Kubernetes**.

1. Install the extension following the wizard.

1. After installation, navigate to **Policies** to verify it's enabled.

## Configure diagnostic logs

For optimal security monitoring:

1. Navigate to your Arc-enabled Kubernetes cluster.

1. Under **Settings**, select **Diagnostic settings**.

1. Select **+ Add diagnostic setting**.

1. Configure:
   - Name: Provide a descriptive name
   - Logs: Select all available categories
   - Destination: Send to your Log Analytics workspace

1. Select **Save**.

## Verify deployment

After deployment completes:

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**.

1. Filter by **Resource type** = **Kubernetes services (Azure Arc)**.

1. Verify your Arc-enabled clusters appear with security findings.

1. Check **Recommendations** for Arc-specific security guidance.

For detailed verification steps, see [Verify Defender for Containers deployment on Arc-enabled Kubernetes](defender-for-containers-arc-verify.md).

## Troubleshooting

If extensions fail to install:

1. Check cluster connectivity:
   ```bash
   kubectl get nodes
   az connectedk8s show -n <cluster-name> -g <resource-group>
   ```

2. Verify outbound connectivity to required endpoints.

3. Check extension status:
   ```bash
   az k8s-extension show --name microsoft-defender --cluster-name <cluster-name> --resource-group <resource-group> --cluster-type connectedClusters
   ```

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-arc-configure.md)
- [Enable all Defender for Containers components via portal](defender-for-containers-arc-enable-all-portal.md)
- [Review security recommendations for Arc-enabled clusters](defender-for-containers-introduction.md)