---
title: Get Started with Microsoft Defender for Cloud in the Defender Portal
description: Learn how to get started with Microsoft Defender for Cloud in the Microsoft Defender Portal. This guide covers onboarding, key features, and essential tasks for new users.
author: dlanger
ms.author: dlanger
ms.topic: get-started
ms.date: 08/26/2025
ms.service: defender-for-cloud
#customer intent: As a security professional, I want to get started with Microsoft Defender for Cloud in the Defender Portal so that I can protect my cloud resources effectively.
---

# Get started with Microsoft Defender for Cloud in the Defender Portal

Welcome to Microsoft Defender for Cloud in the Microsoft Defender Portal. This guide will help you get started, understand key concepts, and navigate essential features to secure your cloud environment.

## What is Microsoft Defender for Cloud?

Microsoft Defender for Cloud is a [Cloud Native Application Protection Platform (CNAPP)](../concept-cloud-security-posture-management.md) that provides unified security management and advanced threat protection across hybrid cloud workloads. It combines three core pillars:

- **Development Security Operations (DevSecOps)** - Secure code pipelines and environments
- **Cloud Security Posture Management (CSPM)** - Improve security posture across cloud resources  
- **Cloud Workload Protection Platform (CWPP)** - Defend workloads from threats

> [!TIP]
> New to cloud security? Start with [What is Microsoft Defender for Cloud?](../defender-for-cloud-introduction.md) for a comprehensive overview.

## Step 1: Access the Defender Portal

1. Navigate to the [Microsoft Defender Portal](https://security.microsoft.com)
2. Sign in with your organizational account
3. In the navigation pane, select **Cloud Security** to access Defender for Cloud features

## Step 2: Connect Your Environments

Connect your cloud and on-premises environments to begin monitoring:

### Azure Subscriptions
- [Connect your Azure subscriptions](../connect-azure-subscription.md)
- [Enable enhanced security features](../enable-enhanced-security.md)

### Multicloud Environments  
- [Connect AWS accounts](../quickstart-onboard-aws.md)
- [Connect GCP projects](../quickstart-onboard-gcp.md)

### On-Premises and Hybrid
- [Connect on-premises machines](../quickstart-onboard-machines.md)
- [Onboard machines with Defender for Endpoint](../onboard-machines-with-defender-for-endpoint.md)

## Step 3: Enable Defender Plans

Choose the right protection plans for your workloads:

| Plan | What it protects | Get started |
|------|------------------|-------------|
| **Defender CSPM** | Advanced posture management, attack paths, governance | [Enable Defender CSPM](../tutorial-enable-cspm-plan.md) |
| **Defender for Servers** | Virtual machines and servers | [Deploy Defender for Servers](../tutorial-enable-servers-plan.md) |
| **Defender for Containers** | Kubernetes clusters and container images | [Enable Defender for Containers](../tutorial-enable-containers-azure.md) |
| **Defender for Databases** | SQL databases, PostgreSQL, MySQL, Cosmos DB | [Protect your databases](../tutorial-enable-databases-plan.md) |
| **Defender for Storage** | Blob storage, file shares, data lakes | [Deploy Defender for Storage](../tutorial-enable-storage-plan.md) |
| **Defender for App Service** | Web applications and APIs | [Protect App Service apps](../tutorial-enable-app-service-plan.md) |

> [!NOTE]
> All Azure subscriptions include free foundational CSPM capabilities. Enhanced plans provide advanced threat protection and additional features.

## Step 4: Understand Your Security Posture

### Security Dashboard
Review your security overview in the Defender Portal:
- **Secure Score** - Measures your security posture improvement
- **Active Recommendations** - Actionable steps to improve security
- **Security Alerts** - Real-time threat notifications

### Key Areas to Review
1. **[Secure Score](../secure-score-security-controls.md)** - Track and improve your security posture
2. **[Recommendations](../review-security-recommendations.md)** - Prioritize security improvements
3. **[Security Alerts](../managing-and-responding-alerts.yml)** - Monitor and respond to threats
4. **[Asset Inventory](../asset-inventory.md)** - View all connected resources

## Essential Tasks for New Users

### Configure Notifications
- [Set up email notifications](../configure-email-notifications.md) for security alerts
- Configure integration with SIEM/SOAR solutions

### Set Up Governance
- [Create governance rules](../governance-rules.md) to assign remediation tasks
- Establish security policies aligned with your compliance requirements

### Enable Advanced Features
- **[Attack Path Analysis](../concept-attack-path.md)** - Identify potential attack routes
- **[Cloud Security Explorer](../how-to-manage-cloud-security-explorer.md)** - Query your security graph
- **[Data Security Posture](../concept-data-security-posture.md)** - Discover and protect sensitive data

## DevOps Security Integration

Secure your development pipelines:
- [Connect Azure DevOps](../quickstart-onboard-devops.md)
- [Connect GitHub repositories](../quickstart-onboard-github.md)  
- [Connect GitLab projects](../quickstart-onboard-gitlab.md)

## AI and Advanced Analytics

Leverage AI-powered security insights:
- **[AI Security Posture](../ai-security-posture.md)** - Manage AI workload security
- **[Microsoft Copilot in Defender for Cloud](../copilot-security-in-defender-for-cloud.md)** - Get AI-assisted security guidance

## Monitor and Respond to Threats

### Security Alerts and Incidents
- [Understand security alerts](../alerts-overview.md)
- [Manage security incidents](../incidents.md)
- [Validate alert configurations](../alert-validation.md)

### Integration Options
- [Export to SIEM systems](../export-to-siem.md)
- [Continuous export configuration](../continuous-export.md)
- [ServiceNow integration](../connect-servicenow.md)

## Next Steps

### Quick Wins
1. Review your secure score and implement high-impact recommendations
2. Enable Defender plans for your critical workloads
3. Configure email notifications for security alerts
4. Set up governance rules for systematic remediation

### Learn More
- [Planning and operations guide](../defender-for-cloud-planning-and-operations-guide.md)
- [Multicloud security planning](../plan-multicloud-security-get-started.md)
- [Cost estimation with the calculator](../cost-calculator.md)

### Training Resources
- [Microsoft Learn: Defender for Cloud learning path](https://learn.microsoft.com/training/paths/sc-200-mitigate-threats-using-microsoft-defender-for-cloud/)
- [Interactive demo walkthrough](https://mslearn.cloudguides.com/guides/Protect%20your%20multi-cloud%20environment%20with%20Microsoft%20Defender%20for%20Cloud)

### Get Support
- [Common questions about Defender for Cloud](faq-general.md)
- [Microsoft Tech Community](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/bd-p/MicrosoftDefenderCloud)
- [Submit feedback and feature requests](https://feedback.azure.com/d365community/forum/8db0ad8f-3d64-ec11-b6e6-000d3a4f07b8)

## Related Articles

- [What is Microsoft Defender for Cloud?](../defender-for-cloud-introduction.md)
- [Cloud Security Posture Management overview](../concept-cloud-security-posture-management.md)
- [Defender for Cloud glossary](../defender-for-cloud-glossary.md)
- [What's new in Defender for Cloud](../release-notes.md)
