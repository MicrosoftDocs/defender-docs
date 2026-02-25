---
title: Offboard Microsoft Defender for Endpoint on Linux
description: Describes how to offboard Linux servers from Microsoft Defender for Endpoint and optionally uninstall the agent.
ms.service: defender-endpoint
ms.subservice: linux
ms.topic: article
author: paulinbar
ms.author: painbar
ms.reviewer: gopkr, pahuijbr, megphapriya
manager: bagol
audience: ITPro
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
search.appverid: met150
ms.date: 02/26/2026
---

# Offboard Microsoft Defender for Endpoint on Linux

This article describes how to offboard Linux servers from Microsoft Defender for Endpoint. Offboarding disconnects a device from the Defender for Endpoint service so that it no longer sends security telemetry to the Microsoft Defender portal.

Offboarding is typically performed when a device is being decommissioned, transferred to another tenant, or no longer requires Defender for Endpoint protection.

## Before you begin

Ensure that the following prerequisites are met before you offboard a Linux server:

- You have **administrative (root) privileges** on the Linux server.
- You have the appropriate permissions in the **Microsoft Defender portal** to offboard devices.
- You use a **newly downloaded offboarding package**, as offboarding scripts are tenant‑specific and time‑limited.

## Offboard a Linux server using a local script (recommended)

Using a local offboarding script is the recommended and supported method for offboarding Linux servers from Defender for Endpoint.

### Step 1: Download the offboarding package

1. Sign in to the Microsoft Defender portal.
2. Go to **Settings** > **Endpoints** > **Device management** > **Offboarding**.
3. Select **Linux** as the operating system.
4. Download the **Linux offboarding package**.

The downloaded package contains a shell script that removes the device's association with your Microsoft Defender for Endpoint tenant.

### Step 2: Copy the package to the Linux server

Copy the downloaded ZIP file to the target Linux server by using a secure file transfer method, such as `scp` or a configuration management tool.

### Step 3: Run the offboarding script

On the Linux server, extract the package and run the offboarding script with elevated privileges:

```bash
unzip MicrosoftDefenderATPOnboardingLinuxServer.zip
sudo bash <offboarding_script_name>.sh
```

After the script completes, the device is offboarded and stops sending data to Microsoft Defender for Endpoint.

### Step 4: Verify offboarding

To verify that the device has been offboarded, run the following command on the Linux server:

```bash
mdatp health
```

After offboarding, the device no longer reports an organization ID or active sensor health to the Microsoft Defender portal.

## (Optional) Uninstall Microsoft Defender for Endpoint from Linux

> [!NOTE]
> Offboarding does not uninstall the Defender for Endpoint agent.  
> If the Linux server is being decommissioned or no longer requires Defender for Endpoint, uninstall the agent after offboarding.

### Debian and Ubuntu

```bash
sudo systemctl stop mdatp
sudo apt remove mdatp -y
sudo apt autoremove -y
```

### Red Hat Enterprise Linux, CentOS, Oracle Linux, Rocky Linux, AlmaLinux

```bash
sudo systemctl stop mdatp
sudo yum remove mdatp -y
```

### SUSE Linux Enterprise Server

```bash
sudo systemctl stop mdatp
sudo zypper remove mdatp
```

After removal, the `mdatp` service and binaries are no longer present on the system.

## What happens after offboarding

After a Linux server is offboarded from Defender for Endpoint:

- No new alerts, vulnerabilities, or telemetry are sent to the Microsoft Defender portal.
- The device status changes to **Inactive** after several days.
- Historical data (such as alerts and vulnerability information) remains visible until the configured retention period expires.
- The device profile may remain visible (without data) in device inventory for a limited period.

## Troubleshooting

If the device still appears as active after offboarding:

- Ensure that the latest offboarding script was used.
- Verify that the script completed successfully without errors.
- Check local agent state by running `mdatp health`.

For additional troubleshooting guidance, see
[Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md).

## Related content

- [Offboard devices from Microsoft Defender for Endpoint](offboard-machines.md)
- [Deploy Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Microsoft Defender for Endpoint on Linux](linux-preferences.md)
- [Troubleshoot Microsoft Defender for Endpoint on Linux](linux-support-connectivity.md)