---
title: Get Microsoft Defender for Business
description: Find out how to get Microsoft Defender for Business, endpoint protection for small and medium sized businesses.
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: bagol
audience: Admin
ms.topic: overview
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 08/19/2025
ms.reviewer: efratka
f1.keywords: NOCSH
ms.collection:
- SMB
- m365-security
- tier1
---

# Get Microsoft Defender for Business

This article describes how to get Microsoft Defender for Business.

Defender for Business is an endpoint security solution designed especially for small and medium-sized businesses with up to 300 users. For more information, see [Microsoft Defender for Business](mdb-overview.md).

:::image type="content" source="media/mdb-setup-step1.png" alt-text="Visual aid depicting step 1 - Get Defender for Business.":::

## How to get Microsoft Defender for Business

To get Defender for Business, you can choose from the following options:

- Work with a Microsoft partner who can help you get everything set up and configured.
- Try or buy the standalone version of Defender for Business.
- Get Microsoft 365 Business Premium, which includes Defender for Business.

Use the following tabs to learn more about each option.

## [Work with a Microsoft partner](#tab/findpartner)

Microsoft maintains a list of solution providers who are authorized to sell offerings, including Microsoft 365 Business Premium and Microsoft Defender for Business. To work with a Microsoft partner, use the following steps to find a solution provider in your area:

1. Open the **Connect with partners** page at <https://appsource.microsoft.com/marketplace/partner-dir>.

2. In the **Browse partners** pane, specify appropriate search criteria. For example:

   - Your location.
   - **Microsoft customer size**
   - **Solution category**: For example, **Security** and/or **Threat Protection**.

   - **Services**: For example:
     - **Resellers** \> **Licensing**
     - **Resellers** \> **Managed Services (MSP)**

   As soon as you select one or more criteria, the list of partners is filtered.

3. Review the results. Select a provider to learn more about their expertise and the services they provide.

## [Get Defender for Business (standalone)](#tab/getmdb)

Defender for Business provides advanced security protection for devices in eligible Microsoft 365, Office 365, and non-Microsoft organizations. For more information, see [What is Microsoft Defender for Business?](mdb-overview.md)?

1. Go to the [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business) web page, and select an option to try or buy Defender for Business. Fill in the requested information.

   If you start a trial, look for the acceptance email that contains your promo code and a link to sign in. And be sure to see the [Trial user guide for Defender for Business](trial-playbook-defender-business.md).

2. Go to the Microsoft Defender portal at <https://security.microsoft.com> and sign in using your existing work or school account, or follow the prompts to create a new account.

3. In the Microsoft Defender portal, go to **Assets** \> **Devices**. Or, to go directly to the **Devices** page, use xxxx.

   This action initiates the provisioning of Defender for Business for your organization. You know this process started when you see the following message:

   > Hang on! We're preparing new spaces for your data and connecting them.

   It might take a few hours for your organization to finish provisioning before you can onboard devices or complete the setup and configuration process.

> [!NOTE]
> If you have Microsoft 365 Business Premium and you haven't set it up yet, see [What is Microsoft Defender for Business?](/microsoft-365/business-premium/m365bp-overview). This guidance walks you through how to set up and configure all of your productivity and security capabilities, including Defender for Business.

## [Get Microsoft 365 Business Premium](#tab/getpremium)

Microsoft 365 Business Premium includes Defender for Business, Microsoft Defender for Office 365 Plan 1, and Microsoft 365 Apps (formerly known as Office apps). For more information, see [Why should I choose Microsoft 365 Business Premium?](/microsoft-365/admin/security-and-compliance/m365bp-security-benefits).

1. Go to one of the following locations:
   - The [Microsoft 365 Business Premium product page](https://www.microsoft.com/microsoft-365/business/microsoft-365-business-premium?activetab=pivot%3aoverviewtab).
   - **Microsoft 365 Business Premium** on the [Microsoft 365 Products site](https://www.aka.ms/office365signup).

2. Choose to try or buy Microsoft 365 Business. For more information, see [Try or buy a Microsoft 365 for business subscription](/microsoft-365/commerce/try-or-buy-microsoft-365).

3. After you sign up for Microsoft 365 Business Premium, you receive an email with a link to sign in and get started. Proceed to [Set up Microsoft 365 Business Premium](/microsoft-365/business-premium/m365-business-premium-setup).

4. In the Microsoft Defender portal, go to **Assets** \> **Devices**. Or, to go directly to the **Devices** page, use xxxx.

   This action initiates the provisioning of Defender for Business for your organization.

5. Follow the guidance in [Microsoft 365 for business security best practices](/microsoft-365/admin/security-and-compliance/m365b-security-best-practices) to set up your security capabilities.

> [!IMPORTANT]
> Be sure to complete all the steps described in [What is Microsoft Defender for Business?](/microsoft-365/business-premium/m365bp-overview).

---

## How to get Microsoft Defender for Business servers

Microsoft Defender for Business servers is an add-on to Defender for Business that enables you to secure server operating systems with the same protection as client devices.

> [!TIP]
>
> - To add Microsoft Defender for Business servers licenses, you need at least one paid license of [Defender for Business](mdb-overview.md) (standalone) or [Microsoft 365 Business Premium](/microsoft-365/business-premium/m365bp-overview).
> - You can add a maximum of 60 Microsoft Defender for Business servers licenses per subscription to Microsoft 365 Business Premium or Defender for Business.
> - Instead of Microsoft Defender for Business servers, you can use [Microsoft Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/plan-defender-for-servers).

1. In the Microsoft 365 admin center at <https://admin.microsoft.com>, go to **Billing** \> **Purchase services**. Or, to go directly to the **Purchase services** page, use <https://admin.microsoft.com/Adminportal/Home#/catalog>.

2. On the **Purchase services** page, find and select **Microsoft Defender for Business servers**.
   - You need one Microsoft Defender for Business servers license for each instance of Windows Server or Linux.
   - You don't assign the license to users or devices.

3. Review the information, and complete the purchase process.

## Portals you use for setup and management

When you use Defender for Business, you work with the following portals:

- The Microsoft 365 admin center at <https://admin.microsoft.com>.
- The Microsoft Defender portal at <https://security.microsoft.com>.
- The Microsoft Intune admin center at <https://intune.microsoft.com>.

The following table summarizes these portals and how you use them.

|Portal|Tasks|
|---|---|
|Microsoft 365 admin center|<ul><li>Activate your trial and sign in for the first time.</li><li>Assign user licenses.</li><li>View your products and services.</li><li>Complete setup tasks for your Microsoft 365 subscription.</li></ul> <br/> For more information, see [Overview of the Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview).|
|Defender portal|<ul><li>Set up and configure Defender for Business.</li><li>Monitor your devices and threat detections</li><li>View your devices and device protection policies.</li><li>View detected threats and take action.</li><li>View security recommendations and manage your security settings.</li></ul> <br/> For more information, see [Get started using the Microsoft Defender portal](mdb-get-started.md).|
|Intune admin center|<ul><li>Onboard iOS and Android devices.</li><li>Configure certain capabilities, such as [attack surface reduction rules](mdb-asr.md).</li></ul> <br/> For more information about Intune, see [Microsoft Intune securely manages identities, manages apps, and manages devices](/intune/intune-service/fundamentals/what-is-intune).|

## Next step

- [Assign administrator roles](/microsoft-365/admin/add-users/assign-admin-roles)

- Proceed to [Step 2: Add users and assign licenses in Microsoft Defender for Business](mdb-add-users.md).
