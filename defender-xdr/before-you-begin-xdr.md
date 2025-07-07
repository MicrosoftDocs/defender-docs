---
title: Before you begin using the Microsoft Defender Experts for XDR service
ms.reviewer:
description: To enable us to get started with the defender experts managed service, we require the following licensing prerequisites
ms.service: defender-experts-for-xdr
ms.author: vpattnaik
author: vpattnai
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-compliance
ms.topic: concept-article
ms.custom: 
- cx-ti
- cx-dex
search.appverid: met150
ms.date: 07/04/2025
---

# Before you begin using Defender Experts for XDR

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

This document outlines the key prerequisites you must meet and essential information you must know before purchasing the Microsoft Defender Experts for XDR service.

## Prerequisites and licensing

Defender Experts for XDR is a separate service from your existing Defender products. To enable us to get started with this managed service, we require the following licensing prerequisites:

-	Microsoft Entra ID P1 must be licensed for all users and enabled (required for enabling secure service provider access).
-	**At least one** Microsoft Defender product (Microsoft Defender for Endpoint, Microsoft Defender for Office 365 P2, Microsoft Defender for Identity, or Microsoft Defender for Cloud Apps) must be licensed and deployed in active mode.

### Product Eligibility

Defender Experts for XDR provides managed detection and response across any combination of the following Microsoft Defender products:
-	Defender for Endpoint
-	Defender for Office 365 P2
-	Defender for Identity
-	Defender for Cloud Apps

To begin service operations, at least one of these products must be appropriately licensed and deployed in active mode. Even if some products—such as Defender for Endpoint—aren't configured in active mode, Defender Experts can still provide coverage for the other eligible products in your environment. However, the depth of response might vary. For more information, see [Product configuration and service coverage](#product-configuration-and-service-coverage).

The following product isn't covered by this service:
-	Microsoft Defender for IoT

### Product configuration and service coverage
Defender Experts for XDR provides managed detection and response across Microsoft Defender products that are licensed and properly deployed in your environment.
While all Defender products (except Defender for IoT) can be included in the service, the depth of coverage might vary depending on how each product is configured. 
-	**Products deployed in active mode are fully covered.** Defender Experts investigate and respond to incidents involved in these products on your behalf.
-	**Products deployed in passive mode might be non-actionable by Defender Experts.** In such cases, guided response might still be provided, but no remediation actions are taken on your behalf.

We recommend ensuring that at least one product, such as Defender for Endpoint or Defender for Office 365, is deployed in active mode. This enables Defender Experts to take direct action on high-priority threats, including advanced attacks like adversary-in-the-middle (AiTM).

For maximum, native coverage, we recommend deploying the full Microsoft Defender XDR suite and enabling all eligible products in active mode.


### Server coverage

Defender Experts for XDR also covers servers—whether on premises or on a hyperscale cloud service provider—that have Defender for Endpoint deployed on them with a Microsoft Defender for Endpoint for Server license. For Defender Experts coverage, a server is considered as a user account for billing. The service doesn't cover Microsoft Defender for Cloud workloads.
[Learn more about specific hardware and software requirements](/defender-endpoint/minimum-requirements).

### Ask Defender Experts

[Ask Defender Experts](experts-on-demand.md) is intended to provide a better understanding of complex threats affecting your organization. It focuses on products included in Microsoft Defender XDR (Defender for Endpoint, Defender for Office 365, Defender for Cloud Apps, and Defender for Identity). [See sample questions you can ask Defender Experts](experts-on-demand.md#sample-questions-you-can-ask-from-defender-experts).

As part of the service's built-in [Microsoft Defender Experts for Hunting](defender-experts-for-hunting.md), customers are assigned 10 **Ask Defender Experts** credits, which you can use to submit questions, at the start of each calendar quarter. Unused credits from the current quarter roll up to the next one. You can use up to 20 credits only per quarter. All unused credits expire by the end of the calendar year or at the end of your subscription term, whichever comes first.

[Learn more about Microsoft's commercial licensing terms](https://www.microsoft.com/licensing/terms/productoffering/Microsoft365/MCA).

## Access requirements

Work with your Commercial Executive to transact the Defender Experts for XDR SKU.

Defender Experts for XDR requests for certain roles and permissions for you to fully access the service capabilities. [Learn more](dex-xdr-permissions.md).

## Service availability and data protection

Defender Experts for XDR is a managed extended detection and response service that proactively hunts for threats across endpoints, email, identity, and cloud apps. To carry out hunting on your behalf, Microsoft experts need access to your Microsoft Defender XDR advanced hunting data. Purchasing this service means you're granting permission to Microsoft experts to access the said data.

The following sections enumerate additional information about the service's data usage, compliance, and availability. For more information about Microsoft's commitment in valuing and protecting your data, visit the [Trust Center](https://www.microsoft.com/en-us/trust-center/product-overview) then scroll down to **Additional products and services** > **Managed Security Services** > **Microsoft Defender Experts**.

### Data collection, usage, and retention

All data used for hunting from existing Defender services will continue to reside in the customer's original Microsoft Defender XDR service storage location. [Learn more](/microsoft-365/enterprise/o365-data-locations).

Defender Experts for XDR operational data, such as case tickets and analyst notes, are generated and stored in a Microsoft data center in the European Union region for customers whose Defender XDR data is in scope of EU data boundary and in the US region for other customers, irrespective of the Microsoft Defender XDR service storage location. Data generated for the reporting dashboard is stored in customer's Microsoft Defender XDR service storage location. Reporting data and operational data will be retained for a grace period of no more than 90 days after a customer's subscription expires. If the customer terminates their subscription, data will be deleted within 30 days.

Microsoft experts hunt over [advanced hunting logs](advanced-hunting-schema-tables.md) in Microsoft Defender XDR advanced hunting tables. The data in these tables depend on the set of Defender services the customer is enabled for (for example, Defender for Endpoint, Defender for Office 365, Defender for Identity, Defender for Cloud Apps, and Microsoft Entra ID). Experts also use a large set of internal threat intelligence data to inform their hunting and automation.

### Security and compliance

When you purchase and onboard to Defender Experts for XDR, you're granting permission to Microsoft experts to access your advanced hunting data.

### Availability

This service is available worldwide for our customers in our commercial public clouds. If you're interested to learn more, reach out to your Microsoft account team.

### Language

This service is currently delivered in English language only.

### Next step

- [Get started with Microsoft Defender Experts for XDR](get-started-xdr.md)

### See also

- [General information on Defender Experts for XDR service](frequently-asked-questions.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
