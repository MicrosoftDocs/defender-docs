---
title: Reference table for all AI security recommendations in Microsoft Defender for Cloud
description: This article lists all Microsoft Defender for Cloud AI security recommendations that help you harden and protect your resources.
author: dcurwin
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 07/30/2024
ms.author: dacurwin
ms.custom: generated
ai-usage: ai-assisted
---

# AI security recommendations

This article lists all the AI security recommendations you might see in Microsoft Defender for Cloud.

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

To learn about actions that you can take in response to these recommendations, see [Remediate recommendations in Defender for Cloud](implement-security-recommendations.md).


## Azure recommendations

### Microsoft Entra ID should be used when connecting Azure AI Foundry to default storage account.

**Description:** Defender for Cloud identified Credential-based access when connecting to the default storage account in Azure AI Foundry. This poses a risk of unauthorized access. To reduce the risk of unauthorized access, you should disable key-based authorization, and instead use Microsoft Entra ID.

**Severity**: High

### Microsoft Entra ID should be used when connecting to data stores on Azure AI Foundry project.

**Description:** Defender for Cloud identified Credential-based access when connecting to the storage account in Azure AI Foundry project. This poses a risk of unauthorized access. To reduce the risk of unauthorized access, you should disable key-based authorization, and instead use Microsoft Entra ID.

**Severity**: High

### Application Insights should be used on Azure AI Foundry.

**Description:** Defender for Cloud identified that Application insights is not configured in Azure AI Foundry. The AI Foundry uses Azure Application Insights to store monitoring information about your deployed models. This poses a risk of delayed threat detection and ineffective incident response.

**Severity**: Medium

### Network connections should be limited on Azure AI Foundry.

**Description:** Defender for Cloud identified public network access enabled for all networks in Azure AI Foundry. This poses a risk of exposure to external threats and can result in unauthorized access and data breaches. By restricting network access, you can ensure that only allowed networks can access the service.

**Severity**: Medium

### (Enable if required) Customer-managed keys should be used to encrypt data on Azure AI Foundry.

**Description:** Defender for Cloud identified that Microsoft-managed keys are used to encrypt data in Azure AI Foundry. This poses a risk of not complying with regulations for organizations with related compliance requirements. Using customer-managed keys (CMK) to encrypt data at rest provides more control over the key lifecycle, including rotation and management, and is often required to meet compliance standards. This is not assessed by default and should only be applied when required by compliance or restrictive policy requirements. If not enabled, the data will be encrypted using Microsoft-managed keys. To implement this recommendation, update the 'Effect' parameter in the Security Policy for the applicable scope.

**Severity**: Medium

### Azure AI Services resources should have key access disabled (disable local authentication).

**Description**: Key access (local authentication) is recommended to be disabled for security. Azure OpenAI Studio, typically used in development/testing, requires key access, and will not function if key access is disabled. After the setting is disabled, Microsoft Entra ID becomes the only access method, which allows maintaining minimum privilege principle and granular control. [Learn more](/azure/ai-services/authentication).

This recommendation replaces the old recommendation *Cognitive Services accounts should have local authentication methods disabled*. It was formerly in the category Cognitive Services and Cognitive Search and was updated to comply with the Azure AI Services naming format and align with the relevant resources. 

**Severity**: Medium

### Azure AI Services resources should restrict network access.

**Description**: By restricting network access, you can ensure that only allowed networks can access the service. This can be achieved by configuring network rules so that only applications from allowed networks can access the Azure AI service resource.

This recommendation replaces the old recommendation *Cognitive Services accounts should restrict network access*. It was formerly in category Cognitive Services and Cognitive Search, and was updated to comply with the Azure AI Services naming format and align with the relevant resources.

**Severity**: Medium


### Azure AI Services resources should use Azure Private Link.

**Description**: Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The Private Link platform reduces data leakage risks by handling the connectivity between the consumer and services over the Azure backbone network.

Learn more about private links at: [What is Azure Private Link?](/azure/private-link/private-link-overview)

This recommendation replaces the old recommendation *Cognitive Services should use private link*. It was formerly in category Data recommendations, and was updated to comply with the Azure AI Services naming format and align with the relevant resources.

**Severity**: Medium


