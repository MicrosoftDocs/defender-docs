---
title: Microsoft Defender for Cloud multicloud support matrix
description: Review Azure, AWS, and GCP support for Microsoft Defender for Cloud workload protection and security posture features to plan a multicloud deployment.
ms.topic: limits-and-quotas
ms.date: 08/10/2026
ms.author: elkrieger
author: Elazark
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
#customer intent: As a security professional, I want to understand which Defender for Cloud plans and features are supported in each cloud so that I can plan and manage multicloud protection.
---

# Multicloud workload protection support matrix for Microsoft Defender for Cloud

[!INCLUDE [21Vianet](./includes/21vianet-retirement.md)]

Compare Microsoft Defender for Cloud plan and feature support for Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP). Use the matrices to review workload protection coverage without checking each plan separately.

> [!NOTE]
> Some features are in preview. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include other legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

## Plan coverage at a glance for AWS and GCP

Use the following table to verify Defender for Cloud plan coverage in multicloud environments and review the primary capabilities of each plan. General availability (GA) indicates that a plan is released for production use. The table uses the abbreviations cloud security posture management (CSPM), endpoint detection and response (EDR), and continuous integration and continuous delivery (CI/CD).

|Defender for Cloud plan|AWS|GCP|Key plan features|Details|
|---|:---:|:---:|---|---|
|Defender for Servers (Plan 1 and Plan 2)|GA|GA|EDR integration, vulnerability scanning, malware scanning, and secrets scanning|[Defender for Servers support matrix](support-matrix-defender-for-servers.md)|
|Defender for Containers|GA|GA|Kubernetes threat detection, container vulnerability assessment, control plane hardening|[Containers support matrix](support-matrix-defender-for-containers.md)|
|Defender CSPM|GA|GA|Agentless posture assessment, attack path analysis, governance and risk prioritization|[Defender CSPM overview](concept-cloud-security-posture-management.md)|
|Defender for SQL Servers on Machines|GA|GA|SQL threat detection and vulnerability assessment on multicloud machines|[Defender for SQL Servers on Machines overview](defender-for-sql-servers-introduction.md)|
|Defender for Open-Source Relational Databases|Preview|Not supported|Threat detection for PostgreSQL, MySQL, and MariaDB in supported environments|[Overview of Defender for Open-Source Relational Databases](defender-for-databases-introduction.md)|
|Defender for Azure SQL Databases|Not supported|Not supported|Threat detection and vulnerability assessment for Azure SQL services|[Defender for SQL overview](defender-for-sql-introduction.md)|
|Defender for Azure Cosmos DB|Not supported|Not supported|Threat protection for Azure Cosmos DB workloads|[Defender for Azure Cosmos DB](concept-defender-for-cosmos.md)|
|Defender for DevOps|GA|GA|CI/CD security posture, code-to-cloud insights, pull request annotations|[Defender for DevOps overview](defender-for-devops-introduction.md)|
|Defender for Storage|Not supported|Not supported|Malware scanning and threat detection for Azure Storage|[Defender for Storage overview](defender-for-storage-introduction.md)|
|Defender for Key Vault|Not supported|Not supported|Threat detection for suspicious key and secret access patterns|[Defender for Key Vault overview](defender-for-key-vault-introduction.md)|
|Defender for Resource Manager|Not supported|Not supported|Detection of suspicious Azure Resource Manager operations|[Defender for Resource Manager overview](defender-for-resource-manager-introduction.md)|
|Defender for DNS|Not supported|Not supported|DNS-layer threat detection for Azure resources|[Defender for DNS overview](defender-for-dns-introduction.md)|
|Defender for App Service|Not supported|Not supported|Threat detection for web apps and APIs running in App Service|[Defender for App Service overview](defender-for-app-service-introduction.md)|
|Defender for APIs|Not supported|Not supported|API security posture and threat detection in Azure API Management|[Defender for APIs overview](defender-for-apis-introduction.md)|
|Defender for AI Services|Not supported|Not supported|Threat protection for generative AI services and applications|[AI threat protection](ai-threat-protection.md)|

> [!NOTE]
> **Defender for DevOps** protects CI/CD platforms (Azure DevOps, GitHub, GitLab) rather than specific cloud environments. Support is not cloud-specific.

## Plan availability by cloud

The following table provides a high-level view of Defender for Cloud plan availability for Azure, AWS, and GCP.

