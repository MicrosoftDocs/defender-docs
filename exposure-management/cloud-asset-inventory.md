---
title: Cloud asset inventory
description: Learn about the unified cloud asset inventory in Microsoft Defender for Cloud within the Defender portal.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: how-to
ms.service: exposure-management
ms.date: 12/15/2025
---

# Cloud asset inventory

This article describes how to use the unified cloud asset inventory in Microsoft Defender for Cloud within the Microsoft Defender XDR portal to manage and monitor your multi-cloud infrastructure.

## Overview

The cloud asset inventory provides a unified, contextual view of cloud infrastructure across Azure, AWS, and GCP environments. It categorizes assets by workload, criticality, and coverage status while integrating health data, device actions, and risk signals into a single interface.

:::image type="content" source="./media/defender-for-cloud-defender-portal/cloud-inventory.png" alt-text="Screenshot of the cloud asset inventory interface." lightbox="./media/defender-for-cloud-defender-portal/cloud-inventory.png":::

## Key capabilities

### Unified multi-cloud visibility

- **Comprehensive coverage**: View all cloud assets across Azure, AWS, GCP, and other supported platforms
- **Consistent interface**: Single pane of glass for multi-cloud asset management
- **Real-time synchronization**: Up-to-date asset information across all connected cloud environments
- **Cross-platform relationships**: Understand dependencies and connections between assets across different cloud providers

### Workload-specific insights

The inventory is organized by workload types, each providing tailored visibility and data:

- **Virtual Machines**: Compute instances across cloud providers with security posture and vulnerability data
- **Data Resources**: Databases, storage accounts, and data services with compliance and exposure insights
- **Containers**: Kubernetes clusters, container instances, and container registries with security scanning results
- **AI/ML Services**: Artificial intelligence and machine learning resources with governance and security context
- **APIs**: REST APIs, serverless functions, and integration services with exposure analysis
- **DevOps Resources**: CI/CD pipelines, repositories, and development tools with security insights
- **Identity Resources**: Service accounts, managed identities, and access control components
- **Serverless**: Functions, logic apps, and event-driven compute resources

### Advanced filtering and scoping

- **Persistent scoping**: Leverage cloud scopes for consistent filtering across experiences
- **Multi-dimensional filtering**: Filter by environment, workload, risk level, compliance status, and more
- **Search capabilities**: Quick asset discovery through comprehensive search functionality
- **Saved views**: Create and maintain custom filtered views for different operational needs

## Asset categorization and metadata

### Asset criticality classification

Assets are automatically classified based on:

- **Business impact**: Determined by asset type, dependencies, and organizational importance
- **Security posture**: Based on configuration, vulnerabilities, and compliance status
- **Risk factors**: Including exposure to internet, data sensitivity, and access patterns
- **Custom classifications**: User-defined criticality rules and manual overrides

### Coverage status indicators

Each asset displays coverage information:

- **Protected**: Full Defender for Cloud protection enabled
- **Partial**: Some security features enabled, others available for upgrade
- **Unprotected**: No Defender for Cloud protection, requires onboarding
- **Excluded**: Explicitly excluded from monitoring or protection

### Health and risk signals

Integrated risk indicators provide comprehensive asset context:

- **Security alerts**: Active security incidents and threat detections
- **Vulnerabilities**: Known security weaknesses and required patches
- **Compliance status**: Regulatory and policy compliance assessment
- **Exposure metrics**: Internet accessibility, privileged access, and attack surface data

## Navigation and filtering

### Accessing the cloud inventory

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com)
1. Select **Assets** > **Cloud Infrastructure** from the main navigation
1. Use workload-specific tabs for focused views:
   - **All Assets**: Comprehensive view across all workload types
   - **VMs**: Virtual machine-specific inventory and insights
   - **Data**: Data resources including databases and storage
   - **Containers**: Container and Kubernetes resources
   - **AI**: Artificial intelligence and machine learning services
   - **API**: APIs and integration services
   - **DevOps**: Development and deployment pipeline resources
   - **Identity**: Identity and access management components
   - **Serverless**: Function and event-driven compute resources

### Using filters effectively

- **Environment filtering**: Select specific cloud providers (Azure, AWS, GCP) or view all environments
- **Scope filtering**: Apply cloud scopes for organizational boundary management
- **Risk-based filtering**: Focus on high-risk or exposed assets requiring immediate attention
- **Workload filtering**: Narrow results to specific types of cloud resources
- **Status filtering**: Filter by protection status, compliance state, or health indicators

### Search and discovery

- **Text search**: Find assets by name, resource ID, or metadata attributes
- **Tag-based search**: Locate assets using cloud provider tags and labels
- **Advanced queries**: Use complex filter combinations for precise asset discovery
- **Export capabilities**: Export filtered results for reporting and analysis

