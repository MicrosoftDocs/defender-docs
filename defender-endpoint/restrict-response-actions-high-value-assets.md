---
title: Limit security operations on critical assets in Microsoft Defender for Endpoint
description: Learn how to onboard Tier-0 and high-value assets with restricted security operations in Microsoft Defender for Endpoint to reduce operational risk.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: amibarayev
ms.localizationpriority: medium
ms.date: 04/15/2026
ms.topic: concept-article
#customer intent: As a security engineer, I want to configure which response actions are allowed on high-value assets I'm onboarding to reduce operational risk.
---

# Restrict response actions on high-value assets (preview)

This article provides an overview of the selective response actions capability in Microsoft Defender for Endpoint. This capability allows organizations to restrict high-impact security operations on devices during onboarding to reduce operational risk on critical infrastructure.

**Target audience:** Security administrators and IT operations teams responsible for managing Microsoft Defender for Endpoint in environments that include Tier-0 systems and high-value assets such as domain controllers, ADFS servers, and other critical infrastructure.

## Why selective response actions are needed

Deploying Microsoft Defender for Endpoint on high-value assets (HVAs) — such as domain controllers, ADFS servers, and other Tier-0 systems — introduces operational risk due to the powerful actions available to privileged users. Capabilities such as isolating devices, executing scripts, or initiating live response sessions can cause significant disruption to critical infrastructure if misused, either unintentionally or due to compromised accounts.

In addition, organizations that enforce privileged access management often prohibit cloud-based admin privileges on Tier-0 systems.

The selective response actions capability mitigates these risks by providing controls that restrict or customize high-impact security operations on HVAs. This capability reduces the risk of accidental or malicious disruption by limiting the intrusive actions that can be performed on Tier-0 assets.

## Security operations modes

The set of high-impact response actions that are allowed or disallowed on a device is determined by the deployment package used to onboard the device. When you create the deployment package using the Defender deployment tool (DDT), you choose one of two security operations modes:

- **Full functionality**: *Full functionalilty* means that all security operations are allowed on the device once it is onboarded. This is the default mode and is recommended for standard devices that aren't considered high-value assets.
- **Restricted**: *Restricted* means that the only high-impact security operations allowed on the device once it is onboarded are those you specify. Use this mode to enforce stricter security boundaries on Tier-0 and HVA devices.

If you choose restricted mode, you can then individually allow or disallow the following capabilities.

[!INCLUDE [configurable-selective-response-actions](includes/configurable-selective-response-actions.md)]

> [!NOTE]
> Devices onboarded in restricted mode don't support the execution of Live Response scripts, even when **Live Response** is enabled in these settings. This restriction is enforced by design to ensure script-based actions remain blocked, maintaining a higher level of protection for sensitive assets.

For instructions on creating and deploying onboarding packages, see [Deploy Microsoft Defender for Endpoint to Windows devices using the Defender deployment tool (preview)](defender-deployment-tool-windows.md).

## Visibility and identification

Devices onboarded in restricted mode are identified in the Defender portal in several ways:

- **Device Inventory page**: A **Security operations** property indicates the onboarding mode of each device as either **Full** or **Restricted**.
- **Device page**: A **Security operations** status reflects the level of remote security capabilities configured for the device. Devices in Restricted mode are automatically tagged with **Restricted security operations**. Select **View security operations information** to see a detailed list of all security controls and their current status (enabled or disabled).
- **Advanced Hunting**: A `RestrictedDeviceSecurityOperations` property in the `DeviceInfo` table indicates which security operations are restricted on the device. For example, a value of `LiveResponse` means that only the Live Response capability is restricted while all other operations remain enabled.

Restricted mode doesn't reduce detection, alerting, or sensor coverage. All alerts, timelines, and threat detections continue to function normally.

## Changing restriction settings

Once a device is onboarded with restricted settings, its security operations configuration can't be changed or modified. To update a device's response capabilities, you must offboard the device and re-onboard it using a new deployment package with the desired settings. The device ID remains the same, and all historical data are preserved.

> [!NOTE]
> Restricted mode is independent of High Value device classification. It can be applied to High Value devices, Tier-0 assets, or any other devices where you want to restrict remote response security operations.

## Enabling the feature

To use the selective response actions capability, enable the feature in the Microsoft Defender portal:

1. Navigate to **Settings** > **Endpoints** > **Advanced features**.
2. Turn on **Allow restricted operations during onboarding**.

Once enabled, the restricted mode option becomes available when creating Defender deployment packages for Windows through the Defender deployment tool (DDT). You can then create deployment packages that specify which security operations to allow on each device.

## Prerequisites and supported operating systems

Restricted mode requires:

- **Sense version 10.8798 or later** on the target device.
- One of the following supported operating systems with the corresponding update installed:

| Operating System | Required KB |
|---|---|
| Windows Server 2025, all editions | KB5063878 |
| Windows Server 2022 | KB5063880 |
| Windows Server 2019 | KB5063877 |
| Windows 10 22H2 | KB5062649 |
| Windows 11 23H2 | KB5062663 |
| Windows 11 24H2 | KB5062660 |
| Windows 11 25H2 | All |

## Frequently asked questions

### Is using a Restricted package with all response actions allowed the same as Full mode?

No. Even if all response actions are allowed, onboarding a device using a Restricted package isn't the same as Full mode. In restricted mode, running scripts is disabled by design. Full mode provides unrestricted access to all supported response actions and capabilities.

### Does restricted mode affect alert generation or detection capabilities?

No. Restricted mode doesn't reduce detection, alerting, or sensor coverage. All alerts, timelines, and threat detections continue to function normally.

### Is there a relationship between restricted mode and devices classified as High Value?

No. Devices classified as High Value use an organization-defined tag to identify critical assets such as domain controllers, internet-facing machines, or executive devices. Restricted mode is independent of High Value classification and can be applied to High Value devices, Tier-0 assets, or any other devices where you want to restrict remote response security operations.

### How do I restrict response actions on a device that's already onboarded to Defender for Endpoint?

You must first offboard the device and then re-onboard it using an onboarding package configured with restricted settings. The device ID remains the same, and all historical data are preserved.

## Related resources

- [Deploy Microsoft Defender for Endpoint to Windows devices using the Defender deployment tool (preview)](defender-deployment-tool-windows.md)
- [Troubleshoot Defender deployment tool issues](defender-deployment-tool-windows.md#troubleshooting)
- [Onboard devices to Microsoft Defender for Endpoint](onboard-configure.md)
- [Take response actions on a device](respond-machine-alerts.md)