|Plan|Azure|AWS|GCP|
|---|:---:|:---:|:---:|
|[Defender for Servers (Plan 1 and Plan 2)](plan-defender-for-servers.md)|GA|GA|GA|
|[Defender for Containers](defender-for-containers-introduction.md)|GA|GA|GA|
|[Defender CSPM](concept-cloud-security-posture-management.md)|GA|GA|GA|
|[Defender for SQL Servers on Machines](defender-for-sql-introduction.md)|GA|GA|GA|
|[Defender for Open-Source Relational Databases](defender-for-databases-introduction.md)|GA|Preview|Not supported|
|[Defender for Azure SQL Databases](defender-for-sql-introduction.md)|GA|Not supported|Not supported|
|[Defender for Azure Cosmos DB](concept-defender-for-cosmos.md)|GA|Not supported|Not supported|
|[Defender for DevOps](defender-for-devops-introduction.md)|GA|GA|GA|
|[Defender for Storage](defender-for-storage-introduction.md)|GA|Not supported|Not supported|
|[Defender for Key Vault](defender-for-key-vault-introduction.md)|GA|Not supported|Not supported|
|[Defender for Resource Manager](defender-for-resource-manager-introduction.md)|GA|Not supported|Not supported|
|[Defender for DNS](defender-for-dns-introduction.md)|GA|Not supported|Not supported|
|[Defender for App Service](defender-for-app-service-introduction.md)|GA|Not supported|Not supported|
|[Defender for APIs](defender-for-apis-introduction.md)|GA|Not supported|Not supported|
|[Defender for AI Services](ai-threat-protection.md)|GA|Not supported|Not supported|

## Defender for Servers

Defender for Servers provides threat detection and advanced defenses for your machines in Azure, AWS, and GCP. For more information, see [Defender for Servers](plan-defender-for-servers.md).

> [!NOTE]
> AWS and GCP machines require [Azure Arc](/azure/azure-arc/servers/overview) for onboarding. Some features, such as file integrity monitoring, depend on the Azure Monitor Agent (AMA) deployed through Arc.

### Shared features (Plan 1 and Plan 2)

|Feature|Azure|AWS|GCP|
|---|:---:|:---:|:---:|
|[Defender for Endpoint automatic onboarding](integration-defender-for-endpoint.md)|Supported|Supported|Supported|
|[Defender for Endpoint EDR](integration-defender-for-endpoint.md)|Supported|Supported|Supported|
|[Integrated alerts and incidents](concept-integration-365.md)|Supported|Supported|Supported|
|[Regulatory compliance assessment](concept-regulatory-compliance-standards.md)|Supported|Supported|Supported|
|[Software inventory discovery](asset-inventory.md)|Supported|Supported|Supported|
|[Vulnerability scanning (agent-based)](auto-deploy-vulnerability-assessment.md)|Supported|Supported|Supported|

### Plan 2 features

|Feature|Azure|AWS|GCP|
|---|:---:|:---:|:---:|
|[Vulnerability scanning (agentless)](concept-agentless-data-collection.md)|Supported|Supported|Supported|
|[Agentless malware scanning](agentless-malware-scanning.md)|Supported|Supported|Supported|
|[Agentless machine secrets scanning](concept-agentless-data-collection.md)|Supported|Supported|Supported|
|[Defender for DNS alerts](defender-for-dns-introduction.md)|Supported|Supported|Supported|
|[Defender for Vulnerability Management premium](/defender-vulnerability-management/defender-vulnerability-management-capabilities)|Supported|Supported|Supported|
|[File integrity monitoring](file-integrity-monitoring-overview.md)|Supported|Supported with Azure Arc|Supported with Azure Arc|
|[Free data ingestion (500 MB)](data-ingestion-benefit.md)|Supported|Supported|Supported|
|[Just-in-time virtual machine access](just-in-time-access-overview.md)|Supported|Supported|Not supported|
|[Network map](protect-network-resources.md)|Supported|Not supported|Not supported|
|[OS system updates](enable-periodic-system-updates.md)|Supported|Supported with Azure Arc|Supported with Azure Arc|
|[Threat detection (Azure network layer)](alerts-azure-network-layer.md)|Supported|Not supported|Not supported|

For detailed operating system, machine type, and feature-level support, see [Defender for Servers support matrix](support-matrix-defender-for-servers.md).

## Defender for Containers

Defender for Containers protects Kubernetes clusters and container workloads. It supports Azure Kubernetes Service (AKS), Amazon Elastic Kubernetes Service (EKS), and Google Kubernetes Engine (GKE). Learn more about [Defender for Containers](defender-for-containers-introduction.md).

