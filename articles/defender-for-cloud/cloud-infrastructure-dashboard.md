---
title: Cloud Infrastructure Overview Dashboard in Microsoft Defender for Cloud
description: Learn how to use the Cloud Infrastructure Overview Dashboard to monitor security posture, threat protection, and exposure management across your multi-cloud environment.
ms.topic: how-to
ms.date: 09/03/2025
ms.author: dacurwin
author: dcurwin
zone_pivot_groups: defender-portal-experience
#customer intent: As a security analyst, I want to use the Cloud Infrastructure Overview Dashboard to get unified visibility into my cloud security posture across Azure, AWS, and GCP.
---

# Cloud Infrastructure Overview dashboard (preview)

::: zone pivot="defender-portal"

> > [!IMPORTANT]
> Microsoft Defender for Cloud is expanding to the Defender portal to provide a unified security experience across cloud and code environments. As part of this expansion, some features are now available in the Microsoft Defender Portal, and additional capabilities will be added to the Defender portal over time.
> 
> This change is designed to:
> - Unlock new cloud and posture management experiences.
> - Provide deep integration with other Microsoft security services.
> - Empower security teams with streamlined workflows by bringing all tools together in one portal.
> 
> To identify documentation specific for the Defender Portal, look for the portal entry point at the top of the article. This pivot indicates whether the content applies to the Defender portal or the Azure portal.
> 
> Our documentation will be continuously updated to reflect these changes, so check back regularly for the latest guidance and feature availability.
> 
> Review the known limitations article to understand current gaps during the preview phase.

The Cloud Infrastructure Overview Dashboard in the Microsoft Defender portal revolutionizes cloud visibility by embedding Microsoft Defender for Cloud directly into the Defender XDR experience. This unified dashboard consolidates Security Posture, Defender coverage, cloud assets, health data, and Exposure Management insights and trends across Azure, AWS, and GCP environments.

## Access the dashboard

You can access the Cloud Infrastructure Overview Dashboard from the left navigation bar in the Microsoft Defender portal:

1. Navigate to **Cloud Infrastructure** > **Overview**

The dashboard eliminates the need to toggle between portals, enabling security teams to triage, investigate, and respond to threats with full context.

## Dashboard components

The unified Cloud Infrastructure Overview Dashboard consolidates security posture, Defender coverage, cloud assets, health data, and exposure insights across Azure, AWS, and GCP. The dashboard is organized into key sections:

### Top Actions

Quick access to high-priority security tasks:
- **Critical attack paths**: Immediate investigation of high-risk attack scenarios
- **High-priority security recommendations**: Focus on most impactful security improvements
- **Urgent threat responses**: Quick access to active security incidents requiring attention

### Security Posture

Comprehensive security posture management with:
- **Cloud Secure Score trends**: View score progression over time with built-in overtime tracking
- **Security Recommendations**: Prioritized list of security improvements
- **Compliance insights**: Track compliance with security standards and frameworks
- **Remediation tracking**: Monitor progress of security improvements

### Threat Detection

Advanced threat protection monitoring:
- **Security alerts across environments**: Unified view of threats across Azure, AWS, and GCP
- **Alert severity breakdown**: Categorized view of High, Medium, and Low severity threats
- **Incident correlation**: Connection between cloud threats and broader organizational security events
- **Response workflows**: Streamlined incident response across all Microsoft security solutions

### Workload Insights

Workload-specific pivots with detailed asset summary, coverage, insights, and risk level:

- **VMs (Virtual Machines)**: 
  - Asset count and security coverage status
  - Vulnerability insights and patch management
  - Risk level assessment based on exposure factors

- **Data**: 
  - Database and storage security posture
  - Data sensitivity and classification insights
  - Access control and encryption status

- **APIs**: 
  - API security posture and threat exposure
  - Authentication and authorization controls
  - Traffic analysis and anomaly detection

- **DevOps**: 
  - Code repository security insights
  - CI/CD pipeline security assessment
  - Infrastructure as Code (IaC) security validation

- **CIEM (Cloud Infrastructure Entitlement Management)**: 
  - Identity and access rights analysis
  - Privilege escalation risk assessment
  - Unused and excessive permissions identification

