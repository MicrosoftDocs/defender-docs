---
title: Migrate file integrity monitoring from previous versions
description: Learn how to migrate File Integrity Monitor (FIM) from previous versions to the new version using Defender for Endpoint.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/10/2025
#customer intent: As a security administrator, I want to migrate FIM so that I can use the latest features and improvements.
---

# Migrate to file integrity monitoring with Defender for Endpoint

[File integrity monitoring](file-integrity-monitoring-overview.md) in Defender for Servers Plan 2 uses the Microsoft Defender for Endpoint agent to collect data from machines according to collection rules.

The previous version of file integrity monitoring used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) or the Azure Monitor Agent (AMA) for data collection. This article describes how to migrate previous versions of MMA and AMA to the new version.

## Prerequisites

- You must enable Defender for Servers Plan 2 to use file integrity monitoring.
- Migration is relevant if file integrity monitoring is currently enabled using MMA or AMA.
- Machines protected by Defender for Servers Plan 2 must run the Microsoft Defender for Endpoint agent. To check agent status on machines in your environment, [use this workbook](https://aka.ms/DfServersDashboard) to do that.

## Migrate from MMA

If you use a previous version of file integrity monitoring with MMA, you might migrate using the in-product migration experience. With the in-product experience, you can:

- Review the current environment before migrating.
- Export current file integrity monitoring rules that use MMA in a Log Analytics workspace.
- Migrate to the new experience if Defender for Servers Plan 2 is active.

### Before you start

Note that:

- You can only run the migration tool once per subscription. You can't run it again to migrate rules from multiple workspaces in the same subscription.
- The in-product migration requires Security Admin permissions on the target subscription and Owner permissions on the target Log Analytics workspace.
- The tool lets you transfer existing monitoring rules to the new experience.
- You can't migrate custom and legacy built-in rules that aren't part of the new experience, but you can export them to a JSON file.
- The migration tool lists all the machines in a subscription, not just those onboarded to file integrity monitoring with MMA.
  - The legacy version required MMA connected to the Log Analytics workspace. Machines protected by Defender for Servers Plan 2 but not running MMA didn't benefit from file integrity monitoring.
  - With the new experience, all machines in the enabled scope benefit from file integrity monitoring.
- Although the new experience doesn't need an MMA agent, you must specify a source and target workspace in the migration tool.
  - The source is the workspace from which you transfer existing rules into the new experience.
  - The target is the workspace where change logs are written when monitored files and registries change.
- After enabling the new experience on a subscription, machines in the enabled scope are covered by the same file integrity monitoring rules.
- To exempt individual machines from file integrity monitoring, downgrade them to Defender for Servers Plan 1 by [enabling Defender for Servers at the resource level](tutorial-enable-servers-plan.md#enable-defender-for-servers-at-the-resource-level)

### Migrate with the in-product experience

1. In Defender for Cloud, go to **Workload protections** > **File Integrity Monitoring**.
1. In the banner message, select **Click here to migrate your environments**.

    :::image type="content" source="./media/migrate-file-integrity-monitoring/migrate-banner.png" alt-text="Screenshot showing the migrate button in the Defender for Cloud banner." lightbox="./media/migrate-file-integrity-monitoring/migrate-banner.png":::

1. On the **Prepare your environments to MMA deprecation** page, start the migration.
1. On the **Migrate to the new FIM** tab, under **Migrate to FIM's new version over MDE**, select **Take action**.

    :::image type="content" source="./media/migrate-file-integrity-monitoring/take-action.png" alt-text="Screenshot showing the take action button in the Defender for Cloud banner." lightbox="./media/migrate-file-integrity-monitoring/take-action.png":::

1. On the **Migrate to the new FIM** tab, you can see all the subscriptions that host machines with legacy file integrity monitoring enabled.
    - **Total machines on subscription** shows all the Azure VMs and Azure Arc-enabled VMs in the subscription.
    - **Machines configured for FIM** shows the number of machines with legacy file integrity monitoring enabled.
1. In the **Action** column next to each subscription, select **Migrate**.
1. On **Update subscription** > **Review machines of the subscription**, you see a list of the machines that have legacy file integrity monitoring enabled and their related Log Analytics workspace. Select **Next**.
1. On the **Migrate settings** tab, select a workspace as the migration source.
1. Review the workspace configuration, including the Windows registry and Windows/Linux files. There's an indication of whether settings and files can be migrated.
1. If you have files and settings that can't be migrated, select **Save workspace settings as file**.
1. Under **Choose destination workspace for FIM data storing**, specify the Log Analytics workspace where you want to store changes with the new file integrity monitoring experience. You can use the same workspace or select a different one.
1. Select **Next**.
1. On the **Review and approve** tab, review the migration summary. Select **Migrate** to start the migration process.

After the migration finishes, the subscription is removed from the migration wizard, and migrated file integrity monitoring rules are applied.

### Disable the legacy MMA solution

Follow these steps to disable file integrity monitoring with MMA manually.

1. [Remove the Azure ChangeTracking solution](/azure/automation/change-tracking/remove-feature#remove-changetracking-solution) from the Log Analytics workspace.

     After removal, no new file integrity monitoring events are collected. Historical events remain stored in the relevant Log Analytics workspace under the **Change Tracking** section in the `ConfigurationChange` table. Events are stored according to the [workspace data retention settings](/azure/azure-monitor/logs/data-retention-configure).

1. If you no longer need MMA on machines, disable the use of the Log Analytics agent.

    - If you don't need the agent on any machines, [turn off automatic agent provisioning](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/DataCollectionBladeV2) in the subscription.
    - For a specific machine, remove the agent using the [Azure Monitor Discovery and Removal Utility](/azure/azure-monitor/agents/azure-monitor-agent-mma-removal-tool).

## Migrate from AMA

Follow these steps to migrate from file integrity monitoring with AMA.

1. Remove the related file change tracking data collection rules (DCR).
1. To do this, follow the instructions in [Remove-AzDataCollectionRuleAssociation](/powershell/module/az.monitor/remove-azdatacollectionruleassociation) and [Remove-AzDataCollectionRule](/powershell/module/az.monitor/remove-azdatacollectionrule).

    After removal, no new file integrity monitoring events are collected. Historical events remain stored in the relevant workspace under the table `ConfigurationChange` in the Change Tracking section. Events are stored according to the [workspace data retention settings](/azure/azure-monitor/logs/data-retention-configure).

If you want to keep using AMA to consume file integrity monitoring events, manually connect to the relevant workspace and view changes in the **Change Tracking** table with this query.

```kusto
ConfigurationChange  
| where TimeGenerated > ago(14d)  
| where ConfigChangeType in ('Registry', 'Files')  
| summarize count() by Computer, ConfigChangeType
```

To continue onboarding new scope or configuring monitoring rules, manually work with data collection rules and customize data collection.

> [!div class="nextstepaction"]
> [Review changes](file-integrity-monitoring-review-changes.md) in file integrity monitoring.
