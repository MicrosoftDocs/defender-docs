---
title: Create and manage custom data collection rules in Microsoft Defender for Endpoint
description: Learn how to create and manage custom data collection rules in Microsoft Defender for Endpoint to enhance your threat hunting capabilities.
ms.service: defender-endpoint
f1.keywords: 
  - NOCSH
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
  - usx-security
ms.topic: how-to
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint
---

# Create and manage custom data collection rules in Microsoft Defender for Endpoint (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

[Custom data collection (Preview)](custom-data-collection.md) enables organizations to expand and customize telemetry collection beyond default configurations to support specialized threat hunting and security monitoring needs.

Custom data collection rules allow you to define specific events and analyze the data to enhance your security visibility and threat hunting operations. Custom data collection rules are based on tailored filters for event properties such as folder paths, process names, and network connections.

This article shows you how to create and manage custom data collection rules in the Microsoft Defender portal.

## Create custom data collection rules

### Prerequisites

To use custom data collection, you need:

- A Microsoft Defender for Endpoint P2 license.
- A connected [Microsoft Sentinel workspace](/azure/sentinel/quickstart-onboard): required for custom data storage and querying. You can currently only connect one Sentinel workspace per Defender for Endpoint tenant for custom data collection.
- Use the [supported operating systems](#supported-operating-systems).
- Dynamic tags configured in [Asset Rule Management](/defender-xdr/configure-asset-rules) for device targeting. To use a tag for custom data collection, the tag should be run at least once.

### Supported operating systems

- **Windows**: Minimum Defender for Endpoint client version 10.8805, up to Windows 11.
- **Windows 10**: Requires enrollment in [Extended Security Updates (ESU) program](/windows/whats-new/extended-security-updates).

### Performance and limits

- Each collection rule can capture up to 25,000 events per device within a 24-hour rolling window. Once the device reaches the limit, telemetry for the specific rule on the specific device stops until the window resets.
    - If the device reaches the threshold early in the cycle, it can take up to 24 hours for telemetry to resume. If the device reaches the limit one hour after the window resets, telemetry resumes after 23 hours.
    - If the device reaches the threshold near the end of the window, the delay is shorter. For example, if the device reaches the limit two hours before the window resets, telemetry resumes after two hours.
- Rule deployment typically takes 20 minutes to one hour.
- Custom collection operates alongside default Defender for Endpoint configuration without interference.

### Data costs

Custom data collection is included with Microsoft Defender for Endpoint P2 licensing. However, data ingestion into Microsoft Sentinel workspaces incurs charges based on your Sentinel billing arrangement.

### Create rules

1. In the Microsoft Defender portal, navigate to **Settings** > **Endpoints** > **Rules** > **Custom Data Collection**.

    :::image type="content" source="media/custom-data-collection/custom-data-collection-main-view.png" alt-text="Screenshot of the main Custom Data Collection page." lightbox="media/custom-data-collection/custom-data-collection-main-view.png":::

1. On the top right, select the workspace name to change your workspace.
1. Select **Create rule**, and in the **General Information** section, type a rule name and description, and select **Next**.

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-create-rule-general.png" alt-text="Screenshot of creating a rule: General Information page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-create-rule-general.png":::

1. In the **Create rule** section:

    1. Select which table you want to collect data from. For more information, see [Supported event tables](custom-data-collection.md#supported-event-tables).
    1. Select the action for which you want to collect data.
    1. Add rule conditions to filter the data even further. You can add multiple conditions to refine the data collection. Rule conditions are based on the selected table. For more information, see the respective table link under [Supported event tables](custom-data-collection.md#supported-event-tables).

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-create-rule.png" alt-text="Screenshot of creating a rule: Create rule page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-create-rule.png":::

    > [!NOTE]
    > If you use the **Not equals** operator with an unexpected value, this might select all events. To avoid using large data volumes, combine this operator with other conditions.

    1. Select **Next**.

1. In the **Define rule scope** section, select whether you want to collect data from all applicable client devices or from specific devices that include dynamic tags. For more information, see [Create dynamic rules for devices in asset rule management](/defender-xdr/configure-asset-rules).

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-rule-define-scope.png" alt-text="Screenshot of creating a rule: Define scope page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-rule-define-scope.png":::

    > [!NOTE]
    > Custom data collection only supports dynamic tags.

1. In the **Review and finish** section, review your rule settings, and select **Submit**.

    :::image type="content" source="media/create-custom-data-collection-rules/create-custom-data-collection-rule-review.png" alt-text="Screenshot of creating a rule: Review and finish page." lightbox="media/create-custom-data-collection-rules/create-custom-data-collection-rule-review.png":::

It can take up to an hour for the rule to be deployed to the targeted devices.

## Monitor and troubleshoot

If rules aren't working as expected:

- Create a rule to collect network events in an unexpected use case. For example, create a rule that collects all network events where `port not equals 0`.
- Apply individual filters and tags to isolate issues.
- If a device isn't responding after you enable the feature, reboot the device.

Review these considerations when monitoring and troubleshooting custom data collection rules:

- [Endpoint detection and response (EDR) exclusions](navigate-defender-endpoint-antivirus-exclusions.md) may override custom collection rules.
- Dynamic tags update approximately every hour. Check the **Custom collection** > **Last run time** column for the status.

## Edit, delete, and turn custom data collection rules on or off

- To edit a rule, navigate to **Settings** > **Endpoints** > **Rules** > **Custom Collection**, select the rule you want to edit, and select **Edit**.
- To delete a rule, select the rule you want to delete, and select **Delete**.
- To disable or enable a rule, select the rule you want to modify, select the rule and select the **Enable** or **Disable** check box.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]