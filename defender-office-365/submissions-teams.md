---
title: User reported settings in Teams
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.localizationpriority: medium
  - MET150
ms.collection:
  - m365-security
  - tier1
ms.custom:
description: "Admins can configure whether users can report malicious messages or calls in Microsoft Teams."
ms.service: defender-office-365
ms.date: 04/02/2026
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# User reported settings in Microsoft Teams

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In organizations with Microsoft Defender for Office 365 Plan 1 or Plan 2 or Microsoft Defender XDR, admins can decide whether users can report messages or calls in Microsoft Teams. The following clients support reporting:

- The Microsoft Teams desktop client.
- The Microsoft Teams Web App.
- The Microsoft Teams app for iOS/iPadOS: Version 7.15 or later (messages only).
- The Microsoft Teams for Android: Version 1416/1.0.0.2025153104 or later (messages only).

Users can report Teams messages from chats, channels, and meeting conversations as malicious or non-malicious. They can also report Teams calls from their call history as scam or not scam. Admins can view the Teams messages and calls that users report.

> [!NOTE]
> User reporting of calls and messages in Teams is not supported in U.S. Government organizations (Microsoft 365 GCC, GCC High, and DoD).
>
> For information about user reporting of email messages, see [Report suspicious email messages to Microsoft](submissions-report-messages-files-to-microsoft.md).

<a name="user-reporting-settings-for-teams-messages"></a>

## User reporting settings for Teams items

User reporting of messages or calls in Teams is made of two separate settings:

- **In the Teams admin center**: On by default and controls whether users are able to report items from Teams. When this setting is turned off, users can't report items within Teams, so the corresponding setting in the Microsoft Defender portal is irrelevant.

- **In the Microsoft Defender portal**: On by default for new tenants. Existing tenants need to enable it. If user reporting of messages is turned on in the Teams admin center, it also needs to be turned on the Defender portal for user reported messages to show up correctly on the **User reported** tab on the **Submissions** page.

> [!IMPORTANT]
>
> - When a user reports a Teams message or call to Microsoft, all data directly associated with the item is copied and included in ongoing algorithm reviews. This information includes:
>   - Message content
>   - Headers
>   - Attachments
>   - Routing metadata
>   - Call metadata and any other related information.
>
> - The submission might also include contextual data for the reported message. Specifically, up to fifteen messages before and after the reported message might also be shared for analysis.
>
> - Microsoft treats this feedback as your organization's authorization to analyze the submitted information to improve hygiene algorithms. Submitted content is stored in secured, compliance-audited data centres located in the USA and is deleted as soon as it's no longer required.
>
> - Microsoft personnel might read submitted messages, calls, and files, which is typically not permitted for Teams items in Microsoft 365. However, your submission remains confidential between you and Microsoft and isn't shared with any third party during the review process. Microsoft might also use AI to evaluate and generate responses tailored to your submission. Microsoft doesn't use customer data to train any generative AI foundation models, except pursuant to the customer's documented instructions.

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

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-security-risk.png" alt-text="Screenshot of the Report a security concern toggle in the policy details page in the Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-security-risk.png":::

5. In the Teams admin center, go to the **Messaging settings** page at <https://admin.teams.microsoft.com/one-policy/settings/messaging>.

6. On the **Messaging settings** page, go to the **Messaging safety** section, find the **Report incorrect security detections** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-not-security-risk.png" alt-text="Screenshot of the Report incorrect security detections toggle on the Messaging settings page in the Microsoft Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-not-security-risk.png":::

7. In the Teams admin center, go to the **Calling settings** page at <https://admin.teams.microsoft.com/one-policy/settings/calling>.

8. On the **Calling settings** page, go to the **General** section, find the **Report a call** toggle, and verify the value is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**.

   If the value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Off**, move the toggle to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **On**, and then select **Save**.

   :::image type="content" source="media/submissions-teams-turn-on-off-tac-security-risk-call.png" alt-text="Screenshot of the 'Report incorrect security detections' toggle on the Messaging settings page in the Microsoft Teams admin center." lightbox="media/submissions-teams-turn-on-off-tac-security-risk-call.png":::

For more information about messaging policies in Teams, see [Manage messaging policies in Teams](/microsoftteams/messaging-policies-in-teams) or calling policies in Teams, see [Manage calling policies in Teams](/microsoftteams/teams-calling-policy).

### Turn off or turn on user reporting in the Defender portal

To modify this setting in the Defender portal, you need to be a member of the **Organization Management** or **Security Administrator** role groups. For more information about permissions in the Defender portal, see [Permissions in the Microsoft Defender portal](mdo-portal-permissions.md).

