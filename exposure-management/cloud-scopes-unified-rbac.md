---
title: Cloud scopes and Unified RBAC
description: Learn about cloud scopes and Unified Role-Based Access Control (RBAC) in Microsoft Defender for Cloud within the Defender portal.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: how-to
ms.service: exposure-management
ms.date: 10/15/2025
---

# Cloud scopes and Unified RBAC

This article describes how to configure and use cloud scopes with Unified Role-Based Access Control (RBAC) in Microsoft Defender for Cloud within the Microsoft Defender XDR portal.

## Overview

Cloud scopes add granular access control to Microsoft Defender for Cloud, allowing organizations to segment cloud environments by business unit, geography, or workload. Integrated with Defender Unified RBAC, cloud scopes enable precise role assignments and persistent filtering across dashboards, policies, and onboarding flows.

:::image type="content" source="./media/defender-for-cloud-defender-portal/cloud-scopes.png" alt-text="Screenshot of cloud scopes management interface." lightbox="./media/defender-for-cloud-defender-portal/cloud-scopes.png":::

## Key benefits of cloud scopes

### Granular access control

- **Segment resources** by business unit, geography, or workload
- **Assign roles** based on team responsibilities and organizational structure
- **Set specific access permissions** per group or scope
- **Avoid broad access** to improve security and operational transparency

### Enhanced security management

- **Define roles with flexibility** and control across multi-cloud environments
- **Distribute security permissions** appropriately across teams
- **Improve provisioning control** through scoped access management
- **Support compliance requirements** with precise access boundaries

### Multi-tenant capabilities

- **Manage customer environments** securely for MSSPs and service providers
- **Provide scoped access** to posture, recommendations, and inventory
- **Maintain separation** between different organizational units or customers
- **Enable self-service** within defined boundaries

## Unified RBAC integration

The Unified Role-Based Access Control (RBAC) model in the Defender portal offers consolidated permissions management, giving administrators a central location to manage user permissions across various security solutions.

:::image type="content" source="./media/defender-for-cloud-defender-portal/unified-rbac.png" alt-text="Screenshot of Unified RBAC interface." lightbox="./media/defender-for-cloud-defender-portal/unified-rbac.png":::

### Key RBAC capabilities

- **Centralized permissions management** across Microsoft security solutions
- **Role assignments with scoping** for cloud environments and device groups
- **Granular permissions** for specific cloud security functions
- **Integration with existing** Microsoft Entra ID roles and permissions

### RBAC considerations

- **Different from native cloud permissions**: Unified RBAC operates independently from Azure, AWS, or GCP native permissions
- **Separate role assignments**: Security administrators must create Unified RBAC permissions independent of native cloud permissions
- **Enhanced flexibility**: More granular control than traditional cloud IAM systems
- **Consistent across platforms**: Same permission model across Azure, AWS, and GCP

## Supported cloud scope primitives

Cloud scopes currently support the following environment primitives:

### Azure environments

- **Azure Subscriptions**: Segment by subscription boundaries
- **Management Groups**: Organize subscriptions hierarchically (coming soon)

### AWS environments  

- **AWS Accounts**: Individual AWS account scoping
- **AWS Master Accounts**: Organization-level account management

### GCP environments

- **GCP Projects**: Project-level access control
- **GCP Organizations**: Organizational boundary management (coming soon)

### DevOps and container environments

- **AzureDevOps Organizations**: DevOps pipeline and repository scoping
- **GitHub Organizations**: Repository and organization-level access
- **GitLab Groups**: Project group-based access control
- **Docker Hub Organizations**: Container registry scoping
- **JFrog Artifactory**: Artifact repository access control

> [!NOTE]
> Support will be expanded to include additional primitives like management groups and container resources in future releases.

## Scopes filter integration

The Scopes Filter provides a unified way for security teams to focus on relevant data by selecting either cloud scopes or device groups. This global filter persists across experiences.

:::image type="content" source="./media/defender-for-cloud-defender-portal/scopes-filter.png" alt-text="Screenshot of the scopes filter interface." lightbox="./media/defender-for-cloud-defender-portal/scopes-filter.png":::

### Filter capabilities

- **Persistent filtering**: Remains active as you navigate through dashboards, policies, and workflows
- **Context-aware**: Applies appropriate filtering based on the current view (cloud scopes for cloud data, device groups for endpoint data)
- **Global consistency**: Maintains consistent context during security reviews across all experiences

### Workload-specific filtering

The filter adapts to different workload contexts, providing relevant scoping options based on the selected view:

