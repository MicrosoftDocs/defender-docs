---
title: Configure delegated access with GDAP for multitenant organizations
description: Learn how to set up granular delegated admin privileges (GDAP) for managing multiple tenants in Microsoft Defender.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.topic: how-to
ms.date: 11/19/2024
---

# Configure delegated access with GDAP for multitenant organizations (preview)

This article explains how to configure granular delegated admin privileges (GDAP) for multitenant organizations and managed security service providers (MSSPs) to manage delegated access to customer tenants through the Microsoft Defender portal.

> [!IMPORTANT]
> This feature is currently in preview.

## Overview

GDAP (Granular Delegated Admin Privileges) enables governing tenants to manage security operations across multiple customer tenants with fine-grained role assignments. This capability supports multitenant organizations (MTOs) and MSSPs that need to provide security services across multiple Microsoft Entra tenants.

### Key concepts

- **Governing tenant**: The home tenant that manages access to other tenants (also called "home tenant" or "managing tenant")
- **Governed tenant**: The customer tenant that grants access to the governing tenant (also called "target tenant" or "managed tenant")
- **GDAP**: Granular Delegated Admin Privileges - a permission model that allows delegated access with specific role assignments
- **CSP**: Cloud Solution Provider - Microsoft partners who sell cloud services

## Prerequisites

Before you configure delegated access, ensure you meet the following requirements:

- Both tenants require at least one Microsoft Entra ID P1 license.
- Both tenants require at least one Microsoft 365 E3/E5 license or Microsoft Sentinel enabled in Microsoft Defender.
- Both tenants need access to Microsoft Defender XDR. Validate access by confirming you can view incidents in the portal.
- A user with the Global Administrator role in the governing tenant.
- A user with the Global Administrator role in the governed tenant.
- Governance relationships enabled in the governing tenant.

## Enable tenant governance settings

Before establishing delegated access, you must enable the ability to receive governance invitations in your tenant. This setting is disabled by default.

### Enable governance invitations in Entra Admin Center (recommended)

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com).

1. Navigate to **Tenant Governance** > **Tenant Governance settings**.

1. In the **Governance invitations** section, change the setting to **Enabled**.

   :::image type="content" source="media/multitenant-governance/governance-relationships.png" alt-text="Screenshot showing governance invitations enabled in tenant settings.":::

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

The GDAP setup process involves three steps: the governed tenant sends an invitation, the governing tenant creates and sends an access request, and the governed tenant approves the request.

### Step 1: Send invitation from governed tenant

The governed tenant initiates the relationship by sending an invitation to the governing tenant. This step is required for non-CSP scenarios to prevent unauthorized access.

1. In the governed tenant, sign in to the Microsoft Defender portal.

1. Navigate to **System** > **Permissions** > **Delegated Access**.

1. Select **Send invitation**.

   :::image type="content" source="media/multitenant-governance/send-invitation.png" alt-text="Screenshot of delegated access interface with send invitation option.":::

1. Enter the tenant ID of the governing tenant that you want to invite.

   :::image type="content" source="media/multitenant-governance/tenant-id.png" alt-text="Screenshot showing where to enter the tenant ID for the invitation.":::

1. Select **Send** to send the invitation.

### Step 2: Create and send access request from governing tenant

After receiving the invitation, the governing tenant creates a relationship template that defines delegated access permissions.

1. In the governing tenant, sign in to the Microsoft Defender portal.

1. Navigate to **System** > **Permissions** > **Delegated Access**.

1. Select **Create relationship template**.

   :::image type="content" source="media/multitenant-governance/access-template.png" alt-text="Screenshot of create access template interface.":::

1. Define the relationship template with the following information:

   - **Template name**: A descriptive name for this access template
   - **Microsoft Entra built-in roles**: Select one or more roles to assign
   - **Security groups**: Select security groups from your governing tenant that will receive the assigned roles

   :::image type="content" source="media/multitenant-governance/define-access-template.png" alt-text="Screenshot showing fields for defining the relationship template." lightbox="media/multitenant-governance/define-access-template.png":::

1. Select **Send relationship request**.

   :::image type="content" source="media/multitenant-governance/send-request.png" alt-text="Screenshot of send relationship request option.":::

1. Select the governed tenant that invited you, then select **Submit**.

   :::image type="content" source="media/multitenant-governance/submit-request.png" alt-text="Screenshot showing the GDAP request submission.":::

### Step 3: Approve access request in governed tenant

The governed tenant administrator reviews and approves the delegated access request.

1. In the governed tenant, sign in to the Microsoft Defender portal.

1. Navigate to **System** > **Permissions** > **Microsoft XDR permissions**.

1. Review the pending access request and select **Approve** or **Reject**.

   :::image type="content" source="media/multitenant-governance/approve-reject.png" alt-text="Screenshot showing options to approve or reject the access request.":::

1. After approval, you'll see a confirmation message.

   :::image type="content" source="media/multitenant-governance/request-approved.png" alt-text="Screenshot of confirmation that delegated access was approved.":::

After the approval is complete, users in the specified security groups receive permissions in the governed tenant based on the defined roles.

## Configure GDAP permissions for Microsoft Sentinel

