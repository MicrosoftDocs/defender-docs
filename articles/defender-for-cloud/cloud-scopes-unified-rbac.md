---
title: Manage cloud scopes and unified RBAC in Microsoft Defender for Cloud
description: Learn how to configure cloud scopes and unified role-based access control for granular permissions management across your cloud environments.
ms.topic: how-to
ms.date: 09/03/2025
ms.author: dacurwin
author: dcurwin
zone_pivot_groups: defender-portal-experience
#customer intent: As a security administrator, I want to configure cloud scopes and unified RBAC to manage access and permissions across my cloud environments.
---

::: zone pivot="defender-portal"

# Manage cloud scopes and unified RBAC

Cloud scopes and unified role-based access control (RBAC) in the Microsoft Defender portal provide granular access management capabilities that allow you to organize cloud resources by business value or operational structure. This transformative solution redefines how customers manage and secure access in multi-cloud environments, enabling precise role assignments and persistent filtering across dashboards, policies, and onboarding flows for Azure, AWS, and GCP environments.

## Introduction to access management & unified RBAC in Defender portal

Transitioning to the Defender portal offers substantial benefits to customers by enhancing access management, security, and operational efficiency through effective cloud scopes and tailored access control. The transition to the Defender portal substantially improves the access management experience while preserving and advancing existing functionalities.

The Defender portal utilizes a unified role-based access control (RBAC) model, offering a centralized permissions management interface that enables administrators to efficiently manage user access across various security solutions from a single location.

> [!IMPORTANT]
> uRBAC in Defender Portal is completely different from Azure RBAC and requires separate permissions and management for each product.

The new access management capabilities in Defender portal resolve the following:

- **Seamless, intuitive access management** within the Defender portal
- **Distributed, standalone security permissions** for your security personnel
- **Greater control and flexibility** in access provisioning

Access management has always been a cornerstone of cloud security. As cloud environments grow more complex, the need for smarter, more intuitive access control becomes critical.

## What are cloud scopes?

Cloud scopes are a cloud-aware scoping method that allows you to align your cloud resources with your business's operational structure. With cloud scopes, administrators can now align access management with their organization's operational structure. Resources are grouped based on business value, teams, or strategic functions – offering tailored visibility and control.

Cloud scopes enable you to:

- **Organize cloud resources by business value or unit**: Group resources based on your organizational needs
- **Set specific access permissions for each group**: Define granular access controls
- **Assign roles based on team members' responsibilities**: Match permissions to job functions
- **Avoid broad access to enhance security and transparency**: Implement principle of least privilege
- **Define roles and permissions with flexibility and control**: Adapt to changing organizational needs

These enhancements are designed to address your key needs:

- **Seamless, intuitive access management** within the Defender portal
- **Distributed, standalone security permissions** for your security personnel
- **Greater control and flexibility** in access provisioning

## Main deliveries

- **The Unified role-based access control (RBAC) model** in the Defender portal offers a consolidated permissions management experience, giving administrators a central location to manage user permissions across various security solutions. Unified RBAC with scoping lets users and groups view data for a specific scope. Role assignments can be applied to scopes, allowing effective management of permissions and access control.

- **Cloud scopes management** – any Global admin / security admin is now able to create and manage cloud scopes via cloud scopes management experience.

- **Scopes filter**: This global filter lets security teams focus on specific data within the full dataset by selecting either cloud scopes or device groups. The scoping filter selection remains active as you navigate between experiences, allowing you to consistently maintain your filtering context during the security review process. The filter is available in all cloud and exposure management experiences, including recommendations, initiatives, vulnerability management, cloud inventory, cloud overview dashboard, cloud initiatives dashboard, attack paths and map view.

## Prerequisites

- Global Admin or Security Admin role
- Access to the Microsoft Defender portal
- Cloud environments connected to Microsoft Defender for Cloud

## Getting started

The following describes the needed steps to start using the new cloud scopes and assign unified RBAC permissions to users.

:::image type="content" source="media/cloud-scopes-unified-rbac/getting-started-steps.png" alt-text="Diagram showing the steps to get started with cloud scopes and unified RBAC." lightbox="media/cloud-scopes-unified-rbac/getting-started-steps.png":::

### 1. Cloud scope management

Global admin, Global reader, security admin, and security reader roles can access the cloud scopes management interface. Only global admins at the tenant level have full view and manage (CRUD) permissions.

