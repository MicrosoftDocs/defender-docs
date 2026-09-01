---
title: Configure block at first sight in Microsoft Defender Antivirus
description: Configure block at first sight in Microsoft Defender Antivirus by using supported management tools, including Microsoft Configuration Manager.
ms.service: defender-endpoint
ms.localizationpriority: high
author: chrisda
ms.author: chrisda
ms.reviewer: marcmcc
ms.custom:
  - msecd-doc-authoring-1015
  - nextgen
  - sfi-image-nochange
ms.date: 08/31/2026
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
#customer intent: As a security administrator, I want to configure block at first sight so that Microsoft Defender Antivirus can block new malware within seconds.
---

# Configure block at first sight in Microsoft Defender Antivirus

<a name="what-is-block-at-first-sight"></a>

Block at first sight is a threat protection feature of [next-generation protection](next-generation-protection.md). It detects new malware and blocks it within seconds. The feature is enabled when all of the following statements are true:

- [Cloud protection](cloud-protection-microsoft-defender-antivirus.md) (also called _cloud-delivered protection_ in Windows Security) is turned on.
- [Sample submission](cloud-protection-microsoft-antivirus-sample-submission.md) is set to send samples automatically.
- Microsoft Defender Antivirus [is up to date](microsoft-defender-antivirus-updates.md) on devices.

In most enterprise organizations, these settings are already configured with Microsoft Defender Antivirus deployments. For more information, see [Turn on cloud protection in Microsoft Defender Antivirus](enable-cloud-protection-microsoft-defender-antivirus.md).

When Microsoft Defender Antivirus finds a suspicious file it hasn't seen before, it sends a query to the cloud protection backend. The cloud backend checks the file using heuristics, machine learning, and automated analysis. It then decides if the file is malicious or safe. Microsoft Defender Antivirus uses multiple detection and prevention methods to deliver accurate, real-time protection.

:::image type="content" source="media/microsoft-defender-atp-next-generation-protection-engines.png" alt-text="Diagram of Microsoft Defender Antivirus protection engines." lightbox="media/microsoft-defender-atp-next-generation-protection-engines.png":::

Keep the following details in mind when using block at first sight:

