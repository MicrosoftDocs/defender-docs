---
title: Tamper protection in audit mode for Microsoft Defender for Endpoint on Linux (Preview)
description: Learn how tamper protection in audit mode detects and alerts on tampering attempts against Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: monaberdugo
author: mberdugo
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: how-to
ms.subservice: linux
ms.date: 08/20/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Tamper protection in audit mode for Microsoft Defender for Endpoint on Linux (Preview)

[!INCLUDE [Prerelease information](../includes/prerelease.md)]

Tamper protection in audit mode for Microsoft Defender for Endpoint on Linux detects unauthorized modifications to Defender for Endpoint assets, including configuration files, directories, processes, and services, even when changes are made by the root user.

Audit mode detects and alerts on the following tampering activities:

- Modification of Defender for Endpoint configuration files.
- Deletion of Defender for Endpoint configuration files, state files, and binaries.
- Renaming or moving Defender for Endpoint configuration files, state files, and binaries.
- Termination of Defender for Endpoint processes, including restarting Defender for Endpoint services.

Audit mode provides visibility into tampering attempts through alerts and Advanced Hunting in the Microsoft Defender portal without blocking the activity.

## Prerequisites

Before you use tamper protection in audit mode, make sure your device meets the following requirements:

- Defender for Endpoint version `101.26072.0004` or later from the Insiders-Slow ring.
- Allow access to `https://config.edge.skype.com/config/v1`. For more information, see [Microsoft Defender for Endpoint streamlined connectivity URLs - commercial](streamlined-device-connectivity-urls-commercial.md#urls-used-for-core-functionality).
- Use a supported Linux distribution and kernel version.

| Distribution | Supported version | Minimum kernel version |
| --- | --- | --- |
| Ubuntu LTS | 20.04 | 5.15.0* |
| Ubuntu LTS | 22.04 | 5.15.0* |
| Ubuntu LTS | 24.04 | 6.8.0 |
| Ubuntu Pro | 22.04 | 5.15.0* |
| Ubuntu Pro | 24.04 | 6.8.0 |
| CentOS Stream | 8 | 4.18.0-553 |
| CentOS Stream | 9 | 5.14.0 |
| CentOS Stream | 10 | 6.12.0 |
| RHEL 8 | 8.4+ | 4.18.0-305 |
| RHEL 9 | 9.x | 5.14.0-70 |
| RHEL 10 | 10.x | 6.12.0-55 |
| SLES 15 | 15.5+ | 5.14.21-150500 |
| SLES 16 | 16 | 6.12.0-160000 |
| Debian | 12 | 6.1.0-9 |
| Debian | 13 | 6.12 |
| Oracle Linux 8 | 8.10 (UEK7) | 5.15.0 |
| Oracle Linux 8 | 8.10 (RHCK) | 4.18.0-553 |
| Oracle Linux 9 | 9.x (UEK7) | 5.15.0 |
| Oracle Linux 9 | 9.x (UEK8) | 6.12.0 |
| Oracle Linux 9 | 9.x (RHCK) | 5.14.0-70 |
| Oracle Linux 10 | 10.x (UEK8) | 6.12.0 |
| Oracle Linux 10 | 10.x (RHCK) | 6.12.0-55 |
| Mariner 2 | 2 | 5.15 |
| Fedora | x86_64: 33-43 | 5.8.15 |
| Fedora | arm64: 40-43 | 6.8.5 |
| Alma Linux 8 | 8.8+ | 4.18.0-477 |
| Alma Linux 9 | 9.2+ | 5.14.0-284 |
| Alma Linux 10 | 10.x | 6.12.0-55 |
| Amazon Linux | 2023 | 6.1.132-147.221.amzn2023 |
| Rocky Linux 8 | 8.9+ | 4.18.0-513 |
| Rocky Linux 9 | 9.3+ | 5.14.0-362 |
| Rocky Linux 10 | 10.x | 6.12.0-55 |
| Azure Linux 3 | 3 | 6.6.78.1-3.azl3 |

> [!IMPORTANT]
> For Ubuntu 20.04 and Ubuntu 22.04, the following generic kernel versions aren't supported: `5.15.0-144`, `5.15.0-150`, `5.15.0-151`, and `5.15.0-152`.

Tamper protection support is limited to kernel versions that support extended Berkeley Packet Filter (eBPF) with BPF Type Format (BTF). BTF provides enhanced event enrichment that enables Defender for Endpoint to capture the file and process context required to detect tampering attempts.

## Enable tamper protection in audit mode

During preview, tamper protection in audit mode is enabled by default. No manual configuration is required.

The feature rolls out gradually over two weeks to eligible devices in the Insiders-Slow ring that meet the prerequisites.

After audit mode is enabled, the `tamper_protection_enforcement_level` field is available in the `mdatp health` output.

## Verify audit mode enablement

To verify that tamper protection is enabled in audit mode:

1. Run the following command:

   ```bash
   mdatp health
   ```

1. Locate `tamper_protection_enforcement_level` in the output.

1. Verify that the value is set to `audit`:

   ```text
   tamper_protection_enforcement_level : "audit"
   ```

1. Alternatively, run the following command to check the tamper protection status:

   ```bash
   mdatp health --details tamper_protection
   ```

   ```bash
   tamper_protection_enforcement_level : "audit"
   tamper_protection_errors            : []
   ```

   If `tamper_protection_errors` is empty, tamper protection is successfully enabled in audit mode.

   If tamper protection can't be enabled, `tamper_protection_enforcement_level` is displayed as `disabled`.

   The following errors can indicate why audit mode isn't enabled:

   | Error | Description |
   | --- | --- |
   | `tamper_protection_unsupported_kernel_version` | The device kernel version doesn't support tamper protection. |
   | `not_supported_in_the_current_configuration` | Tamper protection can't be enabled because a required internal configuration isn't available. |

### Troubleshoot audit mode enablement

If the device meets the prerequisites but `tamper_protection_enforcement_level` is set to `disabled`:

1. Run the following command:

   ```bash
   mdatp health --details cloud
   ```

1. Locate `ecs_configuration_version` in the output.

1. Check whether the value is `unavailable`:

   ```text
   ecs_configuration_version : unavailable
   ```

   If the value is `unavailable`, verify that `https://config.edge.skype.com/config/v1` is allowlisted. For more information, see [Microsoft Defender for Endpoint streamlined connectivity URLs - commercial](streamlined-device-connectivity-urls-commercial.md#urls-used-for-core-functionality).

## View tampering alerts in the Microsoft Defender portal

On the device page in the Microsoft Defender portal, tampering alerts are available in **Timeline** and **Incidents and alerts**.

Open a tampering alert to review more information about the activity, including the process tree and alert timeline.

## Query tampering attempts with Advanced Hunting

You can use Advanced Hunting to investigate tampering events and alerts.

### Query tampering events for a device

To query tampering attempts for a specific device:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. Select **Hunting** > **Advanced hunting**.

1. Find the ID of the device you want to investigate in the device inventory, or run the following command on the device:

   ```bash
   mdatp health --field edr_device_id
   ```

1. Run the following query, replacing `<DeviceId>` with the device ID:

   ```kusto
   DeviceEvents
   | where Timestamp > ago(10d)
   | where ActionType == "TamperingAttempt"
   | where DeviceId == "<DeviceId>"
   ```

   Adjust the `Timestamp` value in the query as needed.

### Query tampering alerts

To query generated tampering alerts:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. Select **Hunting** > **Advanced hunting**.

1. Run the following query:

   ```kusto
   AlertInfo
   | where Timestamp > ago(10d)
   | where Title == "Tampering with the Microsoft Defender for Endpoint sensor"
   | where DetectionSource == "EDR"
   ```

   Adjust the `Timestamp` value in the query as needed.

## Test a tampering scenario

You can generate a test tampering attempt to verify that audit mode detects the activity.

For example, run the following command:

```bash
sudo vim /etc/opt/microsoft/mdatp/managed/mdatp_managed.json
```

The activity generates a tampering alert in the Microsoft Defender portal. The alert includes information about the initiating process and the target file.

## Tune alerts for legitimate tampering activity

If known and approved activity generates tampering alerts, you can tune the alerts to reduce unnecessary noise in the Microsoft Defender portal.

For more information about creating alert tuning rules, see [Tune an alert](/defender-xdr/investigate-alerts#tune-an-alert).

## Related content

- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure security policies and settings for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
- [Configure eBPF-based sensor for Microsoft Defender for Endpoint on Linux](linux-support-ebpf.md)
- [Investigate alerts in Microsoft Defender XDR](/defender-xdr/investigate-alerts)