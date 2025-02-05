---
title: The data and AI security dashboard (Preview)
description: Learn about the capabilities and functions of the data security posture management view in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 02/03/2025
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

> [!NOTE]
> The data security dashboard feature is enabled at the subscription level. The dashboard information is based on the data and AI resources in your subscription and the plans you have enabled.
>
> To have full access to the dashboard you must enable, [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md),[sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan), [Defender for Storage](tutorial-enable-storage-plan.md),  [Defender for Databases](tutorial-enable-databases-plan.md), and [threat protection for AI workloads](ai-onboarding.md).

## Data and AI security overview

The Data and AI security overview section shows your cloud data and AI estate for each cloud. It includes all data and AI resources, divided into storage assets, managed databases, hosted databases (IaaS), and AI services.

From here, you can see which of your resources are fully, partially, or not protected by the Defender CSPM, Defender for Storage, and Defender for Databases plans. You can also see which of your Data and AI resources have high-severity recommendations, alerts, or attack paths that need to be addressed.

:::image type="content" source="media/data-aware-security-dashboard/data-security-overview.png" alt-text="Screenshot that shows the overview section of the data security view." lightbox="media/data-aware-security-dashboard/data-security-overview.png":::

## Top issues

The Top issues section gives an overview of the most critical issues affecting your resources. This section presents your:

- Alerts with the highest severities based on the presented MITRE ATT&CK tactics.
- Recommendations with critical and high severities based on the presented risk factors.
- Attack paths with critical and high severities based on the presented risk factors.

    :::image type="content" source="media/data-aware-security-dashboard/top-issues.png" alt-text="Screenshot that shows the top issues section of the data security view." lightbox="media/data-aware-security-dashboard/top-issues.png":::

## Data closer look

The Data closer look section gives an overview of the most critical issues your data is facing, discovered by Defender for Databases.

This section presents:

- Which of your resources contain sensitive data and the type of data.
- Alerts on managed databases and storage, prioritized by severity.
- Data queries to locate sensitive data using the security explorer.
- The location of resources exposed to the internet, sorted by storage assets, managed databases, and hosted databases, along with the ability to view all internet-exposed data resources.

    :::image type="content" source="media/data-aware-security-dashboard/closer-look.png" alt-text="Screenshot that shows the closer look section of the data security dashboard." lightbox="media/data-aware-security-dashboard/closer-look.png":::

You can select the **Manage sensitivity settings** to get to the Data sensitivity page. The Data sensitivity page allows you to manage the data sensitivity settings of cloud resources at the tenant level, based on selective info types and labels originating from the Purview compliance portal. You can [customize sensitivity settings](data-sensitivity-settings.md) such as information types, labels, and setting sensitivity label thresholds.

## Related content

- Learn more about [data security posture management](concept-data-security-posture.md).
- Learn how to [enable Defender CSPM](tutorial-enable-cspm-plan.md).
