---
title: View and manage incidents in Microsoft Defender for Business
description: View and manage alerts, respond to threats, manage devices, and review remediation actions on detected threats in Defender for Business.
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: bagol
audience: Admin
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 09/11/2025
ms.reviewer: nehabha
f1.keywords: NOCSH
ms.collection:
- SMB
- m365-security
- m365-initiative-defender-business
- tier1
---

# View and manage incidents in Microsoft Defender for Business

As threats are detected and alerts are triggered, incidents are created. Your company's security team can view and manage incidents in the Microsoft Defender portal. You must have appropriate permissions assigned to perform the tasks in this article. See [Security roles and permissions in Microsoft Defender for Business](mdb-roles-permissions.md).

**This article includes**:

- [How to monitor your incidents and alerts](#monitor-your-incidents--alerts)
- [Alert severity](#alert-severity)
- [Next steps](#next-steps)

## Monitor your incidents & alerts

1. In the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)), in the navigation pane, go to **Incidents & alerts**, and then select **Incidents**. Any incidents that were created are listed on the page.

   > [!IMPORTANT]
   > If you see an incident tagged with `Attack disruption`, it means an advanced attack was detected. See [Automatic attack disruption](mdb-attack-disruption.md).

2. Select an alert to open its flyout pane, where you can learn more about the alert.

   :::image type="content" source="media/mdb-incident-flyout.png" alt-text="Screenshot of incident selected with flyout open":::

3. In the flyout pane, you can do the following tasks:
   - See the alert title.
   - View a list of assets (such as devices or user accounts) that were affected.
   - Take available actions.
   - Use links to view more information and even open the details page for the selected alert.

> [!TIP]
> Defender for Business is designed to help you address detected threats by recommending actions you can take. When you view an alert, look for these suggestions. The detected threat severity and the level of risk to your company determines the alert severity.

## Alert severity

When a threat is detected, a severity level is assigned to each alert that is generated.

- Microsoft Defender Antivirus assigns an alert severity based on the absolute severity of a detected threat (such as malware) and the potential risk to an individual device (if infected).
- Defender for Business assigns an alert severity based on the following factors:
  - The severity of the detected behavior.
  - The actual risk to a device.
  - The potential risk to your company.

The following table lists a few examples of alerts and their severity levels:

|Scenario|Alert severity and reason|
|---|---|
|[Automated attack disruption](mdb-attack-disruption.md) detects an advanced attack, and contains devices or user accounts to help prevent the attack from proceeding.|**High**. Attack disruption capabilities help contain an attack so your IT/security team can address it.|
|Microsoft Defender Antivirus detects and stops a threat before it does any damage.|**Informational**. The threat was stopped before any damage was done.|
|Microsoft Defender Antivirus detects malware that was executing within your company. The malware is stopped and remediated.|**Low**. Although some damage might occur to an individual device, the malware no longer poses a threat to your company.|
|Defender for Business detects active malware. The malware is blocked almost immediately.|**Medium** or **High**. The malware poses a threat to individual devices and to your company.|
|Suspicious behavior is detected but no remediation actions are taken yet.|**Low**, **Medium**, or **High**. The severity depends on the degree to which the behavior poses a threat to your company.|

## Next steps

- [Learn about automatic attack disruption](mdb-attack-disruption.md)
- [Respond to and mitigate threats in Defender for Business](mdb-respond-mitigate-threats.md)
- [Review remediation actions in the Action center](mdb-review-remediation-actions.md)
- [View or edit device policies in Defender for Business](mdb-view-edit-create-policies.md)
