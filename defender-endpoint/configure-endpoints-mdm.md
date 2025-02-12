---
title: Onboard Windows devices to Defender for Endpoint using Intune 
description: Use Microsoft Intune to deploy the configuration package on devices so that they're onboarded to the Defender for Endpoint service.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 10/31/2024
---

# Onboard Windows devices to Defender for Endpoint using Intune 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

You can use mobile device management (MDM) solutions to configure Windows 10 devices. Defender for Endpoint supports MDMs by providing OMA-URIs to create policies to manage devices.

For more information on using Defender for Endpoint CSP, see, [WindowsAdvancedThreatProtection CSP](https://msdn.microsoft.com/library/windows/hardware/mt723296(v=vs.85).aspx) and [WindowsAdvancedThreatProtection DDF file](https://msdn.microsoft.com/library/windows/hardware/mt723297(v=vs.85).aspx).

## Before you begin

Devices must be enrolled with Intune as your Mobile Device Management (MDM) solution.

For more information on enabling MDM with Microsoft Intune, see [Device enrollment (Microsoft Intune)](/mem/intune/enrollment/device-enrollment).

## Onboard devices using Microsoft Intune

Check out [Identify Defender for Endpoint architecture and deployment method](deployment-strategy.md) to see the various paths in deploying Defender for Endpoint.

Follow the instructions from [Intune](/mem/intune/protect/advanced-threat-protection-configure#enable-microsoft-defender-for-endpoint-in-intune).

For more information on using Defender for Endpoint CSP, see, [WindowsAdvancedThreatProtection CSP](https://msdn.microsoft.com/library/windows/hardware/mt723296(v=vs.85).aspx) and [WindowsAdvancedThreatProtection DDF file](https://msdn.microsoft.com/library/windows/hardware/mt723297(v=vs.85).aspx).

> [!NOTE]
> - The **Health Status for onboarded devices** policy uses read-only properties and can't be remediated.
> - Configuration of diagnostic data reporting frequency is only available for devices on Windows 10, version 1703.
> - Onboarding to Defender for Endpoint will onboard the device to [Data Loss Prevention (DLP)](/Microsoft-365/compliance/endpoint-dlp-learn-about), which is also a part of Microsoft 365 compliance.


## Run a detection test to verify onboarding

After onboarding the device, you can choose to run a detection test to verify that a device is properly onboarded to the service. For more information, see [Run a detection test on a newly onboarded Microsoft Defender for Endpoint device](run-detection-test.md).

## Offboard devices using Mobile Device Management tools

For security reasons, the package used to Offboard devices expires seven days after the date it was downloaded. Expired offboarding packages sent to a device are rejected. When downloading an offboarding package, you're notified of the package's expiry date, and the date is included in the package name.

> [!NOTE]
> To avoid unpredictable policy collisions, onboarding and offboarding policies must not be deployed at the same time on a device.

1. Get the offboarding package from the [Microsoft Defender portal](https://security.microsoft.com) as follows:

   1. In the navigation pane, select **Settings** \> **Endpoints** \> **Device management** \> **Offboarding**.

   2. Select **Windows 10 or Windows 11** as the operating system.

   3. In the **Deployment method** field, select **Mobile Device Management / Microsoft Intune**.

   4. Select **Download package**, and save the .zip file.

2. Extract the contents of the `.zip` file to a shared, read-only location that can be accessed by the network administrators who'll deploy the package. You should have a file named `WindowsDefenderATP_valid_until_YYYY-MM-DD.offboarding`.

3. In the [Microsoft Intune admin center](https://intune.microsoft.com), you can use a custom configuration policy or an EDR policy.

   | Method | Procedure |
   |---|---|
   | Custom configuration policy | 1. In the navigation pane, select **Devices** \> **By platform** \> **Windows** \> **Manage Devices** \> **Configuration**. <br/><br/>2. Under **Policies** select **Create** \> **New Policy**.<br/><br/>3. In the **Create a profile** slide out, select **Windows 10 and later** as **Platform** and **Templates** as **Profile Type**.<br/><br/>4. Under **Template Name**, select the **Custom** template and select **Create**.<br/><br/>5. Enter a value for **Name** and select **Next**. <br/><br/>6. Under **Configuration settings**, select **Add** and use the following OMA-URI settings: <br/>- Name: Provide a name <br/>- OMA-URI: `./Device/Vendor/MSFT/WindowsAdvancedThreatProtection/Offboarding` <br/> - Date type: String<br/>- Value: Copy and paste the value from the content of the `WindowsDefenderATP_valid_until_YYYY-MM-DD` offboarding file. <br/><br/>7. Make the appropriate group assignments, applicability rules, and on the **Review + create** step, select **Create**. |
   | EDR policy | 1. In the navigation pane, select **Endpoint security** \> **Manage** \> **Endpoint detection and response**.<br/><br/>2. Under **Endpoint detection and response (EDR) policies**, select **Create policy**.<br/><br/>3. In the **Create a profile** slide out, select **Windows** as **Platform** and **Endpoint detection and response** and select **Create**.<br/><br/>5. Enter a value for **Name** and select **Next**. <br/><br/>6. Under **Configuration settings**, select **Offboard** for the setting **Microsoft Defender for Endpoint client configuration package type**.<br/><br/>7. Copy the value from the content of the `WindowsDefenderATP_valid_until_YYYY-MM-DD` offboarding file and paste it in the **Offboarding (Device)** setting. Then select **Next**.<br/><br/>8. Specify any scope tags if needed, make the appropriate group assignments and on the **Review + create** step, select **Create**. |

   For more information on Microsoft Intune policy settings, see [Windows 10 policy settings in Microsoft Intune](/mem/intune/configuration/custom-settings-windows-10).

> [!NOTE]
> The **Health Status for offboarded devices** policy uses read-only properties and can't be remediated.

> [!IMPORTANT]
> Offboarding causes the device to stop sending sensor data to Defender for Endpoint, but data from the device, including references to any alerts it has, is retained for up to 6 months.

## Related articles

- [Onboard Windows devices using Group Policy](configure-endpoints-gp.md)
- [Onboard Windows devices using Microsoft Endpoint Configuration Manager](configure-endpoints-sccm.md)
- [Onboard Windows devices using a local script](configure-endpoints-script.md)
- [Onboard non-persistent virtual desktop infrastructure (VDI) devices](configure-endpoints-vdi.md)
- [Run a detection test on a newly onboarded Microsoft Defender for Endpoint device](run-detection-test.md)
- [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
