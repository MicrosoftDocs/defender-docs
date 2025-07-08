---
title: Enable all Defender for Containers components on GCP (GKE) via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Google Kubernetes Engine (GKE) clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on GCP (GKE) via portal

This article walks you through enabling comprehensive Microsoft Defender for Containers protection for your Google Kubernetes Engine (GKE) clusters. You'll set up vulnerability scanning, runtime protection, and compliance monitoring across your GCP environment.

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

GCP-specific requirements:

- GCP project with Owner or Security Admin role
- Active GKE clusters (version 1.19+)
- Container images in GCR or Artifact Registry
- gcloud CLI installed and configured
- APIs enabled: Kubernetes Engine, Container Registry, Cloud Asset

## Sign in to Azure

Sign in to the [Azure portal](https://portal.azure.com).

## Prepare your GCP project

Before creating the connector, ensure required APIs are enabled:

```bash
# Enable required APIs
gcloud services enable container.googleapis.com
gcloud services enable containerregistry.googleapis.com
gcloud services enable cloudasset.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
```

## Create GCP connector

1. Navigate to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select **Add environment** > **Google Cloud Platform**.

## Configure connector details

1. In the **Basics** tab, provide:
   - **Connector name**: A descriptive name (e.g., "Production-GCP")
   - **Subscription**: Your Azure subscription for billing
   - **Resource group**: Create or select a resource group
   - **Location**: Your preferred Azure region
   - **GCP project ID**: Your GCP project identifier
   - **GCP project number**: The numeric project ID

1. Select **Next: Select plans**.

## Enable all Defender for Containers features

1. In the **Select plans** page, toggle **Containers** to **On**.

    :::image type="content" source="media/tutorial-enable-containers-gcp/containers-enabled-gcp.png" alt-text="Screenshot showing Containers plan enabled." lightbox="media/tutorial-enable-containers-gcp/containers-enabled-gcp.png":::

1. Select **Settings** to configure the plan components.

    :::image type="content" source="media/tutorial-enable-containers-gcp/containers-settings-gcp.png" alt-text="Screenshot of Defender for Cloud's environment settings page showing the settings for the Containers plan." lightbox="media/tutorial-enable-containers-gcp/containers-settings-gcp.png":::

1. Enable all components:
   - **Agentless threat protection** - Real-time threat detection
   - **Auto provision Defender's sensor for Azure Arc** - Deploys the Defender sensor
   - **Auto provision Azure Policy extension for Azure Arc** - Deploys Azure Policy
   - **K8S API access** - Automatic cluster discovery
   - **Registry access** - Container image vulnerability scanning

1. Select **Continue** and **Next: Configure access**.

## Set up GCP permissions

1. The portal generates a setup script for GCP permissions.

1. Select **Copy** to copy the entire script.

    :::image type="content" source="media/tutorial-enable-containers-gcp/copy-button.png" alt-text="Screenshot showing the location of the copy button.":::

1. Select **GCP Cloud Shell** to open Cloud Shell.

1. Paste and run the script. It will:

   ```bash
   # Example of what the script does:
   # Creates service account
   gcloud iam service-accounts create microsoft-defender-containers \
       --display-name="Microsoft Defender for Containers"
   
   # Assigns required roles
   gcloud projects add-iam-policy-binding PROJECT_ID \
       --member="serviceAccount:microsoft-defender-containers@PROJECT_ID.iam.gserviceaccount.com" \
       --role="roles/container.viewer"
   
   # Creates and downloads key
   gcloud iam service-accounts keys create defender-key.json \
       --iam-account=microsoft-defender-containers@PROJECT_ID.iam.gserviceaccount.com
   ```

1. Download the generated `defender-key.json` file.

1. Return to Azure portal and select **Upload key file**.

1. Browse and select the downloaded JSON key.

1. Select **Next: Review and create**.

## Create the connector

1. Review all settings:
   - Connector configuration
   - Enabled security plans
   - GCP permissions

1. Select **Create**.

1. Wait for deployment to complete (5-10 minutes).

## Deploy Defender sensor to all GKE clusters

1. After connector creation, navigate to **Recommendations**.

1. Search for "GKE clusters should have Microsoft Defender's extension for Azure Arc installed".

    :::image type="content" source="media/tutorial-enable-containers-gcp/relevant-connector.png" alt-text="Screenshot showing how to select the relevant connector." lightbox="media/tutorial-enable-containers-gcp/relevant-connector.png":::

1. Select the recommendation.

1. Select **all** your GKE clusters.

    > [!IMPORTANT]
    > You must select the clusters one at a time.
    >
    > Don't select the clusters by their hyperlinked names: select anywhere else in the relevant row.

1. Select **Fix** to deploy the sensor automatically.

    :::image type="content" source="media/tutorial-enable-containers-gcp/fix-button.png" alt-text="Screenshot showing the location of the fix button.":::

1. Defender for Cloud generates a script in the language of your choice:
    - For Linux, select **Bash**
    - For Windows, select **PowerShell**

1. Select **Download remediation logic**.

1. Run the generated script on your clusters.

## Connect GKE clusters to Azure Arc

After creating the connector, you need to connect your GKE clusters to Azure Arc:

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for the recommendation **GKE clusters should be connected to Azure Arc**.

    :::image type="content" source="media/tutorial-enable-containers-gcp/recommendation-search.png" alt-text="Screenshot of the recommendations page that shows where to search for and find the Google Kubernetes service cluster recommendation is located." lightbox="media/tutorial-enable-containers-gcp/recommendation-search.png":::

1. Select the recommendation.

1. Select **Fix**.

    :::image type="content" source="media/tutorial-enable-containers-gcp/affected-fix.png" alt-text="Screenshot of the recommendation with the affected resources selected that shows you how to select the fix button." lightbox="media/tutorial-enable-containers-gcp/affected-fix.png":::

1. Follow any additional prompts to complete the connection.

## Configure container registry scanning

### For Google Container Registry (GCR)

1. Navigate to your GCP connector settings.

1. Select **Container registries**.

1. Verify GCR integration is enabled.

1. Images pushed to GCR are automatically scanned.

### For Artifact Registry

1. In GCP Console, enable vulnerability scanning:

   ```bash
   gcloud artifacts repositories list
   
   # For each repository:
   gcloud artifacts repositories update REPOSITORY \
       --location=LOCATION \
       --enable-vulnerability-scanning
   ```

1. Scanning results appear in Defender for Cloud within hours.

## Enable comprehensive audit logging

1. Navigate to each GKE cluster in GCP Console.

1. Select **Edit** cluster.

1. Under **Features**, enable:
   - Cloud Operations for GKE
   - System and workload logging
   - Audit logging

1. Save changes for each cluster.

## Configure Workload Identity (recommended)

For production clusters, use Workload Identity:

1. Enable on your GKE cluster:

   ```bash
   gcloud container clusters update CLUSTER_NAME \
       --workload-pool=PROJECT_ID.svc.id.goog
   ```

1. Configure the Defender sensor to use Workload Identity.

1. This eliminates the need for key files in production.

## Verify comprehensive deployment

### Check connector health

1. Navigate to **Environment settings**.

1. Select your GCP connector.

    :::image type="content" source="media/tutorial-enable-containers-gcp/relevant-connector.png" alt-text="Screenshot showing an example GCP connector." lightbox="media/tutorial-enable-containers-gcp/relevant-connector-expanded.png":::

1. Verify:
   - Status: **Connected**
   - Last sync: Recent timestamp
   - Discovered resources count

### View discovered resources

1. Navigate to **Inventory**.

1. Filter by **Environment** = **GCP**.

1. Verify you see:
   - All GKE clusters
   - Container registries
   - Container images

### Check security coverage

1. Navigate to **Workload protections** > **Containers**.

1. The dashboard shows:
   - GKE clusters with protection status
   - Vulnerable images by severity
   - Recent security alerts
   - Compliance scores

## Test the deployment

1. Connect to a GKE cluster:

   ```bash
   gcloud container clusters get-credentials CLUSTER_NAME --region REGION
   ```

2. Trigger a test alert:

   ```bash
   kubectl run test-alert --image=nginx --rm -it --restart=Never -- sh -c "echo test > /etc/passwd"
   ```

3. Check for the alert in Defender for Cloud within 5-10 minutes.

## Review security insights

### Vulnerability findings

1. Navigate to **Recommendations**.

1. Select "Container registry images should have vulnerability findings resolved".

1. Review vulnerable images and their CVEs.

### Runtime alerts

1. Navigate to **Security alerts**.

1. Filter by **Resource type** = **Kubernetes service**.

1. Investigate any alerts from your GKE clusters.

### Compliance status

1. Navigate to **Regulatory compliance**.

1. Select **CIS Kubernetes Benchmark**.

1. Review compliance status for your GKE clusters.

## Set up alert notifications

1. Navigate to **Environment settings**.

1. Select **Email notifications**.

1. Configure:
   - Recipients for security alerts
   - Alert severity thresholds
   - Notification frequency

1. Save settings.

## Best practices

1. **Regular reviews**: Check the Containers dashboard weekly.

1. **Alert response**: Investigate high-severity alerts immediately.

1. **Image scanning**: Scan images before deploying to GKE.

1. **Compliance**: Address CIS benchmark failures promptly.

1. **Updates**: Keep GKE clusters and nodes updated.

## Clean up resources

To disable Defender for Containers:

1. Navigate to your GCP connector.

1. Either:
   - Toggle **Containers** to **Off**
   - Delete the entire connector

1. In GCP, optionally:
   - Delete the service account
   - Remove IAM bindings
   - Disable APIs

## Next steps

- [Configure Defender for Containers settings](defender-for-containers-gcp-configure.md)
- [Verify deployment](defender-for-containers-gcp-verify.md)
- [Deploy components programmatically](defender-for-containers-gcp-deploy.md) - For automation scenarios
