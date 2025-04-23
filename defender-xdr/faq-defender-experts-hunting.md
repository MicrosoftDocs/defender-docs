---
title: FAQs related to Microsoft Defender Experts for Hunting service
ms.reviewer:
description: Frequently asked questions related to the Microsoft Defender Experts for hunting service
ms.service: defender-experts-for-hunting
ms.author: vpattnaik
author: vpattnai
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-get-started
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-ean
search.appverid: met150
ms.date: 01/12/2025
---

# General information on Microsoft Defender Experts for Hunting service

**Applies to:**

- [Microsoft Defender Experts for Hunting](defender-experts-for-hunting.md)
- [Microsoft Defender XDR](microsoft-365-defender.md)

The following section lists down questions your security operations center (SOC) team might have about the Microsoft Defender Experts for Hunting service:

| Questions | Answers |
|---------|---------|
| **What is the Microsoft Defender Experts for Hunting service?** | [Microsoft Defender Experts for Hunting](defender-experts-for-hunting.md) provides a proactive threat hunting service to identify threats in advance. <br><br>[Microsoft Defender Experts for XDR](dex-xdr-overview.md) also includes the proactive threat hunting offered by Defender Experts for Hunting.|
|**Does Defender Experts for Hunting use or require Microsoft Sentinel or a security information and event management (SIEM) platform?**| No. This service doesn't use any non-Microsoft data ingested either through Microsoft Sentinel or any other SIEM platform.|
|**What products does Defender Experts for Hunting operate on?**| Defender Experts for Hunting relies on event signals from Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Microsoft Defender for Cloud Apps, Microsoft Entra ID protection, and Microsoft Defender for Identity. It also relies on proprietary Microsoft Threat Intelligence sources. Any event definitions not authored by Microsoft Defender products, such as third-party events or detections, fall outside the scope of this service.|
|**What is the role of Defender Experts for Hunting in the context of a purple team (red team and blue team coordinated work stream) exercise?**| Defender Experts for Hunting is part of the blue team in a purple team exercise. It complements your internal hunting team by enhancing their capabilities rather than replacing them.|
|**What actions can your experts take during a hunting investigation that results in a Defender Experts Notification?**| During threat hunting investigations, our analysts refrain from taking direct actions on customer assets. Instead, they provide detailed information, including a threat summary and hunting queries that show the timeline of events for the identified attack, and remediation action recommendations. Defender Experts Notifications provide guidance on how you can review and address the novel threat.|
|**What types of incidents can your experts investigate?**| The Defender Experts for Hunting service specializes in addressing the evolving threat landscape, bridging industry knowledge gaps, and recommending the most effective ways to identify these threats. Our experts don't prioritize well-established threats that Microsoft Defender products address adequately. However, when a well-known tactic is employed to generate a novel attack, our experts identify both the novel and existing attack tactics diligently. [Learn more about novel attacks in our in the Microsoft Security Experts Blog](https://techcommunity.microsoft.com/tag/Defender%20Experts%20for%20Hunting?nodeId=board%3AMicrosoftSecurityExperts)|
|**Can your experts help me improve my security posture?**| The scope of the posture change recommendation is limited to the scope of a Defender Experts Notification and is limited to preventing the attack identified in the context of the notification.|
|**Can Defender Experts for Hunting help with an active compromise or vulnerability?**| No, Defender Experts currently don't provide incident response services.|
|**How can my organization participate in the Defender Experts for Hunting service?**| Reach out to your Microsoft representative to express your interest in Defender Experts for Hunting.|
|**Does Defender Experts for Hunting cover cloud servers that have Microsoft Defender for Endpoint deployed on them?**| Defender Experts for Hunting covers servers—whether on premises or on a hyperscale cloud service provider—that have Microsoft Defender for Endpoint deployed on them with a Microsoft Defender for Endpoint for Servers license. For Defender Experts coverage, a server is considered as a user seat for billing. The service doesn't cover Microsoft Defender for Cloud. [Learn more about specific hardware and software requirements](/defender-endpoint/minimum-requirements)|
|**Once I see a Defender Experts Notification, if I have questions, how do I communicate with the Defender Experts for Hunting team?**| The **Ask Defender Experts** option in the Microsoft Defender portal delivers swift and accurate responses to all your threat-hunting questions. However, this service is limited to questions related specifically to Defender Experts for Hunting. [Learn more about Ask Defender Experts](experts-on-demand.md)|
|**What kinds of inquiries could I submit in Ask Defender Experts?**| Ask Defender Experts is intended to provide a better understanding of complex threats affecting your organization. It focuses on products included in Microsoft Defender XDR (Defender for Endpoint, Defender for Office 365, Defender for Cloud Apps, and Defender for Identity). It doesn't answer inquiries related to custom detections in the above products (that is, non-Defender XDR and third-party cybersecurity products), bugs in your product experience in the Defender portal, and those related to security incident response services. [See some sample questions you can ask our Defender Experts](experts-on-demand.md#sample-questions-you-can-ask-from-defender-experts)|
|**What certifications does the Defender Experts for Hunting service have?**| Defender Experts for Hunting is certified for [HIPAA and ISO](/compliance/regulatory/offering-hipaa-hitech).|
|**How is customer data protected?**| For more information about Microsoft's commitment in valuing and protecting your data, see [Data collection, usage, and retention](before-you-begin-defender-experts.md#data-collection-usage-and-retention). You can also visit the [Trust Center](https://www.microsoft.com/en-us/trust-center/product-overview) then scroll down to **Additional products and services** > **Managed Security Services** > [**Microsoft Defender Experts**](https://aka.ms/trustcenter-defenderexperts).|
|**Does the hunting service offer real-time threat remediation with boots on ground?**| No, the hunting service doesn't cover real-time threat remediation.<br><br>Despite this, Microsoft provides professional on-site service through our [Microsoft Incident Response team](https://www.microsoft.com/en-us/security/business/microsoft-incident-response?msockid=2c408e0b54cc68301f9a9b55554869f3). This service requires a separate contract. We prioritize customer needs and have a swift turnaround time. Contact your Customer Service Account Manager for further assistance.|
|**Is there a graph API that can fetch Defender Experts Notifications content?**| Yes. For more information, see [Access incident notifications using Graph API](access-den-graph-api.md).|

### See also
- [Before you begin using Defender Experts for Hunting](before-you-begin-defender-experts.md)
- [Start using Defender Experts for Hunting](onboarding-defender-experts-for-hunting.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]