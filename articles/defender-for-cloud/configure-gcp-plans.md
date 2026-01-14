---
title: Configure GCP plans
description: Learn how to configure Microsoft Defender for Cloud plans for your Google Cloud Platform (GCP) projects.
ms.topic: install-set-up-deploy
ms.author: Elkrieger
author: Elazark
ms.date: 01/13/2026
ms.custom: sfi-image-nochange
---

# Configure GCP plans

When you onboard your Google Cloud Platform (GCP) projects to Microsoft Defender for Cloud, you can choose which plans to enable for your projects. Each plan provides different security features and capabilities. By default, all plans are **On**, but unnecessary plans can be turned off.

### [Defender CSPM](#tab/defender-cspm)

Foundational CSPM is included for free with Defender for Cloud. It provides security posture management and threat protection for your GCP resources. However, to get the full value of Defender CSPM, you need to enable the Defender CSPM plan which does come with additional costs. Check out the [Defender for Cloud pricing page](defender-for-cloud-pricing.md) for more information about costs.

Learn more about [CSPM and the differences between the plans](concept-cloud-security-posture-management.md).

#### Prerequisites

- The plan must be enabled by the **Subscription Owner**.
- To enable Cloud Infrastructure Entitlement Management (CIEM) capabilities, the Entra ID account used for the onboarding process must have either the **Application Administrator** or **Cloud Application Administrator** directory role for your tenant (or equivalent administrator rights to create app registrations). This requirement is only necessary during the onboarding process.

#### Configuration

To configure the Defender CSPM plan:

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Search for and select **Microsoft Defender for Cloud**.
 
1. Go to **Environment settings**.

1. Select the relevant GCP connector 

1. Locate the Defender CSPM row and select **Settings**.

    :::image type="content" source="media/quickstart-onboard-gcp/view-configuration.png" alt-text="Screenshot that shows the link for configuring the Defender CSPM plan." lightbox="media/quickstart-onboard-gcp/view-configuration.png":::

1. Toggle the switches to **On** or **Off**, depending on your need. To get the full value of Defender CSPM, we recommend that you turn all toggles to **On**.

    :::image type="content" source="media/quickstart-onboard-gcp/cspm-configuration.png" alt-text="Screenshot that shows toggles for Defender CSPM." lightbox="media/quickstart-onboard-gcp/cspm-configuration.png":::

1. Select **Save**.

