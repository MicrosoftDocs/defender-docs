---
title: Overview of file integrity monitoring in Microsoft Defender for Cloud
description: Learn about tracking file change with file integrity monitoring in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/28/2024
---
# Overview - File integrity monitoring

The file integrity monitoring feature in Microsoft Defender for Cloud helps keeps enterprise assets and resources secure by scanning and analyzing operating system files, Windows registries, application software, and Linux system files for changes that might indicate an attack. File integrity monitoring helps you to:

- Meet compliance requirements. File integrity monitoring is often required by regulatory compliance standards such as PCI-DSS and ISO 17799.
- Improve posture and identify potential security issues by detecting suspicious changes to files.

## Monitoring suspicious activity

File integrity monitoring examines operating system files, Windows registries, application software, and Linux system files to detect suspicious activity such as:

- File and registry key creation or deletion.
- File modifications, such as changes in file size, access control lists, and hash of the content.
- Registry modifications such as changes in size, access control lists, type, and content.


## Data collection

File integrity monitoring uses the Microsoft Defender for Endpoint agent to collect data from machines.

> [!Note]
> The older method of data collection uses the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA)). Support for using the MMA will end in November 2024. For a quick overview of the differences between new and old methods, read our [Tech Community blog](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/introducing-the-new-file-integrity-monitoring-with-defender-for/ba-p/4252051).

- The Defender for Endpoint agent collects data from machines in accordance with the files and resources defined for file integrity monitoring.
    - Data collected by the Defender for Endpoint agent is stored for access and analysis in a Log Analytics workspace.
    - Collected file integrity monitoring data is part of the the [500 MB benefit included in Defender for Servers Plan 2](data-ingestion-benefit.md).
- File integrity monitoring provides details about the file/resource change, including the source of the change, account details, indication of who made the changes, and information about the initiating process.

### Migrating to the new collection method

Follow the steps to [migrate file integrity monitoring](migrate-file-integrity-monitoring.md) from using the MMA to using the Defender for Endpoint agent.

## Configuring file integrity monitoring

After enabling Defender for Servers Plan 2, you enable and configure file integrity monitoring. It isn't enabled by default.

- You select a Log Analytics workspace in which to store change events for monitored files/resources. You can use an existing workspace, or define a new one.
- Defender for Cloud recommends resources to monitor with file integrity monitoring, and you can customize additional monitoring.
- After selecting a workspace you review and customize what you want to monitor. Defender for Cloud recommends resources to include by default in the file integrity monitoring list, and you can define your own.

## Choosing what to monitor

Defender for Cloud recommends entities to monitor with file integrity monitoring, and you can define your own entities. When choosing which files to monitor:

- Consider the files that are critical for your system and applications.
- Monitor files that you don’t expect to change without planning. 
- If you choose files that are frequently changed by applications or operating system (such as log files and text files) it will create noise, making it difficult to identify an attack.


### Recommended items to monitor

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