**Navigation**: Settings → Permissions → Microsoft XDR Roles → Scopes → Cloud scopes tab.

In this management experience, the security teams can create cloud scopes that align with their business units. A scope is defined as a group of cloud native environments rather than individual resources:

- Scopes can include multi-cloud environments
- Unlimited cloud scopes and environments per scope
- Each cloud scope is isolated; users must manually add new cloud environments
- Environments can belong to multiple scopes without any limitation

This management experience enables users with appropriate management permissions to create and modify cloud scopes.

> [!NOTE]
> **Next phase**: As part of Ring 1, we will support container resources such as: Cluster, Namespace, Registry and Repository.
> 
> **North star**: We plan to add additional environments in M2 such as Azure management group.

#### To create a cloud scope:

1. Click **Create new cloud scope** and enter the wizard.

   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-1.png" alt-text="Screenshot showing how to create a new cloud scope in the wizard." lightbox="media/cloud-scopes-unified-rbac/create-scope-1.png":::

1. Select name and description. Click **Next**.

   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-2.png" alt-text="Screenshot showing where to enter the scope name and description." lightbox="media/cloud-scopes-unified-rbac/create-scope-2.png":::

1. Choose native environment primitives for cloud scopes individually or with filters. Click **Next**.

   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-3.png" alt-text="Screenshot showing how to select environment primitives for cloud scopes." lightbox="media/cloud-scopes-unified-rbac/create-scope-3.png":::

1. Review and finish.

   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-4.png" alt-text="Screenshot showing the review and finish step for creating a cloud scope." lightbox="media/cloud-scopes-unified-rbac/create-scope-4.png":::

### 2. Cloud scopes activation & assignment

To enable cloud scopes for the first time, you must configure permissions for roles associated with Defender for Cloud data sources. This step also controls access to shared assets like VMs via Device Groups or Cloud Scope. Begin by completing the activation process, which guides Authorization admins through RBAC configuration in the unified RBAC experience. 

Cloud scopes are effective only after activation. This wizard allows you to assign cloud scopes to all existing roles using Microsoft Defender for Cloud as a data source, highlighting which permissions are granted - especially those with sensitive access, such as response or live response on devices.

As cloud scopes provide more granular access management and permissions for cloud data, it is crucial for customers to assign roles to cloud scopes with the understanding that this may also affect permissions for VMs—previously managed solely through device groups. The activation process is a one-time setup. Until completed, you'll see a notification and cannot assign roles for cloud scopes. To enter the wizard, the user needs to click on the button.

> [!NOTE]
> If there are no device groups or unified RBAC roles in the Microsoft Defender for Cloud data source, you can skip the activation wizard and go straight to assigning roles with cloud scopes.

#### Assign cloud scopes to all relevant roles in the activation & assignment wizard:

:::image type="content" source="media/cloud-scopes-unified-rbac/activate-scope-1.png" alt-text="Screenshot showing the cloud scopes activation wizard interface." lightbox="media/cloud-scopes-unified-rbac/activate-scope-1.png":::

:::image type="content" source="media/cloud-scopes-unified-rbac/activate-scope-2.png" alt-text="Screenshot showing role assignment in the activation wizard." lightbox="media/cloud-scopes-unified-rbac/activate-scope-2.png":::

:::image type="content" source="media/cloud-scopes-unified-rbac/activate-scope-3.png" alt-text="Screenshot showing the final activation step with approval." lightbox="media/cloud-scopes-unified-rbac/activate-scope-3.png":::

- Roles granted 'manage' permission are specifically indicated, as this permission extends 'manage' access to virtual machines as well
- If there are no existing cloud scopes, you will need to create at least one before you can continue
- Once all relevant roles have been assigned to the appropriate cloud scopes, you will need to approve and activate the configuration. This process cannot be rolled back or reverted - you can manually manage and modify permissions as needed

### 3. Unified RBAC management & assignment

Cloud scopes are primarily used for role-based access control (RBAC) and filtering. They allow users to restrict access management at the tenant level, enabling security personnel to manage only the specific cloud environments assigned to them through cloud scopes.

During the unified RBAC assignment process, you can select relevant cloud scopes. Consequently, a user with unified RBAC permissions will have access limited to the data authorized within those cloud scopes.

