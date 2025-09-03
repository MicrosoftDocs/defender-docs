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

Cloud scopes and unified role-based access control (RBAC) in the Microsoft Defender portal provide granular access management capabilities that allow you to organize cloud resources by business value or operational structure. This feature enables precise role assignments and persistent filtering across dashboards, policies, and onboarding flows for Azure, AWS, and GCP environments.

## What are cloud scopes?

Cloud scopes are a cloud-aware scoping method that allows you to align your cloud resources with your business's operational structure. Cloud scopes enable you to:

- **Organize cloud resources by business value or unit**: Group resources based on your organizational needs
- **Set specific access permissions for each group**: Define granular access controls
- **Assign roles based on team members' responsibilities**: Match permissions to job functions
- **Avoid broad access to enhance security and transparency**: Implement principle of least privilege
- **Define roles and permissions with flexibility and control**: Adapt to changing organizational needs

## Unified RBAC integration

The unified RBAC model in the Defender portal offers consolidated permissions management, providing administrators with a central location to manage user permissions across various security solutions. Key benefits include:

- **Seamless, intuitive access management** within the Defender portal
- **Distributed, standalone security permissions** for security personnel
- **Greater control and flexibility** in access provisioning
- **Integration with cloud scopes** for enhanced filtering and access control

## Cloud scopes management

Any Global Admin or Security Admin can create and manage cloud scopes through the cloud scopes management experience in the Defender portal. This centralized management approach ensures consistent application of security policies across your multi-cloud environment.

### Prerequisites

- Global Admin or Security Admin role
- Access to the Microsoft Defender portal
- Cloud environments connected to Microsoft Defender for Cloud

## Configure cloud scopes

1. Navigate to the Microsoft Defender portal.

1. Go to **Settings** > **Cloud scopes management**.

1. Select **Create scope** to define a new cloud scope.

1. Configure the scope parameters:
   - **Scope name**: Provide a descriptive name for the scope
   - **Description**: Add details about the scope's purpose
   - **Cloud environments**: Select Azure subscriptions, AWS accounts, or GCP projects to include
   - **Resource filters**: Apply additional filters based on resource types, tags, or other criteria

1. Define access permissions for the scope:
   - **Roles**: Assign appropriate security roles
   - **Users and groups**: Add users or Azure AD groups
   - **Permissions**: Configure specific permissions for each role

1. Select **Create** to save the cloud scope configuration.

## Scope filtering

The global scope filter allows security teams to focus on specific data within the full dataset by selecting either cloud scopes or device groups. This filtering capability:

- **Remains active as you navigate** between different experiences
- **Maintains filtering context** during security review processes
- **Adjusts results based on workload context** (for example, device groups apply only to endpoint data)
- **Available across all cloud and exposure management experiences**

The scope filter is available in:
- Cloud Infrastructure Overview dashboard
- Exposure Management experiences
- Vulnerability Management
- Attack paths and security explorer
- Asset inventory
- Security recommendations
- Cloud initiatives

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

::: zone-end

::: zone pivot="azure-portal"

# Cloud scopes and unified RBAC

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
