---
title: Onboard non-persistent virtual desktop infrastructure (VDI) devices
description: Deploy the configuration package on virtual desktop infrastructure (VDI) device so that they're onboarded to Microsoft Defender for Endpoint service.
search.appverid: met150
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.reviewer: pahuijbr; yonghree
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
ms.date: 02/04/2025
ms.subservice: onboard
---

# Onboard non-persistent virtual desktop infrastructure (VDI) devices in Microsoft Defender XDR

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1 and Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- Virtual desktop infrastructure (VDI) devices
- Windows 10 and Windows 11
- Windows Server 2019 and Windows Server 2022
- Windows Server 2025 (beginning in February 2025 and rolling out over the next several weeks)
- [Windows Server 2012 R2 and Windows Server 2016](/defender-endpoint/configure-server-endpoints#windows-server-2016-and-windows-server-2012-r2)
- Windows Server 2008


> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Virtual desktop infrastructure (VDI) is an IT infrastructure concept that lets end users access enterprise virtual desktops instances from almost any device (such as your personal computer, smartphone, or tablet), eliminating the need for organization to provide users with physical machines. Using VDI devices reduces costs, as IT departments are no longer responsible for managing, repairing, and replacing physical endpoints. Authorized users can access the same company servers, files, apps, and services from any approved device through a secure desktop client or browser. 

Like any other system in an IT environment, VDI devices should have an endpoint detection and response (EDR) and antivirus solution to protect against advanced threats and attacks.

> [!NOTE]
> **Persistent VDI's** - Onboarding a persistent VDI machine into Microsoft Defender for Endpoint is handled the same way you would onboard a physical machine, such as a desktop or laptop. Group policy, Microsoft Configuration Manager, and other methods can be used to onboard a persistent machine. In the Microsoft Defender portal, (https://security.microsoft.com) under onboarding, select your preferred onboarding method, and follow the instructions for that type. For more information, see [Onboarding Windows client](onboard-windows-client.md).

## Onboarding non-persistent virtual desktop infrastructure (VDI) devices

Defender for Endpoint supports non-persistent VDI session onboarding. There might be associated challenges when onboarding VDI instances. The following are typical challenges for this scenario:

- Instant early onboarding of a short-lived session, which must be onboarded to Defender for Endpoint before actual provisioning.

- The device name is typically reused for new sessions.

- In a VDI environment, VDI instances can have short lifespans. VDI devices can appear in the Microsoft Defender portal as either single entries for each VDI instance or multiple entries for each device. 

   - Single entry for each VDI instance. If the VDI instance was already onboarded to Microsoft Defender for Endpoint, and at some point deleted, and then recreated with the same host name, a new object representing this VDI instance is NOT be created in the portal. In this case, the *same* device name must be configured when the session is created, for example using an unattended answer file.

   - Multiple entries for each device - one for each VDI instance.

> [!IMPORTANT]
> If you're deploying non-persistent VDIs through cloning technology, make sure that your internal template VMs are not onboarded to Defender for Endpoint. This recommendation is to avoid cloned VMs from being onboarded with the same senseGuid as your template VMs, which could prevent VMs from showing up as new entries in the Devices list. 

The following steps guide you through onboarding VDI devices and highlight steps for single and multiple entries.

> [!WARNING]
> For environments where there are low resource configurations, the VDI boot procedure might slow the Defender for Endpoint sensor onboarding.

### Onboarding steps

> [!NOTE]
> Windows Server 2016 and Windows Server 2012 R2 must be prepared by applying the installation package first using the instructions in [Onboard Windows servers](/defender-endpoint/configure-server-endpoints#functionality-in-the-modern-unified-solution) for this feature to work.

1. Open the VDI configuration package file (`WindowsDefenderATPOnboardingPackage.zip`) that you downloaded from the service onboarding wizard. You can also get the package from the [Microsoft Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2077139).

    1. In the navigation pane, select **Settings** > **Endpoints** > **Device management** > **Onboarding**.

    2. Select the operating system.

    3.  In the **Deployment method** field, select **VDI onboarding scripts for non-persistent endpoints**.

    4. Select **Download package** and save the file.

2. Copy the files from the `WindowsDefenderATPOnboardingPackage` folder extracted from the zipped folder into the golden/primary image under the path `C:\WINDOWS\System32\GroupPolicy\Machine\Scripts\Startup`.

    - If you're implementing multiple entries for each device - one for each session, copy `WindowsDefenderATPOnboardingScript.cmd`.

    - If you're implementing a single entry for each device, copy both `Onboard-NonPersistentMachine.ps1` and `WindowsDefenderATPOnboardingScript.cmd`.

   > [!NOTE]
   > If you don't see the `C:\WINDOWS\System32\GroupPolicy\Machine\Scripts\Startup` folder, it might be hidden. You'll need to choose the **Show hidden files and folders** option from File Explorer.

3. Open a Local Group Policy Editor window and navigate to **Computer Configuration** \> **Windows Settings** \> **Scripts** \> **Startup**.

   > [!NOTE]
   > Domain Group Policy may also be used for onboarding non-persistent VDI devices.

4. Depending on the method you'd like to implement, follow the appropriate steps:

   | Method | Steps |
   |---|---|
   | Single entry for each device | 1. Select the **PowerShell Scripts** tab, then select **Add** (Windows Explorer opens directly in the path where you copied the onboarding script earlier). <br/>2. Navigate to onboarding PowerShell script `Onboard-NonPersistentMachine.ps1`. There's no need to specify the other file, as it's triggered automatically. |
   | Multiple entries for each device | 1. Select the **Scripts** tab, then select **Add** (Windows Explorer opens directly in the path where you copied the onboarding script earlier). <br/>2. Navigate to the onboarding bash script `WindowsDefenderATPOnboardingScript.cmd`. |

5. Test your solution by following these steps:

   1. Create a pool with one device.

   2. Sign into device.
   
   3. Sign out on the device.
   
   4. Sign into the device using another account.
   
   5. Depending on the method you'd like to implement, follow the appropriate steps:
   
      - For single entry for each device: Check for only one entry in the [Microsoft Defender portal](https://security.microsoft.com).
      - For multiple entries for each device: Check multiple entries in the [Microsoft Defender portal](https://security.microsoft.com).

6. In the navigation pane, select **Devices list**.

7. Use the search function by entering the device name and select **Device** as search type.

## For downlevel SKUs (Windows Server 2008 R2)

> [!NOTE]
> These instructions for other Windows server versions also apply if you are running the previous Microsoft Defender for Endpoint for Windows Server 2016 and Windows Server 2012 R2 that requires the MMA. Instructions to migrate to the new unified solution are at [Server migration scenarios in Microsoft Defender for Endpoint](server-migration.md).

The following registry is relevant only when the aim is to achieve a single entry for each device.

1. Set the registry value as follows:

   ```console

   [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging]
    "VDI"="NonPersistent"

   ```

   Or, you can use command line as follows:

   ```console

   reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection\DeviceTagging" /v VDI /t REG_SZ /d "NonPersistent" /f

   ```

2. Follow the [server onboarding process](configure-server-endpoints.md). 

## Updating virtual desktop infrastructure (VDI) images (persistent or non-persistent)

With the ability to easily deploy updates to VMs running in VDIs, we've shortened this guide to focus on how you can get updates on your machines quickly and easily. You no longer need to create and seal golden images on a periodic basis, as updates are expanded into their component bits on the host server and then downloaded directly to the VM when it's turned on.

If you have onboarded the primary image of your VDI environment (SENSE service is running), then you must offboard and clear some data before putting the image back into production.

1. [Offboard the machine](offboard-machines.md).

2. Ensure the sensor is stopped by running the following command in a CMD window:

   ```console

   sc query sense

   ```

3. Run the following commands in a CMD window::

   ```console

   del "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Cyber\*.*" /f /s /q
   REG DELETE "HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection" /v senseGuid /f
   REG DELETE "HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection" /v 7DC0B629-D7F6-4DB3-9BF7-64D5AAF50F1A /f
   REG DELETE "HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\48A68F11-7A16-4180-B32C-7F974C7BD783" /f
   exit

   ```

### Are you using a third party for VDIs?

If you're deploying non-persistent VDIs through VMware instant cloning or similar technologies, make sure that your internal template VMs and replica VMs aren't onboarded to Defender for Endpoint. If you onboard devices using the single entry method, instant clones that are provisioned from onboarded VMs might have the same senseGuid, and that can stop a new entry from being listed in the Device Inventory view (in the [Microsoft Defender portal](https://security.microsoft.com), choose **Assets** > **Devices**).

If either the primary image, template VM, or replica VM are onboarded to Defender for Endpoint using the single entry method, it stops Defender for Endpoint from creating entries for new non-persistent VDIs in the Microsoft Defender portal.

Reach out to your third-party vendors for further assistance.

## Other recommended configuration settings

After onboarding devices to the service, it's important to take advantage of the included threat protection capabilities by enabling them with the following recommended configuration settings.

### Next generation protection configuration

The configuration settings in this link are recommended: [Configure Microsoft Defender Antivirus on a remote desktop or virtual desktop infrastructure environment](/defender-endpoint/deployment-vdi-microsoft-defender-antivirus).

## Related articles

- [Onboard Windows devices using Group Policy](configure-endpoints-gp.md)
- [Onboard Windows devices using Microsoft Configuration Manager](configure-endpoints-sccm.md)
- [Onboard Windows devices using Mobile Device Management tools](configure-endpoints-mdm.md)
- [Onboard Windows devices using a local script](configure-endpoints-script.md)
- [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
