---
title: Deploy Defender for Containers on GCP (GKE) using Azure portal
description: Learn how to enable Microsoft Defender for Containers on Google Kubernetes Engine (GKE) clusters using the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on GCP (GKE) using Azure portal

This article explains how to enable Microsoft Defender for Containers on your Google Kubernetes Engine (GKE) clusters using the Azure portal.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

Additional prerequisites for GKE:

- GCP project with billing enabled
- Active GKE clusters (version 1.19+)
- GCP IAM permissions to create service accounts and assign roles
- gcloud CLI configured with appropriate credentials

## Create a GCP connector

First, connect your GCP project to Microsoft Defender for Cloud:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Add environment** > **Google Cloud Platform**.

    :::image type="content" source="media/defender-for-kubernetes-intro/add-gcp-environment.png" alt-text="Screenshot of selections for adding a GCP environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/add-gcp-environment.png":::

## Configure the GCP connector

1. In the connector creation wizard, provide:
   - **Connector name**: A friendly name for your GCP project
   - **Subscription**: Select the Azure subscription for billing
   - **Resource group**: Select or create a resource group
   - **Location**: Choose the Azure region for the connector
   - **GCP project ID**: Your GCP project ID
   - **GCP project number**: Your GCP project number

    :::image type="content" source="media/defender-for-kubernetes-intro/add-gcp-account-details.png" alt-text="Screenshot of the form to fill in the account details for a GCP environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/add-gcp-account-details.png":::

1. Select **Next: Select plans**.

## Enable Defender for Containers plan

1. In the Select plans page, toggle **Containers** to **On**.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/containers-on.png" alt-text="Screenshot that shows the Containers plan turned on.":::

1. Select **Configure** to set up plan components.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/containers-settings-gke.png" alt-text="Screenshot of settings for the Containers plan in the Defender for Cloud environment settings." lightbox="media/defender-for-containers-enable-plan-gke/containers-settings-gke.png":::

1. Ensure all components are enabled:
   - **Agentless threat detection** - Runtime threat detection
   - **Auto provision Defender's sensor for Azure Arc** - Deploys the Defender sensor
   - **Auto provision Azure Policy extension for Azure Arc** - Deploys Azure Policy
   - **K8S API access** - Discovers all GKE clusters
   - **Registry access** - Scans GCR/Artifact Registry

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/container-components-on.png" alt-text="Screenshot that shows turning on components." lightbox="media/defender-for-containers-enable-plan-gke/container-components-on.png":::

1. Select **Next: Configure access**.

## Configure GCP permissions

1. The portal provides scripts to create required service accounts and permissions.

1. Select **Copy** to copy the setup script.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/copy-button.png" alt-text="Screenshot that shows the location of the copy button.":::

1. Select **GCP Cloud Shell >** button to open Cloud Shell.

    :::image type="content" source="media/defender-for-kubernetes-intro/configure-access-gcp.png" alt-text="Screenshot of the page for configuring access for a GCP environment in Microsoft Defender for Cloud." lightbox="media/defender-for-kubernetes-intro/configure-access-gcp.png":::

1. Paste and run the script in Cloud Shell. It will:
   - Create service accounts
   - Assign required IAM roles
   - Generate and download a key file

1. Upload the generated key file:
   - Download the JSON key file from Cloud Shell
   - In Azure portal, select **Upload key file**
   - Browse and select the downloaded JSON key

1. Select **Next: Review and create**.

## Complete connector creation

1. Review your configuration:
   - Connector details
   - Enabled plans
   - GCP permissions

1. Select **Create**.

1. Wait for the connector creation to complete (5-10 minutes).

## Deploy the Defender sensor to GKE clusters

### Automatic deployment

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "GKE clusters should have Microsoft Defender's extension for Azure Arc installed".

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/recommendation-search.png" alt-text="Screenshot that shows searching for a recommendation." lightbox="media/defender-for-containers-enable-plan-gke/recommendation-search-expanded.png":::

1. Select the recommendation.

1. Select your unhealthy GKE clusters (one at a time).

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/fix-button.png" alt-text="Screenshot that shows the location of the Fix button.":::

1. Select **Fix**.

1. Choose the script language:
   - For Linux: Select **Bash**
   - For Windows: Select **PowerShell**

1. Select **Download remediation logic**.

1. Run the generated script on each of your GKE clusters.

