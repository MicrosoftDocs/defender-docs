---
title: Enable File Integrity Monitoring (Azure Monitor Agent)
description: Learn how to enable File Integrity Monitor when you collect data with the Azure Monitor Agent (AMA.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/12/2024
---
# Enable file integrity monitoring (Azure Monitor Agent)

In the Defender for Servers plan in Microsoft Defender for Cloud, [file integrity monitoring](file-integrity-monitoring-overview.md) feature provides visibility into machine changes by examining operating system files, Windows registries, application software, and Linux system files to detect suspicious tampering activity such as file and registry modifications.

File integrity monitoring uses Azure Automation change tracking. This article describes how to set up file integrity monitoring with the [Azure Monitoring Agent (AMA)](/azure/automation/change-tracking/overview-monitoring-agent), so that you can monitor changes directly in Defender for Cloud.

> [!Note]
> - File integrity monitoring using the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) is generally availability (GA).
> - The MMA is set to retire, and file integrity monitoring using the MMA will be deprecated in November 2024.
> - File integrity monitoring using the AMA is in preview.
> - A new version of file integrity monitoring using the Microsoft Defender for Endpoint agent that's integrated by default into Defender for Cloud will be released in August 2024.
> When the Defender for Endpoint version is release, support for using the AMA for file integrity monitoring will end.

This article describes how to set up file integrity monitoring with the AMA. This feature is in preview.



## Prerequisites

- The [AMA must be installed](/azure/azure-monitor/vm/monitor-virtual-machine-agent) on machines you want to monitor.
- [Defender for Servers Plan 2](defender-for-servers-introduction.md) must be enabled.
- You need Owner/Contributor permissions to configure file integrity monitoring.
- File integrity monitoring is supported for Azure VMs, on-premises machines onboarded as Azure Arc VMs, and AWS accounts and GCP projects connected to Defender for Cloud.
- File integrity monitoring is supported in the Azure commercial cloud in these regions: `australiaeast`, `australiasoutheast`, `canadacentral`, `centralindia`, `centralus`, `eastasia`, `eastus2euap`, `eastus`, `eastus2`, `francecentral`, `japaneast`, `koreacentral`, `northcentralus`, `northeurope`, `southcentralus`, `southeastasia`, `switzerlandnorth`, `uksouth`, `westcentralus`, `westeurope`, `westus`, `westus2`


## Enable with AMA

Enable file integrity monitoring using a security recommendation.

1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation [File integrity monitoring should be enabled on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/9b7d740f-c271-4bfd-88fb-515680c33440).
1. Select the machines you want to monitor. Select **Fix** > **Fix X resources**. Here's what the fix does:

- Installs the change tracking extension on VMs.

  - Windows extension: `ChangeTracking-Windows`
  - Linux extension: `ChangeTracking-Linux` 
     
- Generates a data collection rule for the default subscription named `Microsoft-ChangeTracking-[subscriptionId]-default-dcr`.

  - This rule defines what files and registries should be monitored based on default settings.
  - The fix attaches the DCR to all machines in the subscription that have AMA installed and file integrity monitoring enabled.

- Creates a new Log Analytics workspace specifically for file integrity monitoring with the naming convention `defaultWorkspace-[subscriptionId]-fim`, with default workspace settings.

    You can update the DCR and Log Analytics workspace settings later.

## Review machines with file integrity monitoring enabled

1. In Defender for Cloud, select **Workload protections** > **File integrity monitoring**.
1. In **File Integrity Monitoring**, select the *file-integrity-monitoring-azure-monitoring-agent-banner.png" alt-text="Screenshot of banner in File integrity monitoring to show machines running the AMA." lightbox="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-banner.png":::

1. Review the machines with file integrity monitoring enabled.

    :::image type="content" source="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-results.png" alt-text="Screenshot of File integrity monitoring results for machines with Azure Monitor Agent." lightbox="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-results.png":::

    You can see the number of changes that were made to the tracked files, and you can select **View changes** to see the changes made to the tracked files on that machine.

## Customize tracking

[Data collection rules](/azure/azure-monitor/essentials/data-collection-rule-overview) define which files and registry keys to track. Each subscription has a rule for the machines in that subscription.

File integrity monitoring creates rules with a with a default tracking settings. You can edit the rules to customize file and registry tracking.

1. In **File integrity monitoring**, select **Data collection rules**. You can see rules in subscriptions you have access to.

1. Select the rule you want to update for a subscription.
1. Select a file and edit the file or registry key definition.

    - You can change entry definitions for a file or registry key, including name, path, and other options.
    - You can disable an entry to untrack it without removing the definition.

    Learn more about [system file and registry key definitions](/azure/automation/change-tracking/manage-change-tracking#track-files).


1. Select **Add** to save the changes.


## Exclude machines from change monitoring

Every machine in the subscription that is attached to the data collection rule is monitored. You can detach a machine from the rule so that the files and registry keys aren't tracked.

1. In **File Integrity Monitoring** > **Monitored machines** tab, select the menu (**...**) for the machine you want to exclude.
1. Select **Detach data collection rule**.

    :::image type="content" source="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-detach-rule.png" alt-text="Screenshot of the option to detach a machine from a data collection rule and exclude the machines from File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-detach-rule.png":::

The machine moves to the list of unmonitored machines, and file changes are no longer tracked for that machine.
