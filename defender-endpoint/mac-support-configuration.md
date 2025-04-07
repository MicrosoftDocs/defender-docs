---
title: Troubleshoot configuration issues for Microsoft Defender for Endpoint on Mac
description: Troubleshoot configuration issues in Microsoft Defender for Endpoint on Mac.
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
ms.date: 04/30/2024
---

# Troubleshoot configuration issues for Microsoft Defender for Endpoint on macOS

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]


**Applies to:**

- [Microsoft Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

## Configuration isn't applied as expected

You configured Microsoft Defender with settings that you need, and you don't see some (or all) of them applied.
How to troubleshoot it?

### Sources of configuration

Microsoft Defender collects configuration from multiple sources.

In almost all cases you can change configuration dynamically, and it will be applied immediately, with no restart required.

Different sources have different priorities.
When the same setting comes from more than one source, Microsoft Defender will merge values from different sources.
In most cases it means that the value with the higher priority prevails, and sources from lower priorities are ignored. In some cases (for example, [Antivirus Exclusions](mac-preferences.md#exclusion-merge-policy)). Refer to configuration documentation for details.

Configuration sources in the order of priority ("1" is the highest priority):

1) MDE Attach, Defender configured in Intune portal
2) [MDM configuration profile](mac-jamfpro-policies.md), configured using your MDM software
3) [Local configuration](mac-resources.md#supported-output-types), that you made using `mdatp config ...` command as local administrator, or through Microsoft Defender's application
4) Default setting that is used when you provided no explicit setting

### MDE Attach and MDM Configuration profile

> [!CAUTION]
> MDE Attach and MDM Configuration Profile are mutually excluded. If you provide *some* configuration for both, then only MDE Attach settings are used, and *all* MDM settings are ignored! Don't use them together.

Use `mdatp health --field managed_by` to find out if you use MDE Attach.

1) "MDE" indicates MDE Attach. Any configuration specified with an MDM configuration profile is ignored.
2) "MEM" indicates MDM Configuration Profile, or only local configuration

You can run `mdatp health` to get the configuration that Microsoft Defender is currently used. If you see "[managed]" next to a value, then it's currently configured through an MDM Configuration Profile. If there's no "[managed]", then it's configured locally or via MDE Attach.

### MDE Attach and MDM configurations troubleshooting

Check the following files:

1) `/Library/Preferences/com.microsoft.mdeattach.plist` - Microsoft Defender reads this file for settings delivered by MDE Attach. If you expect some setting and you don't see it configured, then check that it's there
2) `/Library/Managed Preferences/com.microsoft.wdav.plist` and `/Library/Managed Preferences/com.microsoft.wdav.ext.plist` - Microsoft Defender reads these files for settings delivered by MDM.

The file paths and names must be exactly like described! If you see a similar but a bit different file path, then it means that Microsoft Defender ignores it.

If you expect some MDM settings and don't see those files, it means that MDM has not delivered configuration profiles to your machine at all. 
To troubleshoot profiles delivery, consult your MDM software (JAMF, Intune, etc.) resources.

If you expect some settings and you see those files, then check their content:

```
> plutil -p '/Library/Managed Preferences/com.microsoft.wdav.plist
{
  "antivirusEngine" => {
    "enforcementLevel" => "real_time"
  }
}
```

Those settings must match those settings that you configured.
Their names, level of indirection, type must be exactly as [documented](mac-preferences.md).

For example, if `plist` tells you that "antivirusEngine" is inside a different group, then you can be confident that Microsoft Defender *ignores* "enforcementLevel" setting altogether:
```
# Bad configuration!
> plutil -p '/Library/Managed Preferences/com.microsoft.wdav.plist
{
  "Forced" => {
    "mcx_preference_settings" => {
      "antivirusEngine" => {
        "enforcementLevel" => "real_time"
      }
    }
  }
}
```

### MDM Configuration - where does it come from?

macOS updates /Library/Managed Preferences/ files based on Profiles deployed over MDM.

If you don't see an expected managed preferences file, or its content is different from what you expect, then open  => System Settings => Profiles.

You can see all profiles deployed over MDM under "Device (Managed)." Find a profile that you configured in MDM for Microsoft Defender configuration.
You can open it and inspect its content. It must match what is in /Library/Managed Preferences/com.microsoft.wdav.plist and what you configured in MDM.

If you don't see any managed profile for com.microsoft.wdav, then MDM didn't deliver it. Consult your MDM software documentation for troubleshooting, there can be multiple reasons why it happened, troubleshooting of MDM is out of scope for Microsoft Defender documentation.

If you see *more than one* configuration profile for the same com.microsoft.wdav, then it can be the reason of not expected configuration of Microsoft Defender.
macOS performs some merging of those profiles into a single .plist, but it can properly merge only the top level of configuration.
I.e., you can't spread different "antivirusEngine" settings across two com.microsoft.wdav configuration profiles, MDM uses only one of them randomly, and ignore the rest. You can use extra com.microsoft.wdav.ext profile if you need to put settings to two profiles (again, there must be at most one configuration profile with com.microsoft.wdav.ext as well).

In other words, avoid having more than one configuration profile for the same identifier.

### MDE Attach Configuration - where does it come from?

It isn't delivered over MDM. Consult MDE Attach documentation for how to troubleshoot it.
