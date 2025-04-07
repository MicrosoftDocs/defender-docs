---
title: Deployment with a different Mobile Device Management (MDM) system for Microsoft Defender for Endpoint on Mac
description: Install Microsoft Defender for Endpoint on Mac on other management solutions.
ms.service: defender-endpoint
ms.reviewer: joshbregman
author: emmwalshh
ms.author: ewalsh
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
ms.date: 04/30/2024
---

# Deployment with a different Mobile Device Management (MDM) system for Microsoft Defender for Endpoint on macOS

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)
 
## Prerequisites and system requirements

Before you get started, see [the main Microsoft Defender for Endpoint on macOS page](microsoft-defender-endpoint-mac.md) for a description of prerequisites and system requirements for the current software version.


## Approach

> [!CAUTION]
> Currently, Microsoft officially supports only Intune and JAMF for the deployment and management of Microsoft Defender for Endpoint on macOS. Microsoft makes no warranties, express or implied, with respect to the information provided.

If your organization uses a Mobile Device Management (MDM) solution that isn't officially supported, this doesn't mean you're unable to deploy or run Microsoft Defender for Endpoint on macOS.

Microsoft Defender for Endpoint on macOS doesn't depend on any vendor-specific features. It can be used with any MDM solution that supports the following features:

- Deploy a macOS .pkg to managed devices.
- Deploy macOS system configuration profiles to managed devices.
- Run an arbitrary admin-configured tool/script on managed devices.

Most modern MDM solutions include these features, however, they might call them differently.

You can deploy Defender for Endpoint without the last requirement from the preceding list, however:

- You might not be able to collect status in a centralized way.
- If you decide to uninstall Defender for Endpoint, you need to sign in the client device locally as an administrator.

## Deployment

Most MDM solutions use the same model for managing macOS devices, with similar terminology. Use [JAMF-based deployment](mac-install-with-jamf.md) as a template.

### Package

Configure deployment of a [required application package](mac-install-with-jamf.md), 
with the installation package (wdav.pkg) downloaded from [Microsoft Defender portal](mac-install-with-jamf.md).


[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]


In order to deploy the package to your enterprise, use the instructions associated with your MDM solution.

### License settings

Set up [a system configuration profile](mac-install-with-jamf.md). 

Your MDM solution might call it something like "Custom Settings Profile," as Microsoft Defender for Endpoint on macOS isn't part of macOS.

Use the property list, jamf/WindowsDefenderATPOnboarding.plist, which can be extracted from an onboarding package downloaded from [Microsoft Defender portal](mac-install-with-jamf.md).
Your system might support an arbitrary property list in XML format. You can upload the jamf/WindowsDefenderATPOnboarding.plist file as-is in that case.
Alternatively, it might require you to convert the property list to a different format first.

Typically, your custom profile has an ID, name, or domain attribute. You must use exactly "com.microsoft.wdav.atp" for this value.
MDM uses it to deploy the settings file to **/Library/Managed Preferences/com.microsoft.wdav.atp.plist** on a client device, and Defender for Endpoint uses this file for loading the onboarding information.

### System configuration profiles

macOS requires that a user manually and explicitly approves certain functions that an application uses, for example system extensions, running in background, sending notifications, full disk access, etc. Microsoft Defender for Endpoint relies on these functions, and can't properly function until all these consents are received from a user.

To grant consent automatically on a user's behalf, an administrator pushes system policies through their MDM system. This is what we strongly recommend doing, instead of relying on manual approvals from end users.

We supply all policies that Microsoft Defender for Endpoint requires as mobileconfig files available at [https://github.com/microsoft/mdatp-xplat](https://github.com/microsoft/mdatp-xplat/tree/master/macos/mobileconfig/profiles). Mobileconfig is an Apple's import/export format that [Apple Configurator](https://support.apple.com/apple-configurator) or other products like [iMazing Profile Editor](https://imazing.com/profile-editor) support.

Most MDM vendors support importing a mobileconfig file that creates a new custom configuration profile.

To set up profiles:

1) Find out how a mobileconfig import is done with your MDM vendor.
2) For all profiles from [https://github.com/microsoft/mdatp-xplat](https://github.com/microsoft/mdatp-xplat/tree/master/macos/mobileconfig/profiles), download a mobileconfig file and import it.
3) Assign proper scope for each created configuration profile.

