---
title: The data and AI security dashboard (Preview)
description: Learn about the capabilities and functions of the data security posture management view in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 02/10/2025
#customer intent: As a security professional, I want to understand the information presented to me on the data and AI security dashboard so that I can effectively manage the security of my organization's data and AI estate, risks and insights.
---

# Data and AI security dashboard (Preview)

Microsoft Defender for Cloud's Data and AI security dashboard provides a centralized platform to monitor and manage data and AI resources, their associated risks, and protection status. The dashboard highlights critical security issues, resources needing attention, and internet-exposed resources, enabling proactive risk mitigation. Additionally, it provides insights into sensitive data within data resources and AI workloads, strengthening the overall security posture.

A key benefit of the Data and AI Dashboard is its ability to see your organization's most critical data and AI security issues. This feature helps you make informed decisions and take proactive measures to mitigate risks.

## Benefits of the Data and AI security dashboard

The Data and AI security dashboard allows you to:

- View a unified view of all organizational data and AI resources in a single interface.
- Gain insights into where data is stored and the types of resources that hold it.
- Assess the protection coverage of data and AI resources.
- Track and manage data and AI resources to stay informed and in control.
- Access critical information and complete tasks efficiently.
- Make informed decisions and take proactive measures on data and AI security issues.
- Identify potential threats by highlighting [attack paths](concept-attack-path.md) leading to sensitive data.
- View issue tracking, recommendations, and data threat analysis in one location.
- Manage data and AI environments on a unified platform.
- Mitigate critical threats and improve your overall security posture in your data and AI environments.
- Discover useful data and AI insights by highlighting data and AI queries in the [security explorer](how-to-manage-cloud-security-explorer.md).
- Identify and summarize sensitive data resources within your cloud data and AI assets.

:::image type="content" source="media/data-aware-security-dashboard/data-security.png" alt-text="Screenshot that shows you how to navigate to the data security dashboard." lightbox="media/data-aware-security-dashboard/data-security.png":::

> [!NOTE]
> The data security dashboard feature is enabled at the subscription level. The dashboard information is based on the data and AI resources in your subscription and the plans enabled in your subscription.
>
> To have full access to the dashboard, you must enable the [Defender Cloud Security Posture Management (CSPM) plan](tutorial-enable-cspm-plan.md), and Defender CSPM's extension [sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan), [Defender for Storage](tutorial-enable-storage-plan.md),  [Defender for Databases](tutorial-enable-databases-plan.md), and [threat protection for AI workloads](ai-onboarding.md).

## Data and AI security overview

The Data and AI security overview section displays your cloud data and AI estate for each cloud. It includes all data and AI resources, categorized into storage assets, managed databases, hosted databases (IaaS), and AI services.

Here, you can see which of your resources are fully, partially, or not protected by Defender CSPM, Defender for Storage, Defender for Databases, and AI threat protection. The dashboard also highlights which of your data and AI resources have high and critical severity recommendations based on alerts, or attack paths that need addressing.

:::image type="content" source="media/data-aware-security-dashboard/data-security-overview.png" alt-text="Screenshot that shows the overview section of the data security view." lightbox="media/data-aware-security-dashboard/data-security-overview.png":::

## Top issues

The Top Issues section provides details on resources needing the most immediate attention due to critical issues affecting them. This section presents:

- Alerts with the highest severities based on the presented MITRE ATT&CK tactics.
- Recommendations with critical and high severities.
- Attack paths with critical and high severities.

    :::image type="content" source="media/data-aware-security-dashboard/top-issues.png" alt-text="Screenshot that shows the top issues section of the data security view." lightbox="media/data-aware-security-dashboard/top-issues.png":::

## Data closer look

The Data closer look section provides an in-depth view of data resources and their risks.

This section includes:

- **Sensitive data discovery**: Provides an overview of sensitive findings, including the most common sensitive information types and sensitivity labels in your cloud data resources.

    > [!TIP]
    > Select **Manage Sensitivity Settings** to navigate to the Data Sensitivity page. The Data Sensitivity page allows you to [customize sensitivity settings](data-sensitivity-settings.md) for cloud resources at the tenant level. Sensitivity settings can be set based on selected information types and labels from the Purview compliance portal, including sensitivity label thresholds. For more information, see [Manage sensitivity settings](data-sensitivity-settings.md).

- **Data threat protection**: Provides an overview of alerts detected in storage and managed database resources.

- **Data queries in security explorer**: Provides queries that assist with investigations related to data-related risks such as data resources with plaintext secrets, external user access to databases, and public storage containing sensitive data.

- **Internet exposed data resources**: Provides an overview of resources exposed to the internet, categorized by storage assets, managed databases, and hosted databases, making them vulnerable to potential threats.

    :::image type="content" source="media/data-aware-security-dashboard/closer-look.png" alt-text="Screenshot that shows the closer look section of the data security dashboard." lightbox="media/data-aware-security-dashboard/closer-look.png":::

## AI SPM discovery

The AI SPM discovery section presents an overview of the most critical issues your AI workloads are facing.

This section presents:

- All of your AI resources and their locations within your environment.
- All of the alerts detected, sorted by severity.
- An AI query to locate sensitive data using the security explorer.
- An AI query to locate containers in your environment with vulnerabilities.

## Related content

- Learn more about [data security posture management](concept-data-security-posture.md).
- Learn how to [enable Defender CSPM](tutorial-enable-cspm-plan.md).
