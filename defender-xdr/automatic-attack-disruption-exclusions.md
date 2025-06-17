---
title: Exclude assets from automated response in attack disruption
description: Learn more about how to exclude identities and devices from being automatically contained from automatic attack disruption.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
  - usx-security
  - usx-security
ms.topic: how-to
search.appverid: 
  - MOE150
  - MET150
ms.date: 05/12/2025
appliesto:
- Microsoft Defender XDR
---

# Exclude assets from automated responses in automatic attack disruption

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article provides information on how to exclude assets from being automatically contained by [automatic attack disruption](automatic-attack-disruption.md) in Microsoft Defender XDR.

Automatic attack disruption enables the exclusion of specific user accounts, devices, and IP addresses from automated containment actions. Once excluded, these assets won't be affected by automated actions triggered by attack disruption.

> [!CAUTION]
> Excluding assets from automated responses is not recommended. Excluding assets from automated responses can reduce the effectiveness of automatic attack disruption in protecting your environment from sophisticated, high-impact attacks.

## Prerequisites

To exclude assets from automated responses in automatic attack disruption, you must have one of the following roles assigned in either Microsoft Entra ID ([https://portal.azure.com](https://portal.azure.com)) or in the Microsoft 365 admin center ([https://admin.microsoft.com](https://admin.microsoft.com)):

- Global Administrator
- Security Administrator

## Review or change automated response exclusions for assets

To exclude assets from automated responses in automatic attack disruption, follow these steps:

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) and sign in.

2. Go to **Settings** \> **Microsoft Defender XDR**.

### Exclude user accounts

1. Under **Automated response**, select **Identities**.

2. To exclude a user account, select **Add user exclusion**. A flyout pane appears.

   :::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-identity-add-small.png" alt-text="Identities page in the automated response settings for attack disruption" lightbox="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-identity-add.png":::

3. In the flyout pane, enter the user account names in the **Select users** box and select the user accounts you want to exclude.

   :::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-identity-flyout-small.png" alt-text="Flyout pane when adding and selecting users to exclude in the automated response settings for attack disruption" lightbox="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-identity-flyout.png":::

4. Select **Exclude users** to save the exclusion.

### Exclude device groups

> [!CAUTION]
> Excluding device groups from automated responses also impacts [automated investigation and response](m365d-autoir.md) actions.

1. Under **Automated responses**, select **Devices**.

2. In the **Device groups** tab, choose a device group by selecting the checkbox next to the group name from the list to configure attack disruption automation settings.

   :::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-device-select-small.png" alt-text="Device groups tab in the automated response settings for attack disruption" lightbox="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-device-select.png":::

3. In the flyout pane, select the appropriate automation level for the device group. You can choose from any of the following automation levels appropriate for your device group:
   - **Full - remediate threats automatically**: Automatically contain devices when a threat is detected.
   - **Semi - require approval for core folders**: Automatically investigate devices when an alert is received and apply     remediation actions except to items within core system folders. Remediation actions for the core folders require approval.
   - **Semi - require approval for non-temp folders**: Automatically investigate and apply remediation to actions within temp and download folders when an alert is received. All other remediation actions require approval.
   - **Semi - require approval for all folders**: Automatically investigate devices when an alert is received. All  remediation actions require approval.
   - **No automated response**: No automated investigation or response is taken for devices in this group.

   :::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-device-flyout-small.png" alt-text="Flyout pane when configuring automation levels for a device group" lightbox="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-device-flyout.png":::

4. Select **Save** to save the automation level for the device group.

> [!IMPORTANT]
> Some information in this article relates to a prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties expressed or implied, with respect to the information provided here.

### Exclude IPs

1. Under **Automated responses**, select **Devices**.

2. In the **IPs** tab, select **Exclude IP** to exclude an IP address.

   :::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-ip-add-small.png" alt-text="IPs tab in the automated response settings for attack disruption" lightbox="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-ip-add.png":::

3. In the flyout pane, enter the IP address/IP range/IP subnet you want to exclude. You can add multiple IP addresses and IP subnets by separating them with a comma.

   :::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-ip-flyout-small.png" alt-text="Flyout pane when adding IP addresses to exclude in the automated response settings for attack disruption" lightbox="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-ip-flyout.png":::

4. Add a name and note for the exclusion. Select **Create** to save the exclusion.

### Remove exclusions

To remove an exclusion:

- Go to the **Identities** page. Select the user account you want to remove from the list and then select **Remove**.

:::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-user-remove.png" alt-text="Highlighting the removal option when removing an excluded user in the Identities page of attack disruption automation settings":::

- Go to the **Devices** page and navigate to the **IPs** tab. Select the IP address you want to remove from the list and then select **Remove exclusion**.

:::image type="content" source="/defender/media/automatic-attack-disruption/exclusions/attack-disrupt-exclude-ip-remove.png" alt-text="Highlighting the removal option when removing an excluded IP in the IP tab of attack disruption automation settings":::

- Device group exclusions can be configured in the **Device groups** tab. Select the device group you want to configure from the list and choose the appropriate exclusion from the flyout pane. Select **Save** to save the exclusion.

### Opting out of automatic attack disruption

Opting out of attack disruption can greatly increase security risk. Consider [excluding specific entities](automatic-attack-disruption-exclusions.md#review-or-change-automated-response-exclusions-for-assets) instead. 

If you must opt out of attack disruption, you can do so by opening a support case in the Microsoft Defender portal with the subject *Attack disruption opt-out*. In your request, please specify that you wish to opt out of attack disruption and include a brief explanation about your decision. This feedback helps us improve the feature and better understand customer needs. By opting out, you'll still receive alerts related to attack disruption but no automated actions are taken.


## See also

- [View details and results of automated attack disruption actions](autoad-results.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
