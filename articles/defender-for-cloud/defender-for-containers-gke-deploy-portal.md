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

    :::image type="content" source="media/tutorial-enable-container-gcp/add-gcp-environment.png" alt-text="Screenshot showing Add GCP environment option." lightbox="media/tutorial-enable-container-gcp/add-gcp-environment.png":::

## Configure the GCP connector

1. In the connector creation wizard, provide:
   - **Connector name**: A friendly name for your GCP project
   - **Subscription**: Select the Azure subscription for billing
   - **Resource group**: Select or create a resource group
   - **Location**: Choose the Azure region for the connector
   - **GCP project ID**: Your GCP project ID
   - **GCP project number**: Your GCP project number

    :::image type="content" source="media/tutorial-enable-container-gcp/gcp-connector-basics.png" alt-text="Screenshot showing GCP connector basic configuration." lightbox="media/tutorial-enable-container-gcp/gcp-connector-basics.png":::

1. Select **Next: Select plans**.

## Enable Defender for Containers plan

1. In the Select plans page, toggle **Containers** to **On**.

    :::image type="content" source="media/tutorial-enable-container-gcp/enable-containers-plan-gcp.png" alt-text="Screenshot showing Containers plan enabled for GCP." lightbox="media/tutorial-enable-container-gcp/enable-containers-plan-gcp.png":::

1. Select **Configure** to set up plan components.

1. Ensure all components are enabled:
   - **GKE runtime protection** - Runtime threat detection
   - **Agentless discovery for Kubernetes** - Discovers all GKE clusters
   - **Agentless container vulnerability assessment** - Scans GCR/Artifact Registry

1. Select **Next: Configure access**.

## Configure GCP permissions

1. The portal provides scripts to create required service accounts and permissions.

1. Select **Copy** to copy the setup script.

    :::image type="content" source="media/tutorial-enable-container-gcp/gcp-setup-script.png" alt-text="Screenshot showing GCP setup script." lightbox="media/tutorial-enable-container-gcp/gcp-setup-script.png":::

1. Open Google Cloud Shell or your local terminal with gcloud CLI.

1. Run the copied script. It will:
   - Create a service account for Defender
   - Assign required IAM roles
   - Generate and download a key file

1. Upload the generated key file:
   - Select **Upload key file**
   - Browse to the downloaded JSON key
   - Select the file

1. Select **Next: Review and create**.

## Complete connector creation

1. Review your configuration:
   - Connector details
   - Enabled plans
   - GCP permissions

1. Select **Create**.

1. Wait for the connector creation to complete (5-10 minutes).

    :::image type="content" source="media/tutorial-enable-container-gcp/connector-created.png" alt-text="Screenshot showing successful GCP connector creation." lightbox="media/tutorial-enable-container-gcp/connector-created.png":::

## Deploy the Defender sensor to GKE clusters

### Automatic deployment

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "GKE clusters should have Defender profile enabled".

1. Select the recommendation.

1. Select your GKE clusters and choose **Fix**.

### Manual deployment via portal

1. Navigate to your GCP connector in **Environment settings**.

1. Select **Manage** > **GKE clusters**.

1. View the list of discovered GKE clusters.

    :::image type="content" source="media/tutorial-enable-container-gcp/gke-clusters-list.png" alt-text="Screenshot showing discovered GKE clusters." lightbox="media/tutorial-enable-container-gcp/gke-clusters-list.png":::

1. For each cluster, select **Deploy Defender sensor**.

1. Choose your deployment method:
   - **Helm** (recommended)
   - **kubectl apply**

1. Follow the provided instructions to deploy to your cluster.

## Configure GCR/Artifact Registry scanning

To enable container image vulnerability scanning:

1. In your GCP connector settings, navigate to **Container registries**.

1. Verify that GCR/Artifact Registry integration is enabled.

1. If using Artifact Registry:
   ```bash
   # Enable vulnerability scanning in GCP
   gcloud artifacts repositories update REPOSITORY \
       --location=LOCATION \
       --enable-vulnerability-scanning
   ```

1. Container images will be automatically scanned for vulnerabilities.

## Enable Workload Identity (recommended)

For enhanced security, configure Workload Identity:

1. In your GKE cluster (GCP Console), ensure Workload Identity is enabled.

1. In the Defender sensor deployment, use the Workload Identity option.

1. This provides better security than using service account keys.

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

    :::image type="content" source="media/tutorial-enable-container-gcp/gke-inventory.png" alt-text="Screenshot showing GKE clusters in inventory." lightbox="media/tutorial-enable-container-gcp/gke-inventory.png":::

For detailed verification, see [Verify Defender for Containers deployment on GCP (GKE)](defender-for-containers-gke-verify.md).

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

- [Configure Defender for Containers settings](defender-for-containers-gke-configure.md)
- [Enable all Defender for Containers components via portal](defender-for-containers-gke-enable-all-portal.md)
- [Review GKE security best practices](container-security.md)