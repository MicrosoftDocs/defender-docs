---
title: Manage and update sensors
description: Learn how to view, manage, and update Microsoft Defender for Identity sensors in the Microsoft Defender portal, including sensor health, migration state, and delayed updates.
ms.date: 03/18/2026
ms.topic: how-to
ms.reviewer: rlitinsky
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted

#customer intent: As a security admin, I want to manage and monitor my Defender for Identity sensors so that I can keep them healthy, up to date, and properly configured.
---

# Manage and update Microsoft Defender for Identity sensors

This article explains how to view, manage, and update Defender for Identity sensors in the Microsoft Defender portal.

## View sensor settings and status

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Identities**.
1. In the left sidebar, under **Deployment**, select **On-premises**.
1. Select the **Sensors** tab.

<!-- TODO: Replace outdated screenshots. The UI now shows the "Identity Security" page with a sidebar (Deployment > On-premises) and three tabs (Activation, Sensors, Service accounts Classification). -->

:::image type="content" source="media/sensor-page-overview.png" alt-text="Screenshot that shows the Sensors tab on the On-premises page in the Microsoft Defender portal, with the Deployment sidebar, tabs, filters, and sensor list." lightbox="media/sensor-page-overview.png":::

The **Sensors** tab shows all Defender for Identity sensors deployed in your environment. From this tab you can:

- **Filter** sensors by type, domain, delayed update, service status, sensor status, migration state, or health status.
- **Export** the sensor list to a .csv file.
- **Add a sensor** using the **+ Add sensor** option.
- **Customize columns** to show or hide specific fields.
- **Search** for a specific sensor by name.

Select a sensor row to open a details pane with information about the sensor and its health status. From the details pane, you can select **Manage sensor** to update sensor configuration, or select a health issue to see more details and reopen closed issues.

## Sensor details

The **Sensors** tab shows the following columns. For columns with multiple possible values, see the tables below.

