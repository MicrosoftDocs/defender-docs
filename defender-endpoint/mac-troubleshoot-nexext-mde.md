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

1. Create a new group for `<device group name goes here>`. For example: "Disabling NetExt" device group.

2. Exclude that group from the existing Network Filter (NetExt) configuration.

3. Assign the existing configuration to the device group you created in step 1.

## Intune method

### Create a device group

1. In the Intune admin center, select **Groups**, and then select **New group**.

2. Set up the device group as follows:

   - Group type: `Security` 
   - Group name: `<add a group name>`. For example, "Devices with NetExt disabled".
   - Group description: `<add a description>`
   - Membership type: `Assigned` 

   Then select **Refresh**. 

Double-click on "Devices with NetExt disabled" 

Click on "Members" 

Click on "Add members" 

Click on the "Devices" tab 
Select the devices where you want to disable "NetExt" that you want to add. 

Click on "Select" 

Click on Refresh at the top 

You should now be able to see your devices. 

 
