---
title: Use the data ingestion benefit in Microsoft Defender for Cloud
description: Learn how to take advantage of the data ingestion benefit in Microsoft Defender for Cloud.
ms.topic: how-to
ms.author: elkrieger
author: elazark
ms.date: 12/15/2025
---

# Use the data ingestion benefit

When you enable Defender for Servers Plan 2 in Microsoft Defender for Cloud, you receive 500 MB of free data ingestion per node daily.

- The 500 MB/day allowance applies to each machine for specific security data types collected by Defender for Cloud.
- Defender for Cloud calculates data ingestion daily for each machine and workspace.
- The total daily free limit equals the number of machines × 500 MB.
- Defender for Cloud averages the allowance across all machines in the subscription each day.
- You aren’t charged extra if the total remains within the daily free limit, even if some machines send 100 MB and others send 800 MB.
- The benefit is applied to the Log Analytics workspace where the machine reports.
- The benefit doesn't appear on your invoice because it has zero cost. You can see it in the product UI and in Microsoft Cost Management exports. Learn how to  [view your data allocation benefits](/azure/azure-monitor/fundamentals/cost-usage#view-data-allocation-benefits).

## How the data ingestion benefit is applied

When Defender for Servers Plan 2 is enabled on a Log Analytics workspace, the 500 MB/day data ingestion benefit is applied automatically to eligible security tables when data is ingested into them.

> [!NOTE]
> The 500 MB/day benefit depends on the workspace billing model:
>
> - **Microsoft Sentinel classic meters**: Applies only to Log Analytics ingestion.
> - **Microsoft Sentinel simplified (unified) meters**: There’s no separate Log Analytics ingestion meter, so the benefit applies to Sentinel ingestion.

## Prerequisites

To use the 500 MB/day data-ingestion benefit, make sure:

- Azure Monitor Agent (AMA) is installed on every machine in a subscription that has Defender for Servers Plan 2 enabled.

- Defender for Servers Plan 2 is enabled on each Log Analytics workspace where these machines report.  

> [!NOTE]
> If a machine reports to more than one workspace, Defender for Cloud applies the 500 MB/day benefit to only one workspace.

The following subset of  [security data types](/azure/azure-monitor/reference/tables-category#security) are supported for the benefit:

- [SecurityAlert](/azure/azure-monitor/reference/tables/securityalert)
- [SecurityBaseline](/azure/azure-monitor/reference/tables/securitybaseline)
- [SecurityBaselineSummary](/azure/azure-monitor/reference/tables/securitybaselinesummary)
- [SecurityDetection](/azure/azure-monitor/reference/tables/securitydetection)
- [SecurityEvent](/azure/azure-monitor/reference/tables/securityevent)
- [WindowsFirewall](/azure/azure-monitor/reference/tables/windowsfirewall)
- [ProtectionStatus](/azure/azure-monitor/reference/tables/protectionstatus)
- [Update](/azure/azure-monitor/reference/tables/update) and [UpdateSummary](/azure/azure-monitor/reference/tables/updatesummary) when the Update Management solution isn't running in the workspace or solution targeting is enabled.
- [MDCFileIntegrityMonitoringEvents](/azure/azure-monitor/reference/tables/mdcfileintegritymonitoringevents)
- [WindowsEvent](/azure/azure-monitor/reference/tables/windowsevent?branch=main)
- [LinuxAuditLog](/azure/azure-monitor/reference/tables/linuxauditlog)

> [!NOTE]
> Although `WindowsEvent` is listed, only security events from the `Microsoft-SecurityEvent` stream that go to the `SecurityEvent` table qualify for the 500 MB/day allowance. Application, System, or other event log channels are not covered and are billed as regular ingestion.

## Configure a workspace

Follow Azure Monitor instructions to [create a Log Analytics workspace](/azure/azure-monitor/logs/quick-create-workspace).

## Enable Defender for Servers Plan 2

To get the 500 MB/day data ingestion benefit, enable Defender for Servers Plan 2 on the Log Analytics workspace.

1. In the [Azure portal](https://portal.azure.com), search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**, and select the relevant workspace.

1. Select the relevant workspace.

1. Toggle on the servers plan, then select **Save**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-workspace-servers.png" alt-text="Screenshot that shows the plan enablement page at the Log Analytics workspace level." lightbox="media/tutorial-enable-servers-plan/enable-workspace-servers.png":::

> [!NOTE]
> To disable Defender for Servers Plan 2, turn it off on each Log Analytics workspace where it's enabled.

## Related content

- [Use Data Collection Rules to customize how Defender for Servers data is ingested](dcr-defender-servers-ingestion.md)