:::image type="content" source="./media/defender-for-cloud-defender-portal/cloud-scopes-workload-filter.png" alt-text="Screenshot of workload-specific scope filtering." lightbox="./media/defender-for-cloud-defender-portal/cloud-scopes-workload-filter.png":::

- **Recommendations view**: Device group filtering for Devices tab, cloud scope filtering for Cloud tab
- **Vulnerability Management**: Appropriate scoping based on selected environment (devices vs. cloud)
- **Attack Paths**: Contextual filtering that respects both cloud and endpoint boundaries
- **Asset Inventory**: Multi-dimensional filtering across cloud and device scopes

## Configuring cloud scopes

### Prerequisites

- **Global Administrator** or **Security Administrator** role in Microsoft Entra ID
- **Defender for Cloud** plans enabled across target environments
- **Unified RBAC** permissions for role assignment and scope management

### Initial configuration

To enable cloud scopes for the first time:

1. **Complete the activation process**: Authorization admins are guided through RBAC configuration in the Unified RBAC experience
1. **Configure permissions**: Assign cloud scopes to existing roles using Microsoft Defender for Cloud as a data source
1. **Review sensitive permissions**: The wizard highlights permissions with sensitive access, such as response actions on devices
1. **Activate cloud scopes**: Scopes become effective only after activation is complete

### Creating and managing cloud scopes

1. Navigate to **Settings** > **Cloud Scopes** in the Defender portal
1. Select **Create new scope** to define a new organizational boundary
1. **Choose scope type**: Select from supported primitives (subscriptions, accounts, projects)
1. **Define scope boundaries**: Add specific cloud resources to include in the scope
1. **Assign permissions**: Configure role assignments for the new scope
1. **Test and validate**: Verify scope functionality with appropriate test users

## Role assignment with cloud scopes

### Assigning roles to scopes

- **Select users or groups** from Microsoft Entra ID directory
- **Choose appropriate roles** based on required permissions level
- **Apply scope boundaries** to limit access to specific cloud environments
- **Review and confirm** role assignments before activation

### Permission levels

- **Read-only access**: View security posture and recommendations within scope
- **Contributor access**: Manage recommendations and participate in remediation workflows
- **Administrator access**: Full configuration and management capabilities within scope boundaries

### Best practices for role assignment

- **Follow principle of least privilege**: Grant minimum necessary permissions
- **Use groups instead of individual users**: Simplify management and maintenance
- **Regular review cycles**: Audit and update role assignments periodically
- **Document scope purposes**: Maintain clear documentation of scope boundaries and purposes

## Scoped data experiences

### What gets filtered by cloud scopes

Cloud scopes apply filtering to:

- **Cloud recommendations** and security posture data
- **Cloud asset inventory** and resource listings
- **Cloud vulnerability data** and remediation insights  
- **Cloud attack paths** and threat modeling
- **Security alerts** from cloud environments
- **Compliance and regulatory** reporting within scope boundaries

### Cross-scope considerations

Some assets are considered "floating" or unscoped and remain visible to all users:

- **Microsoft Entra ID users and groups**
- **GCP users and groups**  
- **Service Principals**
- **Container images**
- **IP addresses**
- **Certificates and SSH private keys**
- **Secrets and Managed Identities** (some can be scoped depending on resource ID availability)

### Limitations and considerations

- **XDR filtering**: Scope filtering is not yet available for incidents and alerts, though table-level filtering inherits selections from global filter
- **Cross-environment data**: Some exposure scores and Microsoft Secure Score data may not be available for specific cloud scopes
- **Asset relationships**: Related asset information may be limited due to permission restrictions in scoped views

## Troubleshooting and support

### Common configuration issues

- **Activation failures**: Ensure proper permissions and complete the activation wizard
- **Scope not appearing**: Verify cloud resources are properly onboarded to Defender for Cloud
- **Permission conflicts**: Review role assignments and resolve overlapping or conflicting permissions
- **Missing data**: Check that appropriate Defender plans are enabled for scoped resources

### API support

- **Management APIs**: Cloud scopes management through API is coming soon
- **Query APIs**: Programmatic access to scoped data follows existing Defender API patterns
- **Automation**: Role assignment automation capabilities are planned for future releases

## Next steps

- [Explore the cloud asset inventory with scoping](cloud-asset-inventory.md)
- [Manage cloud recommendations with scoped access](security-recommendations.md)
- [Configure Unified RBAC for Exposure Management](prerequisites.md)
- [Learn about Defender for Cloud in the Defender portal](defender-for-cloud-defender-portal.md)
