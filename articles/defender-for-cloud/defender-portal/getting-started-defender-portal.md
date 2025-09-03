---
title: Get started with Microsoft Defender for Cloud in the Defender portal
description: Learn how to get started with Microsoft Defender for Cloud in the Microsoft Defender portal. This guide covers onboarding, key features, and essential tasks for new users.
author: dlanger
ms.author: dlanger
ms.topic: get-started
ms.date: 09/03/2025
ms.service: defender-for-cloud
#customer intent: As a security professional, I want to get started with Microsoft Defender for Cloud in the Defender portal so that I can protect my cloud resources effectively.
---

# Getting started in the Defender portal

Welcome to Microsoft Defender for Cloud in the Microsoft Defender portal. This guide will help you get started, understand key concepts, and navigate essential features to secure your cloud environment.

## What is Microsoft Defender for Cloud?

Microsoft Defender for Cloud is a [Cloud Native Application Protection Platform (CNAPP)](../concept-cloud-security-posture-management.md) that provides unified security management and advanced threat protection across hybrid cloud workloads. It combines three core pillars:

- **Development Security Operations (DevSecOps)** - Secure code pipelines and environments
- **Cloud Security Posture Management (CSPM)** - Improve security posture across cloud resources  
- **Cloud Workload Protection Platform (CWPP)** - Defend workloads from threats

> [!TIP]
> New to cloud security? Start with [What is Microsoft Defender for Cloud?](../defender-for-cloud-introduction.md) for a comprehensive overview.

## Step 1: Access the Defender portal

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com)
2. Sign in with your organizational account
3. In the navigation pane, select **Cloud Security** to access Defender for Cloud features

## Step 2: Connect your environments

Connect your cloud and on-premises environments to begin monitoring:

| Environment Type | Description | Getting Started |
|------------------|-------------|-----------------|
| **Azure Subscriptions** | Connect Azure subscriptions and enable security features | [Connect your Azure subscriptions](../connect-azure-subscription.md)<br>[Enable enhanced security features](../enable-enhanced-security.md) |
| **AWS Accounts** | Connect Amazon Web Services accounts | [Connect AWS accounts](../quickstart-onboard-aws.md) |
| **GCP Projects** | Connect Google Cloud Platform projects | [Connect GCP projects](../quickstart-onboard-gcp.md) |
| **On-Premises Machines** | Connect on-premises and hybrid environments | [Connect on-premises machines](../quickstart-onboard-machines.md)<br>[Onboard machines with Defender for Endpoint](../onboard-machines-with-defender-for-endpoint.md) |

## Step 3: Enable Defender plans

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

## Step 4: Understand your security posture

Review your security overview in the Defender portal and focus on these key areas:

| Security Component | Description | Actions |
|-------------------|-------------|---------|
| **[Secure Score](../secure-score-access-and-track.md)** | Measures your security posture improvement | Track progress and implement recommendations to improve your score |
| **[Recommendations](../review-security-recommendations.md)** | Actionable steps to improve security | Prioritize and remediate security improvements |
| **[Security Alerts](../managing-and-responding-alerts.yml)** | Real-time threat notifications | Monitor and respond to active threats |
| **[Cloud Infrastructure Dashboard](../cloud-infrastructure-dashboard.md)** | Unified dashboard for cloud security visibility | Access centralized view of security posture, threats, and coverage across Azure, AWS, and GCP |
| **[Asset Inventory](../asset-inventory.md?pivots=defender-portal)** | Complete view of connected resources with workload-specific insights | Review all resources under protection and their security status with enhanced filtering |

## Essential tasks for new users

