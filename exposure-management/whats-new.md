---
title: Release notes
description: This page is updated frequently with the latest updates in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 07/17/2024
---

# What's new in Microsoft Security Exposure Management?

Microsoft Security Exposure Management (MSEM) is in active development and receives improvements on an ongoing basis. To stay up to date with the most recent developments, this page provides you with information about new features, bug fixes, and deprecated functionality.

<!-- Please don't adjust this next line without getting approval from the Defender for Cloud documentation team. It is necessary for proper RSS functionality. -->
This page is updated frequently with the latest updates in Microsoft Security Exposure Management.

Learn more about MSEM by reading the blogs, [here](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/bg-p/MicrosoftSecurityandCompliance).

Security Exposure Management is currently in public preview.

> [!TIP]
> Get notified when this page is updated by copying and pasting the following URL into your feed reader:
>
> `https://aka.ms/msem/rss`

## August 2024

### News from the Research Team

Read more about what the research team has been up to in this blog - [Bridging the On-premises to Cloud Security Gap: Cloud Credentials Detection](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/bridging-the-on-premises-to-cloud-security-gap-cloud-credentials/ba-p/4211794)

## July 2024

### New predefined classifications

The following predefined classification rules were added to the critical assets list:

| Classification                                | Description                                                                                                                             |
|-----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Exchange**                                  | This rule applies to devices identified as operational Exchange servers within a domain. These servers might hold sensitive data of the organization.                                                |
| **VMware ESXi**                               | This rule applies to devices identified as operational ESXi servers. These devices might hold other sensitive or critical devices.          |
| **VMware vCenter**                            | This rule applies to devices identified as operational VMware vCenter and frequently used by admins to manage the virtual infrastructure. |
| **Identity with Privileged Azure Role**       | This rule applies to identities assigned with a Privileged Azure role, over a potentially business-critical scope. A compromised identity in this role poses severe risks, including unauthorized access to Azure resources and data exposure. |
| **Exchange Administrator**                    | This rule applies to identities assigned with the Microsoft Entra ID "Exchange Administrator" role. A compromised identity in this role poses severe risks, including unauthorized access to Exchange Admin Center and data exposure. |
| **SharePoint Administrator**                  | This rule applies to identities assigned with the Microsoft Entra ID "SharePoint Administrator" role. A compromised identity in this role poses severe risks, including unauthorized access to SharePoint Admin Center and data exposure. |
| **Groups Administrator**                      | This rule applies to identities assigned with the Microsoft Entra ID "Groups Administrator" role. A compromised identity in this role poses severe risks, including unauthorized access to Microsoft 365 groups and data exposure. |
| **Confidential Azure VM**                     | This rule applies to Azure confidential virtual machines. A compromised or disrupted Azure VM of this type poses severe risks, including unauthorized access to production services and data exposure. |
| **Locked VM**                                 | This rule applies to virtual machines that are safeguarded by a lock. A compromised or disrupted Azure VM of this type poses severe risks, including unauthorized access to production services and data exposure. |
| **Azure Virtual Machine with High Availability and Performance** | This rule applies to Azure VMs that use premium Azure storage and are configured with an availability set. A compromised or disrupted Azure VM of this type poses severe risks, including unauthorized access to production services and data exposure. |
| **Immutable Azure Storage**                    | This rule applies to Azure storage accounts that have immutability support enabled. A compromised or disrupted Azure storage account of this type poses severe risks, including unauthorized data access and service disruption. |
| **Immutable and Locked Azure Storage**         | This rule applies to Azure storage accounts that have immutability support enabled with a locked policy in place. A compromised or disrupted Azure storage account of this type poses severe risks, including unauthorized data access and service disruption. |
| **Virtual Machine has a critical signed-in user** | This rule applies to Azure VMs protected by Defender for Endpoint with high or very high-criticality users signed in. A compromised or disrupted Azure VM of this type poses severe risks of unauthorized access, session takeover, and data exposure. |
| **Azure Key Vaults with Many Connected Identities** | The rule applies to Azure Key Vaults with high access compared to others, indicating critical workload usage. A compromised or disrupted Azure Key Vault of this type poses severe risks, including unauthorized data access and service disruption. |
 
For more information, see, [Review, and classify critical assets](classify-critical-assets.md)

## May 2024

### Integration with Threat Analytics

- New integration with Threat Analytics to enhance the set of domain security initiatives with threat-based security initiatives. These initiatives focus on specific attack techniques and active threat actors, as seen and analyzed by expert Microsoft security researchers.

- **Blog** - [Respond to trending threats and adopt zero-trust with Exposure Management](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/respond-to-trending-threats-and-adopt-zero-trust-with-exposure/ba-p/4130133)

For more information, see, [Review security initiatives](initiatives.md)

### New Exposure Management Tables

- MSEM released two new powerful tables within Advanced Hunting: *ExposureGraphNodes* and *ExposureGraphEdges*.

- **Blog** - [Microsoft Security Exposure Management Graph: unveiling the power](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/microsoft-security-exposure-management-graph-unveiling-the-power/ba-p/4148546)

For more information, see, [Query the enterprise exposure graph](query-enterprise-exposure-graph.md)

## April 2024

### Critical Asset Protection

- Microsoft Security Exposure Management introduces a contextual risk-based approach, allowing organizations to identify and prioritize critical assets effectively. By assessing potential exposures in real time, security teams gain clarity and focus on safeguarding their digital assets.

- **Blog** - [Critical Asset Protection with Microsoft Security Exposure Management](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/critical-asset-protection-with-microsoft-security-exposure/ba-p/4122645)

For more information, see, [Overview of critical asset management](critical-asset-management.md)
