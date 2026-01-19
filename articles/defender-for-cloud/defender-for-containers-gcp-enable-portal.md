---
title: Enable Defender for Containers on GCP (GKE) via portal
description: Learn how to enable Microsoft Defender for Containers on your GKE clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 11/27/2025
ai-usage: ai-assisted
---

# Enable Defender for Containers on GCP (GKE) via portal

This article explains how to enable Microsoft Defender for Containers for Google Kubernetes Engine (GKE) clusters by using the Azure portal.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

### GCP-specific requirements

- A GCP project connected to Microsoft Defender for Cloud. If you haven’t connected your project yet, see [Connect your GCP project to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

- One or more GKE clusters running Kubernetes version 1.19 or later

## 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

1. Select **Next: Select plans**.

1. In **Select plans**, toggle **Containers** to **On**.

1. Select **Configure** to access the plan settings.

1. Toggle **On** the relevant Defender for Containers components:

1. Choose your deployment approach:

   - **Agentless discovery for Kubernetes**  
     Discovers GKE clusters in the connected GCP project.

   - **Agentless container vulnerability assessment**  
     Enables vulnerability assessment for container images stored in Google Container Registry (GCR) and Artifact Registry.

   - **Defender DaemonSet**  
     Deploys the Defender sensor for runtime threat detection on GKE clusters.

   - **Azure Policy for Kubernetes**  
     Enables configuration and posture assessment for Kubernetes clusters and workloads.

1. Select **Continue**.

1. Select **Next: Configure access**.

1. Download the setup script.

1. Open Google Cloud Shell or your local terminal with gcloud configured.

1. Run the setup script to create the required service account and permissions:

   ```bash
   # The portal provides a script similar to this
   bash defender-for-containers-setup.sh \
       --project-id <project-id> \
       --workload-identity-pool <pool-name>
   ```
    The script performs the following actions in your GCP project:
       - Creates a service account and assigns the required IAM roles
       - Configures workload identity federation between GCP and Azure
       - Enables the required Google Cloud APIs

1. Copy the service account email from the script output.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/copy-button.png" alt-text="Screenshot that shows the location of the copy button.":::

1. Return to Azure portal and paste the service account email.

   :::image type="content" source="media/defender-for-kubernetes-intro/configure-access-gcp.png" alt-text="Screenshot showing GCP access configuration." lightbox="media/defender-for-kubernetes-intro/configure-access-gcp.png":::

1. Select **Next: Review and create**.

1. Save?

## Deploy all components

Follow these steps to enable comprehensive protection for all your GKE clusters.

### Connect GKE clusters to Azure Arc

After creating the connector:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Look for the recommendation "GKE clusters should be connected to Azure Arc".

1. Select the recommendation to see affected clusters.

1. Follow the remediation steps to connect each cluster:

   ```bash
   # Connect GKE cluster to Arc
   az connectedk8s connect \
       --name <cluster-name> \
       --resource-group <resource-group> \
       --location <location>
   ```

### Deploy the Defender sensor

[!INCLUDE [Install with Helm note](./includes/helm-install-note.md)]

After connecting your GKE clusters to Azure Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Arc-enabled Kubernetes clusters should have Defender extension installed".

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/recommendation-search.png" alt-text="Screenshot that shows searching for a recommendation." lightbox="media/defender-for-containers-enable-plan-gke/recommendation-search-expanded.png":::

    :::image type="content" source="media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc-gcp.png" alt-text="Screenshot showing sensor enablement for Arc-connected GKE clusters." lightbox="media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc-gcp.png":::

1. Select your GKE clusters.

1. Select **Fix** to deploy the sensor.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/fix-button.png" alt-text="Screenshot that shows the location of the Fix button.":::

> [!NOTE]
> You can also deploy the [Defender sensor by using Helm] (deploy-help.md) for more controlDeploy Defender sensor using Helm.

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure advanced settings](defender-for-containers-gcp-configure.md)
- [Deploy programmatically](defender-for-containers-gcp-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
