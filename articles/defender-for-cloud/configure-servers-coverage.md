---
title: Modify Defender for Servers plan settings in Microsoft Defender for Cloud
description: Learn how to configure settings in the Defender for Servers plan in Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.author: elkrieger
author: elazark
ms.date: 10/20/2024
---

# Review and modify Defender for Servers settings

After [deploying the Defender for Servers plan](tutorial-enable-servers-plan.md) in Microsoft Defender for Cloud, you can check which machines are protected by the plan, and configure plan settings as needed.

## Check machine protection

Find machines protected by the plan.

1. In Defender for Cloud, select **Inventory**.
1. In the **Resource Type** query, you can filter the inventory to narrow down results to resources supported by Defender for Servers. For example:
    - Use the **Resource type** query to find virtual machines, AWS EC2 instances, and GCP Compute instances.
    - Use the **Environment** query to narrow down to Azure, AWS, or GCP resources.
1. In the virtual machine list, review the **Defender for Cloud** column:

    :::image type="content" source="media/configure-servers-coverage/select-inventory.png" alt-text="Screenshot that shows you where to select Inventory from the main menu." lightbox="media/configure-servers-coverage/select-inventory.png":::

1. If the column setting is **On**, then Defender for Cloud is enabled, along with any plans switched on in Defender for Cloud, including Defender for Servers.

You can also check protection coverage for all subscriptions and resources using the [Coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook).


## Modify plan settings

Some features are turned on by default when you enable Defender for Servers. You can modify plan features manually as follows:

1. In subscription enabled for Defender for Cloud, select **Environment settings**.
1. Under Cloud Workload Protection (CWP), in the **Servers** entry > **Monitoring coverage** column, select **Settings**.
1. In **Settings and monitoring**, select the setting you want to modify.

    **Feature** | **Details** | **Modify plan**
    --- | --- | ---
    **Vulnerability assessment** | When you enable Defender for Servers Plan 1 or 2, [vulnerability scanning](auto-deploy-vulnerability-assessment.md) is enabled by default.<br/> | [Manually configure](deploy-vulnerability-assessment-defender-vulnerability-management.md) vulnerability scanning settings.
    **Endpoint protection**. | When you enable Defender for Servers Plan 1 or 2, Defender for Endpoint is integrated by default. Defender for Endpoint protection features are available, and automatic provisioning of the Defender for Endpoint sensor on connected machines is enabled. | [Turn endpoint protection on and off](enable-defender-for-endpoint.md) in a plan.
    **Agentless scanning** |  [Agentless scanning](concept-agentless-data-collection.md) provides a number of scanning capabilities. It's enabled by default when Defender for Servers Plan 2 (or the Defender Cloud Security Posture Management (CSPM) plan) is turned on. | [Turn agentless scanning on and off](enable-agentless-scanning-vms.md), and [exclude machines from agentless scanning](exclude-machines-agentless-scanning.md).
    **File integrity monitoring** | When you enable Defender for Servers Plan 2, you can turn on file integrity monitoring. It's not turned on by default |  [Learn about](file-integrity-monitoring-compare-baselines.md) and [enable](file-integrity-monitoring-enable-defender-endpoint.md) file integrity monitoring






