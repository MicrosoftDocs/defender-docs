---
title: Unified identity security recommendations
description: Learn which identity sources and applications are covered by security recommendations in Microsoft Defender, including Active Directory, SaaS apps, and non-Microsoft identity providers.
#customer intent: As a security admin, I want to understand which identity sources have security recommendations in Microsoft Defender so that I can assess my coverage and plan improvements.
author: AbbyMSFT
ms.author: abbyweisberg
ms.date: 03/17/2026
ms.topic: concept-article
ms.service: defender-xdr
ms.custom: msecd-doc-authoring-106
ai-usage: ai-assisted
---

# Unified identity security recommendations

Microsoft Defender provides security recommendations that help you identify and fix configuration weaknesses across your identity sources. These recommendations cover Active Directory, SaaS applications, and non-Microsoft identity providers (IdPs), and they appear in [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management) and [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score).

Security recommendations come from two capabilities:

- **Identity security posture management (ISPM)**: Provides recommendations for Active Directory and non-Microsoft identity providers. For information about how to view and act on these recommendations, see [Identity security initiative (Preview)](/defender-for-identity/identity-security-initiative).
- **SaaS security posture management (SSPM)**: Provides recommendations for SaaS application configurations. For information about how SSPM works and how to turn on recommendations, see [SaaS security posture management](/defender-cloud-apps/posture-overview).

## Supported identity sources

The following sections list the identity sources and applications that currently have security recommendations in Microsoft Defender.

### Active Directory

Microsoft Defender for Identity provides security recommendations for on-premises Active Directory environments. For the full list of recommendations, see [Security posture assessments](/defender-for-identity/security-assessment).

### SaaS applications

Microsoft Defender for Cloud Apps provides security recommendations for SaaS application configurations through SSPM. For information about connecting apps and turning on recommendations, see [SaaS security posture management](/defender-cloud-apps/posture-overview).

Security recommendations are available for the following SaaS applications:

- All Microsoft apps
- Atlassian
- Citrix ShareFile
- DocuSign
- Dropbox
- GitHub
- Google Workspace
- NetDocuments
- Salesforce
- ServiceNow
- Workplace by Meta
- Zendesk
- Zoom

### Non-Microsoft identity providers

Security recommendations are available for the following non-Microsoft identity providers:

- Okta
- PingOne
- CyberArk (Preview)
- SailPoint (Preview)

## Related content

- [Identity security initiative (Preview)](/defender-for-identity/identity-security-initiative)
- [SaaS security posture management](/defender-cloud-apps/posture-overview)
- [Security posture assessments](/defender-for-identity/security-assessment)
- [View your identity coverage and maturity](/defender-xdr/identity-security/coverage-maturity)
