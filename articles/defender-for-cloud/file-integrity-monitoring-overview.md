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


> [!Note]
> There are some upcoming changes for file integrity monitoring.
> - The MMA is set to retire, and file integrity monitoring using the MMA will be deprecated in November 2024. File integrity monitoring using the AMA in preview is no longer supported.
> - A new version of file integrity monitoring using the Microsoft Defender for Endpoint agent that's integrated by default with Defender for Servers will be released in preview around September 2024.

## Agent-based monitoring

File integrity monitoring can use the [Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA))](/azure/automation/change-tracking/overview) in general availability (GA), or the [Azure Monitoring Agent (AMA)](/azure/automation/change-tracking/overview-monitoring-agent) in preview to collect information.

- With MMA, when file integrity monitoring is enabled on a workspace the MMA collects change data from devices in accordance with workspace configuration settings, and sends it to the workspace for analysis.
- With AMA, when file integrity monitoring is enabled, the AMA collects change data from devices in accordance with data collection rules that define a list of files and registries to track. You can use default data collection rules, or customize. Changes are sent to a Log Analytics workspace that you specify when you turn on file integrity monitoring. You can customize the workspace used for file integrity monitoring.
- Workspaces with file integrity monitoring enabled have the **Azure Change Tracking** monitoring solution configured. If you remove the solution directly from the workspace, file integrity monitoring is disabled.



## Suspicious activity

File integrity monitoring informs you about suspicious activity such as:

- File and registry key creation or removal
- File modifications (changes in file size, access control lists, and hash of the content)
- Registry modifications (changes in size, access control lists, type, and content)

Many regulatory compliance standards require implementing file integrity monitoring controls, such as PCI-DSS and ISO 17799.

## Choosing what to monitor

Defender for Cloud recommends entities to monitor with file integrity monitoring, and you can define your own entities. When choosing which files to monitor:

- Consider the files that are critical for your system and applications.
- Monitor files that you don’t expect to change without planning. 
- If you choose files that are frequently changed by applications or operating system (such as log files and text files) it will create noise, making it difficult to identify an attack.


## Recommended items to monitor

Defender for Cloud recommends monitoring these items based on known attack patterns.


## Next steps

- [Enable file integrity monitoring (AMA)](file-integrity-monitoring-enable-ama.md)
- [Enable file integrity monitoring (MMA)](file-integrity-monitoring-enable-log-analytics.md)
