---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 01/10/2024
ms.author: dacurwin
author: dcurwin
---

## Enable the plan

> [!IMPORTANT]
> If you haven't connected a GCP project, [connect your GCP project to Microsoft Defender for Cloud](../tutorial-enable-container-gcp.md).

To help protect your GKE clusters, use the following steps to enable the Defender for Containers plan on the relevant GCP project.

> [!NOTE]
> Verify that you don't have any Azure policies that prevent the Azure Arc installation.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant GCP connector.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/relevant-connector.png" alt-text="Screenshot that shows an example GCP connector." lightbox="../media/defender-for-containers-enable-plan-gke/relevant-connector-expanded.png":::

1. Select the **Next: Select plans >** button.

1. Ensure that the toggle for the **Containers** plan is **On**.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/containers-on.png" alt-text="Screenshot that shows the Containers plan turned on.":::

1. To change optional configurations for the plan, select **Settings**.

    :::image type="content" source="../media/tutorial-enable-containers-gcp/containers-settings-gcp.png" alt-text="Screenshot of settings for the Containers plan in the Defender for Cloud environment settings." lightbox="../media/tutorial-enable-containers-gcp/containers-settings-gcp.png":::

    - **Kubernetes audit logs to Defender for Cloud**: Enabled by default. This configuration is available at the GCP project level only. It provides agentless collection of the audit log data through [GCP Cloud Logging](https://cloud.google.com/logging/) to the Microsoft Defender for Cloud back end for further analysis. Defender for Containers requires control plane audit logs to provide [runtime threat protection](../defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters). To send Kubernetes audit logs to Microsoft Defender, set the toggle to **On**.

        > [!NOTE]
        > If you disable this configuration, the **Threat detection (control plane)** feature is also disabled. [Learn more about feature availability](../supported-machines-endpoint-solutions-clouds-containers.md).

    - **Auto provision Defender's sensor for Azure Arc** and **Auto provision Azure Policy extension for Azure Arc**: Enabled by default. You can install Azure Arc-enabled Kubernetes and its extensions on your GKE clusters in three ways:
      - Enable Defender for Containers automatic provisioning at the project level, as explained in the instructions in this section. We recommend this method.
      - Use Defender for Cloud recommendations for per-cluster installation. They appear on the Microsoft Defender for Cloud **Recommendations** page. [Learn how to deploy the solution to specific clusters](../defender-for-containers-enable.md?tabs=defender-for-container-gke#deploy-the-solution-to-specific-clusters).
      - Manually install [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/quickstart-connect-cluster) and [extensions](/azure/azure-arc/kubernetes/extensions).

    - The [Agentless discovery for Kubernetes](../defender-for-containers-architecture.md#how-does-agentless-discovery-for-kubernetes-in-gcp-work) feature provides API-based discovery of your Kubernetes clusters. To enable the feature, set its toggle to **On**.
    - The [Agentless Container Vulnerability Assessment](../agentless-vulnerability-assessment-gcp.md) feature provides vulnerability management for images stored in Google registries (Google Artifact Registry and Google Container Registry) and running images on your GKE clusters. To enable the feature, set its toggle to **On**.

1. Select the **Copy** button.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/copy-button.png" alt-text="Screenshot that shows the location of the copy button.":::

1. Select the **GCP Cloud Shell >** button.

1. Paste the script into the Cloud Shell terminal and run it.

The connector is updated after the script runs. This process can take up to 8 hours to finish.

### Deploy the solution to specific clusters

If you set any of the default automatic provisioning configurations to **Off** during the [GCP connector onboarding process](../quickstart-onboard-gcp.md#configure-the-defender-for-containers-plan) or afterward, you need to manually install Azure Arc-enabled Kubernetes, the Defender sensor, and Azure Policy for Kubernetes in each of your GKE clusters. Installing them helps ensure that you get the full security value out of Defender for Containers.

You can use two dedicated Defender for Cloud recommendations to install the extensions (and Azure Arc, if necessary):

- **GKE clusters should have Microsoft Defender's extension for Azure Arc installed**
- **GKE clusters should have the Azure Policy extension installed**

> [!NOTE]
> When you're installing Arc extensions, you must verify that the provided GCP project is identical to the one in the relevant connector.

To deploy the solution to specific clusters:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. On the Defender for Cloud **Recommendations** page, search for one of the recommendations by name.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/recommendation-search.png" alt-text="Screenshot that shows searching for a recommendation." lightbox="../media/defender-for-containers-enable-plan-gke/recommendation-search-expanded.png":::

1. Select an unhealthy GKE cluster.

    > [!IMPORTANT]
    > You must select clusters one at a time.
    >
    > Don't select the clusters by their hyperlinked names. Select anywhere else in the relevant row.

1. Select the name of the unhealthy resource.

1. Select **Fix**.

    :::image type="content" source="../media/defender-for-containers-enable-plan-gke/fix-button.png" alt-text="Screenshot that shows the location of the Fix button.":::

1. Defender for Cloud generates a script in the language of your choice:
    - For Linux, select **Bash**.
    - For Windows, select **PowerShell**.

1. Select **Download remediation logic**.

1. Run the generated script on your cluster.

1. Repeat steps 3 through 8 for the other recommendation.

## View your GKE cluster alerts

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Select the :::image type="icon" source="../media/defender-for-containers-enable-plan-gke/add-filter.png" border="false"::: button.

1. On the **Filter** dropdown menu, select **Resource type**.

1. On the **Value** dropdown menu, select **GCP GKE Cluster**.

1. Select **Ok**.

## Deploy the Defender sensor

To deploy the Defender sensor on your GCP clusters:

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **Add environment** > **Google Cloud Platform**.

    :::image type="content" source="../media/defender-for-kubernetes-intro/add-gcp-environment.png" alt-text="Screenshot of selections for adding a GCP environment in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/add-gcp-environment.png":::

1. Fill in the account details.

    :::image type="content" source="../media/defender-for-kubernetes-intro/add-gcp-account-details.png" alt-text="Screenshot of the form to fill in the account details for a GCP environment in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/add-gcp-account-details.png":::

1. Go to **Select plans**, open the **Containers** plan, and make sure **Auto provision Defender's sensor for Azure Arc** is set to **On**.

    :::image type="content" source="../media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc-gcp.png" alt-text="Screenshot of selections for enabling the Defender sensor for Azure Arc in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc-gcp.png":::

1. Go to **Configure access** and follow the steps there.

    :::image type="content" source="../media/defender-for-kubernetes-intro/configure-access-gcp.png" alt-text="Screenshot of the page for configuring access for a GCP environment in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/configure-access-gcp.png":::

1. After the `gcloud` script runs successfully, select **Create**.

> [!NOTE]
> You can exclude a specific GCP cluster from automatic provisioning. For sensor deployment, apply the `ms_defender_container_exclude_agents` label on the resource with the value `true`. For agentless deployment, apply the `ms_defender_container_exclude_agentless` label on the resource with the value `true`.
