---
title: Report phishing and suspicious emails in Outlook for admins
f1.keywords:
- NOCSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: Admin
ms.topic: how-to
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
description: Learn how to report phishing and suspicious emails in supported versions of Outlook using the built-in Report button.
ms.service: defender-office-365
search.appverid: met150
ms.date: 07/24/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Default email protections for cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Report phishing and suspicious emails in Outlook for admins

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

In Microsoft 365 organizations with mailboxes in Exchange Online, users can report phishing and suspicious email in Outlook. Users can report false positives (good email that was blocked or sent to their Junk Email folder) and false negatives (unwanted email or phishing that was delivered to their Inbox) from Outlook on all platforms using free tools from Microsoft.

Microsoft provides the built-in **Report** button in [supported versions of Outlook](submissions-outlook-report-messages.md#use-the-built-in-report-button-in-outlook) on virtually all Outlook platforms for users to report good and bad messages.

For more information about reporting messages to Microsoft, see [Report messages and files to Microsoft](submissions-report-messages-files-to-microsoft.md).

Admins configure user reported messages to go to a specified reporting mailbox, to Microsoft, or both. These user reported messages are available on the **User reported** tab on the **Submissions** page in the Microsoft Defender portal. For more information, see [User reported settings](submissions-user-reported-messages-custom-mailbox.md).

[!INCLUDE [MDO Setup guide](../includes/mdo-setup-guide.md)]

## Use the built-in Report button in Outlook

- The built-in **Report** button is available in the following versions of Outlook:
  - Outlook for Microsoft 365:
    - **Current channel**: Version 16.0.17827.15010 or later.
    - **Monthly Enterprise Channel**: Version 16.0.18025.20000 or later.
    - **Semi-Annual Channel (Preview)**: Release 2502, build 16.0.18526.20024 or later.
    - **Semi-Annual Channel**: Release 2502, build 16.0.18526.20024 or later.
  - Outlook for Mac version 16.89 (24090815) or later.
  - Outlook for iOS version 4.2511 or later.
  - Outlook for Android version 4.2446 or later.
  - The new Outlook for Windows.
  - Outlook on the web.

  The **Report** button is available in supported versions of Outlook if both of the following conditions are true:

  - User reporting is turned on.
  - The built-in **Report** button is configured in the [user reported settings](submissions-user-reported-messages-custom-mailbox.md) at <https://security.microsoft.com/securitysettings/userSubmission>.

  If user reporting is turned off and a non-Microsoft add-in button is selected, the **Report** button isn't available in supported versions of Outlook.

- The built-in **Report** button in Outlook on the web, Outlook for Mac, Outlook for iOS, Outlook for Android, and the new Outlook for Windows supports reporting messages from shared mailboxes or other mailboxes by a delegate.
  
### Use the built-in Report button in Outlook to report junk and phishing messages

- Users can report a message as junk from the Inbox or any email folder other than Junk Email folder.
- Users can report a message as phishing from any email folder.

In a supported version of Outlook, select one or more messages, select **Report**, and then select **Report phishing** or **Report junk** in the dropdown list.

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/owa-report-junk-phishing.png" alt-text="The results of selecting the Report button after selecting multiple messages in Outlook on the web." lightbox="media/owa-report-junk-phishing.png":::

Based on the [User reported settings](submissions-user-reported-messages-custom-mailbox.md) in your organization, the messages are sent to the reporting mailbox, to Microsoft, or both. The following actions are also taken on the reported messages in the mailbox:

- **Reported as junk**: The messages are moved to the Junk Email folder, and the sender is automatically added to the user's Blocked Senders list. 
- **Reported as phishing**: The messages are deleted.

### Use the built-in Report button in Outlook to report messages that aren't junk

In a supported version of Outlook, select one or more messages in the Junk Email folder, select **Report**, and then select **Not junk** in the dropdown list.

> [!div class="mx-imgBorder"]
> :::image type="content" source="media/owa-report-as-not-junk.png" alt-text="The results of selecting the Report button after selecting multiple messages in the Junk Email folder in Outlook on the web." lightbox="media/owa-report-as-not-junk.png":::

Based on the [User reported settings](submissions-user-reported-messages-custom-mailbox.md) in your organization, the messages are sent to the reporting mailbox, to Microsoft, or both. The messages are also moved out of Junk Email to the Inbox.

## Review reported messages

To review messages that users have reported to Microsoft, admins can use the **User reported** tab on the **Submissions** page in the Microsoft Defender portal at <https://security.microsoft.com/reportsubmission>. For more information, see [View user reported messages to Microsoft](submissions-admin.md#view-user-reported-messages-to-microsoft).

> [!NOTE]
> If the [User reported settings](submissions-user-reported-messages-custom-mailbox.md) in the organization send user reported messages (email and [Microsoft Teams](submissions-teams.md)) to Microsoft (exclusively or in addition to the reporting mailbox), we do the same checks as when admins submit messages to Microsoft for analysis from the **Submissions** page. So, submitting or resubmitting messages to Microsoft is useful to admins only for messages that have never been submitted to Microsoft, or when you disagree with the original verdict.

## More information

Admins can watch this short video to learn how to use Microsoft Defender for Office 365 to easily investigate user reported messages. Admins can determine the contents of a message and how to respond by applying the appropriate remediation action.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=f420f4a0-56a3-4054-8963-6eb72403f875]
