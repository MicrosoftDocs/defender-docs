---
title: Overview - AI security posture management
description: Learn about AI security posture management in Microsoft Defender for Cloud and how it protects resources from AI threats.
ms.date: 04/23/2025
ms.topic: concept-article
ms.author: elkrieger
author: Elazark
#customer intent: As a cloud security professional, I want to understand how to secure my generative AI resources using Defender for Cloud's AI security posture management capabilities.
---

# Overview - AI security posture management

The Defender Cloud Security Posture Management (CSPM) plan in Microsoft Defender for Cloud secures enterprise-built, multicloud, or hybrid cloud environments. These environments include Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP) Vertex AI (Preview). The CSPM plan secures generative AI applications throughout their entire lifecycle.
 Defender for Cloud reduces risks to cross-cloud AI workloads by:

- Discover the generative AI Bill of Materials (AI BOM), which includes application components, data, and AI artifacts from code to cloud.
- Strengthening generative AI application security posture with built-in recommendations and by exploring and remediating security risks.
- Using the attack path analysis to identify and remediate risks.

:::image type="content" source="media/ai-security-posture/ai-lifecycle.png" alt-text="Diagram of the development lifecycle that is covered by Defender for Cloud's AI security posture management.":::

> [!IMPORTANT]
> To enable AI security posture management capabilities on an AWS account that already:
>
> - Is connected to your Azure account.
> - Has Defender CSPM enabled.
> - Has permissions type set as **Least privilege access**.
>
> You must reconfigure the permissions on that connector to enable the relevant permissions using these steps:
>
> 1. In the Azure portal, navigate to the Environment Settings page and select the appropriate AWS connector.
> 1. Select **Configure access**.
> 1. Ensure the permissions type is set to **Least privilege access**.
> 1. [Follow steps 5 - 8](quickstart-onboard-aws.md#select-defender-plans) to finish the configuration.

## Discover generative AI apps

Defender for Cloud discovers AI workloads and identifies details of your organization's AI BOM. This visibility allows you to identify and address vulnerabilities and protect generative AI applications from potential threats.

Defender for Cloud automatically and continuously discovers deployed AI workloads across the following services:

- Azure OpenAI Service
- Azure Machine Learning
- Amazon Bedrock

Defender for Cloud can also discover vulnerabilities within generative AI library dependencies such as TensorFlow, PyTorch, and Langchain by scanning source code for Infrastructure as Code (IaC) misconfigurations and container images for vulnerabilities. Regularly updating or patching the libraries can prevent exploits, protecting generative AI applications and maintaining their integrity.

With these features, Defender for Cloud provides full visibility of AI workloads from code to cloud.

## Reduce risks to generative AI apps

Defender CSPM provides contextual insights into your organization's AI security posture. You can reduce risks within your AI workloads using security recommendations and attack path analysis.

### Explore risks using recommendations

Defender for Cloud assesses AI workloads. It issues recommendations on identity, data security, and internet exposure to identify and prioritize critical security issues.

#### Detect IaC misconfigurations

DevOps security detects IaC misconfigurations, which can expose generative AI applications to security vulnerabilities, such as over-exposed access controls or inadvertent publicly exposed services. These misconfigurations could lead to data breaches, unauthorized access, and compliance issues, especially when handling strict data privacy regulations.

Defender for Cloud assesses your generative AI apps configuration and provides security recommendations to improve AI security posture.

To prevent complex problems later, remediate detected misconfigurations early in the development cycle.

Current IaC AI security checks include:

- Use Azure AI Service Private Endpoints
- Restrict Azure AI Service Endpoints
- Use Managed Identity for Azure AI Service Accounts
- Use identity-based authentication for Azure AI Service Accounts

### Explore risks with attack path analysis

Attack path analysis detects and mitigates risks to AI workloads. Grounding AI models to specific data and fine-tuning a pretrained model on a specific dataset to improve its performance on a related task are stages where data might be exposed.

By monitoring AI workloads continuously, attack path analysis can identify weaknesses and potential vulnerabilities and follow up with recommendations. Additionally, it extends to cases where the data and compute resources are distributed across Azure, AWS, and GCP.

## Related content

- [Explore risks to predeployed generative AI artifacts](explore-ai-risk.md)
- [Review security recommendations](review-security-recommendations.md)
- [Identify and remediate attack paths](how-to-manage-attack-path.md)
- [Discover generative AI workloads](identify-ai-workload-model.md)
