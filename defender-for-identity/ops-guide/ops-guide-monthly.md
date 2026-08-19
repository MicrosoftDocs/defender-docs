---
title: Monthly Operational Guide - Microsoft Defender for Identity
description: Learn about the Microsoft Defender for Identity activities that we recommend for your team on a monthly basis.
ms.date: 07/02/2026
ms.topic: how-to
ms.reviewer: martin77s
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Monthly operational guide - Microsoft Defender for Identity

This article reviews the Microsoft Defender for Identity activities we recommend for your team on a monthly basis. These tasks include reviewing and adjusting alert tuning configurations and tracking new feature changes across Microsoft Defender XDR and Defender for Identity. This guide is intended for security administrators and SOC analysts responsible for maintaining an effective detection and response posture.

## Review tuned alerts and adjust tuning if needed

**Where**: In Microsoft Defender, select **Hunting > Advanced hunting**

**Persona**: Security and compliance administrators, SOC analysts

Microsoft Defender allows you to *tune* alerts, helping you reduce the number of alerts you need to triage. Tuning alerts resolves alerts automatically based on your configurations and rule conditions.

We recommend reviewing your tuning configurations regularly to make sure that they're still relevant and effective. For example:

- Check to see if your existing rules have matches as expected
- If a rule has no matches, consider whether you still need it or if you can remove it

For more information, see [Investigate Defender for Identity security alerts in Microsoft Defender](../manage-security-alerts.md).

<a name="track-new-changes-in-microsoft-defender-xdr-and-defender-for-identity"></a>
## Track new changes in Microsoft Defender and Defender for Identity

**Persona**: Security administrators, SOC analysts

Use the following resources to stay informed about recent changes and new features in Microsoft Defender XDR and Defender for Identity:

**Where**:

- In the Microsoft 365 admin center, select **Health > Message center**. For more information, see [Track new and changed features in the Microsoft 365 Message center](/microsoft-365/admin/manage/message-center).

- The [Microsoft Defender XDR monthly news](https://techcommunity.microsoft.com/t5/microsoft-defender-xdr-blog/bg-p/MicrosoftThreatProtectionBlog/label-name/Defender%20News).

- For details about Defender for Identity updates, see [What's new in Microsoft Defender for Identity](../whats-new.md).

## Related content

- [Microsoft Defender Security operations overview](/security/operations/overview)
- [Microsoft Defender for Identity operational guide](ops-guide.md)
- [Daily operational guide - Microsoft Defender for Identity](ops-guide-daily.md)
- [Weekly operational guide - Microsoft Defender for Identity](ops-guide-weekly.md)
- [Quarterly / Ad hoc operational guide - Microsoft Defender for Identity](ops-guide-quarterly.md)
