---
title: Go to the Action center to view and approve your automated investigation and remediation tasks
description: Use the Action center to view details about automated investigation and approve pending actions
search.appverid: met150
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
ms.date: 5/9/2024
manager: dansimp
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: how-to
ms.custom:
- autoir
- admindeeplinkDEFENDER
ms.reviewer: evaldm, isco
---

# The Action center

**Applies to:**
- Microsoft Defender XDR

The Action center provides a "single pane of glass" experience for incident and alert tasks such as:

- Approving pending remediation actions.
- Viewing an audit log of already approved remediation actions.
- Reviewing completed remediation actions.

Because the Action center provides a comprehensive view of Microsoft Defender XDR at work, your security operations team can operate more effectively and efficiently.

## The unified Action center

The unified Action center ([https://security.microsoft.com/action-center](https://security.microsoft.com/action-center)) lists pending and completed remediation actions for your devices, email & collaboration content, and identities in one location.

:::image type="content" source="/defender/media/m3d-action-center-unified.png" alt-text="The unified Action center in the Microsoft Defender portal." lightbox="/defender/media/m3d-action-center-unified.png":::

For example:

- If you were using the Action center in the Microsoft Defender Security Center ([https://securitycenter.windows.com/action-center](https://securitycenter.windows.com/action-center)), try the unified Action center in the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>.
- If you were already using the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>, you'll see several improvements in the Action center ([https://security.microsoft.com/action-center](https://security.microsoft.com/action-center)).

The unified Action center brings together remediation actions across Microsoft Defender for Endpoint and Microsoft Defender for Office 365. It defines a common language for all remediation actions and provides a unified investigation experience. Your security operations team has a "single pane of glass" experience to view and manage remediation actions.

You can use the unified Action center if you have appropriate permissions and one or more of the following subscriptions:

- [Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender for Office 365](/defender-office-365/mdo-about)
- [Microsoft Defender XDR](microsoft-365-defender.md)

> [!TIP]
> To learn more, see [Requirements](./prerequisites.md).

You can navigate to the list of actions pending approval in two different ways:

- Go to [https://security.microsoft.com/action-center](https://security.microsoft.com/action-center); or
- In the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)), in the Automated investigation & response card, select **Approve in Action Center**.

## Using the Action center

1. Go to <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a> and sign in.

2. In the navigation pane under **Actions and submissions**, choose **Action center**. Or, in the Automated investigation & response card, select **Approve in Action Center**.

3. Use the **Pending actions** and **History** tabs. The following table summarizes what you'll see on each tab:

   |Tab|Description|
   |---|---|
   |**Pending**|Displays a list of actions that require attention. You can approve or reject actions one at a time, or select multiple actions if they have the same type of action (such as Quarantine file). <br/><br/> Make sure to review and approve (or reject) pending actions as soon as possible so that your automated investigations can complete in a timely manner.|
   |**History**|Serves as an audit log for actions that were taken, such as: <ul><li>>Remediation actions that were taken as a result of automated investigations</li><li>Remediation actions that were taken on suspicious or malicious email messages, files, or URLs</li><li>Remediation actions that were approved by your security operations team</li><li>Commands that were run and remediation actions that were applied during Live Response sessions</li><li>Remediation actions that were taken by your antivirus protection</li></ul> <br/><br/> Provides a way to undo certain actions (see [Undo completed actions](m365d-autoir-actions.md#undo-completed-actions)).|

4. You can customize, sort, filter, and export data in the Action center.

   :::image type="content" source="/defender/media/m3d-action-center-columnsfilters.png" alt-text="Screenshot that shows the sort, filter, and customize capabilities of the Action center." lightbox="/defender/media/m3d-action-center-columnsfilters.png":::

   - Select a column heading to sort items in ascending or descending order.
   - Use the time period filter to view data for the past day, week, 30 days, or 6 months.
   - Choose the columns that you want to view.
   - Specify how many items to include on each page of data.
   - Use filters to view just the items you want to see.
   - Select **Export** to export results to a .csv file.

## Actions tracked in the Action center

All actions, whether they're pending approval or were already taken, are tracked in the Action center. Available actions include the following:

- Collect investigation package
- Isolate device (this action can be undone)
- Offboard machine
- Release code execution
- Release from quarantine
- Request sample
- Restrict code execution (this action can be undone)
- Run antivirus scan
- Stop and quarantine
- Contain devices from the network

In addition to remediation actions that are taken automatically as a result of [automated investigations](m365d-autoir.md), the Action center also tracks actions your security team has taken to address detected threats, and actions that were taken as a result of threat protection features in Microsoft Defender XDR. For more information about automatic and manual remediation actions, see [Remediation actions](m365d-remediation-actions.md).

## Viewing action source details

The improved Action center includes an **Action source** column that tells you where each action came from. The following table describes possible **Action source** values:

|Action source value|Description|
|---|---|
|**Manual device action**|A manual action taken on a device. Examples include [device isolation](/defender-endpoint/respond-machine-alerts#isolate-devices-from-the-network) or [file quarantine](/defender-endpoint/respond-file-alerts#stop-and-quarantine-files).|
|**Manual email action**|A manual action taken on email. An example includes soft-deleting email messages or [remediating an email message](/defender-office-365/remediate-malicious-email-delivered-office-365).|
|**Automated device action**|An automated action taken on an entity, such as a file or process. Examples of automated actions include sending a file to quarantine, stopping a process, and removing a registry key. (See [Remediation actions in Microsoft Defender for Endpoint](/defender-endpoint/manage-auto-investigation#remediation-actions).)|
|**Automated email action**|An automated action taken on email content, such as an email message, attachment, or URL. Examples of automated actions include soft-deleting email messages, blocking URLs, and turning off external mail forwarding. (See [Remediation actions in Microsoft Defender for Office 365](/defender-office-365/air-remediation-actions).)|
|**Advanced hunting action**|Actions taken on devices or email with [advanced hunting](./advanced-hunting-overview.md).|
|**Explorer action**|Actions taken on email content with [Explorer](/defender-office-365/threat-explorer-real-time-detections-about).|
|**Manual live response action**|Actions taken on a device with [live response](/defender-endpoint/live-response). Examples include deleting a file, stopping a process, and removing a scheduled task.|
|**Live response action**|Actions taken on a device with [Microsoft Defender for Endpoint APIs](/defender-endpoint/api/management-apis#microsoft-defender-for-endpoint-apis). Examples of actions include isolating a device, running an antivirus scan, and getting information about a file.|

## Required permissions for Action center tasks

To perform tasks, such as approving or rejecting pending actions in the Action center, you need specific permissions. You have the following options:

- [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal): Membership these roles gives users the required permissions _and_ permissions for other features in Microsoft 365:
  - _Microsoft Defender for Endpoint remediation (devices)_: Membership in the **Security Administrator** role.
  - _Microsoft Defender for Office 365 remediation (Office content and email)_:
    - Membership in the **Security Administrator** role.

    _and_

    - Membership in a role group in [Email & collaboration permissions](/defender-office-365/mdo-portal-permissions) with the **Search and Purge** role assigned. By default, this role is assigned only to the **Data Investigator** and **Organization Management** role groups in Email & collaboration permissions. You can add users to those role groups, or you can [create a new role group in Email & collaboration permissions](/defender-office-365/mdo-portal-permissions#create-email--collaboration-role-groups-in-the-microsoft-defender-portal) with the **Search and Purge** role assigned, and add the users to the custom role group.

- [Email & collaboration permissions in the Microsoft Defender portal](/defender-office-365/mdo-portal-permissions):
  - _Microsoft Defender for Office 365 remediation (Office content and email)_:
    - Membership in the **Security Administrator** role group

    _and_

    - Membership in a role group in [Email & collaboration permissions](/defender-office-365/mdo-portal-permissions) with the **Search and Purge** role assigned. By default, this role is assigned only to the **Data Investigator** and **Organization Management** role groups in Email & collaboration permissions. You can add users to those role groups, or you can [create a new role group in Email & collaboration permissions](/defender-office-365/mdo-portal-permissions#create-email--collaboration-role-groups-in-the-microsoft-defender-portal) with the **Search and Purge** role assigned, and add the users to the custom role group.

- [Microsoft Defender XDR Unified role based access control (RBAC)](/defender-xdr/manage-rbac)
   - _Microsoft Defender for Endpoint remediation_: **Security operations \ Security data \ Response (manage)**.
   - _Microsoft Defender for Office 365 remediation_ (Office content and email, if **Email & collaboration** \> **Defender for Office 365** permissions is :::image type="icon" source="/defender-office-365/media/scc-toggle-on.png" border="false"::: **Active**. Affects the Defender portal only, not PowerShell):
     - _Read access for email and Teams message headers_: **Security operations/Raw data (email & collaboration)/Email & collaboration metadata (read)**.
     - _Remediate malicious email_: **Security operations/Security data/Email & collaboration advanced actions (manage)**. 
    
  > [!TIP]
  > Membership in the **Security Administrator** role group Email & collaboration permissions doesn't grant access to the Action center or Microsoft Defender XDR capabilities. For those, you need to be a member of the **Security Administrator** role in [Microsoft Entra permissions](/entra/identity/role-based-access-control/manage-roles-portal).

- [Defender for Endpoint permissions](/defender-endpoint/rbac):
  - _Microsoft Defender for Endpoint remediation (devices)_: Membership in the **Active remediation actions** role.

> [!TIP]
> Members of the **Global Administrator** role in Microsoft Entra ID can approve or reject any pending action in the Action center. However, as a best practice, you should limit the members of the **Global Administrator** role. We recommend using the alternative roles and role groups as described in the previous list for Action center permissions.

## Next step

- [View and manage remediation actions](m365d-autoir-actions.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
