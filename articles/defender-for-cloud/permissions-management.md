---
title: Cloud infrastructure entitlement management (CIEM)
description: Learn about CIEM in Microsoft Defender for Cloud and enhance the security of your cloud infrastructure.
ms.topic: concept-article
author: Elazark
ms.author: elkrieger
ms.date: 05/08/2024
#customer intent: As a user, I want to understand how to manage permissions effectively so that I can enhance the security of my cloud infrastructure.
---

# Cloud infrastructure entitlement management (CIEM)

> [!NOTE]
> Effective April 1, 2025, Microsoft Entra Permissions Management will no longer be available for purchase.
>
> On October 1, 2025, Microsoft will retire and discontinue support for this product. Learn more about [the retirement of Microsoft Entra Permissions Management](https://aka.ms/mepmretire).
> 
> The deprecation of Microsoft Entra Permissions Management doesn't affect any existing CIEM capabilities in Microsoft Defender for Cloud. Learn more about [the future of CIEM in Microsoft Defender for Cloud](https://aka.ms/mdc-ciem).

Microsoft Defender for Cloud includes native cloud infrastructure Entitlement Management (CIEM) capabilities within the Defender [Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md) plan to help organizations discover, assess, and manage identity and access risks across their multicloud environments. These capabilities are designed to secure infrastructure by enforcing the principle of least privilege (PoLP), reducing the attack surface, and preventing the misuse of human and workload-based identities across Azure, AWS, and GCP.

## How Defender for Cloud analyzes permissions

Defender for Cloud continuously analyzes identity configurations and usage patterns to identify excessive, unused, or misconfigured permissions. It assesses human and non-human identities, including users, service principals, managed identities, and service accounts, and provides recommendations to reduce the risk of privilege misuse.

CIEM capabilities in Defender for Cloud support:

- Microsoft Entra ID identities and RBAC assignments

- AWS IAM users, roles, and policies

- Google Cloud IAM roles and service accounts

## Key capabilities

### Multicloud identity discovery

Track and analyze permissions across Azure, AWS, and GCP in a single, unified view. Identify which users, service principals, or federated accounts have access to cloud resources and how those permissions are used.

### Effective permission analysis

Understand not just who has access, but the potential risk of what they can access. Defender for Cloud evaluates effective permissions to identify identities that can reach sensitive or business-critical resources. Use __Cloud Security Explorer__ to search for specific identities or critical resources (e.g., containing sensitive data, exposed to the internet) and determine who has access, what level of access they have, and how that access could be exploited.

### Identity risk insights

Receive proactive guidance to reduce identity-related risk. Defender for Cloud surfaces [recommendations](/azure/defender-for-cloud/recommendations-reference-identity-access) such as:

- Removing inactive, guest, or blocked accounts with access

- Limiting administrative privileges to a defined set of users

- Right-sizing permissions for overprovisioned identities based on actual usage

- Enforcing MFA and strong password policies for IAM users

- Add any other relevant examples

### Lateral movement detections

Defender for Cloud correlates identity risks with attack path analysis, surfacing lateral movement opportunities that originate from overprivileged identities or misconfigurations. For example, a service principal with excessive rights could be leveraged by an attacker to move laterally from a compromised resource to a sensitive database. This context allows security teams to prioritize high-impact identity issues that may otherwise go unnoticed.

## How to view identity and permission risks

Defender for Cloud provides several ways to monitor and address access risk:

- [Cloud Security Explorer](azure/defender-for-cloud/how-to-manage-cloud-security-explorer): The Security Explorer allows you to query all identities in your environment with access to resources. This allows you to get a complete mapping of all your cloud entitlements with contextual information for the resources that the identities have permissions to.

- [Attack Path Analysis](/azure/defender-for-cloud/how-to-manage-attack-path): The Attack Path Analysis page lets you view attack paths that an attacker could take to reach a specific resource. With Attack Path Analysis, you can view a visual representation of the attack path and see which resources are exposed to the internet. Internet exposure often serves as an entry point for attack paths, especially when the resource has vulnerabilities. Internet-exposed resources often lead to targets with sensitive data.

- [Recommendations](/azure/defender-for-cloud/recommendations-reference-identity-access): Defender for Cloud provides [risk-based recommendations](/azure/defender-for-cloud/recommendations-reference-identity-access) for various CIEM misconfigurations. The built-in recommendations provide guidance for remediating inactive identities, overprovisioned permissions, and insecure identity settings.

- [CIEM Workbook](/azure/defender-for-cloud/custom-dashboards-azure-workbooks): The CIEM workbook provides a customizable visual report of your cloud identity security posture. You can use this workbook to view insights about your identities, unhealthy recommendations, and attack paths.

## Related content

Learn how to [enable CIEM](enable-permissions-management.md) in Microsoft Defender for Cloud.
