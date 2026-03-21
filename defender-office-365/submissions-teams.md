---
title: User reported message settings in Teams
f1.keywords:
  - NOCSH
author: chrisda
ms.author: chrisda
manager: bagol
audience: ITPro
ms.topic: how-to
ms.localizationpriority: medium
search.appverid:
  - MET150
ms.collection:
  - m365-security
  - tier1
ms.custom:
description: "Admins can configure whether users can report malicious message in Microsoft Teams."
ms.service: defender-office-365
ms.date: 02/18/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# User reported message settings in Microsoft Teams

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In organizations with Microsoft Defender for Office 365 Plan 1 or Plan 2 or Microsoft Defender XDR, admins can decide whether users can report messages in Microsoft Teams. The following clients support message reporting:

- The Microsoft Teams desktop client.
- The Microsoft Teams Web App.
- The Microsoft Teams app for iOS/iPadOS: Version 7.15 or later.
- The Microsoft Teams for Android: Version 1416/1.0.0.2025153104 or later.

Users can report messages as malicious or non-malicious in Teams from chats, standard, private and shared channels, and meeting conversations. Admins can also get visibility into Teams messages that users are reporting.

> [!NOTE]
> User reporting of messages in Teams is not supported in U.S. Government organizations (Microsoft 365 GCC, GCC High, and DoD).
>
> For information about user reporting of email messages, see [Report suspicious email messages to Microsoft](submissions-report-messages-files-to-microsoft.md).

## User reporting settings for Teams messages

User reporting of messages in Teams is made of two separate settings:

- **In the Teams admin center**: On by default and controls whether users are able to report messages from Teams. When these two setting are turned off, users can't report messages within Teams, so the corresponding setting in the Microsoft Defender portal is irrelevant.

- **In the Microsoft Defender portal**: On by default for new tenants. Existing tenants need to enable it. If user reporting of messages is turned on in the Teams admin center, it also needs to be turned on the Defender portal for user reported messages to show up correctly on the **User reported** tab on the **Submissions** page.

> [!IMPORTANT]
>
> - When a user reports a Teams message to Microsoft, everything associated with the message is copied for inclusion in the continual algorithm reviews. This copy contains all data associated with the message, including:
>   - Message content.
>   - Headers.
>   - Any attachments.
>   - Related data about routing.
>   - All other data directly associated with the submission.
>
> - Microsoft treats your feedback as your organization's permission to analyze all information to fine tune the submission hygiene algorithms. Your message is held in secured and audited data centers in the United States. The submission is deleted as soon as it's no longer required. Microsoft personnel might read your submitted messages and files, which is normally not permitted for Teams messages in Microsoft 365. However, your message is still treated as confidential between you and Microsoft, and your message or file isn't shared with any other party as part of the review process. Microsoft might also use AI to evaluate and create responses tailored to your submissions.

### Turn off or turn on user reporting in the Teams admin center

To view or configure this setting, you need to be a member of the **Global Administrator**<sup>\*</sup> or **Teams Administrator** roles. For more information about permissions in Teams, see [Use Microsoft Teams administrator roles to manage Teams](/microsoftteams/using-admin-roles).

> [!IMPORTANT]
> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

1. In the Teams admin center, go to the **Settings & policies** page at <https://admin.teams.microsoft.com/one-policy/settings>.

2. On the **Settings & policies** page, select either the **Global (Org-wide) default settings** tab for all users or **Custom policies for users & groups** for specific users.

3. On the tab, go to the **Messaging** section and select **Messaging**. If you selected the **Custom policies for users & groups** tab in the previous step, do one of the following steps to edit the specific policy:
   - Click on the policy name in the **Name** column.
   - Click anywhere in the row other than the **Name** column, and then select the :::image type="icon" source="media/m365-cc-sc-edit-icon.png" border="false"::: **Edit** action that appears.

4. In the policy details page that opens, find the **Report a security concern** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-security-risk.png" alt-text="Screenshot of the 'Report a security concern' toggle in Messaging policies in the Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-security-risk.png":::

5. In the Teams admin center, go to the **Messaging settings** page at <https://admin.teams.microsoft.com/messaging/settings>.

6. On the **Messaging settings** page, go to the **Messaging safety** section, find the **Report incorrect security detections** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-not-security-risk.png" alt-text="Screenshot of the 'Report incorrect security detections' toggle on the Messaging settings page in the Microsoft Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-not-security-risk.png":::

For more information about messaging policies in Teams, see [Manage messaging policies in Teams](/microsoftteams/messaging-policies-in-teams).

### Turn off or turn on user reporting of Teams messages in the Defender portal

To modify this setting in the Defender portal, you need to be a member of the **Organization Management** or **Security Administrator** role groups. For more information about permissions in the Defender portal, see [Permissions in the Microsoft Defender portal](mdo-portal-permissions.md).

