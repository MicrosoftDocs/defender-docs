---
title: Enable Defender for Containers on GCP (GKE) via portal
description: Learn how to enable Microsoft Defender for Containers on your GKE clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 01/12/2026
ai-usage: ai-assisted
---

# Enable Defender for Containers on GCP (GKE) via portal

This article shows you how to enable Microsoft Defender for Containers on your Google Kubernetes Engine (GKE) clusters through the Azure portal. You can choose to enable all security features at once for comprehensive protection, or selectively deploy specific components based on your requirements.

## When to use this guide

Use this guide if you want to:

- Set up Defender for Containers on GCP for the first time
- Enable all security features for comprehensive protection
- Selectively deploy specific components
- Fix or add missing components to an existing deployment
- Deploy using a controlled, selective approach
- Exclude certain clusters from protection

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

GCP-specific requirements:

- GCP project with appropriate permissions
- GKE clusters (version 1.19+)
- Container images in Google Container Registry or Artifact Registry
- Service account with required IAM roles
- Cloud Shell or gcloud CLI configured

## Connect your GCP project

Before you enable Defender for Containers, you must connect your GCP project to Microsoft Defender for Cloud.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select **Add environment** > **Google Cloud Platform**.

1. To create a GCP connector and configure the required permissions, see:[Connect your GCP project to Microsoft Defender for Cloud](quickstart-onboard-gcp.md#connect-your-gcp-project)

## Enable Defender for Containers features

1. In **Select plans**, toggle **Containers** to **On**.


1. Select **Settings** to access the plan settings.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/containers-settings-gke.png" alt-text="Screenshot of settings for the Containers plan in the Defender for Cloud environment settings." lightbox="media/defender-for-containers-enable-plan-gke/containers-settings-gke.png":::

1. Choose your deployment approach:
   - **Enable all components** (recommended): Enable all features for comprehensive protection
   - **Enable specific components**: Select only the components you need

   Available components:
   - **Agentless discovery for Kubernetes** - Discovers all GKE clusters
   - **Agentless container vulnerability assessment** - Scans registry images
   - **Defender DaemonSet** - Runtime threat detection
   - **Azure Policy for Kubernetes** - Security recommendations

1. Select **Continue** and **Next: Configure access**.

## Set up GCP permissions

You can use either Google Cloud Shell (recommended) or a local terminal with gcloud configured.

1. Log in to [Google Cloud Console](https://console.cloud.google.com/home/dashboard?project=123456&cloudshell=true).

1. Select the Activate Cloud Shell icon (terminal icon).

Google Cloud Shell opens in a terminal pane at the bottom of the console.

1. Copy the setup script from the portal.

1. Run the setup script to create the required service account and permissions:

   ```bash
   # The portal provides a script similar to this
   bash defender-for-containers-setup.sh \
       --project-id <project-id> \
       --workload-identity-pool <pool-name>
   ```

1. The script creates:
   - Service account with necessary IAM roles
   - Workload identity federation
   - API enablement


1. Select **Next: Review and create**.

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
> You can also deploy the Defender sensor by using Helm for more control. For more information, see [Deploy Defender sensor using Helm](deploy-helm.md).

### Configure container registry scanning

For Google Container Registry (GCR) and Artifact Registry:

1. Go to your GCP connector settings.

1. Select **Configure** next to the Containers plan.

1. Verify **Agentless container vulnerability assessment** is enabled.

1. Images are automatically scanned when you push them to the registry.

### Enable audit logging

Enable GKE audit logging for runtime protection:

```bash
# Enable audit logs for existing cluster
gcloud container clusters update <cluster-name> \
    --zone <zone> \
    --enable-cloud-logging \
    --logging=SYSTEM,WORKLOAD,API_SERVER
```

## Deploy specific components (optional)

If you need selective deployment or to fix issues with existing deployments:

### Deploy Defender sensor to specific clusters

To deploy the sensor to only selected GKE clusters:

1. Connect only specific clusters to Azure Arc (not all clusters).

1. Go to **Recommendations** and find "Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for the selected clusters.

### Enable vulnerability scanning only

To enable only registry scanning without runtime protection:

1. In connector configuration, enable only **Agentless container vulnerability assessment**.

1. Disable other components.

1. Save the configuration.

### Configure by cluster type

#### Standard GKE clusters

No special configuration is required. Follow the default deployment steps.

#### GKE Autopilot

For Autopilot clusters:

1. The Defender sensor automatically adjusts resource requests.

1. No manual configuration is needed for resource limits.

#### Private GKE clusters

For private clusters:

1. Ensure the cluster can reach Azure endpoints.

1. Configure firewall rules if needed:

   ```bash
   gcloud compute firewall-rules create allow-azure-defender \
       --allow tcp:443 \
       --source-ranges <cluster-cidr> \
       --target-tags <node-tags>
   ```

### Configure exclusions

To exclude specific GKE clusters from automatic provisioning:

1. Go to your GKE cluster in GCP Console.

1. Add labels to the cluster:
   - For Defender sensor: `ms_defender_container_exclude_agents` = `true`  
   - For agentless deployment: `ms_defender_container_exclude_agentless` = `true`

> [!NOTE]
> For Arc-connected clusters, you can also use Azure tags:
>
> - `ms_defender_container_exclude_sensors` = `true`
> - `ms_defender_container_exclude_azurepolicy` = `true`


## Disable Defender for Containers

To disable Defender for Containers, follow these steps:

1. Go to **Environment settings**.

1. Select your GCP connector.

1. Choose one of the following options:
   - Set **Containers** to **Off** to disable the plan.
   - Delete the entire connector to remove all configurations.

1. Clean up GCP resources:

   ```bash
   # Delete service account
   gcloud iam service-accounts delete <service-account-email>
   
   # Disconnect clusters from Arc
   az connectedk8s delete --name <cluster-name> --resource-group <rg>
   ```

## Next steps

- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure advanced settings](defender-for-containers-gcp-configure.md)
- [Deploy programmatically](defender-for-containers-gcp-enable-programmatically.md)
- [Configure sensor deployed with Helm](deploy-helm.md)