Apple regularly creates new types of payloads with new versions of an OS.
You need to visit the above mentioned page, and publish new profiles once they became available.
We post notifications to our [What's New page](mac-whatsnew.md) once we make changes like that.

### Defender for Endpoint configuration settings

To deploy Microsoft Defender for Endpoint configuration, you need a configuration profile.

The following steps show how to apply and verify applying a configuration profile.

**1. MDM deploys configuration profile to enrolled machines**
You can view profiles in System Settings > Profiles. Look for the name that you used for Microsoft Defender for Endpoint configuration settings profile.
If you don't see it, then refer to your MDM documentation for troubleshooting tips. 

**2. The configuration profile shows up in the correct file**

Microsoft Defender for Endpoint reads `/Library/Managed Preferences/com.microsoft.wdav.plist` and `/Library/Managed Preferences/com.microsoft.wdav.ext.plist` files.
It uses only those two files for managed settings.

If you can't see those files, but you verified that the profiles were delivered (see the previous section), then it means that your profiles are misconfigured. Either you made this configuration profile "User Level" instead of "Computer Level," or you used a different Preference Domain instead of those that Microsoft Defender for Endpoint expects ("com.microsoft.wdav" and "com.microsoft.wdav.ext").

Refer to your MDM documentation for how to set up application configuration profiles.

#### 3. The configuration profile contains the expected structure

This step can be tricky to verify. Microsoft Defender for Endpoint expects com.microsoft.wdav.plist with a strict structure.
If you put settings to unexpected place, or misspell them, or use an invalid type, the settings are silently ignored.

1) You can check `mdatp health` and confirm that the settings you configured are reported as `[managed]`.
2) You can inspect the content of `/Library/Managed Preferences/com.microsoft.wdav.plist` and make sure that it matches the expected settings:

```shell
plutil -p "/Library/Managed\ Preferences/com.microsoft.wdav.plist"

{
  "antivirusEngine" => {
    "scanHistoryMaximumItems" => 10000
  }
  "edr" => {
    "groupIds" => "my_favorite_group"
    "tags" => [
      0 => {
        "key" => "GROUP"
        "value" => "my_favorite_tag"
      }
    ]
  }
  "tamperProtection" => {
    "enforcementLevel" => "audit"
    "exclusions" => [
      0 => {
        "args" => [
          0 => "/usr/local/bin/test.sh"
        ]
        "path" => "/bin/zsh"
        "signingId" => "com.apple.zsh"
        "teamId" => ""
      }
    ]
  }
}
```

You can use the documented [Configuration profile structure](mac-preferences.md) as a guideline.

This article explains that "antivirusEngine," "edr," "tamperProtection" are settings at the top level of the configuration file. And, for example, "scanHistoryMaximumItems" are at the second level and are of integer type.

You should see this information in the output of the previous command. If "antivirusEngine" is nested under some other setting - then the profile is misconfigured. If you can see "antivirus engine" instead of "antivirusEngine," the name is misspelled and the whole subtree of settings are ignored. If `"scanHistoryMaximumItems" => "10000"`, the wrong type is used to and the setting is ignored.

## Check that all profiles are deployed

You can download and run [analyze_profiles.py](https://github.com/microsoft/mdatp-xplat/tree/master/macos/mdm). This script collects and analyzes all profiles deployed to a machine and warn you about missed ones.
It can miss some errors, and it isn't aware of some design decisions that system administrators are making deliberately. Use this script for guidance, but always investigate if you see something marked as an error. For example, the onboarding guide tells you to deploy a configuration profile for onboarding blob. Yet, some organizations decide to run the manual onboarding script instead. analyze_profile.py warns you about the missed profile. You can either decide to onboard via configuration profile, or disregard the warning altogether.

## Check installation status

Run [Microsoft Defender for Endpoint](mac-install-with-jamf.md) on a client device to check the onboarding status.
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
