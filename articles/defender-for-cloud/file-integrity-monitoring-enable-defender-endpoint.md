---
title: Enable File Integrity Monitoring 
description: Learn how to enable File Integrity Monitoring when you collect data with Microsoft Defender for Endpoint.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 06/24/2025
#customer intent: As a security administrator, I want to enable File Integrity Monitoring so that I can detect unauthorized changes to critical files.
---

# Enable File Integrity Monitoring

In Defender for Servers Plan 2 in Microsoft Defender for Cloud, the [File Integrity Monitoring](file-integrity-monitoring-overview.md) feature helps to keep enterprise assets and resources secure. It scans and analyzes operating system files, Windows registries, application software, and Linux system files for changes that might indicate an attack.

After you enable Defender for Servers Plan 2, follow the instructions in this article to configure File Integrity Monitoring using the Microsoft Defender for Endpoint agent and agentless machine scanning to collect data.

> [!NOTE]
>
> - If you use a previous version of File Integrity Monitoring with the Log Analytics agent (Microsoft Monitoring agent (MMA)) or the Azure Monitor agent (AMA), you can [migrate to the new File Integrity Monitoring experience](migrate-file-integrity-monitoring.md).
> - From June 2025 onwards, File Integrity Monitoring powered by Microsoft Defender for Endpoint requires a minimum version. [Update the agent](#verify-defender-for-endpoint-client-version) as needed.
>   - Windows: 10.8760 or later.
>   - Linux: 30.124082 or later.

## Prerequisites

- [Defender for Servers Plan 2](tutorial-enable-servers-plan.md) must be enabled on your subscription.
- The [Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) agent must be installed through the Defender for Servers [extensions](faq-defender-for-servers.yml) on machines you want to monitor.
- Non-Azure machines must be connected with [Azure Arc](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).
- For extra coverage and monitoring custom paths, [agentless machine scanning](concept-agentless-data-collection.md) must be enabled on your subscription.

- You need **Workspace owner** and **Security admin** permissions to enable and disable File Integrity Monitoring. **Security reader** permissions can view results.

## Verify Defender for Endpoint client version

1. For machines running Windows Server 2019 or later, the Defender for Endpoint agent is updated as part of continuous operating system updates. Make sure Windows machines have the latest update installed. Learn more about using the [Windows Servers Update Service to install machines at scale](/windows-server/administration/windows-server-update-services/get-started/windows-server-update-services-wsus).
1. For machines running Windows Servers 2016 and Windows Server 2012 R2, [update machines manually to the latest agent version](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac). You can install [KB 5005292 from the Microsoft Update Catalog](https://www.catalog.update.microsoft.com/Search.aspx?q=KB5005292). KB 5005292 is periodically updated with the latest agent version.
1. For Linux machines, the Defender for Endpoint agent is automatically updated if autoprovisioning is turned on for the machines in Defender for Cloud. After the MDE.Linux extension is installed on a Linux machine, it attempts to update the agent version each time the Virtual Machine (VM) reboots. You can also [update the agent version manually](/defender-endpoint/linux-updates).

## Enable File Integrity Monitoring

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. In the Defender for Cloud menu, select **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defenders for Servers plan and select **Settings**.
1. In the **File Integrity Monitoring** section, switch the toggle to **On**. Then select **Edit configuration**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png" alt-text="Screenshot of how to enable File Integrity Monitoring." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/defender-servers-file-integrity-monitoring.png":::

1. The **File Integrity Monitoring configuration** pane opens. In the **Workspace selection** dropdown, select the workspace where you want to store the File Integrity Monitoring data. If you want to create a new workspace, select **Create new**.

   :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png" alt-text="Screenshot of the File Integrity Monitoring configuration pane." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-configuration.png":::

1. In the lower section of the **File Integrity Monitoring configuration** pane, select the **Edit** link in the **Recommended to monitor** rule section to choose the [files and registries](file-integrity-monitoring-overview.md#recommended-items-to-monitor) recommended for monitoring. Make sure the **Status** toggle is set to **Enabled** and select the **Change types** you want to monitor. By default, all entities recommended for monitoring are selected. You can remove entities from monitoring by clicking **...** next to the monitoring rule and then selecting **Delete**. Select **Apply** to save your changes.

   :::image type="content" source="edit-default-rule.png" alt-text="Screenshot of the File Integrity Monitoring default rule configuration." lightbox="edit-default-rule.png":::

1. To create a custom rule, select **+ Add rule**. In the **Add new custom rule** section, enter a **Rule name** and, optionally, a **Rule description**. Make sure the **Status** toggle is set to **Enabled**. Select the **Change types** and define **Entity type** and **Entity path** for your custom rules. Select **Apply** to save your changes, or **Delete rule** to delete the rule configuration.

1. Select **Apply**.

1. Select **Continue**.

## Review enablement status for File Integrity Monitoring

Review the File Integrity Monitoring enablement to ensure it's correct and all prerequisites are met.

1. Go to **Workload protection** > **File Integrity Monitoring**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-status.png" alt-text="Screenshot of the File Integrity Monitoring status button." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-status.png":::

1. Select **Settings**.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-settings.png" alt-text="Screenshot of the File Integrity Monitoring page that shows where the settings button is located." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/file-integrity-monitoring-settings.png":::

1. Check for missing prerequisites.

1. Select a subscription and review corrective actions for the necessary workspace.

    :::image type="content" source="media/file-integrity-monitoring-enable-defender-endpoint/corrective-actions.png" alt-text="Screenshot of the File Integrity Monitoring page that shows the missing prerequisites." lightbox="media/file-integrity-monitoring-enable-defender-endpoint/corrective-actions.png":::

1. Select **Apply**.

## Disable File Integrity Monitoring

If you disable File Integrity Monitoring, no new events are collected. However, the data collected before you disabled the feature remains in the Log Analytics workspace, in accordance with the workspace retention policy.

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

## Next step

- Events collected for File Integrity Monitoring are included in the data types eligible for the 500-MB benefit for Defender for Servers Plan 2 customers. [Learn more about the benefit](data-ingestion-benefit.md).
- [Review changes](file-integrity-monitoring-review-changes.md) in File Integrity Monitoring.
