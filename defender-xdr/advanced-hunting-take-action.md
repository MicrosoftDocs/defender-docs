---
title: Take action on advanced hunting query results in Microsoft Defender XDR
description: Quickly address threats and affected assets in your advanced hunting query results
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection:
  - m365-security
  - tier1
ms.custom:
  - sfi-ga-nochange
  - cx-ti
  - cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: how-to
ms.date: 05/07/2026
---

# Take action on advanced hunting query results

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

You can quickly contain threats or address compromised assets that you find in [advanced hunting](advanced-hunting-overview.md) by using powerful and comprehensive action options. By using these options, you can take various actions on devices and emails, as well as quarantine files.

## Required permissions

To take action on devices through advanced hunting, you need a role in Microsoft Defender for Endpoint with [permissions to submit remediation actions on devices](/windows/security/threat-protection/microsoft-defender-atp/user-roles#permission-options).

If you can't take action, contact a Global Administrator about getting the following permission:

*Active remediation actions \> Threat and vulnerability management - Remediation handling*.

To take action on emails through advanced hunting, you need a role in Microsoft Defender for Office 365 to [search and purge emails](/defender-office-365/scc-permissions).

- [Microsoft Defender XDR Unified role based access control (URBAC)](manage-rbac.md):
  - Membership assigned with the **Security operations** \> **Security data** \> **Security data basic (read)** \> **Response (manage)** and **Email & collaboration advanced actions (manage)** URBAC permissions enable the **Take action** option in Advanced hunting and grants users the required permissions to perform remediation actions. 
 
## Take various actions on devices

You can take the following actions on devices identified by the `DeviceId` column in your query results:

- Isolate affected devices to contain an infection or prevent attacks from moving laterally.
- Collect an investigation package to obtain more forensic information.
- Run an antivirus scan to find and remove threats by using the latest security intelligence updates.
- Initiate an automated investigation to check and remediate threats on the device and possibly other affected devices.
- Restrict app execution to only Microsoft-signed executable files, preventing subsequent threat activity through malware or other untrusted executables.

To learn more about how Microsoft Defender for Endpoint performs these response actions, [read about response actions on devices](/windows/security/threat-protection/microsoft-defender-atp/respond-machine-alerts).

## Quarantine files

You can deploy the *quarantine* action on files so that the files are automatically quarantined when encountered. When selecting this action, you can choose between the following columns to identify which files in your query results to quarantine:

- `SHA1`: In most advanced hunting tables, this column refers to the SHA-1 of the file that's affected by the recorded action. For example, if a file was copied, this affected file is the copied file.
- `InitiatingProcessSHA1`: In most advanced hunting tables, this column refers to the file responsible for initiating the recorded action. For example, if a child process was launched, this initiator file is part of the parent process.
- `SHA256`: This column is the SHA-256 equivalent of the file identified by the `SHA1` column.
- `InitiatingProcessSHA256`: This column is the SHA-256 equivalent of the file identified by the `InitiatingProcessSHA1` column.

To learn more about how quarantine actions are taken and how files can be restored, [read about response actions on files](/windows/security/threat-protection/microsoft-defender-atp/respond-file-alerts).

> [!NOTE]
> To locate files and quarantine them, the query results should also include `DeviceId` values as device identifiers.

To take any of the described actions, select one or more records in your query results and then select **Take actions**. A wizard guides you through the process of selecting and then submitting your preferred actions.

:::image type="content" source="media/advanced-hunting-take-action/take-action-multiple.png" alt-text="Screenshot of the take actions option in the Microsoft Defender portal." lightbox="media/advanced-hunting-take-action/take-action-multiple.png":::

## Take various actions on emails

Apart from device-focused remediation steps, you can also take some actions on emails from your query results. Select the records you want to take action on, select **Take actions**, and then under **Choose actions**, select your choice from the following options:

- `Move to mailbox folder` - select this action to move the email messages to Junk, Inbox, or Deleted items folder.

     Note that you can move email results consisting of quarantined items (for instance, in the case of false positives) by selecting the **Inbox** option.

   :::image type="content" source="media/advanced-hunting-take-action/advanced-hunting-quarantine-results.png" alt-text="Screenshot of the Inbox option under take actions pane in the Microsoft Defender portal." lightbox="media/advanced-hunting-take-action/advanced-hunting-quarantine-results.png":::

- `Delete email` - select this action to move email messages to the Deleted items folder (**Soft delete**) or delete them permanently (**Hard delete**).

   Selecting **Soft delete** also automatically soft deletes the messages from the sender's Sent Items folder if the sender is in the organization.

   :::image type="content" source="media/advanced-hunting-take-action/soft-delete-sender-copy.png" alt-text="Screenshot of take actions option in the Microsoft Defender portal." lightbox="media/advanced-hunting-take-action/soft-delete-sender-copy.png":::

   Automatic soft-deletion of the sender's copy is available for results using the [`EmailEvents`](advanced-hunting-emailevents-table.md) and [`EmailPostDeliveryEvents`](advanced-hunting-emailpostdeliveryevents-table.md) tables but not the [`UrlClickEvents`](advanced-hunting-urlclickevents-table.md) table. Furthermore, the result should contain the `EmailDirection` and `SenderFromAddress` columns for this action option to show up in the **Take actions** wizard. Sender's copy clean-up applies to intra-organization emails and outbound emails, ensuring that only the sender's copy is soft-deleted for these email messages. Inbound messages are out of scope.

   See the following query as reference:

   ```kusto
   EmailEvents
   | where ThreatTypes contains "spam"
   | project NetworkMessageId,RecipientEmailAddress, EmailDirection, SenderFromAddress, LatestDeliveryAction,LatestDeliveryLocation
   ```

- `Submit to Microsoft` - select this action to submit false positive or false negative emails to Microsoft.

  As part of the submission, you can also add URLs and URL domains, sender domains, and file attachments to the Tenant Allow/Block List to immediately resolve the issue while Microsoft evaluates the submission.

    > [!IMPORTANT]
    > To block a URL or URL domain, join the [`EmailUrlInfo`](advanced-hunting-emailurlinfo-table.md) table with `NetworkMessageId` to get the required details. To block an attachment (file), join the [`EmailAttachmentInfo`](advanced-hunting-emailattachmentinfo-table.md) table with `NetworkMessageId` to get the file's hash.

  **Submit to Microsoft** might be disabled if mandatory columns are missing. To resolve this issue, select **Show empty columns** before you select **Take actions**.

  :::image type="content" source="media/advanced-hunting-take-action/advanced-hunting-take-actions-submit-to-microsoft.png" alt-text="Screenshot of Choose actions page of the Take actions wizard with Submit to Microsoft selected and the Selected entities to block details flyout." lightbox="media/advanced-hunting-take-action/advanced-hunting-take-actions-submit-to-microsoft.png":::

- `Initiate automated investigation` - select this action to trigger [Automated investigation](/defender-office-365/air-about) on email, sender, recipient, or contact recipients.

  **Initiate automated investigation** might be disabled if mandatory columns are missing. To resolve this issue, select **Show empty columns** before you select **Take actions**.

  :::image type="content" source="media/advanced-hunting-take-action/advanced-hunting-take-actions-choose-actions.png" alt-text="Screenshot of the Choose actions page of the Take actions wizard with Initiate automated investigation selected." lightbox="media/advanced-hunting-take-action/advanced-hunting-take-actions-choose-actions.png":::

You can also provide a remediation name and a short description of the action taken to easily track it in the action center history. You can also use the Approval ID to filter for these actions in the action center. This ID is provided at the end of the wizard:

:::image type="content" source="media/advanced-hunting-take-action/choose-email-actions-entities.png" alt-text="take actions wizard showing choose actions for entities" lightbox="media/advanced-hunting-take-action/choose-email-actions-entities.png":::

These email actions also apply to [custom detections](custom-detections-overview.md).

## Review actions taken

The [action center](m365d-action-center.md) under **Action center** > **History** ([security.microsoft.com/action-center/history](https://security.microsoft.com/action-center/history)) records each action individually. To check the status of each action, go to the action center.

> [!NOTE]
> Some tables in this article might not be available in Microsoft Defender for Endpoint. [Turn on Microsoft Defender XDR](m365d-enable.md) to hunt for threats by using more data sources. To move your advanced hunting workflows from Microsoft Defender for Endpoint to Microsoft Defender XDR, see [Migrate advanced hunting queries from Microsoft Defender for Endpoint](advanced-hunting-migrate-from-mde.md).

## Related articles

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Work with query results](advanced-hunting-query-results.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Action center overview](m365d-action-center.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
