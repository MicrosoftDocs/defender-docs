---
title: Turn on app governance in Microsoft Defender for Cloud Apps
ms.date: 04/11/2024
ms.topic: how-to
description: Get started with app governance capabilities to govern your apps in  Microsoft Defender for Cloud Apps.
---

# Turn on app governance for Microsoft Defender for Cloud Apps

This article describes how to turn on Microsoft Defender for Cloud Apps app governance.

> [!NOTE]
> By default, the Microsoft Defender for Cloud Apps instance in the US Government environments cannot connect to resources in Azure commercial and is FedRAMP compliant. However, App Governance is not FedRAMP certified. App Governance will only store and process data in secure locations within the United States and the data will only be accessible by approved Microsoft employees. 
## Prerequisites

Before you start, verify that you satisfy the following prerequisites:

- Microsoft Defender for Cloud Apps must be present in your account as either a standalone product or as part of the various [license](#licensing) packages.

  If you aren't already a Defender for Cloud Apps customer, you can [sign up for a free trial](https://www.microsoft.com/security/business/cloud-apps-defender).

- You must have [one of the appropriate roles](#roles) to turn on app governance and access it.

- Your organization's billing address must be in a region **other than** Brazil, Singapore, Latin America, South Korea, Switzerland, Norway, South Africa, Sweden or United Arab Emirates.

## Turn on app governance

If your organization satisfies the [prerequisites](#prerequisites), go to [Microsoft Defender XDR > Settings > Cloud Apps > App governance](https://security.microsoft.com/cloudapps/settings) and select **Use app governance**. For example:

:::image type="content" source="media/app-governance-get-started/app-governance-service-status2.png" alt-text="Screenshot of the App governance toggle in Microsoft Defender XDR." lightbox="media/app-governance-get-started/app-governance-service-status2.png":::

After you've signed up for app governance, you'll need to wait up to 10 hours to see and use the product.

If you're unable to see the app governance option in the settings page, it might be due to one or more of the following reasons:

- App governance isn't yet supported in your region.

- We're unable to serve you at the moment due to capacity constraints.

You can join the waitlist and provide your consent, so that we can turn on app governance for your organization automatically when app governance becomes available for you. When we turn on app governance, we'll notify you by email.

For example:

:::image type="content" source="media/app-governance-get-started/app-governance-service-status.png" alt-text="Screenshot of the App governance waitlist option." lightbox="media/app-governance-get-started/app-governance-service-status.png":::

## Licensing

App governance is available to organizations with a valid Defender for Cloud Apps license. For more information, see the [Microsoft 365 licensing datasheet](https://aka.ms/M365EnterprisePlans).

## Roles


You must have at least one of these roles to turn on app governance:

- Company Admin
- Security Admin          
- Compliance Admin  
- Compliance Data Admin
- Cloud App Security admin

The following table lists the app governance capabilities for each role.

| Role | Read the dashboard | Read all apps |Read policies | Create, update, or delete policies | Read alerts | Update alerts | Read settings | Update settings | Read Remediation | Update Remediation |
|:-------|:-----|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|
| **Company or Global Administrator** | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) |
| **Compliance Administrator** | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | |
| **Compliance Data Administrator** | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | |
| **Global Reader**  | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) |  | ![Check mark.](media\checkmark.png) |  | ![Check mark.](media\checkmark.png) |  | | |
| **Security Administrator** | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | |
| **Security Operator** | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | |
| **Security Reader**  | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) | ![Check mark.](media\checkmark.png) |  | ![Check mark.](media\checkmark.png) |  | ![Check mark.](media\checkmark.png) |  | ![Check mark.](media\checkmark.png) | |

For more information about each role, see [Administrator role permissions](/azure/active-directory/roles/permissions-reference).

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

> [!NOTE]
> App governance alerts will not flow to Microsoft Defender XDR or show up in app governance until you have provisioned both Defender for Cloud Apps and Microsoft Defender XDR by accessing their respective portals at least once.

## Next steps

[Get started with app governance in Defender for Cloud Apps](app-governance-trial-user-guide.md)

