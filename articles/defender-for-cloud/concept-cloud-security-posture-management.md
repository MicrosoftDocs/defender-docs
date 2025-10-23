---
title: What is Cloud Security Posture Management (CSPM)
description: Learn more about Cloud Security Posture Management (CSPM) in Microsoft Defender for Cloud and how it helps improve your security posture.
ms.topic: concept-article
ms.date: 10/19/2025
#customer intent: As a reader, I want to understand the concept of Cloud Security Posture Management (CSPM) in Microsoft Defender for Cloud.
---

# What is Cloud Security Posture Management (CSPM)

Cloud Security Posture Management (CSPM) is a core feature of Microsoft Defender for Cloud. CSPM provides continuous visibility into the security state of your cloud assets and workloads, offering actionable guidance to improve your security posture across Azure, AWS, and GCP.

Defender for Cloud continually assesses your cloud infrastructure against security standards defined for your Azure subscriptions, Amazon Web Service (AWS) accounts, and Google Cloud Platform (GCP) projects. Defender for Cloud issues security recommendations to help you identify and reduce cloud misconfigurations and security risks.

By default, when you enable Defender for Cloud on an Azure subscription, the [Microsoft Cloud Security Benchmark (MCSB)](concept-regulatory-compliance.md) standard is enabled and provides recommendations to secure your multicloud environment. The [secure score](secure-score-security-controls.md) based on some of the MCSB recommendations helps you monitor cloud compliance. A higher score indicates a lower identified risk level.

## CSPM Plans

Defender for Cloud offers two CSPM plans:

- **Foundational CSPM** (free): Enabled by default for all onboarded subscriptions and accounts.
- **Defender CSPM** (paid): Adds advanced capabilities such as AI security posture, attack path analysis, risk prioritization, and more.

- **Defender CSPM** - A paid plan that provides extra capabilities beyond the foundational CSPM plan, including advanced CSPM tools for cloud visibility and compliance monitoring. This version of the plan offers more advanced security posture features such as AI security posture, attack path analysis, risk prioritization, and more.

| Feature | Foundational CSPM | Defender CSPM | Cloud Availability |
|--|--|--|--|
| Security recommendations | ✔️ | ✔️ | Azure, AWS, GCP, on-premises, Docker Hub, JFrog Artifactory |
| Asset inventory | ✔️ | ✔️ | Azure, AWS, GCP, on-premises, Docker Hub, JFrog Artifactory |
| Secure score | ✔️ | ✔️ | Azure, AWS, GCP, on-premises, Docker Hub, JFrog Artifactory |
| Data visualization (Azure Workbooks) | ✔️ | ✔️ | Azure, AWS, GCP, on-premises |
| Data exporting | ✔️ | ✔️ | Azure, AWS, GCP, on-premises |
| Workflow automation | ✔️ | ✔️ | Azure, AWS, GCP, on-premises |
| Remediation tools | ✔️ | ✔️ | Azure, AWS, GCP, on-premises, Docker Hub, JFrog Artifactory |
| Microsoft Cloud Security Benchmark | ✔️ | ✔️ | Azure, AWS, GCP |
| AI security posture management | – | ✔️ | Azure, AWS |
| Agentless VM vulnerability scanning | – | ✔️ | Azure, AWS, GCP |
| Agentless VM secrets scanning | – | ✔️ | Azure, AWS, GCP |
| Attack path analysis | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| Risk prioritization | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| Security explorer (risk hunting) | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| Code-to-cloud mapping (containers/IaC) | – | ✔️ | GitHub, Azure DevOps, Docker Hub, JFrog Artifactory |
| PR annotations | – | ✔️ | GitHub, Azure DevOps |
| Internet exposure analysis | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| External attack surface management | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| Regulatory compliance assessments | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| ServiceNow integration | – | ✔️ | Azure, AWS, GCP |
| Critical assets protection | – | ✔️ | Azure, AWS, GCP |
| Governance at scale | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| Data security posture management (DSPM) | – | ✔️ | Azure, AWS, GCP |
| Agentless discovery for Kubernetes | – | ✔️ | Azure, AWS, GCP |
| Custom recommendations | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| Agentless code-to-cloud containers vulnerability assessment | – | ✔️ | Azure, AWS, GCP, Docker Hub, JFrog Artifactory |
| API security posture management | – | ✔️ | Azure |
| AKS security dashboard | – | ✔️ | Azure |

## Plan availability

Defender CSPM is available across multiple deployment models and cloud environments:

- **Commercial clouds**: Available in all Azure commercial regions
- **Government clouds**: Available in Azure Government and Azure Government Secret
- **Multi-cloud**: Support for Azure, AWS, and GCP environments
- **Hybrid**: On-premises resources through Azure Arc
- **DevOps**: GitHub and Azure DevOps integration

For specific regional availability and government cloud support details, see the [support matrix for cloud environments](support-matrix-cloud-environment.md).

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

For commercial and national cloud coverage, see [Azure cloud environment support matrix](support-matrix-cloud-environment.md).

## Next Steps

- Watch [Cloud Security Posture Management with Microsoft Defender](https://www.youtube.com/watch?v=jF3NSR_OepI)
- Learn about [security standards and recommendations](security-policy-concept.md)
- Learn about [secure score](secure-score-security-controls.md)
