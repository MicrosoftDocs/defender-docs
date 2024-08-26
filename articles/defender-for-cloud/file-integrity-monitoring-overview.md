---
title: Track changes to system files and registry keys
description: Learn about tracking changes to system files and registry keys with file integrity monitoring in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/11/2024
---
# File Integrity Monitoring in Microsoft Defender for Cloud

File Integrity Monitoring (FIM) examines operating system files, Windows registries, application software, and Linux system files for changes that might indicate an attack.

Defender for Cloud recommends entities to monitor with FIM, and you can also define your own FIM policies or entities to monitor. FIM informs you about suspicious activity such as:

- File and registry key creation or removal
- File modifications (changes in file size, access control lists, and hash of the content)
- Registry modifications (changes in size, access control lists, type, and content)

Many regulatory compliance standards require implementing FIM controls, such as PCI-DSS and ISO 17799.

## Which files should I monitor?

When choosing which files to monitor, consider the files that are critical for your system and applications. Monitor files that you don’t expect to change without planning. If you choose files that are frequently changed by applications or operating system (such as log files and text files) it will create noise, making it difficult to identify an attack.

## Next steps

In this article, you learned about File Integrity Monitoring (FIM) in Defender for Cloud.

Next, you can:

- [Enable File Integrity Monitoring using Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md)
