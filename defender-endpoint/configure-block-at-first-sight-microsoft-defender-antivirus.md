---
title: Enable block at first sight to detect malware in seconds
description: Turn on the block at first sight feature to detect and block malware within seconds.
ms.service: defender-endpoint
ms.localizationpriority: high
author: chrisda
ms.author: chrisda
ms.reviewer: marcmcc
ms.custom:
  - msecd-doc-authoring-1016
  - nextgen
  - sfi-image-nochange
ms.date: 07/02/2026
ms.subservice: ngp
ms.topic: how-to
ms.collection: 
- m365-security
- tier2
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
---
# Turn on block at first sight


This article describes an antivirus/antimalware feature known as "block at first sight", and describes how to enable block at first sight for your organization. Before you begin, review the [Prerequisites](#prerequisites) section for required settings and supported operating systems.

> [!TIP]
> This article is intended for enterprise admins and IT Pros who manage security settings for organizations. If you aren't an enterprise admin or IT Pro but you have questions about block at first sight, see the [Not an enterprise admin or IT Pro?](#not-an-enterprise-admin-or-it-pro) section.


## Prerequisites

### Supported operating systems

Block at first sight is supported on the following operating systems:

- Windows


## What is "block at first sight"?

Block at first sight is a threat protection feature of next-generation protection. It detects new malware and blocks it within seconds. The feature is enabled when you turn on these settings:

- [Cloud protection](cloud-protection-microsoft-defender-antivirus.md) (also called *cloud-delivered protection* in Windows Security) is turned on.
- [Sample submission](cloud-protection-microsoft-antivirus-sample-submission.md) is set to send samples automatically.
- [Microsoft Defender Antivirus is up to date](microsoft-defender-antivirus-updates.md) on devices.

In most enterprise organizations, these settings are already configured with Microsoft Defender Antivirus deployments. For more information, see [Turn on cloud protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md).

## How it works

When Microsoft Defender Antivirus finds a suspicious file it hasn't seen before, it sends a query to the cloud protection backend. The cloud backend checks the file using heuristics, machine learning, and automated analysis. It then decides if the file is malicious or safe.

Microsoft Defender Antivirus uses multiple detection and prevention methods to deliver accurate, real-time protection.

:::image type="content" source="media/microsoft-defender-atp-next-generation-protection-engines.png" alt-text="The list of Microsoft Defender Antivirus engines" lightbox="media/microsoft-defender-atp-next-generation-protection-engines.png":::

> [!TIP]
> To learn more, see [(Blog) Get to know the advanced technologies at the core of Microsoft Defender for Endpoint next-generation protection](https://www.microsoft.com/security/blog/2019/06/24/inside-out-get-to-know-the-advanced-technologies-at-the-core-of-microsoft-defender-atp-next-generation-protection/).

## A few things to know about block at first sight

Keep the following details in mind when using block at first sight:

- Block at first sight can block nonportable executable files (such as JS, VBS, or macros) and executable files, running the [latest Defender antimalware platform](microsoft-defender-antivirus-updates.md) on Windows or Windows Server.

- Block at first sight only uses the cloud protection backend for executable files and nonportable executable files that are downloaded from the Internet, or that originate from the Internet zone. A hash value of the `.exe` file is checked via the cloud backend to determine if the file is a previously undetected file.

- If the cloud backend is unable to make a determination, Microsoft Defender Antivirus locks the file and uploads a copy to the cloud. The cloud performs more analysis to reach a determination. The cloud then either allows the file to run or blocks the file in all future encounters, depending on whether the cloud determines the file to be malicious or not a threat.

- In many cases, this cloud-based analysis and blocking process can reduce the response time for new malware from hours to seconds.

- You can [specify how long a file should be prevented from running](configure-cloud-block-timeout-period-microsoft-defender-antivirus.md) while the cloud-based protection service analyzes the file. And, you can [customize the message displayed on users' desktops](/windows/security/operating-system-security/system-security/windows-defender-security-center/wdsc-customize-contact-information) when a file is blocked. You can change the company name, contact information, and message URL.

## Turn on block at first sight with Microsoft Intune

To enable block at first sight using a Microsoft Intune Endpoint Security **Antivirus** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus
- **Configuration settings**: Configure the following settings:
  - **Allow cloud protection**: Select **Allowed. Turns on Cloud Protection (Default)**.
  - **Submit samples consent**: Select one of the following values:
    - **Send safe samples automatically. (Default)**
    - **Send all samples automatically**

For more information about antivirus profiles in Microsoft Intune, see [Antivirus policy for endpoint security in Microsoft Intune](/intune/device-configuration/endpoint-security/antivirus).

## Turn on block at first sight with Group Policy

> [!NOTE]
> We recommend using Intune or Microsoft Configuration Manager to turn on block at first sight.

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MAPS**.

1. In the details pane of **MAPS**, configure the following settings. To open and configure a setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MAPS**.

   **Configure the 'Block at First Sight' feature**:

   1. In the details pane of **MAPS**, open the **Configure the 'Block at First Sight' feature** setting.
   1. In the setting window that opens, select **Enabled**, and then select **OK**.

   **Send file samples when further analysis is required**:

   1. In the details pane of **MAPS**, open the **Send file samples when further analysis is required** setting.
   1. In the setting window that opens, configure the following options:
      1. Select **Enabled**.
      1. **Send file samples when further analysis is required**: Select one of the following values:
         - **Send safe samples** (0x1)
         - **Send all samples** (0x3)

         > [!IMPORTANT]
         > Setting to **Always prompt** (0x0) lowers the protection state of the device. **Never send** (0x2) means block at first sight doesn't function.

      1. Select **OK**.

## Confirm block at first sight is enabled on individual client devices

You can confirm that block at first sight is enabled on individual client devices using the Windows Security app. Block at first sight is automatically enabled as long as **Cloud-delivered protection** and **Automatic sample submission** are both turned on.

1. Open the Windows Security app.

1. Select **Virus & threat protection**, and then, under **Virus & threat protection settings**, select **Manage Settings**.

   :::image type="content" source="/defender/media/wdav-protection-settings-wdsc.png" alt-text="The Virus & threat protection settings label in the Windows Security app" lightbox="/defender/media/wdav-protection-settings-wdsc.png":::

1. Confirm that **Cloud-delivered protection** and **Automatic sample submission** are both turned on.

> [!NOTE]
>
> - If Group Policy manages these settings, they appear greyed-out on individual endpoints and can't be changed locally.
> - Group Policy changes must reach each endpoint before the **Cloud-delivered protection** and **Automatic sample submission** settings update in Windows Settings.

## Turn off block at first sight

> [!CAUTION]
> Turning off block at first sight lowers the protection state of your devices and your network. We don't recommend disabling block at first sight protection permanently.

### Turn off block at first sight with Microsoft Intune

> [!CAUTION]
> Disabling block at first sight lowers the protection state of your devices and your network.

To disable block at first sight with Microsoft Intune, see <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (opens in a new tab in the Intune documentation). Choose the following options:

- **Policy**: **Antivirus**, then select your Microsoft Defender Antivirus policy
- **Allow cloud protection**: Not allowed. Turns off Cloud Protection

### Turn off block at first sight with Group Policy

> [!CAUTION]
> Disabling block at first sight lowers the protection state of your devices and your network.

> [!NOTE]
> Disabling block at first sight doesn't disable or alter the prerequisite group policies.

Use the following steps to turn off block at first sight with Group Policy:

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MAPS**.

1. In the details pane of **MAPS**, open the **Configure the 'Block at First Sight' feature** setting.

1. In the setting window that opens, select **Disabled**, and then select **OK**.

## Not an enterprise admin or IT Pro?

If you aren't an enterprise admin or an IT Pro, but you have questions about block at first sight, the following guidance for personal device users can help. Block at first sight is a threat protection feature that detects and blocks malware within seconds. Although there isn't a specific setting called "Block at first sight," the feature is enabled when certain settings are configured on your device.

### How to manage block at first sight on or off on your own device

If you have a personal device that isn't managed by an organization, you might be wondering how to turn block at first sight on or off. You can use the Windows Security app to manage block at first sight.

1. On your Windows 10 or Windows 11 computer, open the Windows Security app.

1. Select **Virus & threat protection**.

1. Under **Virus & threat protection settings**, select **Manage settings**.

1. Take one of the following steps:
   - To enable block at first sight, make sure that both **Cloud-delivered protection** and **Automatic sample submission** are both turned on.

   - To disable block at first sight:

     > [!CAUTION]
     > Turning off block at first sight lowers the level of protection for your device. We don't recommend permanently disabling block at first sight.

     Turn off **Cloud-delivered protection** or **Automatic sample submission**.

## See also

For more information about Microsoft Defender Antivirus and related features, see the following resources:

- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Enable cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md)
- [Stay protected with Windows Security](https://support.microsoft.com/windows/stay-protected-with-windows-security-2ae0363d-0ada-c064-8b56-6a39afb6a963)
- [Onboard to Microsoft Defender for Endpoint](onboarding.md)



