---
title: Use the data ingestion benefit in Microsoft Defender for Cloud
description: Learn how to take advantage of the data ingestion benefit in Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.author: elkrieger
author: elazark
ms.date: 10/20/2024
---

# Use the data ingestion benefit

When you enable Defender for Servers Plan 2 in Microsoft Defender for Cloud, you can take advantage of 500 MB of free data ingestion per day. Here's how it works.

- Defender for Servers Plan 2 provides an allowance of 500 MB per node per day for specific security data types that are directly collected by Defender for Cloud.
- Data ingestion is calculated per machine, per reported workspace, and per day.
- Total daily free limit is equal to [number of machines] x 500 MB.
- The allowance is a daily rate averaged across all machines.
- You aren't charged extra if the total doesn't exceed your total daily free limit, even if some machines send 100 MB and others send 800 MB.
- The benefit is granted to the Log Analytics workspace to which the machine reports.

## Prerequisites

- The benefit is available for every machine running the Azure Monitor agent (AMA) that's located in a subscription that has Defender for Servers Plan 2 enabled.
-  Defender for Servers Plan 2 must be specifically enabled on the workspace to which machines report.
- If the machine reports to more than one workspace, the benefit is only granted to one of them.

The following subset of [security data types](/azure/azure-monitor/reference/tables-category#security) are supported for the benefit:

- [SecurityAlert](/azure/azure-monitor/reference/tables/securityalert)
- [SecurityBaseline](/azure/azure-monitor/reference/tables/securitybaseline)
- [SecurityBaselineSummary](/azure/azure-monitor/reference/tables/securitybaselinesummary)
- [SecurityDetection](/azure/azure-monitor/reference/tables/securitydetection)
- [SecurityEvent](/azure/azure-monitor/reference/tables/securityevent)
- [WindowsFirewall](/azure/azure-monitor/reference/tables/windowsfirewall)
- [ProtectionStatus](/azure/azure-monitor/reference/tables/protectionstatus)
- [Update](/azure/azure-monitor/reference/tables/update) and [UpdateSummary](/azure/azure-monitor/reference/tables/updatesummary) when the Update Management solution isn't running in the workspace or solution targeting is enabled.
- [MDCFileIntegrityMonitoringEvents](/azure/azure-monitor/reference/tables/mdcfileintegritymonitoringevents)


## Configure a workspace

Follow the instructions in the Azure Monitor documentation to [create a Log Analytics workspace](/azure/azure-monitor/logs/quick-create-workspace).


## Enable Defender for Servers Plan 2 on the workspace


1. In the [Azure portal](https://portal.azure.com), search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**, and select the relevant workspace.

1. Select the relevant workspace.

1. Toggle the servers plan to **On**, and then select **Save**.

    :::image type="content" source="media/tutorial-enable-servers-plan/enable-workspace-servers.png" alt-text="Screenshot that shows the plan enablement page at the Log Analytics workspace level." lightbox="media/tutorial-enable-servers-plan/enable-workspace-servers.png":::


> [!Note]
> If you want to disable Defender for Servers Plan 2 in the future, you need to explicitly disable the plan on any Log Analytics workspace that has it enabled.


