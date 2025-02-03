---
title: The data and AI security dashboard (Preview)
description: Learn about the capabilities and functions of the data security posture management view in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 01/30/2025
#customer intent: As a security professional, I want to understand the information presented to me on the data and AI security dashboard so that I can effectively manage the security of my organization's data and AI estate, risks and insights.
---

# Data and AI security dashboard (Preview)

Microsoft Defender for Cloud's Data and AI security dashboard enhances customer engagement by providing a centralized platform to monitor and manage data and AI resources. The dashboard integrates various features such as issue tracking, recommendations, and data threat analysis. You can easily navigate and access critical information through the dashboard's elements to stay informed about your data and AI environments.

One key benefit of the Data and AI Dashboard is its ability to quickly show your organization's most critical data and security issues. This feature helps you make informed decisions and take proactive measures to mitigate risks.

## Benefits of the Data and AI security dashboard

With the Data and AI security dashboard, you can:

- Track and manage data and AI resources, making it easier to stay informed and in control.
- Access critical information and perform tasks efficiently.
- View the most critical data and AI security issues, enabling you to make informed decisions and take proactive measures.
- Explore potential threats by highlighting [attack paths](concept-attack-path.md) that lead to sensitive data.
- View issue tracking, recommendations, and data threat analysis in one place.
- Manage data and AI environments on a centralized platform.
- View the most critical threats to your data and AI environments, enabling you to mitigate issues and improve your overall security posture.
- Explore useful data insights by highlighting data queries in the [security explorer](how-to-manage-cloud-security-explorer.md).

:::image type="content" source="media/data-aware-security-dashboard/data-security.png" alt-text="Screenshot that shows you how to navigate to the data security dashboard." lightbox="media/data-aware-security-dashboard/data-security.png":::

## Prerequisites

**To view the dashboard**:

- You must [enable Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md).
- [Enable sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan) within the Defender CSPM plan.  

**To receive the alerts for data sensitivity**:

- You must [enable Defender for Storage](tutorial-enable-storage-plan.md).

## Required permissions and roles

**Permissions**:

- Microsoft.Security/assessments/read
- Microsoft.Security/assessments/subassessments/read
- Microsoft.Security/alerts/read

**Role** - the minimum required privileged role-based access control role of **Security explorer**.

- Register each relevant Azure subscription to the [Microsoft.Security resource provider](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider).

> [!NOTE]
> The data security dashboard feature is turned on at the subscription level.

## Data security overview section

The Data and AI security overview section shows your cloud data and AI estate for each cloud. It includes all data and AI resources, divided into storage assets, managed databases, hosted databases (IaaS), and AI services.

:::image type="content" source="media/data-aware-security-dashboard/data-security-overview.png" alt-text="Screenshot that shows the overview section of the data security view." lightbox="media/data-aware-security-dashboard/data-security-overview.png":::

- **Coverage status** - displays the limited data coverage for resources without Defender CSPM workload protection:

  - **Covered** – resources that have the necessary Defender CSPM, or Defender for Storage, or Defender for Databases enabled.
  - **Partially covered** – missing either the Defender CSPM, Defender for Storage, or Defender for Storage plan. Select the tooltip to present a detailed view of what is missing.
  - **Not covered** - resources that aren't covered by Defender CSPM, or Defender for Storage, or Defender for Databases.

- **Sensitive resources** – displays how many resources are sensitive.

  - **Sensitive resources requiring attention** - displays the number of sensitive resources that have either high severity security alerts or attack paths.

## Top issues

The **Top issues** section provides a highlighted view of top active and potential risks to sensitive data.

- **Sensitive data resources with high severity alerts** - summarizes the active threats to sensitive data resources and which data types are at risk.

- **Sensitive data resources in attack paths** - summarizes the potential threats to sensitive data resources  by presenting attack paths leading to sensitive data resources and which data types are at potential risk.

- **Data queries in security explorer** - presents the top data-related queries in security explorer that helps focus on multicloud risks to sensitive data.

    :::image type="content" source="media/data-aware-security-dashboard/top-issues.png" alt-text="Screenshot that shows the top issues section of the data security view." lightbox="media/data-aware-security-dashboard/top-issues.png":::

## Closer look

The **Closer look** section provides a more detailed view into the sensitive data within the organization.

- **Sensitive data discovery** - summarizes the results of the sensitive resources discovered, allowing customers to explore a specific sensitive information type and label.
- **Internet-exposed data resources** - summarizes the discovery of sensitive data resources that are internet-exposed for storage and managed databases.

    :::image type="content" source="media/data-aware-security-dashboard/closer-look.png" alt-text="Screenshot that shows the closer look section of the data security dashboard." lightbox="media/data-aware-security-dashboard/closer-look.png":::

You can select the **Manage data sensitivity settings** to get to the **Data sensitivity** page. The **Data sensitivity** page allows you to manage the data sensitivity settings of cloud resources at the tenant level, based on selective info types and labels originating from the Purview compliance portal, and [customize sensitivity settings](data-sensitivity-settings.md) such as creating your own customized info types and labels, and setting sensitivity label thresholds.

:::image type="content" source="media/data-aware-security-dashboard/manage-security-sensitivity-settings.png" alt-text="Screenshot that shows where to access managing data sensitivity settings." lightbox="media/data-aware-security-dashboard/manage-security-sensitivity-settings.png":::

## Related content

- Learn more about [data security posture management](concept-data-security-posture.md).
- Learn how to [enable Defender CSPM](tutorial-enable-cspm-plan.md).
