---
title: Plan your deployment | Microsoft Defender
description: Plan to deploy Microsoft's unified security operations platform with the Microsoft Defender portal, Microsoft Sentinel, and other Microsoft Defender services.
author: batamig
ms.author: bagol
ms.service: unified-secops-platform
ms.topic: concept-article #Don't change.
ms.date: 02/09/2025
ms.collection:
- usx-security


#customer intent: As a security administrator, I want to plan my unified security operations platform deployment so that I can access Microsoft Sentinel services together with other Microsoft Defender services in the Microsoft Defender portal.

---

# Microsoft's unified security operations platform planning overview

This article outlines activities to plan a deployment of Microsoft's security products to Microsoft's unified security operations platform for end-to-end security operations (SecOps). Unify your SecOps on Microsoft's platform to help you reduce risk, prevent attacks, detect and disrupt cyberthreats in real time, and respond faster with AI-enhanced security capabilities, all from the [Microsoft Defender portal](https://security.microsoft.com).

## Plan your deployment

Microsoft's unified SecOps platform combines services like Microsoft Defender XDR, Microsoft Sentinel, Microsoft Security Exposure Management, and Microsoft Security Copilot in the Microsoft Defender portal.

The first step in planning your deployment is to select the services you want to use.

As a basic prerequisite, you'll need both [Microsoft Defender XDR](/defender-xdr/microsoft-365-defender) and [Microsoft Sentinel](/azure/sentinel/overview) to monitor and protect both Microsoft and non-Microsoft services and solutions, including both cloud and on-premises resources.

Deploy any of the following services to add security across your endpoints, identities, email, and applications to provide integrated protection against sophisticated attacks.

Microsoft Defender XDR services include:

| Service | Description |
| ------- | ----------- |
| [**Microsoft Defender for Office 365**](/defender-office-365/mdo-about) | Protects against threats posed by email messages, URL links, and Office 365 collaboration tools. |
| [**Microsoft Defender for Identity**](/defender-for-identity/what-is) | Identifies, detects, and investigates threats from both on-premises Active Directory and cloud identities like Microsoft Entra ID. |
| [**Microsoft Defender for Endpoint**](/defender-endpoint/microsoft-defender-endpoint) | Monitors and protects endpoint devices, detects and investigates device breaches, and automatically responds to security threats. |
| [**Microsoft Defender for IoT**](/defender-for-iot/microsoft-defender-iot) | Provides both IoT device discovery and security value for IoT devices. |
| [**Microsoft Defender Vulnerability Management**](/defender-vulnerability-management/defender-vulnerability-management) | Identifies assets and software inventory, and assesses device posture to find security vulnerabilities. |
| [**Microsoft Defender for Cloud Apps**](/defender-cloud-apps/what-is-defender-for-cloud-apps) | Protects and controls access to SaaS cloud apps. |

Other services supported in the Microsoft Defender portal as part of Microsoft's unified SecOps platform, but not licensed with Microsoft Defender XDR, include:

| Service | Description |
| ------- | ----------- |
| [**Microsoft Security Exposure Management**](/security-exposure-management/microsoft-security-exposure-management) | Provides a unified view of security posture across company assets and workloads, enriching asset information with security context. |
| [**Microsoft Security Copilot**](/copilot/security/microsoft-security-copilot) | Provides AI-driven insights and recommendations to enhance your security operations. |
| [**Microsoft Defender for Cloud**](/azure/defender-for-cloud/) | Protects multi-cloud and hybrid environments with advanced threat detection and response. |
| [**Microsoft Defender Threat Intelligence**](/defender/threat-intelligence/what-is-microsoft-defender-threat-intelligence-defender-ti) | Streamlines threat intelligence workflows by aggregating and enriching critical data sources to correlate indicators of compromise (IOCs) with related articles, actor profiles, and vulnerabilities. |
| [**Microsoft Entra ID Protection**](/entra/id-protection/overview-identity-protection) | Evaluates risk data from sign-in attempts to evaluate the risk of each sign-in to your environment. |
| **[Microsoft Purview Insider Risk Management](/purview/insider-risk-management)** | Correlates various signals to identify potential malicious or inadvertent insider risks, such as IP theft, data leakage and security violations. |

