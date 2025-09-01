---
title: Microsoft Defender for Cloud in the Defender Portal - Complete Overview
description: Comprehensive guide to Microsoft Defender for Cloud capabilities in the unified Microsoft Defender portal, covering cloud introduction, getting started, security posture management, and threat protection.
author: dlanger
ms.author: dlanger
ms.topic: overview
ms.date: 09/01/2025
ms.service: defender-for-cloud
---

# Microsoft Defender for Cloud in the Defender Portal - Complete Overview

Welcome to Microsoft Defender for Cloud's unified experience in the Microsoft Defender portal. This comprehensive guide covers everything you need to know about protecting your cloud environments through the integrated security platform.

:::row:::
   :::column span="":::
      ## Intro to Cloud Security

      ### What is Defender for Cloud?
      Microsoft Defender for Cloud is a comprehensive Cloud Native Application Protection Platform (CNAPP) that provides unified security management and advanced threat protection across hybrid cloud workloads. Now fully integrated into the Microsoft Defender portal, it offers enhanced capabilities through seamless integration with the broader Microsoft security ecosystem.

      ### Core Pillars
      - **Development Security Operations (DevSecOps)** - Secure code pipelines and development environments
      - **Cloud Security Posture Management (CSPM)** - Improve security posture across cloud resources
      - **Cloud Workload Protection Platform (CWPP)** - Defend workloads from active threats

      ### Unified Portal Benefits
      The integration with Microsoft Defender portal provides:
      - **Cross-service correlation** - Automatic correlation of alerts across cloud, endpoint, and identity
      - **Unified incident management** - All security events in one centralized location
      - **Enhanced investigation** - Advanced hunting across all Microsoft security signals
      - **AI-powered insights** - Microsoft Security Copilot integration for intelligent analysis

      ### Multi-Cloud Protection
      Protect resources across:
      - Microsoft Azure subscriptions
      - Amazon Web Services (AWS) accounts
      - Google Cloud Platform (GCP) projects
      - On-premises and hybrid environments
   :::column-end:::
   :::column span="":::
      ## Get Started

      ### Access the Defender Portal
      1. Navigate to [Microsoft Defender portal](https://security.microsoft.com)
      2. Sign in with your organizational account
      3. Select **Cloud Security** in the navigation pane

      ### Connect Your Environments
      **Azure Subscriptions**
      - [Connect Azure subscriptions](connect-azure-subscription.md)
      - [Enable enhanced security features](enable-enhanced-security.md)

      **Multi-Cloud Environments**
      - [Connect AWS accounts](quickstart-onboard-aws.md)
      - [Connect GCP projects](quickstart-onboard-gcp.md)
      - [Connect on-premises machines](quickstart-onboard-machines.md)

      ### Enable Protection Plans
      Choose the right plans for your workloads:

      | Plan | Protects |
      |------|----------|
      | **Defender CSPM** | Advanced posture management, attack paths |
      | **Defender for Servers** | Virtual machines and servers |
      | **Defender for Containers** | Kubernetes clusters and images |
      | **Defender for Databases** | SQL, PostgreSQL, MySQL, Cosmos DB |
      | **Defender for Storage** | Blob storage, file shares, data lakes |
      | **Defender for App Service** | Web applications and APIs |

      ### Essential First Tasks
      - Review your Secure Score
      - Configure email notifications
      - Set up governance rules
      - Enable continuous export to SIEM
      - Connect DevOps environments (Azure DevOps, GitHub, GitLab)
   :::column-end:::
:::row-end:::

:::row:::
   :::column span="":::
      ## Security Posture & Compliance

      ### Cloud Security Posture Management
      **Secure Score**
      - Measures your security posture improvement
      - Provides actionable recommendations
      - Tracks progress over time
      - Prioritizes high-impact security controls

      **Security Recommendations**
      - Real-time security guidance
      - Automated remediation options
      - Integration with governance workflows
      - Compliance mapping to industry standards

      ### Advanced Analytics
      **Attack Path Analysis**
      - Identifies potential attack routes through your environment
      - Visualizes lateral movement possibilities
      - Prioritizes critical security gaps
      - Provides step-by-step remediation guidance

      **Cloud Security Explorer**
      - Query your security graph with natural language
      - Investigate complex security scenarios
      - Build custom security queries
      - Export results for further analysis

      ### Regulatory Compliance
      - **Built-in standards** - Azure Security Benchmark, PCI DSS, SOC 2, ISO 27001
      - **Custom policies** - Create organization-specific compliance requirements
      - **Compliance dashboard** - Track adherence across all environments
      - **Audit reports** - Generate compliance documentation

      ### Data Security Posture
      - Discover sensitive data across cloud workloads
      - Classify data based on sensitivity levels
      - Monitor data access patterns
      - Detect data exposure risks
   :::column-end:::
   :::column span="":::
      ## Threat Protection & Response

      ### Advanced Threat Detection
      **Security Alerts**
      - Real-time threat detection across all cloud workloads
      - AI-powered behavioral analytics
      - Integration with Microsoft Threat Intelligence
      - Automated alert correlation and deduplication

      **Incident Management**
      - Unified incident queue in Defender portal
      - Automatic incident correlation across services
      - AI-assisted investigation guidance
      - Collaborative investigation workflows

      ### Response Capabilities
      **Microsoft Defender XDR Integration**
      - Unified incident response across cloud, endpoint, and identity
      - Cross-domain attack visibility
      - Centralized case management
      - Automated response playbooks

      **Advanced Hunting**
      - Query cloud audit events with KQL
      - Hunt across all Microsoft security signals
      - Create custom detection rules
      - Share threat intelligence with community

      ### AI and Automation
      **Microsoft Security Copilot**
      - AI-powered incident summarization
      - Automated threat analysis
      - Natural language query generation
      - Guided response recommendations

      **Automated Response**
      - Logic Apps integration for automated workflows
      - ServiceNow ticketing integration
      - SIEM/SOAR connector support
      - Custom automation playbooks

      ### Threat Intelligence
      - Microsoft global threat intelligence feeds
      - Contextual threat information in alerts
      - Threat actor attribution and tactics
      - Industry-specific threat insights
   :::column-end:::
:::row-end:::

## Next Steps

### Quick Wins
1. **Review Secure Score** - Identify and implement high-impact recommendations
2. **Enable Core Plans** - Activate protection for your most critical workloads  
3. **Configure Notifications** - Set up email alerts and SIEM integration
4. **Set Up Governance** - Create rules for systematic security improvement

### Advanced Capabilities
- **Attack Path Management** - Regularly review and remediate attack paths
- **Custom Recommendations** - Create organization-specific security guidance
- **Advanced Hunting** - Develop custom threat detection queries
- **AI Integration** - Leverage Security Copilot for enhanced investigations

### Learning Resources
- [Interactive demo walkthrough](https://mslearn.cloudguides.com/guides/Protect%20your%20multi-cloud%20environment%20with%20Microsoft%20Defender%20for%20Cloud)
- [Microsoft Learn training paths](/training/paths/sc-200-mitigate-threats-using-azure-defender/)
- [Planning and operations guide](defender-for-cloud-planning-and-operations-guide.md)

### Get Support
- [Common questions and FAQ](faq-general.yml)
- [Microsoft Tech Community](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/bd-p/MicrosoftDefenderCloud)
- [Submit feedback and feature requests](https://feedback.azure.com/d365community/forum/8db0ad8f-3d64-ec11-b6e6-000d3a4f07b8)

## Related Articles

- [Defender for Cloud in the Defender portal](defender-portal/defender-for-cloud-in-defender-portal.md)
- [Getting started in the Defender portal](defender-portal/getting-started-defender-portal.md)
- [What is Microsoft Defender for Cloud?](defender-for-cloud-introduction.md)
- [Cloud Security Posture Management overview](concept-cloud-security-posture-management.md)
- [What's new in Defender for Cloud](release-notes.md)
