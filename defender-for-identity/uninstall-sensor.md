---
title: Uninstall the Sensor
description: Remove the Microsoft Defender for Identity sensor from domain controllers by deleting, uninstalling, or cleaning up orphaned and duplicate entries in the Microsoft Defender portal.
ms.date: 07/02/2026
ms.topic: how-to
ms.reviewer: rlitinsky
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---

# Remove the Microsoft Defender for Identity sensor

This article describes how to uninstall the Microsoft Defender for Identity sensor from domain controllers. Use these procedures when you need to decommission a domain controller, clean up orphaned or duplicate sensor entries, or stop Defender for Identity monitoring on a specific server.

<!--## Prerequisites

Deactivating Defender for Identity capabilities from your domain controller doesn't remove the domain controller from Defender for Endpoint. You must remove Defender for Identity from Defender for Endpoint before deactivating the sensor.

1. In the [Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **Activation**.
1. Select **Download offboarding package** and save the file in a location you can access from your domain controller.  
![Screenshot of the Activation page with the Download offboarding package option for the Defender for Identity sensor.](media/screenshot-that-shows-how-to-offboard-the-new-sensor.png)
1. From the domain controller, extract the zip file, and run the `DefenderForIdentityOnlyOffboardingScript_valid_until_YYYY-MM-DD.cmd` script as an Administrator.
-->

## Delete a sensor

### For sensor v3.x

> [!IMPORTANT]
> Deleting the sensor removes the v3.x sensor software and stops monitoring on that domain controller.

To delete a v3.x sensor from the Microsoft Defender portal, follow these steps:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities** > **Sensors**.
1. Select the domain controller where you want to deactivate Defender for Identity capabilities, select **Delete**, and confirm your selection.

   :::image type="content" source="media/screenshot-that-shows-how-to-delete-a-sensor.png" alt-text="Screenshot that shows how to delete a sensor." lightbox="media/screenshot-that-shows-how-to-delete-a-sensor.png":::   

## Delete and uninstall a sensor v2.x from a domain controller

> [!IMPORTANT]
> We recommend removing the sensor from the domain controller before demoting the domain controller.

1. Sign in to the domain controller with administrative privileges.
1. From the Windows **Start** menu, select **Settings** > **Control Panel** > **Add/ Remove Programs**.
1. Select the sensor installation, select **Uninstall** and follow the instructions to remove the sensor.
1. After the uninstall finishes, open the [Microsoft Defender portal](https://security.microsoft.com).
1. Go to **Settings** > **Identities** > **Sensors**.
1. Select the domain controller, and then select **Delete**.

## Remove an orphaned sensor

A sensor can be orphaned when a domain controller was deleted without first uninstalling the sensor, and the sensor still appears in the Microsoft Defender portal.

1. In the [Defender portal](https://security.microsoft.com), go to **Settings** and then **Identities**. Select **Sensors** on the left to display all your Defender for Identity sensors.
1. Locate the orphaned sensor and select **Delete** (trash can icon).

    :::image type="content" source="media/delete-orphaned-sensor.png" alt-text="Screenshot of the Defender for Identity sensors page showing the delete option for an orphaned sensor.":::

## Remove a duplicate sensor

A duplicate sensor entry can appear after an in-place sensor upgrade, where the sensor is listed twice in the Microsoft Defender portal.

1. In [Defender portal](https://security.microsoft.com), go to **Settings** and then **Identities**. Select **Sensors** on the left to display all your Defender for Identity sensors.
1. Locate the duplicate sensor. It will be the one whose status is set to **Unknown**. Then, at the end of the row, select **Delete** (trash can icon).

## Uninstall the Defender for Identity sensor silently

Use the following command to perform a silent uninstall of the Defender for Identity sensor:

### Syntax

The following command shows the available options for removing the sensor from the command line, including optional silent and help switches.

```cmd
"Azure ATP sensor Setup.exe" [/quiet] [/Uninstall] [/Help]
```

### Installation options

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent uninstallation?|Description|
> |-------------|----------|---------|---------|
> |Quiet|/quiet|Yes|Runs the uninstaller displaying no UI and no prompts.|
> |Uninstall|/uninstall|Yes|Runs the silent uninstallation of the Defender for Identity sensor from the server.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|

### Examples

To silently uninstall the Defender for Identity sensor from the server:

```cmd
"Azure ATP sensor Setup.exe" /quiet /uninstall
```

## Related content

- [Manage and update Microsoft Defender for Identity sensors](sensor-settings.md)
