---
title: Configure the Microsoft Defender Antivirus cloud block time-out period
description: You can configure how long Microsoft Defender Antivirus blocks a file from running while waiting for a cloud determination.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.custom: nextgen, msecd-doc-authoring-1016
ms.reviewer: yongrhee
ms.subservice: ngp
ms.topic: how-to
ms.date: 07/02/2026
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

ai-usage: ai-assisted
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

1. On your Group Policy management computer, open the [Group Policy Management Console](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731212(v=ws.11))

1. Right-click the Group Policy Object you want to configure and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration**, and then select **Administrative templates**.

1. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **MpEngine**.

1. Double-click **Configure extended cloud check** and ensure the option is enabled. 

   Specify the extra amount of time to prevent the file from running while waiting for a cloud determination. Specify the extra time, in seconds, from 1 second to 50 seconds. Whatever you specify is added to the default 10 seconds.

1. Select **OK**.

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
> - [Set preferences for Microsoft Defender for Endpoint on macOS](mac-preferences.md)
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [macOS Antivirus policy settings for Microsoft Defender Antivirus for Intune](/intune/intune-service/protect/antivirus-microsoft-defender-settings-macos)
> - [Set preferences for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md) 
