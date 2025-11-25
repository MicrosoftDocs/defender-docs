---
title: What is Serverless protection
description: Learn about Serverless protection in Microsoft Defender for Cloud and how it helps secure your serverless resources.
ms.topic: concept-article
ms.date: 11/25/2025
#customer intent: As a reader, I want to understand what Serverless protection is in Microsoft Defender for Cloud.
---

## Serverless protection overview

Microsoft Defender for Cloud, as a Cloud-Native Application Protection Platform (CNAPP), delivers comprehensive visibility, security, and posture management for serverless workloads across multi-cloud environments. It extends coverage to Azure Web Apps, Azure Functions, and AWS Lambda, ensuring these resources are fully protected. 

Serverless protection provides automatic discovery, which allows Defender for Cloud to identify all Web Apps, Azure Functions, and AWS Lambda functions that are deployed in your environment and lists them under a unified inventory. Once these resources are discovered, Defender for Cloud can then identify misconfigurations, vulnerabilities, and insecure dependencies. Defender for Cloud then offers remediation guidance and continuous posture assessment, helping organizations maintain strong posture management and reduce risk in dynamic, serverless architectures.

## Serverless protection requirements

Serverless protection is available as part of the Defender Cloud Security Posture Management (CSPM) plan. To enable serverless protection, you must [Enable the Defender CSPM plan](tutorial-enable-cspm-plan.md) on your subscription, and then [enable the Serverless protection component](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan).

You must also [enable Registry access](defender-for-containers-enable.md) under the Defender for Containers plan, to receive Vulnerability Assessments for serverless workloads.

## Benefits of Serverless protection

Defender for Cloud extends its CSPM capabilities to serverless workloads by providing continuous visibility and risk assessment with the following features:

- **Automatic resource discovery**: Detects all serverless resources (Azure Functions, Web Apps, AWS Lambda) and lists them in a unified inventory.

- **Continuous posture assessment**: Evaluates configurations for risks like public endpoints, weak authentication, and missing encryption.

- **Misconfiguration detection**: Identifies overly permissive roles, insecure environment variables, and network vulnerabilities.

- **Vulnerability scanning**: Scans function packages for vulnerable dependencies and provides remediation guidance.

- **Attack Path Analysis**: Maps potential attack chains involving serverless resources for proactive risk mitigation

Defender for Cloud uses these features to help organizations secure their serverless workloads, ensuring robust security posture management in dynamic cloud environments.

Beyond these core benefits, serverless security in Defender for Cloud aligns with the broader vision of CNAPP, which aim to secure applications throughout their lifecycle. 

Defender for Cloud's integration with Microsoft Defender XDR further enhances visibility by correlating alerts across workloads, enabling faster incident response. To maximize protection, organizations should follow best practices such as enforcing HTTPS, applying least-privilege IAM roles, and regularly updating dependencies. These measures, combined with Defender for Cloud’s capabilities, create a robust security framework for serverless applications.

## How Serverless protection works

Serverless protection in Defender for Cloud operates through a combination of automated discovery, continuous monitoring, and risk assessment. Once the Defender CSPM plan is enabled and the Serverless protection component is activated, Defender for Cloud begins by scanning your cloud environment to identify all serverless resources, including Azure Web Apps, Azure Functions, and AWS Lambda functions.

Once the resources are discovered, Defender for Cloud continuously monitors their configurations and runtime environments. It evaluates these resources against a set of security best practices and compliance standards to identify misconfigurations, vulnerabilities, and insecure dependencies. When a risk is detected, Defender for Cloud generates security recommendations with detailed remediation steps to help you address the issues.

Attack path

Inventory 

Learn how to [remediate security recommendations](implement-security-recommendations.md). 

## Next step