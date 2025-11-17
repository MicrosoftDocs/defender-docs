---
title: Integration FAQ for Defender portal
description: Frequently asked questions about integrating and using Microsoft Defender for Cloud in the Defender portal, including migration, compatibility, and feature questions.
author: dlanger
ms.author: dlanger
ms.topic: faq
ms.date: 11/12/2025
ms.service: defender-for-cloud
---

# Integration FAQ for Defender portal

> [!NOTE]
> This is currently in preview.
> For details about current gaps and restrictions, see [Known limitations](known-limitations.md).

This article answers frequently asked questions about using Microsoft Defender for Cloud in the Defender portal, including integration, migration, and compatibility topics.

## Overview

### Who is eligible to test the new MDC capabilities in the Defender portal?

The expansion of MDC into the Defender portal is available for billed MDC customers with at least one Defender for Cloud plan enabled. 
Note: Once the opt-in is selected, it takes up to 24 hours for the data to populate. 

### What environments are supported with this expansion in the Defender portal?  

Yes, Azure, AWS, GCP, and on-premises environments are supported.

### What are the risks associated with this move?

There is no operational risk in transitioning to the Defender portal. The experience is designed with parallel functionalities in both the Azure and Defender portal. Customers can choose to enable the new experience without disrupting their experience in the Azure portal. However, there are known limitations that customers should be aware of while testing new capabilities. Read more in the official documentation here, [Known limitations](known-limitations.md).

### What happens to MDC in the Azure portal? Is MDC being deprecated from the Azure portal?

We recognize that MDC serves multiple personas including security admins, cloud security architects, workload owners, DevOps teams, and more. With this release, MDC in the Azure portal remains as is, and we have no plans to deprecate it. Hence, adding security for new resources continues to remain in the Azure portal.  
Defender portal focuses on security teams overseeing cloud security across cloud and code environments. The Azure portal continues to serve Azure-focused personas such as workload owners and DevOps engineers. Our goal is to provide tailored experiences in each portal, ensuring every persona has the most relevant tools and insights for their needs. 

### Is there a feature parity list for all the features expanding into the Defender portal?

Yes, a feature parity list is available in the official Defender for Cloud documentation on Microsoft Learn here: [Azure portal vs Defender portal feature comparison](../azure-portal-vs-defender-portal-comparison.md).

### What if I only use the Azure portal and not the Defender portal?

The expansion to the Defender portal runs in addition to and in parallel with the Azure portal. Customers who use the Azure portal exclusively can continue to do so without any changes or impact.

## Billing implications

### Is there any billing impact with this expansion?

As of now, there is no billing impact. Existing customers will be able to turn on preview features and experience the new capabilities with no extra charge.  

## Customer impact & experience

### What specific customer workflows are being affected by this move? (e.g., threat detection, incident response, reporting or all) 

The expansion of Defender for Cloud into the Defender portal enhances and unifies existing workflows. For example, SOC teams can now access all the cloud information they need to investigate cloud-related incidents, end to end. Vulnerability management admins can view vulnerabilities from cloud resources such as virtual machines and containers in parallel with the endpoint data. Information security architects now have a comprehensive view of their cloud security posture, alongside devices, SaaS apps, and data, enabling faster remediation of security recommendations and a complete picture of their organization's overall posture.

### Are there any known limitations to this expansion? 

Yes, while Defender for Cloud is expanding in the Defender portal for an improved security experience, there are known limitations during the public preview phase. These are covered in a dedicated article on the Microsoft Learn platform, here: [Known limitations](known-limitations.md).

## Technical integration & operations

### Access & permissions

#### Will existing Azure MDC RBAC permissions carry over to the new experience in the Defender portal, or do we need to reassign access?  

Defender for Cloud in Azure and Defender portals operate with different RBAC models: Defender for Cloud in Azure utilizes Azure RBAC, while the Defender portal employs a combination of Entra ID global roles and Unified RBAC. Here is the difference between the two: 

- Azure RBAC manages access controls at the Azure resource level, including subscriptions and resource groups. 