> [!IMPORTANT]
> Unified RBAC operates in the Defender portal and uses a different RBAC model from Azure. Permissions are not transferred between portals; instead, security administrators must create separate unified RBAC permissions for their teams, independent of their Azure portal permissions.

For further information on unified RBAC permissions, please refer to the documentation available here: [Microsoft Defender XDR Unified role-based access control (RBAC)](https://learn.microsoft.com/microsoft-365/security/defender/manage-rbac)

Create a unified RBAC role for any user needing portal access. Refer to the documentation to add or update custom roles. You can now assign roles with cloud scopes for more granular access.

**Navigation**: Settings → Permissions → Microsoft XDR Roles → Roles.

Select **Create custom role** to initiate the creation of a new role. In the permissions step of the resulting wizard, choose the appropriate permission group to configure the necessary permissions. There are two permission groups relevant to Microsoft Defender for Cloud (cloud data):

:::image type="content" source="media/cloud-scopes-unified-rbac/urbac-permissions-1.png" alt-text="Screenshot showing the unified RBAC role creation wizard with permission groups." lightbox="media/cloud-scopes-unified-rbac/urbac-permissions-1.png":::

1. **Security operations** – grants the SOC persona access to incidents and alerts, as well as Microsoft Defender for Cloud cloud inventory
2. **Security posture** – provides access to posture management features, including recommendations, vulnerability management, security score, and additional capabilities

> [!NOTE]
> You may select one or both permission groups as required.

The next step in the wizard is assignment. Role assignment allows you to assign users and data sources during custom role creation. You can also set scope assignments in this step.

:::image type="content" source="media/cloud-scopes-unified-rbac/urbac-permissions-2.png" alt-text="Screenshot showing the role assignment step with data source selection." lightbox="media/cloud-scopes-unified-rbac/urbac-permissions-2.png":::

On the assignment page, under Data source selection, choose the relevant data sources to view Microsoft Defender for Cloud data by selecting 'All', 'MDC', or 'Exposure Management (XSPM)'. Some Microsoft Defender for Cloud features are integrated with Exposure Management experiences.

> [!NOTE]
> For the "Security posture" permissions group, select the data source 'Exposure Management (XSPM)'. This is the only data source that manages overall posture access.

You can restrict access using cloud scopes selection:

:::image type="content" source="media/cloud-scopes-unified-rbac/urbac-permissions-3.png" alt-text="Screenshot showing cloud scopes selection options in role assignment." lightbox="media/cloud-scopes-unified-rbac/urbac-permissions-3.png":::

- **All**: Grants access to all cloud scopes
- **Custom**: Allows selection of specific cloud scopes

## 4. Scoping filtering

### Scope filter

In addition to access management and RBAC, cloud scopes also function as filters.

In all cloud related experiences, a new scope filter is now available to let security teams focus on specific data within the full dataset by selecting either cloud scopes or device groups. The scoping filter selection remains active as you navigate between experiences, allowing users to consistently maintain your filtering context during the security review process.

:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-1.png" alt-text="Screenshot showing the scope filter interface with cloud scopes and device groups options." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-1.png":::

The scope filter consists of two categories: cloud scopes and device groups.

> [!IMPORTANT]
> - The device groups filter, previously available in some experiences like vulnerability management, is now included in the new scoping filter.
> - The new scopes filter adjusts results based on experience source. For example: in 'Recommendations', scope filtering for device groups is only applied to the Devices tab and cloud scopes only to the Cloud tab.

:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-2.png" alt-text="Screenshot showing how scope filtering adjusts results based on experience source." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-2.png":::

The filter is available in all cloud and exposure management experiences, including recommendations, initiatives, vulnerability management, cloud inventory, cloud overview dashboard, cloud initiatives dashboard, attack paths and map view.

The global filter is accessible to all users; however, each individual will only view scoping group values for which they have authorized access. They will receive a list of cloud scopes and device groups they are authorized to access.

:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-3.png" alt-text="Screenshot showing the global scope filter with authorized access controls." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-3.png":::

### Environments filter

This filter enables flexible filtering for in-depth investigation and sub-scope analysis, primarily for mitigation and remediation activities. This filter is available in cloud initiatives, overview dashboards, cloud inventory, and cloud recommendations:

:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-4.png" alt-text="Screenshot showing the environments filter interface for detailed filtering options." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-4.png":::

- It coexists alongside the scopes filter to address the two main use cases
- The environments filter shows only environments the user is authorized to access. Without a scope selected, users see all accessible environments. With a selected scope, users see environments within that scope
- The environments filter receives its input based on the selection in the scopes filter
- The environments filter is global across the 4 experiences, with the selection remaining consistent between them
- Each filter may be applied independently:
  - A user can filter for a cloud scope and then use the environments filter to delve into specific environments (from within the selected filters)
  - A user can first filter for specific environments and then add the scopes filter. In this scenario, the scopes filter will display all possible values, and its filtering will override the environment's filter

## Activation process

To enable cloud scopes for the first time, you must configure permissions for roles associated with Defender for Cloud data sources. This activation process:

1. **Guides Authorization admins** through RBAC configuration in the unified RBAC experience
2. **Controls access to shared assets** like VMs via Device Groups or Cloud Scopes
3. **Highlights sensitive permissions** such as response or live response capabilities on devices
4. **Assigns cloud scopes to existing roles** using Microsoft Defender for Cloud as a data source

Cloud scopes become effective only after completing the activation process through the configuration wizard.

## Manage scope assignments

After creating cloud scopes, you can:

- **Modify scope membership**: Add or remove cloud resources from existing scopes
- **Update permissions**: Change role assignments and access levels
- **Monitor scope usage**: Review which users and groups are accessing scoped resources
- **Audit scope activities**: Track changes and access patterns within scopes

## Best practices

- **Align scopes with business structure**: Create scopes that match your organizational hierarchy
- **Use descriptive naming**: Choose clear, meaningful names for easy identification
- **Regular access reviews**: Periodically review and update scope assignments
- **Principle of least privilege**: Grant only the minimum necessary access
- **Documentation**: Maintain clear documentation of scope purposes and assignments

## Known issues and limitations

1. **Different RBAC models**: Unified RBAC operates in the Defender portal and uses a different RBAC model from Azure. Permissions are not transferred between portals; instead, security administrators must create separate unified RBAC permissions for their teams, independent of their Azure portal permissions.

2. **API support**: Cloud scopes management and role assignment on cloud scopes are both available in the portal; API support is coming soon.

3. **Dynamic configuration**: Currently, cloud scopes primitive's configuration is not dynamic and cannot be selected based on conditions; however, support for this feature will be available in the future.

4. **Supported environment primitives**: The following list shows the currently supported native environment primitives; support will be expanded to include other primitives like management groups and container resources:
   - AWS Accounts
   - AWS Master Accounts
   - Azure DevOps Organizations
   - Azure Subscriptions
   - Docker Hub Organizations
   - GCP Projects
   - GitHub Organizations
   - GitLab Groups
   - JFrog Artifactory

5. **XDR filtering limitations**: With respect to XDR (incidents and alerts), the scope filter is currently not available. However, there is table-level filtering for cloud scopes, which inherits selections from the global filter when navigating from other Microsoft Defender for Cloud pages to XDR views (alerts & incidents). Device groups appear as table filter only in incidents view. We do intend to introduce scoping filtering to XDR and additional experiences in the future.

6. **Cross-experience filtering**: The scope filter applies to all widgets, tables, and data in cloud and exposure management views. Some data, such as exposure score or Microsoft Secure Score, may not be available for cloud scopes. For asset-rich experiences like maps or attack paths, all cloud scope data is fully displayed, but related asset information is limited due to permission restrictions.

7. **Floating assets**: Access to resources is managed by unified RBAC with assigned cloud scopes. Certain assets, referred to as floating or unscoped assets, exist outside the cloud environment hierarchy and are therefore classified as non-scopeable cloud assets. These assets are visible to all users who can access the portal, in all Microsoft Security Exposure Management and cloud experiences regardless of their assigned cloud scope. Integrated into the graph (EKG), these assets include various node types that do not support fine-grained scoping through RBAC. These assets appear in cloud inventory, attack paths, map, and other related views. The list of floating assets includes:
   - Azure Active Directory users and groups
   - GCP users and groups
   - Service Principals
   - Container images
   - IP addresses
   - Certificates
   - SSH private keys
   - Secrets and Managed Identities (some are scopable depending on resource ID availability)

## Frequently asked questions

**Q: How do cloud scopes improve operational alignment across business units?**

Cloud scopes improve operational alignment across business units by allowing administrators to group resources according to business value, function, or organizational structure. This targeted grouping enables tailored access control and visibility, ensuring that each business unit receives the specific permissions and oversight it requires. As a result, teams can operate efficiently within their designated environments, while administrators maintain clear boundaries and flexibility when managing multi-cloud resources. This approach streamlines operations and supports strategic objectives across the organization.

**Q: What is unified RBAC in the Defender Portal?**

Unified RBAC (Unified Role-Based Access Control) is a centralized permissions model in the Defender Portal that allows administrators to manage user access across multiple security solutions. It is distinct from Azure RBAC and requires separate configuration.

**Q: What are Cloud scopes?**

Cloud scopes are a cloud-aware scoping method that lets administrators group resources by business units, value, or strategic function. This enables tailored access control and visibility across multi-cloud environments.

**Q: How do I manage Cloud Scopes?**

Navigate to: Settings → Permissions → Microsoft XDR Roles → Roles → Cloud scopes tab

From there, you can:
- Create unlimited scopes
- Include multiple environments per scope
- Assign environments to multiple scopes
- Manage scopes with full CRUD permissions (Global admin only)

**Q: How do I activate and assign Cloud Scopes?**

- Use the activation wizard to configure permissions for Defender for Cloud data sources
- Assign roles to scopes during this process
- Activation is a one-time setup and must be completed before assigning roles

**Q: Why can't I assign Cloud Scopes in role assignment?**

To enable cloud scopes for the first time, you must configure permissions for roles associated with Defender for Cloud data sources. This step also controls access to shared assets like VMs via Device Groups or Cloud Scope. Begin by completing the activation process, which guides Authorization admins through RBAC configuration in the unified RBAC experience. Cloud scopes are effective only after activation.

**Q: Who can manage Cloud Scopes?**

Only Global Admins have full management rights.

**Q: How does unified RBAC assignment work?**

- Assign roles to specific cloud scopes
- Permissions are scoped to the selected environments
- Unified RBAC is not transferable from Azure; it must be configured separately in the Defender Portal

**Q: How does unified RBAC differ from Azure RBAC in terms of permission granularity?**

Unified RBAC in the Defender Portal offers a permissions model that is distinct from Azure RBAC, particularly in terms of permission granularity. While Azure RBAC provides role assignments at the Azure resource level and is managed through Azure's centralized access control, unified RBAC is configured separately within the Defender Portal and allows administrators to define permissions specifically for security-related resources and actions across multiple Defender solutions. This enables more targeted control within the Defender environment, such as assigning roles to specific cloud scopes or environments, rather than relying on broader Azure resource group or subscription boundaries. As a result, unified RBAC grants administrators the flexibility to tailor security permissions with finer granularity for users who need access to Defender capabilities, independent of their Azure RBAC roles.

**Q: What are the implications of assigning roles across multiple cloud scopes?**

Assigning roles across multiple cloud scopes allows users to access resources and perform actions in all environments included in those scopes. This approach enables administrators to tailor permissions for users who need visibility or control over several business units or strategic areas. However, it also increases the importance of carefully managing scope definitions and role assignments to prevent unnecessary access. Overlapping scopes can lead to complex permission models, so it's essential to regularly review and audit assignments to ensure users have only the access they require. Effective management helps maintain security boundaries and operational clarity.

**Q: What criteria should be used to define cloud scopes effectively?**

Cloud scopes can be leveraged to reflect your organizational hierarchy and structure. They are configurable in a flexible manner to support various criteria, such as: business unit or function, resource value and sensitivity, operational unit by geographic location, application unit, and more.

::: zone-end

::: zone pivot="azure-portal"

## Cloud scopes and unified RBAC

Cloud scopes and unified RBAC capabilities are primarily available through the Microsoft Defender portal experience. For the full cloud scopes management functionality, including creation, configuration, and advanced filtering across multi-cloud environments, access the Microsoft Defender portal.

In the Azure portal, you can:
- View existing RBAC assignments for Azure resources
- Configure basic role-based access control for Azure subscriptions
- Manage resource group and subscription-level permissions

For comprehensive cloud scopes management across Azure, AWS, and GCP environments, use the Microsoft Defender portal experience.

::: zone-end

## Next steps

- [Configure email notifications with cloud scopes](configure-email-notifications.md)
- [Use scope filtering in asset inventory](asset-inventory.md)
- [Apply scopes to attack path analysis](concept-attack-path.md)
- [Manage cloud infrastructure with scoped access](defender-for-cloud-introduction.md)
