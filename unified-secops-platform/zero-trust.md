---
title: Zero Trust with unified security operations | Microsoft Defender
description: Learn how implementing Microsoft's unified security operations platform can help you deploy a Zero Trust architecture.
author: batamig
ms.author: bagol
ms.service: unified-secops-platform
ms.topic: concept-article #Don't change.
ms.date: 01/16/2025
ms.collection:
- usx-security
#customerIntent: As a security operations professional, I want to implement a Zero Trust architecture using Microsoft's unified SecOps platform to enhance our organization's security posture by ensuring explicit verification, least privilege access, and preparation for potential breaches.
---

# Zero Trust with Microsoft's unified security operations platform

Zero Trust is a security strategy for designing and implementing the following sets of security principles:

|Security principle |Description|
|---|---|
|**Verify explicitly** |Always authenticate and authorize based on all available data points. |
|**Use least privilege access** |Limit user access with Just-In-Time and Just-Enough-Access (JIT/JEA), risk-based adaptive policies, and data protection.      |
|**Assume breach** |Minimize blast radius and segment access. Verify end-to-end encryption and use analytics to get visibility, drive threat detection, and improve defenses. |

This article describes how Microsoft's unified security operations (SecOps) platform provides centralized access to the tools and capabilities necessary to implement a comprehensive Zero Trust solution.

## Verify explicitly with unified SecOps

To effectively verify explicitly, Microsoft's unified SecOps platform provides a variety of tools and services to ensure that every access request is authenticated and authorized based on comprehensive data analysis. For example:

- **Microsoft Defender XDR** provides extended detection and response across users, identities, devices, apps, and emails. Add **Microsoft Defender for Cloud** to stretch that threat protection across multi-cloud and hybrid environments, and **Microsoft Entra ID Protection** to help you evaluate risk data from sign-in attempts. 

- **Microsoft Defender Threat Intelligence** enriches your data with the latest threat updates and indicators of compromise (IoCs). 
- **Microsoft Security Copilot** provides AI-driven insights and recommendations that enhance and automate your security operations. 
- Add **Microsoft Security Exposure Management** to enrich your asset information with extra security context.

- **Microsoft Sentinel** collects data from across the environment and analyzes threats and anomalies so that your organization and any automation implemented, can act based on all available and verified data points. Microsoft Sentinel automation can also help you use risk-based signals captured across the Defender portal to take action, such as blocking or authorizing traffic based on the level of risk.

For more information, see:

- [What is Microsoft Defender XDR?](/defender-xdr/microsoft-365-defender)
- [What is Microsoft Defender for Cloud?](/azure/defender-for-cloud/defender-for-cloud-introduction)
- [What is Microsoft Entra ID Protection?](/entra/id-protection/overview-identity-protection)
- [What is Microsoft Defender Threat Intelligence (Defender TI)?](/defender/threat-intelligence/what-is-microsoft-defender-threat-intelligence-defender-ti)
- [What is Microsoft Security Copilot?](/copilot/security/microsoft-security-copilot)
- [What is Microsoft Security Exposure Management?](/security-exposure-management/get-started-exposure-management)
- [What is Microsoft Sentinel?](/azure/sentinel/overview?tabs=defender-portal)

## Use least privileged access across unified SecOps

Microsoft's unified SecOps platform also provides a comprehensive set of tools to help you implement least privilege access across your environment. For example:

- Implement **Microsoft Defender XDR** unified role-based access control (RBAC) to assign permissions based on roles, ensuring users have only the access they need to perform their tasks.

- Provide just-in-time activations for privileged role assignments by using **Microsoft Entra ID Protection's** Privileged Identity Management (PIM).

- Implement **Microsoft Defender for Cloud Apps** Conditional Access policies to enforce adaptive access policies based on user, location, device, and risk signals to ensure secure access to resources.

- Configure **Microsoft Defender for Cloud** threat protection to block and flag risky behavior, and employ hardening mechanisms to implement least privilege access and JIT VM access.

**Microsoft Security Copilot** also authenticates users with on-behalf-of (OBO) authentication, ensuring that users have access only to the resources they need.

For more information, see:

- [Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/manage-rbac)
- [What is Microsoft Entra Privileged Identity Management?](/entra/id-governance/privileged-identity-management/pim-configure)
- [Conditional Access app control in Microsoft Defender for Cloud Apps](/defender-cloud-apps/proxy-intro-aad)
- [Start planning multicloud protection with Defender for Cloud](/azure/defender-for-cloud/plan-multicloud-security-get-started)
- [Understand authentication in Microsoft Security Copilot](/copilot/security/authentication)

## Assume breach across unified SecOps

Assuming breach helps organizations prepare for and respond to security incidents more effectively. For example, with the unified SecOps platform:

- Configure **Microsoft Defender XDR** automatic attack disruption to contain attacks in progress, limiting lateral movement and reducing impact with high-fidelity signals and continuous investigation insights.

- Automatically respond to security threats across the enterprise by using **Microsoft Sentinel's** automation rules and playbooks.

- Implement **Microsoft Defender for Cloud's** recommendations to block and flag risky or suspicious behavior, and automate responses across coverage areas with Azure Logic Apps.

- Enable **Microsoft Entra ID Protection** notifications so that you can respond appropriately when a user is flagged as at risk.

For more information, see:

- [Automatic attack disruption in Microsoft Defender XDR](/defender-xdr/automatic-attack-disruption)
- [Automation in Microsoft Sentinel - security orchestration, automation, and response (SOAR)](/azure/sentinel/automation/automation)
- [What's new in Defender for Cloud recommendations, alerts, and incidents](/azure/defender-for-cloud/release-notes-recommendations-alerts)
- [Microsoft Entra ID Protection notifications](/entra/id-protection/howto-identity-protection-configure-notifications)

## Next step

[Microsoft's unified security operations platform planning overview](overview-plan.md)
