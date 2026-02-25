---
title: Create and manage device tags and target devices
description: Use device tags, device groups, and targeting to organize devices and apply security actions at scale in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
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

# Create and manage device tags and target devices

Device targeting in Microsoft Defender for Endpoint follows two stages: first you **create tags** to label devices with business context, then you **form device groups** based on those tags to target security operations at scale — such as role-based access, custom data collection, automation rules, and attack surface reduction policies.

## Prerequisites

Before you create tags and target devices, review the following requirements.

### Permissions

- **Dynamic tags**: Requires appropriate permissions in [Asset Rule Management](/defender-xdr/configure-asset-rules).
- **Manual tags**: Requires device-level permissions in the Defender portal.
- **Automation rules**: Requires rule creation permissions.
- **Device groups**: Requires Security Administrator role to create and manage groups.

### Performance notes

- Each device can have multiple tags.
- Dynamic tags update approximately every hour.
- Large numbers of tags don't significantly affect performance.
- Custom data collection rules can target multiple tag combinations.

## Understand tags, groups, and targeting

### Tags vs. groups

**Device tags** are labels you attach to devices — either manually or through dynamic rules — to capture business context such as department, location, or criticality. All users can see tagged devices. Tags alone don't control access or apply security policies; they provide the organizational foundation for targeting.

**Device groups** build on tags to control which security teams can access and manage specific devices. When you create a device group, you define matching rules (often based on tags), set automated remediation levels, and assign Microsoft Entra user groups. Device groups enable role-based access control (RBAC) so that, for example, a regional security team sees only devices in their geography. For detailed instructions, see [Create and manage device groups](machine-groups.md).

### Dynamic tags vs. manual tags

**Manual tags** are custom labels you apply directly to individual devices through the portal or API. They're quick to set up and useful for ad-hoc needs like tagging devices during an active investigation. However, they don't scale well and require manual updates. Manual tags aren't supported for custom data collection or some automation scenarios.

**Dynamic tags** are applied automatically based on rules you define in [Asset Rule Management](/defender-xdr/configure-asset-rules). They update as device properties change (approximately every hour), scale to thousands of devices, and are required for advanced capabilities like [custom data collection](custom-data-collection.md). Use dynamic tags whenever you need tags to stay current without manual effort.

> [!IMPORTANT]
> Many advanced Defender for Endpoint capabilities, including custom data collection, require dynamic tags. Manual tags aren't supported for these scenarios.

### Targeting scenarios

The following table summarizes common scenarios where device targeting drives security operations.

| Scenario | Approach | Example |
|----------|----------|---------|
| **Scope investigations** | Tag devices by department or incident, then filter alerts and advanced hunting queries by tag. | Investigate all `Finance-Department` devices for suspicious lateral movement. |
| **Collect specialized telemetry** | Create dynamic tags for target devices, then create custom data collection rules. Requires dynamic tags and a Microsoft Sentinel workspace. | Collect file access events from `Database-Servers` to monitor data access. |
| **Automate response actions** | Define automated responses for device groups based on tags. | Auto-isolate `Public-Kiosk` devices when high-severity malware is detected. |
| **Control analyst access (RBAC)** | Create device groups from tags and assign them to Microsoft Entra security teams. | Give the Finance Security Team access only to `Finance-Department` devices. |
| **Deploy ASR rules by device type** | Apply different attack surface reduction policies to different tag-based groups. | Aggressive blocking on `Internet-Facing-Servers`; audit mode on `Development-Machines`. |
| **Enforce Conditional Access** | Use device risk levels and group membership to inform access decisions. | Require MFA for `High-Risk-Devices` accessing sensitive applications. |
| **Organize by geography** | Tag devices by region or site for distributed security operations. | EMEA security team monitors and responds to `Location-EMEA` devices. |
| **Manage device lifecycle** | Tag devices by operational stage (Production, Staging, Decommissioning). | Apply full controls to Production; reduced monitoring for Decommissioning. |
| **Pilot new security features** | Apply manual tags to a pilot group, deploy the feature in audit mode, then expand. | Tag 20 devices with `ASR-Pilot-2026`, test new rule, refine, then roll out broadly. |

## Create tags

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

> [!NOTE]
> Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2. There might be some latency between the time a tag is added to a device and its availability in the devices list and device page.

To add device tags using API, see [Add or remove device tags API](api/add-or-remove-machine-tags.md).

### Supported operating systems

Device tagging is supported on:

- Windows 11, Windows 10 (version 1709 or later), Windows 8.1, Windows 7 SP1
- Windows Server (version 1803 or later), Windows Server 2016, Windows Server 2012 R2, Windows Server 2008 R2 SP1
- macOS, Linux, iOS, Android

### Add device tags using the portal

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

### Add device tags by creating app configuration policy in Microsoft Intune

> [!NOTE]
> Applicable only on iOS and Android devices.

You can use Microsoft Intune to define and apply tags for mobile devices by creating an app configuration profile in Intune.

- [Tag mobile devices with Microsoft Defender for Endpoint](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/announcing-mobile-device-tagging-for-ios-and-android/ba-p/3897368)
- **For iOS**, follow the guidance in [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md).
- **For Android**, follow the guidance in [Configure Defender for Endpoint on Android features](android-configure.md).

## Create device groups

After you create tags, use them to form device groups that control access and apply security policies. When you create a device group, you:

1. Set the automated remediation level (no automated response, semi, or full remediation).
1. Define matching rules that determine which devices belong to the group (based on device name, domain, tags, or OS platform).
1. Assign Microsoft Entra user groups that should have access to the device group.
1. Rank the device group relative to other groups (a device matching multiple groups is added only to the highest-ranked group).

> [!NOTE]
> A device group is accessible to all users if you don't assign any Microsoft Entra groups to it.

For detailed instructions on creating and managing device groups, see [Create and manage device groups](machine-groups.md).

## Apply security actions

Once your devices are organized with tags and groups, you can target security operations at scale. Device groups and tags power capabilities including investigations and threat hunting, custom data collection, automation rules, role-based access, attack surface reduction rules, and Conditional Access policies.

For the full list of security actions you can target to device groups, including scenarios and links, see [Security actions powered by targeting](devices-overview.md#security-actions-powered-by-targeting).
