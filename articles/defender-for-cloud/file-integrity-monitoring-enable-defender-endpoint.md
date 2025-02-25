---
title: Enable file integrity monitoring 
description: Learn how to enable file integrity monitoring when you collect data with Microsoft Defender for Endpoint.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 02/19/2025
---

# Enable file integrity monitoring

In Defender for Servers Plan 2 in Microsoft Defender for Cloud, the [file integrity monitoring](file-integrity-monitoring-overview.md) feature helps to keep enterprise assets and resources secure by scanning and analyzing operating system files, Windows registries, application software, and Linux system files for changes that might indicate an attack.

After you enable Defender for Servers Plan 2, follow the instructions in this article to configure file integrity monitoring using the Microsoft Defender for Endpoint agent to collect data.

> [!NOTE]
>
> - If you are using a previous version of file integrity monitoring that used the Log Analytics agent (also known as the Microsoft Monitoring agent(MMA)), or the Azure Monitor agent (AMA) you can [migrate to the new file integrity monitoring experience](migrate-file-integrity-monitoring.md).
> - From June 2025 onwards, file integrity monitoring requires a minimum version. [Update the agent](#verify-defender-for-endpoint-client-version) as needed.
>   - Windows: 10.8760 or later.
>   - Linux: 30.124082 or later.

## Prerequisites

- [Defender for Servers Plan 2](tutorial-enable-servers-plan.md) should be enabled.
- The [Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) agent should be installed on machines you want to monitor.
- Non-Azure machines should be connected with [Azure Arc](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

- You need **Workspace owner** or **Security admin** permissions to enable and disable file integrity monitoring. **Reader** permissions can view results.

## Verify Defender for Endpoint client version

1. For machines running Windows Server 2019 or later, the Defender for Endpoint agent is updated as part of continuous operating system updates. Make sure Windows machines have the latest update installed. Learn more about using the [Windows Servers Update Service to install machines at scale](/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus).
1. For machines running Windows Servers 2016 and Windows Server 2012 R2, [update machines manually to the latest agent version](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac). You can install [KB 5005292 from the Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5005292). KB 5005292 is periodically updated with the latest agent version.
1. For Linux machines, the Defender for Endpoint agent is automatically updated if autoprovisioning is turned on for the machines in Defender for Cloud. After the MDE.Linux extension is installed on a Linux machine, it attempts to update the agent version each time the VM reboots. You can also [update the agent version manually](/defender-endpoint/linux-updates).

## Enable file integrity monitoring

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defenders for Servers plan and select **Settings**.
1. In the **File Integrity Monitoring** section, switch the toggle to **On**. Then select **Edit configuration**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png" alt-text="Screenshot of how to enable File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png":::

1. The **FIM configuration** pane opens. In the **Workspace selection** dropdown, select the workspace where you want to store the file integrity monitoring data. If you want to create a new workspace, select **Create new**.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png" alt-text="Screenshot of the file integrity monitoring configuration pane." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png":::

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

- Events collected for file integrity monitoring are included in the data types eligible for the 500 MB benefit for Defender for Servers Plan 2 customers. [Learn more about the benefit](data-ingestion-benefit.md).
- [Review changes](file-integrity-monitoring-review-changes.md) in file integrity monitoring.
