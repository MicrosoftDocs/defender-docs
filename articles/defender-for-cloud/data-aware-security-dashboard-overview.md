---
title: Data and AI security dashboard (Preview)
description: Discover the capabilities of the Data and AI Security Dashboard in Microsoft Defender for Cloud. Enhance your security posture and manage risks effectively.
ms.topic: concept-article
ms.date: 02/12/2025
#customer intent: As a security professional, I want to understand the information presented to me on the data and AI security dashboard so that I can effectively manage the security of my organization's data and AI estate, risks and insights.
---

# Data and AI security dashboard (Preview)

Microsoft Defender for Cloud's Data and AI security dashboard provides a centralized platform to monitor and manage data and AI resources, their associated risks, and protection status. The dashboard highlights critical security issues, resources needing attention, and internet-exposed resources, enabling proactive risk mitigation. Additionally, it provides insights into sensitive data within data resources and AI workloads, strengthening the overall security posture.

A key benefit of the Data and AI dashboard is its ability to see your organization's most critical data and AI security issues. This feature helps you make informed decisions and take proactive measures to mitigate risks.

## Benefits of the Data and AI security dashboard

The Data and AI security dashboard allows you to:

- View all organizational data and AI resources in a single interface.

- A unified view of all organizational data and AI resources in a single interface. 
- Gain insights into data storage locations and the types of resources that hold it.
- Assess the protection coverage of data and AI resources.
- View [attack paths](concept-attack-path.md), recommendations, and data threat analysis in one location.
- Mitigate critical threats and improve security posture in data and AI environments.
- Discover useful data and AI insights by highlighting queries in the [security explorer](how-to-manage-cloud-security-explorer.md).
- Identify and summarize sensitive data resources within your cloud data and AI assets.

> [!NOTE]
> The data security dashboard feature is enabled at the subscription level. The dashboard information is based on the data and AI resources in your subscription and the plans enabled in your subscription.
>
> To have full access to the dashboard, you must enable the [Defender Cloud Security Posture Management (CSPM) plan](tutorial-enable-cspm-plan.md), and Defender CSPM's extension [sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan), [Defender for Storage](tutorial-enable-storage-plan.md), [Defender for Databases](tutorial-enable-databases-plan.md), and [threat protection for AI workloads](ai-onboarding.md).
>
> You must also register each relevant Azure subscription to the [Microsoft.Security resource provider](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider).
>
>  You must also have the following permissions and role:
> - **Permissions**:
>  - Microsoft.Security/assessments/read
>  - Microsoft.Security/assessments/subassessments/read
>  - Microsoft.Security/alerts/read
> - **Role** - the minimum required privileged role-based access control role of **Security explorer**.

## Data and AI security overview

The Data and AI security overview section displays your cloud data and AI estate for each cloud. It includes all data and AI resources, categorized into storage assets, managed databases, hosted databases (IaaS), and AI services.

Here, you can see which of your resources are fully, partially, or not protected by Defender CSPM, Defender for Storage, Defender for Databases, and AI threat protection. The dashboard also highlights which of your data and AI resources have high and critical severity recommendations based on alerts, or attack paths that need addressing.

:::image type="content" source="media/data-aware-security-dashboard/data-security-overview.png" alt-text="Screenshot that shows the overview section of the data security view." lightbox="media/data-aware-security-dashboard/data-security-overview.png":::

## Top issues

The Top issues section provides details on resources needing the most immediate attention due to critical issues affecting them. This section presents:

- Alerts with the highest severities based on the presented MITRE ATT&CK tactics.
- Recommendations with critical and high severities.
- Attack paths with critical and high severities.

    :::image type="content" source="media/data-aware-security-dashboard/top-issues.png" alt-text="Screenshot that shows the top issues section of the data security view." lightbox="media/data-aware-security-dashboard/top-issues.png":::

## Data closer look

The Data closer look section provides an in-depth view of data resources and their risks.

This section includes:

- **Sensitive data discovery**: Provides an overview of sensitive findings, including the most common sensitive information types and sensitivity labels in cloud data resources.

    > [!TIP]
    > Select **Manage Sensitivity Settings** to navigate to the Data Sensitivity page. The Data Sensitivity page allows you to [customize sensitivity settings](data-sensitivity-settings.md) for cloud resources at the tenant level. Sensitivity settings can be set based on selected information types and labels from the Purview compliance portal, including sensitivity label thresholds. For more information, see [Manage sensitivity settings](data-sensitivity-settings.md).

- **Data threat protection**: Provides an overview of alerts detected in storage and managed database resources.

- **Data queries in security explorer**: Provides queries that assist with investigations related to data-related risks such as data resources with plaintext secrets, external user access to databases, and public storage containing sensitive data.

- **Internet exposed data resources**: Provides an overview of resources exposed to the internet, categorized by storage assets, managed databases, and hosted databases. These resources are vulnerable to potential threats.

:::image type="content" source="media/data-aware-security-dashboard/closer-look.png" alt-text="Screenshot that shows the closer look section of the data security dashboard." lightbox="media/data-aware-security-dashboard/closer-look.png":::

## AI closer look

The AI closer look section provides an overview of the most critical issues affecting AI workloads.

This section includes:

- **AI discovery**: Provides an overview of all AI resources located within the environment.

- **AI threat protection**: Provides an overview of the number of prompts scanned and all alerts detected, sorted by severity.

- **AI queries in security explorer**: Provides queries that assist with investigations related to AI-related risks such as sensitive data resources used for grounding and vulnerable containers used for AI.

- **Internet exposed resources used for grounding**: Provides an overview of AI resources exposed to the internet, categorized by storage and search assets.

:::image type="content" source="media/data-aware-security-dashboard/ai-closer-look.png" alt-text="Screenshot that shows the AI closer look section of the data security dashboard." lightbox="media/data-aware-security-dashboard/ai-closer-look.png":::

## Related content

- Learn more about [data security posture management](concept-data-security-posture.md).
- Learn how to [enable Defender CSPM](tutorial-enable-cspm-plan.md).
