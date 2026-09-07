---
title: Provision the Microsoft Defender for IoT Micro Agent by using DPS
description: Learn how to provision the Microsoft Defender for IoT micro agent using DPS. 
ms.date: 07/03/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Provision the Microsoft Defender for IoT micro agent using by DPS

This article explains how to provision the standalone Microsoft Defender for IoT micro agent by using [Azure IoT Hub Device Provisioning Service](/azure/iot-dps/about-iot-dps) with [X.509 certificate attestation](/azure/iot-dps/concepts-x509-attestation). Follow this procedure to enroll a standalone device through DPS, create and configure a micro agent module, and verify that the agent connects successfully. If you're provisioning IoT Edge devices instead, see the Edge-device guidance linked below.

To learn how to configure the Microsoft Defender for IoT micro agent for Edge devices see [Create and provision IoT Edge devices at scale](/azure/iot-edge/how-to-provision-devices-at-scale-linux-tpm)

[!INCLUDE [device-agents-note](../includes/device-agents-note.md)]

## Prerequisites

Before you begin, make sure you have the following prerequisites:

- An Azure account with an active subscription. For more information, see [Create an Azure account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- An [IoT hub](/azure/iot-hub/iot-hub-create-through-portal).

- [IoT Hub Device Provisioning Service](/azure/iot-dps/quick-setup-auto-provision).

<a name="provision"></a>
## Provision the device through DPS

Perform the following steps to provision the device through DPS:

1. In the [Azure portal](https://portal.azure.com), go to your instance of the IoT Hub device provisioning service.

1. Under **Settings**, select **Manage enrollments**.

1. Select **Add individual enrollment**, and then complete the steps to configure the enrollment:

    - In the **Mechanism** field, select **X.509** at the identity attestation Mechanism and choose your CA.
  
1. Navigate into your destination IoT Hub.

1. [Create a Defender for IoT micro agent module twin](tutorial-create-micro-agent-module-twin.md) issued by the same X.509 certificate used for the DPS enrollment.

1. [Configure the micro agent to use the created module](tutorial-standalone-agent-binary-installation.md#authenticate-using-a-module-identity-connection-string) (note that the device does not have to exist yet).

1. Navigate back to DPS and [provision the device through DPS](/azure/iot-dps/quick-create-simulated-device-x509).

1. Navigate to the configured device in the destination IoT Hub.

1. Create a new module for the device issued by the same CA certificate used for the DPS enrollment.

1. Run the micro agent that you configured to use the created module to confirm it connects to the device.

> [!NOTE]
> While you don't need the device to exist before configuring the agent when using this procedure, you do need to know the device name in advance in order to issue the certificate for the final module correctly.

## Related content

- [Configure Microsoft Defender for IoT agent-based solution](tutorial-configure-agent-based-solution.md)

- [Configure pluggable Authentication Modules (PAM) to audit sign-in events (Preview)](configure-pam-to-audit-sign-in-events.md)
