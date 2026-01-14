---
title: Manage profiles and approve extensions using Intune
description: Manage profiles and approve extensions using Intune for Microsoft Defender for Endpoint to work properly on macOS.
ms.service: defender-endpoint
ms.author: kesharab
author: KesemSharabi
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: how-to
search.appverid: met150
ms.date: 04/04/2025
---

# Manage profiles and approve extensions using Intune

  > [!NOTE]
  > Intune policy support for macOS extensions was deprecated in the August 2024 service release (2048). Existing Intune policies with macOS extensions continue to work, but you can't create new policies with macOS extensions in Intune.
  >
  > Instead, use the settings catalog to create new Intune policies for macOS that configure the System Extension payload. For more information, see [Use the Intune settings catalog to configure settings](/intune/intune-service/configuration/settings-catalog).

This article describes the procedures to follow to manage profiles properly using the Intune management tool.

<a name='intune-system-extensions-policy'></a>

## Intune policy

Do the following procedure to approve the required system extensions.

1. In the Microsoft Intune admin center at <https://intune.microsoft.com>, go to **Devices**.
2. On the **Devices \| Overview** page, go to the **Manage devices** section \> **Configuration**. Or, to go directly to the **Devices \| Configuration** page, use <https://intune.microsoft.com/#view/Microsoft_Intune_DeviceSettings/DevicesMenu/~/configuration>.
3. On the **Policies** tab of the **Devices \| Configuration** page, select **Create** \> **New Policy**.
4. In the **Create a profile** flyout that opens, configure the following settings:
   - **Platform**: Select **macOS**
   - **Profile type**: Select **Settings catalog**.

   Select **Create**.

5. The **Create profile** wizard opens. On the **Basics** tab, configure the following settings:
   - **Name**: Enter a unique, descriptive name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**.

6. On the **Configuration settings** tab, select **Add settings**. In the **Settings picker** flyout that opens, do the following steps:
   1. In the search box, enter "allowed system extensions", and then select **Search**.
   2. In the **Browse by category** section, select the one and only search result: **System Configuration \> System Extensions**.
   3. In the new section that appears, select the check box next to **Allowed System Extensions**. A new **System configuration** section appears on the **Configuration settings** tab behind the **Settings picker** flyout. You might need to resize the browser windows to see it. Or you can close the **Settings picker** flyout.
   4. In the **Allowed Systems Extensions** section on the **Configuration settings** tab, select **+ Edit instance** the empty entry.
   5. In the **Configure instance** flyout that opens, configure the following settings:
      - **Allowed System Extensions**: Enter the following values, one per box:
        - `com.microsoft.wdav.epsext`
        - `com.microsoft.wdav.netext`
      - **Team identifier**: Enter `UBF8T346G9`.
   6. Select **Save** on the **Configure instance** flyout.

   Back on the **Configuration settings** tab, the entry is now visible.

   Select **Next**.

7. On the **Scope tags** tab, the scope tag named **Default** is select by default, but you can remove it and select other existing scope tags. When you're finished, select **Next**.

8. On the **Assignments** tab, configure the following settings:
   - **Included groups** section: Select one of the following options:
     - **Add groups**: Select one or more groups to include.
     - **Add all users**: We recommend this value.
     - **Add all devices**
   - **Excluded groups**: Select **Add groups** to specify groups to exclude.

   When you're finished on the **Assignments** tab, select **Next**.

9. On the **Review + create** tab, review the settings, select **Previous** or click on the appropriate tab to make changes, and then select **Create**.
