---
title: File Integrity Monitoring with Microsoft Defender for Endpoint
description: Learn how to enable File Integrity Monitor when you collect data with Microsoft Defender for Endpoint.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 09/09/2024
---

# Enable file integrity monitoring 

In Defender for Servers Plan 1 in Microsoft Defender for Cloud, the [file integrity monitoring](file-integrity-monitoring-overview.md) feature provides visibility into machine changes by examining operating system files, Windows registries, application software, and Linux system files to detect suspicious tampering activity such as file and registry modifications.


After enabling Defender for Servers Plan 2, this article describes how to configure file integrity monitoring using the Microsoft Defender for Endpoint agent to collect data.

> [!Note]
> - If you are using the older deprecated method of data collection using the Log Analytics agent, [migrate to the new file integrity monitoring experience](migrate-file-integrity-monitoring.md) that uses the Defender for Endpoint agent.
> - From June 2025 onwards, file integrity monitoring requires a minimum version of the Defender for Endpoint client. 
>   - Windows: 10.8760
>   - Linux: 30.124082


## Prerequisites

- [Defender for Servers Plan 2](tutorial-enable-servers-plan.md) should be enabled.
- The [Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) agent should be installed on machines you want to monitor.
- You need **Workspace owner** or **Security admin** permissions to enable and disable file integrity monitoring. **Reader** permissions can view results.
- File integrity monitoring with Defender for Endpoint is supported for Azure VMs, Azure Arc-enabled VMs, connected AWS accounts and GCP projects.
- For guidance on which files to monitor, see [Which files should I monitor?](file-integrity-monitoring-overview.md#choose-what-to-monitor).

## Verify Defender for Endpoint client

Machine should be running Defender for Endpoint client version:
    - Windows: 10.8760
    - Linux: 30.124082

1. To ensure you have the latest version on machines running Windows Servers 2019 or later, refer to the latest Windows updates. Learn more about using the [Windows Servers Update Service to install machines at scale](/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus).
1. To update the Microsoft Defender for Endpoint agent on Windows Servers 2016 and Windows Server 2012 R2 or 2016, install using [KB 5005292 in the Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5005292).
1. Linux machines are updated automatically when Defender for Endpoint automatic provisioning is enabled in Defender for Cloud. You can also [update manually](/defender-endpoint/linux-updates).

## Enable File Integrity Monitoring

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defenders for Servers plan and select **Settings**.
1. In the **File Integrity Monitoring** section, switch the toggle to **On**. Then select **Edit configuration**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png" alt-text="Screenshot of how to enable File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png":::

1. The **FIM configuration** pane opens. In the **Workspace selection** dropdown, select the workspace where you want to store the file integrity monitoring data. If you want to create a new workspace, select **Create new**.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png" alt-text="Screenshot of the file integrity monitoring configuration pane." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png":::

    > [!IMPORTANT]
    > Events collected for file integrity monitoring are included in the data types eligible for the [500 MB benefit for Defender for Servers Plan 2 customers](data-ingestion-benefit.md). 

1. In the lower section of the **FIM configuration** pane, select the **Windows registry**, **Windows files**, and **Linux files** tabs to choose the files and registries you want to monitor. If you choose the top selection in each tab, all files and registries are monitored. Select **Apply** to save your changes.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration-tabs.png" alt-text="Screenshot of the file integrity monitoring configuration tabs." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration-tabs.png":::

1. Select **Continue**.

1. Select **Save**.

## Disable file integrity monitoring

If you disable file integrity monitoring, no new events are collected. However, the data collected before you disabled the feature remains in the Log Analytics workspace, in accordance with the workspace retention policy.

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

[Review changes](file-integrity-monitoring-review-changes.md) in file integrity monitoring.
