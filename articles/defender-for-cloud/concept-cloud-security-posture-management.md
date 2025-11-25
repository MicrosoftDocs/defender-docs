---
title: What is Cloud Security Posture Management (CSPM)
description: Learn more about Cloud Security Posture Management (CSPM) in Microsoft Defender for Cloud and how it helps improve your security posture.
ms.topic: concept-article
ms.date: 11/25/2025
#customer intent: As a reader, I want to understand the concept of Cloud Security Posture Management (CSPM) in Microsoft Defender for Cloud.
---

# What is Cloud Security Posture Management (CSPM)

Cloud Security Posture Management (CSPM) is a core feature of Microsoft Defender for Cloud. CSPM provides continuous visibility into the security state of your cloud assets and workloads, offering actionable guidance to improve your security posture across Azure, AWS, and GCP.

Defender for Cloud continually assesses your cloud infrastructure against security standards defined for your Azure subscriptions, Amazon Web Service (AWS) accounts, and Google Cloud Platform (GCP) projects. Defender for Cloud issues security recommendations to help you identify and reduce cloud misconfigurations and security risks.

By default, when you enable Defender for Cloud on an Azure subscription, the [Microsoft Cloud Security Benchmark (MCSB)](concept-regulatory-compliance.md) standard is enabled and provides recommendations to secure your multicloud environment. The [secure score](secure-score-security-controls.md) based on some of the MCSB recommendations helps you monitor cloud compliance. A higher score indicates a lower identified risk level.

## CSPM Plans

Defender for Cloud offers two CSPM plans:

- **Foundational CSPM** (free): Enabled by default for all onboarded subscriptions and accounts.
- **Defender CSPM** (paid): Provides extra capabilities beyond the foundational CSPM plan, including advanced CSPM tools for cloud visibility and compliance monitoring. This version of the plan offers more advanced security posture features such as AI security posture, attack path analysis, risk prioritization, and more.

## Plan availability

Defender CSPM is available across multiple deployment models and cloud environments:

- **Commercial clouds**: Available in all Azure commercial regions
- **Government clouds**: Available in Azure Government and Azure Government Secret
- **Multi-cloud**: Support for Azure, AWS, and GCP environments
- **Hybrid**: On-premises resources through Azure Arc
- **DevOps**: GitHub and Azure DevOps integration

For specific regional availability and government cloud support details, see the [support matrix for cloud environments](support-matrix-defender-for-cloud.md).

