---
title: Enable File Integrity Monitoring (Azure Monitor Agent)
description: Learn how to enable File Integrity Monitor when you collect data with the Azure Monitor Agent (AMA.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/12/2024
---
# Enable file integrity monitoring with the Azure Monitor Agent

In the Defender for Servers plan in Microsoft Defender for Cloud, [file integrity monitoring](file-integrity-monitoring-overview.md) examines operating system files, Windows registries, application software, and Linux system files for changes that might indicate an attack.

File integrity monitoring using the the Azure Monitor Agent (AMA) collects data from machines according to [data collection rules](../azure-monitor/essentials/data-collection-rule-overview.md). When the current state of your system files is compared with the state during the previous scan, FIM notifies you about suspicious modifications.


> [!NOTE]
> - File integrity monitoring in general availability (GA) uses the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) for change tracking.The MMA is set to retire, and file integrity monitoring using the MMA will be deprecated in November 2024.
> - File integrity monitoring was available in preview using the Azure Monitoring Agent (AMA) described on this page. This preview is no longer supported.
> - A new version of the feature, using the Microsoft Defender for Endpoint agent that's integrated with Defender for Servers will be released in preview around August 2024.


## Prerequisites

- File integrity monitoring with the AMA is in preview. The [AMA must be installed](../azure-monitor/vm/monitor-virtual-machine-agent.md) on machines you want to monitor.
- File integrity monitoring is available in [Defender for Servers Plan 2]((defender-for-servers-introduction.md)). The plan must be enabled.
- You need Owner/Contributor permissions to configure file integrity monitoring.
- File integrity monitoring is supported for Azure VMs, on-premises machines onboarded as Azure Arc VMs, and AWS accounts and GCP projects connected to Defender for Cloud.
- File integrity monitoring is supported in the Azure commercial cloud in these regions: `australiaeast`, `australiasoutheast`, `canadacentral`, `centralindia`, `centralus`, `eastasia`, `eastus2euap`, `eastus`, `eastus2`, `francecentral`, `japaneast`, `koreacentral`, `northcentralus`, `northeurope`, `southcentralus`, `southeastasia`, `switzerlandnorth`, `uksouth`, `westcentralus`, `westeurope`, `westus`, `westus2`


## Enable file integrity monitoring with AMA

To enable, use the file integrity monitoring recommendation to select machines to monitor:

1. In Defender for Cloud, open the **Recommendations** page.
1. Select the recommendation [File integrity monitoring should be enabled on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/9b7d740f-c271-4bfd-88fb-515680c33440).
1. Select the machines you want to monitor. Select **Fix** > **Fix X resources**.

    The recommendation fix:

    - Installs the `ChangeTracking-Windows` or `ChangeTracking-Linux` extension on the machines.
    - Generates a data collection rule for the subscription named `Microsoft-ChangeTracking-[subscriptionId]-default-dcr` that defines what files and registries should be monitored based on default settings. The fix attaches the DCR to all machines in the subscription that have AMA installed and file integrity monitoring enabled.
    - Creates a new Log Analytics workspace with the naming convention `defaultWorkspace-[subscriptionId]-fim` and with the default workspace settings.

    You can update the DCR and Log Analytics workspace settings later.

1. From Defender for Cloud's sidebar, go to **Workload protections** > **File integrity monitoring**, and select the banner to show the results for machines with the AMA.

    :::image type="content" source="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-banner.png" alt-text="Screenshot of banner in File integrity monitoring to show the results for machines with Azure Monitor Agent." lightbox="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-banner.png":::

1. The machines with File Integrity Monitoring enabled are shown.

    :::image type="content" source="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-results.png" alt-text="Screenshot of File integrity monitoring results for machines with Azure Monitor Agent." lightbox="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-results.png":::

    You can see the number of changes that were made to the tracked files, and you can select **View changes** to see the changes made to the tracked files on that machine.

## Edit the list of tracked files and registry keys

File integrity monitoring with the AMA uses [data collection rules](../azure-monitor/essentials/data-collection-rule-overview.md) to define the list of files and registry keys to track. Each subscription has a rule for the machines in that subscription.

File integrity monitoring created data collection rules with a default configuration of tracked files and registry keys. You can edit the rules to add, remove, or update the list of files and registries that are tracked.

To edit the list of tracked files and registries:

1. In **File integrity monitoring**, select **Data collection rules**.

    You can see each of the rules that were created for the subscriptions that you have access to.

1. Select the data collection rule that you want to update for a subscription.

    Each file in the list of Windows registry keys, Windows files, and Linux files contains a definition for a file or registry key, including name, path, and other options. You can also set **Enabled** to **False** to untrack the file or registry key without removing the definition.

    Learn more about [system file and registry key definitions](../automation/change-tracking/manage-change-tracking.md#track-files).

1. Select a file, and then add or edit the file or registry key definition.

1. Select **Add** to save the changes.

## Exclude machines from monitoring

Every machine in the subscription that is attached to the data collection rule is monitored. You can detach a machine from the rule so that the files and registry keys aren't tracked.

To exclude a machine:

1. In the list of monitored machines in the results, select the menu (**...**) for the machine
1. Select **Detach data collection rule**.

    :::image type="content" source="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-detach-rule.png" alt-text="Screenshot of the option to detach a machine from a data collection rule and exclude the machines from File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-ama/file-integrity-monitoring-azure-monitoring-agent-detach-rule.png":::

The machine moves to the list of unmonitored machines, and file changes aren't tracked for that machine anymore.

