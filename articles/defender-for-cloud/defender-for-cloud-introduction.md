---
title: Microsoft Defender for Cloud Overview
description: Secure your Azure, hybrid, and multicloud resources with Microsoft Defender for Cloud. This cloud-native application protection platform (CNAPP) includes two key capabilities, cloud security posture management (CSPM) and cloud workload protection platform (CWPP). It helps protect your environments across Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and on-premises systems.
ms.topic: overview
ms.date: 11/05/2025
ms.author: elkrieger
author: Elazark
#customer intent: As a security professional, I want to understand Microsoft Defender for Cloud so that I can protect my cloud resources.
---

# What is Microsoft Defender for Cloud?

> [!NOTE]
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

Microsoft Defender for Cloud is a [Cloud Native Application Protection Platform (CNAPP)](#cloud-native-application-protection-platform-cnapp), which is a unified solution that combines multiple cloud security tools to protect applications across their entire lifecycle. The solution provides a comprehensive view of your security posture across your cloud and on-premises resources. It also helps you secure multicloud and hybrid environments and integrates security into DevOps workflows. It has three core components:

- [Cloud Security Posture Management (CSPM)](#cloud-security-posture-management-cspm) checks and improves the security posture of cloud resources.

- [Development Security Operations (DevSecOps)](#development-security-operations-devsecops) manages code-level security across multicloud and multi-pipeline environments.

- [Cloud Workload Protection Platform (CWPP)](#cloud-workload-protection-platform-cwpp) defends workloads such as virtual machines (VMs), containers, storage, databases, and serverless functions from threats.

Defender for Cloud uses its broader Cloud Native Application Protection Platform (CNAPP) capabilities to unify protections into one experience. Defender for Cloud embeds security early in the development lifecycle. It helps DevOps teams find misconfigurations, apply policies, and fix risks early.

In addition to its core CNAPP capabilities, Defender for Cloud delivers [AI security and AI threat protection](#ai-security-and-threat-protection) to safeguard generative AI workloads throughout their lifecycle. These features help you discover AI applications, identify vulnerabilities, reduce risks, and detect threats targeting your generative AI workloads.

:::image type="content" source="media/defender-for-cloud-introduction/defender-for-cloud-pillars.png" alt-text="Diagram that shows the core functionality of Microsoft Defender for Cloud.":::

> [!NOTE]
> For pricing information, check out [the Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

## Cloud Native Application Protection Platform (CNAPP)

:::image type="content" source="media/defender-for-cloud-introduction/defender-plans.png" alt-text="Conceptual image of CNAPP and how the Defenders for Cloud's plans protect all of your resources in their environments." lightbox="media/defender-for-cloud-introduction/defender-plans.png":::

After the [Defender for Cloud solution](connect-azure-subscription.md) is enabled on your Azure subscription, the system collects security data from your multicloud and DevOps environments. Defender for Cloud uses the data to give insights, recommendations, and actions that help you protect your cloud workloads and resources. You can enable extra plans to get more advanced security features, such as [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md), [Defender for Databases](tutorial-enable-databases-plan.md), and [Defender for Containers](tutorial-enable-containers-azure.md).

Defender for Cloud's available plans and their CNAPP benefits include: 

| Defender for Cloud plan | CNAPP benefits | Relevant links |
|--|--|--|
| **Defender CSPM / Foundational CSPM** | Provides advanced security posture capabilities including agentless vulnerability scanning, data-aware security posture, the cloud security graph, and advanced threat hunting. | Check out the [differences between the CSPM plans](concept-cloud-security-posture-management.md#plan-availability). <br><br> [Enable the Defender CSPM plan](tutorial-enable-cspm-plan.md). |
| **Defender for Servers** | Provides threat detection and advanced defenses for Windows and Linux machines that run in Azure, AWS, GCP, and on-premises environments. | [Plan your Defender for Servers deployment](plan-defender-for-servers.md) <br><br> Check out the [differences between the Defender for Servers plans](defender-for-servers-overview.md#defender-for-servers-plans) <br><br> [Deploy Defender for Servers](tutorial-enable-servers-plan.md) |
| **Defender for Containers** | Provides environment hardening, vulnerability assessment, run time protection of Kubernetes nodes and clusters. | [Overview of Container security in Microsoft Defender for Containers](defender-for-containers-introduction.md) <br><br> [Defender for Containers architecture](defender-for-containers-architecture.md) <br><br> Protect your [Azure](tutorial-enable-containers-azure.md), [IaaS](tutorial-enable-containers-arc.md), [AWS](tutorial-enable-container-aws.md), and [GCP](tutorial-enable-container-gcp.md) containers with Defender for Containers |
| **Defender for Resource Manager** | Detects unusual and potentially harmful activity by automatically monitoring the resource management operations. | [Overview of Microsoft Defender for Resource Manager](defender-for-resource-manager-introduction.md) <br><br> [Protect your resources with Defender for Resource Manager](tutorial-enable-resource-manager-plan.md) |
| **Defender for Storage** | Protects against malware, storage specific threats, sensitive data leakage, and Shared Access Signature (SAS) token misuse. | [Overview of Microsoft Defender for Storage](defender-for-storage-introduction.md) <br><br> [Malware scanning](defender-for-storage-malware-scan.md) <br><br> [Detect threats to sensitive data](defender-for-storage-data-sensitivity.md) <br><br> [Deploy Microsoft Defender for Storage](tutorial-enable-storage-plan.md) |
| **Defender for App Service** | Identifies attacks that target applications running over App Service. | [Overview of Defender for App Service to protect your Azure App Service web apps and APIs](defender-for-app-service-introduction.md) <br><br> [Protect your applications with Defender for App Service](tutorial-enable-app-service-plan.md) |
| **Defender for Databases** |  Protects your entire database estate with attack detection and threat response for the various database types in Azure. | [Overview of Microsoft Defender for Azure SQL](defender-for-sql-introduction.md) <br><br>  [Protect your databases with Defender for Databases](tutorial-enable-databases-plan.md) <br><br> [What is Microsoft Defender for open-source relational databases](defender-for-databases-introduction.md) <br><br> [Overview of Microsoft Defender for Azure Cosmos DB](concept-defender-for-cosmos.md) |
| **Defender for Key Vault** | Detects unusual and potentially harmful attempts to access or exploit Key Vault accounts. | [Overview of Microsoft Defender for Key Vault](defender-for-key-vault-introduction.md) <br><br> [Protect your key vaults with Defender for Key Vault](tutorial-enable-key-vault-plan.md) | 
| **Defender for APIs**| Provides visibility into business critical APIs, improves API security posture, prioritization of vulnerability fixes, and quickly detect active real-time threats. | [About Microsoft Defender for APIs](defender-for-apis-introduction.md) <br><br> [Protect your APIs with Defender for APIs](defender-for-apis-deploy.md) |
| **AI Services** | Identifies threats to generative AI applications in real time and helps respond to security issues. | [AI threat protection](ai-threat-protection.md) <br><br> [Enable threat protection for AI services](ai-onboarding.md) |

You can also check out the E-book ["From plan to deployment: Implementing a Cloud Native Application Protection Platform (CNAPP) strategy"](https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/final/en-us/microsoft-brand/documents/Implementing-A-Cloud-Native-Application-Protection-Strategy-Ebook.pdf), to learn more about implementing CNAPP in Defender for Cloud.

## Cloud security posture management (CSPM)

The security of your cloud and on-premises resources relies on proper configuration and deployment. Defenders for Cloud recommendations identify steps to secure your environment.

Defender for Cloud includes free Foundational CSPM capabilities. Enable advanced CSPM capabilities with the Defender CSPM plan.

| Capability | What problem does it solve? | Get started | Defender plan |
|--|--|--|--|
| [Centralized policy management](security-policy-concept.md) | Define the security conditions that you want to maintain across your environment. The policy translates to recommendations that identify resource configurations that violate your security policy. The [Microsoft cloud security benchmark](concept-regulatory-compliance.md) is a built-in standard that applies security principles with detailed technical implementation guidance for Azure and other cloud providers (such as Amazon Web Services (AWS) and Google Cloud Platform (GCP). | [Customize a security policy](create-custom-recommendations.md) | Foundational CSPM (Free) |
| [Secure score](secure-score-security-controls.md) | Summarize your security posture based on the security recommendations. As you remediate recommendations, your secure score improves. | [Track your secure score](secure-score-access-and-track.md) | Foundational CSPM (Free) |
| [Multicloud coverage](plan-multicloud-security-get-started.md) | Connect to your multicloud environments with agentless methods for CSPM insight and CWPP protection. | Connect your [Amazon AWS](quickstart-onboard-aws.md) and [Google GCP](quickstart-onboard-gcp.md) cloud resources to Defender for Cloud | Foundational CSPM (Free) |
| [Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md) | Use the dashboard to see weaknesses in your security posture. | [Enable CSPM tools](enable-enhanced-security.md) | Foundational CSPM (Free) |
| [Advanced Cloud Security Posture Management](concept-cloud-security-posture-management.md) | Get advanced tools to identify weaknesses in your security posture, including:</br>- Governance to drive actions to improve your security posture</br>- Regulatory compliance to verify compliance with security standards</br>- Cloud security explorer to build a comprehensive view of your environment | [Enable CSPM tools](enable-enhanced-security.md) | Defender CSPM |
| [Data Security Posture Management](concept-data-security-posture.md) | Data security posture management automatically discovers datastores containing sensitive data, and helps reduce risk of data breaches. | [Enable data security posture management](data-security-posture-enable.md) | Defender CSPM or Defender for Storage |
| [Attack path analysis](concept-attack-path.md#what-is-an-attack-path) | Model traffic on your network to identify potential risks before you implement changes to your environment. | [Build queries to analyze paths](how-to-manage-attack-path.md) | Defender CSPM                         |
| [Cloud Security Explorer](concept-attack-path.md#what-is-cloud-security-explorer) | A map of your cloud environment that lets you build queries to find security risks. | [Build queries to find security risks](how-to-manage-cloud-security-explorer.md) | Defender CSPM                         |
| [Security governance](governance-rules.md)                   | Drive security improvements through your organization by assigning tasks to resource owners and tracking progress in aligning your security state with your security policy. | [Define governance rules](governance-rules.md)               | Defender CSPM                         |
| [Microsoft Entra Permissions Management](/azure/active-directory/cloud-infrastructure-entitlement-management/) | Provides comprehensive visibility and control over permissions for any identity and any resource in Azure, AWS, and GCP. | [Review your Permission Creep Index (PCI)](other-threat-protections.md#entra-permission-management-formerly-cloudknox) | Defender CSPM                         |
| [AI SPM](identify-ai-workload-model.md) | Provides a comprehensive view of your organization's AI Bill of Materials (AI BOM) which assesses the security posture of the scanned AI workloads. | [Discover generative AI workloads](identify-ai-workload-model.md) | Defender CSPM |

## Development security operations (DevSecOps)

Defender for Cloud adds security to the start of development. It lets you secure code pipelines and environments, and monitor your security posture from one place. Defender for Cloud enables security teams to manage DevOps security across multi-pipeline environments.

Applications require security awareness at the code, infrastructure, and runtime levels to ensure that deployed applications are hardened against attacks.

| Capability | What problem does it solve? | Get started | Defender plan |
|--|--|--|--|
| [Code pipeline insights](defender-for-devops-introduction.md) | Empowers security teams with the ability to protect applications and resources from code to cloud across multi-pipeline environments, including GitHub, Azure DevOps, and GitLab. DevOps security findings, such as Infrastructure as Code (IaC) misconfigurations and exposed secrets, can then be correlated with other contextual cloud security insights to prioritize remediation in code. | Connect [Azure DevOps](quickstart-onboard-devops.md), [GitHub](quickstart-onboard-github.md), and [GitLab](quickstart-onboard-gitlab.md) repositories to Defender for Cloud | Foundational CSPM (Free) and Defender CSPM |

## Cloud workload protection platform (CWPP)

Proactive security principles require implementing security practices to protect your workloads from threats. Cloud workload protection platforms (CWPP) provide workload-specific recommendations to guide you to the right security controls to protect your workloads.

When your environment is threatened, security alerts immediately indicate the nature and severity of the threat so you can plan your response. After identifying a threat in your environment, respond quickly to limit the risk to your resources.

| Capability | What problem does it solve? | Get started | Defender plan |
| ---------- | --------------------------- | ----------- | ------------------------- |
| Protect cloud servers | Provide server protections through Microsoft Defender for Endpoint or extended protection with just-in-time network access, file integrity monitoring, vulnerability assessment, and more. | [Secure your multicloud and on-premises servers](defender-for-servers-introduction.md) | Defender for Servers |
| Identify threats to your storage resources | Detect unusual and potentially harmful attempts to access or exploit your storage accounts using advanced threat detection capabilities and Microsoft Threat Intelligence data to provide contextual security alerts. | [Protect your cloud storage resources](defender-for-storage-introduction.md) | Defender for Storage |
| Protect cloud databases | Protect your entire database estate with attack detection and threat response for the most popular database types in Azure to protect the database engines and data types, according to their attack surface and security risks. | [Deploy specialized protections for cloud and on-premises databases](quickstart-enable-database-protections.md) | - Defender for Azure SQL Databases</br>- Defender for SQL servers on machines</br>- Defender for Open-source relational databases</br>- Defender for Azure Cosmos DB |
| Protect containers | Secure your containers so you can improve, monitor, and maintain the security of your clusters, containers, and their applications with environment hardening, vulnerability assessments, and run-time protection. | [Find security risks in your containers](defender-for-containers-introduction.md) | Defender for Containers |
| [Infrastructure service insights](asset-inventory.md) | Diagnose weaknesses in your application infrastructure that can leave your environment susceptible to attack. | - [Identify attacks targeting applications running over App Service](defender-for-app-service-introduction.md)</br>- [Detect attempts to exploit Key Vault accounts](defender-for-key-vault-introduction.md)</br>- [Get alerted on suspicious Resource Manager operations](defender-for-resource-manager-introduction.md)</br>- [Expose anomalous Domain Name System (DNS) activities](defender-for-dns-introduction.md) | - Defender for App Service</br>- Defender for Key Vault</br>- Defender for Resource Manager</br>- Defender for DNS |
| [Security alerts](alerts-overview.md) | Get informed of real-time events that threaten the security of your environment. Alerts are categorized and assigned severity levels to indicate proper responses. | [Manage security alerts]( manage-respond-alerts.md) | Any workload protection Defender plan |
| [Security incidents](alerts-overview.md#what-are-security-incidents) | Identify attack patterns by correlating alerts. Integrate with Security Information and Event Management (SIEM), Security Orchestration, Automation, and Response (SOAR), and traditional IT deployment solutions that respond to threats and reduce risk. | [Export alerts to SIEM, SOAR, or ITSM systems](export-to-siem.md) | Any workload protection Defender plan |

[!INCLUDE [Defender for DNS note](./includes/defender-for-dns-note.md)]

## AI security and threat protection

Microsoft Defender for Cloud provides AI security posture management and AI threat protection to help you secure your generative AI workloads across their entire lifecycle.

| Type of AI security | Description | Relevant links |
|--|--|--|
| AI security posture management (SPM) | Helps you discover generative AI applications, identify vulnerabilities, and reduce risks using built-in recommendations and attack path analysis. | Learn more about [AI security posture management](ai-security-posture.md) |
| AI threat protection | Uses advanced threat detection techniques to identify and respond to threats targeting your generative AI workloads. | [AI threat protection](ai-threat-protection.md) |

Defender for Cloud also includes a Data and AI security dashboard. This dashboard gives you a central place to monitor and manage your data and AI resources, track risks, and check protection status.

## Learn More

For more information about Defender for Cloud and how it works, see:

- A [step-by-step walkthrough](https://mslearn.cloudguides.com/guides/Protect%20your%20multi-cloud%20environment%20with%20Microsoft%20Defender%20for%20Cloud) of Defender for Cloud
- An interview about Defender for Cloud with an expert in cybersecurity in [Lessons Learned from the Field](episode-six.md)
- [Microsoft Defender for Cloud - Use cases](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/microsoft-defender-for-cloud-use-cases/ba-p/2953619)
- [Microsoft Defender for Cloud PoC Series - Microsoft Defender for Containers](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/microsoft-defender-for-cloud-poc-series-microsoft-defender-for/ba-p/3064644)
- Learn how [Microsoft Defender for Cloud provides data security](data-security.md)

## Next steps

> [!div class="nextstepaction"]
> [Enable Microsoft Defender plans](enable-enhanced-security.md)
