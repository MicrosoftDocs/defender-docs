---
title: API security posture overview
description: Learn how Microsoft Defender for Cloud enhances API security posture management for your APIs in Azure API Management.
ms.author: dacurwin
author: dcurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 11/05/2024
#customer intent: As a security professional, I want to understand how to manage and improve the security posture of my APIs using Microsoft Defender for Cloud, so that I can protect my cloud-native applications effectively.

---

# Improve your API security posture (Preview)

APIs are entry points into cloud-native apps. They connect services, apps, and data, making them targets for attackers. API security posture management helps protect APIs by assessing risks and misconfigurations. The Defender Cloud Security Posture Management (CSPM) plan in Microsoft Defender for Cloud offers API posture and risk assessments for your Azure API Management APIs. This provides insights into risks, recommendations, and attack path analysis.  

> **Note:** API security posture management supports APIs in your Azure API Management platform if you have an active [Defender CSPM](concept-cloud-security-posture-management.md#plan-availability) plan.  

## Capabilities

API security posture management in Defender for Cloud offers the following capabilities:

- Centralize visibility into your managed APIs. Get a unified inventory by automatically onboarding them into Defender for Cloud.  
- Assess API [security recommendations](risk-prioritization.md#recommendations) with risk factors to:  
  - Identify and fix unauthenticated API risks.  
  - Detect inactive or dormant APIs.  
- Identify APIs exposed to the internet.  
- Identify sensitive data exposure in API endpoints, including requests and responses, URL paths, and query parameters (integrated with Microsoft Purview).  
- Understand cloud application exposure risks by linking APIs to backend environments like virtual machines, containers, storage, and databases.  
- Address API-driven attack paths and prioritize mitigation with cloud [security explorer and API-led attack path analysis](concept-attack-path.md).  

## Unified inventory  

Defender for Cloud continuously discovers APIs published within your Azure API Management Service. You can view all APIs with posture insights in the Defender for Cloud [asset inventory](asset-inventory.md) and [API Security dashboard](defender-for-apis-introduction.md#reviewing-api-security-findings). This helps you address API risks efficiently.  

## Prioritize and implement API security posture best practices  

Assess and secure your APIs against high-risk issues like broken or weak authentication. Get insights on inactive APIs and those exposed directly to the internet. Defender for Cloud scans for API risks, considering potential exploitability and business impact. [Security recommendations](risk-prioritization.md#recommendations) are prioritized based on these factors, allowing you to fix critical vulnerabilities first.  

## Classify APIs exposing sensitive data  

Improve data security by assessing sensitive data exposed in API URL path parameters, query parameters, and request and response bodies. The system provides evidence of the data exposure source to support faster remediation. With Microsoft Purview, you can use custom sensitive information types and sensitivity labels to create a common taxonomy, covering data-in-transit risks.  

### Sampling  

Discover sensitive data exposure in your APIs with sampling methods in the Defender CSPM plan. This efficiently identifies sensitivity while saving costs and time.  

## Explore API risks and prioritize remediation  

Attack path analysis identifies risks to your API endpoints, especially with multiple security insights like unauthenticated access and external exposure. Use Defender CSPM’s cloud security explorer to enrich API risk exploration by linking APIs with backend compute environments like virtual machines and load balancers. This visibility helps security teams quickly prioritize and mitigate API attack surfaces, offering insight into potential lateral movement or data exfiltration risks.  

## Related content  

- [Enable API security posture management within the Defender CSPM Plan Extension page in the Environments Settings](enable-api-security-posture.md).  
- Review of [security recommendations](review-security-recommendations.md).  
- [Identify and remediate attack paths](how-to-manage-attack-path.md).  
- Monitor API threats using [Defender for APIs Workload Protection](defender-for-apis-deploy.md).
