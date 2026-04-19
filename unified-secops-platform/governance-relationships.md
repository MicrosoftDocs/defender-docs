---
title: Configure delegated access with governance relationships for multitenant organizations
description: Learn how to set up governance relationships for managing multiple tenants in Microsoft Defender.
ms.author: monaberdugo
author: mberdugo
ms.topic: how-to
ms.date: 04/14/2026

#customer-intent: As a security administrator for a managed security service provider (MSSP), I want to configure delegated access to my customers' tenants through governance relationships, so that I can manage their security operations without needing full administrative access.
---

# Configure delegated access with governance relationships for multitenant organizations (preview)

This article explains how to configure governance relationships for multitenant organizations and managed security service providers (MSSPs) to manage delegated access to customer tenants through the Microsoft Defender portal.

> [!IMPORTANT]
> This feature is currently in preview.

## Overview

Governance relationships enable governing tenants to manage security operations across multiple customer tenants with fine-grained role assignments. This capability supports multitenant organizations (MTOs) and MSSPs that need to provide security services across multiple Microsoft Entra tenants.

This is the same governance relationships model used in [Microsoft Entra ID](/entra/id-governance/tenant-governance/governance-relationships) for delegating administrative access, but extended to support Microsoft Defender XDR workloads. By configuring governance relationships for Microsoft Defender, you can assign specific security roles to groups in the governing tenant, allowing them to manage security incidents, alerts, and configurations in the governed tenant without granting full administrative access.

### Key concepts

- **Governing tenant**: The home tenant that manages access to other tenants (also called *home tenant* or *managing tenant*)
- **Governed tenant**: The customer tenant that grants access to the governing tenant (also called *target tenant* or *managed tenant*)
- **Governance relationship**: directional connection between two Microsoft Entra tenants. One tenant acts as the *governing* tenant, and the other acts as the *governed* tenant.
- **CSP**: Cloud Solution Provider - Microsoft partners who sell cloud services

## Prerequisites

Before you configure delegated access, ensure you meet the following requirements:

Licenses:

- Both tenants require at least one Microsoft Entra ID P1 license.
- Both tenants require at least one Microsoft 365 E5 license or Microsoft Sentinel enabled in Microsoft Defender.

Permissions:

