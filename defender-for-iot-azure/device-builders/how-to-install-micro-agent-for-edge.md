---
title: Install Defender for IoT Micro Agent for Microsoft Edge
description: Learn how to install, and authenticate the Defender Micro agent for Microsoft Edge.
ms.date: 07/03/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Install Defender for IoT micro agent for Edge

This article explains how to install and set up the Defender micro agent for Edge. The micro agent runs as a module on Azure IoT Edge devices. It monitors security threats and helps manage your IoT security posture. Before you begin, make sure you complete the [prerequisites](#prerequisites). You'll learn how to add the required package sources, install the agent on Debian and Ubuntu-based Linux systems, and check that it works.

[!INCLUDE [device-agents-note](../includes/device-agents-note.md)]

## Prerequisites

Before you install the Defender micro agent for Edge, complete the following prerequisites:

1. Navigate to your IoT Hub or, [create a new IoT hub](/azure/iot-hub/iot-hub-create-through-portal#create-an-iot-hub).

1. [Register an IoT Edge device in IoT Hub](/azure/iot-edge/how-to-register-device) and [retrieve the device connection strings](/azure/iot-edge/how-to-register-device#view-registered-devices-and-retrieve-connection-strings).

1. Add the appropriate Microsoft package repository. 

  1. Download the repository configuration that matches your device operating system.  

      - For Ubuntu 18.04:

        ```bash
        curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list
        ```

      - For Ubuntu 20.04

        ```bash
        curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > ./microsoft-prod.list
        ```

      - For Debian 9 (both AMD64 and ARM64)

        ```bash
        curl https://packages.microsoft.com/config/debian/stretch/multiarch/prod.list > ./microsoft-prod.list
        ```

1. Copy the repository configuration to the `sources.list.d` directory.

    ```bash
    sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/
    ```

1. Update the list of packages from the repository that you added with the following command:

    ```bash
    sudo apt-get update
    ```

1. Install and configure [Edge runtime version 1.2](/azure/iot-edge/how-to-install-iot-edge)

<a name="installation"></a>
## Install the Defender for IoT micro agent for Edge

Perform the following steps to install and validate the Defender for IoT micro agent on supported Linux distributions.

1. Install the Defender micro agent package. Run the following command on Debian or Ubuntu-based Linux systems: 

    ```bash
    sudo apt-get install defender-iot-micro-agent-edge
    ```

1. Validate your installation.

    1. Ensure the micro agent is running properly with the following command:  

        ```bash
        systemctl status defender-iot-micro-agent.service
        ```

    1. Ensure that the service is stable by making sure it's `active` and that the uptime of the process is appropriate

        :::image type="content" source="media/quickstart-standalone-agent-binary-installation/active-running.png" alt-text="Check to make sure your service is stable and active.":::

1. Test the system end-to-end by creating a trigger file on the device. The trigger file causes a baseline scan in the agent that detects the file as a baseline violation. 

    Create a file on the file system with the following command:

    ```bash
    sudo touch /tmp/DefenderForIoTOSBaselineTrigger.txt 
    ```

    A baseline validation failure recommendation occurs in the hub, with a `CceId` of `CIS-debian-9-DEFENDER_FOR_IOT_TEST_CHECKS-0.0`: 

    :::image type="content" source="media/quickstart-standalone-agent-binary-installation/validation-failure.png" alt-text="The baseline validation failure recommendation that occurs in the hub." lightbox="media/quickstart-standalone-agent-binary-installation/validation-failure-expanded.png":::

    Allow up to one hour for the baseline validation failure recommendation to appear in your IoT Hub. 

1. Install a specific version of the Defender IoT micro agent, use the following command:

    ```bash
    sudo apt-get install defender-iot-micro-agent-edge=<version>
    ```

## Next step

> [!div class="nextstepaction"]
> [Configure Microsoft Defender for IoT agent-based solution](tutorial-configure-agent-based-solution.md)