The value of this setting is meaningful only if message reporting is turned on in the Teams admin center as described in the previous section.

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Settings** \> **Email & collaboration** \> **User reported settings** tab. To go directly to the **User reported settings** page, use <https://security.microsoft.com/securitysettings/userSubmission>.

2. On the **User reported settings** page, go to the **Microsoft Teams** section for the **Monitor reported messages in Microsoft Teams** setting.

   As previously described, this setting is turned on by default for new tenants, and existing tenants need to enable it. Typically, you leave it turned on if message reporting is also turned on in Teams admin center. [Learn more about reported message destinations](submissions-report-messages-files-to-microsoft.md#report-suspicious-email-messages-to-microsoft).

   :::image type="content" source="media/submissions-teams-turn-on-off-defender-portal.png" alt-text="Screenshot of the 'Monitor reported messages in Microsoft Teams' setting in the Microsoft Defender portal." lightbox="media/submissions-teams-turn-on-off-defender-portal.png":::

For more information about user reported message settings in the Defender portal, see [User reported settings](submissions-user-reported-messages-custom-mailbox.md).

<a name='how-users-report-messages-in-teams'></a>

## How users report messages in Teams

> [!TIP]
>
> - Reported messages remain visible to users.
> - Users can report the same message multiple times.
> - Message senders aren't notified their messages were reported.

### Report malicious messages in Teams

1. In the Microsoft Teams client, hover over the malicious message without selecting it, and then select :::image type="icon" source="media/m365-cc-sc-more-actions-icon.png" border="false"::: **More options** \> **Report this message**.

   :::image type="content" source="media/submissions-user-report-message-in-teams-client-click-path.png" alt-text="Screenshot of the Select path to report a message in the Microsoft Teams client." lightbox="media/submissions-user-report-message-in-teams-client-click-path.png":::

2. In the **report this message** dialog that opens, verify **Security risk - Spam, phishing, malicious content** is selected, and then select **Report**.

   :::image type="content" source="media/submissions-user-report-message-in-teams-client-click-report.png" alt-text="Screenshot of the final dialog to report a message in the Microsoft Teams client." lightbox="media/submissions-user-report-message-in-teams-client-click-report.png":::

   > [!NOTE]
   > If [reporting for Microsoft Purview Communication Compliance is turned off](/purview/communication-compliance-policies#user-reported-messages-policy), users might not have the dropdown list to select **Security risk - Spam, phishing, malicious content**. Instead, they're shown a confirmation pop-up.

3. In the confirmation dialog that opens, select **Close**.

### Report non-malicious messages in Teams

1. In the Teams chat or channel, hover over the message without selecting it, and then select :::image type="icon" source="media/m365-cc-sc-more-actions-icon.png" border="false"::: **More options** \> **Report this message**.

2. In the **report this message** dialog that opens, select **Not a security concern**, and then select **Report**.

## What happens after a user reports a message from Teams?

What happens to a user reported Teams message depends on the settings in the **Reported message destinations** section on the **User reported settings** page at <https://security.microsoft.com/securitysettings/userSubmission>:

- **Send the reported messages to** \> **Microsoft and my reporting mailbox**: The default user reporting mailbox is the Exchange Online mailbox of the global admin. The value for older Microsoft 365 organizations is unchanged.
- **Send the reported messages to** \> **Microsoft only**
- **Send the reported messages to** \> **My reporting mailbox only**

For more information, see [User reported settings](submissions-user-reported-messages-custom-mailbox.md).

**Notes**:

- For shared channel user reports, the report goes to the organization that owns/created the channel.
- If you select **Send the reported messages to** \> **My reporting mailbox only**, reported messages don't go to Microsoft for analysis unless an admin manually submits the message from the **User reported** tab on the **Submissions** page at <https://security.microsoft.com/reportsubmission?viewid=user>. Reporting messages to Microsoft is an important part of training the service to help improve the accuracy of filtering (reduce false positives and false negatives). That's why we use **Send the reported messages to** \> **Microsoft and my reporting mailbox** as the default.
- Regardless of the **Send the reported messages to** setting, the following actions occur when a user reports a Teams message:
  - Metadata from the reported Teams message (for example, senders, recipients, reported by, and message details) is available on the **User reported** tab on the **Submissions** page.
  - The alert policies named **Teams message reported by user as a security risk** and **Teams message reported by user as a not security risk** generate alerts by default. For more information, see [Manage alerts](/defender-xdr/alert-policies#manage-alerts).

  To view the corresponding alert for a user reported message in Teams, go to the **User reported** tab on the **Submission** page, and then double-click the message to open the submission flyout. Select :::image type="icon" source="media/m365-cc-sc-more-actions-icon.png" border="false"::: **More options** and then select **View alert**.

## View and triage user reported messages in Teams

As previously described, information about user reported messages in Teams is available on the **User reported** tab on the **Submissions** page at <https://security.microsoft.com/reportsubmission?viewid=user>. For more information, see [View user reported messages to Microsoft](submissions-admin.md#view-user-reported-messages-to-microsoft).