| Task Category | Feature | Description | Getting Started |
|---------------|---------|-------------|-----------------|
| **Notifications** | Email Alerts | Receive security alerts via email with cloud scopes integration | [Set up email notifications](../configure-email-notifications.md?pivots=defender-portal) |
| **Notifications** | SIEM/SOAR Integration | Connect with security orchestration tools | Configure integration with SIEM/SOAR solutions |
| **Governance** | Governance Rules | Assign remediation tasks automatically | [Create governance rules](../governance-rules.md) |
| **Governance** | Security Policies | Establish compliance requirements | Establish security policies aligned with your compliance requirements |
| **Advanced Analytics** | Attack Path Analysis | Identify potential attack routes with choke point detection | [Attack Path Analysis](../concept-attack-path.md?pivots=defender-portal) |
| **Advanced Analytics** | Attack Path Management | Remediate attack paths in Defender portal | [Manage Attack Paths](../how-to-manage-attack-path.md?pivots=defender-portal) |
| **Advanced Analytics** | Vulnerability Management | Enhanced vulnerability insights with risk prioritization | [Vulnerability Management](../auto-deploy-vulnerability-assessment.md?pivots=defender-portal) |
| **Advanced Analytics** | Cloud Scopes & RBAC | Granular access control and resource scoping | [Cloud Scopes and Unified RBAC](../cloud-scopes-unified-rbac.md) |
| **Advanced Analytics** | Cloud Security Explorer | Query your security graph | [Cloud Security Explorer](../how-to-manage-cloud-security-explorer.md) |
| **Advanced Analytics** | Data Security Posture | Discover and protect sensitive data | [Data Security Posture](../concept-data-security-posture.md) |

## DevOps security integration

Secure your development pipelines:

| Platform | Description | Getting Started |
|----------|-------------|-----------------|
| **Azure DevOps** | Connect Azure DevOps organizations and projects | [Connect Azure DevOps](../quickstart-onboard-devops.md) |
| **GitHub** | Connect GitHub repositories for code security | [Connect GitHub repositories](../quickstart-onboard-github.md) |
| **GitLab** | Connect GitLab projects for pipeline security | [Connect GitLab projects](../quickstart-onboard-gitlab.md) |

## AI and advanced analytics

Leverage AI-powered security insights:

| AI Feature | Description | Getting Started |
|------------|-------------|-----------------|
| **[AI Security Posture](../ai-security-posture.md)** | Manage AI workload security and compliance | Monitor and secure your AI/ML workloads |
| **[Microsoft Copilot in Defender for Cloud](../copilot-security-in-defender-for-cloud.md)** | Get AI-assisted security guidance and insights | Access AI-powered security recommendations and analysis |

## Monitor and respond to threats

| Category | Feature | Description | Getting Started |
|----------|---------|-------------|-----------------|
| **Alerts & Incidents** | Security Alerts | Learn about threat detection and alert types | [Understand security alerts](../alerts-overview.md) |
| **Alerts & Incidents** | Incident Management | Manage and investigate security incidents | [Manage security incidents](../incidents.md) |
| **Alerts & Incidents** | Alert Validation | Test and validate security alert configurations | [Validate alert configurations](../alert-validation.md) |
| **Integration** | SIEM Export | Export security data to SIEM systems | [Export to SIEM systems](../export-to-siem.md) |
| **Integration** | Continuous Export | Configure ongoing data export to external systems | [Continuous export configuration](../continuous-export.md) |
| **Integration** | ServiceNow | Integrate with ServiceNow for incident management | [ServiceNow integration](../connect-servicenow.md) |

## Next steps

### Quick wins
1. Review your secure score and implement high-impact recommendations
2. Enable Defender plans for your critical workloads
3. Configure email notifications for security alerts
4. Set up governance rules for systematic remediation

### Learn more
- [Planning and operations guide](../defender-for-cloud-planning-and-operations-guide.md)
- [Multicloud security planning](../plan-multicloud-security-get-started.md)
- [Cost estimation with the calculator](../cost-calculator.md)

### Training resources
- [Microsoft Learn: Defender for Cloud learning path](/training/paths/sc-200-mitigate-threats-using-azure-defender/)
- [Interactive demo walkthrough](https://mslearn.cloudguides.com/guides/Protect%20your%20multi-cloud%20environment%20with%20Microsoft%20Defender%20for%20Cloud)

### Get support
- [Common questions about Defender for Cloud](../faq-general.yml)
- [Microsoft Tech Community](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/bd-p/MicrosoftDefenderCloud)
- [Submit feedback and feature requests](https://feedback.azure.com/d365community/forum/8db0ad8f-3d64-ec11-b6e6-000d3a4f07b8)

## Related articles

- [What is Microsoft Defender for Cloud?](../defender-for-cloud-introduction.md)
- [Cloud Security Posture Management overview](../concept-cloud-security-posture-management.md)
- [Defender for Cloud glossary](../defender-for-cloud-glossary.md)
- [What's new in Defender for Cloud](../release-notes.md)
