---
title: Connect Microsoft Sentinel to other Microsoft services with an API-based data connector
description: Learn the common setup concepts, connection methods, and requirements for API-based Microsoft service data connectors in Microsoft Sentinel.
ms.author: guywild
author: guywi-ms
ms.reviewer: ofshezaf
ms.topic: how-to
ms.date: 07/02/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#Customer intent: As a security engineer, I want to connect various Microsoft services to Microsoft Sentinel using API-based data connectors so that I can centralize and streamline security event monitoring and incident management.

---

# Connect Microsoft Sentinel to other Microsoft services with an API-based data connector

This article describes how to make API-based connections to Microsoft Sentinel. Microsoft Sentinel uses the Azure foundation to provide built-in, service-to-service support for data ingestion from many Azure and Microsoft 365 services, Amazon Web Services, and various Windows Server services. There are a few different methods through which API-based connections to Microsoft Sentinel are made.

The following requirements and steps apply to Microsoft Sentinel API-based data connectors.

[!INCLUDE [reference-to-feature-availability](includes/reference-to-feature-availability.md)]

## Prerequisites

Before you connect a service, make sure you meet the following prerequisites:

- You must have read and write permissions on the Log Analytics workspace.
- You must have a Security administrator role on your Microsoft Sentinel workspace's tenant, or the equivalent permissions.
- Data connector specific requirements:
  
  |Data connector  |Licensing, costs, and other prerequisites  |
  |---------|---------|
  |Microsoft Entra ID Protection   | - [Microsoft Entra ID P2 subscription](https://azure.microsoft.com/pricing/details/active-directory/)<br> - Other charges may apply      |
  |Dynamics 365     | - [Microsoft Dynamics 365 production license](/office365/servicedescriptions/microsoft-dynamics-365-online-service-description). Not available for sandbox environments.<br>- At least one user assigned a Microsoft/Office 365 [E1 or greater](/power-platform/admin/enable-use-comprehensive-auditing#requirements) license. <br>- Audit logging enabled in [Microsoft Purview](/purview/purview). See [Turn auditing on or off](/purview/audit-log-enable-disable). <br>- Audit logging enabled in your Microsoft Dataverse environment. See [Microsoft Dataverse and model-driven apps activity logging](/power-platform/admin/enable-use-comprehensive-auditing). <br>- Other charges may apply.   |
  |Microsoft Defender for Cloud Apps|For Cloud Discovery logs, [enable Microsoft Sentinel as your SIEM in Microsoft Defender for Cloud Apps](/cloud-app-security/siem-sentinel)|
  |Microsoft Defender for Endpoint|Valid license for [Microsoft Defender for Endpoint deployment](/microsoft-365/security/defender-endpoint/production-deployment)|
  |Microsoft Defender for Office 365|Valid license for [Office 365 ATP Plan 2](/microsoft-365/security/office-365-security/office-365-atp#office-365-atp-plan-1-and-plan-2)|
  |Microsoft 365|- Your Microsoft 365 deployment must be on the same tenant as your Microsoft Sentinel workspace.<br>- Other charges may apply.|
  |Microsoft Power BI|- Your Office 365 deployment must be on the same tenant as your Microsoft Sentinel workspace.<br>- Other charges may apply.|
  |Microsoft Purview Information Protection|- Your Office 365 deployment must be on the same tenant as your Microsoft Sentinel workspace.<br>- Other charges may apply.|
  |Microsoft Purview Insider Risk Management (IRM)    |- Valid subscription for Microsoft 365 E5/A5/G5, or their accompanying Compliance or IRM add-ons.<br>- [Microsoft Purview Insider Risk Management](/microsoft-365/compliance/insider-risk-management) fully onboarded, and [IRM policies](/microsoft-365/compliance/insider-risk-management-policies) defined and producing alerts.<br>- [Insider Risk Management settings for exporting alerts](/microsoft-365/compliance/insider-risk-management-settings#export-alerts-preview) configured to enable the export of IRM alerts to the Office 365 Management Activity API in order to receive the alerts through the Microsoft Sentinel connector. |



## Connect to Microsoft services via API-based connectors

To connect a Microsoft service by using an API-based connector, complete the following steps:

1. From the Microsoft Sentinel navigation menu, select **Data connectors**.

1. Select your service from the data connectors gallery, and then select **Open Connector Page** on the preview pane.

1. Select **Connect** to start streaming events and/or alerts from your service into Microsoft Sentinel.

1. If on the connector page there is a section titled **Create incidents - recommended!**, select **Enable** if you want to automatically create incidents from alerts.

You can find and query the data for each service using the table names listed under each connector's section on the [Data connectors reference](data-connectors-reference.md) page. For example, Microsoft Entra ID Protection data appears in the [Microsoft Entra ID Protection connector](data-connectors-reference.md#microsoft-entra-id-protection) section of that reference.

## Related content

For more information, see:

- [Microsoft Sentinel solutions catalog](sentinel-solutions-catalog.md)
- [Threat intelligence integration in Microsoft Sentinel](threat-intelligence-integration.md)
