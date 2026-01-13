---
title: Connect your GCP project
description: Defend your GCP resources by using Microsoft Defender for Cloud. Protect your workloads and enhance your cloud security with our comprehensive solution.
ms.topic: install-set-up-deploy
ms.author: Elkrieger
author: Elazark
ms.date: 01/13/2026
ms.custom: sfi-image-nochange
---

# Connect your GCP project to Microsoft Defender for Cloud

Workloads commonly span multiple cloud platforms. Cloud security services must do the same. Microsoft Defender for Cloud helps protect workloads in Google Cloud Platform (GCP), but you need to set up the connection between them and Defender for Cloud.

This screenshot shows GCP accounts displayed in the Defender for Cloud [overview dashboard](overview-page.md).

:::image type="content" source="./media/quickstart-onboard-gcp/gcp-account-in-overview.png" alt-text="Screenshot that shows GCP projects listed on the overview dashboard in Defender for Cloud." lightbox="media/quickstart-onboard-gcp/gcp-account-in-overview.png":::

## GCP authorization design

The authentication process between Microsoft Defender for Cloud and GCP is a federated authentication process.  

When you onboard to Defender for Cloud, the GCloud template is used to create the following resources as part of the authentication process:

- Workload identity pool and providers

- Service accounts and policy bindings

The authentication process works as follows:

:::image type="content" source="media/quickstart-onboard-gcp/authentication-process.png" alt-text="A diagram of the Defender for Cloud GCP connector authentication process." lightbox="media/quickstart-onboard-gcp/authentication-process.png":::

1. Microsoft Defender for Cloud's CSPM service acquires a Microsoft Entra token. Microsoft Entra ID signs the token using the RS256 algorithm and is valid for 1 hour.

1. The Microsoft Entra token is exchanged with Google's STS token.

1. Google STS validates the token with the workload identity provider. The Microsoft Entra token is sent to Google's STS that validates the token with the workload identity provider. Audience validation then occurs and the token is signed. A Google STS token is then returned to Defender for Cloud's CSPM service.

1. Defender for Cloud's CSPM service uses the Google STS token to impersonate the service account. Defender for Cloud's CSPM receives service account credentials that are used to scan the project.

## Prerequisites

To complete the procedures in this article, you need:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- Access to a GCP project.

- Contributor level permission for the relevant Azure subscription.