### (Enable if required) Azure AI Services resources should encrypt data at rest with a customer-managed key (CMK).

**Description**: Using customer-managed keys to encrypt data at rest provides more control over the key lifecycle, including rotation and management. This is particularly relevant for organizations with related compliance requirements.

This is not assessed by default and should only be applied when required by compliance or restrictive policy requirements. If not enabled, the data will be encrypted using platform-managed keys. To implement this, update the 'Effect' parameter in the Security Policy for the applicable scope. (Related policy: [Azure AI Services resources should encrypt data at rest with a customer-managed key (CMK)](/azure/ai-services/openai/how-to/use-your-data-securely))

This recommendation replaces the old recommendation *Cognitive services accounts should enable data encryption using customer keys*. It was formerly in category Data recommendations, and was updated to comply with the Azure AI Services naming format and align with the relevant resources. 

**Severity**: Low

### Diagnostic logs in Azure AI services resources should be enabled.

**Description**: Enable logs for Azure AI services resources. This enables you to recreate activity trails for investigation purposes, when a security incident occurs or your network is compromised. 

This recommendation replaces the old recommendation *Diagnostic logs in Search services should be enabled*. It was formerly in the category Cognitive Services and Cognitive Search, and was updated to comply with the Azure AI Services naming format and align with the relevant resources. 

**Severity**: Low

### Resource logs in Azure Machine Learning Workspaces should be enabled (Preview).

**Description & related policy**: Resource logs enable recreating activity trails to use for investigation purposes when a security incident occurs or when your network is compromised.

**Severity**: Medium

### Azure Machine Learning Workspaces should disable public network access (Preview).

**Description & related policy**: Disabling public network access improves security by ensuring that the Machine Learning Workspaces aren't exposed on the public internet. You can control exposure of your workspaces by creating private endpoints instead. For more information, see [Configure a private endpoint for an Azure Machine Learning workspace](/azure/machine-learning/how-to-configure-private-link).

**Severity**: Medium

### Azure Machine Learning Computes should be in a virtual network (Preview).

**Description & related policy**: Azure Virtual Networks provide enhanced security and isolation for your Azure Machine Learning Compute Clusters and Instances, as well as subnets, access control policies, and other features to further restrict access. When a compute is configured with a virtual network, it is not publicly addressable and can only be accessed from virtual machines and applications within the virtual network.

**Severity**: Medium

### Azure Machine Learning Computes should have local authentication methods disabled (Preview).

**Description & related policy**: Disabling local authentication methods improves security by ensuring that Machine Learning Computes require Azure Active Directory identities exclusively for authentication. For more information, see [Azure Policy Regulatory Compliance controls for Azure Machine Learning](/azure/machine-learning/security-controls-policy).

**Severity**: Medium

### Azure Machine Learning compute instances should be recreated to get the latest software updates (Preview).

