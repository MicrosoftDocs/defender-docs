---
title: Overview - AI security posture management
description: Learn how AI security posture management in Microsoft Defender for Cloud discovers AI assets, prioritizes risk, and guides remediation across multicloud environments.
ms.date: 05/18/2026
ms.topic: concept-article
#customer intent: As a cloud security professional, I want to understand how to secure my generative AI resources using Defender for Cloud's AI security posture management capabilities.
---

# Overview - AI security posture management

The Defender Cloud Security Posture Management (CSPM) plan in Microsoft Defender for Cloud secures enterprise-built, multicloud, or hybrid cloud environments. These environments include Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP), including Vertex AI. The Defender CSPM plan secures generative AI applications and AI agents (Preview) throughout their entire lifecycle.

Defender for Cloud reduces risks to cross-cloud AI workloads by:

- Discovering the generative AI Bill of Materials (AI BOM), which includes application components, data, and AI artifacts from code to cloud.
- Strengthening generative AI application security posture with built-in recommendations and by exploring and remediating security risks.
- Using the attack path analysis to identify and remediate risks.
- Highlighting externally reachable AI endpoints so teams can enforce strong authentication and least privilege identities.

:::image type="content" source="media/ai-security-posture/ai-lifecycle.png" alt-text="Diagram of the development lifecycle that is covered by Defender for Cloud's AI security posture management.":::

> [!IMPORTANT]
> To enable AI security posture management capabilities on an AWS account that already:
>
> - Is connected to your Azure account.
> - Has Defender CSPM enabled.
> - Has permissions type set as **Least privilege access**.
>
> You must reconfigure the permissions on that connector to enable the relevant permissions by using these steps:
>
> 1. In the Azure portal, go to the Environment Settings page and select the appropriate AWS connector.
> 1. Select **Configure access**.
> 1. Ensure the permissions type is set to **Least privilege access**.
> 1. [Follow steps 7-11 in Connect your AWS account](quickstart-onboard-aws.md#connect-your-aws-account) to finish configuration.

## Discover generative AI apps

Defender for Cloud discovers AI workloads and identifies details of your organization's AI BOM. This visibility allows you to identify and address vulnerabilities and protect generative AI applications from potential threats.

Defender for Cloud automatically and continuously discovers deployed AI workloads across the following services:

- Azure OpenAI Service
- Azure AI Foundry
- Azure Machine Learning
- Amazon Bedrock
- Google Vertex AI

Defender for Cloud can also discover vulnerabilities within generative AI library dependencies such as TensorFlow, PyTorch, and Langchain by scanning source code for Infrastructure as Code (IaC) misconfigurations and container images for vulnerabilities. Regularly updating or patching the libraries can prevent exploits, protecting generative AI applications and maintaining their integrity.

With these features, Defender for Cloud provides full visibility of AI workloads from code to cloud.

## Discover AI agents (Preview)

Effective July 1, 2026, AI agent discovery and security posture for Microsoft Foundry agents and third-party cloud agents require a [Microsoft Agent 365](/microsoft-agent-365/overview) license. These capabilities were previously available through the Defender CSPM plan in Microsoft Defender for Cloud. Defender CSPM continues to discover Microsoft Foundry accounts and projects, but agent-level capabilities now require Agent 365. For more information on this transition, see [Transition AI agent security capabilities to Microsoft Agent 365](/defender-xdr/security-for-ai/transition-agent-security-to-agent-365).

The AI agent inventory is available in the Microsoft Defender portal and provides a centralized view of your agents along with their security status. For more information, see [Discover AI agents and assess security posture using the AI agent inventory in the Microsoft Defender portal](/defender-xdr/security-for-ai/ai-agent-inventory).

## Reduce risks to generative AI apps

Defender CSPM provides contextual insights into your organization's AI security posture. You can reduce risks within your AI workloads by using security recommendations and attack path analysis.

### Explore risks by using recommendations

Defender for Cloud assesses AI workloads. It issues recommendations on identity, data security, and internet exposure to help you identify and prioritize critical security issues.

For internet-exposed AI endpoints, prioritize recommendations that strengthen authentication and limit identity permissions to least privilege.

#### Detect IaC misconfigurations

DevOps security detects IaC misconfigurations, which can expose generative AI applications to security vulnerabilities, such as overexposed access controls or inadvertently publicly exposed services. These misconfigurations could lead to data breaches, unauthorized access, and compliance issues, especially when handling strict data privacy regulations.

When IaC changes create externally reachable AI services, use strong authentication and least privilege managed identities to reduce risk.

Defender for Cloud assesses your generative AI apps configuration and provides security recommendations to improve your AI security posture.

To prevent complex problems later, remediate detected misconfigurations early in the development cycle.

Current IaC AI security checks include:

- Use Azure AI Service Private Endpoints
- Restrict Azure AI Service Endpoints
- Use Managed Identity for Azure AI Service Accounts
- Use identity-based authentication for Azure AI Service Accounts

### Explore risks with attack path analysis

Attack path analysis detects and mitigates risks to AI workloads. Data might be exposed during the grounding of AI models to specific data and the fine-tuning of a pretrained model on a specific dataset to improve its performance on a related task.

If an AI endpoint is externally reachable, weak or missing authentication can increase attack path impact and make follow-on access easier.

By continuously monitoring AI workloads, attack path analysis can identify weaknesses and potential vulnerabilities and follow up with recommendations. Additionally, it extends to cases where the data and compute resources are distributed across Azure, AWS, and GCP.

## Related content

- [Explore risks to predeployed generative AI artifacts](explore-ai-risk.md)
- [Review security recommendations](review-security-recommendations.md)
- [Identify and remediate attack paths](how-to-manage-attack-path.md)
- [Discover generative AI workloads](identify-ai-workload-model.md)