|Feature|Azure (AKS)|AWS (EKS)|GCP (GKE)|
|---|:---:|:---:|:---:|
|Container registry vulnerability assessment|GA|GA|GA|
|Runtime container vulnerability assessment (registry scan-based)|GA|GA|GA|
|Control plane threat detection|GA|GA|GA|
|Workload threat detection|GA|GA|GA|
|Binary drift detection|GA|GA|GA|
|Binary drift blocking|Preview|Preview|Preview|
|Anti-malware|GA|GA|GA|
|Agentless discovery for Kubernetes|GA|GA|GA|
|Attack path analysis|GA|GA|GA|
|Control plane hardening|GA|GA|GA|
|Workload hardening|GA|GA|GA|

> [!NOTE]
> Workload hardening on AWS and GCP requires the Azure Policy extension for Azure Arc-enabled Kubernetes.

> [!NOTE]
> Container registry vulnerability assessment supports Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), Google Artifact Registry (GAR), Google Container Registry (GCR), Docker Hub, and JFrog Artifactory in all clouds.

For detailed support information, see [Containers support matrix](support-matrix-defender-for-containers.md).

## Defender CSPM

Defender CSPM provides cloud security posture management capabilities. Foundational CSPM is available for free in all supported clouds. The paid Defender CSPM plan provides advanced features. For more information, see [Defender CSPM](concept-cloud-security-posture-management.md).

### Foundational CSPM (free) features

|Feature|Azure|AWS|GCP|More availability|
|---|:---:|:---:|:---:|---|
|[Asset inventory](asset-inventory.md)|Supported|Supported|Supported|On-premises, Docker Hub, JFrog Artifactory|
|[Data exporting](export-to-siem.md)|Supported|Supported|Supported|On-premises|
|Data visualization and reporting with Azure Workbooks|Supported|Supported|Supported|On-premises|
|[Microsoft Cloud Security Benchmark](concept-regulatory-compliance.md)|Supported|Supported|Supported|Not applicable|
|[Secure score](secure-score-security-controls.md)|Supported|Supported|Supported|On-premises, Docker Hub, JFrog Artifactory|
|[Security recommendations](review-security-recommendations.md)|Supported|Supported|Supported|On-premises, Docker Hub, JFrog Artifactory|
|Tools for remediation|Supported|Supported|Supported|On-premises, Docker Hub, JFrog Artifactory|
|[Workflow automation](workflow-automations.md)|Supported|Supported|Supported|On-premises|

### Paid plan features

|Feature|Azure|AWS|GCP|More availability|
|---|:---:|:---:|:---:|---|
|[Agentless code-to-cloud containers vulnerability assessment](agentless-vulnerability-assessment-azure.md)|Supported|Supported|Supported|Not applicable|
|[Agentless discovery for Kubernetes](concept-agentless-containers.md)|Supported|Supported|Supported|Not applicable|
|[Agentless VM secrets scanning](secrets-scanning-servers.md)|Supported|Supported|Supported|Not applicable|
|[Agentless VM vulnerability scanning](enable-agentless-scanning-vms.md)|Supported|Supported|Supported|Not applicable|
|[AI security posture management](ai-security-posture.md)|Supported|Supported|Not supported|Not applicable|
|[API security posture management](api-security-posture-overview.md)|Supported|Not supported|Not supported|Not applicable|
|[Attack path analysis](how-to-manage-attack-path.md)|Supported|Supported|Supported|Docker Hub, JFrog Artifactory|
|[Azure Kubernetes Service security dashboard (Preview)](cluster-security-dashboard.md)|Supported|Not supported|Not supported|Not applicable|
|[Code-to-cloud mapping for containers](container-image-mapping.md)|Not supported|Not supported|Not supported|GitHub, Azure DevOps, Docker Hub, JFrog Artifactory|
|[Code-to-cloud mapping for infrastructure as code (IaC)](iac-template-mapping.md)|Not supported|Not supported|Not supported|Azure DevOps, Docker Hub, JFrog Artifactory|
|[Critical assets protection](critical-assets-protection.md)|Supported|Supported|Supported|Not applicable|
|[Custom recommendations](create-custom-recommendations.md)|Supported|Supported|Supported|Not applicable|
|[Data security posture management (DSPM)](concept-data-security-posture.md)|Supported|Supported|Supported|Not applicable|
|[External attack surface management](concept-easm.md)|Supported|Supported|Supported|Not applicable|
|[Governance to drive remediation at scale](governance-rules.md)|Supported|Supported|Supported|Not applicable|
|[Internet exposure analysis](internet-exposure-analysis.md)|Supported|Supported|Supported|Not applicable|
|[Pull request annotations](review-pull-request-annotations.md)|Not supported|Not supported|Not supported|GitHub, Azure DevOps|
|[Regulatory compliance assessments](concept-regulatory-compliance-standards.md)|Supported|Supported|Supported|Not applicable|
|[Risk hunting with security explorer](how-to-manage-cloud-security-explorer.md)|Supported|Supported|Supported|Docker Hub, JFrog Artifactory|
|[Risk prioritization](risk-prioritization.md)|Supported|Supported|Supported|Docker Hub, JFrog Artifactory|
|[Serverless protection](serverless-protection.md)|Supported|Supported|Not supported|Not applicable|
|[ServiceNow integration](integration-servicenow.md)|Supported|Supported|Supported|Not applicable|

