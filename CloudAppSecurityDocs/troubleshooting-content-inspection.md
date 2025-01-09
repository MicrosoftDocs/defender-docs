---
title: Troubleshooting content inspection errors 
description: This article provides a list of content inspection statuses and their meanings.
ms.date: 01/29/2023
ms.topic: conceptual
---
# Troubleshooting content inspection errors



This article provides a list of content inspection statuses and their meanings.

## Content inspection status

The table lists each content inspection status and its description.

|Content inspection status|Description|
|---|---|
|Completed|The content inspection completed successfully.|
|Not applicable|Content inspection wasn't applicable for this file. This status might appear because no policy requires content inspection of this file or because the file type isn't supported.|
|Pending|The file is currently in the content inspection queue.|
|Failed: Download error|Microsoft Defender for Cloud Apps couldn't download the file for inspection.|
|Failed: File is encrypted|The file couldn't be decrypted.|
|Failed: File is corrupted|The file is corrupted in some way and couldn't be inspected.|
|Failed: Internal error|Something undetermined went wrong when trying to inspect the file.|
|Failed: File size exceeded|The file exceeded the maximum file size of 30 MB.|
|Failed: File is too long and was partially scanned|The file exceeded the maximum of 1 million characters. For the part of the content that was scanned, relevant policy matches were applied.|
|Failed: File access denied|The file is external to your cloud and couldn't be accessed by Defender for Cloud Apps.|
|Failed: File was deleted|The file no longer exists in your cloud and couldn't be inspected.|
|Failed: Unsupported file type|Defender for Cloud Apps can't perform content inspection on this file type. This status may appear because the file type isn't supported or because the file isn't actually in the format of the expected file type.|

> [!NOTE]
> If you see a dash in the scan status, this means that the file is not queued to be scanned. See [File policies](data-protection-policies.md) for information on setting content inspection policies.

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
