---
title: Stop SAP data collection
titleSuffix: Microsoft Sentinel
description: Learn how to stop Microsoft Sentinel from collecting data from your SAP applications when you use the agentless data connector.
ms.author: monaberdugo
author: mberdugo
ms.topic: how-to
ms.date: 08/04/2026
ai-usage: ai-assisted
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
#customerIntent: As an SAP admin, I want to stop Microsoft Sentinel from collecting data from our SAP applications.
ms.custom: msecd-doc-authoring-1014
---

# Stop SAP data collection in Microsoft Sentinel for SAP applications

There might be instances where you need to halt data collection from your SAP applications by the Microsoft Sentinel agentless data connector, whether for maintenance, troubleshooting, or other administrative reasons.

Stopping data collection has two parts:

1. Disable or remove the agentless data connector so Microsoft Sentinel stops polling your SAP system.
1. Reverse the SAP-side configuration you applied when you [prepared your SAP system](preparing-sap.md), if you no longer plan to ingest SAP data.

## Prerequisites

Before you stop data collection from your SAP applications, ensure you have administrative access to:

- The Log Analytics workspace that's enabled for Microsoft Sentinel. For more information, see [Roles and permissions in Microsoft Sentinel](../roles.md).
- Your SAP system, so you can reverse the ABAP role and connectivity configuration.
- Your SAP Cloud Integration tenant, so you can pause or undeploy the **Data Collector** integration flow.

## Stop log ingestion

To stop ingestion without permanently removing the connector, pause the **Data Collector** integration flow in SAP Cloud Integration. Microsoft Sentinel stops receiving new records until you redeploy the integration flow.

To stop ingestion permanently:

1. In Microsoft Sentinel, select **Configuration** > **Data connectors** and search for **Microsoft Sentinel for SAP - agentless**.
1. Select the data connector row and then select **Open connector page** in the side pane.
1. Under **Configuration**, remove each configured SAP system (SID). Removing every SID stops ingestion and billing for those systems.
1. Undeploy the **Data Collector** integration flow from SAP Cloud Integration.
1. Optionally, delete the data collection rule (DCR), data collection endpoint (DCE), and the Entra ID app registration that were created for the connector.

## Remove the user role from your ABAP system

If you're stopping ingestion and don't plan to reconnect, remove the ABAP user, the **MSFTSEN_SENTINEL_READER** role, and any optional Change Requests you installed while preparing your SAP system.

## Related content

- [Configure your SAP system for the Microsoft Sentinel solution](preparing-sap.md)
- [Connect your SAP system to Microsoft Sentinel](deploy-data-connector-agentless.md)
