---
title: Advanced hunting in Microsoft Defender multitenant management
description: Learn about advanced hunting in Microsoft Defender multitenant management
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

# Advanced hunting in Microsoft Defender multitenant management

Advanced hunting in Microsoft Defender multitenant management allows you to proactively hunt for intrusion attempts and breach activity in email, data, devices, and accounts across multiple tenants at the same time. If you have tenants with a Microsoft Sentinel workspace onboarded to the Microsoft unified security operations platform, search for security information and event management (SIEM) data together with extended detection and response (XDR) data across multiple tenants. 

## Run cross-tenant queries

In multitenant management, you can use any of the queries you currently have access to. They're filtered by tenant in the **Queries** tab. Select a tenant to view the queries available under each one.

Once you load the query in the query editor, you can then specify the scope of the query by tenant by selecting **Tenant scope**:

   :::image type="content" source="/defender/media/defender/mto-cross-tenants-query.png" alt-text="Screenshot of the Microsoft Defender XDR cross tenants advanced hunting query page" lightbox="/defender/media/defender/mto-cross-tenants-query.png":::

This action opens a side pane from which you can specify the tenants to include in the query:

   :::image type="content" source="/defender/media/defender/mto-cross-tenants-sidepane.png" alt-text="Screenshot of the Microsoft Defender XDR cross tenants advanced hunting query side pane scope" lightbox="/defender/media/defender/mto-cross-tenants-sidepane.png":::

Select the tenants you want to include in your query. Select **Apply**, then **Run query**.

The query results contain the tenant ID:

   :::image type="content" source="/defender/media/defender/mto-cross-tenants-query-tenant-id.png" alt-text="Screenshot of the Microsoft Defender XDR ross tenants advanced hunting query scope column" lightbox="/defender/media/defender/mto-cross-tenants-query-tenant-id.png":::

To learn more about advanced hunting in Microsoft Defender XDR, read [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](advanced-hunting-overview.md).

## Custom detection rules

Likewise, you can manage custom detection rules from multiple tenants in the custom detection rules page.

### View custom detection rules by tenant

1. To view custom detection rules, go to the [Custom detection rules page](https://mto.security.microsoft.com/v2/custom_detection) in Microsoft Defender multitenant management.
2. View the **Tenant name** column to see which tenant the detection rule comes from:

   :::image type="content" source="/defender/media/defender/mto-custom-detection-tenant-name.png" alt-text="Screenshot of the Microsoft Defender XDR multi-tenant custom detection page" lightbox="/defender/media/defender/mto-custom-detection-tenant-name.png":::

To view only a specific tenant's custom detection rules, select **Filter**, choose the tenant or tenants and select **Apply**.

To read more about custom detection rules, read [Custom detections overview](custom-detections-overview.md).

### Manage custom detection rules

You can **Run**, **Turn off**, and **Delete** detection rules from Microsoft Defender multitenant management.

To manage detection rules:

1. Go to the [Custom detection rules page](https://mto.security.microsoft.com/v2/custom_detection) in Microsoft Defender multitenant management
2. Choose the detection rule you want to manage

When you select a single detection rule, a flyout panel opens with the detection rule details:

   :::image type="content" source="/defender/media/defender/custom-detection-rule-details.png" alt-text="Screenshot of the Microsoft Defender XDR custom detection rule details page" lightbox="/defender/media/defender/custom-detection-rule-details.png":::

Select **Open detection rules** to view this rule in a new tab for the specific tenant in the [Microsoft Defender portal](https://security.microsoft.com). To learn more, see [Custom detection rules](./custom-detection-rules.md).

## Related content

- [Set up Microsoft Defender multitenant management](mto-requirements.md)
- [Connect Microsoft Sentinel to Microsoft Defender XDR](/unified-secops-platform/microsoft-sentinel-onboard)
- [View and manage incidents and alerts](mto-incidents-alerts.md)