---
title: Manage automation file uploads
description: Enable content analysis and configure the file extension and email attachment extensions that will be submitted for analysis
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
ms.date: 06/25/2024
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.custom: sfi-ga-nochange

---
# Manage automation file uploads


Enable the content analysis capability so that certain files and email attachments can automatically be uploaded to the cloud for additional inspection in Automated investigation.

Microsoft uses various file investigation mechanisms to inspect and analyze files.

Identify the files and email attachments by specifying the file extension names and email attachment extension names.

For example, if you add *exe* and *bat* as file or attachment extension names, then all files or attachments with those extensions will automatically be sent to the cloud for additional inspection during Automated investigation.

> [!NOTE]
> Microsoft securely stores the files submitted for a six-month period. Files are promptly deleted after six months.

## Add file extension names and attachment extension names

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

1. Sign in to the [Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2077139) using an account with the Security administrator or Global administrator role assigned.

1. In the navigation pane, select **Settings** \> **Endpoints** \> **Rules** \> **Automation uploads**.

1. Toggle the content analysis setting between **On** and **Off**.

1. Configure the following extension names and separate extension names with a comma:

   - **File extension names** - Suspicious files except email attachments will be submitted for additional inspection

> [!NOTE]
> By default you will see several extension names are automatically filled. One of them is **_double quotes (")_**, this will include files that don't have any file extensions at all.


## Related topics

- [Manage automation folder exclusions](manage-automation-folder-exclusions.md)



