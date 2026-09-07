---
title: Configure a Micro Agent T#### win
description: Learn how to view and update Microsoft Defender for IoT micro agent twin configuration properties, such as message frequency and collector settings, through the Azure portal.
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Configure a Microsoft Defender for IoT micro agent twin

The Microsoft Defender for IoT micro agent twin lets you customize the security agent's behavior for each device. By editing the module identity twin's desired properties in the Azure portal, you can control settings such as message frequency, collector enablement, and cache sizes. This article walks you through viewing and updating those configuration properties in IoT Hub. Before you begin, make sure you have the required Azure account, Defender for IoT subscription, and IoT Hub setup described in the [Prerequisites](#prerequisites).

[!INCLUDE [device-agents-note](../includes/device-agents-note.md)]

## Prerequisites

Before you configure the micro agent twin, make sure you have the following prerequisites:

- An Azure account. If you do not already have an Azure account, you can [create your Azure free account today](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- A Defender for IoT subscription.

- An existing IoT Hub with: [A connected device](tutorial-standalone-agent-binary-installation.md), and [A micro agent module twin](tutorial-create-micro-agent-module-twin.md).

## Micro agent configuration

To view and update the micro agent twin configuration:

1. Navigate to the [Azure portal](https://portal.azure.com).

1. Search for, and select **IoT Hub**.

    :::image type="content" source="media/tutorial-micro-agent-configuration/iot-hub.png" alt-text="Screenshot of searching for the IoT hub in the search bar.":::

1. Select your IoT Hub from the list.

1. Under the Device management section, select **Devices**.

    :::image type="content" source="media/tutorial-micro-agent-configuration/devices.png" alt-text="Screenshot of the device management section of the IoT hub.":::

1. Select your device from the list.

1. Select the module ID.

    :::image type="content" source="media/tutorial-micro-agent-configuration/module-id.png" alt-text="Screenshot of the device's module ID selection screen.":::

1. In the Module Identity Details screen, select **Module Identity Twin**.

    :::image type="content" source="media/tutorial-micro-agent-configuration/module-identity-twin.png" alt-text="Screenshot of the Module Identity Details screen.":::

1. Change the value of any field by adding the field to the `"desired"` section with the new value. 

    :::image type="content" source="media/tutorial-micro-agent-configuration/desired.png" alt-text="Screenshot of the sample output of the module identity twin.":::

    For example:

    ```
    "desired": {
        "Baseline_Disabled": false,
        "Baseline_MessageFrequency": "Low",
        "Baseline_GroupsDisabled": "",
        "Baseline_ChecksDisabled": "",
        "SystemInformation_Disabled": false,
        "SystemInformation_MessageFrequency": "Low",
        "SBoM_Disabled": false,
        "SBoM_MessageFrequency": "Low",
        "NetworkActivity_Disabled": false,
        "NetworkActivity_MessageFrequency": "Medium",
        "NetworkActivity_Devices": "eth0",
        "NetworkActivity_CacheSize": 256,
        "Process_Disabled": false,
        "Process_MessageFrequency": "Medium",
        "Process_PollingInterval": 100000,
        "Process_Mode": 1,
        "Process_CacheSize": 256,
        "LogCollector_Disabled": false,
        "LogCollector_MessageFrequency": "Low",
        "Heartbeat_Disabled": false,
        "Heartbeat_MessageFrequency": "Low",
        "Login_Disabled": false,
        "Login_MessageFrequency": "Medium",
        "IothubModule_MessageTimeout": 2880,
        "CollectorsCore_PriorityIntervals": "30,120,1440"
    }
    ```
    For the full list of supported properties, see [Micro agent configurations](concept-micro-agent-configuration.md).

    The micro agent successfully set the new configuration if the value of `"latest_state"`, under the `"reported"` section shows `"success"`.

    :::image type="content" source="media/tutorial-micro-agent-configuration/reported-success.png" alt-text="Screenshot of a successful configuration change.":::

    If the micro agent fails to set the new configuration, the value of `"latest_state"`, under the `"reported"` section will show `"failed"`. If the configuration update fails, the `"latest_invalid_fields"` will contain a list of the fields that are invalid.

<a name="next-steps"></a>
## Related content

- [Micro agent configurations](concept-micro-agent-configuration.md)
- [Micro agent event collection](concept-event-aggregation.md)