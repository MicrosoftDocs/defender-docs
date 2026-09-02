---
title: Manage unified role-based access control in multitenant management
description: Learn how to view, create, edit, delete, and import roles for unified role-based access control (URBAC) across multiple tenants in the Microsoft Defender portal.
author: guywi-ms
ms.author: guywild
ms.collection: 
- m365-security
- highpri
- tier1
ms.topic: how-to
ms.date: 06/15/2026
appliesto: 
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
ai-usage: ai-assisted
# customer intent: To learn how to create, delete, import, and edit roles in the unified role-based access control in Microsoft Defender multitenant management.
---

# Manage unified role-based access control in multitenant management

Use the Microsoft Defender multitenant management portal to manage unified role-based access control (URBAC) across multiple tenants. You can view permissions and access for all your tenants in one place. You can also manage these permissions from a central location. This article covers how to view custom roles, create or edit roles, delete roles, and import roles from tenant workloads.

## View custom roles

In the multitenant portal, navigate to the **Permissions & roles page** by selecting **System > Permissions**.

:::image type="content" source="media/mto-urbac/urbac-main.png" alt-text="Screenshot of main Permissions and roles page":::

From this page, you can create or edit a custom role. You can also import and delete roles. Use the **Search** function to find a specific role. To narrow results, filter roles by data source, permissions category, assignee type, or tenant name.

## Create or edit a custom role (Preview)

You can create a custom role to provide flexibility and control over access to specific data. To create a custom role, follow these steps:

1. Sign in to multitenant management in Microsoft Defender, then navigate to **System > Permissions**.

2. Select **Create custom role**.

   :::image type="content" source="media/mto-urbac/urbac-create-role.png" alt-text="Screenshot highlighting the create role option":::

3. In the dropdown menu, select the tenant for which you want to create a new role. Select **Continue**.

   :::image type="content" source="media/mto-urbac/urbac-create-dropdown.png" alt-text="Screenshot of the tenant dropdown menu":::

4. In the **Basics** page, enter the name and description of the role. Select **Next**.

   :::image type="content" source="media/mto-urbac/urbac-create-basics.png" alt-text="Screenshot of the Basics page":::

5. In the **Permissions** page, select the appropriate permissions for the role.

6. A new pane opens based on the permissions you selected. Select the appropriate permissions for the role, then select **Apply**. Here's an example.

   :::image type="content" source="media/mto-urbac/urbac-create-permissions.png" alt-text="Screenshot of assigning permissions pane":::

7. Select **Next** to proceed to the next page.

8. In the **Assignments** page, select **Add assignment** or **Create assignment** to assign users and data sources.

9. In the **Add assignments** pane, enter the assignment name. Add the team members you want to assign. Select the data sources they can access and the identity scopes they need. Then select **Add**. Here's an example.

   :::image type="content" source="media/mto-urbac/urbac-create-assignment.png" alt-text="Screenshot of the options in the Add Assignments pane":::

10. Select **Next**. Review the details you provided in the **Review and finish** page. You can edit the custom role’s name and description, permissions, and assignments in this page.

11. Select **Submit** to finish creating the custom role.

To edit an existing role, select the three dots beside the role name in the Permissions and roles list, then select **Edit**.

:::image type="content" source="media/mto-urbac/urbac-edit-role.png" alt-text="Screenshot of the Edit option in the Permissions page":::

## Delete roles (Preview)

> [!WARNING]
> Deleting a role is permanent and removes all access assignments for that role. Review the selected roles carefully before you continue.

To delete roles, select one or more roles from the list. You can choose roles from different tenants. Then select **Delete roles**.

:::image type="content" source="media/mto-urbac/urbac-delete-multiple.png" alt-text="Screenshot highlighting multiple role selection for deletion":::

To delete a single role, select the three dots next to the role name. Then select **Delete**.

:::image type="content" source="media/mto-urbac/urbac-delete-option.png" alt-text="Screenshot of the Delete option in the Permissions page":::

The **Delete role** option is also available when editing a specific role.

:::image type="content" source="media/mto-urbac/urbac-delete-edit-pane.png" alt-text="Screenshot highlighting the Delete option in the Edit role pane":::

## Import roles (Preview)

You can import existing roles from a tenant’s workloads to migrate permissions and assignments. Imported roles become available in the Permissions and roles list.

To import roles, follow these steps: 

1. Navigate to **System > Permissions**.

2. Select **Import roles**.

3. In the **Import roles** pane, select the tenant from which you want to import roles in the dropdown menu. Select **Continue**.

4. In the **Workloads** page, select the workloads you want to import from. Select **Next**.

   :::image type="content" source="media/mto-urbac/urbac-import-workload.png" alt-text="Screenshot of the Workloads page in the Import role scenario":::

5. In the **Roles** page, select all or some of the roles that you want to import from the Eligible roles list. To review the permissions and assignments for a role, select the role name. Here's an example.

   :::image type="content" source="media/mto-urbac/urbac-import-review-role.png" alt-text="Screenshot of the role review pane in the Import role scenario":::

6. Review the details then select **Submit** to finish importing the roles.

To learn more about unified RBAC, see [Microsoft Defender unified role-based access control](/defender-xdr/manage-rbac).
