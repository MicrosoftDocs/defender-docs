---
title: Create and manage device tags
description: Use device tags to group devices to capture context and enable dynamic list creation as part of an incident
ms.service: defender-endpoint
ms.author: bagol
author: batamig
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: how-to
ms.custom: api
ms.subservice: reference
search.appverid: met150
ms.date: 02/25/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---

# Create and manage device tags

Add tags on devices to create a logical group affiliation. Device tags support proper mapping of the network, enabling you to attach different tags to capture context and to enable dynamic list creation as part of an incident. Tags can be used as a filter in the **Device inventory** view, or to group devices. For more information on device grouping, see [Create and manage device groups](machine-groups.md).

> [!NOTE]
> Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.
>
> There might be some latency between the time a tag is added to a device and its availability in the devices list and device page.

To add device tags using API, see [Add or remove device tags API](api/add-or-remove-machine-tags.md).

## Supported operating systems

Device tagging is supported on the following operating systems:

 - Windows 11
 - Windows 10, version 1709 or later
 - Windows Server, version 1803 or later
 - Windows Server 2016
 - Windows Server 2012 R2
 - Windows Server 2008 R2 SP1
 - Windows 8.1
 - Windows 7 SP1

## Add device tags

You can add tags to devices using the following methods. Each method is suited for different scenarios and device platforms.

| Method | Platform | Steps |
|--------|----------|-------|
| **Portal** | All supported platforms | Manually add tags to individual devices or small groups. See [Add device tags using the portal](#add-device-tags-using-the-portal). |
| **Dynamic rules** | All supported platforms | Create rules in the Defender portal that automatically assign and remove tags based on device properties. See [Asset rule management - Dynamic rules for devices](/defender-xdr/configure-asset-rules). |
| **Registry key** | Windows | Set registry key `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging\` with REG_SZ value `Group` containing the tag name (max 200 characters). Tags sync once daily; restart the device for immediate sync. To remove a tag, clear the value data instead of deleting the `Group` key. |
| **Security settings management** | macOS, Linux | Create an Endpoint detection and response security policy. See [Manage endpoint security policies on MDE-onboarded devices](/mem/intune/protect/mde-security-integration) and [Manage endpoint security policies in Defender for Endpoint](manage-security-policies.md). |
| **Configuration profile** | macOS, Linux | **macOS**: Create a `.plist` configuration profile and deploy it manually or through a management tool. See [Set preferences for MDE on macOS](mac-preferences.md) and [Custom settings for macOS in Intune](/mem/intune/configuration/custom-settings-macos). **Linux**: Create a `.json` configuration profile. See [Set preferences for MDE on Linux](linux-preferences.md). |
| **Custom Intune profile** | Windows 10 or later | Create a device configuration profile with custom settings in Intune. Use OMA-URI `./Device/Vendor/MSFT/WindowsAdvancedThreatProtection/DeviceTagging/Group` with data type **String**. See [Create a profile with custom settings in Intune](/mem/intune/configuration/custom-settings-configure). |
| **App configuration policy in Intune** | iOS, Android | Define and apply tags for mobile devices through Intune app configuration. See [Add device tags using app configuration policy](#add-device-tags-by-creating-app-configuration-policy-in-microsoft-intune). |

## Add device tags using the portal

1. Select the device that you want to manage tags on. You can select or search for a device from any of the following views:

   - **Alerts queue** - Select the device name beside the device icon from the alerts queue.
   - **Devices inventory** - Select the device name from the list of devices.
   - **Search box** - Select Device from the drop-down menu and enter the device name.

     You can also get to the alert page through the file and IP views.

1. Select **Manage tags** from the row of Response actions.

    :::image type="content" source="media/manage-tags-option.png" alt-text="Image of manage tags button" lightbox="media/manage-tags-option.png":::

1. Type to find or create tags.

    :::image type="content" source="media/create-new-tag.png" alt-text="Adding tags on device1" lightbox="media/create-new-tag.png":::

Tags are added to the device view and are also reflected on the **Devices inventory** view. You can then use the **Tags** filter to see the relevant list of devices.

> [!NOTE]
> Filtering might not work on tag names that contain parenthesis or commas.
>
> When you create a new tag, a list of existing tags is displayed. The list only shows tags created through the portal. Existing tags created from client devices aren't displayed.

You can also delete tags from this view.

:::image type="content" source="media/new-tag-label-display.png" alt-text="Adding tags on device2" lightbox="media/new-tag-label-display.png":::

## Add device tags by creating app configuration policy in Microsoft Intune

> [!NOTE]
> Applicable only on iOS and Android devices.

You can use Microsoft Intune to define and apply tags for mobile devices by creating an app configuration profile in Intune.

- [Tag mobile devices with Microsoft Defender for Endpoint](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-mobile-device-tagging-for-ios-and-android/ba-p/3897368)
- **For iOS**, follow the guidance in [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md).
- **For Android**, follow the guidance in [Configure Defender for Endpoint on Android features](android-configure.md).
