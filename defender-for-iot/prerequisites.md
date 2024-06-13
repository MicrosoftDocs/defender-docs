---
title: Prerequisites for Microsoft Defender for IoT in XDR Defender portal
description: This article describes prerequisites of Microsoft Defender for IoT in XDR Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: get-started
---

# Prerequisites for Defender for IoT in the Defender portal

[Items to include in this and other articles]
Passive or active discovery using your MDE

Instructions on how to get started

Establishing site-based RBAC (Role-Based Access Control)

## Trail set up

[If this article includes the trial license keep this intro, if the license is in the getting started article this should be rewritten - LW]
This article describes how to set up a trial license for Microsoft Defender for IoT, for customers who don't have a Microsoft tenant at all [ is this correct?]. Use Defender for IoT to monitor network traffic across your OT networks.

A trial supports a **Large** site size with up to 1,000 devices, and lasts for 90 days. You might want to use this trial [ with a [virtual sensor](tutorial-onboarding.md) or on-premises sensors  - REMOVE] with your existing OT devices to monitor traffic, analyze data, generate alerts, understand network risks and vulnerabilities, and more.

For more information, see [Free trial](billing.md#free-trial). [REMOVE this just repeats the same information and goes around and around. Should any of this be rewritten]

## Prerequisites

Before you start, you need:

1. An email address to be used as the contact for your new Microsoft Tenant
1. A Global [or Billing - ADD?] Admin permissions (Entra ID role on the tenant) [do we want this link?  [Entra](entra/identity/role-based-access-control/permissions-reference.md#global-administrator) ] <!--1. A Microsoft 365 tenant, with access to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) as Global or Billing admin.-->
    For more information, see [Buy or remove Microsoft 365 licenses for a subscription](/microsoft-365/commerce/licenses/buy-licenses) and [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).
1. Credit card details for your new [Azure - REMOVE] subscription, although you aren't charged until you switch from the **Free Trial** to the **Pay-As-You-Go** plan
1. An understanding of your site size. For more information, see [Calculate devices in your network](best-practices/plan-prepare-deploy.md#calculate-devices-in-your-network). [waiting for update to this from Belle [link to here](get-started.md#calculate-number-of-devices)]

This article is relevant for commercial Defender for IoT customers. If you're a government customer, contact your Microsoft sales representative for more information.
<!-- I have also copied this to the getting started article, which is where I think it belongs can be deleted from here?? Limor-->
## Add a trial license

This procedure describes how to add a trial license for Defender for IoT [to your Azure subscription - CHANGE to the Defender portal?]. One trial license is available per tenant.

To add a trial license with a new tenant, we recommend that you use the Trial wizard. If you already have a tenant, use the Microsoft 365 Marketplace to add a trial license to your tenant.
<!-- Limor, we can remove the tabs and present as two options? -->
# [Add a trial with the Trial wizard](#tab/wizard)

**To add a trial license with a new tenant**:

1. In a browser, open the [Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial wizard](https://signup.microsoft.com/get-started/signup?products=d2bdd05f-4856-4569-8474-2f9ec298923b).

1. In the **Email** box, enter the email address you want to associate with the trial license, and select **Next**.

1. Confirm that the email address is correct by selecting **Set up account**.

1. In the **Tell us about yourself** page, enter your details, and then select **Next**.

1. Select whether you want the confirmation message to be sent to you via SMS or a phone call. Verify your phone number, and then select **Send verification code**.

1. After receiving the code, enter it in the **Enter your verification code** box.

1. In the **How you'll sign in** page, enter a username and password and select **Next**.

1. In the **Confirmation details** page, note your order number and username, and then select **Start using Microsoft Defender for IoT - OT Site License (1000 max devices per site) Trial** button to continue. We recommend that you copy your full username to the clipboard as you need it to access the Azure portal.

# [Add a trial from the Microsoft 365 Marketplace](#tab/marketplace)

**To add a trial license with an existing tenant**:

1. Go to the [Microsoft 365 admin center](https://portal.office.com/AdminPortal/Home#/catalog) **Billing > Purchase services**. If you don't have this option, select **Marketplace** instead.

1. Search for **Microsoft Defender for IoT** and locate the **Microsoft Defender for IoT - OT site license - Trial Trial** item.

1. Select **Details** > **Start free trial** > **Try now** to start the trial.

For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

---

Use the Microsoft 365 admin center manage your users, billing details, and more. For more information, see the [Microsoft 365 admin center help](/microsoft-365/admin/).

## Permissions

## Supported protocols - Mia

## Next steps

> [!div class="step-by-step"]
> [Defender for IoT OT deployment path »](/ot-deploy/ot-deploy-path.md)
