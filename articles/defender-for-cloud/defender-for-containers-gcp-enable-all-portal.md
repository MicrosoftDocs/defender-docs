---
title: Enable all Defender for Containers components on GCP (GKE) via portal
description: Learn how to enable all Microsoft Defender for Containers components on your Google Kubernetes Engine (GKE) clusters through the Azure portal.
ms.topic: how-to
ms.date: 06/04/2025
---

# Enable all Defender for Containers components on GCP (GKE) via portal

This article shows you how to enable comprehensive Microsoft Defender for Containers protection for your Google Kubernetes Engine (GKE) clusters. You set up vulnerability scanning, runtime protection, and compliance monitoring across your GCP environment.

## Article contents

- [Prerequisites](#prerequisites)
- [Create GCP connector](#create-gcp-connector)
- [Configure connector details](#configure-connector-details)
- [Enable Defender features](#enable-all-defender-for-containers-features)
- [Deploy workload identity](#deploy-workload-identity)
- [Connect GKE clusters](#connect-gke-clusters-to-azure-arc)
- [Deploy Defender sensor](#deploy-the-defender-sensor)
- [Enable audit logging](#enable-comprehensive-audit-logging)
- [Configure container registry scanning](#configure-container-registry-scanning)  
- [Verify deployment](#verify-comprehensive-deployment)
- [Monitor ongoing security](#monitor-ongoing-security)

> [!NOTE]
> This guide provides complete setup for new deployments. If you already have Defender for Containers enabled and need to fix or add components, see [Deploy specific components](defender-for-containers-gcp-deploy-portal.md).

## When to use this guide

Use this guide if you want to:

- Set up Defender for Containers on GKE for the first time
- Get comprehensive protection for all your GKE clusters
- Get vulnerability scanning for GCR and Artifact Registry
- Get a guided, visual deployment experience

For selective deployment or troubleshooting existing deployments, see [Deploy specific Defender for Containers components on GCP (GKE)](defender-for-containers-gcp-deploy-portal.md).

## Prerequisites

[!INCLUDE[defender-for-container-prerequisites-arc-eks-gke](includes/defender-for-container-prerequisites-arc-eks-gke.md)]

GCP-specific requirements:

- GCP project with Owner or Security Admin role
- Active GKE clusters (version 1.19+)
- Container images in GCR or Artifact Registry
- gcloud CLI installed and configured
- APIs enabled: Kubernetes Engine, Container Registry, Cloud Asset

## Prepare your GCP project

Before creating the connector, make sure you enable the required APIs:

```bash
# Enable required APIs
gcloud services enable container.googleapis.com
gcloud services enable containerregistry.googleapis.com
gcloud services enable cloudasset.googleapis.com
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable logging.googleapis.com
```

## Create GCP connector

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select **Add environment** > **Google Cloud Platform**.

## Configure connector details

1. In the **Basics** tab, enter:
   - **Connector name**: A descriptive name (for example, "Production-GCP")
   - **Subscription**: Your Azure subscription for billing
   - **Resource group**: Create or select a resource group
   - **Location**: Your preferred Azure region
   - **GCP project ID**: Your GCP project identifier
   - **GCP project number**: The numeric project ID

1. Select **Next: Select plans**.

## Enable all Defender for Containers features

1. In the **Select plans** page, toggle **Containers** to **On**.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/containers-on.png" alt-text="Screenshot showing Containers plan enabled.":::

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

1. Paste and run the script. It:

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

1. Downloads the generated `defender-key.json` file.

1. Returns to Azure portal and select **Upload key file**.

1. Browses and selects the downloaded JSON key.

1. Selects **Next: Review and create**.

## Create the connector

1. Review all settings:
   - Connector configuration
   - Enabled security plans
   - GCP permissions

1. Select **Create**.

1. Wait for deployment to complete (5-10 minutes).

## Connect GKE clusters to Azure Arc

After creating the connector, connect your GKE clusters to Azure Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for the recommendation **GKE clusters should be connected to Azure Arc**.

    :::image type="content" source="media/tutorial-enable-containers-gcp/recommendation-search.png" alt-text="Screenshot of the recommendations page that shows where to search for and find the Google Kubernetes service cluster recommendation is located." lightbox="media/tutorial-enable-containers-gcp/recommendation-search.png":::

1. Select the recommendation.

1. Select the affected GKE clusters.

1. Select **Fix** to generate connection scripts.

1. Download and run the script on each cluster:

   ```bash
   # Example generated script
   gcloud container clusters get-credentials CLUSTER_NAME --zone ZONE
   az connectedk8s connect --name CLUSTER_NAME --resource-group RG_NAME
   ```

## Deploy the Defender sensor

After connecting your GKE clusters to Azure Arc, deploy the Defender sensor for runtime protection:

### Deploy to all GKE clusters

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "GKE clusters should have Microsoft Defender's extension for Azure Arc installed".

    :::image type="content" source="media/tutorial-enable-containers-gcp/relevant-connector.png" alt-text="Screenshot showing how to select the relevant connector." lightbox="media/tutorial-enable-containers-gcp/relevant-connector.png":::

1. Select the recommendation.

1. Select **all** your GKE clusters.

    > [!IMPORTANT]
    > Select clusters one at a time by clicking anywhere in the row except the hyperlinked name.

1. Select **Fix** to deploy the sensor automatically.

    :::image type="content" source="media/defender-for-containers-enable-plan-gke/fix-button.png" alt-text="Screenshot showing the Fix button for deploying the Defender sensor.":::

1. Configure sensor deployment settings:
   - Log Analytics workspace
   - Resource limits
   - Namespace exclusions

1. Download and run the generated remediation script if prompted.

### Deploy to specific clusters

1. Go to your Arc-enabled GKE cluster in the Azure portal.

1. Select **Extensions** > **+ Add**.

1. Search for **Microsoft Defender for Containers**.

1. Select it and configure:
   - Workspace settings
   - Resource allocation
   - Monitoring scope

1. Select **Review + create** > **Create**.

### Verify sensor deployment

```bash
# Check sensor status
kubectl get pods -n kube-system -l app=microsoft-defender

# View DaemonSet
kubectl get daemonset -n kube-system microsoft-defender-sensor

# Check logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=50
```

The sensor runs on all nodes within 5-10 minutes.

## Configure container registry scanning

### For Google Container Registry (GCR)

1. Go to your GCP connector settings.

1. Select **Container registries**.

1. Verify that GCR integration is enabled.

1. Images you push to GCR are automatically scanned.

### For Artifact Registry

1. In GCP Console, enable vulnerability scanning:

   ```bash
   gcloud artifacts repositories list
   
   # For each repository:
   gcloud artifacts repositories update REPOSITORY \
       --location=LOCATION \
       --enable-vulnerability-scanning
   ```

1. Grant scanner permissions:

   ```bash
   gcloud artifacts repositories add-iam-policy-binding REPOSITORY \
       --location=LOCATION \
       --member="serviceAccount:microsoft-defender-containers@PROJECT_ID.iam.gserviceaccount.com" \
       --role="roles/artifactregistry.reader"
   ```

## Enable comprehensive audit logging

1. Go to each GKE cluster in GCP Console.

1. Select **Edit** cluster.

1. Under **Features**, enable:
   - Cloud Operations for GKE
   - System and workload logging
   - Audit logging

1. Apply to all clusters:

   ```bash
   for cluster in $(gcloud container clusters list --format="value(name,zone)"); do
     name=$(echo $cluster | cut -d' ' -f1)
     zone=$(echo $cluster | cut -d' ' -f2)
     gcloud container clusters update $name --zone $zone \
       --enable-cloud-logging \
       --logging=SYSTEM,WORKLOAD,API_SERVER
   done
   ```

## Deploy workload identity

For production clusters, use Workload Identity:

1. Enable on your GKE cluster:

   ```bash
   gcloud container clusters update CLUSTER_NAME \
       --workload-pool=PROJECT_ID.svc.id.goog
   ```

1. Configure service account binding:

   ```bash
   kubectl annotate serviceaccount defender-sensor -n kube-system \
       iam.gke.io/gcp-service-account=microsoft-defender-containers@PROJECT_ID.iam.gserviceaccount.com
   
   gcloud iam service-accounts add-iam-policy-binding \
       microsoft-defender-containers@PROJECT_ID.iam.gserviceaccount.com \
       --role roles/iam.workloadIdentityUser \
       --member "serviceAccount:PROJECT_ID.svc.id.goog[kube-system/defender-sensor]"
   ```

## Verify comprehensive deployment

### Check connector health

1. Go to **Environment settings**.

1. Select your GCP connector.

    :::image type="content" source="media/tutorial-enable-containers-gcp/relevant-connector.png" alt-text="Screenshot showing an example GCP connector." lightbox="media/tutorial-enable-containers-gcp/relevant-connector-expanded.png":::

1. Verify:
   - Status: **Connected**
   - Last sync: Recent timestamp
   - Discovered resources count

### View discovered resources

1. Go to **Inventory**.

1. Filter by **Environment** = **GCP**.

1. Verify you see:
   - All GKE clusters
   - Container registries
   - Container images

### Check security coverage

1. Go to **Workload protections** > **Containers**.

1. Review the dashboard that shows:
   - GKE clusters with protection status
   - Vulnerable images by severity
   - Recent security alerts
   - Compliance scores

## Test the deployment

1. Connect to a GKE cluster:

   ```bash
   gcloud container clusters get-credentials CLUSTER_NAME --region REGION
   ```

1. Trigger a test alert:

   ```bash
   kubectl run test-alert --image=nginx --rm -it --restart=Never -- sh -c "echo test > /etc/passwd"
   ```

1. Check for the alert in Defender for Cloud within 5-10 minutes.

## Monitor ongoing security

### Security dashboard

1. Go to **Workload protections** > **Containers**.

1. Monitor:
   - **Vulnerability trends**: Track image vulnerabilities over time.
   - **Alert patterns**: Identify recurring security issues.
   - **Compliance scores**: Monitor CIS GKE Benchmark compliance.
   - **Coverage gaps**: Identify unprotected clusters.

### Configure notifications

1. Go to **Environment settings**.

1. Select **Email notifications**.

1. Configure:
   - Recipients for security alerts.
   - Alert severity thresholds.
   - Weekly summary reports.

### Review recommendations

1. Go to **Recommendations**.

1. Filter by **Resource type** = **Kubernetes service**.

1. Priority recommendations:
   - Enable Binary Authorization
   - Implement Pod Security Standards
   - Configure Workload Identity
   - Enable private GKE clusters

## Best practices

1. **Regular reviews**: Check the Containers dashboard weekly
1. **Alert response**: Investigate high-severity alerts within 4 hours
1. **Image hygiene**: Scan and update base images monthly
1. **Compliance**: Address CIS benchmark failures quarterly
1. **Access control**: Review RBAC permissions regularly

## Advanced configuration

### Enable Binary Authorization

1. Create an attestor:

   ```bash
   gcloud container binauthz attestors create prod-attestor \
       --attestation-authority-note=prod-images \
       --attestation-authority-note-project=PROJECT_ID
   ```

1. Configure cluster policy to require attestation.

### Configure Pod Security Standards

1. Apply security policies to namespaces:

   ```bash
   kubectl label namespace production \
       pod-security.kubernetes.io/enforce=restricted
   ```

## Troubleshooting

If components fail to deploy:

1. **Check Arc connection**: Ensure clusters show as Connected.
1. **Verify permissions**: Confirm service account has all required roles.
1. **Review quotas**: Check GCP quotas for compute and API usage.
1. **Network connectivity**: Verify outbound HTTPS to Azure endpoints.

## Clean up resources

To disable Defender for Containers:

1. Go to your GCP connector.

1. Choose either:
   - Toggle **Containers** to **Off**.
   - Delete the entire connector.

1. Remove GCP resources:

   ```bash
   gcloud iam service-accounts delete microsoft-defender-containers@PROJECT_ID.iam.gserviceaccount.com
   ```

## Next steps

- [Configure advanced settings](defender-for-containers-gcp-configure.md)
- [Verify deployment details](defender-for-containers-gcp-verify.md)
- [Deploy programmatically](defender-for-containers-gcp-deploy.md) - For automation scenarios
- [Deploy sensor using Helm for GKE clusters](deploy-helm.md)
