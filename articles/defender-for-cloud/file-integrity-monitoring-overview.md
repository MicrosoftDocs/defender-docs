---
title: Overview of file integrity monitoring in Microsoft Defender for Cloud
description: Learn about tracking file change with file integrity monitoring in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/28/2024
---
# Overview - File integrity monitoring

In Defender for Servers Plan 2 in Microsoft Defender for Cloud, the file integrity monitoring feature helps keeps enterprise assets and resources secure by scanning and analyzing files, and comparing their current state with previous scans. File integrity monitoring helps you to:

- Meet compliance requirements. File integrity monitoring is often required by regulatory compliance standards such as PCI-DSS and ISO 17799.
- Identity potential security issues by detecting suspicious changes to files.

## Data collection

File integrity monitoring uses the Microsoft Defender for Endpoint agent to collect data from machines, in accordance with collection rules. [Defender for Endpoint is integrated by default](integration-defender-for-endpoint.md#integration-with-defender-for-endpoint-edr) with Defender for Cloud.

> [!Note]
> The older method of data collection uses the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA)). Support for using the MMA will end in November 2024. For a quick overview of the differences between new and old methods, read our [Tech Community blog](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/introducing-the-new-file-integrity-monitoring-with-defender-for/ba-p/4252051).

After enabling Defender for Servers Plan 2, you enable and configure file integrity monitoring.

- File integrity monitoring monitors selected files across a subscription.
- The Defender for Endpoint agent collects data from machines in accordance with a defined list of files to monitor.
- Data collected by the Defender for Endpoint agent is stored for access and analysis in a Log Analytics workspace.
- You can select an existing workspace for file integrity monitoring, or create a new one.
- Collected file integrity monitoring data is part of the the 500 MB benefit included in Defender for Servers Plan 2.

## Migrating to the new experience

In Defender for Cloud, you can migrate file integrity monitoring using the MMA to use the new experience. Follow the steps to [migrate file integrity monitoring](migrate-file-integrity-monitoring.md).

## Monitoring suspicious activity

File integrity monitoring examines operating system files, Windows registries, application software, and Linux system files to detect suspicious activity such as:

- File and registry key creation or deletion.
- File modifications, such as changes in file size, access control lists, and hash of the content.
- Registry modifications such as changes in size, access control lists, type, and content.

File integrity monitoring provides details about the change, including the source of the change, account details, indication of who made the changes, and information about the initiating process.

## Choosing what to monitor

Defender for Cloud recommends entities to monitor with file integrity monitoring, and you can define your own entities. When choosing which files to monitor:

- Consider the files that are critical for your system and applications.
- Monitor files that you don’t expect to change without planning. 
- If you choose files that are frequently changed by applications or operating system (such as log files and text files) it will create noise, making it difficult to identify an attack.


## Recommended items to monitor

When using file integrity monitoring with the Defender for Endpoing agent, we recommend monitoring these items with based on known attack patterns.


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

[Enable file integrity monitoring with Defender for Endpoint)](file-integrity-monitoring-enable-defender-endpoint.md)