The value of this setting is meaningful only if reporting is turned on in the Teams admin center as described in the previous section.

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Settings** \> **Email & collaboration** \> **User reported settings** tab. To go directly to the **User reported settings** page, use <https://security.microsoft.com/securitysettings/userSubmission>.

2. On the **User reported settings** page, go to the **Microsoft Teams** section for the **Monitor reported items in Microsoft Teams** setting.

   As previously described, this setting is turned on by default for new tenants, and existing tenants need to enable it. Typically, you leave it turned on if message reporting is also turned on in Teams admin center. [Learn more about reported message destinations](submissions-report-messages-files-to-microsoft.md#report-suspicious-email-messages-to-microsoft).

   :::image type="content" source="media/submissions-teams-turn-on-off-defender-portal.png" alt-text="Screenshot of the 'Monitor reported items in Microsoft Teams' setting in the Microsoft Defender portal." lightbox="media/submissions-teams-turn-on-off-defender-portal.png":::

For more information about user reported items settings in the Defender portal, see [User reported settings](submissions-user-reported-messages-custom-mailbox.md).

## How users report items in Teams

> [!TIP]
>
> - Reported oitems remain visible to users.
> - Users can report the same items multiple times.
> - Message senders aren't notified their messages were reported.
> - The caller isn't notified that their calls were reported.

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

### Report calls in Teams

Currently support is there for completed or missed one to one calls only.

1. In the Microsoft Teams client, go to the call history view and then select :::image type="icon" source="media/m365-cc-sc-more-actions-icon.png" border="false"::: **More options** \> **Report call**.

   :::image type="content" source="media/submissions-user-report-calls-in-teams-client-click-path.png" alt-text="Screenshot of the Select path to report a calls in the Microsoft Teams client." lightbox="media/submissions-user-report-calls-in-teams-client-click-path.png":::

2. In the **Report call** dialog that opens, verify **Security concern - Spam, phishing, malicious call** is selected, and then select **Report**.

   :::image type="content" source="media/submissions-user-report-call-in-teams-client-click-report.png" alt-text="Screenshot of the final dialog to report a call in the Microsoft Teams client." lightbox="media/submissions-user-report-call-in-teams-client-click-report.png":::

3. In the confirmation dialog that opens, select **Close**.

## What happens after a user reports a items from Teams?

What happens to a user reported Teams item depends on the settings in the **Reported items destinations** section on the **User reported settings** page at <https://security.microsoft.com/securitysettings/userSubmission>:

- **Send the reported items to** \> **Microsoft and my reporting mailbox**: The default user reporting mailbox is the Exchange Online mailbox of the global admin. The value for older Microsoft 365 organizations is unchanged.
- **Send the reported items to** \> **Microsoft only**
- **Send the reported items to** \> **My reporting mailbox only**

For more information, see [User reported settings](submissions-user-reported-messages-custom-mailbox.md).

**Notes**:

- For shared channel user reports, the report goes to the organization that owns/created the channel.
- If you select **Send the reported items to** \> **My reporting mailbox only**, reported items don't go to Microsoft for analysis unless an admin manually submits the item from the **User reported** tab on the **Submissions** page at <https://security.microsoft.com/reportsubmission?viewid=user>. Reporting items to Microsoft is an important part of training the service to help improve the accuracy of filtering (reduce false positives and false negatives). That's why we use **Send the reported items to** \> **Microsoft and my reporting mailbox** as the default.
- Regardless of the **Send the reported items to** setting, the following actions occur when a user reports a Teams item:
  - Metadata from the reported Teams items (for example, senders/caller, recipients, reported by, and items details) is available on the **User reported** tab on the **Submissions** page.
  - The alert policies named **Teams message reported by user as a security risk**,  **Teams message reported by user as a not security risk**, **Teams call reported by user as a security risk** and **Teams call reported by user as a not security risk** generate alerts by default. For more information, see [Manage alerts](/defender-xdr/alert-policies#manage-alerts).

  To view the corresponding alert for a user reported items in Teams, go to the **User reported** tab on the **Submission** page, and then double-click the item to open the submission flyout. Select :::image type="icon" source="media/m365-cc-sc-more-actions-icon.png" border="false"::: **More options** and then select **View alert**.

## View and triage user reported items in Teams

As previously described, information about user reported items in Teams is available on the **User reported** tab on the **Submissions** page at <https://security.microsoft.com/reportsubmission?viewid=user>. For more information, see [View user reported items to Microsoft](submissions-admin.md#view-user-reported-messages-to-microsoft).
