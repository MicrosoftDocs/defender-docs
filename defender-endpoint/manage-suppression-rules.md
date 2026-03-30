---
title: Manage Microsoft Defender for Endpoint suppression rules
description: You might need to prevent alerts from appearing in the portal by using suppression rules. Learn how to manage your suppression rules in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
ms.subservice: edr
search.appverid: met150
ms.date: 06/25/2024
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Manage suppression rules



There might be scenarios where you need to suppress alerts from appearing in the portal. You can create suppression rules for specific alerts that are known to be innocuous such as known tools or processes in your organization. For more information on how to suppress alerts, see [Suppress alerts](/defender-xdr/investigate-alerts?toc=/defender-endpoint/toc.json&bc=/defender-endpoint/breadcrumb/toc.json#manage-alerts).

You can view a list of all the suppression rules and manage them in one place. You can also turn an alert suppression rule on or off.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

1. Sign in to the [Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2077139) using an account with the Security administrator or Global Administrator role assigned.

1. In the navigation pane, select **Settings** \> **Endpoints** \> **Rules** \> **Alert suppression**. The list of suppression rules that users in your organization have created is displayed.

1. Select a rule by clicking on the check-box beside the rule name.

1. Click **Turn rule on**, **Edit rule**, or  **Delete rule**. When making changes to a rule, you can choose to release alerts that it has already suppressed, regardless whether or not these alerts match the new criteria. 


## View details of a suppression rule

1. In the navigation pane, select **Settings** \> **Endpoints** \> **Rules** \> **Alert suppression**. The list of suppression rules that users in your organization have created is displayed.

1. Select a rule name. Details of the rule is displayed. You'll see the rule details such as  status, scope, action, number of matching alerts, created by, and date when the rule was created. You can also view associated alerts and the rule conditions.

## Related topics

- [Manage alerts](/defender-xdr/investigate-alerts?toc=/defender-endpoint/toc.json&bc=/defender-endpoint/breadcrumb/toc.json#manage-alerts)



