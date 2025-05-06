---
title: Manage unified role-based access control in multitenant management
description: Overview of how to manage the unified role-based access control multitenant management in the Microsoft Defender portal.
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
ms.topic: concept-article
ms.date: 05/12/2025
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
# customer intent: To learn about unified role-based access control in Microsoft Defender multitenant management.
---

# Manage unified role-based access control in multitenant management

> [!IMPORTANT]
> Some information in this article relates to a prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

You can now view and manage user permissions across multiple tenants in multitenant management. This capability provides a comprehensive view of permissions and access for your tenants. It also provides a centralized administration to manage these permissions. 

The multitenant management portal offers an aggregated view of all unified role-based access (URBAC) roles. Navigate to the page through **System > Permissions**.

You can create or edit a custom role, import and delete roles, and search for a specific role using the Search function from this page. You can also Filter the roles according to assigned data sources, permissions category, assignee type, and tenant name.

## Create or edit a custom role

You can create a custom role to provide flexibility and control over access to specific data. To create a custom role, follow these steps:

1. Sign in to multitenant management in Microsoft Defender, then navigate to **System > Permissions**.

2. Select **Create custom role**.

3. In the dropdown menu, select the tenant for which you want to create a new role. Select **Continue**.

4. In the **Basics** page, enter the name and description of the role. Select **Next**.

5. In the **Permissions** page, select the appropriate permissions for the role.

6. A new pane opens based on the permisssions you selected. Select the appropriate permissions for the role, then select **Apply**. Here's an example.

7. Select **Next** to proceed to the next page.

8. In the **Assignments** page, select **Add assignment** to assign users and data sources.

9. In the **Add assignments** pane, add the assignment name and team members to be assigned, and identify the data sources that they can access. Then select **Add**. Here’s an example.

10. Select **Next**. Review the details you provided in the **Review and finish** page. You can edit the custom role’s name and description, permissions, and assignments in this page.

11. Select **Submit** to finish creating the custom role.

To edit an existing role, select the three dots beside the role name in the Permissions and roles list, then select **Edit**.

## Delete roles

You can delete roles by selecting a role from the list and then selecting **Delete roles**. You can select multiple roles from various tenants to delete. 

You can also delete a role by selecting the three dots beside the role name in the Permissions and roles list then selecting **Delete**.

The **Delete role** option is also available when editing a specific role.

## Import roles

You can import existing roles from a tenant’s workloads to migrate permissions and assignments.  

To import roles, follow these steps: 

1. Navigate to **System > Permissions**.

2. Select **Import roles**.

3. In the **Import roles** pane, select the tenant from which you want to import roles in the dropdown menu. Select **Continue**.

4. In the **Workloads** page, select the workloads you want to import from. Select **Next**.

5. In the **Roles** page, select all or some of the roles that you want to import from the Eligible roles list. To review the permissions and assignments for a role, select the role name.

6. Review the details then select **Submit** to finish importing the roles.

Imported roles are available in the Permissions and roles list.

To learn more about unified RBAC, see [Microsoft Defender XDR unified role-based access control](/defender-xdr/manage-rbac).