## Review service prerequisites

Before you deploy Microsoft's unified security operations platform, review the prerequisites for each service you plan to use. The following table lists the services and links for more information:

| Security service         | Prerequisites                  |
| ------------------------ | ------------------------------ |
| **Required for unified SecOps**       |      |
| Microsoft Defender XDR | [Microsoft Defender XDR prerequisites](/defender-xdr/prerequisites) |
| Microsoft Sentinel                                       | [Prerequisites to deploy Microsoft Sentinel](/azure/sentinel/prerequisites)  |
| **Optional Microsoft Defender XDR services**              |                                                 |
| Microsoft Defender for Office | [Microsoft Defender XDR prerequisites](/defender-xdr/prerequisites) |
| Microsoft Defender for Identity                          | [Microsoft Defender for Identity prerequisites](/defender-for-identity/deploy/prerequisites)  |
| Microsoft Defender for Endpoint                          | [Set up Microsoft Defender for Endpoint deployment](/defender-endpoint/production-deployment)   |
| Enterprise monitoring with Microsoft Defender for IoT    | [Prerequisites for Defender for IoT in the Defender portal](/defender-for-iot/prerequisites)   |
| Microsoft Defender Vulnerability Management              | [Prerequisites & Permissions for Microsoft Defender Vulnerability Management](/defender-vulnerability-management/tvm-prerequisites)   |
| Microsoft Defender for Cloud Apps                        | [Get started with Microsoft Defender for Cloud Apps](/defender-cloud-apps/get-started)   |
| **Other services supported in the Microsoft Defender portal**   |   |
| Microsoft Security Exposure Management                   | [Prerequisites and support](/security-exposure-management/prerequisites)  |
| Microsoft Security Copilot                               | [Minimum requirements](/copilot/security/get-started-security-copilot#minimum-requirements)  |
| Microsoft Defender for Cloud                             | [Start planning multicloud protection](/azure/defender-for-cloud/plan-multicloud-security-get-started) and other articles in the same section. |
| Microsoft Defender Threat Intelligence                   | [Prerequisites for Defender Threat Intelligence](/defender/threat-intelligence/learn-how-to-access-microsoft-defender-threat-intelligence-and-make-customizations-in-your-portal#prerequisites) |
| Microsoft Entra ID Protection                            | [Prerequisites for Microsoft Entra ID Protection](/entra/id-protection/how-to-deploy-identity-protection#prerequisites) |
| Microsoft Purview Insider Risk Management | [Get started with insider risk management](/purview/insider-risk-management-configure?tabs=purview-portal) |

## Review data security and privacy practices

Before you deploy Microsoft's unified security operations platform, make sure that you understand the data security and privacy practices for each service you plan to use. The following table lists the services and links for more information. Note that several services use the data security and retention practices for Microsoft Defender XDR instead of have separate practices of their own.

| Security service         | Data security and privacy |
| ------------------------ |--------------------------------------- |
| **Required for unified SecOps**       | |
| Microsoft Defender XDR | [Data security and retention in Microsoft Defender XDR](/defender-xdr/data-privacy) |
| Microsoft Sentinel | [Geographical availability and data residency in Microsoft Sentinel](/azure/sentinel/geographical-availability-data-residency) |
| **Optional Microsoft Defender XDR services** | |
| Microsoft Defender for Office | [Data security and retention in Microsoft Defender XDR](/defender-xdr/data-privacy) |
| Microsoft Defender for Identity | [Privacy with Microsoft Defender for Identity](/defender-for-identity/privacy-compliance) |
| Microsoft Defender for Endpoint | [Microsoft Defender for Endpoint data storage and privacy](/defender-endpoint/data-storage-privacy) |
| Enterprise monitoring with Microsoft Defender for IoT | [Data security and retention in Microsoft Defender XDR](/defender-xdr/data-privacy) |
| Microsoft Defender Vulnerability Management | [Microsoft Defender for Endpoint data storage and privacy](/defender-endpoint/data-storage-privacy) |
| Microsoft Defender for Cloud Apps | [Privacy with Microsoft Defender for Cloud Apps](/defender-cloud-apps/cas-compliance-trust) |
| **Other services supported in the Microsoft Defender portal** | |
| Microsoft Security Exposure Management | [Data freshness, retention, and related functionality](/security-exposure-management/microsoft-security-exposure-management#data-freshness-retention-and-related-functionality) |
| Microsoft Security Copilot | [Privacy and data security in Microsoft Security Copilot](/copilot/security/privacy-data-security) |
| Microsoft Defender for Cloud | [Microsoft Defender for Cloud data security](/azure/defender-for-cloud/data-security) |
| Microsoft Defender Threat Intelligence | [Data security and retention in Microsoft Defender XDR](/defender-xdr/data-privacy) |
| Microsoft Entra ID Protection | [Microsoft Entra data retention](/entra/identity/monitoring-health/reference-reports-data-retention) |
| Microsoft Purview Insider Risk Management | [Microsoft Purview Insider Risk Management and Communication Compliance privacy guide](/purview/insider-risk-solution-privacy) <br><br> [Messaging Records Management (MRM) and Retention Policies in Microsoft 365](/microsoft-365/troubleshoot/retention/mrm-and-retention-policy) |

## Plan your Log Analytics workspace architecture

To use Microsoft's unified SecOps platform, you need a Log Analytics workspace enabled for Microsoft Sentinel. A single Log Analytics workspace might be sufficient for many environments, but many organizations create multiple workspaces to optimize costs and better meet different business requirements. Microsoft's unified SecOps platform supports only a single workspace.

Design the Log Analytics workspace you want to enable for Microsoft Sentinel. Consider parameters such as any compliance requirements you have for data collection and storage and how to control access to Microsoft Sentinel data.

For more information, see:

1. [Design workspace architecture](/azure/azure-monitor/logs/workspace-design?toc=%2Fazure%2Fsentinel%2FTOC.json&bc=%2Fazure%2Fsentinel%2Fbreadcrumb%2Ftoc.json)
1. [Review sample workspace designs](/azure/sentinel/sample-workspace-designs)

## Plan Microsoft Sentinel costs and data sources

Microsoft's unified SecOps platform ingests data from first-party Microsoft services, such as Microsoft Defender for Cloud Apps and Microsoft Defender for Cloud. We recommend expanding your coverage to other data sources in your environment by adding Microsoft Sentinel data connectors.

### Determine your data sources

Determine the full set of data sources you'll be ingesting data from, and the data size requirements to help you accurately project your deployment's budget and timeline. You might determine this information during your business use case review, or by evaluating a current SIEM that you already have in place. If you already have a SIEM in place, analyze your data to understand which data sources provide the most value and should be ingested into Microsoft Sentinel.

For example, you might want to use any of the following recommended data sources:

- **Azure services**: If any of the following services are deployed in Azure, use the following connectors to send these resources' Diagnostic Logs to Microsoft Sentinel:

    - **Azure Firewall**
    - **Azure Application Gateway**
    - **Keyvault**
    - **Azure Kubernetes Service**
    - **Azure SQL**
    - **Network Security Groups**
    - **Azure-Arc Servers**
  
  We recommend that you set up Azure Policy to require that their logs be forwarded to the underlying Log Analytics workspace. For more information, see [Create diagnostic settings at scale using Azure Policy](/azure/azure-monitor/essentials/diagnostic-settings-policy).

- **Virtual machines**: For virtual machines hosted on-premises or in other clouds that require their logs collected, use the following data connectors:
  
    - **Windows Security Events using AMA**
    - Events via **Defender for Endpoint** (for server)
    - **Syslog**

- **Network virtual appliances / on-premises sources**: For network virtual appliances or other on-premises sources that generate [Common Event Format (CEF) or SYSLOG logs](/azure/sentinel/connect-cef-syslog-ama?branch=main&tabs=single%2Ccef%2Cportal), use the following data connectors:

    - **Syslog via AMA**
    - **Common Event Format (CEF) via AMA**
  
For more information, see [Prioritize data connectors](/azure/sentinel/prioritize-data-connectors).

### Plan your budget

Plan your Microsoft Sentinel budget, considering cost implications for each planned scenario. Make sure that your budget covers the cost of data ingestion for both Microsoft Sentinel and Azure Log Analytics, any playbooks that will be deployed, and so on.  For more information, see:

- [Log retention plans in Microsoft Sentinel](/azure/sentinel/log-plans)
- [Plan costs and understand Microsoft Sentinel pricing and billing](/azure/sentinel/billing?tabs=simplified%2Ccommitment-tiers)

## Understand Microsoft security portals and admin centers

While the Microsoft Defender portal is the home for monitoring and managing security across your identities, data, devices, and apps, you need to access various portals for certain specialized tasks.

Microsoft security portals include:

| Portal name | Description | Link |
|---|---|---|
| **Microsoft Defender portal** | Monitor and respond to threat activity and strengthen security posture across your identities, email, data, endpoints, and apps with Microsoft Defender XDR](../defender-xdr/microsoft-365-defender.md) | [security.microsoft.com](https://security.microsoft.com/)  <br/><br/>The Microsoft Defender portal is where you view and manage alerts, incidents, settings, and more. |
| **Defender for Cloud portal** | Use [Microsoft Defender for Cloud](/azure/security-center/security-center-intro) to strengthen the security posture of your data centers and your hybrid workloads in the cloud | [portal.azure.com/#blade/Microsoft_Azure_Security](https://portal.azure.com/#blade/Microsoft_Azure_Security/SecurityMenuBlade/0) |
| **Microsoft Security Intelligence portal** | Get security intelligence updates for Microsoft Defender for Endpoint, submit samples, and explore the threat encyclopedia | [microsoft.com/wdsi](https://microsoft.com/wdsi) |

The following table describes portals for other workloads that can impact your security. Visit these portals to manage identities, permissions, device settings, and data handling policies.

| Portal name | Description | Link |
|---|---|---|
| **Microsoft Entra admin center** | Access and administer the [Microsoft Entra](/entra) family to protect your business with decentralized identity, identity protection, governance, and more, in a multicloud environment| [entra.microsoft.com](https://entra.microsoft.com/) |
| **Azure portal** | View and manage all your [Azure resources](/azure/azure-resource-manager/management/overview)  | [portal.azure.com](https://portal.azure.com/) |
| **Microsoft Purview portal** | Manage data handling policies and ensure [compliance with regulations](/compliance/regulatory/offering-home) | [purview.microsoft.com](https://purview.microsoft.com/) |
| **Microsoft 365 admin center** | Configure Microsoft 365 services; manage roles, licenses, and track updates to your Microsoft 365 services | [admin.microsoft.com](https://go.microsoft.com/fwlink/p/?linkid=2166757) |
| **Microsoft Intune admin center** | Use [Microsoft Intune](/mem/intune/fundamentals/what-is-intune) to manage and secure devices. Can also combine Intune and Configuration Manager capabilities. | [intune.microsoft.com](https://intune.microsoft.com/) |
| **Microsoft Intune portal** | Use [Microsoft Intune](/mem/intune/fundamentals/what-is-intune) to deploy device policies and monitor devices for compliance | [intune.microsoft.com](https://intune.microsoft.com/#blade/Microsoft_Intune_DeviceSettings/DevicesMenu/overview) |

## Plan roles and permissions

Use Microsoft Entra role based access control (RBAC) to create and assign roles within your security operations team to grant appropriate access to services included in Microsoft's unified SecOps platform.

The Microsoft Defender XDR Unified role-based access control (RBAC) model provides a single permissions management experience that provides one central location for administrators to control user permissions across several security solutions. For more information, see [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac).

For the following services, use the different roles available, or create custom roles, to give you fine-grained control over what users can see and do. For more information, see:


| Security service         | Link to role requirements                  |
| ------------------------ | ------------------------------------------- |
| **Required for unified SecOps**                                                   |                           |
| Microsoft Defender XDR  | [Manage access to Microsoft Defender XDR with Microsoft Entra global roles](/defender-xdr/m365d-permissions)               |
| Microsoft Sentinel                                       | [Roles and permissions in Microsoft Sentinel](/azure/sentinel/roles)            |
| **Optional Microsoft Defender XDR services**                |  |
| Microsoft Defender for Identity                          | [Microsoft Defender for Identity role groups](/defender-for-identity/role-groups)          |
| Microsoft Defender for Office | [Microsoft Defender for Office 365 permissions in the Microsoft Defender portal](/defender-office-365/mdo-portal-permissions) |
| Microsoft Defender for Endpoint      | [Assign roles and permissions for Microsoft Defender for Endpoint deployment](/defender-endpoint/prepare-deployment)       |
| Microsoft Defender Vulnerability Management   | [Relevant permission options for Microsoft Defender Vulnerability Management ](/defender-vulnerability-management/tvm-prerequisites#relevant-permission-options)       |
| Microsoft Defender for Cloud Apps           | [Configure admin access for Microsoft Defender for Cloud Apps](/defender-cloud-apps/manage-admins)      |
| **Other services supported in the Microsoft Defender portal**             |             |
| Microsoft Security Exposure Management     | [Permissions for Microsoft Security Exposure Management](/security-exposure-management/prerequisites)   |
| Microsoft Defender for Cloud      | [User roles and permissions](/azure/defender-for-cloud/permissions) |
| Microsoft Purview Insider Risk Management | [Enable permissions for insider risk management](/purview/insider-risk-management-configure?tabs=purview-portal#step-1-required-enable-permissions-for-insider-risk-management) |

## Plan Zero Trust activities

Microsoft's unified SecOps platform is part of [Microsoft's Zero Trust security model](zero-trust.md), which includes the following principles:

|Security principle |Description|
|---|---|
|**Verify explicitly** |Always authenticate and authorize based on all available data points. |
|**Use least privilege access** |Limit user access with Just-In-Time and Just-Enough-Access (JIT/JEA), risk-based adaptive policies, and data protection.      |
|**Assume breach** |Minimize blast radius and segment access. Verify end-to-end encryption and use analytics to get visibility, drive threat detection, and improve defenses. |

Zero Trust security is designed to protect modern digital environments by leveraging network segmentation, preventing lateral movement, providing least-privileged access, and using advanced analytics to detect and respond to threats.

For more information about implementing Zero Trust principles in Microsoft's unified SecOps platform, see Zero Trust content for the following services:

- [Microsoft Defender XDR](/defender-xdr/zero-trust-with-microsoft-365-defender?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json)
- [Microsoft Sentinel](/security/operations/siem-xdr-overview?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json)
- [Microsoft Defender for Identity](/defender-for-identity/zero-trust?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json)
- [Microsoft Defender for Office 365](/defender-office-365/zero-trust-with-microsoft-365-defender-office-365?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json)
- [Microsoft Defender for Endpoint](/defender-endpoint/zero-trust-with-microsoft-defender-endpoint?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json)
- [Microsoft Defender for Cloud Apps](/defender-cloud-apps/zero-trust?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json)
- [Microsoft Security Exposure Management](https://techcommunity.microsoft.com/blog/microsoftsecurityandcompliance/respond-to-trending-threats-and-adopt-zero-trust-with-exposure-management/4130133)
- [Microsoft Defender for Cloud](/azure/defender-for-cloud/zero-trust?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/breadcrumb/toc.json)
- [Microsoft Security Copilot](/security/zero-trust/copilots/zero-trust-microsoft-copilot-for-security)
- [Microsoft Entra ID Protection](/entra/id-protection/how-to-deploy-identity-protection)
- [Microsoft Purview](/purview/zero-trust-microsoft-purview)

For more information, see the [Zero Trust Guidance Center](/security/zero-trust/zero-trust-overview).



## Next step

[Deploy Microsoft's unified security operations platform](overview-deploy.md)
