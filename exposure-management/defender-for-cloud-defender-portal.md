---
title: Defender for Cloud in the Defender portal
description: Learn about Microsoft Defender for Cloud integration in the Microsoft Defender XDR portal for unified cloud security management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 10/15/2025
---

# Defender for Cloud in the Defender portal

This article describes the integration of Microsoft Defender for Cloud capabilities into the Microsoft Defender XDR portal, delivering a unified, cloud-agnostic security platform that simplifies and strengthens cloud security operations across multiple environments.

## Overview

Microsoft Defender for Cloud is seamlessly integrated into the Microsoft Defender portal at [security.microsoft.com](https://security.microsoft.com), providing security teams with a single, unified view across all workloads. This integration is part of Microsoft's CNAPP (Cloud-Native Application Protection Platform) vision, designed to be frictionless to adopt, simple to deploy, and intuitive to navigate.

:::image type="content" source="./media/defender-for-cloud-defender-portal/defender-for-cloud-overview.png" alt-text="Screenshot of Defender for Cloud overview in the Defender portal." lightbox="./media/defender-for-cloud-defender-portal/defender-for-cloud-overview.png":::

## Key integration benefits

### Unified security experience

Cloud security is now fully integrated into the Microsoft Defender portal, eliminating the need to switch between tools and portals. SOC teams can work more efficiently with complete security posture visibility across workloads, from endpoints to cloud infrastructure.

### Cloud-agnostic architecture

The integrated platform supports Azure, AWS, GCP, and other cloud platforms in a single interface, making it ideal for hybrid and multi-cloud organizations seeking comprehensive exposure management across their entire digital estate.

### Enhanced performance and scalability

The new portal architecture resolves previous scale limitations, enabling seamless management of large and multi-cloud environments with enhanced visibility, improved performance, and scalability for enterprise-grade deployments.

## Cloud Overview Dashboard

The new unified Cloud Overview Dashboard consolidates Security Posture, Defender coverage, cloud assets, health data, and exposure insights across all your cloud environments.

:::image type="content" source="./media/defender-for-cloud-defender-portal/top-actions.png" alt-text="Screenshot of the Cloud Overview Dashboard top actions." lightbox="./media/defender-for-cloud-defender-portal/top-actions.png":::

### Top Actions prioritization

The dashboard provides actionable insights across key security domains:

- **Security Posture**: Cloud Secure Score trends and prioritized security recommendations
- **Threat Detection**: Real-time security alerts across all cloud environments  
- **Workload Insights**: Comprehensive coverage for VMs, Data, APIs, DevOps, and CIEM with asset summary, coverage insights, and risk levels

### Multi-cloud visibility

Filter and pivot data by:

- **Time frame**: Last 7 days, custom date ranges
- **Environment**: Azure, AWS, GCP, or all environments
- **Scope**: Leverage cloud scopes for targeted views by business unit or geography

## Enhanced role-based access control

### Granular access management

Security teams can now grant more granular access to security content, ensuring only relevant personas see the information they need. Users can access security insights without requiring direct permissions to underlying cloud resources, improving both operational security and compliance.

### Cloud scopes integration

Cloud accounts can be segmented into logical groups enabling:

- Better data pivoting and access control
- Multi-tenant management capabilities
- Organization by business unit, geography, or workload
- Persistent filtering across dashboards and workflows

For detailed information on configuring cloud scopes, see [Cloud scopes and Unified RBAC](cloud-scopes-unified-rbac.md).

## Use cases by persona

### Cloud Security Administrators

- Monitor and manage security posture across cloud and code environments
- Use the overview dashboard to identify top actions and track organizational security status over time
- Implement and track remediation across multi-cloud environments

### Security Operations Center (SOC) Teams

- Investigate and respond to incidents using integrated cloud data
- Leverage attack paths and asset context for comprehensive threat analysis
- Access unified alerting and incident management across cloud and endpoint environments

### Vulnerability Management Administrators

- View and manage cloud vulnerabilities alongside endpoint vulnerabilities
- Benefit from unified Exposure Management experience with risk-based prioritization
- Track remediation progress across hybrid environments

### Developers and DevOps Teams

- Access security insights relevant to their cloud resources (APIs, containers, applications)
- View security posture without requiring permissions in native cloud portals
- Integrate security into development workflows through unified visibility

### Managed Security Service Providers (MSSPs)

- Use cloud scopes and RBAC to manage customer environments securely
- Provide scoped access to posture, recommendations, and inventory
- Deliver comprehensive security services across customer cloud environments

### Compliance and Risk Teams

- Export filtered reports on security posture, vulnerabilities, and asset exposure
- Support audits and risk assessments with comprehensive cloud security data
- Track compliance across multi-cloud environments through unified reporting

## Navigation and access

### Prerequisites for access

- **Licensing**: Microsoft Defender for Cloud plans enabled across your cloud environments
- **Portal access**: Microsoft Defender XDR portal permissions
- **Exposure Management**: Microsoft Security Exposure Management enabled for enhanced experience
- **Vulnerability Management**: Microsoft Defender Vulnerability Management for comprehensive coverage

### Required roles and permissions

- **Security Reader** or higher in Defender portal for read access
- **Exposure Management Contributor** for testing recommendations and attack paths
- **Cloud Security Administrator** for configuration and policy management

### Finding cloud security features

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com)
1. Select **Cloud Infrastructure** from the main navigation
1. Access specific cloud security functions:
   - **Overview**: Cloud Infrastructure > Overview
   - **Asset Inventory**: Assets > Cloud Infrastructure
   - **Recommendations**: Exposure Management > Recommendations > Cloud tab
   - **Attack Paths**: Exposure Management > Attack surface > Attack paths
   - **Vulnerability Management**: Exposure Management > Vulnerability Management > Cloud

