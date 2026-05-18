---
title: FAQs related to Microsoft Defender Experts coverage for servers and cloud workloads
ms.reviewer:
description: Frequently asked questions related to server and cloud workload coverage in Microsoft Defender Experts
ms.service: defender-experts-for-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
ms.topic: faq
ms.custom: 
- cx-ti
- cx-dex
ms.date: 05/18/2026
---

# Understanding Defender Experts coverage for servers and cloud workloads

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

The following section lists down questions you or your SOC team might have regarding Microsoft Defender Experts coverage for servers and cloud workloads.

| Questions | Answers |
|---------|---------|
|**Can I configure which servers the Defender Experts will cover?** | This service covers **all** your servers in your tenant that have [Defender for Servers](/azure/defender-for-cloud/defender-for-servers-overview) protection enabled in Defender for Cloud. |
|**Do the Defender Experts investigate all Defender for Servers alerts?** | The Defender for Servers plan in Defender for Cloud covers multicloud servers, such as Microsoft Azure, Amazon Web Services, and Google Cloud Platform, provided the Microsoft Defender for Endpoint is installed on the servers. All Defender for Servers P1 and P2 alerts (Detection Source = Microsoft Defender for Servers) are in scope except for [DNS alerts](/azure/defender-for-cloud/alerts-dns) due to limited data available for investigation.  |
|**I only have Microsoft Defender Endpoint. How can I get server coverage?** | If you have servers that have Defender for Endpoint deployed on them with a Microsoft Defender for Endpoint for Server license, you can get the server coverage through the Defender Experts for XDR service. The service doesn't cover Microsoft Defender for Cloud workloads. [Learn more](before-you-begin-xdr.md#product-configuration-and-service-coverage)<br><br>If you want coverage for servers in Defender for Cloud, you need to avail the Microsoft Defender Experts for Servers or Defender Experts for Hunting - Servers. |


### See also

- [General information on Defender Experts for XDR service](frequently-asked-questions.md)
- [General information on Microsoft Defender Experts for Hunting service](faq-defender-experts-hunting.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
