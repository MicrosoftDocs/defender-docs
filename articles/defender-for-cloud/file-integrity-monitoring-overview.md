---
title: Overview of file integrity monitoring in Microsoft Defender for Cloud
description: Learn about tracking file change with file integrity monitoring in Microsoft Defender for Cloud.
author: Elazark
author: elkrieger
ms.topic: conceptual
ms.date: 08/12/2025
---

# File integrity monitoring

The file integrity monitoring feature in Microsoft Defender for Cloud's [Defender for Servers Plan 2](plan-defender-for-servers-select-plan.md), scans operating system files, Windows registries, application software, and Linux system files. It analyzes these files for changes that might indicate an attack.

File integrity monitoring helps you to:

- Meet compliance requirements. Regulatory compliance standards such as PCI-DSS and ISO 17799 often require file integrity monitoring.
- Improve posture and identify potential security issues by detecting suspicious changes to files.

## Monitor suspicious activity

File integrity monitoring examines operating system files, Windows registries, application software, and Linux system files to detect suspicious activity such as:

- File and registry key creation or deletion.
- File modifications, such as changes in file size, access control lists, and hash of the content.
- Registry modifications such as changes in size, access control lists, type, and content.

## Data collection

File integrity monitoring uses the Microsoft Defender for Endpoint agent and agentless scanning to collect data from machines.

- Data collected by the Defender for Endpoint agent and agentless scanning is analyzed for file and registry changes and change logs are stored for access and analysis in a Log Analytics workspace.
- The **Defender for Endpoint agent** collects data from machines in accordance with the files and resources defined for file integrity monitoring. Change events collected via Defender for Endpoint are streamed to your selected workspace in **near realtime**.
- **Agentless scanning** provides insights into file integrity monitoring events in accordance with the files and resources defined for file integrity monitoring. Change events collected via agentless scanning are streamed to your selected workspace on a **24-hour cadence**.
- Collected file integrity monitoring data is part of the [500-MB benefit included in Defender for Servers Plan 2](data-ingestion-benefit.md).
- File integrity monitoring gives information about file and resource changes. It includes the source of the change, account details, indication of who made the changes, and information about the initiating process.

### Migrate to the new version

File integrity monitoring previously used the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA)) or the Azure Monitor agent (AMA) to collect data. If you're using file integrity monitoring with one of these legacy methods, you can [migrate file integrity monitoring](migrate-file-integrity-monitoring.md) to use Defender for Endpoint.

## Configure file integrity monitoring

After enabling Defender for Servers Plan 2, you enable and configure file integrity monitoring. It isn't enabled by default.

- You select a Log Analytics workspace in which to store change events for monitored files/resources. You can use an existing workspace, or define a new one.
- Defender for Cloud recommends resources to monitor with file integrity monitoring. With agentless scanning, you can define custom paths for monitoring in addition to recommended resources.

## Choose what to monitor

Defender for Cloud recommends entities to monitor with file integrity monitoring. You can choose items from the recommendations. When choosing which files to monitor:

- Consider the files that are critical for your system and applications.
- Monitor files that you don’t expect to change without planning.
- Select files that applications or the operating system frequently change (such as log files and text files) creates noise and makes it hard to identify an attack.
- Monitor any file located in a folder `/folder/path/*`.

> [!NOTE]
> The maximum number of rules that can be applied is 500.

### Recommended items to monitor

When using file integrity monitoring with the Defender for Endpoint agent, we recommend monitoring these items with based on known attack patterns.

| **Linux file**    | **Windows files**                | **Windows registry keys (HKEY_LOCAL_MACHINE)**               |
| ----------------- | -------------------------------- | ------------------------------------------------------------ |
| /bin              | C:\config.sys                    | HKLM\SOFTWARE\Microsoft\Cryptography\OID\*                   |
| /bin/passwd       | C:\Windows\regedit.exe           | HKLM\SOFTWARE\WOW6432Node\Microsoft\Cryptography\OID\*       |
| /boot             | C:\Windows\System32\userinit.exe | **Key**: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows<br/>**Values**: loadappinit_dlls, appinit_dlls, iconservicelib |
| /etc/*.conf       | C:\Windows\explorer.exe          | **Key**: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders<br/>**Values**: common startup, startup |
| /etc/cron.daily   | C:\autoexec.bat                  | **Key**: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders<br/> **Values**: common startup, startup |
| /etc/cron.hourly  | C:\boot.ini                      | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run           |
| /etc/cron.monthly | C:\Windows\system.ini            | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce       |
| /etc/cron.weekly  | C:\Windows\win.ini               | HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServicesOnce |
| /etc/crontab      |                                  | **Key**: HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\NT\CurrentVersion\Windows <br/>**Values**: appinit_dlls, loadappinit_dlls |
| /etc/init.d       |                                  | **Key**: HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders <br/> **Values**: common startup, startup |
| /opt/sbin         |                                  | **Key**: HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders <br />**Values**: common startup, startup |
| /sbin             |                                  | HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run |
| /usr/bin          |                                  | HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\RunOnce |
| /usr/local/bin    |                                  | HKLM\SECURITY\POLICY\SECRETS                                 |
| /usr/local/sbin   |                                  |                                                              |
| /usr/sbin         |                                  |                                                              |
| /opt/bin          |                                  |                                                              |

## Custom rules

You can create custom rules to monitor specific files or folders as long as they meet the following validation criteria:

- A maximum of three asterisks `*` are allowed in the path (maximum depth). Wildcards (`*`) are allowed only at the start or end of a path segment.

- Paths with three asterisks must not end with `/` or `\`.

- Windows registry paths must start with `HKLM` or `hklm` and may only contain letters, numbers, spaces, `_`, `.`, `\`, `:`. Wildcards (`*`) are allowed only at the start or end of a path segment.

- Windows file paths may only contain letters, numbers, spaces, `_`, `.`, `\`, `*`, `?`, `:` and must not contain `/`. Wildcards (`*`) are allowed only at the start or end of a path segment.

- Linux file paths must be absolute (start with `/`) and may only contain letters, numbers, spaces, `_`, `.`, `/`, `*`, `:`. Wildcards (`*`) are allowed only at the start or end of a path segment.

- All paths must meet the system’s maximum path length (260 characters) and maximum depth (three asterisks) rules.

### Rule definition validations

- A rule name is required.

- A rule name must contain only letters (a–z, A–Z), digits (0–9), and underscores (_), and can be up to 128 characters.

- Rule name and rule ID must be unique.

- Rule description is optional. If provided:

    - Maximum length is 260 characters.
    - Allowed characters: `letters`, `digits`, and `? ! ) ( . ,`.

- At least one change type (from change management and documentation rRequest (CMDR)) must be selected.

- Between 1 and 500 custom rules are supported per subscription.

## Next steps

[Enable file integrity monitoring with Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md)