## Integration with Exposure Management

Cloud security capabilities are fully integrated into Microsoft Security Exposure Management, providing:

### Unified recommendations catalog

Cloud recommendations are now part of the comprehensive recommendations experience, organized alongside device, identity, SaaS, and data recommendations for complete security posture management.

### Risk-based cloud recommendations

For the first time in the Defender portal, cloud recommendations are prioritized by risk, helping teams focus on what matters most with enhanced context about asset value and potential impact.

### Cloud attack paths

Visualize attack paths that include cloud assets, enabling security teams to understand how threats could traverse cloud environments and reach critical business assets.

### Integrated vulnerability management

Cloud vulnerabilities appear alongside device vulnerabilities in the unified Vulnerability Management experience, providing comprehensive vulnerability coverage across your digital estate.

## Getting started

### For existing Defender for Cloud users

1. **Access the unified portal**: Navigate to security.microsoft.com and explore the Cloud Infrastructure section
1. **Familiarize yourself with the new layout**: Review the integrated dashboard and navigation
1. **Explore enhanced capabilities**: Check out cloud scopes, unified recommendations, and integrated attack paths
1. **Configure cloud scopes**: Set up appropriate access controls for your organization

### For new cloud security users

1. **Review prerequisites**: Ensure you have appropriate licensing and permissions
1. **Start with the overview**: Use the Cloud Infrastructure overview to understand your cloud security posture
1. **Explore recommendations**: Navigate to the unified recommendations for actionable cloud security insights
1. **Set up monitoring**: Configure alerts and notifications for your cloud environments

### Migration considerations

- **Existing workflows**: Most existing Defender for Cloud capabilities are preserved in the new interface
- **Data access**: All historical data remains available with enhanced context and visualization
- **Permissions**: Cloud scopes provide more granular access control than previous implementations
- **Reporting**: Enhanced reporting capabilities with better filtering and export options

## Limitations and considerations

### Current limitations

- Resources tied to free subscriptions are currently not displayed during the preview period
- Some resources sourced from Azure Policy may not appear if they lack Defender for Cloud security context
- Event timeline widget access has moved to dashboard widgets rather than the navigation bar

### Cloud scopes considerations

- Unified RBAC operates differently from native cloud portal permissions
- Cloud scopes configuration is not dynamic and cannot be selected based on conditions currently
- Some cross-environment experiences may have limited scope filtering initially

### Compliance and regulatory features

During this initial integration phase, some regulatory compliance features may be read-only in the Defender portal, with full administrative functions planned for subsequent releases.

## Next steps

- [Configure cloud scopes and Unified RBAC](cloud-scopes-unified-rbac.md)
- [Explore the cloud asset inventory](cloud-asset-inventory.md)
- [Review cloud recommendations in the unified catalog](security-recommendations.md)
- [Investigate cloud attack paths](work-attack-paths-overview.md)
- [Manage cloud vulnerabilities](vulnerability-management-integration.md)
