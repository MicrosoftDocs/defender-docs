---
title: Key infrastructure requirements before enrolling in the Microsoft Defender Experts for Hunting service
ms.reviewer:
description: This section outlines the key infrastructure requirements you must meet and important information on data access and compliance.
ms.service: defender-experts-for-hunting
ms.author: vpattnaik
author: vpattnai
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
  - m365-security
  - m365initiative-defender-endpoint
  - tier1
  - essentials-compliance
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-ean
search.appverid: met150
ms.date: 01/09/2025
---

# Before you begin using Defender Experts for Hunting

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)
- [Microsoft Defender Experts for XDR](dex-xdr-overview.md)

[Microsoft Defender Experts for Hunting](defender-experts-for-hunting.md) is a managed service that provides hunting capabilities for novel emerging threats that aren't yet well known in the industry. The analysts for the hunting service review trends in the threat actor evolution based on world-renowned Microsoft Threat Intelligence and Research. They then apply the insights they gather to hunt for emerging attack vectors within the customer ecosystem.

With deep product expertise powered by threat intelligence, we're uniquely positioned to help you:

1. Focus on novel threat actor evolution in the context of your ecosystem.
1. Get detailed, step-by-step, and actionable guidance from our experts so you can respond to these emerging threats.
1. [Seek assistance](#ask-defender-experts) from Defender Experts.

This document outlines the key infrastructure requirements you must meet and important information on data access and compliance you must know before purchasing the Microsoft Defender Experts for Hunting service. Microsoft understands that customers who use our managed services entrust us with their most valued asset, their data.

## Eligibility and licensing

Defender Experts for Hunting is a separate service from your existing Microsoft Defender products. Before enrolling in this service, make sure that you have the necessary license and access.

We require the following licensing prerequisites to enable us to get started with this threat hunting service:

- Microsoft Defender for Endpoint P2 must be licensed and enabled on eligible devices
- Microsoft Defender Antivirus must be licensed and enabled in active mode on devices onboarded to Defender for Endpoint (required for endpoint detection)

The following products are also eligible to get Defender Experts for Hunting coverage, and you must have their appropriate product licenses to get started with the service:

- Microsoft Defender for Office 365 P2
- Microsoft Defender for Identity
- Microsoft Defender for Cloud Apps

The following product is **not** covered by this service:

- Microsoft Defender for IoT
- Other Microsoft services not mentioned in the previous lists

### Defender Experts for Hunting coverage

Defender Experts for Hunting relies on event signals from Defender for Endpoint, Defender for Office 365, Defender for Cloud Apps, Defender for Identity. It also relies on proprietary Microsoft Threat Intelligence sources.

This service also covers servers—whether on premises or on a hyperscale cloud service provider—that have Defender for Endpoint deployed on them with a Microsoft Defender for Endpoint for Servers license.

Any detection that's not from Microsoft Defender products (for example, detections from other security vendors) isn't within the scope of Defender Experts for Hunting.

### Ask Defender Experts

[Ask Defender Experts](experts-on-demand.md) is intended to provide a better understanding of complex threats affecting your organization. It focuses on products included in Microsoft Defender XDR (Defender for Endpoint, Defender for Office 365, Defender for Cloud Apps, and Defender for Identity). [See sample questions you can ask Defender Experts](experts-on-demand.md#sample-questions-you-can-ask-from-defender-experts).

Defender Experts for Hunting customers are assigned 10 Ask Defender Experts credits, which you can use to submit questions, at the start of each calendar quarter. Unused credits from the current quarter roll up to the next one. You can use up to 20 credits only per quarter. All unused credits expire by the end of the calendar year or at the end of your subscription term, whichever comes first. 

[Learn more about Microsoft's commercial licensing terms](https://www.microsoft.com/licensing/terms/productoffering/Microsoft365/MCA)

## Access requirements

Anyone from your organization can [apply for the Defender Experts for Hunting service](#apply-for-microsoft-defender-experts-for-hunting-service). However, you need to work with your Commercial Executive to transact the SKU. 

You might need certain roles and permissions to fully access the service capabilities. Refer to [Custom roles in role-based access control for Microsoft Defender XDR](custom-roles.md) for details.

## Service availability and data protection

Defender Experts for Hunting is a managed threat hunting service that proactively hunts for threats across endpoints, email, identity, and cloud apps. To carry out hunting on your behalf, Microsoft experts need access to your Microsoft Defender XDR advanced hunting data. Enrolling in this service means you're granting permission to Microsoft experts to access the said data.

The following sections enumerate additional information about the service's data usage, compliance, and availability. For more information about Microsoft's commitment in valuing and protecting your data, visit the [Trust Center](https://www.microsoft.com/trust-center/product-overview) then scroll down to **Additional products and services** > **Managed Security Services** > [**Microsoft Defender Experts**](https://aka.ms/trustcenter-defenderexperts).

### Data collection, usage, and retention

All data used for hunting from existing Defender services will continue to reside in the customer's original Microsoft Defender XDR service storage location. [Learn more](/microsoft-365/enterprise/o365-data-locations)

Defender Experts for Hunting operational data, such as case tickets and analyst notes, are generated and stored in a Microsoft data center in the US region for US customers and in the European Union for EU customers, for the length of the service, irrespective of the Microsoft Defender XDR service storage location. Data generated for the reporting dashboard is stored in customer's Microsoft Defender XDR service storage location. Reporting data and operational data will be retained for a grace period of no more than 90 days after a customer's subscription expires. If the customer terminates their subscription, data will be deleted within 30 days.

Microsoft experts hunt over [advanced hunting logs](advanced-hunting-schema-tables.md) in Microsoft Defender XDR advanced hunting tables. The data in these tables depend on the set of Defender services the customer is enabled for (for example, Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Microsoft Defender for Identity, Microsoft Defender for Cloud Apps, and Microsoft Entra ID). Experts also use a large set of internal threat intelligence data to inform their hunting and automation.

### Security and compliance

When you purchase and onboard to Defender Experts for Hunting, you're granting permission to Microsoft experts to access your advanced hunting data.

### Availability

This service is available worldwide for customers in our commercial public clouds. It's currently not available to customers in government and sovereign clouds.

### Languages

This service is currently delivered in English language only.

## Apply for Microsoft Defender Experts for Hunting service 

You can apply for the Defender Experts for Hunting by performing the following steps: 

1. Complete the [customer interest form](https://aka.ms/DEX4HuntingCustomerInterestForm).  
2. Enter your name, company name, and company email ID. 
3. Select **Submit**. Someone from our sales team will reach out within five business days. 

### Next step

- [Start using Defender Experts for Hunting](onboarding-defender-experts-for-hunting.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
