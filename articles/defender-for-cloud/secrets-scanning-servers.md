---
title: Protecting VM secrets with Microsoft Defender for Cloud
description: Learn how to protect VM secrets with Defender for Server's agentless secrets scanning in Microsoft Defender for Cloud.
ms.topic: overview
ms.date: 04/16/2024
---


# Agentless secrets scanning for machines

Microsoft Defender for Cloud provides [secrets scanning](secrets-scanning.md) for virtual machines as part of its [agentless machine scanning features](concept-agentless-data-collection.md) that improve security posture on Azure VMs, and on AWS and GCP machines connected to Defender for Cloud. Agentless scanning doesn't need any installed agents or network connectivity, and doesn't effect machine performance.

Secrets scanning for VMs helps you to quickly detect, prioritizes, and remediate exposed secrets. Secrets detection can identify a wide range of secrets types, such as tokens, passwords, keys, or credentials, stored in different types of file on the OS file system. 

- Agentless secrets scanning for VMs locates plaintext secrets that exist in your environment.
- If secrets are detected, Defender for Cloud assists your security team to prioritize and take actionable remediation steps to minimize the risk of lateral movement, all without affecting your machine's performance.


Secrets scanning for VMs is available in these Defender for Cloud plans:

- Defender Cloud Security Posture Management (CSPM) plan.
- Defender for Servers Plan 2

VM secrets scanning can scan Azure VMs, and AWS/GCP instances onboarded to Defender for Cloud.

## Reducing security risk

Secrets scanning helps reduce risk with the following mitigations:

- Eliminating secrets that aren’t needed.
- Applying the principle of least privilege.
- Strengthening secrets security by using secrets management systems such as Azure Key Vault.
- Using short-lived secrets such as substituting Azure Storage connection strings with SAS tokens that possess shorter validity periods.

## How does VM secrets scanning work?

Secrets scanning for VMs is agentless and uses cloud APIs.

- Secrets scanning captures disk snapshots and analyses them, with no impact on VM performance.
 - After the Microsoft secrets scanning engine collects secrets metadata from disk, it sends them to Defender for Cloud. 
- The secrets scanning engine verifies whether SSH private keys can be used to move laterally in your network.
    - SSH keys that aren’t successfully verified are categorized as unverified on the Defender for Cloud Recommendations page. 
    - Directories recognized as containing test-related content are excluded from scanning.







## Related content

[Investigate and remediate machine secrets](remediate-server-secrets.md)
