---
title: Modify Defender for Servers plan settings in Microsoft Defender for Cloud
description: Learn how to configure settings in the Defender for Servers plan in Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 08/19/2024
# customer intent: After setting up the Defender for Servers plan in Defender for Cloud, I want to review machines protected by the plan, and modify plan settings.
---

# Modify Defender for Servers plan settings

After [deploying the Defender for Servers plan](tutorial-enable-servers-plan.md) in Microsoft Defender for Cloud, you can check which machines are protected by the plan, configure plan features, or turn the plan on and off as needed.

## Check machine protection

Find machines protected by the plan.

1. In Defender for Cloud, select **Inventory**.
1. In the **Resource Type** query, you can filter the inventory to narrow down results to resources supported by Defender for Servers. For example:
    - Use the **Resource type** query to find virtual machines, AWS EC2 instances, and GCP Compute instances.
    - Use the **Environment** query to narrow down to Azure, AWS, or GCP resources.
1. In the virtual machine list, review the **Defender for Cloud** column:

    :::image type="content" source="media/configure-servers-coverage/select-inventory.png" alt-text="Screenshot that shows you where to select Inventory from the main menu." lightbox="media/configure-servers-coverage/select-inventory.png":::

1. If the column setting is **On**, then Defender for Cloud is enabled, along with any plans switched on in Defender for Cloud, including Defender for Servers.

You can also check the coverage for all of all your subscriptions and resources using the [Coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook).


## Modify plan feature settings

Features are turned on by default when you enable Defender for Servers. You can modify plan features manually as follows:

1. In subscription enabled for Defender for Cloud, select **Environment settings**.
1. Under Cloud Workload Protection (CWP), in the **Servers** entry > **Monitoring coverage** column, select **Settings**.
1. In **Settings and monitoring**, select the setting you want to modify.

    **Feature** | **Details** | **Modify plan**
    --- | --- | ---
    **Vulnerability assessment** | When you enable the plan, [vulnerability scanning](auto-deploy-vulnerability-assessment.md) is enabled by default.<br/> | [Manually configure](deploy-vulnerability-assessment-defender-vulnerability-management.md) vulnerability scanning settings.
    **Endpoint protection**. | When you enable the plan, Defender for Endpoint is integrated by default. Defender for Endpoint protection features are available, and automatic provisioning of the Defender for Endpoint agent is enabled. | [Turn endpoint protection on and off](enable-defender-for-endpoint.md) in a plan.
    **Agentless scanning** |  [Agentless scanning](concept-agentless-data-collection.md) provides a number of scanning capabilities. It's enabled by default when Defender for Servers Plan 2 (or the Defender Cloud Security Posture Management (CSPM) plan) is turned on. | [Turn agentless scanning on and off](enable-agentless-scanning-vms.md), and [exclude machines from agentless scanning](exclude-machines-agentless-scanning.md). 



## Turn the plan on and off

Disable the Defender for Servers plan as follows:

1. In Defender for Cloud, select **Environment settings**.
1. Toggle the plan switch to **On** or **Off**.

1. If you've enabled Defender for Servers on a custom Log Analytics workspace, it isn't disabled on the workspace when you disable it on a subscription.

    To disable the plan on a workspace, navigate to the plans page for the workspace and toggle the switch to **Off**.


