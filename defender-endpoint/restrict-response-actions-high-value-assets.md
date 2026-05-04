---
title: Limit security operations on critical assets in Microsoft Defender for Endpoint
description: Learn how to onboard Tier-0 and high-value assets with restricted security operations in Microsoft Defender for Endpoint to reduce operational risk.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: amibarayev
ms.localizationpriority: medium
ms.date: 05/04/2026
ms.topic: concept-article
ms.custom: msecd-doc-authoring-1012
#customer intent:As a security engineer, I want to configure which response actions are allowed on high-value assets I'm onboarding to reduce operational risk.
---

# Restrict response actions on high-value assets (preview)

This article provides an overview of the Selective Response Actions capability in Microsoft Defender for Endpoint. Its target audience is security administrators and IT operations teams responsible for managing Microsoft Defender for Endpoint in environments that include Tier-0 systems and high-value assets (HVAs) such as domain controllers, ADFS servers, and other critical infrastructure.

## Overview

Selective Response Actions is a Microsoft Defender for Endpoint capability that enables organizations to tailor high-impact security operations during onboarding. It provides precise control over how response actions are applied on Tier-0 systems and other high-value assets, helping maintain operational stability while delivering strong protection.

### Background

Deploying Microsoft Defender for Endpoint on high-value assets (HVAs), such as domain controllers, ADFS servers, and other Tier-0 systems, requires a thoughtful approach to balance strong protection with operational stability. Given the powerful response capabilities available, organizations often seek greater control over how these actions are applied in sensitive environments.

Many organizations, especially those with strict privileged access management policies, also prefer to limit cloud-initiated administrative actions on Tier-0 systems to align with their security and compliance requirements.

The Selective Response Actions capability addresses these needs by providing a more controlled and flexible approach. It enables organizations to define exactly which response actions are allowed on critical assets, helping maintain operational continuity while still benefiting from Defender’s protection.

### How does the feature work?

