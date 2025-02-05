---
title: Deploy and manage device control using JAMF 
description: Learn how to use device control policies using JAMF.
ms.service: defender-endpoint
author: emmwalshh
ms.author: ewalsh
ms.reviewer: joshbregman
manager: deniseb
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: conceptual
ms.subservice: macos
search.appverid: met150
ms.date: 01/31/2025
---

# Deploy and manage Device Control using JAMF

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

Device control in Microsoft Defender for Endpoint on macOS enables you to audit, allow, or prevent the read, write, or execute access to removable storage. Device control also allows you to manage iOS and portable devices and Bluetooth media, with or without exclusions.

## Licensing requirements

Before you begin, confirm your subscription. To access and use device control, your subscription must include Defender for Endpoint Plan 1. For more information, see the following resources:

- [Microsoft 365 Enterprise plans comparison table](https://go.microsoft.com/fwlink/p/?LinkID=2139145&clcid=0x409&culture=&country=us)
- [Understand subscriptions and licenses in Microsoft 365 for business](/microsoft-365/commerce/licenses/subscriptions-and-licenses)

[!INCLUDE [Microsoft Defender for Endpoint third-party tool support](../includes/support.md)]

## Deploy policy by using JAMF

### Step 1: Creating a JSON policy

Device Control on Mac is defined through a JSON policy. This policy should have the appropriate groups, rules, and settings defined to tailor specific customer conditions. For example, some enterprise organizations might need to block all removable media devices entirely, while others might have specific exceptions for a vendor or serial number. Microsoft has a [local GitHub repository](https://github.com/microsoft/mdatp-devicecontrol/tree/main/macOS/policy/samples"https://github.com/microsoft/mdatp-devicecontrol/tree/main/macos/policy/samples") that you can use to build your policies.

For more information about settings, rules, and groups, see [Device Control for macOS](mac-device-control-overview.md).

### Step 2: Validating a JSON policy

You must validate your JSON policy after it's created to ensure there are no syntax or configuration errors. A schema for device control policies is available in [our GitHub repository](https://github.com/microsoft/mdatp-devicecontrol/blob/main/macOS/policy/device_control_policy_schema.json"https://github.com/microsoft/mdatp-devicecontrol/blob/main/macos/policy/device_control_policy_schema.json"). The Defender for Endpoint application has built-in functionality to compare your JSON to the defined schema. 

1. Save your configuration on a local device as a `.json` file.

2. Ensure you have access to `mdatp` commands. If your device is already onboarded, then you should have this functionality.

3. Run `mdatp device-control policy validate --path <pathtojson>`.

### Step 3: Update your Defender for Endpoint preferences Schema

The [Defender for Endpoint preferences schema](https://github.com/microsoft/mdatp-xplat/blob/master/macos/schema/schema.json) includes the new `deviceControl/policy` key. The existing Defender for Endpoint preferences configuration profile should be updated to use the new schema file's content.

:::image type="content" source="media/macos-device-control-jamf-mde-preferences-schema.png" alt-text="Shows where to edit the Microsoft Defender for Endpoint Preferences Schema to update." lightbox="media/macos-device-control-jamf-mde-preferences-schema.png":::

### Step 4: Add the device control policy to Defender for Endpoint preferences

A new device control property is now available to add to the user experience.  

1. In your Jamf console, select **Add/Remove properties**, select **Device Control**, and then select **Apply**.

    :::image type="content" source="media/macos-device-control-jamf-device-control-property.png" alt-text="Shows how to add Device Control in Microsoft Defender for Endpoint" lightbox="media/macos-device-control-jamf-device-control-property.png":::

2. Scroll down until you see the **Device Control** property (it's at the bottom of the list), and then select **Add/Remove properties**.

3. Select **Device Control Policy**, and then select **Apply**.  

    :::image type="content" source="media/macos-device-control-jamf-device-control-add-remove-property.png" alt-text="Shows how to apply Device Control Policy in Microsoft Defender for Endpoint." lightbox="media/macos-device-control-jamf-device-control-add-remove-property.png":::

4. Copy and paste your device control policy JSON into the text box.

    :::image type="content" source="media/macos-device-control-jamf-device-control-policy-json.png" alt-text="Shows where to add the Device Control policy JSON in Microsoft Defender for Endpoint." lightbox="media/macos-device-control-jamf-device-control-policy-json.png":::

5. Save your changes.

## See also

- [Device Control for macOS](mac-device-control-overview.md)
- [Deploy and manage Device Control using Intune](mac-device-control-intune.md)
- [macOS Device Control frequently asked questions (FAQ)](mac-device-control-faq.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
