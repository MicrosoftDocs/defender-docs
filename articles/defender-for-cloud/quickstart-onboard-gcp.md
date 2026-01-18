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

Microsoft Defender for Cloud provides security posture management and threat protection for workloads running in Google Cloud Platform (GCP).

This article shows you how to connect a GCP project or organization to Microsoft Defender for Cloud so Microsoft Defender for Cloud can discover resources, assess security posture, and surface security recommendations and alerts.

## Authentication architecture

Microsoft Defender for Cloud uses federated authentication to securely access GCP APIs without storing long-lived credentials.

During onboarding, Defender for Cloud establishes trust with Google Cloud using workload identity federation and service account impersonation. Access is scoped to the connected project or organization and limited to the permissions required by the enabled Defender plans.

Learn more about [authentication architecture for GCP connectors](concept-authentication-architecture-gcp.md).

## Prerequisites

Before you connect your GCP project, make sure you have:

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) enabled on your Azure subscription.

- Access to a GCP project or organization.

- Contributor-level permission for the relevant Azure subscription.

- If you enable CIEM as part of Defender for CSPM, the user onboarding the connector also needs the [Security Admin role and Application.ReadWrite.All permission](enable-permissions-management.md?source=recommendations#before-you-start) for the tenant.
      
## Cost considerations 

Connecting GCP projects to Microsoft Defender for Cloud and enabling Defender plans can incur additional charges.

You can learn more about Defender for Cloud pricing on the [pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## GCP project and subscription mapping

When connecting GCP projects to Azure subscriptions, consider the following:

- GCP projects are connected to Microsoft Defender for Cloud at the project level.
- You can connect multiple GCP projects to a single Azure subscription.
- You can connect multiple GCP projects across multiple Azure subscriptions.

Learn more about the [Google Cloud resource hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy#resource-hierarchy-detail).

## Connect your GCP project

1. Sign in to the [Azure portal](https://portal.azure.com).
 
1. Search for and select **Microsoft Defender for Cloud**.
 
1. Go to **Environment settings** > **Add environment** > **Google Cloud Platform**.

    :::image type="content" source="media/quickstart-onboard-gcp/connector.png" alt-text="Screenshot that shows where the GCP connector option is located." lightbox="media/quickstart-onboard-gcp/connector.png":::

1. Enter the following information:
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

    > [!NOTE]
    > As the Log Analytics agent (also known as MMA) retired in [August 2024](https://azure.microsoft.com/updates/were-retiring-the-log-analytics-agent-in-azure-monitor-on-31-august-2024/), all Defender for Servers features and security capabilities that currently depend on it, including those described on this page, will be available through either [Microsoft Defender for Endpoint integration](integration-defender-for-endpoint.md) or [agentless scanning](concept-agentless-data-collection.md), before the retirement date. For more information about the roadmap for each of the features that are currently rely on Log Analytics Agent, see [this announcement](upcoming-changes.md#defender-for-cloud-plan-and-strategy-for-the-log-analytics-agent-deprecation).

1. Toggle plans to **On** or **Off** depending on your needs.

    :::image type="content" source="media/quickstart-onboard-gcp/select-plans.png" alt-text="Screenshot that shows toggles turned on for all plans." lightbox="media/quickstart-onboard-gcp/select-plans.png":::

1. Select **Next: Configure access**.

1. Select permission type, **Default access** or **Least privilege access**.

1. Follow the on screen instructions to configure access between Defender for Cloud and your GCP project.

    :::image type="content" source="media/quickstart-onboard-gcp/add-gcp-project-configure-access.png" alt-text="Screenshot that shows deployment options and instructions for configuring access." lightbox="media/quickstart-onboard-gcp/add-gcp-project-configure-access.png":::

In this step, you can find the GCloud script that needs to be run on the GCP project that is going to onboarded. The GCloud script is generated based on the plans you selected to onboard.

The GCloud script creates all of the required resources on your GCP environment so that Defender for Cloud can operate and provide the following security values:

- Workload identity pool
- Workload identity provider (per plan)
- Service accounts
- Project level policy bindings (service account has access only to the specific project)

1. Select **Next: Review and generate**.
 
1. Review the information for accuracy.

   :::image type="content" source="media/quickstart-onboard-gcp/review-and-generate.png" alt-text="Screenshot of the review and generate screen with all of your selections listed." lightbox="media/quickstart-onboard-gcp/review-and-generate-big.png":::

    > [!NOTE]
    > The following APIs must be enabled on the project where you run the onboarding script to discover your GCP resources and allow the authentication process to occur:
    >
    > - `iam.googleapis.com`
    > - `sts.googleapis.com`
    > - `cloudresourcemanager.googleapis.com`
    > - `iamcredentials.googleapis.com`
    > - `compute.googleapis.com`
    >
    > When you onboard at the organization level, enable these APIs on the management project, even though you use them to access resources across all projects within your organization.
    >
    > If you don't enable these APIs, you can enable them during the onboarding process by running the GCP Cloud Shell script.

1. Select **Create**.

After you create the connector, a scan starts on your GCP environment. New recommendations appear in Defender for Cloud after up to six hours. If you enabled autoprovisioning, Azure Arc and any enabled extensions are installed automatically for each newly detected resource.

## Validate connector health

To confirm that your GCP connector is operating correctly:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Locate the GCP project and review the **Connectivity status** column to see whether the connection is healthy or has issues.

1. Select the value shown in the **Connectivity status** column to view more details.

The Environment details page lists any detected configuration or permission issues affecting the connection to the GCP project.

If an issue is present, you can select it to view a description of the problem and the recommended remediation steps. In some cases, a remediation script is provided to help resolve the issue.

Learn more about [troubleshooting multicloud connectors](troubleshoot-connectors.md).

## View your current coverage

Defender for Cloud provides access to [workbooks](custom-dashboards-azure-workbooks.md) through [Azure workbooks](/azure/azure-monitor/visualize/workbooks-overview). Workbooks are customizable reports that provide insights into your security posture.

The [coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook) helps you understand your current coverage by showing which plans are enabled on your subscriptions and resources.

## Enable GCP Cloud Logging ingestion (Preview)

GCP Cloud Logging ingestion enhances identity and permission insights by adding activity context for Cloud Infrastructure Entitlement Management (CIEM) assessments, risk-based recommendations, and attack path analysis.

Learn more about [ingesting GCP Cloud Logging with Pub/Sub (Preview)](logging-ingestion.md).

## Next steps

- [Configure Defender for Cloud plans for your GCP projects](configure-google-plans.md).
- Learn about the [authentication architecture for GCP connectors](concept-authentication-architecture-gcp.md).
- [Ingest GCP Cloud Logging with Pub/Sub (Preview)](logging-ingestion.md).
- [Resolve Domain Restricted Sharing policy](resolve-gcp-sharing-policy.md).
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md).
