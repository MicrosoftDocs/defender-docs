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
ms.topic: conceptual
search.appverid: 
  - MOE150
  - MET150
ms.date: 02/03/2025
appliesto:
- Microsoft Defender XDR
---

# Exclude assets from automated responses in automatic attack disruption

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article provides information on how to exclude assets from being automatically contained by [automatic attack disruption](automatic-attack-disruption.md) in Microsoft Defender XDR.

Automatic attack disruption enables the exclusion of specific user accounts, devices, and IPs from automated containment actions. Once excluded, these assets won't be affected by automated actions triggered by attack disruption.

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

### Exclude users

1. Under **Automated responses**, select **Identities**.

2. To exclude a user account, select **Add user exclusion**. 

[INSERT IMAGE]

3. [Need instructions and screenshots if there's a flyout pane for excluding users]

> [!NOTE]
> Accounts added to this list won't be suspended in all supported attack types like business email compromise (BEC) and human-operated ransomware.

### Exclude devices

1. Under **Automated responses**, select **Devices**.

2. In the **Device groups** tab, select **Exclude device group** to exclude a device group. 

[INSERT IMAGE]

3. [Need instructions and screenshots if there's a flyout pane for excluding devices]

> [!NOTE]
> Device groups added to this list won't be suspended in all supported attack types like business email compromise (BEC) and human-operated ransomware.

> [!IMPORTANT]
> Some information in this article relates to a prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties expressed or implied, with respect to the information provided here.

### Exclude IPs

1. Under **Automated responses**, select **Devices**.

2. In the **IPs** tab, select **Exclude IP** to exclude an IP address.

3. In the flyout pane, enter the IP address or IP range you want to exclude. Add a name and note for the exclusion. Select **Create** to save the exclusion.

> [!TIP]
> You can add IP addresses and IP subnets in the exclusions. You can also add multiple IP addresses and IP subnets by separating them with a comma.

## Remove exclusions

To remove an exclusion, go to the **Identities**, **Devices**, or **IPs** tab. Select the asset you want to remove from the list, and then select **Remove exclusion**.

[INSERT IMAGE]

## See also

- [View details and results of automated attack disruption actions](autoad-results.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]