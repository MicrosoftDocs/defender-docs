---
title: What's new in Microsoft Defender for Cloud features
description: What's new and updated in Microsoft Defender for Cloud features
ms.topic: overview
ms.date: 10/19/2025
---

# What's new in Defender for Cloud features

This article summarizes what's new in Microsoft Defender for Cloud. It includes information about new features in preview or in general availability (GA), feature updates, upcoming feature plans, and deprecated functionality.

<!-- Please don't adjust this next line without getting approval from the Defender for Cloud documentation team. It is necessary for proper RSS functionality. -->
- This page is updated frequently with the latest updates in Defender for Cloud.

- Find the latest information about security recommendations and alerts in [What's new in recommendations and alerts](release-notes-recommendations-alerts.md).
- If you're looking for items older than six months, you can find them in the [What's new archive](release-notes-archive.md).

> [!TIP]
> Get notified when this page is updated by copying and pasting the following URL into your feed reader:
>
> `https://aka.ms/mdc/rss`

<!-- 1. The docs team update this article at the beginning of each month. For example, on August 1 2024 we'll add all the features that were new, updated, and deleted in July 2024.-->
<!-- 2. If you want to add an item in the middle of the month, go ahead and do that. You should add the item and sign off on the PR. We'll check your entry at the beginning of the next month.-->
<!-- 3. In Date, specify the date you added the entry.-->
<!-- 4. In Category, specify whether the item is GA, Preview, Update, Deprecation, Upcoming update, Upcoming deprecation.-->
<!-- 5. Under the relevant month, add a short paragraph about the new feature. Give the paragraph an H3 (###) heading. Keep the title short and not rambling. -->
<!-- 6. In the Update column, add a bookmark to the H3 paragraph that you created (#<bookmark-name>) .-->

## November 2025

| Date | Category | Update |
|------|---------|-------|
| November 18, 2025 | Public preview | [Defender for Cloud integration into the Defender portal](#defender-for-cloud-integration-into-the-defender-portal-preview)|
| November 3, 2025 | GA | [Additional compliance frameworks now generally available](#general-availability-of-compliance-frameworks) |

### Defender for Cloud integration into the Defender portal (preview)

November 18, 2025

Microsoft Defender for Cloud (MDC) is now deeply integrated into the Defender portal and part of the boarder Microsoft Security eco-system. With threat protection already deeply embedded into the Defender portal, this integration adds posture management—bringing together a complete cloud security solution in one unified experience. This native-integration eliminates silos so security teams can see and act on threats across all cloud, hybrid, and code environments - all from one place. 

This integration brings new values and benefits for security personas:

**Unified cloud security experience** – Cloud security is now fully integrated into the Microsoft Defender portal at security.microsoft.com, giving security teams a single, unified view across all workloads. This eliminates the need to switch between tools and portals, enabling SOC teams to work more efficiently with complete security posture visibility across workloads. The new cloud-agnostic integration supports Azure, AWS, GCP, and other platforms in a single interface, making it ideal for hybrid and multicloud organizations seeking comprehensive exposure management too. For more information, see [Getting started in the Defender portal](defender-portal/getting-started-defender-portal.md).

**Cloud dashboard** - This new cloud security dashboard centralizes both posture management and threat protection, giving security personas an overview of their environment. It also highlights the top improvement actions for risk reduction, workload-specific views with security insights and includes tools to track security progress over time out of the box. New unified dashboard consolidates Security Posture, Defender coverage, cloud assets, health data, and exposure insights across Azure, AWS, and GCP environments. For more information, see [Cloud Infrastructure Dashboard](cloud-infrastructure-dashboard.md).

**Cloud asset inventory** – A new centralized inventory offers a comprehensive view of cloud and code assets across Azure, AWS, and GCP. Assets are categorized by workload, criticality, and coverage, with integrated health data, device actions, and risk signals. Information security and SOC teams can easily access resource-specific views, exposure map, and metadata to address security recommendations and respond quickly to threats. For more information, see [Asset inventory](asset-inventory.md?pivots=defender-portal).

**Unified cloud security posture capabilities** – We're unifying all the cloud security posture management (CSPM) capabilities into Microsoft Security Exposure Management (MSEM). Security personas can now view secure scores, prioritized recommendations, attack paths and vulnerabilities—all in a single pane of glass, empowering them to reduce risk and get a holistic view of all their posture end-to-end including devices, identities, SaaS apps, and data. For more information, see [What's new in Microsoft Security Exposure Management](/security-exposure-management/whats-new).

**Granular access management** – Security teams can now provide targeted access to security content, so only relevant users see necessary information. This allows users to view security insights without direct resource permissions, enhancing operational security and compliance. Using a new cloud scopes capability, cloud accounts like Azure subscriptions, AWS accounts, and GCP projects can be organized into logical groups for improved data pivoting and RBAC, supporting segmentation by business unit, region, or workload with persistent filtering across dashboards and workflows. For more information, see [Cloud Scopes and Unified RBAC](cloud-scopes-unified-rbac.md).

For more information, see [Defender for Cloud in the Defender portal](defender-portal/defender-for-cloud-defender-portal.md)


### General availability of compliance frameworks

November 3, 2025

The following regulatory compliance standards, previously available in preview, are now generally available in Microsoft Defender for Cloud.

|Standard|Cloud|
|------------|--------|
| APRA CPS 234 2019 | Azure, AWS |
| Australian Government ISM PROTECTED | Azure |
| Australian Government Information Security Manual 12.2023 | AWS, GCP |
| AWS Foundational Security Best Practices | AWS |
| AWS Well-Architected Framework 2024 | AWS |
| Brazil General Data Protection Law (LGPD) 2018 | Azure, AWS, GCP |
| California Consumer Privacy Act (CCPA) | AWS, GCP |
| Canada Federal PBMM 3.2020 | Azure, AWS, GCP |
| CIS Amazon Elastic Kubernetes Service (EKS) Benchmark | AWS |
| CIS AWS Foundations v3.0.0 | AWS |
| CIS Azure Foundations v2.1.0 | Azure |
| CIS Azure Kubernetes Service (AKS) Benchmark | Azure |
| CIS Controls v8.1 | Azure, AWS, GCP |
| CIS GCP Foundations v3.0 | GCP |
| CIS Google Cloud Platform Foundation Benchmark | GCP |
| CIS Google Kubernetes Engine (GKE) Benchmark | GCP |
| CRI Profile | AWS, GCP |
| Criminal Justice Information Services Security Policy v5.9.5 | Azure, AWS, GCP |
| CSA Cloud Controls Matrix v4.0.12 | Azure, AWS, GCP |
| Cyber Essentials v3.1 | Azure, AWS, GCP |
| Cybersecurity Maturity Model Certification (CMMC) Level 2 v2.0 | Azure, AWS, GCP |
| EU 2022/2555 (NIS2) 2022 | Azure, AWS, GCP |
| EU General Data Protection Regulation (GDPR) 2016/679 | Azure, AWS, GCP |
| FedRAMP ‘H’ & ‘M’ | Azure |
| FedRAMP High Baseline Rev5 | AWS, GCP |
| FedRAMP Moderate Baseline Rev5 | AWS, GCP |
| FFIEC CAT 2017 | Azure, AWS, GCP |
| HIPAA | Azure |
| HITRUST CSF v11.3.0 | Azure, AWS, GCP |
| ISO/IEC 27001:2022 | Azure, AWS, GCP |
| ISO/IEC 27002:2022 | Azure, AWS, GCP |
| ISO/IEC 27017:2015 | Azure, AWS, GCP |
| NCSC Cyber Assurance Framework (CAF) v3.2 | Azure, AWS, GCP |
| NIST 800-171 Rev 3 | Azure, AWS, GCP |
| NIST CSF v2.0 | Azure, AWS, GCP |
| NIST SP 800-53 R5 | AWS |
| NIST SP 800-53 R5.1.1 | Azure, AWS, GCP |
| NIST SP 800-172 2021 | AWS, GCP |
| NZISM v3.7 | Azure, AWS, GCP |
| PCI DSS 3.2.1 | GCP |
| PCI DSS v4.0.1 | Azure, AWS, GCP |
| RMIT Malaysia | Azure |
| Sarbanes–Oxley Act 2022 (SOX) | Azure, AWS, GCP |
| SOC 2023 | Azure, AWS, GCP |
| SOC 2 | Azure, GCP |
| Spanish ENS | Azure |
| SWIFT Customer Security Controls Framework 2024 | Azure, AWS, GCP |
| SWIFT CSP-CSCF v2020 | Azure |
| UK OFFICIAL and UK NHS | Azure |
| Reserve Bank of India – IT Framework for NBFC | Azure |
| Cybersecurity Maturity Model Certification (CMMC) Level 3 | Azure, AWS, GCP |
| ISO/IEC 27018:2019 | Azure, AWS, GCP |
| ISO/IEC 27019:2020 | Azure, AWS, GCP |
| NIST SP 800-53 R6 | Azure, AWS, GCP |
| NIST SP 800-82 R3 | Azure, AWS, GCP |
| NIST AI Risk Management Framework (AI RMF 1.0) | Azure, AWS, GCP |
| US Executive Order 14028 | Azure, AWS, GCP |
| Singapore MTCS SS 584:2015 | Azure, AWS, GCP |
| Thailand PDPA 2019 | Azure, AWS, GCP |
| Japan ISMAP | Azure, AWS, GCP |

Learn more about [regulatory compliance standards in Microsoft Defender for Cloud](concept-regulatory-compliance-standards.md).

## October 2025

|Date | Category | Update|
| -------- | -------- | -------- |
|October 31, 2025|Public Preview |[GCP Cloud Logging Ingestion (Preview)](#gcp-cloud-logging-ingestion-preview)|
|October 23, 2025 |Deprecation Notice | [Update Outbound Rules for Microsoft Defender for Containers](#deprecation-notice-update-outbound-rules-for-microsoft-defender-for-containers) |
|October 23, 2025 | Update | [GitHub Application Permissions Update](#github-application-permissions-update)|

### GCP Cloud Logging ingestion (preview)

October 31, 2025

GCP Cloud Logging ingestion is now available in preview, improving CIEM insights and permission-usage visibility across Google Cloud environments.

To maintain continuous CIEM recommendations for connected GCP environments, enable Cloud Logging ingestion using a new or existing Pub/Sub subscription.

Learn more about [ingesting with GCP Cloud Logging](quickstart-onboard-gcp.md#ingest-gcp-cloud-logging-with-pubsub-preview).

### Deprecation notice: update outbound rules for Microsoft Defender for Containers 

Microsoft Defender for Containers updated the outbound network requirements for the Defender sensor. You must update your outbound rules to maintain proper functionality. 

This change affects all subscriptions using Microsoft Defender for Containers. If you're not using the Defender sensor, no action is required. 

Beginning now, the Defender for Containers sensor requires outbound traffic to the following fully qualified domain name (FQDN) and port: 

`*.cloud.defender.microsoft.com` (HTTPS: port 443) 

#### Recommended actions 

1. Add the new FQDN and port to your allowed traffic in your outbound restriction method, such as a proxy or firewall. 

1. If you don't block egress traffic from your clusters, no action is required. 

1. To verify connectivity to Microsoft Defender for Containers endpoints, run the connectivity test script to confirm network accessibility from your cluster. 

#### Deadline

To avoid service disruption, complete any necessary updates of GKE and EKS by September 30, 2026. If no action is taken where required, the Defender for Containers sensor won't function as expected.

### GitHub application permissions update

October 23, 2025

Defender for Cloud is updating its GitHub connector to request a new permission: `artifact_metadata:write`. This enables new capabilities that support [artifact attestations](https://docs.github.com/actions/how-tos/secure-your-work/use-artifact-attestations/use-artifact-attestations) - providing verifiable build provenance and strengthening your software supply chain security.
The permission is narrowly scoped, aligning with least privilege principles to support faster and easier security approvals.

#### How to approve the new permission:

- **Via GitHub settings:** In your GitHub organization, go to **Settings > GitHub Apps**, select the **Microsoft Security DevOps** application, and approve the pending permission request.

- **Via email (for organization owners):** GitHub sends an automated email to **organization owners** with the subject **"Review permissions request for Microsoft Security DevOps"**. Click **Review permission request** to approve or reject the change.

> **Didn’t get the email?**
> Only GitHub **organization owners** receive this notification. If you're not an owner, please contact one in your organization to approve the request via GitHub settings.

**Note:** existing connectors will continue to work without this permission, but the new functionality will only be available once the permission is approved.

## September 2025

|Date | Category | Update|
| -------- | -------- | -------- |
|September 16, 2025 | Public Preview | [Malware automated remediation in Defender for Storage (Preview)](#malware-automated-remediation-in-defender-for-storage-preview)|
|September 15, 2025 | Update | [New refined attack paths](#new-refined-attack-paths) |
|September 14, 2025| Preview |[Trusted IPs support for internet-exposure analysis](#trusted-ips-support-for-internet-exposure-analysis)|
|September 14, 2025| GA | [Exposure width for internet-exposure analysis](#exposure-width-for-internet-exposure-analysis)|
|September 11, 2025 | Preview | [Trivy dependency scanning for code repositories (Update)](#trivy-dependency-scanning-for-code-repositories-update) |

### Malware automated remediation in Defender for Storage (Preview)

September 16, 2025

Malware automated remediation in Defender for Storage malware scanning is now available in public preview. 

With this new capability, malicious blobs detected during on-upload or on-demand scanning can be automatically soft-deleted. This ensures harmful content is quarantined while still recoverable for further investigation. 

You can enable or disable malware automated remediation at either the subscription or storage account level from the Microsoft Defender for Cloud tab in the Azure portal, or by using the API. 

For more information, see [Built-in automated malware remediation for malicious blobs](/azure/defender-for-cloud/defender-for-storage-configure-malware-scan#built-in-automated-malware-remediation-for-malicious-blobs).  

### New refined attack paths

September 9, 2025

Attack paths now reflect real, externally driven and exploitable risks that adversaries could use to compromise your organization, helping you cut through the noise and act faster. The paths now focus on external entry points and how attackers could progress through your environment reaching business-critical targets. This experience brings greater clarity, focus, and prioritization empowering security teams to mitigate the most critical risks with confidence.

Read more about it in this blog: [Refining Attack Paths: Prioritizing Real-World, Exploitable Threats](https://techcommunity.microsoft.com/blog/securityexposuremanagement/refining-attack-paths-prioritizing-real-world-exploitable-threats/4454051)

For more information, see [Identify and remediate attack paths](how-to-manage-attack-path.md).
 
### Trusted IPs support for internet-exposure analysis

September 14, 2025

Defender for Cloud allows you to define trusted internet protocol (IP) ranges to reduce false positives in internet-exposure analysis. Resources that are only accessible from trusted IPs are considered trusted. Defender for Cloud won't generate attack paths for trusted IPs.

Learn more about [trusted exposure](internet-exposure-analysis.md#trusted-exposure-preview).

### Exposure width for internet-exposure analysis

September 14, 2025

Exposure width is now generally available in Microsoft Defender for Cloud. Exposure width shows how a resource is exposed to the public internet based on its network rules. This feature helps security teams find and fix critical attack paths.

Learn more about [internet exposure width](internet-exposure-analysis.md#internet-exposure-width).

### Trivy dependency scanning for code repositories (Update)

September 11, 2025  

Defender for Cloud now includes **open-source dependency vulnerability scanning** powered by [Trivy in filesystem mode](https://trivy.dev/v0.59/docs/scanner/vulnerability/). This helps you strengthen security by automatically detecting operating-system and library vulnerabilities across GitHub and Azure DevOps repositories.  

**Where it applies:**  
- [In-pipeline (CLI) scanning](/azure/defender-for-cloud/cli-cicd-integration).  

- [Agentless code scanning (preview)](/azure/defender-for-cloud/agentless-code-scanning).

**What to do:**  
- For [Azure DevOps](quickstart-onboard-devops.md) or [GitHub](quickstart-onboard-github.md), create or edit a connector.  
- For in-pipeline scanning, add the [Microsoft Security DevOps (MSDO) CLI](cli-cicd-integration.md) tool to your pipeline definition.  

**Where results appear:**  
- Pipeline logs and SARIF files.  

- Defender for Cloud recommendations:  
  - *[Azure DevOps repositories should have dependency vulnerability scanning findings resolved](recommendations-reference-devops.md#azure-devops-repositories-should-have-dependency-vulnerability-scanning-findings-resolved)*  
  - *[GitHub repositories should have dependency vulnerability scanning findings resolved](recommendations-reference-devops.md#github-repositories-should-have-dependency-vulnerability-scanning-findings-resolved)*  

If you use [GitHub Advanced Security](https://docs.github.com/get-started/learning-about-github/about-github-advanced-security) dependency scanning, Defender for Cloud now enhances, not replaces, those results.  

**Effective date:** September 15, 2025. 

## August 2025

|Date | Category | Update|
| -------- | -------- | -------- |
| August 27, 2025 | GA | [General availability of Optional index tags for storing malware scanning results](#general-availability-of-defender-for-storage-optional-index-tags-for-storing-malware-scanning-results) |
| August 12, 2025 | GA | [General availability of Defender for Storage in Azure Government cloud](#general-availability-of-defender-for-storage-in-azure-government-cloud) |
| August 11, 2025 | GA | [General availability of Defender CSPM and Defender for Servers Plan 2 in Azure Government cloud](#general-availability-of-defender-cspm-and-defender-for-servers-plan-2-in-azure-government-cloud) |
| August 6, 2025 | GA | [AKS Security Dashboard](#aks-security-dashboard) |
| August 5, 2025 | Preview | [Storage aggregated logs in XDR's Advanced Hunting (Preview)](#storage-aggregated-logs-in-xdrs-advanced-hunting-preview) | 

### General availability of Defender for Storage Optional index tags for storing malware scanning results

August 27, 2025

Defender for Storage malware scanning introduces optional index tags for both on-upload and on-demand scans. With this new capability, users can choose whether to publish results to blob’s index tags when a blob is scanned (default) or to not use index tags. Index tags can be enabled or disabled at the subscription and storage account level through the Azure portal or via API.

### General availability of Defender for Storage in Azure Government cloud

August 12, 2025

Microsoft [Defender for Storage](/azure/defender-for-cloud/defender-for-storage-introduction) is generally available to government cloud customers. The service helps U.S. federal and government agencies, secure their storage accounts.
All features of [Defender for Storage](/azure/defender-for-cloud/defender-for-storage-introduction) are available in government clouds, aligning the feature coverage with commercial cloud services.
Learn more about [Defender for Cloud's government cloud coverage](support-matrix-defender-for-cloud.md).

### General availability of Defender CSPM and Defender for Servers Plan 2 in Azure Government cloud

August 11, 2025

Microsoft Defender for Cloud's [Cloud Security Posture Management (CSPM)](/azure/defender-for-cloud/tutorial-enable-cspm-plan) is generally available to government cloud customers. The service helps U.S. federal and government agencies, including the Department of Defense (DoD) and civilian agencies, manage cloud security posture and improve compliance.

All features of [Defender for Servers Plan 2's (P2)](defender-for-servers-overview.md#plan-protection-features) are available in government clouds, aligning the feature coverage with commercial cloud services.

Learn more about [Defender for Cloud's government cloud coverage](support-matrix-cloud-environment.md).

### AKS Security Dashboard

August 6, 2025

The AKS Security Dashboard provides a centralized view of security posture and runtime threat protection for AKS cluster within the Azure portal. It highlights software vulnerabilities, compliance gaps, and active threats, helping you prioritize remediation. Use this dashboard to monitor AKS workload protection, cluster configuration, and threat detection in real time.

For more information, see [Azure Kubernetes Service (AKS) Security Dashboard](cluster-security-dashboard.md).

### Storage aggregated logs in XDR's Advanced Hunting (Preview)

August 5, 2025

The new `CloudStorageAggregatedEvents` table is now available in Microsoft Defender XDR’s Advanced Hunting experience. It brings aggregated storage activity logs, such as operations, authentication details, access sources, and success/failure counts, from Defender for Cloud into a single, queryable schema. The aggregation reduces noise, improves performance, and provides a high-level view of storage access patterns to support more effective threat detection and investigation.

The logs are available at no additional cost as part of the new per-storage account plan in Defender for Storage. For more information, visit [CloudStorageAggregatedEvents (Preview)](/defender-xdr/advanced-hunting-cloudstorageaggregatedevents-table).

## July 2025

|Date | Category | Update|
| -------- | -------- | -------- |
| July 15, 2025 | Preview | [Four new Regulatory Compliance Standards](#four-new-regulatory-compliance-standards) |
| July 3, 2025 | GA | [Scanning support for Chainguard container images and Wolfi](#scanning-support-for-chainguard-container-images-and-wolfi) |

### Four new Regulatory Compliance Standards

July 15, 2025

Microsoft Defender for Cloud's **Regulatory Compliance** is expanding its support to include **four new frameworks** across **Azure**, **AWS**, and **GCP** environments:

1. **Digital Operational Resilience Act (DORA)**
2. **European Union Artificial Intelligence Act (EU AI Act)**
3. **Korean Information Security Management System for Public Cloud (k-ISMS-P)**
4. **Center for Internet Security (CIS) Microsoft Azure Foundations Benchmark v3.0**

These frameworks are now available in **public preview** and can be enabled via the **Regulatory Compliance dashboard** in Microsoft Defender for Cloud.

For more information, see: [Regulatory compliance standards in Microsoft Defender for Cloud](/azure/defender-for-cloud/concept-regulatory-compliance-standards).

### Scanning support for Chainguard container images and Wolfi

July 3, 2025

Microsoft Defender for Cloud's vulnerability scanner, powered by Microsoft Defender Vulnerability Management, is extending its scanning coverage to Chainguard container images, and identify vulnerabilities in Chainguard Images and Wolfi to validate that they're shipping the most secure builds possible. As additional image types are being scanned, your bill might increase. For all supported distributions, see [Registries and images support for vulnerability assessment](support-matrix-defender-for-containers.md#registries-and-images-support-for-vulnerability-assessment).

## June 2025

|Date | Category | Update|
| -------- | -------- | -------- |
| June 30 | Preview | [Defender for container DNS detections based on Helm (Preview)](#defender-for-container-dns-detections-based-on-helm-preview) |
| June 25 | Preview | [Optional index tags for storing malware scanning results (Preview)](#optional-index-tags-for-storing-malware-scanning-results-preview) |
| June 25 | Preview | [API discovery and security posture for APIs hosted in Function Apps and Logic Apps (Preview)](#api-discovery-and-security-posture-for-apis-hosted-in-function-apps-and-logic-apps-preview) |
| June 25 | Preview | [Agentless File Integrity Monitoring (Preview)](#agentless-file-integrity-monitoring-preview) |
| June 18 | Preview | [Agentless code scanning – GitHub support and customizable coverage now available (Preview)](#agentless-code-scanning--github-support-and-customizable-coverage-now-available-preview) |

### Defender for container DNS detections based on Helm (Preview)

**What's included:**

- **Helm-based deployment support**

  For setup instructions and more details, see [Install Defender for Containers sensor using Helm](/azure/defender-for-cloud/deploy-helm).
  
- **DNS threat detections**

  Improves memory efficiency and reduces CPU consumption for large cluster deployments.

For more information, see: [Sensor for Defender for Containers Changelog](/azure/defender-for-cloud/defender-sensor-change-log).

### Optional index tags for storing malware scanning results (Preview)

June 25, 2025

Defender for Storage malware scanning introduces optional index tags for both on-upload and on-demand scans. With this new capability, users can choose whether to publish results to blob’s index tags when a blob is scanned (default) or to not use index tags.
Index tags can be enabled or disabled at the subscription and storage account level through the Azure portal or via API.

### API discovery and security posture for APIs hosted in Function Apps and Logic Apps (Preview)

June 25, 2025

Defender for Cloud now extends its API discovery and security posture capabilities to include APIs hosted in **Azure Function Apps** and **Logic Apps**, in addition to its existing support for APIs published in Azure API Management.

This enhancement empowers security teams with a comprehensive and continuously updated view of their organization’s API attack surface. Key capabilities include:

- **Centralized API Inventory**: Automatically discover and catalog APIs across supported Azure services.
- **Security Risk Assessments**: Identify and prioritize risks, including identification of dormant APIs that may warrant removal, as well as unencrypted APIs that could expose sensitive data.

These capabilities are **automatically available** to all **Defender for Cloud Security Posture Management (DCSPM)** customers who have enabled the [API Security Posture Management extension](enable-api-security-posture.md).

**Rollout Timeline**: The rollout of these updates will begin on June 25, 2025, and is expected to reach all [supported regions](regional-availability.md#api-security-posture-management-dcspm) within one week.

### Agentless File Integrity Monitoring (Preview)

June 25, 2025

Agentless File Integrity Monitoring (FIM) is now available in preview. This capability complements the generally available (GA) FIM solution based on the Microsoft Defender for Endpoint agent, and introduces support for custom file and registry monitoring.

Agentless FIM enables organizations to monitor file and registry changes across their environment without deploying other agents. It provides a lightweight, scalable alternative while maintaining compatibility with the existing agent-based solution.

Key capabilities include:

- **Custom monitoring**: Meet specific compliance and security requirements by defining and monitoring custom file paths and registry keys.
- **Unified experience**: Events from both agentless and MDE-based FIM are stored in the same workspace table, with clear source indicators.

Learn more about [File integrity monitoring](file-integrity-monitoring-overview.md) and how to [Enable file integrity monitoring](file-integrity-monitoring-enable-defender-endpoint.md).

### Agentless code scanning – GitHub support and customizable coverage now available (Preview)

June 18, 2025

We have updated the agentless code scanning feature to include key capabilities that extend both coverage and control. These updates include:

- Support for GitHub repositories, in addition to Azure DevOps
- Customizable scanner selection – select which tools (e.g., Bandit, Checkov, ESLint) to run
- Granular scope configuration – include or exclude specific organizations, projects, or repositories

Agentless code scanning provides scalable security scanning for code and infrastructure-as-code (IaC) without requiring changes to CI/CD pipelines. It helps security teams detect vulnerabilities and misconfigurations without interrupting developer workflows.

Learn more about [configuring agentless code scanning in Azure DevOps or GitHub](https://aka.ms/DevOpsSecurity/AgentlessCodeScanning/Docs).

## May 2025

|Date | Category | Update|
| -------- | -------- | -------- |
| May 28 | GA | [General Availability for Customizable on-upload malware scanning filters in Defender for Storage](#general-availability-for-customizable-on-upload-malware-scanning-filters-in-defender-for-storage) |
| May 5 | Preview | [Active User (Public Preview)](#active-user-public-preview) |
| May 1 | GA | [General Availability for Defender for AI Services](#general-availability-for-defender-for-ai-services) |
| May 1 | GA | [Microsoft Security Copilot is now Generally Available in Defender for Cloud](#microsoft-security-copilot-is-now-generally-available-in-defender-for-cloud) |
| May 1 | GA | [General Availability Data and AI security dashboard](#general-availability-data-and-ai-security-dashboard) |
| May 1 | Upcoming change | [Defender CSPM starts billing for Azure Database for MySQL Flexible Server and Azure Database for PostgreSQL Flexible Server resources](#defender-cspm-starts-billing-for-azure-database-for-mysql-flexible-server-and-azure-database-for-postgresql-flexible-server-resources) |

### General Availability for Customizable on-upload malware scanning filters in Defender for Storage

May 28, 2025

On-upload malware scanning now supports customizable filters. Users can set exclusion rules for on-upload malware scans based on blob path prefixes, suffixes and by blob size. By excluding specific blob paths and types, such as logs or temporary files, you can avoid unnecessary scans and reduce costs.

Learn how to [configure customizable on-upload malware scanning filters](on-upload-malware-scanning.md).

### Active User (Public Preview)

The Active User feature assists security administrators quickly identify and assign recommendations to the most relevant users based on recent control plane activity. For each recommendation, up to three potential active users are suggested at the resource, resource group, or subscription level. Administrators can select a user from the list, assign the recommendation, and set a due date—triggering a notification to the assigned user. This streamlines remediation workflows, reduces investigation time, and strengthens overall security posture.

### General Availability for Defender for AI Services

May 1, 2025

Defender for Cloud now supports runtime protection for Azure AI services (previously called threat protection for AI workloads).

Protection for Azure AI services covers threats specific to AI services and applications, such as jailbreak, wallet abuse, data exposure, suspicious access patterns, and more. The detections use signals from Microsoft Threat Intelligence and Azure AI Prompt Shields, and apply machine learning and AI to secure your AI services.

Learn more about [Defender for AI Services](ai-threat-protection.md).

### Microsoft Security Copilot is now Generally Available in Defender for Cloud

May 1, 2025

Microsoft Security Copilot is now generally available in Defender for Cloud.

Security Copilot speeds up risk remediation for security teams, making it faster and easier for administrators to address cloud risks. It provides AI-generated summaries, remediation actions, and delegation emails, guiding users through each step of the risk reduction process.

Security administrators can quickly summarize recommendations, generate remediation scripts, and delegate tasks via email to resource owners. These capabilities reduce investigation time, help security teams understand risks in context, and identify resources for quick remediation.

Learn more about [Microsoft Security Copilot in Defender for Cloud](copilot-security-in-defender-for-cloud.md).

### General Availability Data and AI security dashboard

May 1, 2025

Defender for Cloud is enhancing the Data security dashboard to include AI Security with the new Data and AI security dashboard in GA. The dashboard provides a centralized platform to monitor and manage data and AI resources, along with their associated risks and protection status.

Key benefits of the Data and AI security dashboard include:

- **Unified view**: Gain a comprehensive view of all organizational data and AI resources.
- **Data insights**: Understand where your data is stored and the types of resources holding it.
- **Protection coverage**: Assess the protection coverage of your data and AI resources.
- **Critical issues**: Highlight resources that require immediate attention based on high-severity recommendations, alerts, and attack paths.
- **Sensitive data discovery**: Locate and summarize sensitive data resources in your cloud and AI assets.
- **AI workloads**: Discover AI application footprints, including services, containers, data sets, and models.

Learn more about the [Data and AI security dashboard](data-aware-security-dashboard-overview.md).

### Defender CSPM starts billing for Azure Database for MySQL Flexible Server and Azure Database for PostgreSQL Flexible Server resources

May 1, 2025

**Estimated date for change:** June 2025

Beginning June 1, 2025, Microsoft Defender CSPM will start billing for **Azure Database for MySQL Flexible Server** and **Azure Database for PostgreSQL Flexible Server** resources in your subscription where Defender CSPM is enabled. These resources are already protected by Defender CSPM and no user action is required. After billing starts, your bill might increase.

For more information, see [CSPM plan pricing](concept-cloud-security-posture-management.md#plan-pricing)

## April 2025

|Date | Category | Update|
| -------- | -------- | -------- |
| April 29 | Preview | [AI Posture Management in GCP Vertex AI (Preview)](#ai-posture-management-in-gcp-vertex-ai-preview) |
| April 29 | Preview | [Defender for Cloud integration with Mend.io (Preview)](#defender-for-cloud-integration-with-mendio-preview) |
| April 29 | Change | [Updated GitHub Application Permissions](#github-application-permissions-update)|
| April 28 | Change | [Update to Defender for SQL servers on Machines plan](#update-to-defender-for-sql-servers-on-machines-plan) |
| April 27 | GA | [New default cap for on-upload malware scanning in Microsoft Defender for Storage](#new-default-cap-for-on-upload-malware-scanning-in-microsoft-defender-for-storage) |
| April 24 | GA| [General Availability of API Security Posture Management native integration within Defender CSPM Plan](#general-availability-of-api-security-posture-management-native-integration-within-defender-cspm-plan) |
| April 7 | Upcoming Change| [Enhancements for Defender for app service alerts](#enhancements-for-defender-for-app-service-alerts) |

### AI Posture Management in GCP Vertex AI (Preview)

April 29, 2025

Defender for Cloud's AI security posture management features now support AI workloads in Google Cloud Platform (GCP) Vertex AI (Preview).

Key features for this release include:

- Modern AI application Discovery: Automatically discover and catalog AI application components, data, and AI artifacts deployed in GCP Vertex AI.
- Security Posture Strengthening: Detect misconfigurations and receive built-in recommendations and remediation actions to enhance the security posture of your AI applications.
- Attack Path Analysis: Identify and remediate risks using advanced attack path analysis to protect your AI workloads from potential threats.

These features are designed to provide comprehensive visibility, misconfiguration detection, and hardening for AI resources, ensuring a reduction of risks for AI workloads developed on the GCP Vertex AI platform.

Learn more about [AI security posture management](ai-security-posture.md).

### Defender for Cloud integration with Mend.io (Preview)

April 29, 2025

Defender for Cloud is now integrated with Mend.io in preview. This integration enhances software application security by identifying and mitigating vulnerabilities in partner dependencies. This integration streamlines discovery and remediation processes, improving overall security.

Learn more about the [Mend.io integration](integration-mend-io.md).

### GitHub Application Permissions Update

April 29, 2025

GitHub connectors in Defender for Cloud will be updated to include administrator permissions for [[Custom Properties]](https://docs.github.com/organizations/managing-organization-settings/managing-custom-properties-for-repositories-in-your-organization#about-custom-properties). This permission is used to provide new contextualization capabilities and is scoped to managing the custom properties schema. Permissions can be granted in two different ways:

1. In your GitHub organization, navigate to the Microsoft Security DevOps applications within **Settings > GitHub Apps** and accept the permissions request.

1. In an automated email from GitHub Support, select **Review permission request** to accept or reject this change.

Note: Existing connectors continue to work without the new functionality if the above action isn't taken.

### Update to Defender for SQL servers on Machines plan

April 28, 2025

The Defender for SQL Server on machines plan in Microsoft Defender for Cloud protects SQL Server instances hosted on Azure, AWS, GCP, and on-premises machines.

Starting today, we're gradually releasing an enhanced agent solution for the plan. The agent-based solution eliminates the need to deploy the Azure Monitor Agent (AMA) and instead uses the existing SQL infrastructure. The solution is designed to make the onboarding processes easier and improve protection coverage.

**Required customer actions**:

1. [Update Defender for SQL Servers on Machines plan configuration](update-sql-machine-configuration.md): Customers who enabled Defender for SQL Server on machines plan before today are required to follow these instructions to update their configuration, following the enhanced agent release.

1. [Verify SQL Server instances protection status](verify-machine-protection.md): With an estimated starting date of May 2025, customers must verify the protection status of their SQL Server instances across their environments. Learn how to [troubleshoot any deployment issues Defender for SQL on machines configuration](troubleshoot-sql-machines-guide.md).

> [!NOTE]
> After the agent upgrade occurs, you might experience a billing increase if additional SQL Server instances are protected with your enabled Defender for SQL Servers on Machines plan. For billing information, review the
[Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

### New default cap for on-upload malware scanning in Microsoft Defender for Storage

April 27, 2025

The default cap value for on-upload malware scanning has been updated from 5,000 GB to 10,000 GB. This new cap applies to the following scenarios:

- **New Subscriptions:** Subscriptions where Defender for Storage is enabled for the first time.

- **Re-enabled Subscriptions:** Subscriptions where Defender for Storage was previously disabled and is now re-enabled.

When Defender for Storage Malware Scanning is enabled for these subscriptions, the default cap for on-upload malware scanning will be set to 10,000GB. This cap is adjustable to meet your specific needs.

For more detailed information, refer to the section on [Malware scanning - billing per GB, monthly capping, and configuration](defender-for-storage-introduction.md)

### General Availability of API Security Posture Management native integration within Defender CSPM Plan

April 24, 2025

API Security Posture Management is now generally available as part of the Defender CSPM plan. This release introduces a unified inventory of your APIs along with posture insights, helping you identify and prioritize API risks more effectively directly from your Defender CSPM plan. You can enable this capability through the Environment Settings page by turning on the API Security Posture extension.

With this update, new risk factors have been added, including risk factors for unauthenticated APIs (AllowsAnonymousAccess) and APIs lacking encryption (UnencryptedAccess). Additionally, APIs published through Azure API Management now allow mapping back to any connected Kubernetes Ingresses and VMs, providing end-to-end visibility into API exposure and support risk remediation through Attack path analysis.

### Enhancements for Defender for app service alerts

April 7, 2025

On April 30, 2025, Defender for App Service alerting capabilities will be enhanced. We'll add alerts for suspicious code executions and access to internal or remote endpoints. Additionally, we have improved coverage and reduced noise from relevant alerts by expanding our logic and removing alerts that were causing unnecessary noise. As part of this process, the alert "Suspicious WordPress theme invocation detected" will be deprecated.

## March 2025

|Date | Category | Update|
|--|--|--|
| March 30 | GA | [Enhanced container protection with vulnerability assessment and malware detection for AKS nodes is now GA](#enhanced-container-protection-with-vulnerability-assessment-and-malware-detection-for-aks-nodes-is-now-ga) |
| March 27 | Preview | [Kubernetes gated deployment (Preview)](#kubernetes-gated-deployment-preview) |
| March 27 | Preview | [Customizable on-upload malware scanning filters in Defender for Storage (Preview)](#customizable-on-upload-malware-scanning-filters-in-defender-for-storage-preview) |
| March 26 | GA | [General Availability for agentless VM scanning support for CMK in Azure](#general-availability-for-agentless-vm-scanning-support-for-cmk-in-azure) |
| March 11 | Upcoming Change | [Upcoming change to the recommendation severity levels](#upcoming-change-to-the-recommendation-severity-levels) |
| March 03 | GA | [General Availability of File Integrity Monitoring (FIM) based on Microsoft Defender for Endpoint in Azure Government](#general-availability-of-file-integrity-monitoring-fim-based-on-microsoft-defender-for-endpoint-in-azure-government) |

### Enhanced container protection with vulnerability assessment and malware detection for AKS nodes is now GA

March 30, 2025

Defender for Cloud now provides vulnerability assessment and malware detection for the nodes in Azure Kubernetes Service (AKS) as GA.
Providing security protection for these Kubernetes nodes allow customers to maintain security and compliance across the managed Kubernetes service, and understand their part in the shared security responsibility they have with the managed cloud provider.
To receive the new capabilities, you have to enable the **Agentless scanning for machines**"** as part of Defender CSPM, Defender for Containers, or Defender for Servers P2 plan on your subscription.

#### Vulnerability Assessment

A new recommendation is now available in Azure portal: **AKS nodes should have vulnerability findings resolved.** Using this recommendation, you can now review and remediate vulnerabilities and CVEs found on Azure Kubernetes Service (AKS) nodes.

#### Malware detection

New security alerts are triggered when the agentless malware detection capability detects malware in AKS nodes.
Agentless malware detection uses the Microsoft Defender Antivirus anti-malware engine to scan and detect malicious files. When threats are detected, security alerts are directed into Defender for Cloud and Defender XDR, where they can be investigated and remediated.

**Note:** Malware detection for AKS nodes is available only for Defender for Containers or Defender for Servers P2 enabled environments.

### Kubernetes gated deployment (Preview)

March 27, 2025

We're introducing the Kubernetes gated deployment (Preview) feature to the Defender for Containers plan. Kubernetes gated deployment is a mechanism for enhancing Kubernetes security by controlling the deployment of container images that violate organizational security policies.

This capability is based on two new functionalities:

- **Vulnerability findings artifact**: Generation of findings for each container image scanned for vulnerability assessment.
- **Security rules**: Addition of security rules to alert or prevent the deployment of vulnerable container images into Kubernetes clusters.

**Customized security rules**: Customers can customize security rules for various environments, for Kubernetes clusters within their organization, or for namespaces, to enable security controls tailored to specific needs and compliance requirements.

**Configurable actions for a security rule**:

- **Audit**: Attempting to deploy a vulnerable container image triggers an "Audit" action, generating a recommendation with violation details on the container image.

- **Deny**: Attempting to deploy a vulnerable container image triggers a "Deny" action to prevent deployment of the container image, ensuring that only secure and compliant images are deployed.

**End-to-End Security**: Defining protection from deployment of vulnerable container images as the first security rule, we introduce the end-to-end Kubernetes secure gating mechanism, ensuring that vulnerable containers don't enter the customer's Kubernetes environment.

For more information about this feature, see [Gated Deployment solution overview](gated-deployment-introduction.md).

### Customizable on-upload malware scanning filters in Defender for Storage (Preview)

March 27, 2025

On-upload malware scanning now supports customizable filters. Users can set exclusion rules for on-upload malware scans based on blob path prefixes, suffixes and by blob size. By excluding specific blob paths and types, such as logs or temporary files, you can avoid unnecessary scans and reduce costs.

Learn how to [configure customizable on-upload malware scanning filters](on-upload-malware-scanning.md#customizable-on-upload-malware-scanning-filters).

### General Availability for agentless VM scanning support for CMK in Azure

March 26, 2025

Agentless scanning for Azure VMs with CMK encrypted disks is now Generally Available. Both the Defender CSPM plan, and the Defender for Servers P2 provide support for agentless scanning for VMs, now with CMK support across all clouds

Learn how to [enable agentless scanning for Azure VMs with CMK encrypted disks](enable-agentless-scanning-vms.md#enable-for-azure-vms-with-cmk-encrypted-disks).

### Upcoming change to the recommendation severity levels

March 11, 2025

We're enhancing the severity levels of recommendations to improve risk assessment and prioritization. As part of this update, we reevaluated all severity classifications and introduced a new level — Critical. Previously, recommendations were categorized into three levels: Low, Medium, and High. With this update, there are now four distinct levels: Low, Medium, High, and Critical, providing a more granular risk evaluation to help customers focus on the most urgent security issues.

As a result, customers might notice changes in the severity of existing recommendations. Additionally, the risk level evaluation, which is available for Defender CSPM customers only, might also be affected as both recommendation severity and asset context are taken into consideration. These adjustments could affect the overall risk level.

**The projected change will take place on March 25, 2025.**

### General Availability of File Integrity Monitoring (FIM) based on Microsoft Defender for Endpoint in Azure Government

March 03, 2025

File Integrity Monitoring based on Microsoft Defender for Endpoint is now GA in Azure Government (GCCH) as part of Defender for Servers Plan 2.

- Meet compliance requirements by monitoring critical files and registries in real-time and auditing the changes.
- Identify potential security issues by detecting suspicious file content changes.

This improved FIM experience replaces the existing one that set for deprecation with the Log Analytics Agent (MMA) retirement. The [FIM experience over MMA](file-integrity-monitoring-enable-log-analytics.md) will remain supported in Azure Government until the end of March 2023.

With this release, an in-product experience will be released to allow you to migrate your FIM configuration over MMA to the new FIM over Defender for Endpoint version.

For information on how to enable FIM over Defender for Endpoint, see [File Integrity Monitoring using Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md). For information on how to disable previous versions and use the migration tool, see [Migrate File Integrity Monitoring from previous versions](migrate-file-integrity-monitoring.md).

> [!IMPORTANT]
> The availability of File Integrity Monitoring in Azure China 21Vianet and in GCCM clouds isn't currently planned to be supported.

## Next steps

Check [What's new in security recommendations and alerts](release-notes-recommendations-alerts.md).
