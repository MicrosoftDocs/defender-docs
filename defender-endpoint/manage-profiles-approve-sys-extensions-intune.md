---
title: Manage profiles and approve extensions using Intune
description: Manage profiles and approve extensions using Intune for Microsoft Defender for Endpoint to work properly on macOS.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.topic: how-to
ms.date: 01/16/2026
---

# Manage profiles and approve extensions using Intune

> [!NOTE]
> Intune policy support for macOS extensions was deprecated in the August 2024 service release (2048). Existing Intune policies with macOS extensions continue to work, but you can't create new policies with macOS extensions in Intune.
>
> Instead, use the settings catalog to create new Intune policies for macOS that configure the System Extension payload. For more information, see [Use the Intune settings catalog to configure settings](/intune/intune-service/configuration/settings-catalog).

This article describes how to use the Intune settings catalog to approve the required extensions for macOS policies.

## Intune system extensions policy

Do the following procedures to approve the required system extensions using the settings catalog.

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

   When you're finished on the **Create profile** tab, select **Next**.

6. On the **Configuration settings** tab, select **Add settings**.

   In the **Settings picker** flyout that opens, do the following steps:

   1. In the search box, enter "allowed system", and then select **Search**.
   2. In the **Browse by category** section, select the one and only **System Configuration \> System Extensions** result.
   3. In the new subcategory section that appears, select the check boxes next to both results:
      - **Allowed System Extension Types**
      - **Allowed System Extensions**

      A new **System configuration** \> **System Extensions** section with these subsections appears on the **Configuration settings** tab behind the **Settings picker** flyout. You might need to resize the browser window to see them. Or you can close the **Settings picker** flyout.

      :::image type="content" source="media/intune-macos-settings-catalog-select.png" alt-text="Screenshot of the Configuration settings tab of the Create profile wizard with Allowed System Extension Types and Allowed System Extensions selected." lightbox="media/intune-macos-settings-catalog-select.png":::

   4. On the **Configuration settings** tab in the **System configuration** \> **System Extensions** section, configure the following settings:
      - **Allowed System Extensions** subsection:
        1. Select **+ Edit instance** in the empty entry row.
        2. In the **Configure instance** flyout that opens, configure the following settings:
           - **Allowed System Extensions** (bundle identifiers): Enter the following values, one per box:
             - `com.microsoft.wdav.epsext`
             - `com.microsoft.wdav.netext`
           - **Team identifier**: Enter `UBF8T346G9`.
        3. Select **Save** on the **Configure instance** flyout.

        :::image type="content" source="media/intune-macos-settings-catalog-allowed-system-extensions.png" alt-text="Screenshot of the Configure instance flyout with the required Allowed system extensions values entered." lightbox="media/intune-macos-settings-catalog-allowed-system-extensions.png":::

      - **Allowed System Extension Types** subsection:
        1. Select **+ Edit instance** in the empty entry row.
        2. In the **Configure instance** flyout that opens, configure the following settings:
           - **Allowed System Extension Types**: Enter the following values, one per box:
             - `Network`
             - `EndpointSecurity`
           - **Team identifier**: Enter `UBF8T346G9`.
        3. Select **Save** on the **Configure instance** flyout.

        :::image type="content" source="media/intune-macos-settings-catalog-allowed-system-extension-types.png" alt-text="Screenshot of the Configure instance flyout with the required Allowed system extension types values entered." lightbox="media/intune-macos-settings-catalog-allowed-system-extension-types.png":::

   The configured **Allowed System Extensions** and **Allowed System Extension Types** entries are available on the **Configuration settings** tab.

   :::image type="content" source="media/intune-macos-settings-catalog-configured-settings.png" alt-text="Screenshot of the completed Configuration settings tab of the Create profile wizard with the required values for Allowed System Extension Types and Allowed System Extensions." lightbox="media/intune-macos-settings-catalog-configured-settings.png":::

   When you're finished on the **Configuration settings** tab, select **Next**.

7. On the **Scope tags** tab, the scope tag named **Default** is select by default, but you can remove it and select other existing [scope tags](/intune/intune-service/fundamentals/scope-tags).

   When you're finished on the **Scope tags** tab, select **Next**.

8. On the **Assignments** tab, configure the following settings:
   - **Included groups** section: Select one of the following options:
     - **Add groups**: Select one or more groups to include.
     - **Add all users**
     - **Add all devices**
   - **Excluded groups**: Select **Add groups** to specify groups to exclude.

   When you're finished on the **Assignments** tab, select **Next**.

9. On the **Review + create** tab, review the settings, select **Previous** or click on the appropriate tab to make changes.

   When you're finished on the **Review + create** tab, select **Create**.