1. Continue from step 8 of the [Connect your GCP project](quickstart-onboard-gcp.md#connect-your-gcp-project) instructions.

### [Defender for Servers](#tab/defender-for-servers)

[Defender for Servers](defender-for-servers-overview.md) brings threat detection and advanced defenses to your GCP virtual machine (VM) instances. To have full visibility into Defender for Servers security content, connect your GCP VM instances to Azure Arc.

#### Prerequisites

- Azure Arc for servers installed on your VM instances.

We recommend that you use the autoprovisioning process to install Azure Arc on your VM instances. Autoprovisioning is enabled by default in the onboarding process and requires **Owner** permissions on the subscription. The Azure Arc autoprovisioning process uses the [OS Config agent on the GCP machines](https://cloud.google.com/compute/docs/images/os-details#vm-manager).

The Azure Arc autoprovisioning process uses the VM manager on GCP to enforce policies on your VMs through the OS Config agent. A VM that has an [active OS Config agent](https://cloud.google.com/compute/docs/manage-os#agent-state) incurs a cost according to GCP. To see how this cost might affect your account, refer to the [GCP technical documentation](https://cloud.google.com/compute/docs/vm-manager#pricing).

Defender for Servers doesn't install the OS Config agent to a VM that doesn't have it installed. However, Defender for Servers enables communication between the OS Config agent and the OS Config service if the agent is already installed but not communicating with the service. This communication can change the OS Config agent from `inactive` to `active` and lead to more costs.

Alternatively, you can manually connect your VM instances to Azure Arc for servers. Instances in projects with the Defender for Servers plan enabled that aren't connected to Azure Arc are surfaced by the recommendation **GCP VM instances should be connected to Azure Arc**. Select the **Fix** option in the recommendation to install Azure Arc on the selected machines.

The respective Azure Arc servers for GCP virtual machines that no longer exist (and the respective Azure Arc servers with a status of [Disconnected or Expired](/azure/azure-arc/servers/overview)) are removed after seven days. This process removes irrelevant Azure Arc entities to ensure that only Azure Arc servers related to existing instances are displayed.

Ensure that you fulfill the [network requirements for Azure Arc](/azure/azure-arc/servers/network-requirements?tabs=azure-cloud).

Enable these other extensions on the Azure Arc-connected machines:

- Defender for Endpoint
- A vulnerability assessment solution (Microsoft Defender Vulnerability Management or Qualys)

Defender for Servers assigns tags to your Azure Arc GCP resources to manage the autoprovisioning process. You must have these tags properly assigned to your resources so that Defender for Servers can manage your resources: `Cloud`, `InstanceName`, `MDFCSecurityConnector`, `MachineId`, `ProjectId`, and `ProjectNumber`.

#### Configuration

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Search for and select **Microsoft Defender for Cloud**.
 
1. Go to **Environment settings**.

1. Select the relevant GCP connector 

1. Locate the Defender for Servers row and select **Settings**.

    :::image type="content" source="media/quickstart-onboard-gcp/view-configuration.png" alt-text="Screenshot that shows the link for the settings are located." lightbox="media/quickstart-onboard-gcp/view-configuration.png":::

1. Toggle the switches to **On** or **Off**, depending on your need.

    :::image type="content" source="media/quickstart-onboard-gcp/auto-provision-screen.png" alt-text="Screenshot that shows the toggles for the Defender for Servers plan." lightbox="media/quickstart-onboard-gcp/auto-provision-screen.png":::

    If **Azure Arc agent** is **Off**, you need to follow the manual installation process mentioned earlier.

1. Select **Save**.

1. Continue from step 8 of the [Connect your GCP project](quickstart-onboard-gcp.md#connect-your-gcp-project) instructions.

### [Defender for Databases](#tab/defender-for-databases)

[Defender for Databases](defender-for-databases-overview.md) brings advanced threat protection to your GCP Cloud SQL instances. Defender for Databases provides vulnerability assessments and advanced threat detection capabilities for your GCP VM instances that are connected to Azure Arc.

#### Configuration

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Search for and select **Microsoft Defender for Cloud**.
 
1. Go to **Environment settings**.

1. Select the relevant GCP connector 

1. Locate the Defender for Servers row and select **Settings**.

    :::image type="content" source="media/quickstart-onboard-gcp/view-configuration.png" alt-text="Screenshot that shows the link for the settings are located." lightbox="media/quickstart-onboard-gcp/view-configuration.png":::

1. Toggle the switches to **On** or **Off**, depending on your need.

    :::image type="content" source="media/quickstart-onboard-gcp/auto-provision-databases-screen.png" alt-text="Screenshot that shows the toggles for the Defender for Databases plan." lightbox="media/quickstart-onboard-gcp/auto-provision-databases-screen-big.png":::

    If the toggle for Azure Arc is **Off**, you need to follow the manual installation process mentioned earlier.
   
1. Select **Save**.

1. Continue from step 8 of the [Connect your GCP project](quickstart-onboard-gcp.md#connect-your-gcp-project) instructions.

### [Defender for Containers](#tab/defender-for-containers)

[Defender for Containers](defender-for-containers-introduction.md) brings threat detection and advanced defenses to your GCP Google Kubernetes Engine (GKE) Standard clusters. To get the full security value out of Defender for Containers and to fully protect GCP clusters, ensure that you meet the following requirements.

> [!NOTE]
>
> - If you choose to disable the available configuration options, no agents or components will be deployed to your clusters. [Learn more about feature availability](support-matrix-defender-for-containers.md).
> - Defender for Containers when deployed on GCP, might incur external costs such as [logging costs](https://cloud.google.com/stackdriver/pricing), [pub/sub costs](https://cloud.google.com/pubsub/pricing) and [egress costs](https://cloud.google.com/vpc/network-pricing#:~:text=Platform%20SKUs%20apply.-%2cInternet%20egress%20rates%2c-Premium%20Tier%20pricing).

- **Kubernetes audit logs to Defender for Cloud**: Enabled by default. This configuration is available at the GCP project level only. It provides agentless collection of the audit log data through [GCP Cloud Logging](https://cloud.google.com/logging/) to the Defender for Cloud back end for further analysis. Defender for Containers requires control plane audit logs to provide [runtime threat protection](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters). To send Kubernetes audit logs to Defender, toggle the setting to **On**.

    > [!NOTE]
    > If you disable this configuration, then the `Threat detection (control plane)` feature will be disabled. Learn more about [features availability](support-matrix-defender-for-containers.md).

- **Auto provision Defender's sensor for Azure Arc** and **Auto provision Azure Policy extension for Azure Arc**: Enabled by default. You can install Azure Arc-enabled Kubernetes and its extensions on your GKE clusters in three ways:
  - Enable Defender for Containers autoprovisioning at the project level, as explained in the instructions in this section. We recommend this method.
  - Use Defender for Cloud recommendations for per-cluster installation. They appear on the Defender for Cloud recommendations page. [Learn how to deploy the solution to specific clusters](defender-for-containers-enable.md?tabs=defender-for-container-gke#deploy-the-solution-to-specific-clusters).
  - Manually install [Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/quickstart-connect-cluster) and [extensions](/azure/azure-arc/kubernetes/extensions).

- The [K8S API access](defender-for-containers-architecture.md#how-does-agentless-discovery-for-kubernetes-in-gcp-work) feature provides API-based discovery of your Kubernetes clusters. To enable, set the **K8S API access** toggle to **On**.
- The [Registry access](agentless-vulnerability-assessment-gcp.md) feature provides vulnerability management for images stored in Google Container Registry (GCR) and Google Artifact Registry (GAR) and running images on your GKE clusters. To enable, set the **Registry access** toggle to **On**.

To configure the Defender for Containers plan:

1. Follow the steps to [connect your GCP project](#connect-your-gcp-project).

1. On the **Select plans** tab, select **Configure**. Then, on the **Defender for Containers configuration** pane, turn the toggles to **On**.

    :::image type="content" source="media/tutorial-enable-containers-gcp/containers-settings-gcp.png" alt-text="Screenshot of Defender for Cloud's environment settings page showing the settings for the Containers plan." lightbox="media/tutorial-enable-containers-gcp/containers-settings-gcp.png":::

1. Select **Save**.

1. Continue from step 8 of the [Connect your GCP project](quickstart-onboard-gcp.md#connect-your-gcp-project) instructions.

---

## Next step

> 