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

This article provides an overview of the selective response actions capability in Microsoft Defender for Endpoint. It's target audience is security administrators and IT operations teams responsible for managing Microsoft Defender for Endpoint in environments that include Tier-0 systems and high-value assets (HVAs) such as domain controllers, ADFS servers, and other critical infrastructure.

## Overview

The selective response actions capability is a Microsoft Defender for Endpoint feature that lets you restrict or customize high-impact security operations during onboarding so you can reduce operational risk on Tier-0 systems and other high-value assets. In practice, it limits intrusive actions such as device isolation, script execution, or Live Response on sensitive devices. 

### Why is the selective response actions capability needed?

Deploying Microsoft Defender for Endpoint on high-value assets (HVAs) — such as domain controllers, ADFS servers, and other Tier-0 systems — introduces operational risk due to the powerful actions available to privileged users. Response actions such as isolating devices, executing scripts, or initiating live response sessions can cause significant disruption to critical infrastructure if misused, either unintentionally or due to compromised accounts.

Another reason the selective response actions capability is needed is that organizations that enforce privileged access management often prohibit cloud-based admin privileges on Tier-0 systems.

The selective response actions capability mitigates these risks. By limiting the intrusive actions that can be performed on Tier-0 assets, this capability reduces the risk of accidental or malicious disruption.

### How does the feature work??

First, the feature must be enabled on the tenant. See [Enable selective response actions](#enabling-the-selective-response-actions-feature).

Once the feature is enabled, you use the Defender deployment tool (DDT) to create an onboarding package with restricted security operations settings. When you're configuring the package, you choose between full functionality (where all response actions are allowed on the onboarded device) and restricted functionality (where high-impact response actions can be disallowed). If you choose restricted functionality, you can then specify which actions are allowed on the device once it's onboarded.

The following table describes high-impact response actions that you can allow or disallow.

[!INCLUDE [configurable-selective-response-actions](includes/configurable-selective-response-actions.md)]

For detailed instructions on how to use the Defender deployment tool to create to an onboarding packages with restricted security operations settings, see [Deploy Microsoft Defender for Endpoint to Windows devices using the Defender deployment tool (preview)](defender-deployment-tool-windows.md?tabs=restricted-functionality).

> [!NOTE]
> Devices onboarded in restricted mode don't support the execution of Live Response scripts, even when **Live Response** is enabled in these settings. This restriction is enforced by design to ensure script-based actions remain blocked, maintaining a higher level of protection for sensitive assets.

## Prerequisites and supported operating systems

- Restricted mode is supported on the following Windows client workstations and Windows Server operating systems running Sense version 10.8798 or later.

   | Operating System | Required KB |
   |---|---|
   | Windows Server 2025, all editions | KB5063878 |
   | Windows Server 2022 | KB5063880 |
   | Windows Server 2019 | KB5063877 |
   | Windows 10 22H2 | KB5062649 |
   | Windows 11 23H2 | KB5062663 |
   | Windows 11 24H2 | KB5062660 |
   | Windows 11 25H2 | All |

- To use restricted mode, the feature switch **Allow restricted operations during onboarding** must be enabled. See [Enabling the selective response actions feature](#enabling-the-selective-response-actions-feature).#

## Enabling the selective response actions feature

To use the selective response actions capability, enable the feature in the Microsoft Defender portal:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
2. Navigate to **Settings** > **Endpoints** > **Advanced features**.
3. Turn on **Allow restricted operations during onboarding**.

Once enabled, the restricted mode option becomes available when creating Defender deployment packages for Windows through the Defender deployment tool (DDT). You can then create deployment packages that specify which security operations to allow on the devices you're onboarding.

## How to check the security operations status of onboarded devices

The security operations status of devices can be identified in several ways:

- On the **Device Inventory** page in the Defender portal, a property called *Security operations* indicates the onboarding mode of each device:

   - If the device is onboarded with full functionality, the value will show as **Full**.
   - If the device is onboarded with restricted capabilities, the value will show as **Restricted**, indicating to the admin that this device has a limited set of remote security operations available.

   This visibility helps security teams quickly understand the operational scope for each device and take appropriate actions if needed.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/device-inventory.png" alt-text="Device Inventory page showing security operations status" lightbox="./media/restrict-response-actions-high-value-assets/device-inventory.png":::

- The **Device page** in the Defender portal includes a Security operations status to reflect the level of remote security capabilities configured for the device:

   - **Full** indicates the device is onboarded with the complete set of Microsoft Defender for Endpoint capabilities. All remote response actions are available.
   - **Restricted** indicates the device is onboarded with a limited set of response actions available.

   When the device is in restricted mode, a tag labeled Restricted security operations is automatically added to the device to help security teams quickly identify assets with limited functionality. To access a detailed list of all security controls and their current status (enabled or disabled) on the device, select **View security operations information**.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/device-page.png" alt-text="Device page showing security operations status" lightbox="./media/restrict-response-actions-high-value-assets/device-page.png":::

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/security-operations-details.png" alt-text="Device page showing security operations details." lightbox="./media/restrict-response-actions-high-value-assets/security-operations-details.png":::

- You can also use the Advanced Hunting property `RestrictedDeviceSecurityOperations` to check which security operations are restricted on the device. The values represent the specific security operation categories that are limited. For example, if the value of the `RestrictedDeviceSecurityOperations` property is *LiveResponse*, it means that only the Live Response capability is disallowed on the device, while all other operations are allowed.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/advanced-hunting.png" alt-text="Advanced Hunting property showing the value of the RestrictedDeviceSecurityOperations property." lightbox="./media/restrict-response-actions-high-value-assets/advanced-hunting.png":::

## Changing restriction settings

Once a device is onboarded with restricted settings, its security operations configuration can't be changed or modified. To update a device's response capabilities, you must offboard the device and re-onboard it using a new deployment package with the desired settings. The device ID remains the same, and all historical data are preserved.

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