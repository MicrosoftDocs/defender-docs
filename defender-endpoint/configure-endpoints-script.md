---
title: Onboard Windows Servers using a local script
description: Use a local script to deploy the configuration package on devices to enable onboarding of the devices to the service.
search.appverid: met150
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: pahuijbr
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: install-set-up-deploy
ms.subservice: onboard
ms.date: 11/24/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Onboard Windows devices using a local script

You can also manually onboard individual devices to Defender for Endpoint. You might want to onboard some devices when you're testing the service before you commit to onboarding all devices in your network.

> [!IMPORTANT]
> The script described in this article is recommended for manually onboarding devices to Defender for Endpoint. You should use it on a limited number of devices only (10 devices or less). If you're deploying to a production environment, see [other deployment options](onboard-client.md), such as Intune, Group Policy, or Configuration Manager.

Check out [Identify Defender for Endpoint architecture and deployment method](deployment-strategy.md) to see the various paths in deploying Defender for Endpoint.

[!INCLUDE [Microsoft Defender deployment tool preview](./includes/defender-deployment-tool-preview.md)]

## Onboard devices

> [!TIP]
> If **Endpoints** isn't available in **System** \> **Settings**, do one or more of the following troubleshooting steps:
>
> - Wait a few minutes for the environment to initialize.
> - Try opening other Microsoft Defender XDR features (for example, Incidents or Hunting).
> - Verify you have the required roles (at least [Security Administrator](/entra/identity/role-based-access-control/permissions-reference#security-administrator)) and appropriate licensing.

1. Open the configuration package .zip file (*WindowsDefenderATPOnboardingPackage.zip*) that you downloaded from the service onboarding wizard.

   Or, you can get the onboarding package from the Microsoft Defender portal using the following steps:

   1. In the Defender portal at <https://security.microsoft.com>, go to **System** \> **Settings** \> **Endpoints** \> **Device management** section \> **Onboarding**. Or, to go directly to the **Onboarding** page, use <https://security.microsoft.com/securitysettings/endpoints/onboarding>.
   2. On the **Onboarding** page, configure the following settings:
      - At the top of the page, verify **Windows 10 and 11** is selected.
      - **1. Onboard a device** section:
        - **Connectivity type**: Select one of the following values:
          - **Standard**: Use the traditional, full set of Microsoft Defender for Endpoint service URLs.
          - **Streamlined**: Simplify firewall/proxy configuration by consolidating connectivity to fewer endpoints. For more information, see [Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint](configure-device-connectivity.md).
        - **Deployment method**: Verify **Local script (for up to 10 devices)** is selected.
   3. Select **Download onboarding package** to download the *WindowsDefenderATPOnboardingPackage.zip* file.

2. Extract the contents of the .zip file on the device in a location that's easy to find (for example, the Desktop). The .zip file contains a single file named *WindowsDefenderATPLocalOnboardingScript.cmd*.

3. On the device, run the following commands in an elevated command prompt (a Command Prompt window you opened by selecting **Run as administrator**):
   1. Go to the folder where you saved the extracted *WindowsDefenderATPLocalOnboardingScript.cmd* file. For example, to go to the Desktop folder, run the following command:

      ```dos
      if exist "%OneDrive%\Desktop" (cd /d "%OneDrive%\Desktop") else if exist "%USERPROFILE%\Desktop" cd /d "%USERPROFILE%\Desktop"
      ```

   2. Run the *WindowsDefenderATPLocalOnboardingScript.cmd* script:

      ```dos
      WindowsDefenderATPLocalOnboardingScript.cmd
      ```

   After the script completes, it displays **Press any key to continue...**. Press any key to complete the steps on the device.

For information on how you can manually validate that the device is compliant and correctly reports sensor data see, [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md).

> [!TIP]
> After onboarding the device, you can run a detection test to verify that a device is properly onboarded to the service. For more information, see [Run a detection test on a newly onboarded Microsoft Defender for Endpoint endpoint](run-detection-test.md).

## Configure sample collection settings

On each device, a registry setting configures whether samples can be collected from the device when a request is made through Microsoft Defender XDR to submit a file for deep analysis. The AllowSampleCollection DWORD has the following possible values:

- 0 (00000000): Sample sharing isn't allowed from the device.
- 1 (00000001): Sharing of all file types is allowed from the device. This value is the default if the registry key doesn't exist.

Copy the following text into Notepad, set the AllowSampleCollection value, save the file as a .reg file, and then run the .reg file on the device.

```text
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection]
"AllowSampleCollection"=dword:00000000
```

## Run a detection test to verify onboarding

After onboarding the device, you can choose to run a detection test to verify that a device is properly onboarded to the service. For more information, see [Run a detection test on a newly onboarded Microsoft Defender for Endpoint device](run-detection-test.md).

## Offboard devices using a local script

For security reasons, the package used to offboard devices expires seven days after the date it was downloaded. Expired offboarding packages sent to a device are rejected. When downloading an offboarding package, you're notified of the package's expiry date, and that date is included in the package file name.

> [!NOTE]
> Don't deploy onboarding and offboarding policies on the same device at the same time. Unpredictable collisions might occur.

1. Get the package from the Microsoft Defender portal using the following steps:
   1. In the Defender portal at <https://security.microsoft.com>, go to **System** \> **Settings** \> **Endpoints** \> **Device management** section \> **Offboarding**. Or, to go directly to the **Offboarding** page, use <https://security.microsoft.com/securitysettings/endpoints/offboarding>.
   2. On the **Onboarding** page, configure the following settings:
      - At the top of the page, verify **Windows 10 and 11** is selected.
      - **Deployment method**: Verify **Local script (for up to 10 devices)** is selected.
   3. Select **Download package**, and then select **Download** in the confirmation dialog to download the *WindowsDefenderATPOffboardingPackage_valid_until_YYYY-MM-DD.zip* file.

2. Extract the contents of the .zip file on the device in a location that's easy to find (for example, the Desktop). The .zip file contains a single file named *WindowsDefenderATPOffboardingScript_valid_until_YYYY-MM-DD.cmd*.

3. On the device, run the following commands in an elevated command prompt (a Command Prompt window you opened by selecting **Run as administrator**):

   1. Go to the folder where you saved the extracted *WindowsDefenderATPOffboardingScript_valid_until_YYYY-MM-DD.cmd* file. For example, to go to the Desktop folder, run the following command:

      ```dos
      if exist "%OneDrive%\Desktop" (cd /d "%OneDrive%\Desktop") else if exist "%USERPROFILE%\Desktop" cd /d "%USERPROFILE%\Desktop"
      ```

   2. Run the *WindowsDefenderATPOffboardingScript_valid_until_YYYY-MM-DD.cmd* script:

      ```dos
      WindowsDefenderATPOffboardingScript_valid_until_YYYY-MM-DD.cmd
      ```

> [!IMPORTANT]
> Offboarding a device causes the device to stop sending sensor data to the portal. Data from the device, including reference to any of its alerts, is retained for up to six months.

## Monitor device configuration

You can follow the different verification steps in the [Troubleshoot onboarding issues](troubleshoot-onboarding.md) to verify that the script completed successfully and the agent is running.

Monitoring can also be done directly on the portal, or by using the different deployment tools.

### Monitor devices using the portal

In the Defender portal at <https://security.microsoft.com>, go to **Assets** \> **Devices**. Or, to go directly to the **Device inventory** page, use <https://security.microsoft.com/machines?category=all-devices>.

On the **All devices** tab of the **Devices inventory** page, verify that devices are appearing.

## Related articles

- [Onboard Windows devices using Group Policy](configure-endpoints-gp.md)
- [Onboard Windows devices using Microsoft Configuration Manager](configure-endpoints-sccm.md)
- [Onboard Windows devices using Mobile Device Management tools](configure-endpoints-mdm.md)
- [Onboard non-persistent virtual desktop infrastructure (VDI) devices](configure-endpoints-vdi.md)
- [Run a detection test on a newly onboarded Microsoft Defender for Endpoint device](run-detection-test.md)
- [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)
