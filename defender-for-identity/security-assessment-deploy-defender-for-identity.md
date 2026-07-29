---
title: Start your Defender for Identity deployment security assessment
description: Learn how the Start your Defender for Identity deployment assessment helps identify missing sensor installations on domain controllers and other eligible servers.
ms.date: 06/15/2026
ms.topic: how-to
ms.reviewer: rlitinsky
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Security assessment: Start your Defender for Identity deployment

This article describes the **Start your Defender for Identity deployment** security assessment, which encourages you to install sensors on domain controllers and other eligible servers.

## Why is not having Defender for Identity deployed considered a risk?

If you've obtained a Defender for Identity license, but haven't yet deployed Defender for Identity sensors, not only are you not yet using your purchased services, but you may be missing advanced threats in your identity infrastructure.

Defender for Identity uses your on-premises Active Directory signals to identify, detect, and investigate advanced threats, compromised identities, and malicious insider actions directed at your organization.

Defender for Identity is also part of monitoring for Zero Trust. You may also want to use [advanced hunting queries in Microsoft Defender](/microsoft-365/security/defender/advanced-hunting-overview) to look for threats in identities, devices, and cloud apps.

For more information, see:

- [What is Microsoft Defender for Identity?](what-is.md)
- [Zero Trust with Defender for Identity](zero-trust.md)

## How do I use this security assessment?

Use the following steps to review this assessment and remediate it.

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to be alerted if you have a Defender for Identity license, but don't have Defender for Identity deployed.

1. Take appropriate action by deploying Defender for Identity. For more information, see [Deploy Microsoft Defender for Identity with Microsoft Defender XDR](deploy-defender-identity.md).

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours.  While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.
>

<a name="see-also"></a>
## Related content

- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Microsoft Defender for Identity community forum](<https://aka.ms/MDIcommunity>)