- If CIEM is enabled as part of Defender for CSPM, the user onboarding the connector also needs [Security Admin role and Application.ReadWrite.All permission](enable-permissions-management.md?source=recommendations#before-you-start) for your tenant.

- To ingest GCP Cloud Logging with Pub/Sub topics, ensure you meet the prerequisites based on your deployment choice:

   - If you create new Cloud Logging and Pub/Sub resources:
   
      - Permissions to create and manage Cloud Logging sinks, Pub/Sub topics, and subscriptions in GCP.
      
      - IAM permissions to configure Pub/Sub and manage service accounts.
      
   - If you plan to use existing Cloud Logging and Pub/Sub resources:
   
      - Access to the existing Cloud Logging and Pub/Sub resources.
      
      - Understanding of your organization's existing log retention and Pub/Sub configurations.
      
You can learn more about Defender for Cloud pricing on [the pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

When you're connecting GCP projects to specific Azure subscriptions, consider the [Google Cloud resource hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy#resource-hierarchy-detail) and these guidelines:

- You can connect your GCP projects to Microsoft Defender for Cloud at the *project* level.
- You can connect multiple projects to one Azure subscription.
- You can connect multiple projects to multiple Azure subscriptions.

## Connect your GCP project

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Go to **Microsoft Defender for Cloud**.
 
1. Select **Environment settings** from the left menu.
 
1. Select **Add environment** > **Google Cloud Platform**.

    :::image type="content" source="media/quickstart-onboard-gcp/gcp-connector.png" alt-text="Screenshot that shows where the GCP connector option is located." lightbox="media/quickstart-onboard-gcp/gcp-connector.png":::

1. Enter the following information
    - Connector name.
    - Select either **Organization** or **Single project**.
    - Subscription.
    - Resource group.
    - Location.
    - Scan interval: 4, 6, 12, or 24.
    - (Organization only) Organization ID.
    - (Optional - Organization only) Exclude project numbers.
    - (Optional - Organization only) Exclude folder IDs.
    - (Single project only) GCP project number.
    - (Single project only) GCP project ID.

    > [!NOTE]
    > Some data collectors run with fixed scan intervals and aren't affected by custom interval configurations. The following table shows the fixed scan intervals for each excluded data collector:
    >
    > | Data collector name | Scan interval |
    > |--|--|
    > | ComputeInstance <br> ArtifactRegistryRepositoryPolicy <br> ArtifactRegistryImage <br> ContainerCluster <br> ComputeInstanceGroup <br> ComputeZonalInstanceGroupInstance <br> ComputeRegionalInstanceGroupManager <br> ComputeZonalInstanceGroupManager <br> ComputeGlobalInstanceTemplate | 1 hour |

1. Select **Next: Select plans**.

1. Toggle plans to **On** or **Off** depending on your needs.

    :::image type="content" source="media/quickstart-onboard-gcp/select-plans.png" alt-text="Screenshot that shows toggles turned on for all plans." lightbox="media/quickstart-onboard-gcp/select-plans.png":::

1. Select **Next: Configure access**.

1. Select permission type, **Default access** or **Least privilege access**.

1. Follow the on screen instructions to configure access between Defender for Cloud and your GCP project.

    :::image type="content" source="media/quickstart-onboard-gcp/add-gcp-project-configure-access.png" alt-text="Screenshot that shows deployment options and instructions for configuring access." lightbox="media/quickstart-onboard-gcp/add-gcp-project-configure-access.png":::

    The script creates all of the required resources on your GCP environment so that Defender for Cloud can operate and provide the following security values:

    - Workload identity pool
    - Workload identity provider (per plan)
    - Service accounts
    - Project level policy bindings (service account has access only to the specific project)

    > [!NOTE]
    > The following APIs must be enabled on the project where you run the onboarding script to discover your GCP resources and allow the authentication process to occur:
    >
    > - `iam.googleapis.com`
    > - `sts.googleapis.com`
    > - `cloudresourcemanager.googleapis.com`
    > - `iamcredentials.googleapis.com`
    > - `compute.googleapis.com`
    >
    > When onboarding at the organization level, these APIs must be enabled on the management project, even though they will be used to access resources across all projects within your organization.
    >
    > If you don't enable these APIs at this time, you can enable them during the onboarding process by running the GCP Cloud Shell script.

1. Select **Next: Review and generate**.

1. Review the information for accuracy.

1. Select **Create**.

After you create the connector, a scan starts on your GCP environment. New recommendations appear in Defender for Cloud after up to 6 hours. If you enabled autoprovisioning, Azure Arc and any enabled extensions are installed automatically for each newly detected resource.

## Ingest GCP cloud logging with Pub/Sub (Preview)

Integrating Google Cloud Platform (GCP) Cloud Logging with Microsoft Defender for Cloud allows you to ingest activity logs from GCP, enhancing your ability to monitor, detect, and respond to security events across your Google Cloud environments. You can configure log ingestion either at the project level or centrally at the organization level. Data streamed from GCP Pub/Sub provides the necessary context for Cloud Infrastructure Entitlement Management (CIEM) in Defender for Cloud, dependent on the log activity, calculated risk-based recommendations, security posture insights, and attack path analysis.

### Deployment options

Select the deployment scenario that meets your requirement:

- __Project-Level__: Configure log ingestion for individual GCP projects.

- __Organization-Level__: Centralize log ingestion across all projects within a GCP organization.

### Deployment steps

To configure GCP Cloud Logging:

1. Follow the [steps to connect your GCP project](#connect-your-gcp-project).

1. On the **Select plans** tab, select **Settings** under the Monitoring coverage column.

1. On the **Plan configuration** pane, turn the relevant toggles to **On**, selecting one of the following methods:

   1. Create a new GCP Cloud Logging configuration and provide a Pub/Sub subscription name.

      :::image type="content" source="media/quickstart-onboard-gcp/cloud-logging-create-new.png" alt-text="Screenshot with the Create a new GCP Cloud Logging option selected." lightbox="media/quickstart-onboard-gcp/cloud-logging-create-new.png":::
      
      > [!IMPORTANT]
      > Selecting this option will incur additional cost. [Learn more about GCP Cloud Logging pricing](https://cloud.google.com/pubsub/pricing)
      
   1. Use your existing Cloud Logging configuration by manually providing your existing Pub/Sub subscription name.
   
   :::image type="content" source="media/quickstart-onboard-gcp/cloud-logging-manual-details.png" alt-text="Screenshot with the Manually provide GCP Cloud Logging details option selected." lightbox="media/quickstart-onboard-gcp/cloud-logging-manual-details.png":::

    > [!NOTE]
    > Access configuration for GCP can be completed using either GCP Cloud Shell or Terraform, depending on your organization’s deployment workflows.
   
1. Select **Save**.

1. Continue with the next steps to [configure access](#connect-your-gcp-project).

1. Review and generate the GCP connector to complete log ingestion onboarding into Defender for Cloud. 

### How GCP logging ingestion works

Once configured, Defender for Cloud ingests and analyzes activity logs from Google Cloud to discover cloud identity and permissions insights, and CIEM recommendations.

1. Google Cloud records activity logs (including Admin Activity and Data Access logs) in [Cloud Logging](https://cloud.google.com/logging/docs).

1. Logs are exported to the configured **Pub/Sub topic** using a Cloud Logging sink.

1. The **Pub/Sub subscription** streams log messages to Defender for Cloud when new logs arrive.

1. Defender for Cloud pulls the logs from Pub/Sub, processes the activity events, and provides:

    - Identity and permission insights
    - CIEM posture recommendations

1. Access between GCP and Defender for Cloud is secured via Google Cloud **IAM roles** and **service accounts** to ensure least-privilege operation.

1. Optional: If **IAM Recommender** is enabled in your GCP environment, Defender for Cloud leverages its insights to enhance the accuracy of CIEM recommendations by identifying inactive and over-privileged roles.

## Monitor your GCP resources

The security recommendations page in Defender for Cloud displays your GCP resources together with your Azure and AWS resources for a true multicloud view.

To view all the active recommendations for your resources by resource type, use the asset inventory page in Defender for Cloud and filter to the GCP resource type that you're interested in.

:::image type="content" source="./media/quickstart-onboard-gcp/gcp-resource-types-in-inventory.png" alt-text="Screenshot of GCP options in the asset inventory page's resource type filter." lightbox="media/quickstart-onboard-gcp/gcp-resource-types-in-inventory.png":::

> [!NOTE]
> As the Log Analytics agent (also known as MMA) retired in [August 2024](https://azure.microsoft.com/updates/were-retiring-the-log-analytics-agent-in-azure-monitor-on-31-august-2024/), all Defender for Servers features and security capabilities that currently depend on it, including those described on this page, will be available through either [Microsoft Defender for Endpoint integration](integration-defender-for-endpoint.md) or [agentless scanning](concept-agentless-data-collection.md), before the retirement date. For more information about the roadmap for each of the features that are currently rely on Log Analytics Agent, see [this announcement](upcoming-changes.md#defender-for-cloud-plan-and-strategy-for-the-log-analytics-agent-deprecation).

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that provide insights into your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) helps you understand your current coverage by showing which plans are enabled on your subscriptions and resources.

## Integrate with Microsoft Defender XDR

When you enable Defender for Cloud, Defender for Cloud alerts are automatically integrated into the Microsoft Defender Portal.

The integration between Microsoft Defender for Cloud and Microsoft Defender XDR brings your cloud environments into Microsoft Defender XDR. With Defender for Cloud's alerts and cloud correlations integrated into Microsoft Defender XDR, SOC teams can now access all security information from a single interface.

Learn more about Defender for Cloud's [alerts in Microsoft Defender XDR](concept-integration-365.md).

## Next steps

Connecting your GCP project is part of the multicloud experience available in Microsoft Defender for Cloud:

- [Assign access to workload owners](assign-access-to-workload.md).
- [Protect all of your resources with Defender for Cloud](enable-all-plans.md).
- Set up your [on-premises machines](quickstart-onboard-machines.md) and [AWS account](quickstart-onboard-aws.md).
- [Troubleshoot your multicloud connectors](troubleshoot-connectors.md).
- [Resolve Domain Restricted Sharing policy](resolve-gcp-sharing-policy.md).
- Get answers to [common questions](faq-general.yml) about connecting your GCP project.
