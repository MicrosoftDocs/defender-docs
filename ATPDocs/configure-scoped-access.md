---
title: Configure scoped access for Microsoft Defender for Identity
description: Learn about working with Microsoft Defender for Identity scoped role groups.
ms.date: 05/25/2025
ms.topic: how-to
ms. reviewer: 'LiorShapiraa'
---

# Configure scoped access for Microsoft Defender for Identity

As organizations grow and their identity environments become more complex, it’s important to control who has access to which resources. Microsoft Defender for Identity scoping lets you focus monitoring on specific Active Directory domains. This helps improve efficiency by reducing noise from nonessential data and focusing on critical assets. You can also limit visibility to specific entities, so access matches each person's responsibilities. 

## Prerequisites

- Check that Microsoft Defender for Identity sensor installed. 

- Confirm the [Identity workload for URBAC](/defender-xdr/activate-defender-rbac#activate-from-the-permissions-and-roles-page) is activated. 
- Ensure you have the [Global Administrator](/entra/identity/role-based-access-control/permissions-reference) or [Security Administrator](/entra/identity/role-based-access-control/permissions-reference) role in Microsoft Entra ID to create and manage custom roles.

- Make sure Authorization permissions are configured through [URBAC](/defender-xdr/manage-rbac) to manage roles without Global Administrator or Security Administrator privileges.

## Configure scoping rules
To enable identity scoping, follow these steps:​

1. Sign in to the Microsoft Defender portal as Global Administrator or Security Administrator.
1. Navigate to Permissions > Microsoft Defender XDR >  Roles​

    :::image type="content" source="media/custom-roles/permissions-roles.png" alt-text="Screenshot showing the roles page in the Defender XDR portal":::

1. Select **Create custom role**.

    :::image type="content" source="media/custom-roles/create-custom-role.png" alt-text="Screenshot showing the create custom role button":::
1. Enter the role name and description. 
:::image type="content" source="media/custom-roles/add-role-name-and-description.png" alt-text="Add role name and description":::
1. Select Next to choose the permissions you want to assign. Permissions are organized in three different categories.
   :::image type="content" source="media/custom-roles/choose-permissions.png" alt-text="Screenshot showing the three permission types":::
1. Select Next to see the **Authorization and settings** option.
1. Choose **Select custom permissions** and under **Security settings** select either:
    - Select all permissions - users are able to create and manage roles and permissions.
    - Read-only - users can access and view roles and permissions in a read-only mode.

    :::image type="content" source="media/custom-roles/authorization-and-settings-custom-roles.png" alt-text="Screenshot showing the authorization and settings page":::
1. Select Add assignments and enter the Assignment name.
    :::image type="content" source="media/custom-roles/add-assignment.png" alt-text="Screenshot showing how to add Defender for Identity to your scoping role":::
1. Under Employees, enter individual usernames or Microsoft Entra ID groups to assign to the role.
1. Choose Microsoft Defender for Identity as the data source.
1. Select User groups (AD domains) to scope the assigned users or Microsoft Entra ID groups.
1. Select Add and submit.
1. You can edit the role at any time by selecting it from the list of custom roles and choosing **Edit**.

    :::image type="content" source="media/custom-roles/edit-custom-role.png" alt-text="Screenshot showing how to edit a custom role":::

## Known limitations

> [!NOTE]
> Custom roles apply only to new alerts and activities. Alerts and activities triggered before a custom role was created aren't retroactively tagged or filtered.
>
> Microsoft Entra ID IP alerts aren't included within scoped MDI detections.


|Defender for Identity experience |Status |
|---------|---------|
|MDI alerts and incidents (includes a user entity)     |   Available      |
|Hunting tables: AlertEvidence+Info, IdentityInfo, IdentityDirectoryEvents,  
IdentityLogonEvents, IdentityQueryEvents     |   Available      |
|User page and user global search  |   Available      |
|MDI alerts based on XDR detection platform  
(detection source is XDR and service source is MDI)     |   Available      |
|MDI alerts with no user à scoping based on Active Directory device     |  Available       |
|Health issues       |   Available      |
|Identities settings: sensors page, manual tagging, health issues notifications  |   Available      |
|Defender XDR Incident email notifications     | Unavailable      |
|Identities inventory and service accounts discovery page     |   Unavailable      |
|ISPMs and exposure management     |   Unavailable      |
|Download scheduled reports and Graph API    |   Unavailable      |
|Device and group global search and entity page     |   Unavailable      |
|Alert tuning and critical asset management   |   Unavailable      |

## Related articles
- [Microsoft Defender for Identity role groups](role-groups.md)
- [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac)
- [Create custom roles with Microsoft Defender XDR Unified RBAC](/defender-xdr/create-custom-rbac-roles)
- [Import roles to Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/import-rbac-roles)
- [Activate Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/activate-defender-rbac)

