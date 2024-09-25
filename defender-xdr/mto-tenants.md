---
title: Manage tenants with Microsoft Defender multitenant management
description: Learn about the tenant list in Microsoft Defender multitenant management
search.appverid: met150
ms.service: defender-xdr
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - highpri
  - tier1
  - usx-security
ms.topic: conceptual
ms.date: 08/19/2024
appliesto:
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
---

# Manage tenants with Microsoft Defender multitenant management

Add or remove tenants from the settings page in Microsoft Defender multitenant management.

## View the tenants page

To view the list of tenants that appear in multitenant management, go to [Settings page](https://mto.security.microsoft.com/mtosettings) in Microsoft Defender multitenant management:

   :::image type="content" source="/defender/media/defender/mto-tenant-settings.png" alt-text="Screenshot of Microsoft Defender multitenant management" lightbox="/defender/media/defender/mto-tenant-settings.png":::

From the **Settings** page you can:

- **Add a tenant**: Select **Add tenants** > Choose the tenants to want to add > Select **Add tenant**.
- Select a tenant from the list to open the [Microsoft Defender portal](https://security.microsoft.com) for that tenant.
- **Remove a tenant**: Select the tenant you'd like to remove > select **Remove**.

## Multitenant management status indicator

The multitenant management status indicator provides information on whether data issues exist for the page you're viewing, such as data loading issues or permissions issues. The indicator appears in the bottom right corner of the page:

When no issue exists, the status indicator is a green tick:

- ![No data issues](/defender/media/defender/mto_nodata_issue.png)

When an issue exists, the status indicator shows a red warning sign:

- ![data issues](/defender/media/defender/mto-data-issues.png)

Hovering over the red warning sign displays the issues that occurred and the tenant information. By expanding each section, you see all the tenants with this issue.

- ![tenant data issues](/defender/media/defender/mto-tenantdata-issues.png)

## Related content

- [Microsoft Defender multitenant management](mto-overview.md)
- [Set up Microsoft Defender multitenant management](mto-requirements.md)
