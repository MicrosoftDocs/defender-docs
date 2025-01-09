---
title: Zero Trust and Microsoft Defender for Cloud Apps
description: This article describes how Microsoft Defender for Cloud Apps fits into an overall Zero Trust security strategy when deployed with Microsoft Defender XDR.
ms.date: 05/12/2024
ms.topic: conceptual
ms.collection:
  - zerotrust-services
---

# Zero Trust and Microsoft Defender for Cloud Apps

[Zero Trust](/security/zero-trust/zero-trust-overview) is a security strategy for designing and implementing the following sets of security principles:

|Verify explicitly  |Use least privilege access  |Assume breach  |
|---------|---------|---------|
|Always authenticate and authorize based on all available data points.     | Limit user access with Just-In-Time and Just-Enough-Access (JIT/JEA), risk-based adaptive policies, and data protection.        | Minimize blast radius and segment access. Verify end-to-end encryption and use analytics to get visibility, drive threat detection, and improve defenses.        |

Microsoft Defender for Cloud apps is a primary component of a Zero Trust strategy and your XDR deployment with Microsoft Defender XDR. Microsoft Defender for Cloud Apps gathers signals from your organization's use of cloud apps and protects data flowing between your environment and these apps, including both sanctioned and unsanctioned cloud apps. For example, Microsoft Defender for Cloud Apps notices anomalous behavior like impossible-travel, credential access, and unusual download, file share, or mail forwarding activity and reports these to the security team for mitigation.

## Monitoring for Zero Trust

When monitoring for Zero Trust, use Defender for Cloud Apps to [discover and secure](best-practices.md#discover-and-assess-cloud-apps) the SaaS apps being used in your organization and deploy policies that define how you want your users to behave in the cloud. 

Respond to threats with Defender for Cloud Apps's user and entity behavioral analytics (UEBA) and anomaly detection, malware protection, OAuth app protection, incident investigation, and remediation. Monitor for [security anomaly alerts](./investigate-anomaly-alerts.md), such as for impossible travel, suspicious inbox rules, and ransomware. Focus on identifying app usage patterns, assessing risk levels and business readiness of apps, preventing data leaks to noncompliant apps, and limiting access to regulated data.

Use Defender for Cloud Apps to inform Microsoft Entra ID about what happened to the user after they authenticated and received a token. If the user pattern starts to look suspicious, such as if a user starts to download gigabytes of data from OneDrive or starts to send spam emails in Exchange Online, notify Microsoft Entra ID that the user seems to be compromised or high risk. On the next access request from this user, Microsoft Entra ID can correctly take action to verify the user or block them.

### IaaS and PaaS security

Beyond SaaS applications, Defender for Cloud Apps helps you strengthen your security posture for IaaS and PaaS services by getting visibility into the security configuration and compliance status across your public cloud platforms. This enables a risk-based investigation of the entire platform configuration status. [Integrate Microsoft Purview with Defender for Cloud Apps](azip-integration.md#how-to-integrate-microsoft-purview-with-defender-for-cloud-apps) to label your apps and protect data across your apps, preventing inadvertent exposure to sensitive information. 

## Next steps

Learn more about Zero Trust and how to build an enterprise-scale strategy and architecture with the [Zero Trust Guidance Center](/security/zero-trust).

For application-centric concepts and deployment objectives, see [Secure applications with Zero Trust](/security/zero-trust/deploy/applications).

See these articles for additional Zero Trust policies and best practices for applications:

- [Recommended Microsoft Defender for Cloud Apps policies for SaaS apps](/microsoft-365/security/office-365-security/mcas-saas-access-policies)
- [Application integrations for Zero Trust](/security/zero-trust/integrate/applications)
- [Create Defender for Cloud App policies for Zero Trust](/security/zero-trust/create-policies)
- [Deploy information protection for SaaS apps](/security/zero-trust/deploy-information-protection-saas)

Learn more about other Microsoft 365 capabilities that contribute to a strong Zero Trust strategy and architecture with [Zero Trust deployment plan with Microsoft 365](/microsoft-365/security/microsoft-365-zero-trust).

For an overview of Zero Trust for Microsoft Defender XDR services, see [Zero Trust with Microsoft Defender XDR](/microsoft-365/security/defender/zero-trust-with-microsoft-365-defender).
