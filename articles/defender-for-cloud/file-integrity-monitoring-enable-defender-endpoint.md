---
title: File Integrity Monitoring with Microsoft Defender for Endpoint
description: Learn how to enable File Integrity Monitor when you collect data with Microsoft Defender for Endpoint.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 09/09/2024
---

# Enable file integrity monitoring 

In the Defender for Servers plan in Microsoft Defender for Cloud, the [file integrity monitoring](file-integrity-monitoring-overview.md) feature provides visibility into machine changes by examining operating system files, Windows registries, application software, and Linux system files to detect suspicious tampering activity such as file and registry modifications.

File integrity monitoring uses [Azure Automation change tracking](/azure/automation/change-tracking/overview) so that you can monitor changes directly in Defender for Cloud. 

This article describes how to set up file integrity monitoring with the integrated [Microsoft Defender for Endpoint](file-integrity-monitoring-overview.md#defender-for-endpoint-monitoring) agent.

For guidance on which files to monitor, see [Which files should I monitor?](file-integrity-monitoring-overview.md#choosing-what-to-monitor).

## Prerequisites

- [Defender for Servers Plan 2](plan-defender-for-servers-select-plan.md#plan-features) should be enabled.
- The [Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) sensor should be installed on machines you want to monitor.
- You need **Workspace owner** or **Security admin** permissions to enable and disable file integrity monitoring. **Reader** permissions can view results.
- File integrity monitoring with Defender for Endpoint is supported from Azure VMs, Azure Arc-enabled VMs, connected AWS accounts and GCP projects.


## Enable file integrity monitoring

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defenders for Servers plan and select **Settings**.
1. In the **File Integrity Monitoring** section, switch the toggle to **On**. Then select **Edit configuration**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png" alt-text="Screenshot of how to enable File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png":::

1. The **FIM configuration** pane opens. In the **Workspace selection** dropdown, select the workspace where you want to store the FIM data. If you want to create a new workspace, select **Create new**.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png" alt-text="Screenshot of the FIM configuration pane." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png":::

    > [!IMPORTANT]
    > Events collected for FIM powered by Defender for Endpoint are included in the data types eligible for the 500 MB benefit for Defender for Servers Plan 2 customers. For more information, see [What data types are included in the daily allowance?](/azure/defender-for-cloud/faq-defender-for-servers#what-data-types-are-included-in-the-daily-allowance-).

1. In the lower section of the **FIM configuration** pane, select the **Windows registry**, **Windows files**, and **Linux files** tabs to choose the files and registries you want to monitor. If you choose the top selection in each tab, all files and registries are monitored. Select **Apply** to save your changes.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration-tabs.png" alt-text="Screenshot of the FIM configuration tabs." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration-tabs.png":::

1. Select **Continue**.

1. Select **Save**.

## Disable file integrity monitoring

If you disable file integrity monitoring, no new events are collected. However, the data collected before the disabling the feature remains in the workspace, according to the workspace's retention policy.

Disable as follows:

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Search for and select **Microsoft Defender for Cloud**.
1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defenders for Servers plan and select **Settings**.
1. In the **File Integrity Monitoring** section, switch the toggle to **Off**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/disable-file-integrity-monitoring.png" alt-text="Screenshot of how to disable File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/disable-file-integrity-monitoring.png":::

1. Select **Apply**.

1. Select **Continue**.

1. Select **Save**.

## Next steps

[Review changes](file-integrity-monitoring-review-changes.md) with file integrity monitoring.
