---
title: Configure the Microsoft Defender permissions profile for Iru
description: Prepare the combined macOS permissions profile required to run Microsoft Defender for Endpoint on devices managed with Iru.
ms.service: defender-endpoint
author: paul-ej
ms.author: 
ms.reviewer: N/A
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.topic: how-to
ms.subservice: macos
ms.date: 08/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
---

# Configure the Microsoft Defender permissions profile for Iru

Prepare the `MS-Defender-Config.mobileconfig` profile before you deploy Microsoft Defender for Endpoint on macOS with Iru. The profile combines the macOS permissions that Defender requires into one custom profile.

The profile doesn't onboard the Mac to your Microsoft Defender for Endpoint tenant or configure antivirus and EDR preferences. Configure tenant onboarding separately by following [Configure the tenant onboarding profile for Microsoft Defender for Endpoint](mac-iru-build-onboarding-mobileconfig.md). For product preferences, see [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md).

[!INCLUDE [Microsoft Defender for Endpoint third-party tool support](../includes/support.md)]

## Permissions included in the profile

The template contains the following payloads:

| Payload | Purpose |
|---|---|
| Background service management | Allows the Microsoft Defender and Microsoft Purview Data Loss Prevention (DLP) services identified by their launch-service label prefixes to run in the background. |
| Web content filter | Enables the Defender network extension to inspect socket traffic. |
| Notifications | Allows Microsoft AutoUpdate and the Defender status menu application to display notifications. |
| System extensions | Approves the Defender endpoint security and network system extensions. |
| Privacy Preferences Policy Control | Grants Full Disk Access to Defender components and the Microsoft Purview DLP daemon, and grants Accessibility access to the DLP daemon. |

