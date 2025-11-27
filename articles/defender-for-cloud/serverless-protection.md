---
title: What is Serverless protection
description: Learn about Serverless protection in Microsoft Defender for Cloud and how it helps secure your serverless resources.
ms.topic: overview
ms.date: 11/27/2025
#customer intent: As a reader, I want to understand what Serverless protection is in Microsoft Defender for Cloud.
---

# Serverless protection

Microsoft Defender for Cloud, as a Cloud-Native Application Protection Platform (CNAPP), delivers comprehensive visibility, security, and posture management for serverless workloads across multicloud environments. It extends coverage to Azure Web Apps, Azure Functions, and Amazon Web Service (AWS) Lambda, ensuring these resources are fully protected. 

Serverless protection automatically discovers and inventories all Web Apps, Azure Functions, and AWS Lambda functions in your environment. Once it discovers these resources, Defender for Cloud identifies misconfigurations, vulnerabilities, and insecure dependencies. Defender for Cloud then offers remediation guidance and continuous posture assessment, helping organizations maintain strong posture management and reduce risk in dynamic, serverless architectures.

## Serverless protection requirements

Serverless protection is available as part of the [Defender Cloud Security Posture Management (CSPM) plan](concept-cloud-security-posture-management.md#cspm-plans). 

To enable serverless protection, you must [Enable the Defender CSPM plan](tutorial-enable-cspm-plan.md) on your subscription, and [enable the Serverless protection component](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan) of the Defender CSPM plan.

## Benefits of Serverless protection

Defender for Cloud extends its CSPM capabilities to serverless workloads by providing continuous visibility and risk assessment with the following features:

- **Automatic resource discovery**: Detects all serverless resources (Azure Functions, Web Apps, AWS Lambda) and lists them in a unified inventory.

- **Continuous posture assessment**: Evaluates configurations for risks like public endpoints, weak authentication, and missing encryption.

- **Misconfiguration detection**: which includes:
    - Access Control: Restrict network exposure, enforce authentication.
    - Identity & Permissions: Prevent lateral movement, data exfiltration and privilege abuse.
    - Code Integrity: Protect against unauthorized code changes [like AWS Lambda code signing].
 
- **Vulnerability assessment**: Scans function packages for vulnerable dependencies and provides remediation guidance.

- **Attack Path Analysis**: Maps potential attack chains involving serverless resources for proactive risk mitigation

Defender for Cloud uses these features to help organizations secure their serverless workloads, ensuring robust security posture management in dynamic cloud environments.

Beyond these core benefits, serverless security in Defender for Cloud aligns with the broader vision of CNAPP, which aims to secure applications throughout their lifecycle. 

Serverless protection is integrated into the Defender portal, providing visibility for misconfiguration detection, attack path analysis, and vulnerability assessment in a single interface.

## How Serverless protection works

Serverless protection in Defender for Cloud works through a combination of automated discovery, continuous monitoring, and risk assessment. When you enable the Defender CSPM plan and activate the serverless protection component, Defender for Cloud scans your cloud environment to identify all serverless resources, including Azure Web Apps, Azure Functions, and AWS Lambda functions.

After Defender for Cloud discovers the resources, Defender for Cloud continuously monitors their configurations and runtime environments. It evaluates these resources against a set of security best practices and compliance standards to identify misconfigurations, vulnerabilities, and insecure dependencies. When it detects a risk, Defender for Cloud generates security recommendations with detailed remediation steps to help you address the issues.

### Inventory

Defender for Cloud provides a unified inventory of all discovered serverless resources, so you can easily view and manage them. The inventory page includes details such as resource names, types, locations, and associated security findings. Simply filter the results based on resource type to focus on Web Apps, Azure Functions, or AWS Lambda functions.

:::image type="content" source="media/serverless-protection/serverless-inventory.png" alt-text="Screenshot that shows the inventory page filtered by resources." lightbox="media/serverless-protection/serverless-inventory.png":::

After you filter your results, select any of the resources to view more details about its security posture, including any active security recommendations and their severity levels.

:::image type="content" source="media/serverless-protection/resource-health.png" alt-text="Screenshot that shows a selected resources health." lightbox="media/defender-for-apis-posture/resource-health.png":::

You can also review the security recommendations associated with each resource to prioritize remediation efforts based on the severity of the findings and remediate them.

Learn how to [remediate security recommendations](implement-security-recommendations.md). 

### Cloud Security Explorer

Defender for Cloud's Cloud Security Explorer provides advanced filtering and querying capabilities that allow you to analyze the security posture of your serverless resources. You can create custom queries to identify specific misconfigurations or vulnerabilities across your serverless workloads.

:::image type="content" source="media/serverless-protection/serverless-cloud-security-explorer.png" alt-text="Screenshot of the Cloud Security Explorer page with a query specific to serverless protection entered." lightbox="media/serverless-protection/serverless-cloud-security-explorer.png":::

Learn how to [build queries with cloud security explorer](how-to-manage-cloud-security-explorer.md).

## Related content

- [Protect your resources with Defender CSPM](tutorial-enable-cspm-plan.md)
- [Remediate recommendations in Microsoft Defender for Cloud](implement-security-recommendations.md)
- [Build queries with cloud security explorer](how-to-manage-cloud-security-explorer.md)