For detailed support information, see [Defender CSPM support](concept-cloud-security-posture-management.md).

## Defender for Databases

Defender for Databases provides threat detection for database services. Multicloud coverage varies by database type. For more information, see [Defender for Databases](defender-for-databases-introduction.md).

|Sub-plan|Azure|AWS|GCP|
|---|:---:|:---:|:---:|
|Defender for Azure SQL Databases|GA|Not supported|Not supported|
|Defender for SQL Servers on Machines|GA|GA|GA|
|Defender for Open-Source Relational Databases|GA|Preview|Not supported|
|Defender for Azure Cosmos DB|GA|Not supported|Not supported|

> [!NOTE]
> Defender for SQL Servers on Machines protects SQL Server instances running on Azure VMs, AWS EC2 instances (via Arc), and GCP Compute Engine instances (via Arc).

For detailed support information, see [Defender for SQL overview](defender-for-sql-introduction.md).

## Defender for DevOps

Defender for DevOps connects to your continuous integration and continuous delivery (CI/CD) platforms and provides security insights for your development pipelines. For more information, see [Defender for DevOps](defender-for-devops-introduction.md).

- **Azure DevOps**: GA.
- **GitHub**: GA.
- **GitLab**: GA.

## Defender for APIs

Defender for APIs protects APIs published in Azure API Management. It provides threat detection and security posture insights. For more information, see [Defender for APIs](defender-for-apis-introduction.md).

> [!NOTE]
> Defender for APIs is available on Azure only. AWS and GCP environments are not supported.

|Feature|Azure|AWS|GCP|
|---|:---:|:---:|:---:|
|[API data classification](defender-for-apis-introduction.md)|Supported|Not supported|Not supported|
|[Azure API Management integration](defender-for-apis-introduction.md)|Supported|Not supported|Not supported|
|[Defender CSPM integration](defender-for-apis-introduction.md)<sup>[2](#footnote2)</sup>|Supported|Not supported|Not supported|
|[Inventory](defender-for-apis-introduction.md)|Supported|Not supported|Not supported|
|[Security findings](defender-for-apis-introduction.md)|Supported|Not supported|Not supported|
|[Security posture](defender-for-apis-introduction.md)|Supported|Not supported|Not supported|
|[Security information and event management (SIEM) integrations](defender-for-apis-introduction.md)|Supported|Not supported|Not supported|
|[Threat detection (machine learning-based)](defender-for-apis-introduction.md)|Supported|Not supported|Not supported|

<sup><a name="footnote2"></a>2</sup> Requires the Defender CSPM plan and gives access to the cloud security graph.

For detailed support information, see [Defender for APIs overview](defender-for-apis-introduction.md).

## Azure-only plans

The following Defender for Cloud plans are available on Azure only and don't currently support AWS or GCP workloads.

|Plan|Azure|AWS|GCP|
|---|:---:|:---:|:---:|
|[Defender for Storage](defender-for-storage-introduction.md)|GA|Not supported|Not supported|
|[Defender for Key Vault](defender-for-key-vault-introduction.md)|GA|Not supported|Not supported|
|[Defender for Resource Manager](defender-for-resource-manager-introduction.md)|GA|Not supported|Not supported|
|[Defender for DNS](defender-for-dns-introduction.md)|GA|Not supported|Not supported|
|[Defender for App Service](defender-for-app-service-introduction.md)|GA|Not supported|Not supported|
|[Defender for APIs](defender-for-apis-introduction.md)|GA|Not supported|Not supported|
|[Defender for AI Services](ai-threat-protection.md)|GA|Not supported|Not supported|

## Related content

- [What is Microsoft Defender for Cloud?](defender-for-cloud-introduction.md)
- [Connect your AWS accounts](quickstart-onboard-aws.md)
- [Connect your GCP projects](quickstart-onboard-gcp.md)
- [Defender for Servers support matrix](support-matrix-defender-for-servers.md)
- [Containers support matrix](support-matrix-defender-for-containers.md)
- [Defender CSPM overview](concept-cloud-security-posture-management.md)
- [Defender for Databases overview](defender-for-databases-introduction.md)
