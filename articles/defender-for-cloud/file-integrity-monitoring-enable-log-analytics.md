---
title: Enable file integrity monitoring in Microsoft Defender for Cloud with the MMA
description: Learn how to enable file integrity monitoring in Microsoft Defender for Cloud, using the Microsoft Monitoring agent
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 05/16/2024
#customer intent: As a user, I want to learn how to enable File Integrity Monitoring with the Log Analytics agent so that I can track and identify changes in my environment.
---

# Enable file integrity monitoring (MMA)

In Defender for Servers Plan 2 in Microsoft Defender for Cloud, the [file integrity monitoring](file-integrity-monitoring-overview.md) feature provides visibility into machine changes by examining operating system files, Windows registries, application software, and Linux system files to detect suspicious tampering activity such as file and registry modifications.

After enabling Defender for Servers Plan 2, this article describes how to set up file integrity monitoring using the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA)). File integrity monitoring with the MMA uses [Azure Automation change tracking](/azure/automation/change-tracking/overview) so that you can monitor changes directly in Defender for Cloud. 

> [!Note]
> - Support for using the MMA will end in November 2024.
> - We recommend that you [migrate to the new file integrity monitoring experience](migrate-file-integrity-monitoring.md) that uses the Defender for Endpoint agent.


## Prerequisites

- [Defender for Servers Plan 2](defender-for-servers-introduction.md) must be enabled.
- With the MMA, file integrity monitoring uploads data to a Log Analytics workspace. Data charges apply, based on the amount of data you upload. Learn more about [Log Analytics pricing](https://azure.microsoft.com/pricing/details/log-analytics/).
- You need Workspace Owner permissions to enable/disable file integrity monitoring. Learn more about [Azure roles for Log Analytics](/services-hub/health/azure-roles#azure-roles). The Reader role can view results.
- File integrity monitoring is supported for Azure VMs, on-premises machines onboarded as Azure Arc VMs, and AWS accounts and GCP projects connected to Defender for Cloud.
- When monitoring SQL Servers, file integrity monitoring might create this account: `NT Service\HealthService`. If you delete the account, it's automatically recreated.
- You can't work with file integrity monitoring using the REST API. It's only available in the Azure portal.


## Enable file integrity monitoring (MMA)

1. In Defender for Cloud open **Workload protections**.
1. In the **Advanced protection** area, select **File integrity monitoring**.

   :::image type="content" source="./media/file-integrity-monitoring-overview/open-file-integrity-monitoring.png" alt-text="Screenshot of screenshot of opening the File Integrity Monitoring dashboard." lightbox="./media/file-integrity-monitoring-overview/open-file-integrity-monitoring.png":::

1. Review workspace information.

    - Total number of changes that occurred in the last week (you might see a dash "-“ if file integrity monitoring isn't enabled on the workspace)
    - Total number of computers and VMs reporting to the workspace
    - Geographic location of the workspace
    - Azure subscription that the workspace is under

    If there's no enable or upgrade button, and the space is blank for a workspace, it means that file integrity monitoring is already enabled on the workspace.

    :::image type="content" source="./media/file-integrity-monitoring-overview/workspace-list-fim.png" alt-text="Screenshot of enabling file integrity monitoring for a specific workspace.":::


1. Enable Defender for Cloud plans if needed
1. Turn on file integrity monitoring for a workspace.
1. Review the workspace details, including the number of Windows and Linux machines in the workspace.
1. Expand **Windows files**, **Registry**, and **Linux files** to see the full list of recommended items.

    :::image type="content" source="./media/file-integrity-monitoring-overview/workspace-fim-status.png" alt-text="Screenshot of file integrity monitoringM workspace details page.":::
   The recommended settings for Windows and Linux are also listed.  

1. Clear the checkboxes for any recommended entities you don't want to monitor for changes.

1. Select **Apply file integrity monitoring** to enable file integrity monitoring.

You can change the settings at any time.

## Disable file integrity monitoring

When you disable file integrity monitoring, you remove the Change Tracking solution from the selected Log Analytics workspace.

1. In Defender for Cloud open **Workload protections**.
1. In the **Advanced protection** area, select **File integrity monitoring**.
1. Select a workspace with file integrity monitoring enabled.
1. In the **File Integrity Monitoring** page for the workspace, select **Disable**.

    :::image type="content" source="./media/file-integrity-monitoring-overview/disable-file-integrity-monitoring.png" alt-text="Screenshot of disabling file integrity monitoring from the settings page.":::

1. Select **Remove**.


## Next steps

[Review changes](file-integrity-monitoring-compare-baselines.md) in file integrity monitoring (legacy MMA).