## Asset details and insights

### Comprehensive asset information

Each asset provides detailed information including:

- **Basic metadata**: Resource names, IDs, locations, and creation timestamps
- **Configuration details**: Current settings, policies, and applied configurations
- **Security posture**: Compliance status, vulnerability assessments, and security recommendations
- **Risk assessment**: Exposure analysis, threat intelligence, and risk scoring
- **Relationships**: Dependencies, connections, and related resources across the environment

### Security recommendations integration

Assets link directly to relevant security recommendations:

- **Configuration improvements**: Misconfigurations and hardening opportunities
- **Vulnerability remediation**: Patch management and security updates
- **Access control**: Identity and permissions optimization
- **Network security**: Firewall rules, network segmentation, and exposure reduction

### Incident response workflows

The inventory supports security operations through:

- **Alert correlation**: Link security alerts to specific assets for faster investigation
- **Response actions**: Direct access to remediation workflows and response capabilities
- **Forensics support**: Detailed asset context for incident investigation and analysis
- **Automation integration**: API access for security orchestration and automated response

## Integration with Exposure Management

### Attack path visualization

Assets in the inventory integrate with attack path analysis:

- **Path participation**: See which attack paths include specific assets
- **Choke point identification**: Highlight assets that are critical convergence points
- **Target classification**: Identify assets that are common attack targets
- **Entry point analysis**: Understand which assets provide initial access opportunities

### Critical asset management

The inventory supports critical asset workflows:

- **Automatic classification**: Assets can be automatically classified as critical based on predefined rules
- **Manual designation**: Security teams can manually designate assets as critical
- **Criticality inheritance**: Asset relationships can influence criticality classifications
- **Protection prioritization**: Critical assets receive enhanced monitoring and protection

### Vulnerability management integration

Cloud assets connect seamlessly with vulnerability management:

- **Unified vulnerability view**: See both cloud and endpoint vulnerabilities in consolidated dashboards
- **Risk-based prioritization**: Vulnerabilities are prioritized based on asset context and business impact
- **Remediation tracking**: Monitor vulnerability remediation progress across cloud environments
- **Compliance reporting**: Generate vulnerability reports that include cloud and endpoint data

## Reporting and analytics

### Built-in reporting

- **Coverage reports**: Assess Defender for Cloud deployment across your cloud estate
- **Risk assessments**: Comprehensive risk analysis across multi-cloud environments  
- **Compliance dashboards**: Track regulatory compliance status across all cloud assets
- **Trend analysis**: Monitor changes in security posture over time

### Custom analytics

- **Advanced hunting**: Query cloud asset data using KQL for custom analysis
- **API access**: Programmatic access to inventory data for custom reporting and integration
- **Export capabilities**: Export asset data in various formats for external analysis
- **Dashboard integration**: Create custom dashboards using cloud asset inventory data

## Limitations and considerations

### Current limitations

- **Software inventory**: Not yet available for cloud assets (planned post-M1 release)
- **Real-time updates**: Some asset changes may have slight delays before appearing in inventory
- **Historical data**: Limited historical asset information during initial rollout period

### Performance considerations

- **Large environments**: Filtering and scoping help manage performance in environments with thousands of assets
- **Refresh rates**: Asset data is refreshed periodically; real-time data may require direct cloud provider console access
- **Network dependencies**: Inventory functionality requires reliable connectivity to cloud provider APIs

### Scoping limitations

Some assets may appear outside defined cloud scopes:

- **Cross-scope dependencies**: Assets with relationships spanning multiple scopes
- **Floating assets**: Certain asset types that don't support fine-grained scoping
- **Inherited permissions**: Assets that inherit permissions from parent resources outside the scope

## Best practices

### Inventory management

- **Regular reviews**: Periodically review asset inventory for accuracy and completeness
- **Tagging strategy**: Implement consistent tagging across cloud environments for better organization
- **Scope configuration**: Set up appropriate cloud scopes to match organizational structure
- **Filter optimization**: Create and save useful filter combinations for efficient daily operations

### Security operations

- **Critical asset focus**: Prioritize monitoring and protection of business-critical assets
- **Risk-based approach**: Use risk indicators to guide security attention and resource allocation
- **Integration workflows**: Leverage inventory data in incident response and vulnerability management processes
- **Automation opportunities**: Identify repetitive tasks that can be automated using inventory APIs

## Next steps

- [Configure cloud scopes for inventory filtering](cloud-scopes-unified-rbac.md)
- [Review cloud security recommendations](security-recommendations.md)
- [Explore cloud attack paths](work-attack-paths-overview.md)
- [Learn about Defender for Cloud in the Defender portal](defender-for-cloud-defender-portal.md)
