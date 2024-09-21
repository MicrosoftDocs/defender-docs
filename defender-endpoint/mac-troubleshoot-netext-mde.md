---
title: Troubleshoot network filter extension (NetExt) issues in Microsoft Defender for Endpoint on Mac
description: Learn how to troubleshoot issues with the network filter extension (NetExt) that's installed as part of Microsoft Defender for Endpoint on macOS.
ms.service: defender-endpoint
author: denisebmsft
ms.author: deniseb
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
ms.date: 09/20/2024
---

# Troubleshoot network filter extension (NetExt) issues in Microsoft Defender for Endpoint on Mac 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> [!NOTE]
> You can submit feedback by opening Microsoft Defender for Endpoint on Mac on your device, and going to **Help** > **Send feedback**. Another option is to submit feedback via the Microsoft Defender portal. Go to [security.microsoft.com](https://security.microsoft.com), and selecting the **Give feedback** tab. 

## Overview 

This article provides information on how to troubleshoot issues with the network filter extension (NetExt) that's installed as part of Microsoft Defender for Endpoint on macOS. The network filter extension (NetExt) is used by [Network Protection](network-protection-macos.md) (NP) is enabled on Mac devices.

**Symptom**: 

You may notice issues with network related latencies when using your browser or copying files over the network or using a chat/meeting application. 

**Temporary solution**:

This article describes how to temporarily disable NetExt, and temporarily remove network protection, and resolve network stack-related issues by using Intune, JamF, or a manual process on Mac.

Here are the steps you'll follow:

1. Create a new group for `<device group name goes here>`. For example: `Devices with NetExt disabled`.

2. Exclude that group from the existing Network Filter (NetExt) configuration.

3. Assign the existing configuration to the device group you created in step 1.

## Intune method

### Create a device group for affected devices

1. In the [Intune admin center](https://intune.microsoft.com), select **Groups**, and then select **New group**.

2. Set up the device group as follows:

   - Group type: `Security` 
   - Group name: `<add a group name>`. For example, "Devices with NetExt disabled".
   - Group description: `<add a description>`
   - Membership type: `Assigned` 

   Then select **Refresh**. 

3. Double-click on your new group `Devices with NetExt disabled`.

4. Select **Members**, and then select **Add members**.

5. On the **Devices** tab, select the devices for which you want to disable NetExt. Then click **Select**.

6. Select **Refresh**. You should now be able to see your devices. 

### Exclude that group from the existing Network Filter (NetExt) configuration 

1. In the [Intune admin center](https://intune.microsoft.com), select **Devices**.

2. Under **By platform**, select **macOS**, and then select **Configuration**.

3. Select your current policy for NetExt. For example, `NetFilter-prod-macOS-Default-MDE`.

4. Next to **Assignments**, select **Edit**.

5. Under **Excluded groups**, select **Add groups**, and then select the new device group you created earlier (for example, `Devices with NetExt disabled`). Then click **Select**.

6. Select **Review + save**, and then select **Save**.

### Assign the existing configuration to the "Devices with NetExt disabled" device group 

1. In the [Intune admin center](https://intune.microsoft.com), select **Devices**.

2. Under **By platform**, select **macOS**, and then select **Configuration**.

3. Select a current policy, such as your policy for Accessibility. For example, `Accessibility-prod-macOS-Default-MDE`.

4. Next to **Assignments**, select **Edit**.

5. Under **Add groups**, select the device group that you created earlier (for example, `Devices with NetExt disabled`). Then click **Select**.

6. Select **Review + save**, and then select **Save**.

7. Repeat this procedure for each of your existing policies for Defender for Endpoint on Mac. Examples include:

   - AutoUpdate
   - Background Services
   - Behavior
   - Monitor
   - Device Control
   - Full Disk Access
   - Network Protection
   - Notifications
   - Scheduled Scan
   - Settings Preferences
   - System Extensions 

   > [!CAUTION]
   > Do not repeat it for NetFilter (NetExt). 

After you have completed these steps, see if you are able to reproduce the issue. 

JamF (jamfcloud.com) 

 

Create a new group for e.g. "Disabling NetExt" device group 

In the JamF portal 

Click on "Computers" 

Click on "Static device groups" 

Click on "New" 

Under "Computer Group" tab (default) 

Under "Display name": <add a group name> e.g. "Devices with NetExt disabled" 

Click on the "Assignments" tab 

Select the devices where you want to disable "NetExt" that you want to add. 

Click on "Save" 

Under "Computers - Static Computer Groups", you should be able to see it. 

 

Exclude that group from the existing Network Filter (NetExt) configuration 

In the JamF portal 

Click on "Computers" 

Click on "Configuration Profiles" 

Select your current policy for "NetFilter" (NetExt) e.g. NetFilter-prod-macOS-Default-MDE 

Click on "Scope" tab 

Click on "Edit" 

Click on "Exclusions" tab 

Click on "Add" 

Select "Computer Groups" 

Look for "Device Group" from Step 1. e.g. "Devices with NetExt disabled" 
Click on "Add" 

Click on "Done" 

Click on "Save" 

 

Assign the existing configuration for MDE on macOS to the "Disabling NetExt" device group 

Click on "Computers" 

Click on "Configuration Profiles" 

Select your current policy for Accessibility e.g. Accessibility-prod-macOS-Default-MDE 

Click on "Scope" tab 

Click on "Edit" 

Click on "Targets" tab (default) 

Click on "Add" 

Select "Computer Groups" 

Look for "Device Group" from Step 1. e.g. "Devices with NetExt disabled" 
Click on "Add" 

Click on "Done" 

Click on "Save" 

 

Repeat this for each of the existing policies for MDE on macOS such as, AutoUpdate, Background Services, Behavior, Monitor, Device Control, Full Disk Access, Network Protection, Notifications, Scheduled Scan, Settings Preferences, System Extensions 

 

Important: Do not repeat it for NetFilter (NetExt). 

 

And now try to see if you are able to reproduce the issue. 

 

Manual 