First, the feature must be enabled on the tenant. See [Enable selective response actions](#enable-the-selective-response-actions-feature).

Once the feature is enabled, you use the Defender deployment tool (DDT) to create an onboarding package with restricted security operations settings. When you're configuring the package, you choose between full functionality (the default onboarding mode, where all response actions are allowed on the onboarded device) and restricted functionality (where high-impact response actions can be disallowed). If you choose restricted functionality, you can then specify which actions are allowed on the device once it's onboarded.

The following table describes high-impact response actions that you can allow or disallow.

[!INCLUDE [configurable-selective-response-actions](includes/configurable-selective-response-actions.md)]

See [Generate an onboarding package with restricted security operations settings](#generate-an-onboarding-package-with-restricted-security-operations-settings) for details about how to configure such a package.

> [!NOTE]
> Devices onboarded in restricted mode do not support Live Response script execution - this is disabled by design, even if Live Response is enabled. Restricted mode does not impact detection, alerting, or sensor coverage. All alerts, timelines, and threat detections continue to function as expected.

## Prerequisites and supported operating systems

- Restricted mode is supported on the following Windows client workstations and Windows Server operating systems running Sense version 10.8798 or later.

   | Operating System | Required KB |
   |---|---|
   | Windows Server 2025, all editions | [KB5063878](https://support.microsoft.com/topic/august-12-2025-kb5063878-os-build-26100-4946-69b2de20-e07d-404a-a19f-fd8c4ae27e0f) |
   | Windows Server 2022 | [KB5063880](https://support.microsoft.com/topic/august-12-2025-kb5063880-os-build-20348-4052-471ee125-e622-486c-ab3e-5847c8ca4e57) |
   | Windows Server 2019 | [KB5063877](https://support.microsoft.com/topic/august-12-2025-kb5063877-os-build-17763-7678-8944ed94-aec7-4780-b0a0-1164ba421379) |
   | Windows 10 22H2 | [KB5062649](https://support.microsoft.com/topic/july-22-2025-kb5062649-os-build-19045-6159-preview-86aa67e1-195e-41c8-9cb5-bc27c17d5c5d) |
   | Windows 11 23H2 | [KB5062663](https://support.microsoft.com/topic/july-22-2025-kb5062663-os-builds-22631-5699-preview-94936799-dd0c-45d0-9d1a-1b8351fb6b94) |
   | Windows 11 24H2 | [KB5062660](https://support.microsoft.com/topic/july-22-2025-kb5062660-os-build-26100-4770-preview-9c5bc200-52b6-4c1a-be70-80df6bbfe9c3) |
   | Windows 11 25H2 | All |

- To use restricted mode, the feature switch **Allow restricted security operations during onboarding** must be enabled. See [Enable the selective response actions feature](#enable-the-selective-response-actions-feature).

## Enable the selective response actions feature

To use the selective response actions capability, enable the feature in the Microsoft Defender portal:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
2. Navigate to **Settings** > **Endpoints** > **Advanced features**.
3. Turn on **Allow restricted security operations during onboarding**.

:::image type="content" source="./media/restrict-response-actions-high-value-assets/enable-selective-response-actions.png" alt-text="Screenshot of the Advanced features page showing Allow restricted operations during onboarding enabled." lightbox="./media/restrict-response-actions-high-value-assets/enable-selective-response-actions.png":::

Once enabled, the restricted mode option becomes available when creating Defender deployment packages for Windows through the Defender deployment tool (DDT). You can then create deployment packages that specify which security operations to allow on the devices you're onboarding. See [Generate an onboarding package with restricted security operations settings](#generate-an-onboarding-package-with-restricted-security-operations-settings) for details. Once the deployment package has been generated, use it to [onboard the device](defender-deployment-tool-windows.md#deploy-defender-endpoint-security-on-devices).

## Generate an onboarding package with restricted security operations settings

1. In the Microsoft Defender portal (security.microsoft.com), go **System** > **Settings** > **Endpoints** > **Onboarding**.

1. In the Step 1 dropdown menu, choose **Windows**.

1. Under **Deploy by downloading and applying packages or files**, select the **Onboard** button.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/defender-deployment-tool-windows-download-package.png" alt-text="Screenshot showing the Download package button in the Microsoft Defender portal." lightbox="./media/restrict-response-actions-high-value-assets/defender-deployment-tool-windows-download-package.png":::

1. The **Generate Defender deployment tool with an access key** page appears.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/configure-deployment-package.png" alt-text="Screenshot showing the how to configure a new deployment package." lightbox="./media/restrict-response-actions-high-value-assets/configure-deployment-package.png":::

   * Provide a name for the package. Be sure to create a name that's unique and descriptive.

   * Set an expiration date for the package. You can set the expiration date for any time up to a year. It's recommended to make the validity period of packages as short as possible to reduce the risk of unauthorized deployment package use.

   * Select **Restricted**.

      A list of high-impact security operations appears. Select the boxes next to the operations you want to allow on the onboarded device, and unselect the boxes next to the operations you want to disallow.
      
      :::image type="content" source="./media/restrict-response-actions-high-value-assets/security-operations-mode-menu.png" alt-text="Screenshot showing the security operations mode options in the Microsoft Defender portal." lightbox="./media/restrict-response-actions-high-value-assets/security-operations-mode-menu.png":::

      > [!NOTE]
      > Devices onboarded in restricted mode don't support the execution of Live Response scripts, even when **Live Response** is enabled in these settings. This restriction is enforced by design to ensure script-based actions remain blocked, maintaining a higher level of protection for sensitive assets.
      > 
      > Restricted mode with all response actions allowed **is not** equivalent to full functionality. When you onboard a device using a restricted package, running scripts is disabled by design, whereas onboarding with a full functionality package provides unrestricted access to all supported response actions and capabilities.

   * When you're done configuring the package, select **Generate**.

1. When the package is ready, you'll see a page that has the package access key and a download button, similar to the following image.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/deployment-package-download-page.png" alt-text="Screenshot showing the key that is generated for the deployment tool package." lightbox="./media/restrict-response-actions-high-value-assets/deployment-package-download-page.png":::

   Copy the key and save it, as it will be needed with the deployment tool.

   After you've copied the key and saved it, select **Download deployment tool**. This downloads a *.zip* file of the Defender deployment tool executable.

## Onboard a device with restricted response actions

Once you've generated and downloaded a deployment package with the desired restricted security operations settings, use the package to onboard the device as described in [Deploy Microsoft Defender for Endpoint to Windows devices using the Defender deployment tool (preview)](defender-deployment-tool-windows.md#deploy-defender-endpoint-security-on-devices).

## How to check the security operations status of onboarded devices

The security operations status of devices can be identified in several ways:

- On the **Device Inventory** page in the Defender portal, a property called *Security operations* indicates the onboarding mode of each device:

   - If the device is onboarded with full functionality, the value will show as **Full**.
   - If the device is onboarded with restricted capabilities, the value will show as **Restricted**, indicating to the admin that this device has a limited set of remote security operations available.

   This visibility helps security teams quickly understand the operational scope for each device and take appropriate actions if needed.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/device-inventory.png" alt-text="Screenshot of the Device Inventory page showing security operations status." lightbox="./media/restrict-response-actions-high-value-assets/device-inventory.png":::

- When the device is in restricted mode, a tag labeled *Restricted security operations* is automatically added to the device to help security teams quickly identify assets with limited functionality. You can see this tag on the **Device page**. The **Device page** also includes a **Security operations** status to reflect the level of remote security capabilities configured for the device:

   - **Full** indicates the device is onboarded with the complete set of Microsoft Defender for Endpoint capabilities. All remote response actions are available.
   - **Restricted** indicates the device is onboarded with a limited set of response actions available.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/device-page.png" alt-text="Screenshot of the Device page showing security operations status." lightbox="./media/restrict-response-actions-high-value-assets/device-page.png":::
   
   In the preceding image, you can see that initiating Live Response sessions has been disallowed on the device.

   To access a detailed list of all security controls and their current status (enabled or disabled) on the device, select **View security operations information** to display the **Device Security Operations** pane.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/security-operations-details.png" alt-text="Screenshot of the Device page showing security operations details." lightbox="./media/restrict-response-actions-high-value-assets/security-operations-details.png":::

- You can also use the Advanced Hunting property `RestrictedDeviceSecurityOperations` to check which security operations are restricted on the device. The values represent the specific security operation categories that are limited. For example, if the value of the `RestrictedDeviceSecurityOperations` property is *LiveResponse*, it means that only the Live Response capability is disallowed on the device, while all other operations are allowed.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/advanced-hunting.png" alt-text="Screenshot of the Advanced Hunting query showing the value of the RestrictedDeviceSecurityOperations property." lightbox="./media/restrict-response-actions-high-value-assets/advanced-hunting.png":::

- The selective response is also blocked when using public API. If you attempt to perform a restricted action via the API, you receive an error message indicating that the operation isn't allowed on the device.

   :::image type="content" source="./media/restrict-response-actions-high-value-assets/api-error-message.png" alt-text="Screenshot of the error message when attempting a restricted response action via public API." lightbox="./media/restrict-response-actions-high-value-assets/api-error-message.png":::

## Changing restriction settings

Once a device is onboarded with restricted settings, its security operations configuration can't be changed or modified. To update a device's response capabilities, you must offboard the device and re-onboard it using a new deployment package with the desired settings. The device ID remains the same, and all historical data are preserved.

If you want to restrict response actions on a device that's already onboarded to Defender for Endpoint in Full mode, you must first offboard the device and then re-onboard it using an onboarding package configured with restricted settings. The device ID remains the same, and all historical data are preserved.

## Related resources

- [Deploy Microsoft Defender for Endpoint to Windows devices using the Defender deployment tool (preview)](defender-deployment-tool-windows.md?tabs=restricted-functionality)
- [Troubleshoot Defender deployment tool issues](defender-deployment-tool-windows.md#troubleshooting)
- [Onboard devices to Microsoft Defender for Endpoint](onboard-configure.md)
- [Take response actions on a device](respond-machine-alerts.md)