- Block at first sight can block executable files and nonportable executable files (such as JS, VBS, or macros) on Windows or Windows Server devices that run the [latest Defender antimalware platform](microsoft-defender-antivirus-updates.md).
- Block at first sight only uses the cloud protection backend for executable files and nonportable executable files that are downloaded from the Internet, or that originate from the Internet zone. A hash value of the `.exe` file is checked via the cloud backend to determine if the file is a previously undetected file.
- If the cloud backend is unable to make a determination, Microsoft Defender Antivirus locks the file and uploads a copy to the cloud. The cloud performs more analysis to reach a determination. The cloud then either allows the file to run or blocks the file in all future encounters, depending on whether the cloud determines the file to be malicious or not a threat.
- In many cases, this cloud-based analysis and blocking process can reduce the response time for new malware from hours to seconds.
- You can [specify how long a file should be prevented from running](configure-cloud-block-timeout-period-microsoft-defender-antivirus.md) while the cloud-based protection service analyzes the file. You can also [customize the message displayed on users' desktops](/windows/security/operating-system-security/system-security/windows-defender-security-center/wdsc-customize-contact-information) when a file is blocked. You can change the company name, contact information, and message URL.

> [!TIP]
> To learn more, see [(Blog) Get to know the advanced technologies at the core of Microsoft Defender for Endpoint next-generation protection](https://www.microsoft.com/security/blog/2019/06/24/inside-out-get-to-know-the-advanced-technologies-at-the-core-of-microsoft-defender-atp-next-generation-protection/).
>
> This article is intended for enterprise administrators and IT professionals who manage security settings for organizations. If you don't manage security settings for an organization, see [Configure block at first sight in the Windows Security app](#configure-block-at-first-sight-in-the-windows-security-app).

> [!CAUTION]
> Turning off block at first sight lowers the protection state of your devices and your network. We don't recommend disabling block at first sight permanently.

## Prerequisites

### Supported operating systems

Block at first sight is supported on the following operating systems:

- Windows

## Configure block at first sight using Microsoft Intune

[!INCLUDE [intune-recommended-separate-product](includes/intune-recommended-separate-product.md)]

To configure block at first sight in Microsoft Intune, use an endpoint security **Antivirus** policy. For detailed instructions, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create endpoint security policies</a> or <a href="/intune/device-configuration/endpoint-security/manage-policies#modify-existing-policies" target="_blank">Modify existing policies</a> (links open new tabs in the Intune documentation).

When you create the policy, use these specific settings:

- **Policy type**: Select **Manage** \> **Antivirus** on the **Endpoint security \| Overview** page.
- **Platform**: Select **Windows**.
- **Profile**: Select **Microsoft Defender Antivirus**.

### Turn on block at first sight with Microsoft Intune

When you create or modify the policy, use these specific settings on the **Configuration settings** tab:

- **Allow cloud protection**: Select **Allowed. Turns on Cloud Protection (Default)**.
- **Submit samples consent**: Select one of the following values:
  - **Send safe samples automatically. (Default)**
  - **Send all samples automatically**

For more information about the available settings, see [Antivirus policy for endpoint security in Intune](/intune/device-configuration/endpoint-security/antivirus).

### Turn off block at first sight with Microsoft Intune

To turn off block at first sight, set **Allow cloud protection** to **Not allowed. Turns off Cloud Protection**.

## Configure block at first sight in the Microsoft Defender portal

If your organization [manages endpoint security policies in the Microsoft Defender portal](endpoint-security-policies-configure.md), use a Microsoft Defender Antivirus policy to configure block at first sight.

For detailed instructions, see <a href="endpoint-security-policies-configure.md#create-an-endpoint-security-policy" target="_blank">Create an endpoint security policy</a> or <a href="endpoint-security-policies-configure.md#edit-an-endpoint-security-policy" target="_blank">Edit an endpoint security policy</a> (links open new tabs).

When you create the policy on the **Endpoint security policies** page in the Defender portal at <https://security.microsoft.com/policy-inventory>, use these specific settings:

- **Select platform**: Select **Windows**.
- **Select template**: Select **Microsoft Defender Antivirus**.

### Turn on block at first sight with the Microsoft Defender portal

When you create or modify the policy, use these specific settings on the **Configuration settings** tab:

- **Allow cloud protection**: Select **Allowed. Turns on Cloud Protection (Default)**.
- **Submit samples consent**: Select one of the following values:
  - **Send safe samples automatically. (Default)**
  - **Send all samples automatically**

### Turn off block at first sight with the Microsoft Defender portal

To turn off block at first sight, set **Allow cloud protection** to **Not allowed. Turns off Cloud Protection**.

## Configure block at first sight in Microsoft Configuration Manager

For instructions to create and deploy an antimalware policy, see [Endpoint Protection antimalware policies in Configuration Manager](/intune/configmgr/protect/deploy-use/endpoint-antimalware-policies).

Configuration Manager doesn't include a separate setting named **Block at First Sight**. Configure the cloud protection and sample submission settings that the feature requires.

### Turn on block at first sight with Microsoft Configuration Manager

To turn on block at first sight, configure the following settings in the antimalware policy:

- **Advanced Settings**:
  - **Enable auto sample file submission to help Microsoft determine whether certain detected items are Malicious**: Select **Yes**.
- **Cloud Protection Service**:
  - **Cloud Protection Service membership**: Select **Advanced**.

### Turn off block at first sight with Microsoft Configuration Manager

To turn off block at first sight, set **Cloud Protection Service membership** to **Do not join Cloud Protection Service**.

## Configure block at first sight using Group Policy

1. In Centralized Group Policy, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console) on your Group Policy management computer.

1. In the GPMC console tree, expand Group Policy Objects in the forest and domain containing the GPO you want to edit.

1. Right-click the GPO, and then select **Edit**.

1. In the **Group Policy Management Editor**, go to **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MAPS**.

1. In the details pane of **MAPS**, the settings used to configure block at first sight are:
   - **Configure the 'Block at First Sight' feature**
   - **Send file samples when further analysis is required**

   To open and configure a setting, use any of the following methods:
   - Double-click the setting.
   - Right-click the setting, and then select **Edit**.
   - Select the setting, and then select **Action** \> **Edit**.

> [!TIP]
> You can also configure Group Policy locally on individual devices by using the Local Group Policy Editor (`gpedit.msc`). Navigate to the same path: **Computer configuration** \> **Administrative templates** \> **Windows components** \> **Microsoft Defender Antivirus** \> **MAPS**.

### Turn on block at first sight with Group Policy

To turn on block at first sight in the Group Policy **MAPS** settings, follow these steps:

1. Open the **Configure the 'Block at First Sight' feature** setting.
1. In the setting window that opens, select **Enabled**, and then select **OK**.
1. Open the **Send file samples when further analysis is required** setting.
1. In the setting window that opens, configure the following options:
   1. Select **Enabled**.
   1. **Send file samples when further analysis is required**: Select one of the following values:
      - **Send safe samples** (0x1)
      - **Send all samples** (0x3)

      > [!IMPORTANT]
      > **Always prompt** (0x0) lowers the protection state of the device. **Never send** (0x2) prevents block at first sight from functioning.

   1. Select **OK**.

### Turn off block at first sight with Group Policy

> [!TIP]
> Disabling block at first sight doesn't disable or change the cloud protection and sample submission policies.

To turn off block at first sight in the Group Policy **MAPS** settings, follow these steps:

1. Open the **Configure the 'Block at First Sight' feature** setting.
1. In the setting window that opens, select **Disabled**, and then select **OK**.

## Configure block at first sight using PowerShell

Run the commands in an elevated PowerShell session (a PowerShell window you opened by selecting **Run as administrator**).

### Turn on block at first sight with PowerShell

The following command turns on cloud protection, automatic safe sample submission, and block at first sight:

```powershell
Set-MpPreference -MAPSReporting Advanced -SubmitSamplesConsent SendSafeSamples -DisableBlockAtFirstSeen $false
```

To submit all samples automatically instead of only safe samples, use `SendAllSamples` for the _SubmitSamplesConsent_ value.

### Verify the configuration

The following command displays the current block at first sight settings:

```powershell
Get-MpPreference | Select-Object MAPSReporting, SubmitSamplesConsent, DisableBlockAtFirstSeen
```

To verify block at first sight is turned on, confirm the following values:

- _MAPSReporting_: `2` (Advanced)
- _SubmitSamplesConsent_: `1` (Send safe samples automatically) or `3` (Send all samples automatically)
- _DisableBlockAtFirstSeen_: `False`

### Turn off block at first sight with PowerShell

The following command turns off block at first sight without changing the cloud protection and sample submission settings:

```powershell
Set-MpPreference -DisableBlockAtFirstSeen $true
```

For detailed syntax and parameter information, see [**Set-MpPreference**](/powershell/module/defender/set-mppreference) and [**Get-MpPreference**](/powershell/module/defender/get-mppreference).

## Configure block at first sight in the Windows Security app

On a device that isn't managed by an organization, you can configure block at first sight in the Windows Security app. Although the app doesn't have a setting named **Block at first sight**, the feature turns on when you enable cloud-delivered protection and automatic sample submission.

> [!NOTE]
> If Group Policy manages these settings, they appear greyed-out in the Windows Security app and can't be changed locally.
>
> Group Policy changes must reach the device before the settings are updated in the Windows Security app.

To configure block at first sight, follow these steps:

1. Open the Windows Security app, and then select **Virus & threat protection**.
1. On the **Virus & threat protection** page, select **Manage settings** in the **Virus & threat protection settings** section.
1. On the **Virus & threat protection settings** page, take one of the following actions:
   - To turn on block at first sight, turn on **Cloud-delivered protection** and **Automatic sample submission**.
   - To turn off block at first sight, turn off either setting.

## See also

For more information about Microsoft Defender Antivirus and related features, see the following resources:

- [Microsoft Defender Antivirus in Windows](microsoft-defender-antivirus-windows.md)
- [Enable cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md)
- [Stay protected with Windows Security](https://support.microsoft.com/Windows/Security/Windows-Security/stay-protected-with-the-windows-security-app)
- [Onboard to Microsoft Defender for Endpoint](onboarding.md)
