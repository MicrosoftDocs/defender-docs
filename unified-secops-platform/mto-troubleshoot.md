---
title: Troubleshoot issues in Microsoft Defender multitenant management
description: Learn about issues in Microsoft Defender multitenant management and how to fix or troubleshoot them.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
  - m365-security
  - highpri
  - tier1
  - usx-security
ms.topic: concept-article
ms.date: 03/31/2025
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
#customer intent: To learn how to troubleshoot issues in Microsoft Defender multitenant management.
---

# Troubleshoot multitenant management service issues

This article addresses potential issues that might arise as you use the multitenant management in Microsoft Defender. It provides guidance on how to troubleshoot these issues.

## Problem adding or removing tenants

When adding or removing tenants, you might encounter errors like the following:

:::image type="content" source="media/mto-troubleshoot/add-tenants-error-small.png" alt-text="Screenshot of error message while adding a tenant":::

:::image type="content" source="media/mto-troubleshoot/remove-tenants-error-small.png" alt-text="Screenshot of error message while removing a tenant" lightbox="media/mto-troubleshoot/remove-tenants-error.png":::

The issue is resolved by refreshing the page and trying again.

## Some tenants are missing from the list

When loading the tenant list on the Settings page, you get the following error message:

:::image type="content" source="media/mto-troubleshoot/partial-tenants-error-small.png" alt-text="Screenshot of error message where only some of the tenants are correctly loaded on the page" lightbox="media/mto-troubleshoot/partial-tenants-error.png":::

The issue is due to [conditional access policy](/entra/identity/conditional-access/overview) requiring multifactor authentication (MFA) on your Azure Resource Manager app.

To resolve this issue, add *Microsoft 365 Security and Compliance Center app (80ccca67-54bd-44ab-8625-4b79c4dc7775)* to the same conditional access policy as your Azure Resource Manager app. This mitigation applies MFA on the origin tenant when a user tries to sign in to the Microsoft Defender portal.

Here’s an example of the policy setting in the Microsoft Entra admin center.

:::image type="content" source="media/mto-troubleshoot/ca-policy-small.png" alt-text="Screenshot of a conditional access policy settings page" lightbox="media/mto-troubleshoot/ca-policy.png":::

## Content assignment failure in cross-cloud tenant management

You see the following error when assigning content to tenant groups:

:::image type="content" source="media/mto-troubleshoot/tenant-perms-error-small.png" alt-text="Screenshot of permissions error when assigning content to tenants" lightbox="media/mto-troubleshoot/tenant-perms-error.png":::

When a cross-cloud tenant is added to a tenant group and subsequently removed from cross-cloud visibility, the tenant's name is removed from the tenant list and won't be available for content management, which causes the error. This is a recognized limitation of cross-cloud tenant management and is currently under review.

## Related content

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
- [Manage tenants](mto-tenants.md)