When GDAP access is established between tenants, synchronized security groups appear as "remote tenant groups" in the governed tenant. You can assign these groups to Azure Resource Manager (ARM) resources to enable Microsoft Sentinel management capabilities.

Assigning Microsoft Sentinel roles enables multitenant management features including:

- Alert and incident management
- Threat intelligence
- Hunting
- Content distribution
- Direct management through the Defender portal

### Assign permissions to Log Analytics workspace

Follow these steps to grant Microsoft Sentinel permissions to your delegated access groups.

#### Step 1: Assign ARM permissions

1. In the governed tenant, sign in to the [Azure portal](https://portal.azure.com).

1. Navigate to your Log Analytics workspace.

1. Select **Access Control (IAM)**.

   :::image type="content" source="media/multitenant-governance/access-control.png" alt-text="Screenshot of Access Control panel showing role assignments." lightbox="media/multitenant-governance/access-control.png":::

1. Select **Add** > **Add role assignment**.

1. Select the Microsoft Sentinel role you want to assign (for example, Microsoft Sentinel Contributor).

1. On the **Members** tab, under **Assign access to**, select **Remote tenant group**.

1. Select the synchronized security groups from the governing tenant.

   :::image type="content" source="media/multitenant-governance/add-role-assignment.png" alt-text="Screenshot showing role assignment to a remote tenant group." lightbox="media/multitenant-governance/add-role-assignment.png":::

1. Select **Review + assign** to complete the assignment.

1. Verify the role assignments by returning to **Access Control (IAM)** and reviewing the role assignments list.

   :::image type="content" source="media/multitenant-governance/validate-role.png" alt-text="Screenshot showing validated role assignments.":::

#### Step 2: Add tenant to tenant groups

1. Sign in to the governing tenant at [mto.security.microsoft.com](https://mto.security.microsoft.com).

1. Navigate to **Multi-tenant governance** > **Tenant Groups**.

1. Verify that the governed tenant is included in your tenant groups.

#### Step 3: Add Sentinel workspace to Advanced Hunting

1. Navigate to **Hunting** > **Advanced Hunting**.

1. Select **Tenant Scope** to open the scope selector.

   :::image type="content" source="media/multitenant-governance/advanced-hunting.png" alt-text="Screenshot of Advanced Hunting interface with tenant scope option." lightbox="media/multitenant-governance/advanced-hunting.png":::

1. Select the governed tenant and the Log Analytics workspace.

1. Select **Apply** to save your selection.

   :::image type="content" source="media/multitenant-governance/tenant-scope.png" alt-text="Screenshot showing tenant scope selection interface.":::

### Manage Microsoft Sentinel in the governed tenant

After configuring permissions, you can manage Microsoft Sentinel directly from the governing tenant's Defender portal.

#### Step 1: Switch to the governed tenant

1. In the governing tenant's Defender portal, select the multitenant switcher.

1. Select the governed tenant you want to manage.

   :::image type="content" source="media/multitenant-governance/switch-view.png" alt-text="Screenshot of tenant switcher with available tenants.":::

#### Step 2: Access Microsoft Sentinel

1. Navigate to **Microsoft Sentinel** in the left navigation.

1. You can now fully manage the Microsoft Sentinel instance in the governed tenant.

   :::image type="content" source="media/multitenant-governance/tables.png" alt-text="Screenshot of Microsoft Sentinel data management interface." lightbox="media/multitenant-governance/tables.png":::

## Troubleshooting

### Send relationship request option is unavailable

**Symptom**: The **Send relationship request** option is greyed out, and you see an error message stating "Failed to load data. Please try again later."

:::image type="content" source="media/multitenant-governance/relationship-request-disabled.png" alt-text="Screenshot showing disabled send relationship request option." lightbox="media\multitenant-governance\relationship-request-disabled.png":::

**Cause**: This feature requires both Microsoft Entra ID and multitenant capabilities to be enabled for your tenant. The enrollment process can take up to 7 days to complete.

**Resolution**:

1. Press F12 to open browser developer tools.

1. Navigate to the **Network** tab.

1. Filter by `governancePolicyTemplates`.

1. Refresh the page and check the response for error messages.

   :::image type="content" source="media/multitenant-governance/error-messages.png" alt-text="Screenshot of browser developer tools showing enrollment error.":::

The following table lists common error messages and their resolutions:

| Error message | Resolution |
|---|---|
| Tenant XXXX-XXXX-XXXX-XXXXXXX is not allowlisted | Allow up to 7 days for the enrollment process to complete. If the issue persists, contact Microsoft Support. |

### Security group not displayed when creating a template

**Symptom**: Your security group doesn't appear in the list when creating a relationship template.

**Cause**: Only security groups that meet specific criteria are supported for GDAP delegation.

**Resolution**: Ensure your security group meets the following requirements:

- SecurityEnabled property is set to true
- IsAssignableToRole property is set to true
- Not a Microsoft 365 group (unified group)

Security groups that don't meet these criteria aren't supported for GDAP delegation.

## Related content

- [Entra governance relationships](/entra/id-governance/tenant-governance/governance-relationships)
- [MSSP portal access](mssp-access.md)