- **Sensor**: The sensor's NetBIOS computer name.
- **Type**: The sensor type. Possible values: **Domain controller sensor**, **AD FS sensor** (Active Directory Federation Services), **Standalone sensor**, **Entra Connect sensor**, **ADCS sensor** (Active Directory Certificate Services). If a sensor is installed on a domain controller that also runs Entra Connect or AD CS, the type shows as **Domain controller sensor**.
- **Domain**: The fully qualified domain name of the Active Directory domain where the sensor is installed.
- **Version**: The sensor version installed.
- **Delayed update**: Whether delayed updates are enabled or disabled. For more information, see [Delayed sensor update](#delayed-sensor-update).
- **Health issues**: The count of open health issues on the sensor.
- **Created**: The date the sensor was installed.

> [!NOTE]
> The **Delayed update** feature is supported only by sensor version 2.x.

### Migration state

The migration state column shows the status for sensors eligible for [migration from v2.x to v3.x](deploy/migrate-to-sensor-v3.md).

| State | Description |
|---|---|
| **Ready for migration** | The server meets all prerequisites and can be migrated. |
| **Not ready for migration** | The server doesn't meet one or more prerequisites. |
| **Migrating** | The migration is in progress. |
| **Already v3.x** | The migration completed successfully. The server is running sensor v3.x. |
| **Migration failed** | The migration encountered an error. You can retry the migration. |

### Service status

| Status | Description |
|---|---|
| **Running** | The sensor service is running. |
| **Starting** | The sensor service is starting. |
| **Disabled** | The sensor service is disabled. |
| **Stopped** | The sensor service is stopped. |
| **Unknown** | The sensor is disconnected or unreachable. |

### Sensor status

| Status | Description |
|---|---|
| **Up to date** | The sensor is running the current version. |
| **Outdated** | The sensor is running a version that is at least three versions behind the current version. |
| **Updating** | The sensor software is being updated. |
| **Update failed** | The sensor failed to update to a new version. |
| **Not Configured** | The sensor requires more configuration before it's fully operational. This applies to sensors on AD FS, AD CS, or standalone servers. |
| **Start failed** | The sensor didn't pull configuration for more than 30 minutes. |
| **Syncing** | The sensor has configuration updates pending but didn't yet pull the new configuration. |
| **Disconnected** | No communication from this sensor in 10 minutes. |
| **Unreachable** | The domain controller was deleted from Active Directory, but the sensor wasn't uninstalled before decommissioning. You can safely delete this entry. |

### Health status

| Status | Description |
|---|---|
| **Healthy** (green icon) | No open health issues. |
| **Not healthy** (yellow icon) | The highest severity open health issue is low. |
| **Not healthy** (orange icon) | The highest severity open health issue is medium. |
| **Not healthy** (red icon) | The highest severity open health issue is high. |

## Update sensors

The Defender for Identity service is typically updated a few times a month with new detections, features, and performance improvements. These updates usually include a corresponding minor update to the sensors.

### Defender for Identity sensor update types

Defender for Identity sensors support two kinds of updates:

* Minor version updates:
  * Frequent
  * Requires no MSI install, and no registry changes
  * Restarted: Defender for Identity sensor services
  
* Major version updates:
  * Rare
  * Contains significant changes
  * Restarted: Defender for Identity sensor services
  
> [!NOTE]
>
> Defender for Identity sensors always reserve at least 15% of the available memory and CPU on the domain controller where the sensor is installed. If the service consumes too much memory, it's automatically stopped and restarted by the sensor updater service.

### Delayed sensor update
>[!NOTE]
>This feature is supported only by sensor version 2.x.

You can define a subset of your sensors as a delayed update ring. Sensors not in the delayed ring are updated automatically each time the service is updated. Sensors set to **Delayed update** are updated 72 hours later, giving you time to confirm that the automatically updated sensors are working correctly.

> [!NOTE]
> If an error occurs and a sensor does not update, open a support ticket. To further harden your proxy to only communicate with your workspace, see [Proxy configuration](configure-proxy.md).

Authentication between your sensors and the Azure cloud service uses certificate-based mutual authentication. A self-signed client certificate is created during sensor installation and is valid for 2 years. The sensor updater service generates a new certificate before the existing one expires, using a 2-phase validation process to avoid authentication disruptions during the rollover.

To set a sensor to delayed update:

1. In the **Sensors** page, select the sensor you want to set for delayed updates.
1. Select the **Enabled delayed update** button.

    <!-- TODO: Replace outdated screenshot (enable-delayed-update.png). -->

1. In the confirmation window, select **Enable**.

To disable delayed updates, select the sensor and then select the **Disabled delayed update** button.

### Sensor update process

Every few minutes, sensors check whether a newer version is available. When the cloud service is updated, sensors start the update process:

1. The cloud service updates to the latest version.
1. The sensor updater service detects the new version.
1. Sensors that aren't set to **Delayed update** start the update process one at a time:
    1. The sensor updater service pulls the updated version from the cloud service (in cab file format).
    1. The sensor updater validates the file signature.
    1. The sensor updater extracts the cab file to a new folder in the sensor's installation folder. By default it's extracted to *C:\Program Files\Azure Advanced Threat Protection Sensor\<version number>*
    1. The sensor service points to the new files extracted from the cab file.
    1. The sensor updater restarts the sensor service.
        > [!NOTE]
        > Minor sensor updates install no MSI, change no registry values or any system files. A pending restart does not affect a sensor update.
    1. The sensor runs the newly updated version.
    1. The sensor receives clearance from the cloud service. You can verify sensor status on the **Sensors** tab.
    1. The next sensor starts the update process.

1. Sensors selected for **Delayed update** start their update process 72 hours after the Defender for Identity cloud service is updated. These sensors will then use the same update process as automatically updated sensors.

    For any sensor that fails to complete the update process, a relevant [health alert](health-alerts.md) is triggered, and is sent as a notification.

    <!-- TODO: Replace outdated screenshot (sensor-outdated.png). -->

### Silently update the Defender for Identity sensor

Use the following command to silently update the Defender for Identity sensor:

**Syntax**:

```cmd
"Azure ATP sensor Setup.exe" [/quiet] [/Help] [NetFrameworkCommandLineArguments="/q"]
```

**Installation options**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent installation?|Description|
> |-------------|----------|---------|---------|
> |Quiet|/quiet|Yes|Runs the installer displaying no UI and no prompts.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|
> |NetFrameworkCommandLineArguments="/q"|NetFrameworkCommandLineArguments="/q"|Yes|Specifies the parameters for the .Net Framework installation. Must be set to enforce the silent installation of .Net Framework.|

**Examples**:

To update the Defender for Identity sensor silently:

```cmd
"Azure ATP sensor Setup.exe" /quiet NetFrameworkCommandLineArguments="/q"
```

## Configure proxy settings

We recommend that you configure initial proxy settings during silent installation [using command line switches](deploy/install-sensor.md#perform-a-defender-for-identity-silent-installation). If you need to update your proxy settings later on, use either the [CLI](deploy/configure-proxy.md#change-proxy-configuration-using-the-cli) or [PowerShell](deploy/configure-proxy.md#change-proxy-configuration-using-powershell).

If you'd previously configured your proxy settings via either WinINet or a registry key and need to update them, you'll need to [use the same method](deploy/configure-proxy.md#change-proxy-configuration-using-legacy-methods) you used originally.

For more information, see [Configure endpoint proxy and internet connectivity settings](deploy/configure-proxy.md).

## Next steps

* [Defender for Identity sensor v2.x prerequisites](deploy/prerequisites-sensor-version-2.md) and [Defender for Identity sensor v3.x prerequisites](deploy/prerequisites-sensor-version-3.md) 
* [Configure event forwarding](deploy/configure-event-forwarding.md)
* [Defender for Identity community forum](<https://aka.ms/MDIcommunity>)
