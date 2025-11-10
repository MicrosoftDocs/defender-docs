---
title: Cloud overview dashboard in Microsoft Defender for Cloud
description: Learn how to use the Cloud overview dashboard to monitor security posture, threat protection, and exposure management across your multi-cloud environment.
ms.topic: how-to
ms.date: 09/03/2025
ms.author: dacurwin
author: dcurwin
zone_pivot_groups: defender-portal-experience
#customer intent: As a security analyst, I want to use the Cloud overview dashboard to get unified visibility into my cloud security posture across Azure, AWS, and GCP.
---

# Cloud overview dashboard (preview)

::: zone pivot="defender-portal"

> [!IMPORTANT]
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

The Cloud overview dashboard in the Microsoft Defender portal revolutionizes cloud visibility by embedding Microsoft Defender for Cloud directly into the Defender XDR experience. This unified dashboard consolidates Security Posture, Defender coverage, cloud assets, health data, and Exposure Management insights and trends across Azure, AWS, and GCP environments.

## Access the dashboard

You can access the Cloud Overview dashboard from the left navigation bar in the Microsoft Defender portal:

1. Navigate to **Cloud** > **Overview**

The dashboard eliminates the need to toggle between portals, enabling security teams to triage, investigate, and respond to threats with full context.

## Dashboard components

The unified Cloud Overview dashboard consolidates security posture, Defender coverage, cloud assets, health data, and exposure insights across Azure, AWS, and GCP. The dashboard is organized into key sections:

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

The Cloud Overview dashboard serves as a central hub that connects to detailed experiences:

- **Attack surface management**: Navigate to detailed attack path analysis
- **Asset inventory**: Drill down into specific resource details
- **Vulnerability management**: Access comprehensive vulnerability insights
- **Exposure management**: Explore detailed risk analysis and mitigation recommendations

::: zone-end

::: zone pivot="azure-portal"

Microsoft Defender for Cloud gives a unified view of the security posture of hybrid cloud workloads with the interactive **Overview** dashboard. Select any element on the dashboard to get more information.

:::image type="content" source="./media/overview-page/overview-07-2023.png" alt-text="Screenshot of Defender for Cloud's overview page." lightbox="./media/overview-page/overview-07-2023.png":::

## Metrics

The **top menu bar** offers:

- **Subscriptions** - View and filter the list of subscriptions by selecting this button. Defender for Cloud adjusts the display to reflect the security posture of the selected subscriptions.
- **What's new** - Opens the [release notes](release-notes.md) to stay updated with new features, bug fixes, and deprecated functionality.
- **High-level numbers** for the connected cloud accounts, showing the context of the information in the main tiles, and the number of assessed resources, active recommendations, and security alerts. Select the assessed resources number to access [Asset inventory](asset-inventory.md). Learn more about connecting your [Amazon Web Services (AWS) accounts](quickstart-onboard-aws.md) and your [Google Cloud Platform (GCP) projects](quickstart-onboard-gcp.md).

:::image type="content" source="./media/overview-page/top-bar-of-overview-new.png" alt-text="Screenshot of Defender for Cloud's overview page's top bar." lightbox="media/overview-page/top-bar-of-overview-new.png":::

## Feature tiles

The center of the page displays the feature tiles, each linking to a high-profile feature or dedicated dashboard:

- **Security posture** - Defender for Cloud continually assesses your resources, subscriptions, and organization for security issues. It then aggregates all the findings into a single score so you can understand, at a glance, your current security situation: the higher the score, the lower the identified risk level. [Learn more](secure-score-security-controls.md).
- **Workload protections** - The cloud workload protection platform (CWPP) integrated within Defender for Cloud for advanced, intelligent protection of your workloads running on Azure, on-premises machines, or other cloud providers. For each resource type, there's a corresponding Microsoft Defender plan. The tile shows the coverage of your connected resources (for the currently selected subscriptions) and the recent alerts, color-coded by severity. Learn more about [the Defender plans](defender-for-cloud-introduction.md#cloud-workload-protection-platform-cwpp).
- **Regulatory compliance** - Based on continuous assessments of your hybrid and multicloud resources, Defender for Cloud provides insights into your compliance with the standards that matter to your organization. Defender for Cloud analyzes risk factors in your environment according to security best practices. These assessments are mapped to compliance controls from a supported set of standards. [Learn more](regulatory-compliance-dashboard.md).
- **Inventory** - The asset inventory page of Microsoft Defender for Cloud provides a single page for viewing the security posture of the resources you connected to Microsoft Defender for Cloud. All resources with unresolved security recommendations are shown in the inventory. If you enabled the integration with Microsoft Defender for Endpoint and enabled Microsoft Defender for Servers, you also have access to a software inventory. The tile on the overview page shows you at a glance the total healthy and unhealthy resources (for the currently selected subscriptions). [Learn more](asset-inventory.md).

## Insights

The Insights pane offers customized items for your environment including:

- **Actionable items to enhance your security.**
- **Tips to handle alerts and recommendations.**
- **Recommendations on how to upgrade your service to enhance your environment's protections.**
- **Recent blog posts by Microsoft Defender for Cloud experts.**

::: zone-end

## Next steps

- [Explore attack paths and security insights](concept-attack-path.md)
- [Review cloud infrastructure assets](asset-inventory.md)
- [Configure cloud scopes for filtering](cloud-scopes-unified-rbac.md)
- [Set up vulnerability management](auto-deploy-vulnerability-assessment.md)
- [Configure email notifications](configure-email-notifications.md)
