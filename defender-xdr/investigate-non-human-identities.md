---
title: Non-human identities in Microsoft Defender (Preview)
description: Learn about non-human identities in Microsoft Defender, including OAuth apps, service accounts, and SaaS apps. Understand identity types and where to investigate them.
#customer intent: As a security analyst using Microsoft Defender, I want to understand how to investigate non-human identities so that I can assess risk, understand permissions, and identify potential security issues with OAuth apps and service accounts.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 03/17/2026
ms.topic: concept-article
ms.service: microsoft-defender-for-identity
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted
---

# Non-human identities in Microsoft Defender (Preview)

Non-human identities are accounts and applications that operate without direct human interaction. In Microsoft Defender, non-human identities include OAuth apps, service accounts, and SaaS apps. These identities often have elevated privileges and access to sensitive resources, which makes them a priority for security monitoring.

You can view and investigate non-human identities from the [Identity inventory](/defender-for-identity/identity-inventory) in the Microsoft Defender portal.

:::image type="content" source="media/investigate-nonhuman-identities/nonhuman-identites.png" alt-text="Screenshot that shows the non-human identities page in the Defender portal.":::

## Types of non-human identities

Microsoft Defender organizes non-human identities into the following categories, each shown as a tab in the identity inventory:

- **Entra ID**: OAuth apps registered in Microsoft Entra ID. These apps authenticate using OAuth and access resources through Microsoft Graph and other APIs.
- **Active Directory**: Service accounts from on-premises Active Directory. These specialized accounts run applications, services, and automated tasks, and often have elevated privileges.
- **Google Workspace**: OAuth apps connected through Google Workspace. Users authorize these apps, which have varying levels of access to Google Workspace resources.
- **Salesforce**: OAuth apps connected through Salesforce. Users authorize these apps to access Salesforce data and resources.

## Investigate identity details

Each identity type shows different columns, filters, and detail tabs in the inventory. For information about inventory fields and identity details, see the following articles:

- **Entra ID, Google Workspace, and Salesforce**: These identity types are OAuth apps. For inventory columns, filtering options, and identity details, see [View your app details with app governance](/defender-cloud-apps/app-governance-visibility-insights-view-apps).
- **Active Directory**: Active Directory service accounts are managed through Defender for Identity. For inventory columns, connections, and classification rules, see [Investigate and protect Service Accounts](/defender-for-identity/service-account-discovery).

## Related content

- [View the identity inventory](/defender-for-identity/identity-inventory)
- [Investigate a human identity](/defender-xdr/investigate-users)
- [Investigate and protect Service Accounts](/defender-for-identity/service-account-discovery)
- [View your app details with app governance](/defender-cloud-apps/app-governance-visibility-insights-view-apps)
