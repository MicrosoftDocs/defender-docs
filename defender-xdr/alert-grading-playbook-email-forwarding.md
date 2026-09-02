---
title: Alert classification for suspicious email forwarding activity
description: Investigate suspicious email forwarding activity alerts, determine whether they are true or false positives, and take recommended remediation steps.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom: admindeeplinkDEFENDER, msecd-doc-authoring-1014
ms.topic: how-to
ms.date: 06/15/2026
appliesto:
  - Microsoft Defender XDR
ai-usage: ai-assisted
#customer intent: As a SOC analyst, I want to know how to review and classify alerts about suspicious email forwarding activity so that I can take the necessary actions to remediate the attack and protect my network.
---

# Alert classification for suspicious email forwarding activity

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Threat actors can use compromised user accounts for several malicious purposes, including reading emails in a user's inbox, forwarding emails to external recipients, and sending phishing mails, among others. The targeted user might be unaware that their emails are being forwarded. Undetected email forwarding is a common tactic that attackers use when user accounts are compromised.

Emails can be forwarded either manually or automatically using forwarding rules. Automatic forwarding can be implemented in multiple ways like Inbox Rules, Exchange Transport Rule (ETR), and SMTP Forwarding. While manual forwarding requires direct action from users, they might not be aware of all the autoforwarded emails. In Microsoft 365, an alert is raised when a user autoforwards an email to a potentially malicious email address.

The suspicious email forwarding activity playbook helps you investigate Suspicious Email Forwarding Activity alerts and quickly grade them as either a true positive (TP) or a false positive (FP). You can then take recommended actions for the TP alerts to remediate the attack.

For an overview of alert classifications for Microsoft Defender for Office 365 and Microsoft Defender for Cloud Apps, see [Overview of alert classification](alert-classification-playbooks.md).

The results of using this playbook are:

- You identify the alerts associated with autoforwarded emails as malicious (true positive, TP) or benign (false positive, FP) activities.

  If malicious, you have [configure outbound spam policies to control external email forwarding](/defender-office-365/outbound-spam-policies-external-email-forwarding) for the affected mailboxes.

- You take the necessary action if emails were forwarded to a malicious email address.

<a name="email-forwarding-rules"></a>
## Overview of email forwarding rules

Email forwarding rules allow users to create a rule to forward email messages sent to a user's mailbox to another user's mailbox inside or outside of the organization. Some email users, particularly those with multiple mailboxes, configure forwarding rules to move employer emails to their private email accounts. Email forwarding is a useful feature but can also pose a security risk because of the potential disclosure of information. Attackers might use this information to attack your organization or its partners.

<a name="suspicious-email-forwarding-activity"></a>
### How attackers use suspicious email forwarding activity

Attackers might set up email rules to hide incoming emails in the compromised user mailbox to obscure their malicious activities from the user. They might also set rules in the compromised user mailbox to delete emails, move the emails into another less noticeable folder such as an RSS folder, or forward emails to an external account.

Some rules might move all the emails to another folder and mark them as "read", while some rules might move only mails that contain specific keywords in the email message or subject. For example, the inbox rule might be set to look for keywords like "invoice," "phish," "do not reply," "suspicious email," or "spam," among others, and move them to an external email account. Attackers might also use the compromised user mailbox to distribute spam, phishing emails, or malware.

Microsoft Defender for Office 365 can detect and alert on suspicious email forwarding rules, allowing you to find and delete hidden rules at the source.

For more information, see these blog posts:

