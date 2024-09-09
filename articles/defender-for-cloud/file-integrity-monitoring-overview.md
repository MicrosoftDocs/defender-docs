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

Defender for Cloud provides the following list of recommended items to monitor based on known attack patterns:

> [!NOTE]
> This table applies to [File Integrity Monitoring using Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md). For the recommended items to monitor in FIM over Log Analytics, see [Recommended items to monitor](file-integrity-monitoring-enable-log-analytics.md#recommended-items-to-monitor).

| Linux Files       | Windows files                    | Windows registry keys (HKLM = HKEY_LOCAL_MACHINE)            |
| ----------------- | -------------------------------- | ------------------------------------------------------------ |
| /bin              | C:\config.sys                    | SOFTWARE\Microsoft\Cryptography\OID\*                        |
| /bin/passwd       | C:\Windows\regedit.exe           | SOFTWARE\WOW6432Node\Microsoft\Cryptography\OID\*            |
| /boot             | C:\Windows\System32\userinit.exe | HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows    |
| /etc/*.conf       | C:\Windows\explorer.exe          | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders |
| /etc/cron.daily   | C:\autoexec.bat                  | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders |
| /etc/cron.hourly  | C:\boot.ini                      | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run           |
| /etc/cron.monthly | C:\Windows\system.ini            | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce       |
| /etc/cron.weekly  | C:\Windows\win.ini               | SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce    |
| /etc/crontab      |                                  | SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Windows\ |
| /etc/init.d       |                                  | SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders |
| /opt/sbin         |                                  | SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders |
| /sbin             |                                  | SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run    |
| /usr/bin          |                                  | SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\RunOnce |
| /usr/local/bin    |                                  | SECURITY\POLICY\SECRETS                                      |
| /usr/local/sbin   |                                  |                                                              |
| /usr/sbin         |                                  |                                                              |
| /bin/login        |                                  |                                                              |
| /opt/bin          |                                  |                                                              |


## Next steps

In this article, you learned about File Integrity Monitoring (FIM) in Defender for Cloud.

Next, you can:

- [Enable File Integrity Monitoring using Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md)
