---
title: API security posture overview
description: Learn how Microsoft Defender for Cloud enhances API security posture management for your APIs across Azure API Management, Function Apps, and Logic Apps.
ms.author: dacurwin
author: dcurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 06/18/2025
#customer intent: As a security professional, I want to understand how to manage and improve the security posture of my APIs using Microsoft Defender for Cloud, so that I can protect my cloud-native applications effectively.
---

# Improve your API security posture

APIs are entry points into cloud-native apps. They connect services, apps, and data, making them targets for attackers. API security posture management helps protect APIs by assessing risks from misconfigurations and vulnerabilities. The Defender Cloud Security Posture Management (CSPM) plan in Microsoft Defender for Cloud offers API posture and risk assessments for your Azure API Management APIs.

> [!NOTE]
> **API discovery and security posture for APIs hosted in Function Apps and Logic Apps is now available in Public Preview.** This includes visibility into APIs and identification of inactive or dormant APIs, as well as APIs that permit unencrypted traffic which may pose security risk.

## Capabilities

API security posture management in Defender for Cloud offers the following capabilities:

- **Gain visibility into your APIs**:  
  Get a centralized view of managed APIs across Azure API Management and APIs hosted in Function Apps and Logic Apps, with automated onboarding into Defender for Cloud.
- **Assess API security recommendations with risk factors** *(Azure API Management only)* to:  
  - Identify and remediate unauthenticated API risks.  
  - Detect APIs exposed to the internet.  
  - Identify sensitive data exposure in API endpoints, including requests and responses, URL paths, and query parameters (integrated with Microsoft Purview), powered by analyzing sampled API traffic logs.
- **Identify inactive or dormant APIs**:  
  Surface APIs that are no longer in use across Azure API Management, Function Apps, and Logic Apps.
- **Identify APIs allowing unencrypted traffic**:  
  Surface APIs that permit unencrypted communication, which may introduce risk.
- **Understand cloud application exposure risks** by linking APIs to backend environments like virtual machines, containers, storage, and databases.
- **Address API-driven attack paths** and prioritize mitigation with cloud [security explorer and API-led attack path analysis](concept-attack-path.md).

## Unified inventory

Defender for Cloud continuously discovers APIs across Azure API Management, Function Apps, and Logic Apps. You can view all APIs with posture insights in the Defender for Cloud [asset inventory](asset-inventory.md) and [API Security dashboard](defender-for-apis-introduction.md#review-api-security-findings). This helps you address API risks efficiently.

## Prioritize and implement API security best practices

Assess and secure your APIs against high-risk issues such as lack of encryption and anonymous access with broken or weak authentication. Gain insights into inactive APIs and those exposed directly to the internet. Defender for Cloud scans for API risks, considering potential exploitability and business impact. [Security recommendations](risk-prioritization.md#recommendations) are prioritized based on these factors, allowing you to fix critical vulnerabilities first.

## Classify APIs exposing sensitive data

Improve data security by assessing sensitive data exposed in API URL path parameters, query parameters, and request and response bodies, including the source of the data exposure. With [Microsoft Purview](/purview/sit-sensitive-information-type-learn-about), you can use custom sensitive information types and sensitivity labels to create a common taxonomy, covering data-in-transit risks.

### Sampling

Sensitive data exposure in your APIs is assessed using sampling methods within the Defender CSPM plan. This approach saves both cost and time.

## Explore API risks and prioritize remediation

Attack path analysis identifies risks to your API endpoints, especially with multiple security insights like unauthenticated access and external exposure. Use Defender CSPM’s [cloud security explorer](how-to-manage-cloud-security-explorer.md) to enrich API risk exploration by linking APIs with backend compute environments like virtual machines and load balancers. This visibility helps security teams quickly prioritize and mitigate API attack surfaces, offering insight into potential lateral movement or data exfiltration risks.

## Enable API security posture management

To use API security posture capabilities in Microsoft Defender for Cloud, you must:

1. **Enable the Defender Cloud Security Posture Management (CSPM) plan** in your subscription.  
2. **Enable the [API Security Posture Management extension](enable-api-security-posture.md)** to allow Defender for Cloud to discover APIs and assess their posture.

Once enabled, Defender for Cloud will automatically begin onboarding supported APIs and providing visibility and security insights.

## Related content  
- [Enable API security posture with Defender CSPM](enable-api-security-posture.md).  
- Review of [security recommendations](review-security-recommendations.md).  
- [Identify and remediate attack paths](how-to-manage-attack-path.md).  
- Monitor API threats using [Defender for APIs Workload Protection](defender-for-apis-deploy.md).
