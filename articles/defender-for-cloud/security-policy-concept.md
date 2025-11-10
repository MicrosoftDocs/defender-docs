---
title: Security policies in Microsoft Defender for Cloud 
description: Learn how to improve your cloud security posture in Microsoft Defender for Cloud with security policies, standards, and recommendations.
ms.topic: concept-article
ms.date: 02/09/2025
#customer intent: As a security administrator, I want to understand how Microsoft Defender for Cloud uses security policies, standards, and recommendations to assess and improve my organization’s cloud security posture.
---

# Security policies in Defender for Cloud

Security policies in Microsoft Defender for Cloud define how your cloud resources are evaluated for security across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP). A policy specifies the standards, controls, and conditions Defender for Cloud uses to assess resource configurations and identify potential security risks.

Each policy includes [security standards](concept-regulatory-compliance-standards.md), which define the controls and assessment logic applied to your environment. Defender for Cloud continuously evaluates your resources against these standards. When a resource doesn’t meet a defined control, Defender for Cloud generates a [security recommendation](review-security-recommendations.md) that describes the issue and the actions required to remediate it.

This enables Defender for Cloud to continuously assess resources and improve your organization’s security posture.

## Security standards

Security policies in Defender for Cloud can include several types of standards:

- **Security benchmarks** – Built-in baselines such as the [Microsoft Cloud Security Benchmark (MCSB)](concept-regulatory-compliance.md) and cloud-provider benchmarks that define foundational best practices.

- **Regulatory compliance standards** – Frameworks from industry and compliance programs available when you enable a [Defender for Cloud plan](defender-for-cloud-introduction.md).

- **Custom standards** – Organization-defined standards that include built-in or [custom recommendations](#custom-recommendations) to align Defender for Cloud assessments with internal security policies.

Learn more about [security standards in Defender for Cloud](concept-regulatory-compliance-standards.md). 

## Security recommendations

Security recommendations are actionable insights generated from assessments against security standards. Each recommendation includes:

- A short description of the issue  
- Steps for remediation  
- Affected resources  
- Severity and risk factors  
- Attack path context (when available)

The Defender for Cloud risk model prioritizes recommendations based on exposure, data sensitivity, lateral movement potential, and exploitability.

> [!IMPORTANT]
> [Risk prioritization](risk-prioritization.md) doesn't affect the secure score.

### Custom recommendations

You can create custom recommendations to define your own assessment logic by using [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query). This capability is available for all clouds when the [Defender CSPM plan](concept-cloud-security-posture-management.md) is enabled.

Custom recommendations are created within a custom standard and can also be linked to additional standards if needed.  
Each recommendation includes query logic, remediation steps, severity, and applicable resource types.  
After creation, custom recommendations appear with built-in recommendations in the Regulatory compliance dashboard and contribute to your overall security posture assessment.

Learn more about [creating custom recommendations](create-custom-recommendations.md).

## Example

MCSB includes multiple controls that define expected security configurations. One of these controls is “Storage accounts should restrict network access using virtual network rules.”

Defender for Cloud continuously assesses resources. If it finds any that don’t satisfy this control, it marks them as noncompliant and triggers a recommendation. In this case, the guidance is to harden Azure Storage accounts that aren't protected with virtual network rules.

## Next steps

- Learn more about [security standards](concept-regulatory-compliance-standards.md) and [MCSB](concept-regulatory-compliance.md).
- Learn more about [security recommendations](review-security-recommendations.md).
- Learn how to [assign and manage standards](assign-regulatory-compliance-standards.md) for your cloud environments.  
- Monitor and improve your compliance posture in the [Regulatory compliance dashboard](regulatory-compliance-dashboard.md).