### Deploy to specific clusters

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for the recommendation **GKE clusters should have Microsoft Defender's extension for Azure Arc installed**.

    :::image type="content" source="media/tutorial-enable-containers-gcp/recommendation-search.png" alt-text="Screenshot of the recommendations page that shows where to search for and find the Google Kubernetes service cluster recommendation is located." lightbox="media/tutorial-enable-containers-gcp/recommendation-search.png":::

    :::image type="content" source="media/defender-for-kubernetes-azure-arc/extension-recommendation.png" alt-text="Microsoft Defender for Cloud's recommendation for deploying the Defender sensor for Azure Arc-enabled Kubernetes clusters." lightbox="media/defender-for-kubernetes-azure-arc/extension-recommendation.png":::

1. Select the recommendation to view affected clusters.

1. Select the clusters where you want to deploy the sensor.

    > [!NOTE]
    > Select the clusters by clicking anywhere in the row except the cluster name hyperlink.

1. Select **Fix** to automatically deploy the extension.

    :::image type="content" source="media/defender-for-kubernetes-azure-arc/security-center-deploy-extension.gif" alt-text="Deploy Defender sensor for Azure Arc-enabled clusters using Defender for Cloud's 'Fix' option.":::

### View connected clusters

After successful deployment:

1. Navigate to **Environment settings**.

1. Select your GCP connector.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/relevant-connector.png" alt-text="Screenshot that shows an example GCP connector." lightbox="media/defender-for-containers-enable-plan-gke/relevant-connector-expanded.png":::

1. Verify the Containers plan shows as **On** with components enabled.

## Configure GCR/Artifact Registry scanning

To enable container image vulnerability scanning:

1. Ensure **Registry access** is enabled in your connector settings.

1. If using Artifact Registry, enable vulnerability scanning in GCP:

   ```bash
   # Enable vulnerability scanning
   gcloud artifacts repositories update REPOSITORY \
       --location=LOCATION \
       --enable-vulnerability-scanning
   ```

1. Container images will be automatically scanned for vulnerabilities.

## Enable Workload Identity (recommended)

For enhanced security, configure Workload Identity:

1. Enable Workload Identity on your GKE cluster:

   ```bash
   gcloud container clusters update CLUSTER_NAME \
       --workload-pool=PROJECT_ID.svc.id.goog
   ```

1. Configure the Defender sensor to use Workload Identity.

1. This eliminates the need for service account keys.

## Configure audit logging

Enable GKE audit logging for comprehensive monitoring:

1. In GCP Console, navigate to your GKE cluster.

1. Select **Edit**.

1. Under **Security**, enable **Cloud Logging**.

1. Select these log types:
   - System logs
   - Workload logs
   - Audit logs

1. Save the changes.

## Verify deployment

After deployment completes:

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**.

1. Filter by **Resource type** = **Kubernetes service (GKE)**.

1. Verify your GKE clusters appear with security data.

For detailed verification, see [Verify Defender for Containers deployment on GCP (GKE)](defender-for-containers-gcp-verify.md).

## View security alerts

To view alerts from your GKE clusters:

1. Navigate to **Security alerts**.

1. Select **Add filter**.

    :::image type="icon" source="media/defender-for-containers-enable-plan-gke/add-filter.png" border="false":::

1. Select **Resource type** > **GCP GKE Cluster**.

1. Select **Ok**.

## Monitor security status

1. Navigate to **Workload protections** > **Containers**.

1. The dashboard displays:
   - Vulnerable images in GCR/Artifact Registry
   - Runtime alerts from GKE clusters
   - Compliance with GCP security benchmarks
   - Kubernetes configuration issues

## Configure Binary Authorization (optional)

For additional security, enable Binary Authorization:

1. In GCP Console, enable the Binary Authorization API.

1. Create attestors and policies.

1. Configure Defender to monitor Binary Authorization violations.

## Exclude specific clusters (optional)

You can exclude specific GCP clusters from automatic provisioning:

- For sensor deployment: Apply the `ms_defender_container_exclude_agents` label with value `true`
- For agentless deployment: Apply the `ms_defender_container_exclude_agentless` label with value `true`

## Troubleshooting

If clusters don't appear:

1. Verify the service account has correct permissions:

   ```bash
   gcloud projects get-iam-policy PROJECT_ID
   ```

2. Check GKE cluster connectivity.

3. Ensure the connector shows as **Connected**.

4. Review audit logs in GCP for permission errors.

## Next steps

- [Deploy components programmatically](defender-for-containers-gcp-deploy.md)
- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