- [Business Email Uncompromised, part one](https://techcommunity.microsoft.com/t5/microsoft-defender-for-office/business-email-uncompromised-part-one/ba-p/2159900)
- [Behind the scenes of business email compromise: Using cross-domain threat data to disrupt a large BEC campaign](https://www.microsoft.com/security/blog/2021/06/14/behind-the-scenes-of-business-email-compromise-using-cross-domain-threat-data-to-disrupt-a-large-bec-infrastructure/)

<a name="alert-details"></a>
## Alert details for suspicious email forwarding activity

To review the Suspicious Email Forwarding Activity alert, open the **Alerts** page to see the **Activity list** section. Here's an example.

:::image type="content" source="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-activity-list.png" alt-text="List of activities related to the alert" lightbox="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-activity-list.png":::

Select **Activity**  to view the details of the selected alert activity in the sidebar. Here's an example.

:::image type="content" source="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-activity-details.png" alt-text="Details of the activity" lightbox="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-activity-details.png":::

## Investigation workflow

While investigating this alert, you must determine:

- Is the user account and its mailbox compromised?
- Are the activities malicious?

### Is the user account and its mailbox compromised?

By looking at sender's past behavior and recent activities, you should be able to determine whether the user's account should be considered compromised or not. You can see the details of alerts raised from the user's page in the Microsoft Defender portal.

You can also analyze these other activities for the affected mailbox:

- Use Threat Explorer to understand email related threats
  - Observe how many of the recent email sent by the sender are detected as phish, spam, or malware.
  - Observe how many of the sent emails contain sensitive information.

- Assess risky sign-in behavior in the Microsoft Azure portal.
- Check for any malicious activities on the user's device.

### Are the activities malicious?

Investigate the email forwarding activity. For instance, check the type of the flagged forwarded message, its recipient, and how the message was forwarded.

For more information, see the following articles:

- [Autoforwarded messages report in the EAC](/exchange/monitoring/mail-flow-reports/mfr-auto-forwarded-messages-report)
- [New users forwarding email insight in the EAC](/exchange/monitoring/mail-flow-insights/mfi-new-users-forwarding-email-insight)
- [Responding to a Compromised Email Account](/defender-office-365/responding-to-a-compromised-email-account)
- [Report false positives and false negatives in Outlook](/defender-office-365/submissions-outlook-report-messages)

Here's the workflow to identify suspicious email forwarding activities.

:::image type="content" source="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-workflow.png" alt-text="Alert investigation workflow for email forwarding" lightbox="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-workflow.png":::

You can investigate an email forwarding alert using Threat Explorer or with advanced hunting queries, based on the availability of features in the Microsoft Defender portal. You may choose to follow the entire email-forwarding investigation workflow or only the steps that apply to your scenario.

<a name="using-threat-explorer"></a>
## Use Threat Explorer to investigate suspicious email forwarding

Threat Explorer provides an interactive investigation experience for email related threats to determine whether the flagged email-forwarding activity is suspicious or not. You can use the following indicators from the alert information:

- Suspicious Recipients List (SRL) / Recipients List (RL): Use the SRL or RL from the alert to find these details:

    :::image type="content" source="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-recipients-list.png" alt-text="Example of the list of recipients" lightbox="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-recipients-list.png":::

  - Who else has forwarded emails to these recipients?
  - How many emails have been forwarded to these recipients?
  - How frequently are emails forwarded to these recipients?

- MTI: Use the Message Trace ID/Network Message ID to find these details:

    :::image type="content" source="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-network-message-id.png" alt-text="Example of the Network Message ID" lightbox="media/alert-grading-playbook-email-forwarding/alert-grading-playbook-email-forwarding-network-message-id.png":::

  - What other details are available for this email? For example: subject, return path, and timestamp.
  - What is the origin of this email? Are there any similar emails?
  - Does this email contain any URLs? Does the URL point to any sensitive data?
  - Does the email contain any attachments? Do the attachments contain sensitive information?
  - What was the action taken on the email? Was it deleted, marked as read, or moved to another folder?
  - Are there any threats associated with this email? Is this email part of any campaign?

Based on answers to these questions, you should be able to determine whether an email is malicious or benign.

## Advanced hunting queries

To use [advanced hunting overview](advanced-hunting-overview.md) queries to gather information related to an alert and determine whether or not the activity is suspicious, make sure you have access to the following tables:

- EmailEvents - Contains information related to email flow.

- EmailUrlInfo - Contains information related to URLs in emails.

- CloudAppEvents -Contains audit log of user activities.

- IdentityLogonEvents - Contains sign-in information for all users.

> [!NOTE]
> Certain parameters are unique to your organization or network. Fill in these specific parameters as instructed in each query.

Use this query to identify other senders who forwarded emails to the suspicious recipients (SRL/RL), which helps determine whether the forwarding pattern is isolated or widespread.

```kusto
let srl=pack_array("{SRL}"); //Put values from SRL here.
EmailEvents
| where RecipientEmailAddress in (srl)
| distinct SenderDisplayName, SenderFromAddress, SenderObjectId
```

Run this query to find out how many emails were forwarded to these recipients.

```kusto
let srl=pack_array("{SRL}"); //Put values from SRL here.
EmailEvents
| where RecipientEmailAddress in (srl)
| summarize Count=dcount(NetworkMessageId) by RecipientEmailAddress
```

Run this query to find out how frequently are emails forwarded to these recipients.

```kusto
let srl=pack_array("{SRL}"); //Put values from SRL here.
EmailEvents
| where RecipientEmailAddress in (srl)
| summarize Count=dcount(NetworkMessageId) by RecipientEmailAddress, bin(Timestamp, 1d)
```

Run this query to find out if the email contains any URLs.

```kusto
let mti='{MTI}'; //Replace {MTI} with MTI from alert
EmailUrlInfo
| where NetworkMessageId == mti
```

Run this query to find out if the email contains any attachments.

   ```kusto
   let mti='{MTI}'; //Replace {MTI} with MTI from alert
   EmailAttachmentInfo
   | where NetworkMessageId == mti
   ```

Use this query to investigate whether the forwarding user created suspicious inbox or transport rules, which can confirm rule-based email exfiltration activity.

```kusto
let sender = "{SENDER}"; //Replace {SENDER} with display name of Forwarder
let action_types = pack_array(
    "New-InboxRule",
    "UpdateInboxRules",
    "Set-InboxRule",
    "Set-Mailbox",
    "New-TransportRule",
    "Set-TransportRule");
CloudAppEvents
| where AccountDisplayName == sender
| where ActionType in (action_types)
```

Use this query to look for unusual sign-in activity by the forwarding user, such as unfamiliar IP addresses, new applications, uncommon countries/regions, or multiple LogonFailed events. Anomalous sign-ins can indicate that the account was compromised before the forwarding rule was created.

```kusto
let sender = "{SENDER}"; //Replace {SENDER} with email of the Forwarder
IdentityLogonEvents
| where AccountUpn == sender
```

### Investigating forwarding rules

You can also find suspicious forwarding rules using the Exchange admin center, based on the rule type (the FT value in the alert).

- ETR

  Exchange transport rules are listed in the **Rules** section. Verify that all rules are as expected.

- SMTP

  You can see mailbox forwarding rules by selecting the sender's mailbox **\>  Manage mail flow settings \> Email forwarding \> Edit**.

- InboxRule

  Inbox rules are configured with the e-mail client. You can use the [Get-InboxRule](/powershell/module/exchangepowershell/get-inboxrule) PowerShell cmdlet to list the inbox rules created by users.

<a name="additional-investigation"></a>
### Investigate IP addresses and new forwarding rules

Along with the evidence gathered during this investigation, you can determine if there are new forwarding rules being created. Investigate the IP address associated with the rule. Ensure that it is not an anomalous IP address and is consistent with usual activities performed by the user.

## Recommended actions

Once you determine that the activities associated make this alert a True Positive, classify the alert and take these actions for remediation:

1. Disable and delete the inbox forwarding rule.
2. For the InboxRule forwarding type, reset the user's account credentials.
3. For the SMTP or ETR forwarding type, investigate the activities of the user account that created the alert.

    - Investigate any other suspicious admin activities.

    - Reset the user account's credentials.

4. Check for other activities originated from impacted accounts, IP addresses, and suspicious senders.

## See also

- [Overview of alert classification](alert-classification-playbooks.md)
- [Suspicious inbox forwarding rules](alert-grading-playbook-inbox-forwarding-rules.md)
- [Suspicious inbox manipulation rules](alert-grading-playbook-inbox-manipulation-rules.md)
- [Investigate alerts](investigate-alerts.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