Each workload section provides:
- **Asset Summary**: Total count and categorization of resources
- **Coverage Status**: Defender for Cloud protection deployment status
- **Security Insights**: Key security findings and recommendations
- **Risk Level**: Contextual risk assessment based on environmental factors

## Dashboard filtering and customization

### Time frame selection

Use the time frame selector to customize your view:

1. Click the **"Last 7 days"** button in the top-right corner
1. Select from predefined ranges or custom date ranges up to 6 months
1. View historical trends and long-term security posture evolution

### Environment filtering

Focus on specific environments using the Environment filter:

1. Select **Environment filter** to choose specific cloud environments
1. Filter by individual subscriptions, AWS accounts, or GCP projects
1. View consolidated data across selected environments

### Scope filtering

Apply granular filtering using the scope filter:

1. Use **Scope filter** to focus on specific areas:
   - **Unified Defender RBAC with cloud scopes**: Filter based on organizational boundaries
   - **Device groups**: Focus on endpoint-specific data when relevant

The scope filter maintains your selection as you navigate between different experiences, ensuring consistent context throughout your security review process.

## Key capabilities

### Enriched inventory views

- **Asset visibility**: Comprehensive view of all cloud resources across environments
- **Health indicators**: Real-time status of asset security and compliance
- **Coverage metrics**: Track which assets are protected by Defender for Cloud

### Attack path mapping

- **Visual attack paths**: See potential routes attackers could take through your environment
- **Critical path identification**: Focus on the most dangerous attack scenarios
- **Choke point analysis**: Identify convergence points where multiple attack paths intersect

### Defender coverage metrics

- **Protection status**: Monitor which workloads have Defender protection enabled
- **Coverage gaps**: Identify unprotected resources that need attention
- **Deployment insights**: Track Defender for Cloud deployment across your environment

## Best practices for dashboard use

### Daily security review

1. **Start with the overview**: Review the summary cards for overall security health
1. **Check recent trends**: Look for significant changes in security posture or alert volumes
1. **Investigate critical items**: Drill down into high-priority alerts or attack paths
1. **Monitor coverage**: Ensure critical assets maintain appropriate Defender coverage

### Incident response workflow

1. **Use filtering**: Apply appropriate scope and environment filters to focus on affected areas
1. **Correlate data**: View security alerts in the context of attack paths and asset exposure
1. **Track progress**: Monitor remediation efforts through historical trend data

### Regular security posture assessment

1. **Review score trends**: Analyze Cloud Secure Score progression over time
1. **Identify patterns**: Look for recurring security issues or improvement opportunities
1. **Plan remediation**: Use recommendation trends to prioritize security investments

## Integration with other experiences

The Cloud Infrastructure Overview Dashboard serves as a central hub that connects to detailed experiences:

- **Attack surface management**: Navigate to detailed attack path analysis
- **Asset inventory**: Drill down into specific resource details
- **Vulnerability management**: Access comprehensive vulnerability insights
- **Exposure management**: Explore detailed risk analysis and mitigation recommendations

::: zone-end

::: zone pivot="azure-portal"

## Cloud Infrastructure Overview Dashboard

The Cloud Infrastructure Overview Dashboard is primarily available through the Microsoft Defender portal experience, where it provides unified visibility across Azure, AWS, and GCP environments integrated with Defender XDR capabilities.

In the Azure portal, you can access cloud security information through:

- **Microsoft Defender for Cloud** > **Overview**: Basic security posture and recommendations for Azure resources
- **Security Center**: Classic Azure-specific security dashboard
- **Workbooks**: Custom security dashboards and reporting

For comprehensive multi-cloud infrastructure overview with integrated Exposure Management, attack path analysis, and unified threat protection insights, use the Microsoft Defender portal experience.

::: zone-end

## Next steps

- [Explore attack paths and security insights](concept-attack-path.md)
- [Review cloud infrastructure assets](asset-inventory.md)
- [Configure cloud scopes for filtering](cloud-scopes-unified-rbac.md)
- [Set up vulnerability management](auto-deploy-vulnerability-assessment.md)
- [Configure email notifications](configure-email-notifications.md)
