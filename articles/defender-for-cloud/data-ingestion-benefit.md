---
title: Use the data ingestion benefit in Microsoft Defender for Cloud
description: Learn how to take advantage of the data ingestion benefit in Microsoft Defender for Cloud.
ms.topic: quickstart
ms.author: elkrieger
author: elazark
ms.date: 04/08/2025
---

# Use the data ingestion benefit

When you enable Defender for Servers Plan 2 in Microsoft Defender for Cloud, you take advantage of 500 MB of free data ingestion daily. Here's how it works.

- Defender for Servers Plan 2 provides an allowance of 500 MB per node daily for specific security data types directly collected by Defender for Cloud.
- Data ingestion is calculated per machine, per reported workspace, and daily.
- The total daily free limit equals [number of machines] x 500 MB.
- The allowance is a daily rate averaged across all machines.
- You don't get charged extra if the total doesn't exceed your daily free limit, even if some machines send 100 MB and others send 800 MB.
- The benefit is granted to the Log Analytics workspace where the machine reports.
- The benefit might not appear on your invoice, since it has zero cost. The benefit is visible in the product and in exports from Microsoft Cost Management. Learn how to  [view your data allocation benefits](/azure/azure-monitor/fundamentals/cost-usage#view-data-allocation-benefits).

## Prerequisites

- Every machine running the Azure Monitor agent (AMA) in a subscription with Defender for Servers Plan 2 enabled gets the benefit.
- Every workspace where machines report must have Defender for Servers Plan 2 enabled.
- Every machine reporting to more than one workspace gets the benefit granted to only one of them.

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

## Configure a workspace

Azure Monitor describes how to [create a Log Analytics workspace](/azure/azure-monitor/logs/quick-create-workspace).

## Enable Defender for Servers Plan 2 on the workspace

1. In the [Azure portal](https://portal.azure.com), search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**, and select the relevant workspace.

1. Select the relevant workspace.

1. Toggle the servers plan to **On**, and then select **Save**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-workspace-servers.png" alt-text="Screenshot that shows the plan enablement page at the Log Analytics workspace level." lightbox="media/tutorial-enable-servers-plan/enable-workspace-servers.png":::

> [!NOTE]
> If you want to disable Defender for Servers Plan 2, you explicitly disable the plan on any Log Analytics workspace with it enabled.

