---
title: Integrate your SIEM tools with Microsoft Defender XDR
description: Learn how to use REST API and configure supported security information and events management tools to receive and pull detections.
ms.service: defender-xdr
ms.author: edbaynash
author: EdB-MSFT
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
ms.topic: how-to
ms.date: 06/16/2026
appliesto:
- Microsoft Defender for Endpoint   
- Microsoft Defender XDR
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Integrate your SIEM tools with Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

<a name='pull-microsoft-365-defender-incidents-and-streaming-event-data-using-security-information-and-events-management-siem-tools'></a>

## Pull Microsoft Defender incidents and streaming event data using security information and events management (SIEM) tools

> [!NOTE]
>
> - [Microsoft Defender Incidents](incident-queue.md) consists of collections of correlated alerts and their evidence.
> - [Microsoft Defender Streaming API](streaming-api.md) streams event data from Microsoft Defender to event hubs or Azure storage accounts.

Microsoft Defender supports security information and event management (SIEM) tools ingesting information from your enterprise tenant in Microsoft Entra ID using the OAuth 2.0 authentication protocol for a registered Microsoft Entra application representing the specific SIEM solution or connector installed in your environment.

For more information, see:

- [Microsoft Defender APIs license and terms of use](/legal/microsoft-365/api-terms)
- [Access the Microsoft Defender APIs](api-access.md)
- [Hello World example](api-hello-world.md)
- [Get access with application context](api-create-app-web.md)

There are two primary models to ingest security information:

1. Ingesting Microsoft Defender XDR incidents and their contained alerts from a REST API in Azure.

2. Ingesting streaming event data either through Azure Event Hubs or Azure Storage Accounts.

Microsoft Defender currently supports the following SIEM solution integrations:

- [Ingesting incidents from the incidents REST API](#ingesting-incidents-from-the-incidents-rest-api)
- [Ingesting streaming event data via Event Hubs](#ingesting-streaming-event-data-via-event-hubs)

## Ingesting incidents from the incidents REST API

The following SIEM solutions support ingesting Microsoft Defender XDR incidents and their contained alerts from the incidents REST API.

### Incident schema

For more information on Microsoft Defender incident properties including contained alert and evidence entities metadata, see [Schema mapping](api-list-incidents.md#schema-mapping).

<a name="splunk"></a>
### Ingest incidents into Splunk

Using the new, fully supported Splunk Add-on for Microsoft Security that supports:

- Ingesting incidents that contain alerts from the following products, which are mapped onto Splunk's Common Information Model (CIM):

  - Microsoft Defender
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Identity and Microsoft Entra ID Protection
  - Microsoft Defender for Cloud Apps

- Ingesting Defender for Endpoint alerts (from the Defender for Endpoint's Azure endpoint) and updating these alerts

- Support for updating Microsoft Defender Incidents and/or Microsoft Defender for Endpoint Alerts and the respective dashboards has moved to the Microsoft 365 App for Splunk.

For more information on:

- The Splunk Add-on for Microsoft Security, see the [Microsoft Security Add-on on Splunkbase](https://splunkbase.splunk.com/app/6207/#/overview)

- The Microsoft 365 App for Splunk, see the [Microsoft 365 App on Splunkbase](https://splunkbase.splunk.com/app/3786/)

<a name="micro-focus-arcsight"></a>
### Ingest incidents into Micro Focus ArcSight

The new SmartConnector for Microsoft Defender XDR ingests incidents into ArcSight and maps these onto its Common Event
Framework (CEF).

For more information on the new ArcSight SmartConnector for Microsoft Defender XDR, see [ArcSight Product Documentation](https://www.microfocus.com/documentation/arcsight/arcsight-smartconnectors-8.4/microsoft-365-defender/index.html).

The SmartConnector replaces the previous FlexConnector for Microsoft Defender for Endpoint that's now retired.

<a name="elastic"></a>
### Ingest incidents into Elastic

Elastic Security combines SIEM threat detection features with endpoint prevention and response capabilities in one solution.

The Elastic integration for Microsoft Defender XDR and Defender for Endpoint enables organizations to leverage incidents and alerts from Defender within Elastic Security to perform investigations and incident response. Elastic correlates this data with other data sources, including cloud, network, and endpoint sources using robust detection rules to find threats quickly.

For more information on the Elastic connector, see: [Microsoft M365 Defender | Elastic docs](https://docs.elastic.co/integrations/m365_defender)

## Ingesting streaming event data via Event Hubs

For streaming event data integrations, you must first stream events from your Microsoft Entra tenant to your Event Hubs or Azure Storage Account. For more information, see [Microsoft Defender XDR Streaming API](streaming-api.md).

For more information on the event types supported by the Streaming API, see [Microsoft Defender XDR supported streaming event types](supported-event-types.md).

<a name="splunk-1"></a>
### Stream event data to Splunk

Use the Splunk Add-on for Microsoft Cloud Services to ingest events from Azure Event Hubs.

For more information on the Splunk Add-on for Microsoft Cloud Services, see the [Microsoft Cloud Services Add-on on Splunkbase](https://splunkbase.splunk.com/app/3110/).

<a name="ibm-qradar"></a>
### Stream event data to IBM QRadar

Use the new IBM QRadar Microsoft Defender XDR Device Support Module (DSM) that calls the [Microsoft Defender Streaming API](streaming-api.md) that allows ingesting streaming event data from Microsoft Defender products via Event Hubs or Azure Storage Account. For more information on supported event types, see [Supported event types](supported-event-types.md).

<a name="elastic-1"></a>
### Stream event data to Elastic

For more information on the Elastic streaming API integration, see [Microsoft M365 Defender | Elastic docs](https://docs.elastic.co/integrations/m365_defender).

## Related content

[Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
