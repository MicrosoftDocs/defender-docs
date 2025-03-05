---
title: Change your endpoint security subscription
description: Learn about your options for managing your Defender for Business or Defender for Endpoint subscription settings. Choose between Defender for Endpoint or Defender for Business.
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: deniseb
audience: ITPro
ms.topic: overview
ms.date: 03/05/2025
ms.service: defender-business
ms.localizationpriority: medium
ms.reviewer: shlomiakirav, efratka
f1.keywords: NOCSH
ms.collection:
- M365-security-compliance
- m365initiative-defender-business
- essentials-manage
---

# Change your endpoint security subscription

[Microsoft Defender for Business](mdb-overview.md) and [Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) are endpoint security subscriptions that your organization can use to protect devices, such as computers, tablets, and phones. 

As your organization grows, you might be thinking about changing from Defender for Business to Defender for Endpoint. For example, if you have Defender for Business as part of a [Microsoft 365 Business Premium](/microsoft-365/business-premium/m365bp-overview) subscription, and you add Microsoft 365 E5 Security to your subscription, you now have Defender for Endpoint Plan 2 capabilities while retaining the Defender for Business experience. 

This article describes how to view your current license state and, if needed, change your experience from Defender for Business to Defender for Endpoint.

## Review license usage

The license usage report is estimated based on sign-in activities on the device. Defender for Endpoint Plan 2 licenses are assigned to users, and each user can have up to five concurrent, onboarded devices. To learn more about license terms, see [Microsoft Licensing](https://www.microsoft.com/licensing/default).

To reduce management overhead, there's no requirement for device-to-user mapping and assignment. Instead, the license report provides a utilization estimation that is calculated based on device usage seen across your organization. It might take up to one day for your usage report to reflect the active usage of your devices.

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) and sign in.

2. Choose **Settings** > **Endpoints** > **Licenses**.

3. Review your available and assigned licenses. The calculation is based on detected users who have accessed devices that are onboarded to Defender for Business (or Defender for Endpoint).

## Change your experience to Defender for Endpoint

If you have the Defender for Business experience, and you want to change that to the Defender for Endpoint experience, [contact support](/microsoft-365/admin/get-help-support). You should have enough active trial or paid licenses to make the switch.

After you switch to Defender for Endpoint, make sure to review your security policies and settings. To get help with Defender for Endpoint policies and settings, see [Configure Defender for Endpoint capabilities](/defender-endpoint/onboard-configure). 

To get help with Defender for Business policies and settings, see [Review and edit your security policies and settings in Defender for Business](mdb-configure-security-settings.md).

## See also

- [Licensing and product terms for Microsoft 365 subscriptions](https://www.microsoft.com/licensing/terms/productoffering/Microsoft365/MCA).
- [Manage Microsoft Defender for Endpoint Plan 1 and Plan 2 subscription settings across client devices](/defender-endpoint/defender-endpoint-subscription-settings)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