| Feature | Foundational CSPM | Defender CSPM | Cloud availability |
|--|--|--|--|
| [Asset inventory](asset-inventory.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, on-premises, Docker Hub, JFrog Artifactory |
| [Data exporting](export-to-siem.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, on-premises |
| Data visualization and reporting with Azure Workbooks | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, on-premises |
| [Microsoft Cloud Security Benchmark](concept-regulatory-compliance.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP |
| [Secure score](secure-score-security-controls.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, on-premises , Docker Hub, JFrog Artifactory |
| [Security recommendations](review-security-recommendations.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png":::| Azure, AWS, GCP, on-premises , Docker Hub, JFrog Artifactory|
| Tools for remediation | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, on-premises, Docker Hub, JFrog Artifactory |
| [Workflow automation](workflow-automations.md) | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, on-premises |
| [Agentless code-to-cloud containers vulnerability assessment](agentless-vulnerability-assessment-azure.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| [Agentless discovery for Kubernetes](concept-agentless-containers.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP |
| [Agentless VM secrets scanning](secrets-scanning-servers.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP |
| [Agentless VM vulnerability scanning](enable-agentless-scanning-vms.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP |
| [AI security posture management](ai-security-posture.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS |
| [API security posture management](api-security-posture-overview.md)| - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure |
| [Attack path analysis](how-to-manage-attack-path.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| [Azure Kubernetes Service security dashboard (Preview)](cluster-security-dashboard.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure |
| [Code-to-cloud mapping for containers](container-image-mapping.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | GitHub, Azure DevOps<sup>[2](#footnote1)</sup> , Docker Hub, JFrog Artifactory|
| [Code-to-cloud mapping for IaC](iac-template-mapping.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure DevOps<sup>[2](#footnote1)</sup>, , Docker Hub, JFrog Artifactory |
| [Critical assets protection](critical-assets-protection.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP |
|[Custom Recommendations](create-custom-recommendations.md)|-|:::image type="icon" source="./media/icons/yes-icon.png":::|Azure, AWS, GCP, Docker Hub, JFrog Artifactory|
| [Data security posture management (DSPM), Sensitive data scanning](concept-data-security-posture.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP<sup>[1](#footnote1)</sup> |
| [External attack surface management](concept-easm.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| [Governance to drive remediation at-scale](governance-rules.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP , Docker Hub, JFrog Artifactory|
| [Internet exposure analysis](internet-exposure-analysis.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| [PR annotations](review-pull-request-annotations.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | GitHub, Azure DevOps<sup>[2](#footnote1)</sup> |
| [Regulatory compliance assessments](concept-regulatory-compliance-standards.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, , Docker Hub, JFrog Artifactory |
| [Risk hunting with security explorer](how-to-manage-cloud-security-explorer.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP , Docker Hub, JFrog Artifactory |
| [Risk prioritization](risk-prioritization.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP , Docker Hub, JFrog Artifactory |
| [ServiceNow Integration](integration-servicenow.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP |
| [Serverless protection](serverless-protection.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS |
| [Agentless code-to-cloud containers vulnerability assessment](agentless-vulnerability-assessment-azure.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| [API security posture management](api-security-posture-overview.md)| - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure |
| [Azure Kubernetes Service security dashboard (Preview)](cluster-security-dashboard.md) | - | :::image type="icon" source="./media/icons/yes-icon.png"::: | Azure |

<sup><a name="footnote1"></a>1</sup>: GCP sensitive data discovery [only supports Cloud Storage](concept-data-security-posture-prepare.md#whats-supported). 
<sup><a name="footnote1"></a>2</sup>: DevOps security capabilities, such as code-to-cloud contextualization powering security explorer, attack paths, and pull request annotations for Infrastructure-as-Code security findings, are only available when you enable the paid Defender CSPM plan. Learn more about DevOps security [support and prerequisites](devops-support.md).

For specific regional availability and government cloud support details, see the [support matrix for cloud environments](support-matrix-defender-for-cloud.md).

## Plan Pricing

- See [Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/) and use the [cost calculator](cost-calculator.md) to estimate costs.
- Advanced DevOps security posture features (pull request annotations, code-to-cloud mapping, attack path analysis, security explorer) require the paid Defender CSPM plan. The free plan provides basic Azure DevOps recommendations. See [DevOps security features](devops-support.md#azure-devops).
- Defender CSPM billing is based on specific resources. See the pricing page for details on billable resources for Azure, AWS, and GCP.

## Integrations

Defender for Cloud supports integrations with partner systems for incident management and ticketing. Currently, ServiceNow integration is available (preview). For setup, see [Integrate ServiceNow with Microsoft Defender for Cloud](integration-servicenow.md).

## Supported Clouds and Resources

- DevOps security posture capabilities such as pull request annotations, code to cloud mapping, attack path analysis, and cloud security explorer are only available through the paid Defender CSPM plan. The free foundational security posture management plan provides Azure DevOps recommendations. Learn more about the features provided by [Azure DevOps security features](devops-support.md#azure-devops).

### Azure

- Defender CSPM protects all multicloud workloads, but billing applies only on specific resources. The following tables list the billable resources when you enable Defender CSPM on Azure subscriptions, AWS accounts, or GCP projects.

### AWS

| Service | Resource Types | Exclusions |
|---|---|---|
| Compute | EC2 instances | Deallocated VMs |
| Storage | S3 buckets | – |
| Databases | RDS instances | – |

### GCP

| Service | Resource Types | Exclusions |
|---|---|---|
| Compute | Compute instances, Instance Groups | Nonrunning instances |
| Storage | Storage buckets | Nearline/coldline/archive classes, unsupported regions |
| Databases | Cloud SQL instances | – |

## Azure Cloud Support

For commercial and national cloud coverage, see [Azure cloud environment support matrix](support-matrix-defender-for-cloud.md).

## Next Steps

- Watch [Cloud Security Posture Management with Microsoft Defender](https://www.youtube.com/watch?v=jF3NSR_OepI)
- Learn about [security standards and recommendations](security-policy-concept.md)
- Learn about [secure score](secure-score-security-controls.md)
