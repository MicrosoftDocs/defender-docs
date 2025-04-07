---
title: Overview of management and APIs
ms.reviewer:
description: Learn about the management tools and API categories in Microsoft Defender for Endpoint
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 03/01/2025
---

# Overview of management and APIs

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint](../microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business) (for supported capabilities)

Defender for Endpoint supports a wide variety of deployment, configuration, and reporting options to ensure that customers can easily adopt the platform. Acknowledging that customer environments and structures can vary, Defender for Endpoint was created with flexibility and granular control to fit varying customer requirements. Defender for Business provides similar capabilities, designed especially for small and medium-sized businesses.

## Endpoint onboarding and portal access

Device onboarding is fully integrated into Microsoft Intune and Microsoft Configuration Manager for client devices. You can onboard both client and server devices using the Microsoft Defender portal. Or, for servers, you can use Defender for Cloud, which integrates with Defender for Endpoint and Defender for Business. (Server licenses are required; for more information, see [Onboard servers to Defender for Endpoint](/defender-endpoint/onboard-server) and [Onboard devices to Defender for Business](/defender-business/mdb-onboard-devices).)

The Microsoft Defender portal provides your security team with a robust, end-to-end experience for configuration, deployment, and monitoring. In addition, Microsoft Defender for Endpoint supports Group Policy and other non-Microosft tools used for managing devices.

Defender for Endpoint provides fine-grained control over what users with access to the portal can see and do through the flexibility of role-based access control (RBAC). The RBAC model supports all flavors of security teams structure:

- Globally distributed organizations and security teams
- Tiered model security operations teams
- Fully segregated divisions with single centralized global security operations teams

## Available APIs

Defender for Endpoint is built on top of an integration-ready platform. 

Defender for Endpoint exposes much of its data and actions through a set of programmatic APIs. Those APIs enable you to automate workflows and innovate based on Defender for Endpoint capabilities. You can also use the Defender for Endpoint APIs with Defender for Business for the capabilities that are supported in Defender for Business.

:::image type="content" source="../media/mdatp-apis.png" alt-text="The available API and integration in Microsoft Defender for Endpoint" lightbox="../media/mdatp-apis.png":::

The Defender for Endpoint APIs can be grouped into three:

- Microsoft Defender for Endpoint APIs
- Raw data streaming API
- SIEM integration

## Microsoft Defender for Endpoint APIs

Defender for Endpoint offers a layered API model exposing data and capabilities in a structured, clear, and easy to use model, exposed through a standard Azure  AD-based authentication and authorization model allowing access in context of users or SaaS applications. The API model was designed to expose entities and capabilities in a consistent form.

Watch this video for a quick overview of Defender for Endpoint's APIs.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=f6300637-b48e-49d7-aa76-2778a711ae6c]

The **Investigation API** exposes the richness of Defender for Endpoint - exposing calculated or 'profiled' entities (for example, device, user, and file) and discrete events (for example, process creation and file creation) which typically describes a behavior related to an entity, enabling access to data via investigation interfaces allowing a query-based access to data. For more information, see [Supported APIs](exposed-apis-list.md).

The **Response API** exposes the ability to take actions in the service and on devices, enabling customers to ingest indicators, manage settings, alert status, as well as take response actions on devices programmatically such as isolate devices from the network, quarantine files, and others.

## Raw data streaming API

Defender for Endpoint raw data streaming API provides the ability for customers to ship real-time events and alerts from their instances as they occur within a single data stream, providing a low latency, high throughput delivery mechanism.

The Defender for Endpoint event information is pushed directly to Azure storage for long-term data retention, or to Azure Event Hubs for consumption by visualization services or other data processing engines.

For more information, see [Raw data streaming API](raw-data-export.md).

The new Microsoft Defender XDR Streaming API includes email and alert events in addition to device events.
For more information, see [Microsoft Defender XDR Streaming API](/defender-xdr/streaming-api).

## SIEM API

When you enable security information and event management (SIEM) integration, you can pull detections from Microsoft Defender XDR using your SIEM solution or by connecting directly to the detections REST API. This activates the SIEM connector access details section with pre-populated values and an application is created under your Microsoft Entra tenant. 

## Related articles

- [Access the Microsoft Defender for Endpoint APIs](apis-intro.md)
- [Supported APIs](exposed-apis-list.md)
- [Technical partner opportunities](../partner-integration.md)
- [Resources for Microsoft partners working with small and medium-sized businesses](/defender-business/mdb-partners)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
