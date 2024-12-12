---
title: Migrate File Integrity Monitoring from previous versions
description: Learn how to migrate File Integrity Monitor (FIM) from previous versions.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/12/2024
---

# Migrate File Integrity Monitoring from previous versions

Microsoft Defender for Servers Plan 2 now offers a new File Integrity Monitoring (FIM) solution powered by Microsoft Defender for Endpoint.

If you don't use the previous versions of FIM, you can onboard directly to the new FIM solution. For more information, see [Enable File Integrity Monitoring with Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md).


## Migrate from FIM over MMA

> [!TIP]
> To help you seamlessly migrate your previous set of monitoring rules from the MMA-based FIM to the [new FIM version powered by Defender for Endpoint](/azure/defender-for-cloud/file-integrity-monitoring-enable-defender-endpoint), we’ve introduced an in-product migration experience, which is accessible from the FIM management blade.  
> This migration experience allows you to review the current environments with legacy FIM enabled, export your legacy FIM rules, and migrate to the new File Integrity Monitoring on subscriptions with Defender for Servers Plan 2 enabled. [Learn more](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/introducing-the-new-file-integrity-monitoring-with-defender-for-endpoint-integra/4252051) about using FIM migration experience. 
> You can also chose to enable FIM over MDE, then remove the FIM over MMA, by following the instructions below.

If you use File Integrity Monitoring (FIM) over Microsoft Monitoring Agent (MMA), you can migrate to the new FIM solution powered by Microsoft Defender for Endpoint. Follow these steps:

1. To disable FIM over MMA, remove the Azure Change Tracking solution. For more information, see [Remove ChangeTracking solution](/azure/automation/change-tracking/remove-feature#remove-changetracking-solution).

1. After you disable the file events collections, new events will stop being collected on the selected scopes. Historical events that already were collected, remain stored in the relevant workspace under the table `ConfigurationChange` under the Change Tracking section. These events will remain available in the relevant workspace according to the retention period defined in this workspace. For more information, see [Manage data retention in a Log Analytics workspace](/azure/azure-monitor/logs/data-retention-configure).

> [!NOTE]
> If you no longer need the legacy Log Analytics agent, make sure you remove it from your environments. For this purpose, be sure to disable the agent's auto provisioning from the [subscription settings](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/DataCollectionBladeV2), then use the [Azure Monitor utility](/azure/azure-monitor/agents/azure-monitor-agent-mma-removal-tool) to discover and remove the Log Analytics agent from your machines.

## Migrate from FIM over AMA

If you use File Integrity Monitoring (FIM) over Azure Monitor Agent (AMA), you can migrate to the [new FIM solution powered by Microsoft Defender for Endpoint](/azure/defender-for-cloud/file-integrity-monitoring-enable-defender-endpoint). Follow these steps:

1. Since onboarding new subscriptions or servers to File Integrity Monitoring based on AMA and the Change Tracking extension, as well as viewing changes, will no longer be available through the Defender for Cloud portal, you need to adjust your processes accordingly.
1. If you wish to continue consuming File Integrity Monitoring events collected by AMA, you can manually connect to the relevant workspace and view changes in the Change Tracking table using the following query:

    ```kusto
    ConfigurationChange  
    | where TimeGenerated > ago(14d)  
    | where ConfigChangeType in ('Registry', 'Files')  
    | summarize count() by Computer, ConfigChangeType
    ```

1. If you want to continue onboarding new scopes or configuring monitoring rules, you can manually use [Data Collection Rules](/azure/azure-monitor/essentials/data-collection-rule-overview) to configure or customize various aspects of data collection.

### Disable FIM over AMA

We recommend that you disable FIM over AMA and use the new FIM solution powered by Microsoft Defender for Endpoint. To disable FIM over AMA, follow these steps:

1. Remove the related file change tracking Data Collection Rules (DCR). For more information, see the instructions in [Remove-AzDataCollectionRuleAssociation](/powershell/module/az.monitor/remove-azdatacollectionruleassociation) and [Remove-AzDataCollectionRule](/powershell/module/az.monitor/remove-azdatacollectionrule).
1. After you disable the file events collections, new events will stop being collected on the selected scopes. Historical events that already were collected, remain stored in the relevant workspace under the table `ConfigurationChange` under the Change Tracking section. These events will remain available in the relevant workspace according to the retention period defined in this workspace. For more information, see [Manage data retention in a Log Analytics workspace](/azure/azure-monitor/logs/data-retention-configure).
## Next steps

- [Enable File Integrity Monitoring with Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md)
