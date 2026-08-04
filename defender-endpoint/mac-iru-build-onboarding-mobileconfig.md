---
title: Configure the tenant onboarding profile for Microsoft Defender for Endpoint
description: Prepare a tenant-specific mobileconfig profile to onboard Microsoft Defender for Endpoint on macOS devices managed with Iru.
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
ai-usage: ai-assisted
---

# Configure the tenant onboarding profile for Microsoft Defender for Endpoint

Prepare a tenant-specific `.mobileconfig` profile before you deploy Microsoft Defender for Endpoint on macOS with Iru. The profile registers each targeted device with your Microsoft Defender for Endpoint tenant.

The onboarding profile is tenant-specific. Don't deploy a profile that contains onboarding information from a different tenant.

[!INCLUDE [Microsoft Defender for Endpoint third-party tool support](../includes/support.md)]

## Prerequisites

Before you begin, make sure that you have:

- Permission to download an onboarding package from the Microsoft Defender portal. For required roles, see [Set up the Microsoft Defender for Endpoint on macOS policies in Jamf Pro](mac-jamfpro-policies.md#step-1-get-the-microsoft-defender-for-endpoint-onboarding-package).
- A text editor that preserves plain-text XML.
- The [Microsoft Defender for Endpoint tenant onboarding template](https://github.com/paul-ej/iru-tools/blob/main/microsoft-defender/defender-onboarding/MS-Defender-Tenant-Onboarding.mobileconfig).

## Download your tenant onboarding information

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Onboarding**.
1. Select **macOS** as the operating system.
1. Select **Mobile Device Management / Microsoft Intune** as the deployment method.
1. Select **Download onboarding package**.
1. Extract `WindowsDefenderATPOnboardingPackage.zip`.
1. In the extracted package, locate `jamf/WindowsDefenderATPOnboarding.plist`.

> [!IMPORTANT]
> The value of `OnboardingInfo` is a Microsoft-signed tenant onboarding blob. Copy the complete value without decoding, reformatting, or changing it. Changing the JSON body, signature, or certificate data invalidates the onboarding information.

## Create unique profile identifiers

Apple requires each `PayloadUUID` value to be globally unique. Generate two UUIDs: one for the top-level configuration profile and one for the nested Defender for Endpoint onboarding payload.

Run `uuidgen` twice in Terminal and record which value you use for each purpose:

```bash
uuidgen
uuidgen
```

Use the first value as the **profile UUID** and the second value as the **onboarding payload UUID**. Generate these values once when you create the profile. Keep the same identifiers when you later update the deployed profile so that macOS can replace the existing profile instead of installing a second profile.

For more information, see [Apple's common payload keys](https://developer.apple.com/documentation/devicemanagement/commonpayloadkeys).

## Update the onboarding profile

1. Download `MS-Defender-Tenant-Onboarding.mobileconfig` from the template repository.
1. Open the downloaded template and `WindowsDefenderATPOnboarding.plist` in a text editor.
1. Update the fields in the following table.

   | Location | Field in the template | Required value |
   |---|---|---|
   | Nested onboarding payload, inside `PayloadContent` | `OnboardingInfo` | Replace `REPLACE_WITH_TENANT_ONBOARDING_INFO` with the complete string value of `OnboardingInfo` from `WindowsDefenderATPOnboarding.plist`. Copy only the value inside the source `<string>` element, without the `<string>` tags. Preserve any XML character entities, such as `&amp;`, exactly as provided. |
   | Nested onboarding payload | `PayloadOrganization` | Replace `ORGANIZATION_NAME` with your organization's display name. |
   | Nested onboarding payload | `PayloadIdentifier` | Replace the existing UUID suffix in `com.microsoft.wdav.atp.A498074E-3293-44BD-B0AA-6680CFF53BF2` with the onboarding payload UUID. Keep the `com.microsoft.wdav.atp.` prefix. |
   | Nested onboarding payload | `PayloadUUID` | Replace `A498074E-3293-44BD-B0AA-6680CFF53BF2` with the onboarding payload UUID. Use the same UUID as the suffix in the nested `PayloadIdentifier`. |
   | Top-level configuration profile | `PayloadIdentifier` | Replace `PROFILE_IDENTIFIER_UUID` in `com.kandji.profile.custom.PROFILE_IDENTIFIER_UUID` with the profile UUID. If your organization uses its own reverse-DNS identifier scheme, you can replace the complete value with a unique identifier in that scheme. |
   | Top-level configuration profile | `PayloadOrganization` | Replace `ORGANIZATION_NAME` with your organization's display name. |
   | Top-level configuration profile | `PayloadUUID` | Replace `5b71fa8d-985d-5c8a-ab7f-14718f3d3643` with the profile UUID. |

1. Optionally, change the values of `PayloadDisplayName` and `PayloadDescription` to match your organization's naming convention.
1. Save the file with the `.mobileconfig` extension.

> [!CAUTION]
> Treat the completed profile as tenant-sensitive configuration data. Store it in an access-controlled location, and don't commit it to a public source-code repository.

## Fields to leave unchanged

Leave the following values unchanged unless Microsoft or Iru support directs you to change them:

| Field | Required value | Reason |
|---|---|---|
| Nested `PayloadType` | `com.microsoft.wdav.atp` | Defender for Endpoint uses this preference domain to find the tenant onboarding information. A different value prevents onboarding. |
| Top-level `PayloadType` | `Configuration` | Identifies the file as an Apple configuration profile. |
| `PayloadEnabled` | `true` | Enables the profile and its onboarding payload. |
| `PayloadScope` | `System` | Deploys the profile through the device channel. |
| `PayloadVersion` | `1` | Apple requires this schema version for each payload. It isn't a profile revision counter. |
| `PayloadRemovalDisallowed` | `true` | Prevents a local user from removing the managed onboarding profile. |

## Validate the profile

Before you upload the profile to Iru, validate its XML structure:

```bash
plutil -lint MS-Defender-Tenant-Onboarding.mobileconfig
```

The command should return `OK`. Then confirm that no template placeholders remain:

```bash
grep -E 'REPLACE_WITH_TENANT_ONBOARDING_INFO|ORGANIZATION_NAME|PROFILE_IDENTIFIER_UUID' MS-Defender-Tenant-Onboarding.mobileconfig
```

The command shouldn't return any matches. Avoid commands that print the complete profile to shared logs because they can expose the onboarding blob.

Upload the completed file to Iru as a custom profile, and assign it to the same Blueprint as the Microsoft Defender application. For general custom-profile import requirements, see [Iru Custom Profiles Overview](https://support.kandji.io/kb/custom-profiles-overview).

After the profile and Microsoft Defender are installed on a test Mac, run the following command:

```bash
mdatp health --field org_id
```

A successful onboarding returns the identifier for your Microsoft Defender for Endpoint organization. If the value is blank or `unavailable`, confirm that the profile is assigned to the device and that the nested `PayloadType` is exactly `com.microsoft.wdav.atp`. For more troubleshooting guidance, see [Deployment with a different Mobile Device Management system](mac-install-with-other-mdm.md#check-that-all-profiles-are-deployed).

Once complete, proceed to [Configure the Microsoft Defender permissions profile for Iru](./mac-iru-build-config-mobile-config.md).
