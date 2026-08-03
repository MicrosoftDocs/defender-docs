---
title: Before you begin using the Microsoft Defender Experts MDR service
ms.reviewer:
description: To enable us to get started with the Defender Experts managed service, we require the following licensing prerequisites
ms.service: defender-experts-for-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - essentials-compliance
ms.topic: concept-article
ms.custom: 
- cx-ti
- cx-dex
- msecd-doc-authoring-1018
ms.date: 07/29/2026
ai-usage: ai-assisted
---

# Before you begin using Defender Experts MDR

**Applies to:**

- [Microsoft Defender Experts MDR](defender-experts-mdr-overview.md)

This article outlines the key prerequisites you must meet and essential information you must know before purchasing the Microsoft Defender Experts MDR and Microsoft Defender Experts for Servers services.

## Licensing and service onboarding prerequisites 

Defender Experts MDR is a separate service from your existing Defender products. To be eligible for Defender Experts and to enable us to get started with this managed service, see the service requirements at [Microsoft Product Terms](https://www.microsoft.com/licensing/terms/productoffering/MicrosoftDefenderExperts/EAEAS). 

### Service coverage prerequisites 

Defender Experts MDR provides managed detection and response across any combination of the following Microsoft Defender products: 

- Microsoft Defender for Endpoint P2 
- Microsoft Defender for Office 365 P2 
- Microsoft Defender for Identity 
- Microsoft Defender for Cloud Apps 
- Microsoft Entra ID P2 

You must license and deploy at least one of the listed Microsoft Defender products, or Microsoft Entra ID P2, in active mode to receive Defender Experts coverage. 

While Microsoft Entra ID P1 is a requirement for service eligibility, to provide identity-based service coverage, Microsoft Entra ID P2 is required. Entra ID P2 provides advanced identity protection capabilities and additional identity telemetry that Defender Experts relies on to detect and respond to identity-based threats. 

The following product isn't covered by this service: 

- Microsoft Defender for IoT 

### Prerequisites to begin operations 

To begin service operations, you must license and deploy at least one of these products in active mode. Even if you don't configure some products, such as Defender for Endpoint, in active mode, Defender Experts can still provide coverage for the other eligible products in your environment. However, the depth of response might vary. For more information, see [Product configuration and service coverage](#product-configuration-and-service-coverage).

### Product configuration and service coverage

**Microsoft Defender Experts MDR**

Defender Experts MDR provides managed detection and response across Microsoft Defender products that you license and properly deploy in your environment.
While you can include all Defender products (except Defender for IoT) in the service, the depth of coverage might vary depending on how you configure each product. 
-	**Products deployed in active mode are fully covered.** Defender Experts investigate and respond to incidents involved in these products on your behalf.
-	**Products deployed in passive mode might be non-actionable by Defender Experts.** In such cases, guided response might still be provided, but no remediation actions are taken on your behalf.

Ensure that you deploy at least one product, such as Defender for Endpoint or Defender for Office 365, in active mode. This deployment enables Defender Experts to take direct action on high-priority threats, including advanced attacks like adversary-in-the-middle (AiTM).

For maximum, native coverage, deploy the full Microsoft Defender suite and enable all eligible products in active mode.

Defender Experts MDR also covers servers that have Defender for Endpoint deployed on them with a **Microsoft Defender for Endpoint for Server** license. For Defender Experts coverage, a server counts as a user account for billing. 
[Learn more about specific hardware and software requirements](/defender-endpoint/minimum-requirements)

### Ask Defender Experts

[Ask Defender Experts](defender-experts-hunting-ask-experts.md) is intended to provide a better understanding of complex threats affecting your organization. It focuses on products included in Microsoft Defender Experts services. [See sample questions you can ask Defender Experts](defender-experts-hunting-ask-experts.md#sample-questions-you-can-ask-from-defender-experts).

As part of the service's built-in [Microsoft Defender Experts Hunting](defender-experts-hunting-overview.md), customers are assigned 10 **Ask Defender Experts** credits, which you can use to submit questions, at the start of each calendar quarter. Unused credits from the current quarter roll up to the next one. You can use up to 20 credits only per quarter. All unused credits expire by the end of the calendar year or at the end of your subscription term, whichever comes first.

[Learn more about Microsoft's commercial licensing terms](https://www.microsoft.com/licensing/terms/productoffering/Microsoft365/MCA).

## Plan 2 prerequisites

Defender Experts MDR Plan 2 operates on the telemetry you collect in Microsoft Sentinel, so it has onboarding prerequisites and baseline criteria in addition to the requirements described earlier in this article. These prerequisites let the service detect and investigate reliably in the sources you want covered.

Plan 2 requires the following:

- A supported endpoint detection and response (EDR) product deployed on all endpoints.
- Supported email security and identity protection products deployed for all users. A basic identity and access management solution isn't sufficient. Assets without these products are considered uncovered.
- A supported cloud-native application protection platform (CNAPP) or cloud workload protection platform (CWPP) solution deployed for any cloud or on-premises infrastructure to be monitored.
- Data ingested through the built-in Microsoft Sentinel connectors into the standard Microsoft Sentinel tables.
- Appropriate access granted to Defender Experts for the Microsoft Sentinel workspaces to be monitored.
- Microsoft Sentinel connected to the Microsoft Defender portal. For more information, see [Connect Microsoft Sentinel to the Microsoft Defender portal](/azure/sentinel/move-to-defender).
- Baseline data configuration, including a 90-day Log Analytics retention period for data sources that require real-time detection and monitoring.
- User and Entity Behavior Analytics (UEBA) enabled for supported data sources.

For the non-Microsoft sources that Plan 2 covers, see [Third-party source coverage for Plan 2](defender-experts-mdr-overview.md#third-party-source-coverage-for-plan-2).

<!-- TODO: Product and engineering to verify this Plan 2 prerequisite list before the PR leaves draft. Specifically confirm: the 90-day Log Analytics retention requirement and which data sources it applies to; which data sources require UEBA; the least-privileged Azure role a customer needs to grant expert access to the primary workspace or resource group; and whether onboarding is limited to the primary Microsoft Sentinel workspace. -->

## Access requirements

Defender Experts MDR and Defender Experts for Servers request for certain roles and permissions for you to fully access the service capabilities. [Learn more](defender-experts-mdr-permissions.md)

## Service availability and data protection

Defender Experts MDR and Defender Experts for Servers are managed extended detection and response services that proactively hunt for threats across endpoints, email, identity, cloud apps, and servers. To carry out hunting on your behalf, Microsoft experts need access to your Microsoft Defender advanced hunting data. If you have the Defender Experts for Servers add-on service, they need to review [Microsoft Defender for Cloud alerts and incidents in the Defender portal](/azure/defender-for-cloud/concept-integration-365). By purchasing these services, you grant Microsoft experts permission to access this data.

The following sections provide additional information about the service's data usage, compliance, and availability. For more information about Microsoft's commitment to valuing and protecting your data, visit the [Trust Center](https://www.microsoft.com/trust-center/product-overview) and scroll down to **Additional products and services** > **Managed Security Services** > **Microsoft Defender Experts**.

### Data collection, usage, and retention

All data used for hunting from existing Defender services stays in your original Microsoft Defender service storage location. [Learn more](/microsoft-365/enterprise/o365-data-locations).

Defender Experts MDR operational data, such as case tickets and analyst notes, are generated and stored in a Microsoft data center in the European Union region for customers whose Defender data is in scope of EU data boundary and in the US region for other customers, irrespective of the Microsoft Defender service storage location. Data generated for the reporting dashboard is stored in your Microsoft Defender service storage location. Reporting data and operational data are retained for a grace period of no more than 90 days after your subscription expires. If you terminate your subscription, data is deleted within 30 days.

Microsoft experts hunt over [advanced hunting logs](../advanced-hunting-schema-tables.md) in Microsoft Defender advanced hunting tables. The data in these tables depend on the set of Defender services you enable (for example, Defender for Endpoint, Defender for Office 365, Defender for Identity, Defender for Cloud Apps, and Microsoft Entra ID). Experts also use a large set of internal threat intelligence data to inform their hunting and automation.

> [!NOTE]
> Microsoft Defender for Cloud is integrated with Microsoft Defender. This integration allows security teams to access Defender for Cloud alerts and incidents within the Microsoft Defender portal. The Defender Experts for Servers service accesses data through the Defender portal, so the same data collection, usage, and retention policies apply to this service.

### Security and compliance

When you purchase and onboard to Defender Experts MDR and Defender Experts for Servers, you grant Microsoft experts permission to access your advanced hunting data.

### Availability

Customers can access this service worldwide in commercial public clouds. To learn more, contact your Microsoft account team.

### Language

This service is currently available only in English.

### Next step

- [Get started with Microsoft Defender Experts MDR](defender-experts-mdr-get-started.md)

### See also

- [General information on Defender Experts MDR service](defender-experts-mdr-faq.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/defender-m3d-techcommunity.md)]
