---
title: Troubleshooting the sensor using logs  | Microsoft Defender for Identity
description: Describes how you can use the Microsoft Defender for Identity logs to troubleshoot issues
ms.date: 02/21/2024
ms.topic: how-to
---

# Troubleshooting Microsoft Defender for Identity sensor using the Defender for Identity logs

The Defender for Identity logs provide insight into what each component of Microsoft Defender for Identity sensor is doing at any given point in time.

The Defender for Identity logs are located in a subfolder called **Logs** where Defender for Identity is installed; the default location is: **C:\Program Files\Azure Advanced Threat Protection Sensor\\**. In the default installation location, it can be found at: **C:\Program Files\Azure Advanced Threat Protection Sensor\version number\Logs**.

## Defender for Identity sensor logs

The Defender for Identity sensor has the following logs:

- **Microsoft.Tri.Sensor.log** – This log contains everything that happens in the Defender for Identity sensor (including resolution and errors). Its main use is getting the overall status of all operations in the chronological order in which they occurred.

- **Microsoft.Tri.Sensor-Errors.log** – This log contains just the errors that are caught by the Defender for Identity sensor. Its main use is performing health checks and investigating issues that need to be correlated to specific times.

- **Microsoft.Tri.Sensor.Updater.log** - This log is used for the sensor updater process, which is responsible for updating the Defender for Identity sensor if configured to do so automatically.

- **Microsoft.Tri.Sensor.Updater-Errors.log** – This log contains just the errors that are caught by the Defender for Identity sensor updater. Its main use is performing health checks and investigating issues that need to be correlated to specific times.

> [!NOTE]
> The log files have a maximum size of up to 50 MB. When that size is reached, a new log file is opened and the previous one is renamed to "&lt;original file name&gt;-Archived-00000" where the number increments each time it is renamed. By default, if more than 10 files from the same type already exist, the oldest are deleted.

## Defender for Identity deployment logs

The Defender for Identity deployment logs are located in the temp directory of the user who installed the product. It will usually be found at **%USERPROFILE%\AppData\Local\Temp**. If it was deployed by a service, it might be found at **C:\Windows\Temp**.

Defender for Identity sensor deployment logs:

- **Azure Advanced Threat Protection Microsoft.Tri.Sensor.Deployment.Deployer_YYYYMMDDHHMMSS.log** - This log file provides the entire process of sensor deployment and can be found in the temp folder mentioned previously.

- **Azure Advanced Threat Protection Sensor_YYYYMMDDHHMMSS.log** - This log lists the steps in the process of the deployment of the Defender for Identity sensor. Its main use is tracking the Defender for Identity sensor deployment process.

- **Azure Advanced Threat Protection Sensor_YYYYMMDDHHMMSS_001_MsiPackage.log** - This log file lists the steps in the process of the deployment of the Defender for Identity sensor binaries. Its main use is tracking the deployment of the Defender for Identity sensor binaries.

> [!NOTE]
> In addition to the deployment logs mentioned here, there are other logs that begin with "Azure Advanced Threat Protection" that can also provide additional information on the deployment process.

## Related content

- [Defender for Identity prerequisites](deploy/prerequisites.md)
- [Defender for Identity capacity planning](deploy/capacity-planning.md)
- [Configure event collection](deploy/configure-event-collection.md)
- [Configuring Windows event forwarding](deploy/configure-event-forwarding.md)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
