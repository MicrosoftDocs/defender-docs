---
title: Migrate File Integrity Monitoring from previous versions
description: Learn how to migrate File Integrity Monitor (FIM) from previous versions.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/12/2024
---

# Migrate to file integrity monitoring with Defender for Endpoint

In Defender for Servers Plan 2 in Microsoft Defender for Cloud, [file integrity monitoring](file-integrity-monitoring-overview.md), uses the Microsoft Defender for Endpoint agent to collect data from machines, in accordance with collection rules.

The previous version of file integrity monitoring used the Log Analytics agent (also known as the Microsoft monitoring agent (MMA)) or the Azure Monitor agent (AMA) for data collection. This article describes how to migrate previous MMA and AMA versions to the new version.

## Prerequisites

- Defender for Servers Plan 2 must be enabled to use file integrity monitoring.
- Migration is relevant when file integrity monitoring is currently enabled using the MMA or AMA.
- Machines protected by Defender for Servers Plan 2 should be running the Defender for Endpoint agent. If you want to check agent status on machines in your environment, [use this workbook](https://aka.ms/DfServersDashboard) to do that.


## Migrate from MMA 

If you have a previous version of file integrity monitoring using the MMA, you can migrate using the in-product migration experience. Using the in-product experience you can:

- Review the current environment/state before migrating.
- Export current file integrity monitoring rules that use MMA and reside in a Log Analytics workspace.
- Migrate to the new experience if Defender for Servers Plan 2 is enabled.

### Before you start

Note that:

- You can only run the migration tool once for a subscription. You can't run it again to migrate rules from additional or multiple workspaces in the same subscription.
- - Using the in-product migration requires Security Admin permissions on the target subscription, and Owner permissions on the target Log Analytics workspace.
- The tool allows you to transfer existing monitoring rules to the new experience.
- Custom and legacy built-in rules that aren't part of the new experience can't be migrated, but you can export them to a JSON file.
- The migration tool lists all the machines in a subscription, and not all machines that were actually onboarded to file integrity monitoring with MMA.
  - The legacy version required MMA connected to the Log Analytics workspace. This meant that machines that were protected by Defender for Servers Plan 2 but weren't running the MMA didn't benefit from file integrity monitoring.
  - With the new experience, all machines in the enable scope benefit from file integrity monitoring.
- Although the new experience doesn't need an MMA agent, you will need to specify a source and target workspace in the migration tool.
  - The source is the workspace from which you want to transfer existing rules into the new experience.
  - The target is the workspace to which change logs will be written when monitored files and registries change.
- After the new experience is enabled on a subscription, machines in the enabled scope are all covered by the same file integrity monitoring rules.
- If you want to exempt individual machines from file integrity monitoring, you can you can downgrade some of them to Defender for Servers Plan 1 by [enabling Defender for Servers at the resource level](/azure/defender-for-cloud/tutorial-enable-servers-plan#enable-plan-1-for-specific-resources).

### Migrate with the in-product experience

1. In Defender for Cloud > **Workload protections**, open **File Integrity Monitoring**.
1. In the banner message, select **Click here to migrate your environments**.

    :::image type="content" source="./media/migrate-file-integrity-monitoring/migrate-banner.png" alt-text="Screenshot showing the migrate button in the Defender for Cloud banner." lightbox="./media/migrate-file-integrity-monitoring/migrate-banner.png":::

1. In the **Prepare your environments to MMA deprecation** page, start the migration.
1. In the **Migrate to the new FIM** tab, under **Migrate to FIM's new version over MDE** select **Take action**.

    :::image type="content" source="./media/migrate-file-integrity-monitoring/take-action.png" alt-text="Screenshot showing the take action button in the Defender for Cloud banner." lightbox="./media/migrate-file-integrity-monitoring/take-action.png":::

1. In **Migrate to the new FIM** tab, you can see all the subscriptions that host machines with legacy file integrity monitoring enabled.
    - **Total machines on subscription** shows all of the Azure VMs, and Azure Arc-enabled VMs in the subscription.
    - **Machines configured for FIM** shows the number of machines with legacy file integrity monitoring enabled.
1. In the **Action** column next to each subscription, select **Migrate**.
1. In **Update subscription** > **Review machines of the subscription**, you see a list of the machines that have legacy file integrity monitoring enabled, and their related Log Analytics workspace. Select **Next**.
1. In the **Migrate settings** tab, select a workspace as the migration source.
1. Review the workspace configuration, including the Windows registry and Windows/Linux files. There's an indication whether settings and files can be migrated.
1. If you have files and settings that can't be migrated, you can select **Save workspace settings as file**.
1. Under **Choose destination workspace for FIM data storing**, specify the Log Analytics workspace in which you want to store changes with the new file integrity monitoring experience. You can use the same workspace, or select a different once.
1. Select **Next**.
1. In the **Review and approve** tab, review the migration summary. Select **Migrate** to start the migration process.

After the migration finishes, the subscription is removed from the migration wizard and migrated file integrity monitoring rules are applied.

### Disable the legacy MMA solution

Follow these instructions to disable file integrity monitoring using MMA manually.

1. [Remove the Azure ChangeTracking solution](/azure/automation/change-tracking/remove-feature#remove-changetracking-solution) from the Log Analytics workspace.

    After removing, no new file integrity monitoring events are collected. Historical events remain stored in the relevant Log Analytics workspace under the **Change Tracking** section in the `ConfigurationChange` table. Events are stored in accordance with the [workspace data retention settings](/azure/azure-monitor/logs/data-retention-configure).

1. If you no longer need the MMA on machines, you can disable the use of the Log Analytics agent.

    - If you don't need the agent on any machines, [turn off automatic agent provisioning](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/DataCollectionBladeV2) in the subscription.
    - For a specific machine, remove the agent using the [Azure Monitor Discovery and Removal Utility](/azure/azure-monitor/agents/azure-monitor-agent-mma-removal-tool).

## Migrate from AMA

Follow these instructions to migrate from file integrity monitoring using the AMA.

1. Remove the related file change tracking data collection rules (DCR).
1. To do this, follow the instructions in [Remove-AzDataCollectionRuleAssociation](/powershell/module/az.monitor/remove-azdatacollectionruleassociation) and [Remove-AzDataCollectionRule](/powershell/module/az.monitor/remove-azdatacollectionrule).

    After removing, no new file integrity monitoring events are collected. Historical events remain stored in the relevant workspace under the table `ConfigurationChange` under the Change Tracking section. Events are stored in accordance with the [workspace data retention settings](/azure/azure-monitor/logs/data-retention-configure).

If you do want to keep using the AMA to consume file integrity monitoring events, you can manually connect to the relevant workspace and view changes in the **Change Tracking** table with this query.

```kusto
ConfigurationChange  
| where TimeGenerated > ago(14d)  
| where ConfigChangeType in ('Registry', 'Files')  
| summarize count() by Computer, ConfigChangeType
```

To continue onboarding new scope or configuring monitoring rules, you need to manually work with data collection rules and customize data collection.

## Next steps

[Review changes](file-integrity-monitoring-review-changes.md) in file integrity monitoring.