**Description & related policy**: Ensure Azure Machine Learning compute instances run on the latest available operating system. Security is improved and vulnerabilities reduced by running with the latest security patches. For more information, see [Vulnerability management for Azure Machine Learning](/azure/machine-learning/concept-vulnerability-management#compute-instance).

**Severity**: Medium

### Resource logs in Azure Databricks Workspaces should be enabled (Preview).

**Description & related policy**: Resource logs enable recreating activity trails to use for investigation purposes when a security incident occurs or when your network is compromised.

**Severity**: Medium

### Azure Databricks Workspaces should disable public network access (Preview).

**Description & related policy**: Disabling public network access improves security by ensuring that the resource isn't exposed on the public internet. You can control exposure of your resources by creating private endpoints instead. For more information, see [Enable Azure Private Link](/azure/databricks/administration-guide/cloud-configurations/azure/private-link).

**Severity**: Medium

### Azure Databricks Clusters should disable public IP (Preview).

**Description & related policy**: Disabling public IP of clusters in Azure Databricks Workspaces improves security by ensuring that the clusters aren't exposed on the public internet. For more information, see [Secure cluster connectivity](/azure/databricks/security/network/secure-cluster-connectivity).

**Severity**: Medium

### Azure Databricks Workspaces should be in a virtual network (Preview).

**Description & related policy**: Azure Virtual Networks provide enhanced security and isolation for your Azure Databricks Workspaces, as well as subnets, access control policies, and other features to further restrict access. For more information, see [Deploy Azure Databricks in your Azure virtual network](/azure/databricks/administration-guide/cloud-configurations/azure/vnet-inject).

**Severity**: Medium

### Azure Databricks Workspaces should use private link (Preview).

**Description & related policy**: Azure Private Link lets you connect your virtual networks to Azure services without a public IP address at the source or destination. The Private Link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to Azure Databricks workspaces, you can reduce data leakage risks. For more information, see [Create the workspace and private endpoints in the Azure portal UI](/azure/databricks/administration-guide/cloud-configurations/azure/private-link-standard#create-the-workspace-and-private-endpoints-in-the-azure-portal-ui).

**Severity**: Medium

## AWS AI recommendations

### AWS Bedrock should use AWS PrivateLink.

**Description** Amazon Bedrock VPC endpoint powered by AWS PrivateLink, allows you to establish a private connection between the VPC in your account and the Amazon Bedrock service account. AWS PrivateLink enables VPC instances to communicate with Bedrock service resources, without the need for public IP addresses, ensuring your data is not exposed to the public internet and thereby helping with your compliance requirements.

**Severity** Medium

### AWS Bedrock agents should use guardrails when allowing access to generative AI applications.

**Description** Guardrails for Amazon Bedrock enhance the safety of generative AI applications by evaluating both user inputs and model-generated responses. These guardrails include content filters, which help detect and filter harmful content. Specifically, the "Prompt Attacks" category that includes safeguards on user prompts to prevent jailbreaks and prompt injections.

**Severity** Medium

### AWS Bedrock should have model invocation logging enabled.

**Description:** With invocation logging, you can collect the full request data, response data, and metadata associated with all calls performed in your account. This enables you to recreate activity trails for investigation purposes when a security incident occurs.

**Severity:** Low

## GCP AI recommendations

### A Private Service endpoint should be used for Vertex AI Online endpoints.

**Description:** Defender for Cloud has identified that a Private Service endpoint is not configured on Vertex AI Online endpoints. Private endpoint connections enforce secure communication by enabling private connectivity to the Online prediction's endpoint. Configure a private endpoint connection to enable access to traffic coming only from known networks and prevent access from all other IP addresses.

**Severity** Medium

### Root access should be disabled on Workbench instances.

**Description:** Defender for Cloud has identified that root access is not disabled on the GCP Workbench instance. To reduce the risk of accidental or malicious system damage, it is essential to disable root access on your Google Cloud Vertex AI notebook instances. This measure limits administrative privileges within the instances, ensuring a more secure environment.

**Severity** Medium

### Public IP addresses should be disabled on Workbench instances.

**Description:** Defender for Cloud has identified that external IP addresses have been configured on the GCP Workbench instance. To reduce your attack surface, Workbench instances shouldn't have public IP addresses. Instead, instances should be configured behind load balancers to minimize the instance's exposure to the internet

**Severity** Medium

### (Enable if required) Customer-managed keys should be used to encrypt data at rest in Vertex AI DataSets.

**Description:** Defender for Cloud has identified that customer-managed keys are not being used on Vertex AI DataSets. Using customer-managed keys to encrypt data at rest provides more control over the key lifecycle, including rotation and management. This is particularly relevant for organizations with related compliance requirements. By using customer-managed keys, you can ensure that your data is encrypted with keys that you control, giving you the ability to manage and rotate these keys as needed. This added control can help meet compliance requirements and enhance the security of your data.

**Severity** Medium

### Cloud Monitoring should be used on GCP Workbench instance.

**Description** Defender for Cloud has identified that Cloud Monitoring is not enabled on the GCP Workbench instance. Enabling Cloud Monitoring for Google Cloud Vertex AI notebook instances is essential for tracking performance metrics, detecting issues early, and ensuring optimal operation through proactive monitoring and alerts.

**Severity** Low

### Idle shutdown should be enabled on Workbench instances.

**Description** Defender for Cloud has identified that idle shutdown is not configured on the GCP Workbench instance. To optimize costs and enhance security, ensure that the Idle Shutdown feature is enabled for your Google Cloud Vertex AI notebook instances.

**Severity** Low

## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)