- Unified RBAC enables more granular permissions within the Defender portal, allowing assignment of roles specific to security tasks and cloud scopes across Defender solutions. 

With the enhanced experience in the Defender portal, security teams can now access critical security data without requiring extensive permissions to underlying cloud resources. This eliminates a long-standing challenge in the Azure portal, where broad Azure access was necessary just to view security information—often causing friction with cloud operations teams. In addition, we can now group together cloud accounts into scopes and use them to grant access to relevant security teams so your relevant teams can review and act on security findings without requiring full platform access. This also enables non-Azure users—such as AWS or GCP admins—to manage their security content in Defender without needing Azure subscription rights, making multi-cloud operations easier and more secure. 

Defender uses its own permission model called Unified RBAC, designed specifically for security tasks. It does not rely on Azure RBAC roles. If users need access to both the Azure portal and the Defender portal, they will require two permissions: their existing Azure RBAC role and a new Unified RBAC role for Defender. For organizations that want to align permissions across systems, public APIs are available to automate role assignments. This approach ensures least-privilege access, improves governance, and streamlines security operations across multi-cloud environments. 

### Multi-Tenant & environment handling

#### If I have an MDC Multi-tenant environment with Azure Lighthouse, how will this environment surface in the new Defender portal?

Microsoft Defender for Cloud expands within the Defender portal to provide incident detection and response for multi-tenant environments through the existing Multi-Tenant Organizations (MTO) experience. At this stage, posture management features—such as recommendations, attack paths, and cloud inventory—are not yet available for multi-tenant scenarios in the Defender portal.

**Customers can continue to use Azure Lighthouse for multi-tenant posture management and operations, in parallel with the Defender portal.** This approach ensures that organizations retain full posture management capabilities while benefiting from the unified incident management and response features available in the Defender portal.

As we build and enhance MTO capabilities in future releases, customers will see expanded support for multi-tenant posture management and additional experiences directly within the Defender portal. 

### Synchronization & data consistency

#### After enabling the preview, how quickly can customers start seeing their data?  

The initial synchronization can take up to 24-hours.

#### If I remediate recommendations in the Defender portal, will those changes immediately reflect in the Azure portal or is there a delay? If there is, how long will it take to show up in Azure portal?

In the short term, security recommendations resolved in the Azure portal will be reflected as resolved in the Defender portal within 2 hours. We are working to improve this time so that users don't experience any delay  

#### Will the count of healthy and unhealthy resources be consistent across the Azure and the Defender portal? If not, what explains the difference?

Customers may notice differences when using Defender for Cloud in the Defender portal. With this expansion, we are exposing customers with the discovery of their complete environment and hence, the count can be different. This applies to the Secure Score, security recommendations, and the number of discovered resources in the environment.  

## Feature availability & roadmap

### If I only use Foundational CSPM and have other Defender Plans enabled, such as Defender for Storage, will I be able to see Foundational CSPM data in the new portal? 

Yes, security recommendations provided by the Foundational CSPM plan will appear for any subscription with at least one paid plan.

### I can see recommendation ownership via Governance feature. Will Governance feature be available in the Defender portal?

Governance assignments created manually or automatic will continue to work, and the assignment status including the relevant owner and due date will appear in the Defender portal. However, editing operations such as owner and due date changes will still be done via the Azure portal. In the future, we plan to introduce improved mobilization capabilities to allow security teams to operate and delegate the remediation effort directly to the Defender portal.

## Operations

### How will the transition impact ongoing investigation, alerts or integrations?

With cloud security posture data now integrated into the Defender portal, SOC teams gain a unified experience for investigating and responding to cloud-related alerts and incidents. Previously, investigations required switching to the Azure portal to gather resource details, creating inefficiencies, and gaps in visibility. Now, all posture signals and metadata are available directly within Defender, eliminating tool-hopping and enabling faster, more informed decisions. The new cloud asset inventory provides complete visibility into resources and their posture, while exposure insights—such as the exposure graph—deliver a 360-degree view of each asset. This integration empowers SOC teams to correlate alerts with posture data instantly, streamline workflows, and strengthen incident response.
