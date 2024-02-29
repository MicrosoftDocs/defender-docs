---
title: Get started with Microsoft Security Exposure Management
description: This article describes how to start using Microsoft Security Exposure Management.
keywords: Microsoft Security Exposure Management, cyber security,
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.subservice:
ms.localizationpriority: medium
ms.collection: 
- Tier1
- m365-security
search.appverid: met150
audience: ITPro
ms.date: 11/28/2023
---

# Get started with Microsoft Security Exposure Management

[!INCLUDE [prerelease](../includes//prerelease.md)]

Microsoft Security Exposure Management assesses your company workloads to identify and mitigate organizational risk associated with security exposure. Security Exposure Management is available with any E5 or P2 license, and is available as soon as you sign up for a license. Security Exposure Management collects data across workloads from your subscriptions, and adds increasing value as more workloads are assessed. Initially, your data uses the default settings in Security Exposure Management.

Get started with Security Exposure Management in the [Microsoft Security portal](https://security.microsoft.com).





<!-- should this be removed here?  
Microsoft Exposure Management includes the following features:

- **Overview (dashboard):** The exposure management overview page:
  - Summarizes the exposure management workflows
  - Lists the most exposed metrics
  - Displays recent security events
  - Allows easy navigation for drill-down to features such as key initiatives and critical asset management.
  - Provides **asset criticality management**. Critical asset management allows users to manage the criticality level of assets, that Microsoft predefined as assets of interests. It also creates custom classification rules to detect critical assets. 
- **Attack surface** This allows users to explore, investigate, and remediate the attack paths identified, visually and by attack path.
- **Exposure Insights**
  - **Initiatives:** Initiatives or the Initiative catalog provides a full list of all initiatives and their details.
  - **Security Metrics:** Metrics or the Metrics catalog provides a full list of all metrics and their details, for all initiatives.
  - **Security Recommendations:** Recommendations or the Recommendation catalog provides a full list of all recommendations and their details, in relation to the relevant metrics and initiatives.
  - **Security Events:** Lists all events, with a historical view, across the entire platform.
- **Microsoft Secure Score**: Measures an organization's security posture, with a higher number indicating more recommended actions taken.
## Navigate Security Exposure Management

The navigation includes these items:

- **Overview (dashboard):** The dashboard summarizes exposure management workflows, lists the most exposed metrics, and displays recent security events. It also allows easy drill-down to features like key initiatives and critical asset management.
- **Asset criticality management:** Critical asset management allows users to manage the criticality level of assets, that Microsoft predefined as assets of interests. It also creates custom classification rules to detect critical assets.
- **Attack surface**: **Exposure maps** and **Attack paths** allow users to explore and investigate the identified attack paths, including in a visual way.
- **Exposure insights:** Exposure insights provide posture oversight to help you prioritize where to focus and surface threats.
  - **Initiatives:** Initiatives or the Initiative catalog provides a full list of all initiatives and their details.
  - **Security metrics:** Metrics or the Metrics catalog provides a full list of all metrics and their details, for all initiatives.
  - **Security recommendations:** Recommendations or the Recommendation catalog provides a full list of all recommendations and their details, in relation to the relevant metrics and initiatives.
  - **Security events:** Provides a chronological view of all drift events across the entire platform.
- **Microsoft Secure score:** Measures an organization's security posture, with a higher number indicating more recommended actions taken.
- **Data connectors:** Provides a means to connect non-Microsoft data sources.

:::image type="content" source="./media/exposure-management-overview.png" alt-text="Screenshot of the security exposure management overview page.":::

## Navigate the overview dashboard

The Security Exposure Management dashboard allows you to consider your security concerns in a focused way and provides a means to drill down into:

- [Asset overview](#asset-overview)
- [Key initiatives](#key-initiatives)
- [Top or most exposed metrics](#top-metrics)
- [Critical asset summary](#critical-asset-summary)
- [Critical asset management](#critical-asset-management)
- [View in device inventory and in advanced hunting](#view-in-device-inventory-and-in-advanced-hunting)
- [Recent security events](#recent-security-events)

### Asset overview

With assets overview, you can quickly see your organization's exposed assets. The overview includes all your onboarded devices, those discovered devices not yet onboarded, internet facing devices, and cloud resources. Knowing what is exposed allows you to address any asset exposure risks.

### Key initiatives

Key initiatives are made up of initiatives that are marked as favorites in [Initiatives](initiatives.md), and any newly added recommended initiatives. Select an individual key initiative to see the initiative summary or open its page. You can also navigate to all initiatives from this section.

:::image type="content" source="./media/key-initiatives.png" alt-text="Screenshot of Security Exposure Management Overview key initiatives section":::

:::image type="content" source="./media/key-initiatives-example_summary.png" alt-text="Screenshot of an Overview key initiatives summary window.":::

### Top metrics

The top metrics section identifies the security metrics with the most significant exposure. It shows you the current exposure value, 14 day change trend, and associated recommendations. Drilling down into an individual security metric takes you to its metric page. You can also access all metrics from this section.

### Critical asset summary

The critical asset summary shows you how many critical assets you have and how many have attack paths that put them at risk. It allows you to drill down further to:

- Manage critical assets
- View critical devices in the inventory
- View critical assets from an advanced hunting view

#### Critical asset management

You can access the [Critical asset management](critical-asset-management.md) section from the Critical asset summary. It allows users to manage the criticality level of predefined asset of interests identified by Microsoft and create custom classification rules to detect critical assets. You can also access Critical asset management from **Settings > Microsoft XDR > Rules > Critical asset management** <!-- i put in rules for clarity but it shouldnt really be bolded. -->

:::image type="content" source="./media/critical-asset-management-summary.png" alt-text="Screenshot of Critical asset management in the Critical asset summary window.":::

#### View in device inventory and in advanced hunting

The Security Exposure Management Overview allows you to review critical devices in your inventory and critical issues in [Advanced hunting](/microsoft-365/security/defender/advanced-hunting-overview.md). The following views take you to a predefined filter or query for the topics: 
You can access these headings from the device inventory:

- Critical devices
- Critical devices with high risk
- Highly exposed critical devices
- Internet-facing critical devices

The following are accessible in advanced hunting:

- Critical identities
- Critical cloud resources  

:::image type="content" source="./media/critical-asset-management-devices-advanced-hunting.png" alt-text="Screenshot of the Security Exposure Management Overview view in device inventory and advanced hunting section":::

### Recent security events

The Recent security events section displays security events from the past week  sorted by all events or by either initiatives or metrics drift. Select the **View all events** button to view a complete list of all events occurring in your organization.

## Connect to non-Microsoft data sources

Use data connectors to link to third-party data sources to enrich your exposure management context, findings, and insights. Using data connectors allows you to ingest non-Microsoft tools to the enterprise exposure graph. Currently, you can connect the following data sources:

- ServiceNow
- Qualys
- Rapid7
<!--
[Data connectors](https://security.microsoft.com/exposure-data-connectors) can be found in the  [Microsoft Defender portal](https://security.microsoft.com).

Select **Connect** to enter the connection information needed. Each vendor could have different connection requirements. For instance, Rapid7 requires an API key and Endpoint information. Once the data source is connected, you can select **Status** to review its status.
-->
## Next steps

- [Explore cross-workload attack surfaces](attack-surface-management-overview.md)
- [Review organizational exposure](review-organizational-exposure.md)
- [Identify and manage critical assets](critical-asset-management.md)
- [Improve security insights with exposure insights](exposure-insights-overview.md)
- [!INCLUDE [support](../includes//support.md)]
