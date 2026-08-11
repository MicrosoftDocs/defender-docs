---
title: Troubleshoot Network Extension issues in Microsoft Defender for Endpoint on macOS
description: Learn how to troubleshoot issues with the network extension (NetExt) that's installed as part of Microsoft Defender for Endpoint on macOS.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.topic: troubleshooting-general
ms.subservice: macos
ms.date: 08/11/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
---
# Troubleshoot Network Extension (NetExt) issues in Defender for Endpoint on Mac 


> [!NOTE]
> You can submit feedback by opening Microsoft Defender for Endpoint on macOS on your device, and going to **Help** > **Send feedback**. Another option is to submit feedback via the Microsoft Defender portal. Go to [security.microsoft.com](https://security.microsoft.com), and selecting the **Give feedback** tab. 

## Overview 

This article provides information on how to troubleshoot issues with the network extension (NetExt) that's installed as part of Microsoft Defender for Endpoint on macOS. 

NetExt provides network event data that multiple Defender for Endpoint capabilities use. [Network Protection](network-protection-macos.md) depends on NetExt, but disabling Network Protection enforcement isn't the same as disabling NetExt.

**Symptom**: 

You might notice issues with network related latencies when using your browser or copying files over the network or using a chat/meeting application. 

## Identify the affected component

Before disabling NetExt, determine whether the issue occurs only when Network Protection enforcement is enabled or whenever NetExt is running.

1. Check Network Protection and system extension health to establish a baseline:

   ```bash
   mdatp health --field network_protection_status
   mdatp health --details system_extensions
   mdatp health --details network_protection
   mdatp connectivity test
   ```

   Resolve any connectivity test failures before isolating Network Protection or NetExt.

1. Test the following states and record whether the issue reproduces:

   |NetExt|Network Protection|Interpretation|
   |---|---|---|
   |Enabled|Audit or block|Baseline with both components active.|
   |Enabled|Disabled|If the issue remains, investigate NetExt or another capability that uses network events.|
   |Disabled|Disabled|If the issue stops only here, NetExt is involved.|

1. Record the following information:

   - Affected application and protocol.
   - Browser or client.
   - Destination.
   - Proxy configuration.
   - Virtual private network (VPN) product and full-tunnel or split-tunnel mode.
   - Other installed network-filtering security products.

1. Collect a diagnostic package while reproducing the issue:

   ```bash
   sudo mdatp diagnostic create
   ```

   If Microsoft Support requests a NetExt log stream, run:

   ```bash
   log stream --info --debug --style compact --predicate 'process == "netext"' > netextlogstream.txt
   ```

   Reproduce the issue, and then press **Control+C** to stop the trace.

   > [!CAUTION]
   > NetExt log streams can contain hostnames, URLs, IP addresses, and other environment details. Collect a log stream only when Microsoft support requests it, and transfer it by using the support-approved upload method.

> [!CAUTION]
> Disabling NetExt reduces network visibility and disables capabilities that depend on network events. Use the smallest possible pilot group and record the original Network Protection and NetExt assignments. At the end of testing, restore both components to their original assignments and verify their health.

## Temporary solution

This article describes how to temporarily disable NetExt which will temporarily disable network protection, and resolve network stack-related issues by using Intune, JamF, or a manual process on macOS.

At a high level, these are the steps to follow for [Intune](#intune-method) and [JamF](#jamf-method):

1. Create a new "Devices with NetExt disabled" group.

1. Exclude that group from the existing NetExt configuration.

1. Assign the existing configuration to the "Devices with NetExt disabled" device group.

The following sections describe these steps in more detail.

## Intune method

The following sections describe how to set up a new "Devices with NetExt disabled" device group, exclude it from the NetExt configuration, and then assign the existing configuration to your new device group.

### Create a device group called "Devices with NetExt disabled"

1. In the [Intune admin center](https://intune.microsoft.com), select **Groups**, and then select **New group**.

1. Set up the device group as follows:

   - Group type: `Security` 
   - Group name: `Devices with NetExt disabled`
   - Group description: Add a description.
   - Membership type: `Assigned` 

   Then select **Refresh**. 

1. Double-click on your new group `Devices with NetExt disabled`.

1. Select **Members**, and then select **Add members**.

1. On the **Devices** tab, select the devices for which you want to disable NetExt. Then select **Select**.

1. Select **Refresh**. You should now be able to see your devices. 

### Exclude the "Devices with NetExt disabled" device group from the existing NetExt configuration 

1. In the [Intune admin center](https://intune.microsoft.com), select **Devices**.

1. Under **By platform**, select **macOS**, and then select **Configuration**.

1. Select your current policy for NetExt. For example, `NetFilter-prod-macOS-Default-MDE`.

1. Next to **Assignments**, select **Edit**.

1. Under **Excluded groups**, select **Add groups**, and then select the "Devices with NetExt disabled" device group. Then select **Select**.

1. Select **Review + save**, and then select **Save**.

### Assign the existing configuration to the "Devices with NetExt disabled" device group 

1. In the [Intune admin center](https://intune.microsoft.com), select **Devices**.

1. Under **By platform**, select **macOS**, and then select **Configuration**.

1. Select a current policy, such as your policy for Accessibility. For example, `Accessibility-prod-macOS-Default-MDE`.

1. Next to **Assignments**, select **Edit**.

1. Under **Add groups**, select the device group that you created earlier (for example, `Devices with NetExt disabled`). Then select **Select**.

1. Select **Review + save**, and then select **Save**.

1. Repeat this procedure for each of your existing policies for Defender for Endpoint on Mac. Examples include:

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
   > Don't repeat this procedure for NetExt. 

   After you complete these steps, see if you're able to reproduce the issue. 

## JamF method

The following sections describe how to create a new "Devices with NetExt disabled" group, exclude the group from the existing NetExt configuration, and then assign the existing configuration to the new group.

### Create a "Devices with NetExt disabled" group

1. In your JamF portal, select **Computers**, and then select **Static device groups**.

1. Select **New**.

1. On the **Computer Group** tab (default), under **Display name**, add the group name `Devices with NetExt disabled`.

1. Select the **Assignments** tab.

1. Select the devices for which you want to disable NetExt. Then select **Save**.

1. Under **Computers - Static Computer Groups**, you should be able to see your new group. 

### Exclude your "Devices with NetExt disabled" group from the existing NetExt configuration 

1. In your JamF portal, select **Computers**, and then select **Configuration Profiles**.

1. Select your current policy for NetExt. For example, `NetFilter-prod-macOS-Default-MDE`.

1. On the **Scope** tab, select **Edit**.

1. On the **Exclusions** tab, select **Add**, and then select **Computer Groups**.

1. Find your "Devices with NetExt disabled" group, and then select **Add**.

1. Select **Done**, and then select **Save**.

### Assign the existing configuration to the "Devices with NetExt disabled" group 

1. In your JamF portal, select **Computers**, and then select **Configuration Profiles**.

1. Select a current policy, such as one for Accessibility. For example, `Accessibility-prod-macOS-Default-MDE`.

1. On the **Scope** tab, select **Edit**.

1. On the **Targets** tab, select **Add**, and then select **Computer Groups**.

1. Find your "Devices with NetExt disabled" group, and then select **Add**.

1. Select **Done**, and then select **Save**. 

1. Repeat this procedure for each of your existing policies for Defender for Endpoint on Mac. Examples include:

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
   > Don't repeat this procedure for NetExt. 

   After you complete these steps, see if you're able to reproduce the issue. 

## Manual method

If you have Defender for Endpoint installed on your macOS device, you can remove the NetExt extension temporarily by following these steps:

1. On your Mac, open **System Settings**.

1. Go to **General** > **Login items & Extensions**, and then scroll down until you see **Network Extensions**. There, you see the following extensions:

   - Microsoft Defender 
   - Microsoft Defender Network Extension 

1. Set the toggle to turn off Microsoft Defender Network Extension. Type your password, and then select **OK**.

1. You should see the following message:

   `Note: Disabling the system extension will make sure that it will not be launched after reboot, but it does not guarantee that it will be terminated immediately.`
 
1. Select **OK**, and then select **Done**. 

   After you complete these steps, see if you're able to reproduce the issue. 

## See also

[What's new in Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-releases.md#macos-releases)