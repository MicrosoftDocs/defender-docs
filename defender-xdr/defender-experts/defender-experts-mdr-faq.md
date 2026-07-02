---
title: FAQs related to Microsoft Defender Experts MDR
ms.reviewer:
description: Frequently asked questions related to Defender Experts MDR
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
ms.date: 08/01/2025
---

# General information on Defender Experts MDR service

**Applies to:**

- [Microsoft Defender](../microsoft-365-defender.md)

| Questions | Answers |
|---------|---------|
| **How is Microsoft Defender Experts MDR different from Microsoft Defender Experts Hunting?** | [Microsoft Defender Experts Hunting](defender-experts-hunting-overview.md) provides proactive threat hunting service to proactively find threats. This service is meant for customers that have a robust security operations center and want that deep expertise in hunting to expose advanced threats. Microsoft Defender Experts MDR provides end-to-end security operations capabilities to monitor, investigate, and respond to security alerts. This service is meant for customers with constrained security operations centers (SOCs) that are overburdened with alert volume, in need of skilled experts, or both. Defender Experts MDR also includes the proactive threat hunting offered by Defender Experts Hunting|
| **Does Defender Experts MDR require Microsoft Sentinel?** | No. Defender Experts can use Microsoft Defender data in customers' original locations for each Microsoft Defender product deployed.<br><br>A Sentinel instance is only required if you want to enrich Defender Experts MDR with third-party network signals. [Learn more](defender-experts-mdr-third-party-enrichment.md)|
| **What products does Defender Experts MDR operate on?** | Refer to [Before you begin using Defender Experts MDR](defender-experts-mdr-prerequisites.md) for details. |
| **Does Defender Experts MDR replace my SOC team?** | Defender Experts MDR currently provide coverage for Microsoft Defender incidents. It's the ideal way to augment your SOC team, reduce their workload, and collaborate with them to protect your organization from activity groups. |
| **What actions can your experts take during incident investigation?** | Our expert analysts can take actions based on the roles granted to them in your Microsoft Defender portal. If our analysts are granted a security reader role, they can investigate and provide managed response for your SOC team to act on. If our analysts are granted a security operator role, they can also take specific remediation actions agreed upon with your SOC team. |
| **What types of incidents can your experts investigate?** | Defender Experts MDR covers incidents categorized as High or Medium severity in Windows, Linux, and macOS devices. Incidents categorized as Compliance, Data Loss Prevention (DLP), or Custom Detections and those affecting internet of things (IoT), iOS, or Android devices are outside the service's scope. |
| **Can your experts help me improve my security posture?** | Yes, our experts provide necessary guidance regularly to improve your security posture.
| **Can Defender Experts MDR help with an active compromise or vulnerability?** | No, Defender Experts currently don't provide incident response services. Contact your Microsoft representative or fill out the [Experiencing a Cybersecurity Incident?](https://customervoice.microsoft.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbRypQlJUvhTFIvfpiAfrpFQdUOTdRRFpDUFQ1TzNLVFZXV0VUOVlVN0szUiQlQCN0PWcu) form to engage Microsoft Defender Experts Cybersecurity Incident Response for incident response assistance. |
| **How can my organization participate in the Defender Experts MDR and Microsoft Defender Experts for Servers services?** | Contact your Microsoft representative to express interest in Defender Experts MDR and Defender Experts for Servers services.|
|**How is AI used in the Defender Experts service?**| AI is used to support the Defender Experts service by enhancing the speed, scale, and consistency of security operations. We use a combination of generative, agentic, and foundational AI to power workflows such as incident triage, investigation, and summarization by analyzing signals like telemetry and historical analyst actions. Defender Experts analysts review and validate these AI-generated insights to ensure quality and accuracy. AI helps scale expert capabilities, and human analysts remain central to the service, ensuring customers receive trusted outcomes.|


### See also

[How Microsoft Defender Experts MDR permissions work](defender-experts-mdr-permissions.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/defender-m3d-techcommunity.md)]
