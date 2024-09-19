---
title: Track changes to system files and registry keys
description: Learn about tracking changes to system files and registry keys with file integrity monitoring in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/28/2024
---
# Overview - File integrity monitoring

In the Defender for Servers plan in Microsoft Defender for Cloud, the file integrity monitoring feature provides visibility into machine changes by examining operating system files, Windows registries, application software, and Linux system files to detect suspicious tampering activity such as file and registry modifications.

File integrity monitoring uses [Azure Automation change tracking](/azure/automation/change-tracking/overview) so that you can monitor changes directly in Defender for Cloud. 

File integrity monitoring uses the Defender for Endpoint agent that's integrated by default with Defender for Servers.

> [!Note]
> The older method of data collection for file integrity monitoring uses the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA)). Support for using the MMA will end in November 2024.

An in-product experience has been released to allow you to migrate your FIM configuration over MMA to the new FIM over Defender for Endpoint version. With this experience you can:

Review affected environment with previous FIM version over MMA enabled and required migration.
Export your current FIM rules from MMA- based experience and reside on workspaces
Migrate to P2 enabled subscriptions with new FIM over MDE.
To use the migration experience, navigate to "Environment settings" blade and click "MMA migration" button in the upper row.


## Defender for Endpoint monitoring

When file integrity monitoring uses integrated Defender for Endpoint, the Defender for Endpoint sensor collects data from machines in accordance with data collection rules. When the current state of your system files is compared with the state during the previous scan, file integrity monitoring notifies you about suspicious modifications.

Using the Defender for Endpoint sensor, you can: 

- Monitor changes made to critical files and Windows registries from a predefined list in real-time.
- Access and analyze the audited changes in a designated Workspace.
- Take advantage of the 500-MB benefit included in the Defender for Servers Plan 2.
- Maintain compliance: FIM offers built-in support for relevant security regulatory compliance standards, such as PCI-DSS, CIS, NIST, and others


## Monitoring suspicious activity

File integrity monitoring informs you about potentially suspicious activity such as:

- File and registry key creation or deletion.
- File modifications, such as changes in file size, access control lists, and hash of the content)
- Registry modifications such as changes in size, access control lists, type, and content)

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
- [Enable file integrity monitoring (Defender for Endpoint)](file-integrity-monitoring-enable-defender-endpoint.md)
- [Enable file integrity monitoring (MMA)](file-integrity-monitoring-enable-log-analytics.md)
