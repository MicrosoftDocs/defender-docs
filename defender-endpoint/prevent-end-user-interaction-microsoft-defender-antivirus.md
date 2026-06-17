---
title: Hide the Microsoft Defender Antivirus interface
description: You can hide virus and threat protection tile in the Windows Security app.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: paulinbar
ms.author: painbar
ms.custom: nextgen
ms.date: 10/20/2025
ms.reviewer: pahuijbr
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

---

# Prevent users from seeing or interacting with the Microsoft Defender Antivirus user interface


You can use Group Policy to prevent users on endpoints from seeing the Microsoft Defender Antivirus interface. You can also prevent them from pausing scans.

## Prerequisites

### Supported operating systems

- Windows

## Hide the Microsoft Defender Antivirus interface

In Windows 10, versions 1703, hiding the interface hides Microsoft Defender Antivirus notifications and prevent the Virus & threat protection tile from appearing in the Windows Security app.

With the setting set to **Enabled**:

:::image type="content" source="/defender/media/wdav-headless-mode-off-1703.png" alt-text="The Windows Security without the shield icon and virus and threat protection sections" lightbox="/defender/media/wdav-headless-mode-off-1703.png":::

With the setting set to **Disabled** or not configured:

:::image type="content" source="/defender/media/wdav-headless-mode-1703.png" alt-text="The Windows Security with shield icon and threat protection sections" lightbox="/defender/media/wdav-headless-mode-1703.png":::

> [!NOTE]
> Hiding the interface will also prevent Microsoft Defender Antivirus notifications from appearing on the endpoint. Microsoft Defender for Endpoint notifications will still appear. You can also individually [configure the notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md)

In earlier versions of Windows 10, the setting hides the Windows Defender client interface. If the user attempts to open it, they'll receive a warning that says, "Your system administrator has restricted access to this app."

:::image type="content" source="/defender/media/wdav-headless-mode-1607.png" alt-text="The warning message when headless mode is enabled in Windows 10, versions earlier than 1703" lightbox="/defender/media/wdav-headless-mode-1607.png":::

## Use Group Policy to hide the Microsoft Defender Antivirus interface from users

1. On your Group Policy management machine, open the [Group Policy Management Console](/previous-versions/windows/desktop/gpmc/group-policy-management-console-portal), right-click the Group Policy Object you want to configure and select **Edit**.

1. Using the **Group Policy Management Editor** go to **Computer configuration**.

1. Select **Administrative templates**.

1. Expand the tree to **Windows components > Microsoft Defender Antivirus > Client interface**.

1. Double-click the **Enable headless UI mode** setting and set the option to **Enabled**. Select **OK**.

See [Prevent users from locally modifying policy settings](configure-local-policy-overrides-microsoft-defender-antivirus.md) for more options on preventing users from modifying protection on their PCs.

## Prevent users from pausing a scan

You can prevent users from pausing scans, which can be helpful to ensure scheduled or on-demand scans aren't interrupted by users.

> [!NOTE]
> This setting is not supported on Windows 10.

### Use Group Policy to prevent users from pausing a scan

1. On your Group Policy management machine, open the [Group Policy Management Console](/previous-versions/windows/desktop/gpmc/group-policy-management-console-portal), right-click the Group Policy Object you want to configure and select **Edit**.

1. Using the **Group Policy Management Editor** go to **Computer configuration**.

1. Select **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Scan**.

1. Double-click the **Allow users to pause scan** setting and set the option to **Disabled**. Select **OK**.

## UI Lockdown mode

Indicates whether to disable UI Lockdown mode. If you specify a value of `$True`, Microsoft Defender Antivirus disables UI Lockdown mode. If you specify a value of `$False` or don't specify a value, UI Lockdown mode is enabled.

```
PS C:\>Set-MpPreference -UILockdown $true
```

## Related articles

- [Configure the notifications that appear on endpoints](configure-notifications-microsoft-defender-antivirus.md)
- [Configure end-user interaction with Microsoft Defender Antivirus](configure-local-policy-overrides-microsoft-defender-antivirus.md)
- [Microsoft Defender Antivirus in Windows 10](microsoft-defender-antivirus-windows.md)

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)


