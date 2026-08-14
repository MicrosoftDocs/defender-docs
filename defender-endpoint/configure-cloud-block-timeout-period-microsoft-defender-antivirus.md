---
title: Configure the Microsoft Defender Antivirus cloud block time-out period
description: You can configure how long Microsoft Defender Antivirus blocks a file from running while waiting for a cloud determination.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1015
ms.reviewer: yongrhee
ms.subservice: ngp
ms.topic: how-to
ms.date: 08/12/2026
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
#customer intent: As a security administrator, I want to configure the cloud block time-out period so that Microsoft Defender Antivirus has more time to receive a cloud determination before a file runs.
---

# Configure the cloud block time out period

When Microsoft Defender Antivirus finds a suspicious file, it can prevent the file from running while it queries the [Microsoft Defender Antivirus cloud service](cloud-protection-microsoft-defender-antivirus.md).

The default period that the file is [blocked by Block at first sight](configure-block-at-first-sight-microsoft-defender-antivirus.md) is 10 seconds. If you're a security administrator, you can specify more time to wait before the file is allowed to run. Extending the cloud block time out period can help ensure there's enough time to receive a proper determination from the Microsoft Defender Antivirus cloud service. Before you begin, review the [prerequisites](#prerequisites) for this feature.

## Prerequisites

[Block at first sight](configure-block-at-first-sight-microsoft-defender-antivirus.md) and its prerequisites must be enabled before you can specify an extended time out period.

### Supported operating systems

The following operating systems support this feature:

- Windows
- Windows Server

## Specify the extended time out period using Microsoft Defender for Endpoint Security settings management

To specify the cloud block time out period with Microsoft Defender for Endpoint Security settings management:

1. Go to the [Microsoft Defender for Endpoint portal](https://security.microsoft.com) and sign in.
1. Select **Endpoints** > **Configuration management** > **Endpoint security policies**.
1. Select **Create new Policy**.
1. Under **Select Platform** choose: "Windows 10, Windows 11, and Windows Server".
1. Under **Select Template** choose: "Microsoft Defender Antivirus".
1. Select **Create policy**.
1. Enter a name and description and select **Next**.
1. From the Defender dropdown, go to **Cloud Extended Timeout** and toggle it on.
1. Specify the extended time, in seconds, from 1 second to 50 seconds. Whatever you specify is added to the default 10 seconds.
1. Select **Next** and **Save** to finish configuring your policy.

## Specify the extended time out period using Microsoft Intune

To specify the cloud block time out period with an [endpoint security policy in Microsoft Intune](/intune/intune-service/protect/endpoint-security-policy), see <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation). When modifying the endpoint security policy, use these settings:

- **Configuration settings**: Scroll down to **Cloud Extended Timeout** and specify the time out, in seconds, from 0 to 50 seconds. Whatever you specify is added to the default 10 seconds.
- (Optional) Make any other changes to your antivirus policy. (Need help? See [Settings for Microsoft Defender Antivirus policy in Microsoft Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-windows).)

## Specify the extended time out period using Group Policy

You can use Group Policy to specify an extended time out for cloud checks.

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MpEngine**.

   > [!NOTE]
   > Group Policy paths before Windows 10, version 2004 (May 2020) might use _Windows_ Defender Antivirus instead of _Microsoft_ Defender Antivirus. Both names refer to the same policy location.

1. In the details pane of **MpEngine**, open the **Configure extended cloud check** setting. To open the setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Specify the extended cloud check time in sections** in the **Options** section: Specify the _extra_ amount of time in seconds to prevent the file from running while waiting for a cloud determination. Valid values are from `1` to `50`. The value you specify is added to the default delay of 10 seconds.

   When you're finished, select **OK**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MpEngine**.

## See also

If you're looking for Antivirus related information for other platforms, see:

- [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
- [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
- [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
- [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure Defender for Endpoint on Android features](android-configure.md)
- [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)
