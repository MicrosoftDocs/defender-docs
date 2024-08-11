---
title: Modify settings in the  Defender for Servers plan in Microsoft Defender for Cloud
description: Learn how to configure settings in the Defender for Servers plan in Microsoft Defender for Cloud.
ms.topic: install-set-up-deploy
ms.date: 02/05/2024
---

# Modify Defender for Servers plan settings

After [deploying the Defender for Servers plan](tutorial-enable-servers-plan.md) in Microsoft Defender for Cloud, you can check whether resources are protected by Defender for Servers, configure a number of plan features, and turn the plan on and off as needed.

## Check feature status

Defender for Cloud provides you with the ability to check if your resources have Defender for Cloud enabled on them. Defender for Server settings for each resource are inherited by the subscription-level settings by default. Once you change settings at the resource level, the resource will no longer inherit settings from its parent subscription unless you delete the settings you configured.

1. In Defender for Cloud, select **Inventory**.

1. Locate the Defender for Cloud column:

    :::image type="content" source="media/configure-servers-coverage/select-inventory.png" alt-text="Screenshot that shows you where to select Inventory from the main menu." lightbox="media/configure-servers-coverage/select-inventory.png":::


You can also check the coverage for all of all your subscriptions and resources using the [Coverage workbook](custom-dashboards-azure-workbooks.md#coverage-workbook).


## Modify plan settings

**Feature | **Details** | **Modify plan**
--- | --- | ---
**Endpoint detection and response**. | When you enable Defender for Servers Plan 1 or Plan 2, Defender for Endpoint is integrated by default, and Defender for Endpoint protection features are available to supported machines. In addition, automatic provisioning of the Defender for Endpoint agent on supported machines in the Azure subscription is enabled. | Learn how to [turn endpoint protection on and off](enable-defender-for-endpoint.md) in a plan.
**Vulnerability scanning** | Defender for Servers scans and assesses machines for vulnerabilities,  using integrated Microsoft Defender Vulnerability Management.<br/><br/> When you enable a Defender for Servers plan, vulnerability scanning is enabled by default.<br/> Agent-based scanning is available in Defender for Servers Plan 1 and Plan 2.<br/><br/>Agentless machine scanning, including vulnerability scanning, is available for Defender for Servers Plan 2 only. | [Learn](deploy-vulnerability-assessment-defender-vulnerability-management.md) how to manually configure vulnerability assessment for an Azure subscription or specific machine.
**Agentless scanning** |  Agentless scanning provides a number of scanning capabilities, and is enabled by default when Defender for Servers Plan 2 (or the Defender Cloud Security Posture Management (CSPM) plan) is turned on. | Learn how to [turn agentless scanning on and off](enable-agentless-scanning-vms.md), and to [exclude machines from agentless scanning](enable-agentless-scanning-vms.md#exclude-machines-from-scanning). 




## Turn the plan on an doff


1. In Defender for Cloud, select **Environment settings**.
1. Toggle the plan switch to **On** or **Off**.

    When you disable the Defender for Servers plan on a subscription, it doesn't disable it on a workspace.
1. To disable the plan on a workspace, you must navigate to the plans page for the workspace and toggle the switch to **Off**.


- On the resource level, you can enable or disable Defender for Servers plan 1. Plan 2 can only be disabled at the resource level. For example, it’s possible to enable Defender for Servers plan 2 at the subscription level and disable specific resources within the subscription. You can't enable plan 2 only on specific resources.

## Next steps

[Plan a Defender for Servers deployment](plan-defender-for-servers.md).
