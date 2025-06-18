---
title: View and manage cases across multiple tenants in the Microsoft Defender multitenant portal
description: Learn how to use the Microsoft Defender multitenant portal to manage cases across multiple tenants.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: yelevin
author: yelevin
ms.localizationpriority: medium
ms.date: 05/07/2025
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: conceptual

# customer intent: As an analyst or an engineer in a security operations center, I want to learn how to use the multi-tenant capabilities of the case management tools available in the Microsoft Defender portal. This knowledge will help me unify security tickets and increase visibility across multi-tenant environments, both hybrid and multicloud; and disrupt attacks on identities, endpoints, email, cloud apps, and data in real time.
---

# View and manage cases across multiple tenants in the Microsoft Defender multitenant portal

Case management in the [**Microsoft Defender multitenant portal**](https://mto.security.microsoft.com) allows you to view and manage security operations (SecOps) cases from multiple tenants in a single queue. Case management supports a number of use cases:

- Define your own case workflow with custom status values
- Assign tasks to collaborators and configure due dates
- Handle escalations and complex cases by linking multiple incidents to a case
- Manage access to your cases using RBAC
- Manage cases from multiple tenants

## View cases in the multitenant portal

The cases experience in the multitenant portal is just like [that in the regular, single-tenant portal](cases-overview.md), but with a few extra features:

- The **Cases** queue contains columns for **Tenant** and **Tenant ID**, so you can see which tenant each case belongs to.

- If you are managing many tenants, you can search, sort, or filter the case queue by tenant. The existing sort, filter, and search capabilities also work across multiple tenants in one combined view.

- Role-based access control (RBAC) settings are applied at the tenant level, so you only see cases from the tenants you have access to.

:::image type="content" source="media/mto-manage-cases/mto-cases-queue.png" alt-text="Screenshot of cases queue in Microsoft Defender multitenant portal.":::

For more information, see [Manage security operations cases natively in the Microsoft Defender portal](cases-overview.md).

## Manage a case in the multitenant portal

Manage cases from multiple tenants at a glance in the multitenant case queue.

- To see a preview flyout panel of a case's details, select the row of the desired case.
- To open a case's full details page, select the case's name.

Navigate effortlessly between cases in different tenants without leaving the multitenant queue or losing context.

For more information on managing cases, see [Manage security operations cases natively in the Microsoft Defender portal](cases-overview.md)

## Create a case in the multitenant portal

1. On the **Cases** page in the multitenant portal, select **+ Create**.

1. In the **Create case** pane, select the desired tenant from the drop-down at the top, then proceed as in the single-tenant experience.

:::image type="content" source="media/mto-manage-cases/mto-create-case.png" alt-text="Screenshot of case queue.":::

The maximum allowed per tenant is 100,000 cases.


## Related content

- [Manage security operations cases natively in the Microsoft Defender portal](cases-overview.md)
- [Microsoft Defender multitenant management](mto-overview.md)
- [Microsoft Sentinel blog - Improve SecOps collaboration with case management](https://techcommunity.microsoft.com/blog/MicrosoftSentinelBlog/improve-secops-collaboration-with-case-management/4369044)
- [Microsoft Sentinel in the Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)
