---
title: Troubleshoot the Defender for Identity sensor using logs
description: Use Microsoft Defender for Identity sensor logs to diagnose component behavior and investigate installation or runtime issues. Includes log locations and guidance for troubleshooting.
ms.date: 07/02/2026
ms.topic: how-to
ms.reviewer: rlitinsky
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Troubleshooting Microsoft Defender for Identity sensor using the Defender for Identity logs

The Defender for Identity logs provide insight into sensor activity and status at any given point in time.

The Defender for Identity sensor logs are located in the **Logs** subfolder under the sensor installation directory. By default, the sensor is installed in `C:\Program Files\Azure Advanced Threat Protection Sensor`, and the Logs folder can be found at: `C:\Program Files\Azure Advanced Threat Protection Sensor\version number\Logs`.

## Defender for Identity sensor logs

The Defender for Identity sensor has the following logs:

- **Microsoft.Tri.Sensor.log** – This log contains everything that happens in the Defender for Identity sensor (including resolution and errors). Its main use is getting the overall status of all operations in the chronological order in which they occurred.

- **Microsoft.Tri.Sensor-Errors.log** – This log contains just the errors that are caught by the Defender for Identity sensor. Its main use is performing health checks and investigating issues that need to be correlated to specific times.

- **Microsoft.Tri.Sensor.Updater.log** - This log is used for the sensor updater process, which is responsible for updating the Defender for Identity sensor if configured to do so automatically.

- **Microsoft.Tri.Sensor.Updater-Errors.log** – This log contains just the errors that are caught by the Defender for Identity sensor updater. Its main use is performing health checks and investigating issues that need to be correlated to specific times.

> [!NOTE]
> The log files have a maximum size of up to 50 MB. When a log file reaches 50 MB, a new log file is opened and the previous one is renamed to "&lt;original file name&gt;-Archived-00000" where the number increments each time it is renamed. By default, if more than 10 archived files already exist for that specific log file name, the oldest archived files are deleted.

## Defender for Identity deployment logs

The Defender for Identity deployment logs are located in the temp directory of the user who installed the product. Typically, you can find these logs at `%USERPROFILE%\AppData\Local\Temp`. If the deployment was performed by a service, the deployment logs might be located in `C:\Windows\Temp` or `C:\Windows\SystemTemp`, depending on your Windows version and patch level.

Defender for Identity sensor deployment logs:

- **Azure Advanced Threat Protection Microsoft.Tri.Sensor.Deployment.Deployer_YYYYMMDDHHMMSS.log** - This log file provides the entire process of sensor deployment and can be found in the user's temp folder (`%USERPROFILE%\AppData\Local\Temp`), or in `C:\Windows\Temp` or `C:\Windows\SystemTemp` when deployed by a service.

- **Azure Advanced Threat Protection Sensor_YYYYMMDDHHMMSS.log** - This log lists the steps in the process of the deployment of the Defender for Identity sensor. Its main use is tracking the Defender for Identity sensor deployment process.

- **Azure Advanced Threat Protection Sensor_YYYYMMDDHHMMSS_001_MsiPackage.log** - This log file lists the steps in the process of the deployment of the Defender for Identity sensor binaries. Its main use is tracking the deployment of the Defender for Identity sensor binaries.

> [!NOTE]
> In addition to the deployment logs listed in this section, other logs whose names begin with "Azure Advanced Threat Protection" can also provide information about the deployment process.

## Related content

- [Defender for Identity sensor v2.x prerequisites](deploy/prerequisites-sensor-version-2.md) and [Defender for Identity sensor v3.x prerequisites](deploy/deploy-sensor-v3.md)
- [Defender for Identity capacity planning](deploy/capacity-planning.md)
- [Configure event collection](deploy/configure-event-collection.md)
- [Configuring Windows event forwarding](deploy/configure-event-forwarding.md)
- [Microsoft Defender for Identity forum](<https://aka.ms/MDIcommunity>)
