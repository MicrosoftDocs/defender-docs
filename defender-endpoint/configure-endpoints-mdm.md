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
ms.date: 08/12/2024
---

# Onboard Windows devices to Defender for Endpoint using Intune 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-configureendpointsmdm-abovefoldlink)

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
>
> - The **Health Status for onboarded devices** policy uses read-only properties and can't be remediated.
> - Configuration of diagnostic data reporting frequency is only available for devices on Windows 10, version 1703.
> - Onboarding to Defender for Endpoint will onboard the device to [Data Loss Prevention (DLP)](/Microsoft-365/compliance/endpoint-dlp-learn-about), which is also a part of Microsoft 365 compliance.


## Run a detection test to verify onboarding

After onboarding the device, you can choose to run a detection test to verify that a device is properly onboarded to the service. For more information, see [Run a detection test on a newly onboarded Microsoft Defender for Endpoint device](run-detection-test.md).


## Offboard devices using Mobile Device Management tools

For security reasons, the package used to Offboard devices will expire 7 days after the date it was downloaded. Expired offboarding packages sent to a device will be rejected. When downloading an offboarding package you'll be notified of the packages expiry date and it will also be included in the package name.

> [!NOTE]
> Onboarding and offboarding policies must not be deployed on the same device at the same time, otherwise this will cause unpredictable collisions.

1. Get the offboarding package from the [Microsoft Defender portal](https://security.microsoft.com) as follows:

   1. In the navigation pane, select **Settings** \> **Endpoints** \> **Device management** \> **Offboarding**.

   2. Select **Windows 10 or Windows 11** as the operating system.

   3. In the **Deployment method** field, select **Mobile Device Management / Microsoft Intune**.

   4. Click **Download package**, and save the .zip file.

2. Extract the contents of the .zip file to a shared, read-only location that can be accessed by the network administrators who will deploy the package. You should have a file named `WindowsDefenderATP_valid_until_YYYY-MM-DD.offboarding`.

3. In Microsoft Intune admin center, create a custom configuration policy.

   1. In the navigation pane, select **Devices** \> **By platform** \> **Windows** \> **Manage Devices** \> **Configuration**.
   2. Under **Policies** click **Create** \> **New Policy**.
   3. In the **Create a profile** slide out, select **Windows 10 and later** as **Platform** and **Templates** as **Profile Type**.
   4. Under **Template Name**, click the **Custom** template and click **Create**.
   5. Enter a value for **Name** and click **Next**. 
   6. Under **Configuration settings**, click **Add** and use the following OMA-URI settings.
      - Name: Provide a name
      - OMA-URI: `./Device/Vendor/MSFT/WindowsAdvancedThreatProtection/Offboarding`
      - Date type: String
      - Value: *Copy and paste the value from the content of the WindowsDefenderATP_valid_until_YYYY-MM-DD.offboarding file*
   7. Make the appropriate group assignments, applicability rules, and on the **Review + create** step, click the **Create** button to finish the policy.

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