- A user with the [Tenant Governance Relationship Administrator](/entra/identity/role-based-access-control/permissions-reference#tenant-governance-relationship-administrator) role in the governing tenant.
- To send an invitation from the governed tenant, the user must have the [Tenant Governance Administrator](/entra/identity/role-based-access-control/permissions-reference#tenant-governance-administrator) role.
- To assign permissions to a remote tenant group, the user must have the [User Access Administrator](/azure/role-based-access-control/built-in-roles/privileged#user-access-administrator) role in Azure RBAC or [User Administrator](/entra/identity/role-based-access-control/permissions-reference#user-administrator) role in Entra RBAC.

## Enable tenant governance settings

Before you can configure delegated access, you must enable your tenant to receive governance invitations. This setting is disabled by default.

### Enable governance invitations in Microsoft Entra Admin Center (recommended)

To enable governance invitations from the governing tenant, follow these steps:

1. Navigate to **Tenant Governance** > **Tenant Governance settings**.

1. In the **Governance invitations** section, change the setting to **Enabled**.

   :::image type="content" source="media/governance-relationships/governance-relationships.png" alt-text="Screenshot showing governance invitations enabled in tenant settings.":::

### Enable governance invitations using API

You can also configure this setting using Microsoft Graph API calls.

#### Get current settings

Use the following API call to retrieve current tenant governance settings:

```http
GET https://graph.microsoft.com/beta/directory/tenantGovernance/settings
```

#### Update settings

Use the following API call to enable governance invitations:

```http
PATCH https://graph.microsoft.com/beta/directory/tenantGovernance/settings
Content-Type: application/json

{
  "canReceiveInvitations": true
}
```

## Set up delegated access

The tenant governance setup process involves three steps: the governed tenant sends an invitation, the governing tenant creates and sends an access request, and the governed tenant approves the request.

### Step 1: Send invitation from governed tenant

The governed tenant initiates the relationship by sending an invitation to the governing tenant.

1. In the governed tenant, sign in to the Microsoft Defender portal.

1. Navigate to **System** > **Permissions** > **Delegated Access**.

1. Select **Send invitation**.

   :::image type="content" source="media/governance-relationships/send-invitation.png" alt-text="Screenshot of delegated access interface with send invitation option.":::

1. Enter the tenant ID of the governing tenant that you want to invite.

   :::image type="content" source="media/governance-relationships/tenant-id.png" alt-text="Screenshot showing where to enter the tenant ID for the invitation.":::

1. Select **Send** to send the invitation.

### Step 2: Create and send access request from governing tenant

After it receives the invitation, the governing tenant creates a relationship template that defines delegated access permissions.

1. In the governing tenant, sign in to the Microsoft Defender MTO portal.

1. Navigate to **System** > **Delegated Access**.

1. Select **Create access template**.

   :::image type="content" source="media/governance-relationships/access-template.png" alt-text="Screenshot of create access template interface.":::

1. Define the access template with the following information:

   - **Template name**: A descriptive name for this access template
   - **Microsoft Entra built-in roles**: Select one or more roles to assign
   - **Security groups**: Select security groups from your governing tenant that will receive the assigned roles

   :::image type="content" source="media/governance-relationships/define-access-template.png" alt-text="Screenshot showing fields for defining the access template." lightbox="media/governance-relationships/define-access-template.png":::

1. Select **Send relationship request**.

   :::image type="content" source="media/governance-relationships/send-request.png" alt-text="Screenshot of send relationship request option.":::

1. Select the governed tenant that invited you, then select **Submit**.

   :::image type="content" source="media/governance-relationships/submit-request.png" alt-text="Screenshot showing the governance relationships request submission.":::

### Step 3: Approve access request in governed tenant

The governed tenant administrator reviews and approves the delegated access request.

1. In the governed tenant, sign in to the Microsoft Defender portal.

1. Navigate to **System** > **Permissions** > **Microsoft XDR permissions**.

1. Review the pending access request and select **Approve** or **Reject**.

   :::image type="content" source="media/governance-relationships/approve-reject.png" alt-text="Screenshot showing options to approve or reject the access request.":::

1. After approval, you'll see a confirmation message.

After the approval is complete, users in the specified security groups receive permissions in the governed tenant based on the defined roles.

## Configure tenant governance permissions for Microsoft Sentinel

Security groups used in the relationship template are synchronized to the governed tenant as "remote tenant groups." You can assign these groups to Microsoft Sentinel roles in the governed tenant to enable multitenant management capabilities.
You can assign these groups to Azure Resource Manager (ARM) resources to enable Microsoft Sentinel management capabilities.

Assigning Microsoft Sentinel roles enables multitenant management features including:

- Alert and incident management
- Threat intelligence
- Hunting
- Content distribution
- Direct management through the Defender portal

### Assign permissions to resource group

Follow these steps to grant Microsoft Sentinel permissions to your delegated access groups.

1. In the governed tenant, sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to your resource group.

1. Select **Access Control (IAM)**.

1. Select **Add** > **Add role assignment**.

1. Select the Microsoft Sentinel role you want to assign (for example, Microsoft Sentinel Contributor).

   :::image type="content" source="media/governance-relationships/access-control.png" alt-text="Screenshot of Access Control panel showing role assignments." lightbox="media/governance-relationships/access-control.png":::

1. On the **Members** tab, under **Assign access to**, select **Remote tenant group**.

1. Select the synchronized security groups from the governing tenant.

   :::image type="content" source="media/governance-relationships/add-role-assignment.png" alt-text="Screenshot showing role assignment to a remote tenant group." lightbox="media/governance-relationships/add-role-assignment.png":::

1. Select **Review + assign** to complete the assignment.

## Troubleshooting

### Security group not displayed when creating a template

**Symptom**: Your security group doesn't appear in the list when creating a relationship template.

**Cause**: Only security groups that meet specific criteria are supported for governance relationships delegation.

**Resolution**: Ensure your security group meets the following requirements:

- SecurityEnabled property is set to true
- IsAssignableToRole property is set to true
- Not a Microsoft 365 group (unified group)

Security groups that don't meet these criteria aren't supported for governance relationships delegation.

## Related content

- [Microsoft Entra governance relationships](/entra/id-governance/tenant-governance/governance-relationships)
- [MSSP portal access](/defender-xdr/mssp-access)
