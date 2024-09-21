---
title: Troubleshoot Network Extension issues in Microsoft Defender for Endpoint on Mac
description: Learn how to troubleshoot issues with the network extension (NetExt) that's installed as part of Microsoft Defender for Endpoint on macOS.
ms.service: defender-endpoint
author: denisebmsft
ms.author: deniseb
manager: deniseb
ms.reviewer: yongrhee
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

# Troubleshoot Network Extension (NetExt) issues in Defender for Endpoint on Mac 

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> [!NOTE]
> You can submit feedback by opening Microsoft Defender for Endpoint on Mac on your device, and going to **Help** > **Send feedback**. Another option is to submit feedback via the Microsoft Defender portal. Go to [security.microsoft.com](https://security.microsoft.com), and selecting the **Give feedback** tab. 

## Overview 

This article provides information on how to troubleshoot issues with the network extension (NetExt) that's installed as part of Microsoft Defender for Endpoint on macOS. 

NetExt is used by [Network Protection](network-protection-macos.md) is enabled on Mac devices.

**Symptom**: 

You might notice issues with network related latencies when using your browser or copying files over the network or using a chat/meeting application. 

**Temporary solution**:

This article describes how to temporarily disable NetExt which will temporarily disable network protection, and resolve network stack-related issues by using Intune, JamF, or a manual process on Mac.

At a high level, these are the steps to follow for [Intune](#intune-method) and [JamF](#jamf-method):

1. Create a new "Devices with NetExt disabled" group.
2. Exclude that group from the existing NetExt configuration.
3. Assign the existing configuration to the "Devices with NetExt disabled" device group.

The following sections describe these steps in more detail.

## Intune method

The following sections describe how to set up a new "Devices with NetExt disabled" device group, exclude it from the NetExt configuration, and then assign the existing configuration to your new device group.

### Create a device group called "Devices with NetExt disabled"

1. In the [Intune admin center](https://intune.microsoft.com), select **Groups**, and then select **New group**.

2. Set up the device group as follows:

   - Group type: `Security` 
   - Group name: `Devices with NetExt disabled`
   - Group description: Add a description.
   - Membership type: `Assigned` 

   Then select **Refresh**. 

3. Double-click on your new group `Devices with NetExt disabled`.

4. Select **Members**, and then select **Add members**.

5. On the **Devices** tab, select the devices for which you want to disable NetExt. Then click **Select**.

6. Select **Refresh**. You should now be able to see your devices. 

### Exclude the "Devices with NetExt disabled" device group from the existing NetExt configuration 

1. In the [Intune admin center](https://intune.microsoft.com), select **Devices**.

2. Under **By platform**, select **macOS**, and then select **Configuration**.

3. Select your current policy for NetExt. For example, `NetFilter-prod-macOS-Default-MDE`.

4. Next to **Assignments**, select **Edit**.

5. Under **Excluded groups**, select **Add groups**, and then select the "Devices with NetExt disabled" device group. Then click **Select**.

6. Select **Review + save**, and then select **Save**.

### Assign the existing configuration to the "Devices with NetExt disabled" device group 

1. In the [Intune admin center](https://intune.microsoft.com), select **Devices**.

2. Under **By platform**, select **macOS**, and then select **Configuration**.

3. Select a current policy, such as your policy for Accessibility. For example, `Accessibility-prod-macOS-Default-MDE`.

4. Next to **Assignments**, select **Edit**.

5. Under **Add groups**, select the device group that you created earlier (for example, `Devices with NetExt disabled`). Then click **Select**.

6. Select **Review + save**, and then select **Save**.

7. Repeat this procedure for each of your existing policies for Defender for Endpoint on Mac. Examples include:

   - Auto-Update
   - Background Services
   - Behavior Monitoring
   - Device Control
   - Full Disk Access
   - Network Protection
   - Notifications
   - Scheduled Scan
   - Settings Preferences
   - System Extensions 

   > [!CAUTION]
   > Do not repeat this procedure for NetExt. 

   After you complete these steps, see if you're able to reproduce the issue. 

## JamF method

The following sections describe how to create a new "Devices with NetExt disabled" group, exclude the group from the existing NetExt configuration, and then assign the existing configuration to the new group.

### Create a "Devices with NetExt disabled" group

1. In your JamF portal, select **Computers**, and then select **Static device groups**.

2. Select **New**.

3. On the **Computer Group** tab (default), under **Display name**, add the group name `Devices with NetExt disabled`.

4. Select the **Assignments** tab.

5. Select the devices select the devices for which you want to disable NetExt. Then select **Save**.

   Under **Computers - Static Computer Groups**, you should be able to see your new group. 

### Exclude your "Devices with NetExt disabled" group from the existing NetExt configuration 

1. In your JamF portal, select **Computers**, and then select **Configuration Profiles**.

2. Select your current policy for NetExt. For example, `NetFilter-prod-macOS-Default-MDE`.

3. On the **Scope** tab, select **Edit**.

4. On the **Exclusions** tab, select **Add**, and then select **Computer Groups**.

5. Find your "Devices with NetExt disabled" group, and then select **Add**.

6. Select **Done**, and then select **Save**.

### Assign the existing configuration to the "Devices with NetExt disabled" group 

1. In your JamF portal, select **Computers**, and then select **Configuration Profiles**.

2. Select a current policy, such as one for Accessibility. For example, `Accessibility-prod-macOS-Default-MDE`.

3. On the **Scope** tab, select **Edit**.

4. On the **Targets** tab, select **Add**, and then select **Computer Groups**.

5. Find your "Devices with NetExt disabled" group, and then select **Add**.

6. Select **Done**, and then select **Save**. 

7. Repeat this procedure for each of your existing policies for Defender for Endpoint on Mac. Examples include:

   - Auto-Update
   - Background Services
   - Behavior Monitoring
   - Device Control
   - Full Disk Access
   - Network Protection
   - Notifications
   - Scheduled Scan
   - Settings Preferences
   - System Extensions 

   > [!CAUTION]
   > Do not repeat this procedure for NetExt. 

   After you complete these steps, see if you're able to reproduce the issue. 

## Manual method

If you have Defender for Endpoint installed on your Mac, you can remove the NetExt extension temporarily by following these steps:

1. On your Mac, open **System Settings**.

2. Go to **General** > **Login items & Extensions**, and then scroll down until you see **Network Extensions**. There, you see the following extensions:

   - Microsoft Defender 
   - Microsoft Defender Network Extension 

3. Set the toggle to turn off Microsoft Defender Network Extension. Type your password, and then select **OK**.

4. You should see the following message:

   `Note: Disabling the system extension will make sure that it will not be launched after reboot, but it does not guarantee that it will be terminated immediately.`
 
5. Select **OK**, and then select **Done**. 

   After you complete these steps, see if you're able to reproduce the issue. 

## See also

[What's new in Microsoft Defender for Endpoint on Mac](mac-whatsnew.md)