The profile doesn't configure a Microsoft AutoUpdate channel, even though its notification payload includes Microsoft AutoUpdate. It also doesn't grant Bluetooth access for Device Control. Deploy the relevant additional profiles if your organization requires those capabilities. See the [Microsoft Defender for Endpoint macOS configuration-profile repository](https://github.com/microsoft/mdatp-xplat/tree/master/macos/mobileconfig/profiles) for current Microsoft-provided profiles.

> [!NOTE]
> The privacy payload includes permissions for `com.microsoft.dlp.daemon`. These permissions support Microsoft Purview Endpoint DLP. Review the combined profile with your security and privacy teams if your organization doesn't deploy Endpoint DLP.

The template consolidates settings from the Microsoft-provided profiles. Check the repository for updated payloads before each broad deployment.

## Download the template

1. Go to [MS-Defender-Config.mobileconfig](https://github.com/paul-ej/iru-tools/blob/main/microsoft-defender/defender-config/MS-Defender-Config.mobileconfig).
1. Select **Download raw file**.
1. Save the file as `MS-Defender-Config.mobileconfig`.
1. Open the file in a text editor that preserves plain-text XML.

## Create unique profile identifiers

Apple requires each `PayloadUUID` to be globally unique. The template has one top-level profile and five nested payloads, so generate six UUIDs.

Run `uuidgen` six times in Terminal and record each result:

```bash
uuidgen # Top-level profile
uuidgen # Background services
uuidgen # Network filter
uuidgen # Notifications
uuidgen # System extensions
uuidgen # Privacy preferences
```

Generate these values once when you first create the profile. Keep the same UUIDs and identifiers when you update an existing deployment. macOS uses them to replace the installed profile and payloads instead of treating them as new items. For more information, see [Apple's common payload keys](https://developer.apple.com/documentation/devicemanagement/commonpayloadkeys).

## Update the required fields

Update the fields in the following table. The suggested nested identifiers use the top-level profile identifier as a base, which keeps every identifier unique and readable.

| Location | Existing field or value | Required change |
|---|---|---|
| Top-level profile | `PayloadIdentifier` value `com.kandji.profile.custom.PROFILE_IDENTIFIER_UUID` | Replace `PROFILE_IDENTIFIER_UUID` with the top-level profile UUID. Alternatively, replace the complete value with a unique reverse-DNS identifier owned by your organization. Record the final value as the **profile identifier**. |
| Top-level profile | `PayloadUUID` value `7dd5c2e2-6763-576f-a9b1-50246c12366e` | Replace it with the top-level profile UUID. |
| Background service payload | `PayloadIdentifier` and `PayloadUUID` | Set `PayloadIdentifier` to `<profile identifier>.background-services`. Replace `PayloadUUID` with the background-services UUID. |
| Web content filter payload | `PayloadOrganization` value `ORGANIZATION_NAME` | Replace the placeholder with your organization's display name. |
| Web content filter payload | `PayloadIdentifier` and `PayloadUUID` | Set `PayloadIdentifier` to `<profile identifier>.network-filter`. Replace `PayloadUUID` with the network-filter UUID. |
| Notifications payload | `PayloadIdentifier` and `PayloadUUID` | Set `PayloadIdentifier` to `<profile identifier>.notifications`. Replace `PayloadUUID` with the notifications UUID. |
| System extensions payload | `PayloadIdentifier` and `PayloadUUID` | Set `PayloadIdentifier` to `<profile identifier>.system-extensions`. Replace `PayloadUUID` with the system-extensions UUID. |
| Privacy preferences payload | `PayloadIdentifier` and `PayloadUUID` | Set `PayloadIdentifier` to `<profile identifier>.privacy`. Replace `PayloadUUID` with the privacy-preferences UUID. |

For example, if the top-level identifier is `com.kandji.profile.custom.11111111-2222-3333-4444-555555555555`, use `com.kandji.profile.custom.11111111-2222-3333-4444-555555555555.network-filter` for the web content filter payload identifier.

You can also change the top-level `PayloadOrganization`, `PayloadDisplayName`, and `PayloadDescription` values to match your organization's naming convention. Leave nested `PayloadOrganization` values set to `Microsoft Corporation` where no placeholder is present. Those values identify Microsoft as the provider of the corresponding payload settings.

## Review optional policy choices

The template uses Microsoft's default settings. Review the following values before deployment:

| Setting | Template value | Guidance |
|---|---|---|
| `AllowUserOverrides` | `true` | Users can approve additional system extensions that the profile doesn't list. Set this value to `false` only if your organization's system-extension policy requires an explicit allowlist. This choice affects other system extensions on the Mac, not only Defender. |
| `ShowInNotificationCenter` | `true` | Defender and Microsoft AutoUpdate notifications appear in Notification Center. Set it to `false` in either notification dictionary if your organization intentionally suppresses that application's notifications. |
| `ShowInLockScreen` | `false` | Notifications don't appear on the Lock Screen. Change this value only if your notification policy requires Lock Screen visibility. |
| `SoundsEnabled` and `BadgesEnabled` | `true` | Notifications use sounds and badges. Adjust them to match your user-experience policy. |
| `PayloadRemovalDisallowed` | `true` | Local users can't remove the managed profile. Keep the value set to `true` for managed deployments. |

Don't change `CriticalAlertEnabled` unless Microsoft confirms that the applicable application and your deployment support critical alerts.

## Leave Microsoft identifiers unchanged

The functional identifiers and code-signing requirements connect each permission to Microsoft-signed software. Changing them prevents one or more Defender components from loading or receiving the required permission.

Leave the following values unchanged:

- Microsoft Team ID `UBF8T346G9`.
- Bundle identifiers beginning with `com.microsoft`, including `com.microsoft.wdav`, `com.microsoft.wdav.epsext`, `com.microsoft.wdav.netext`, `com.microsoft.wdav.tray`, `com.microsoft.autoupdate2`, and `com.microsoft.dlp.daemon`.
- Background-service `RuleType` and `RuleValue` entries.
- The complete `FilterDataProviderDesignatedRequirement` and every `CodeRequirement` string.
- Network-filter values, including `FilterGrade`, `FilterPackets`, `FilterSockets`, `FilterType`, and `PluginBundleID`.
- Privacy values, including `Allowed`, `IdentifierType`, and `StaticCode`.
- Payload types such as `com.apple.servicemanagement`, `com.apple.webcontent-filter`, `com.apple.notificationsettings`, `com.apple.system-extension-policy`, and `com.apple.TCC.configuration-profile-policy`.
- `PayloadEnabled`, `PayloadScope`, and every `PayloadVersion` value.

> [!IMPORTANT]
> macOS matches privacy permissions to an application's bundle identifier and code-signing requirement. Don't shorten, reformat, or reconstruct the code-requirement strings.

## Validate and upload the profile

1. Save your changes without changing the `.mobileconfig` file extension.
1. Validate the XML structure:

   ```bash
   plutil -lint MS-Defender-Config.mobileconfig
   ```

   The command should return `OK`.

1. Confirm that no template placeholders remain:

   ```bash
   grep -E 'ORGANIZATION_NAME|PROFILE_IDENTIFIER_UUID' MS-Defender-Config.mobileconfig
   ```

   The command shouldn't return any matches.

1. In Iru, create a **Custom Profile** Library Item and upload `MS-Defender-Config.mobileconfig`.
1. Save the Library Item, then assign it to the same Blueprint as the Microsoft Defender application and tenant onboarding profile.

For general custom-profile import requirements, see [Iru Custom Profiles Overview](https://support.kandji.io/kb/custom-profiles-overview).

## Verify the deployed permissions

Deploy the profile to a test Mac before assigning it broadly. After Iru installs the profile and Microsoft Defender, run:

```bash
mdatp health --details system_extensions
mdatp health --field full_disk_access_enabled
```

Confirm that:

- `network_extension_enabled` is `true`.
- `endpoint_security_extension_ready` is `true`.
- `full_disk_access_enabled` is `true`.

You can also run `mdatp health` and confirm that `health_issues` doesn't report a missing event provider, network event provider, or Full Disk Access permission.

If a permission is missing, confirm that Iru assigned and installed the custom profile. Then see [Troubleshoot system extension issues for Microsoft Defender for Endpoint on macOS](mac-support-sys-ext.md) for the expected managed-preference files and further checks.

Once complete, proceed to [mac-iru-blueprint-assignment](./mac-iru-blueprint-assignment.md)
