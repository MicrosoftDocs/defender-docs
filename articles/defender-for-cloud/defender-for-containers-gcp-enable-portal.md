---
title: Enable Defender for Containers on GCP (GKE) via portal
description: Learn how to enable Microsoft Defender for Containers on your GKE clusters through the Azure portal, with options to enable all components or deploy specific components selectively.
ms.topic: how-to
ms.date: 06/04/2025
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

## Create GCP connector

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud**.

1. Select **Environment settings** from the left menu.

1. Select **Add environment** > **Google Cloud Platform**.

    :::image type="content" source="media/quickstart-onboard-gcp/add-gcp-account-environment-settings.png" alt-text="Screenshot showing how to connect a GCP project to Microsoft Defender for Cloud." lightbox="media/quickstart-onboard-gcp/add-gcp-account-environment-settings.png":::

## Configure connector details

1. In the **Account details** section, enter:
   - **Connector name**: A descriptive name for your GCP project
   - **GCP project ID**: Your GCP project identifier
   - **Resource group**: Select or create a resource group

1. Select **Next: Select plans**.

## Enable Defender for Containers features

1. In the **Select plans** page, toggle **Containers** to **On**.

    :::image type="content" source="media/tutorial-enable-containers-gcp/gcp-containers-enabled.png" alt-text="Screenshot of enabling Defender for Containers for a GCP connector." lightbox="media/tutorial-enable-containers-gcp/gcp-containers-enabled.png":::

1. Select **Configure** to access the plan settings.

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

1. Download the setup script from the portal.

1. Open Google Cloud Shell or your local terminal with gcloud configured.

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

1. Copy the service account email from the script output.

1. Return to Azure portal and paste the service account email.

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

After connecting your GKE clusters to Azure Arc:

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for "Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select your GKE clusters.

1. Select **Fix** to deploy the sensor.

> [!NOTE]
> You can also deploy the Defender sensor using Helm for more control. See [Deploy Defender sensor using Helm](defender-for-containers-gcp-enable-programmatically.md#deploy-defender-sensor).

### Configure container registry scanning

For Google Container Registry (GCR) and Artifact Registry:

1. Go to your GCP connector settings.

1. Select **Configure** next to the Containers plan.

1. Verify **Agentless container vulnerability assessment** is enabled.

1. Images are automatically scanned when pushed to the registry.

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

To deploy the sensor only to selected GKE clusters:

1. Connect only specific clusters to Azure Arc (not all).

1. Go to **Recommendations** and find "Arc-enabled Kubernetes clusters should have Defender extension installed".

1. Select only the clusters where you want the sensor.

1. Follow the remediation steps for selected clusters only.

### Enable vulnerability scanning only

To enable only registry scanning without runtime protection:

1. In connector configuration, enable only **Agentless container vulnerability assessment**.

1. Disable other components.

1. Save the configuration.

### Configure by cluster type

#### Standard GKE clusters

No special configuration required. Follow the default deployment steps.

#### GKE Autopilot

For Autopilot clusters:

1. The Defender sensor automatically adjusts resource requests.

1. No manual configuration needed for resource limits.

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

1. Go to your Arc-enabled GKE cluster in Azure portal.

1. Under **Overview**, select **Tags**.

1. Add one of these tags:
   - For Defender sensor: `ms_defender_container_exclude_sensors` = `true`
   - For Azure Policy: `ms_defender_container_exclude_azurepolicy` = `true`

## Configure additional settings

### Enable Workload Identity

For enhanced security with Workload Identity:

```bash
# Enable Workload Identity on cluster
gcloud container clusters update <cluster-name> \
    --zone <zone> \
    --workload-pool=<project-id>.svc.id.goog

# Configure service account
kubectl annotate serviceaccount <sa-name> \
    --namespace <namespace> \
    iam.gke.io/gcp-service-account=<gcp-sa>@<project-id>.iam.gserviceaccount.com
```

### Configure Binary Authorization

To enforce image verification:

```bash
# Create Binary Authorization policy
gcloud container binauthz policy import <policy-file>

# Enable on cluster
gcloud container clusters update <cluster-name> \
    --zone <zone> \
    --enable-binauthz
```

## Monitor ongoing security

After setup, regularly:

1. **Review recommendations** - Address security issues for GKE clusters.
1. **Investigate alerts** - Respond to runtime threats detected.
1. **Track compliance** - Monitor adherence to CIS GKE benchmark.
1. **Update components** - Keep Arc and Defender extensions current.
1. **Monitor partial deployments** - Track which clusters have protection if using selective deployment.

## Troubleshooting

### Connector creation fails

1. Verify GCP project ID is correct.

1. Check service account has required permissions:
   - `container.viewer`
   - `securitycenter.admin`
   - `iam.serviceAccountUser`

1. Ensure APIs are enabled:

   ```bash
   gcloud services enable container.googleapis.com
   gcloud services enable cloudresourcemanager.googleapis.com
   ```

### Arc connection issues

1. Check cluster connectivity:

   ```bash
   kubectl get pods -n azure-arc
   ```

1. Verify outbound connectivity to Azure.

1. Review Arc agent logs:

   ```bash
   kubectl logs -n azure-arc -l app.kubernetes.io/component=connect-agent
   ```

### No vulnerability scans

1. Verify registry permissions are configured.

1. Check that images were recently pushed.

1. Ensure vulnerability scanning API is enabled:

   ```bash
   gcloud services enable containeranalysis.googleapis.com
   ```

## Best practices

1. **Start with non-production**: Test on dev/test clusters first for selective deployment.
1. **Enable all components**: Get comprehensive protection when possible.
1. **Use Workload Identity**: Enhance security with Workload Identity.
1. **Regular monitoring**: Check dashboard weekly for findings.
1. **Image signing**: Implement Binary Authorization for production.
1. **Document exclusions**: Track why certain clusters are excluded in selective deployments.
1. **Deploy incrementally**: When using selective deployment, add one component at a time.
1. **Monitor each step**: Verify each component before proceeding to the next.

## Clean up resources

To disable Defender for Containers:

1. Go to **Environment settings**.

1. Select your GCP connector.

1. Choose either:
   - Set **Containers** to **Off** to disable the plan
   - Delete the entire connector to remove all configurations

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
