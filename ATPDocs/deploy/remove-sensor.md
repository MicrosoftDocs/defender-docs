---
title: Remove a Microsoft Defender for Identity sensor 
description: Learn about how to remove the Microsoft Defender for Identity sensor.
ms.date: 06/18/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Remove a Microsoft Defender for Identity Sensor
This article describes how to delete a Defender for Identity sensor.

## Customers with domain controllers  onboarded to Defender for Endpoint 

To deactivate the Defender for Identity sensor, delete it from the **Sensors** page:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **Sensors**.
1. Select the domain controller where you want to deactivate Defender for Identity capabilities, select **Delete**, and confirm your selection.

    ![Screenshot that shows how to delete a sensor.](media/activate-capabilities/screenshot-that-shows-how-to-delete-a-sensor.png)

Deactivating Defender for Identity capabilities from your domain controller doesn't remove the domain controller from Defender for Endpoint. For more information, see [Defender for Endpoint documentation](/microsoft-365/security/defender-endpoint/).

## Customers without domain controllers onboarded to Defender for Endpoint 

Download the Defender for Identity offboarding package from the [Microsoft Defender portal](https://security.microsoft.com).

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **Activation**.
1. Select Download offboarding package and save the file in a location you can access from your domain controller.  
![Screenshot that shows how to offboard the new sensor.](media/activate-capabilities/screenshot-that-shows-how-to-offboard-the-new-sensor.png)
1. From the domain controller, extract the zip file you downloaded from the Microsoft Defender portal, and run the `DefenderForIdentityOnlyOffboardingScript_valid_until_YYYY-MM-DD.cmd` script as an Administrator.
1. To fully remove the sensor, navigate to **Settings** > **Identities** > **Sensors**, select the server, and click **Delete**.

:::image type="content" source="media/activate-capabilities/screenshot-that-shows-how-to-delete-a-sensor.png" alt-text="Screenshot that shows how to delete a sensor" lightbox="media/activate-capabilities/screenshot-that-shows-how-to-delete-a-sensor.png":::

## Next steps

For more information, see [Manage and update Microsoft Defender for Identity sensors](../sensor-settings.md).
