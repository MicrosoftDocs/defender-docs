---
title: Enable entity behavior analytics to detect advanced threats
description: Enable User and Entity Behavior Analytics in Microsoft Sentinel, and configure data sources
ms.author: guywild
author: guywi-ms
ms.reviewer: mshechter
ms.topic: how-to
ms.date: 06/15/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
ai-usage: ai-assisted


#Customer intent: As a security analyst, I want to configure User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel so that I can detect and analyze anomalous activities more effectively.

---

# Enable User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel

User and Entity Behavior Analytics (UEBA) in Microsoft Sentinel analyzes logs and alerts from connected data sources to build baseline behavioral profiles of your organization's entities—such as users, hosts, IP addresses, and applications. Using machine learning, UEBA identifies anomalous activity that might indicate a compromised asset.

You can enable UEBA and configure data sources directly from the UEBA tab. See [Access UEBA from the UEBA tab](#access-ueba-from-ueba-tab).

This article explains how to enable UEBA and configure data sources from your Microsoft Sentinel workspace settings and from supported data connectors.

For more information about UEBA, see [Identify threats with entity behavior analytics](identify-threats-with-entity-behavior-analytics.md).

[!INCLUDE [reference-to-feature-availability](includes/reference-to-feature-availability.md)]
[!INCLUDE [unified-soc-preview](includes/unified-soc-preview.md)]

## Prerequisites

To enable or disable User and Entity Behavior Analytics (UEBA) (these prerequisites aren't required to use UEBA):

- Your user must be assigned to the Microsoft Entra ID **Security Administrator** role in your tenant or the equivalent permissions.

- Your user must be assigned at least one of the following **Azure roles** ([Azure RBAC](roles.md)):

  - **Owner** at the resource group level or higher.
  - **Contributor** at the resource group level or higher.
  - (Least privileged) **Microsoft Sentinel Contributor** at the workspace level or higher and **Log Analytics Contributor** at the resource group level or higher.

- Your workspace must not have any Azure resource locks applied to it. For more information, see [Azure resource locking](/azure/azure-resource-manager/management/lock-resources).

> [!NOTE]
>
> - No special license is required to add UEBA functionality to Microsoft Sentinel, and there's no extra cost for using it.
> - However, since UEBA generates new data and stores it in new tables that UEBA creates in your Log Analytics workspace, **additional data storage charges** apply.

## Access UEBA from UEBA tab

To get to the **Entity behavior configuration** page:

1. From the Microsoft Defender portal navigation menu, select **System** >**Settings** > **Microsoft Sentinel**.
1. Select the **UEBA** tab.

:::image type="content" source="./media/enable-entity-behavior-analytics/entity-behavior-analytics-tab.png" alt-text="Screenshot of UEBA tab.":::

## Configure UEBA

To configure UEBA on the **Entity behavior configuration** page, complete the following steps:

1. On the **Entity behavior configuration** page, toggle on **Turn on UEBA feature**.

    :::image type="content" source="media/enable-entity-behavior-analytics/entity-behavior-analytics-configuration.png" alt-text="Screenshot of UEBA configuration settings." lightbox="media/enable-entity-behavior-analytics/entity-behavior-analytics-configuration.png":::

1. Select the directory services from which you want to synchronize user entities with Microsoft Sentinel.

    - **Active Directory** on-premises (Preview)
    - **Microsoft Entra ID**

    To sync user entities from on-premises Active Directory, you must onboard your Azure tenant to Microsoft Defender for Identity (either standalone or as part of Microsoft Defender XDR) and you must have the MDI sensor installed on your Active Directory domain controller. For more information, see [Microsoft Defender for Identity prerequisites](/defender-for-identity/prerequisites).

1. Select **Connect all data sources** to connect all eligible data sources, or select specific data sources from the list.

    You can only enable these data sources from the Defender and the Azure portals:
    - Signin Logs
    - Audit Logs
    - Azure Activity
    - Security Events

    You can enable these data sources from the Defender portal only:

    - AAD Managed Identity Signin logs (Microsoft Entra ID)
    - AAD Service Principal Signin logs (Microsoft Entra ID)
    - AWS CloudTrail
    - Device Logon Events
    - Okta CL
    - GCP Audit Logs

    For more information about UEBA data sources and anomalies, see [Microsoft Sentinel UEBA reference](./ueba-reference.md) and [UEBA anomalies](./anomalies-reference.md#ueba-anomalies).

    > [!NOTE]
    > After enabling UEBA, you can enable supported data sources for UEBA directly from the data connector pane, or from the Defender portal Settings page.

1. Select **Connect**. 

1. Enable anomaly detection in your Microsoft Sentinel workspace:

    1. From the Microsoft Defender portal navigation menu, select **Settings** > **Microsoft Sentinel** > **SIEM workspaces**.
    1. Select the workspace you want to configure.
    1. From the workspace configuration page, select **Anomalies** and toggle on **Detect Anomalies**. 

## Install the UEBA Essentials solution (optional)

The **UEBA Essentials** solution is a collection of dozens of prebuilt hunting queries curated and maintained by Microsoft security experts. The solution includes multicloud anomaly detection queries across Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and Okta.

Install the solution to get started quickly with threat hunting and investigations using UEBA data, instead of building these detection capabilities from scratch.

For more information, see [Install or update Microsoft Sentinel solutions](sentinel-solutions-deploy.md#install-or-update-content).

## Enable the UEBA behaviors layer

The UEBA behaviors layer generates enriched summaries of activity observed across multiple data sources. Unlike alerts or anomalies, behaviors don’t necessarily indicate risk - they create an abstraction layer that optimizes your data for investigations, hunting, and detection by enhancing clarity, context, and correlation.

For more information about the UEBA behaviors layer and how to enable it, see [Enable the UEBA behaviors layer in Microsoft Sentinel](../sentinel/entity-behaviors-layer.md). 

## Next steps

Learn how to investigate UEBA anomalies and use UEBA data in your investigations:

- [Investigate incidents with UEBA data](investigate-with-ueba.md)
- [UEBA data sources and table schemas](ueba-reference.md)
