---
title: What's new in Defender for Cloud features
description: Learn about new, updated, and deprecated features in Microsoft Defender for Cloud, including preview releases, general availability updates, and upcoming changes.
ms.topic: overview
ms.custom: references_regions
ms.date: 06/09/2026
---

# What's new in Defender for Cloud features

This article summarizes what's new in Microsoft Defender for Cloud. It includes information about new features in preview or in general availability (GA), feature updates, upcoming feature plans, and deprecated functionality.

<!-- Please don't adjust this next line without getting approval from the Defender for or Cloud documentation team. It is necessary for proper RSS functionality. -->
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

## June 2026

| Date | Category | Update |
| -------- | -------- | -------- |
| June 9, 2026 | Preview | [New multicloud security recommendations now in public preview](#new-multicloud-security-recommendations-now-in-public-preview) |
| June 8, 2026 | GA | [SQL Vulnerability Assessment Express Configuration is now generally available for Azure SQL Managed Instance and Azure Synapse Analytics workspaces](#sql-vulnerability-assessment-express-configuration-is-now-generally-available-for-azure-sql-managed-instance-and-azure-synapse-analytics-workspaces) |
| June 4, 2026 | Preview | [Discovery and posture for serverless container workloads (Preview)](#discovery-and-posture-for-serverless-container-workloads-preview) |
| June 3, 2026 | Preview | [Kubernetes misconfiguration enforcement in Defender for Containers (preview)](#kubernetes-misconfiguration-enforcement-in-defender-for-containers-preview) |
| June 2, 2026 | Preview | [Vulnerability assessment extended to runtime-discovered container images on EKS and GKE (Preview)](#vulnerability-assessment-extended-to-runtime-discovered-container-images-on-eks-and-gke-preview) |
| June 2, 2026 | Preview | [Kubernetes node vulnerability assessment extended to EKS and GKE (Preview)](#kubernetes-node-vulnerability-assessment-extended-to-eks-and-gke-preview) |
| June 1, 2026 | GA | [General availability of Microsoft Defender for Open-Source Relational Databases on AWS RDS](#general-availability-of-microsoft-defender-for-open-source-relational-databases-on-aws-rds) |
| June 1, 2026 | Preview | [Container-level misconfiguration recommendations for Kubernetes (Preview)](#container-level-misconfiguration-recommendations-for-kubernetes-preview) |
| June 1, 2026 | Preview | [New actionable recommendation to upgrade AKS for system pod vulnerabilities (Preview)](#new-actionable-recommendation-to-upgrade-aks-for-system-pod-vulnerabilities-preview) |
| June 1, 2026 | GA | [Serverless protection for Azure and AWS is now generally available](#serverless-protection-for-azure-and-aws-is-now-generally-available) |


### New multicloud security recommendations now in public preview

June 9, 2026

More than 60 multicloud security recommendations are now available in public preview. These recommendations add coverage across AWS services including AppFlow, AppStream, AppSync, Athena, Auto Scaling, CodeBuild, Cognito, Comprehend, DMS, DataSync, FSx, Kendra, Keyspaces, Kinesis, MQ, Neptune, and QuickSight.

The new recommendations span data security, identity and access, networking, compute, and container categories, helping you assess encryption, access control, logging, network exposure, backup, and workload hardening scenarios across your multicloud estate.

Additional preview recommendations were added for Amazon MSK and OpenSearch Service (covering TLS enforcement, public access, unauthenticated access, encryption, audit logging, fine-grained access control, VPC access, customer-managed keys, and service update hygiene), along with GCP networking recommendations for App Engine SSL certificate expiration and DNS authorization on Google-managed certificates.

For a full list of available recommendations, see [Security recommendations](security-recommendations.md).

### SQL Vulnerability Assessment Express Configuration is now generally available for Azure SQL Managed Instance and Azure Synapse Analytics workspaces

June 8, 2026

Defender for SQL Vulnerability Assessment (SQL VA) Express Configuration is now generally available for Azure SQL Managed Instance and Azure Synapse Analytics workspaces. Express Configuration is already generally available for Azure SQL Database, and is now available across supported Azure PaaS SQL resource types at no extra cost.

With Express Configuration, you can enable SQL VA without provisioning or managing a customer-managed storage account. Express Configuration is the recommended enablement mode and provides the same security value as Classic Configuration, including the full set of SQL VA rules, weekly automatic scans, on-demand scans, and baseline management.

A new unified SQL VA REST API provides a consistent management surface across Azure SQL Database, Azure SQL Managed Instance, Azure Synapse Analytics workspaces, and SQL Server on machines, including SQL Server on Azure VMs and Azure Arc-enabled SQL Server.

**Upcoming automatic enablement at the subscription level:**

Over the next month, Defender for Cloud will begin rolling out automatic enablement of SQL VA Express Configuration at the subscription level for subscriptions where Defender for Azure SQL Databases is enabled. SQL VA Express Configuration will be turned on for Azure SQL Managed Instances and Azure Synapse Analytics workspaces that don't have an existing SQL VA configuration. Resources that are already configured with Classic Configuration or Express Configuration are not affected, and existing baselines and scan results are preserved.

Learn more about [SQL vulnerability assessment](sql-azure-vulnerability-assessment-overview.md) and how to [enable vulnerability assessment](sql-azure-vulnerability-assessment-enable.md).

### Discovery and posture for serverless container workloads (Preview)

June 4, 2026

Microsoft Defender for Cloud now includes discovery and posture coverage for supported serverless container workloads in preview.

This capability adds inventory visibility, security recommendations for misconfigurations and vulnerability assessment findings, and attack path analysis for Azure Container Apps and Azure Container Instances.

Learn more about [Discovery and posture for serverless container workloads (Preview)](posture-for-serverless-containers.md).

### Kubernetes misconfiguration enforcement in Defender for Containers (Preview)

June 3, 2026

Kubernetes misconfiguration enforcement is now available in public preview in Microsoft Defender for Containers. This feature extends Kubernetes security from audit to audit or block mode at deployment time, preventing risky Kubernetes deployments before they reach production.

Kubernetes misconfiguration enforcement evaluates Kubernetes resource configurations at admission time and enforces Microsoft Defender security best practice rules, complementing existing post-deployment monitoring with proactive enforcement. After you enable the feature, a default security rule is automatically created in Audit mode. You can configure rules to use Block mode to actively prevent non-compliant deployments.

This feature is available only in commercial clouds. It isn't available in national or sovereign clouds, including US Government, China Government, and other sovereign regions.

For more information, see [Enable gated deployment in Defender for Containers](enablement-guide-runtime-gated.md).

### Vulnerability assessment extended to runtime-discovered container images on EKS and GKE (Preview)

June 4, 2026

Defender for Cloud now extends vulnerability assessment to runtime-discovered container images on Amazon Elastic Kubernetes Service (EKS) and Google Kubernetes Engine (GKE). Previously, vulnerability assessment covered registry-based images. With this update, images discovered at runtime that weren't previously scanned from a registry are now also assessed, providing additional findings and increased visibility into running workloads.

This capability delivers a unified vulnerability assessment experience across Azure, AWS, and GCP, using the same recommendation model and workflows. To use this feature, you must have AWS or GCP onboarded into Defender for Cloud. As additional image types are being scanned, your bill might increase.

Learn more about [vulnerability assessment for containers](view-and-remediate-vulnerabilities-containers.md).

### Kubernetes node vulnerability assessment extended to EKS and GKE (Preview)

June 2, 2026

Defender for Cloud now extends Kubernetes node (host) vulnerability assessment to Amazon Elastic Kubernetes Service (EKS) and Google Kubernetes Engine (GKE), bringing parity with the existing Azure Kubernetes Service (AKS) capability.

This feature detects OS-level vulnerabilities in Kubernetes node VMs across EKS and GKE environments. When vulnerabilities are detected, Defender for Cloud surfaces an "Upgrade Kubernetes nodes" recommendation that identifies affected node pools and guides you to upgrade to a patched Kubernetes or node version. As additional image types are being scanned, your bill might increase. 

**Key details:**

- Covers Kubernetes host nodes (OS/infrastructure layer), not container workloads.
- Provides consistent visibility and unified remediation guidance across Azure, AWS, and GCP.

Requires AWS or GCP onboarded into Defender for Cloud with agentless scanning enabled.

Learn more about [Kubernetes node vulnerability assessment](kubernetes-nodes-va.md).

### General availability of Microsoft Defender for Open-Source Relational Databases on AWS RDS

June 1, 2026

Microsoft Defender for Open-Source Relational Databases is now generally available for Amazon Web Services Relational Database Service (AWS RDS) instances.

As of June 1, 2026, the plan bills for AWS RDS instances that were previously onboarded to the preview version of the feature. Usage starts to appear on your July 2026 bill.

You continue to receive database threat protection and sensitive data discovery for supported open-source relational databases, including Aurora PostgreSQL, Aurora MySQL, PostgreSQL, MySQL, and MariaDB on AWS RDS.

No action is required to maintain protection if you onboarded Open-Source Relational Databases on AWS RDS during the preview. The feature automatically transitioned to general availability.

To opt out and avoid future charges, disable Open-Source Relational Databases on the relevant AWS account.

Learn more about [Microsoft Defender for Open-Source Relational Databases](defender-for-databases-introduction.md) and how to [manage database protection plans](enable-defender-for-databases-aws.md).

### Container-level misconfiguration recommendations for Kubernetes (Preview)

June 1, 2026

Defender for Cloud now introduces agentless, container-level Kubernetes Security Posture Management (KSPM) misconfiguration recommendations, replacing the previous cluster-level findings with more granular, actionable insights integrated into Defender CSPM.

The new recommendations assess individual containers rather than entire clusters, covering areas such as CPU/memory limits, trusted registries, privilege escalation, sensitive host namespaces, read-only root filesystem, HTTPS-only access, automounting API credentials, Linux capabilities, privileged containers, and running as root.

**Key details:**

- Container-level and cluster-level recommendations may coexist temporarily during the transition period. Cluster-level recommendations will be deprecated at GA.
- The following cluster-level recommendations are set for deprecation: HostPath volume mount restrictions, allowed ports enforcement, host networking/ports restrictions, CAP_SYS_ADMIN capability restrictions, and AppArmor profile restrictions.
- No runtime agent required — uses agentless architecture.
- Includes scale controls for high-volume environments.

Learn more about [container security recommendations](recommendations-reference-container.md).

### New actionable recommendation to upgrade AKS for system pod vulnerabilities (Preview)

June 01, 2026

Defender for Cloud now provides a new, actionable recommendation, **Upgrade Azure Kubernetes Service Version (preview)** that helps you remediate vulnerabilities in AKS-managed system pods.

This replaces the previous non-actionable recommendation with a resolvable remediation path, helping teams focus on vulnerabilities they can directly remediate while maintaining clear visibility into cluster exposure.

Learn more about [reviewing and remediating Kubernetes node vulnerabilities](kubernetes-nodes-va.md) and [security recommendations for containers](recommendations-reference-container.md).

### Serverless protection for Azure and AWS is now generally available

June 1, 2026

Serverless protection for Azure and Amazon Web Services (AWS) is now generally available in Defender for Cloud.

This capability helps you discover serverless resources and assess them for misconfigurations, vulnerabilities, and insecure dependencies across Azure Web Apps, Azure Functions, and AWS Lambda.

Learn more about [What is Serverless protection?](serverless-protection.md), [Serverless protection recommendations](recommendations-reference-serverless-protection.md), and [cloud support availability](support-matrix-defender-for-cloud.md#cloud-support).

## May 2026

| Date | Category | Update |
| -------- | -------- | -------- |
| May 31, 2026 | Preview | [Private clusters protection for gated deployment, binary drift detection, and malware detection](#private-clusters-protection-for-gated-deployment-binary-drift-detection-and-malware-detection-preview) |
| May 31, 2026 | Preview | [Malware detection for EKS and GKE nodes](#malware-detection-for-eks-and-gke-nodes-preview) |
| May 26, 2026 | GA | [General availability of on-demand malware scanning of Azure Files in Microsoft Defender for Storage](#general-availability-of-on-demand-malware-scanning-of-azure-files-in-microsoft-defender-for-storage) |
| May 24, 2026 | Upcoming | [Microsoft Defender for Open-Source Relational Databases on AWS RDS will become Generally Available](#microsoft-defender-for-open-source-relational-databases-on-aws-rds-will-become-generally-available) |
| May 20, 2026 | Preview | [Cloud security reporting in Microsoft Defender portal (Preview)](#cloud-security-reporting-in-microsoft-defender-portal-preview) |
| May 19, 2026| Preview | [Scanning support for Docker Hardened container images (preview)](#scanning-support-for-docker-hardened-container-images-preview) |
| May 18, 2026 | GA | [Microsoft Defender Experts for Servers as a managed XDR option](#microsoft-defender-experts-for-servers-as-a-managed-xdr-option) |
| May 17, 2026 | Preview | [SQL Vulnerability Assessment Express Configuration now available for Azure SQL Managed Instance and Synapse (Preview)](#sql-vulnerability-assessment-express-configuration-now-available-for-azure-sql-managed-instance-and-synapse-preview) |
| May 6, 2026 | GA | [Updated Helm installation for Defender for Containers sensor](#updated-helm-installation-for-defender-for-containers-sensor) |
| May 5, 2026 | GA | [General availability of individual recommendations for Defender for Cloud in Azure portal and Deprecation of legacy grouped recommendations](#general-availability-of-individual-recommendations-for-defender-for-cloud-in-azure-portal-and-deprecation-of-legacy-grouped-recommendations) |
| May 5, 2026 | GA | [Daily score calculation enhancement for risk-based Cloud secure score](#daily-score-calculation-enhancement-for-risk-based-cloud-secure-score) |
| May 5, 2026 | GA | [General availability of of Defender for Cloud integration into the Defender portal](#general-availability-of-defender-for-cloud-integration-into-the-defender-portal) |
| May 3, 2026 | GA | [General availability of Microsoft Defender for Cloud and GitHub Advanced Security integration](#general-availability-of-microsoft-defender-for-cloud-and-github-advanced-security-integration) |

### Private clusters protection for gated deployment, binary drift detection, and malware detection (Preview)

May 31, 2026

Private clusters now support the Defender sensor for gated deployment, binary drift detection, and malware detection in preview.

This update extends Defender for Containers coverage to private cluster scenarios where you use the sensor-based features for container protection.

For private cluster installation instructions for the preview path, see [Deploy Defender for Containers to private clusters (Preview)](defender-for-containers-private-clusters.md).

For feature-level support details, see [access patterns and private cluster support for Defender for Containers features](defender-for-containers-feature-access-patterns.md).

### Malware detection for EKS and GKE nodes (Preview)

May 31, 2026

Malware detection is now in preview for Amazon Elastic Kubernetes Service (EKS) nodes and Google Kubernetes Engine (GKE) nodes.

This update expands Kubernetes node malware coverage beyond Azure Kubernetes Service (AKS) so you can detect malware in more multicloud environments.

For more information, see [Kubernetes nodes overview](kubernetes-nodes-overview.md) and [Review and remediate malware alerts for Kubernetes nodes](kubernetes-nodes-malware.md).

### General availability of on-demand malware scanning of Azure Files in Microsoft Defender for Storage

May 26, 2026

On-demand malware scanning of Azure Files in Microsoft Defender for Storage is now generally available.

This feature extends on-demand malware scanning so you can scan Azure Storage accounts that contain blobs and files.

You can start scans in the Azure portal or by using the REST API. You can also automate scans by using Azure Logic Apps, Azure Automation runbooks, and PowerShell scripts.

Learn more about [on-demand malware scanning](on-demand-malware-scanning.md).

### Microsoft Defender for Open-Source Relational Databases on AWS RDS will become Generally Available

May 24, 2026

Microsoft Defender for Open-Source Relational Databases will be generally available for Amazon Web Services Relational Database Service (AWS RDS) instances on **June 1, 2026**.

Starting June 1, 2026, the plan will begin billing for AWS RDS instances that are already onboarded to the preview of the feature. Usage will start to appear on your July 2026 bill. You continue to receive database threat protection and sensitive data discovery for supported open-source relational databases, including Aurora PostgreSQL/MySQL, PostgreSQL, MySQL, and MariaDB on AWS RDS.

No action is required to maintain protection if you onboarded Open-Source Relational Databases on AWS RDS in its preview stage as it will automatically transition to the GA state.

To **opt out** and avoid future charges, [disable Open-Source Relational Databases on the relevant AWS account](enable-defender-for-databases-aws.md#disable-the-plan) before June 1, 2026.

Learn more about [Microsoft Defender for Open-Source Relational Databases](defender-for-databases-introduction.md) and how to [manage database protection plans](enable-defender-for-databases-aws.md).

### Cloud security reporting in Microsoft Defender portal (Preview)

May 20, 2026

Microsoft Defender portal now includes integrated cloud security reporting capabilities, enabling you to create, customize, and share security insights across your organization.

With cloud security reporting, you can:

- View built-in reports such as **CNAPP Executive Summary** and **Cloud Posture** that provide predefined views of cloud security data
- Customize existing reports by duplicating and modifying sections, cards, and layout to match your specific needs
- Create custom reports from scratch by defining sections and selecting relevant cards
- Export reports to PDF for sharing with stakeholders and leadership
- Control report access using visibility settings (Private, Tenant-level access, or Public)
- Filter and organize reports by type and visibility

The **CNAPP Executive Summary** report provides a consolidated view of cloud-native application protection platform signals, including threat detection, secure score trends, vulnerability management, security recommendations, investigation & response activity, and regulatory compliance status.

The **Cloud Posture** report offers a centralized view of your overall cloud security posture, helping you assess security risk, track progress over time, and prioritize remediation efforts across environments and workloads.

To access cloud security reports, navigate to the **Reporting** page in the Microsoft Defender portal and select the **Cloud** tab.

Learn more about [Cloud security reporting in Microsoft Defender portal](cloud-security-reporting.md).

### Scanning support for Docker Hardened container images (preview)

May 19, 2026

Microsoft Defender for Cloud's vulnerability scanner, powered by Microsoft Defender Vulnerability Management, is extending its scanning coverage to Docker Hardened container images, and identify vulnerabilities in Docker Images to validate that they're shipping the most secure builds possible. 
As additional image types are being scanned, your bill might increase. The rollout of this change will occur gradually over several weeks and requires no user action.

For all supported distributions, see [Registries and images support for vulnerability assessment](support-matrix-defender-for-containers.md#registries-and-images-support-for-vulnerability-assessment).

### Microsoft Defender Experts for Servers as a managed XDR option

May 18, 2026

Defender for Cloud is now partnered with Microsoft Defender Experts, as a managed extended detection and response (XDR) service for server workloads.

Microsoft analysts and automation work together to detect, prioritize, and respond to threats on machines protected by Defender for Servers Plan 1 or Plan 2 across Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and on-premises environments. Defender Experts for Servers is sold separately and includes Defender Experts for Hunting and Ask Defender Experts.

Learn more about [Microsoft Defender Experts for Servers](defender-for-servers-overview.md#managed-detection-and-response-with-defender-experts-for-servers).

### SQL Vulnerability Assessment Express Configuration now available for Azure SQL Managed Instance and Synapse (Preview)

May 17, 2026

SQL Vulnerability Assessment (VA) Express Configuration is now available in preview for Azure SQL Managed Instance and Azure Synapse Analytics Workspaces. This Microsoft-managed storage tool for vulnerability baselines and scan results extends the same experience already available for Azure SQL Database at no extra cost.

With this release, customers using Azure SQL Managed Instances or Synapse Workspaces can now enable SQL VA without configuring a customer-managed storage account. Express Configuration is the recommended enablement mode and provides the same security value as Classic Configuration (customer-managed storage), with a simplified setup experience.

A new unified REST API provides a consistent management surface for SQL VA across Azure SQL Database, Azure SQL Managed Instance, Synapse Workspaces and SQL on machines (Azure VM and Arc enabled SQL).

Learn more about [SQL vulnerability assessment overview](sql-azure-vulnerability-assessment-overview.md) and how to [enable vulnerability assessment](sql-azure-vulnerability-assessment-enable.md).

### Updated Helm installation for Defender for Containers sensor
 
May 6, 2026
 
Defender for Containers sensor installation using Helm now uses direct Helm chart deployment instead of installation scripts. The updated flow includes environment-specific Helm commands for Azure Kubernetes Service (AKS), Amazon Elastic Kubernetes Service (EKS), and Google Kubernetes Engine (GKE) clusters.
 
Learn more about [installing the Defender for Containers sensor by using Helm](deploy-helm.md).

### General availability of individual recommendations for Defender for Cloud in Azure portal and deprecation of legacy grouped recommendations

May 5, 2026

Individual recommendations for Defender for Cloud that were previously represented as grouped recommendations are now generally available (GA) in the Azure portal.

**Azure portal secure score behavior:**

The classic secure score in the Azure portal is also affected by these individual recommendations. However, you shouldn't expect a material change in the overall score, as the individual recommendations replace their previously grouped equivalents and are designed to keep the score functionally stable.

**Deprecation notice: Legacy grouped recommendations**

Grouped recommendation types are deprecated from the Azure portal and will be removed on July 31, 2026. These recommendations are currently tagged as **Set for deprecation**.

For more information, see [security recommendations](review-security-recommendations.md).

### Daily score calculation enhancement for risk-based Cloud secure score

May 5, 2026

We've improved how daily Cloud secure score values are calculated to more accurately reflect your posture and the impact of actions taken throughout the day.

Daily scores represent end-of-day snapshots instead of averaged values over the course of the day, providing a more consistent and precise view of the score at each point in time. This helps you better understand score changes and correlate them with changes introduced during the day.

Historical values have been recalculated to align with this definition, so you may notice slight differences when comparing trends across this period.

For more information, see [Cloud secure score](secure-score-security-controls.md?pivots=defender-portal).

### General availability of Defender for Cloud integration into the Defender portal

May 5, 2026

Microsoft Defender for Cloud is now integrated into the Microsoft Defender portal, unifying cloud security posture management and threat protection in a single experience. This integration provides a centralized view across hybrid and multicloud environments, including Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

**Key capabilities:**

- A unified cloud security dashboard with posture insights, risk-based prioritization, and progress tracking
- A centralized cloud asset inventory with enriched risk, health, and coverage data
- Integrated posture management through Microsoft Security Exposure Management (MSEM), including secure score, recommendations, attack paths, and vulnerabilities
- A risk-based Cloud secure score for more accurate assessment and prioritization, including improved daily secure score calculations. Available only in the Defender portal
- A new recommendation model with individual findings for improved prioritization and governance (these individual recommendations might impact risk-based Cloud secure score calculations, as they now contribute to the score based on their granular, context-aware findings, rather than as part of a grouped recommendation)

> [!NOTE]
> Cloud scopes is still in preview.

This integration enables security teams to monitor, prioritize, and respond to risks across their entire environment from a single location.

For more information, see [Defender for Cloud in the Defender portal](defender-portal/defender-for-cloud-defender-portal.md)

### General availability of Microsoft Defender for Cloud and GitHub Advanced Security integration

May 3, 2026

The native integration between Microsoft Defender for Cloud and GitHub Advanced Security (GHAS) is now generally available. This integration connects runtime security signals from Defender for Cloud with code-level vulnerability management in GHAS, enabling developers and security teams to prioritize and remediate vulnerabilities based on actual production risk.

**Key capabilities:**

- **Runtime context in GitHub**: GHAS alerts are enriched with runtime risk factors from Defender for Cloud, including internet exposure, sensitive data access, and lateral movement potential.
- **AI-powered remediation**: GitHub Copilot Autofix provides validated, ready-to-merge security fixes with multi-fix bundling for efficiency.
- **Security campaigns**: Security teams can trigger targeted GitHub Security Campaigns from Defender for Cloud to mobilize developer teams on prioritized vulnerabilities.
- **Bidirectional sync**: GitHub issue status and ownership changes sync to Defender for Cloud within minutes.

**Prerequisites:**

- Defender Cloud Security Posture Management (DCSPM) plan
- GitHub account with connector configured in Defender for Cloud
- GitHub Advanced Security license on connected repositories

Learn more about [GitHub Advanced Security integration](github-advanced-security-overview.md) and how to [deploy the integration](github-advanced-security-deploy.md).

## April 2026

| Date | Category | Update |
| -------- | -------- | -------- |
| April 30, 2026 | GA | [Defender for Containers runtime protection on EKS Bottlerocket is now generally available](#defender-for-containers-runtime-protection-on-eks-bottlerocket-is-now-generally-available) |
| April 30, 2026 | GA | [Anti-malware detection and blocking is now generally available](#anti-malware-detection-and-blocking-is-now-generally-available) |
| April 30, 2026 | GA | [DNS Detection for Kubernetes is now generally available](#dns-detection-for-kubernetes-is-now-generally-available) |
| April 20, 2026 | GA | [General availability of Defender for Storage integration in Azure portal Storage Center](#general-availability-of-defender-for-storage-integration-in-azure-portal-storage-center) |
| April 1, 2026 | GA | [General availability of container security capabilities in Azure Government cloud](#general-availability-of-container-security-capabilities-in-azure-government-cloud) |
| April 1, 2026 | Update | [Update to Defender for SQL servers on machines plan for Fairfax customers](#update-to-defender-for-sql-servers-on-machines-plan-for-fairfax-customers) |

### Defender for Containers runtime protection on EKS Bottlerocket is now generally available

April 30, 2026

Defender for Containers runtime protection now supports AWS Bottlerocket operating systems on Amazon Elastic Kubernetes Service (EKS) in general availability.

Learn more about [Defender for Containers runtime protection](support-matrix-defender-for-containers.md#runtime-protection-features).

### Anti-malware detection and blocking is now generally available

April 30, 2026

Container runtime anti-malware detection and blocking is now generally available in Defender for Containers for Azure Kubernetes Service (AKS), Amazon Elastic Kubernetes Service (EKS), and Google Kubernetes Engine (GKE).

Anti-malware detection and blocking detects and blocks malware when a container runs an executable that the system identifies as malicious software. You can define anti-malware policies that set conditions for alerts and blocking to distinguish legitimate activity from potential threats.

Learn more about [anti-malware detection and blocking](anti-malware.md).

### DNS Detection for Kubernetes is now generally available

April 30, 2026

DNS Detection for Kubernetes is now generally available in Defender for Containers for Azure Kubernetes Service (AKS), Amazon Elastic Kubernetes Service (EKS), and Google Kubernetes Engine (GKE).

DNS Detection monitors DNS queries from containerized workloads to detect suspicious activity such as communication with malicious domains and DNS tunneling. The feature requires the Defender sensor deployed via Helm.

Learn more about [DNS Detection availability in Defender for Containers](support-matrix-defender-for-containers.md#runtime-protection-features).


### General availability of Defender for Storage integration in Azure portal Storage Center

April 20, 2026

This integration brings Defender for Storage insights directly into the native storage management experience. This approach makes it easier for customers to understand and improve their storage security posture at scale.

Customers can now view Defender for Storage threat protection and security posture coverage directly in Storage Center, next to their storage resources.

Storage Center provides a centralized, storage-native view of Defender for Storage protection status. This view helps customers quickly understand:

1. Which storage accounts are protected, partly protected, or not protected
2. Where malware scanning, activity monitoring, and sensitive data discovery are enabled
3. Where security gaps exist across Azure Blob Storage and Azure Files storage

Learn more about [Azure storage](/azure/storage/blobs/storage-blobs-overview).

### General availability of container security capabilities in Azure Government cloud

April 1, 2026

The service helps U.S. federal and government agencies, including the Department of Defense (DoD) and civilian agencies, secure Kubernetes workloads by providing cloud security posture management, vulnerability assessment, and runtime threat protection for containerized environments.

The Defender for Containers plan in Azure Government cloud now aligns with the commercial cloud offering in feature coverage, including agentless Kubernetes discovery, comprehensive inventory, attack path analysis, enhanced risk hunting, vulnerability assessment, compliance and runtime protection capabilities.

For more information about Microsoft Defender for Containers, see [Overview of Microsoft Defender for Containers](/azure/defender-for-cloud/defender-for-containers-introduction).

For more information about feature and cloud availability, see [Containers support matrix in Defender for Cloud](/azure/defender-for-cloud/support-matrix-defender-for-containers).

### Update to Defender for SQL servers on machines plan for Fairfax customers

April 1, 2026

The Defender for SQL Server on machines plan in Microsoft Defender for Cloud protects SQL Server instances hosted on Azure, AWS, GCP, and on-premises machines.

To simplify onboarding and improve protection coverage, we're releasing an enhanced agent solution for Fairfax customers at the end of April. The new solution uses the existing SQL infrastructure, so you no longer need to deploy the Azure Monitor Agent (AMA).

**Required customer actions:**

- [Update Defender for SQL Servers on Machines plan configuration](update-sql-machine-configuration.md): If you enabled the Defender for SQL Server on machines plan before April 2026, follow these instructions to update your configuration.
- [Verify SQL Server instances protection status](verify-machine-protection.md): With an estimated starting date of May 2026, you must verify the protection status of your SQL Server instances across your environments. Learn how to [troubleshoot deployment issues for Defender for SQL on machines configuration](troubleshoot-sql-machines-guide.md).

## March 2026

| Date | Category | Update |
| -------- | -------- | -------- |
| March 31, 2026 | GA | [Malware automated remediation in Defender for Storage](#automated-malware-remediation-in-defender-for-storage)|
| March 31, 2026| Update | [Support for additional Azure regions for Defender for APIs and API security posture management with Defender CSPM](#support-for-additional-azure-regions-for-defender-for-apis-and-api-security-posture-management-with-defender-cspm) |
| March 30, 2026 | Preview | [AI model security for Azure Machine Learning (Preview)](#ai-model-security-for-azure-machine-learning-preview) |
| March 29, 2026 | Preview | [Expanded multicloud coverage for AWS and GCP (Preview)](#expanded-multicloud-coverage-for-aws-and-gcp-preview) |
| March 22, 2026| Update | [File Integrity Monitoring requires MDE agent version 10.8799+ for legacy Windows machines](#file-integrity-monitoring-requires-mde-agent-version-108799-for-legacy-windows-machines) |
| March 12, 2026 | GA | [Kubernetes gated deployment support for AKS Automatic (GA)](#kubernetes-gated-deployment-support-for-aks-automatic-ga) |
| March 11, 2026 | GA| [Severity‑based risk assignment for "Not evaluated" recommendations](#severity-based-risk-assignment-for-not-evaluated-recommendations) |
| March 10, 2026| Preview |[Code to runtime enrichment for recommendations](#code-to-runtime-enrichment-for-recommendations-preview)|
| March 10, 2026 | Preview | [On-demand malware scanning of Azure Files in Microsoft Defender for Storage](#on-demand-malware-scanning-of-azure-files-in-microsoft-defender-for-storage-preview) |
| March 04, 2026 | Deprecation | [Deprecation of preview of container and container images vulnerability recommendations](#deprecation-of-preview-of-container-and-container-images-vulnerability-recommendations) |
| March 04, 2026 | Preview |[New individual recommendations format in Azure portal (Preview)](#new-individual-recommendations-format-in-azure-portal-preview)|

### Automated malware remediation in Defender for Storage

March 31, 2026

Automated malware remediation in Defender for Storage is now generally available.

Defender for Cloud now lets you automatically soft-delete malicious blobs detected during on-upload or on-demand malware scanning. Soft-deleted blobs are quarantined and can be recovered for further investigation.

You can enable or disable automated malware remediation at the subscription or storage account level in Microsoft Defender for Cloud in the Azure portal or through the API.

Learn how to use [built-in automated malware remediation for malicious blobs](defender-for-storage-configure-malware-scan.md#built-in-automated-malware-remediation-for-malicious-blobs).

### Support for additional Azure regions for Defender for APIs and API security posture management with Defender CSPM

March 31, 2026

Microsoft Defender for APIs and API security posture management with Defender CSPM has expanded to provide its capabilities in the following Azure regions:

- Sweden Central
- Sweden South
- Germany West Central
- Germany North
- Italy North
- France Central
- France South
- Norway East
- Norway West
- Switzerland North
- Switzerland West
- Korea Central
- Korea South
- South Africa North
- South Africa West

Customers who have Azure API Management services in these regions can now use the capabilities offered by Microsoft Defender for APIs and API security posture management with Defender CSPM. API discovery and security posture capabilities in Defender CSPM for Azure Function Apps and Azure Logic Apps have also been expanded to these regions. This feature is still in preview.

Learn more about [Microsoft Defender for APIs](defender-for-apis-introduction.md) and [API security posture management with Defender CSPM](api-security-posture-overview.md).

### AI model security for Azure Machine Learning (Preview)

March 30, 2026

Microsoft Defender for Cloud now offers AI model security in preview for Azure Machine Learning registries and workspaces. AI model security helps security teams discover and scan custom AI models for risks before deployment, and review findings in Defender for Cloud.

By using AI model security, you can:

- Discover AI models in Azure Machine Learning registries and workspaces
- Scan supported model artifacts for malware and unsafe operators
- Review security findings and remediate surfaced issues in Defender for Cloud
- Perform CLI-based scanning for CI/CD integrations

Learn more about [AI model security](ai-model-security.md).

### Expanded multicloud coverage for AWS and GCP (Preview)

March 29, 2026

Microsoft Defender for Cloud expands multicloud posture management with broader native coverage for AWS and GCP. This update adds discovery and posture assessment for additional resource types across compute, databases, storage, analytics, networking, identity, secrets, DevOps, and AI/ML services.

**Asset inventory** – Newly supported AWS and GCP resources are now discovered and visible in the Asset inventory experience.

**Security recommendations** – Approximately 150 new recommendations help identify misconfigurations and posture gaps across the newly supported resources.

> [!IMPORTANT]
>
> - Compliance results may change as new recommendations are evaluated. This reflects expanded coverage, not a regression in security posture.
> - Secure score isn't affected by recommendations in preview.
> - In the Azure portal, only assets that have security issues detected on them are reflected.
> - In the Defender portal, all discovered resources in customers' environments are reflected, even if there are no security issues detected on them.

Learn more about [security recommendations](review-security-recommendations.md).
  
### File Integrity Monitoring requires MDE agent version 10.8799+ for legacy Windows machines

Due to a pipeline change in Microsoft Defender for Endpoint (MDE), File Integrity Monitoring now requires the **Defender for Servers Windows client (Microsoft Defender for Endpoint agent) version 10.8799 or above** for proper functionality on legacy Windows machines (downlevel clients).

**Key details:**

- **Affected systems**: Legacy Windows machines (Windows Server 2016, Windows Server 2012 R2, and other downlevel clients)
- **Required version**: Defender for Servers Windows client (MDE agent) 10.8799 or later
- **Impact**: FIM monitoring won't function properly on versions below the minimum requirement

Learn more about [File Integrity Monitoring](file-integrity-monitoring-overview.md) and how to [enable File Integrity Monitoring](file-integrity-monitoring-enable-defender-endpoint.md).

### Kubernetes gated deployment support for AKS Automatic (GA)

March 12, 2026

Kubernetes gated deployment is now generally available for AKS Automatic clusters.

To use this capability, install the Defender for Containers sensor by using Helm in the `kube-system` namespace. If the sensor is currently installed through the AKS add-on, the Helm installation script disables the add-on and redeploys the sensor using Helm.

The [Helm installation scripts](deploy-helm.md) were updated to support deploying the sensor to the `kube-system` namespace on AKS Automatic clusters.

### Severity-based risk assignment for "Not evaluated" recommendations

March 11, 2026

Recommendations that previously appeared as **Not evaluated** will now receive a risk level derived from the recommendation severity. As a result, these recommendations will now be prioritized in the recommendations list based on their assigned risk level.

This change may affect the overall status of recommendations and will also impact Secure Score, as previously recommendations that weren't evaluated are now included in risk calculations.

For customers without Defender CSPM enabled, this update removes the **Not evaluated** risk state and replaces it with severity‑based risk.

To benefit from full contextual, environment-aware risk evaluation, Defender CSPM must be enabled on the subscription.

For more information, see [Security recommendations](security-recommendations.md).

### Code to runtime enrichment for recommendations (Preview)

March 10, 2026

Microsoft Defender for Cloud now provides Code to runtime capabilities, enabling end-to-end visibility across the software development lifecycle (SDLC). This feature helps security teams trace runtime security issues back to their source code origins and understand the full blast radius of vulnerabilities.

**Key capabilities:**

- **SDLC Chain Visibility**: Track security issues from source code through pipelines, registries, to runtime environments
- **Blast Radius Analysis**: Understand how many assets are affected by a single code change
- **Runtime-to-Source Tracing**: Navigate backwards from runtime recommendations to identify the original source of security issues
- **Actionable Remediation**: Fix issues at the source to prevent recurring regressions rather than addressing only runtime symptoms

Learn more about the [Map container images from code to runtime prerequisites](container-image-mapping.md).
Learn more about [Code to runtime enrichment for recommendations](code-to-runtime-mapping.md).

### On-demand malware scanning of Azure Files in Microsoft Defender for Storage (Preview)

March 10, 2026

On-demand malware scanning for Azure Files in Microsoft Defender for Storage is now in preview. This preview extends the existing on-demand malware scan feature and lets you scan entire Azure Storage accounts that contain blobs and files.

You can start scans in the Azure portal UI or with the Representational State Transfer (REST) application programming interface (API). You can also automate scans with Azure Logic Apps, Azure Automation playbooks, and PowerShell scripts.

This feature uses Microsoft Defender Antivirus and applies the latest malware definitions for each scan. It also shows an upfront cost estimate in the Azure portal before you start a scan.

For more information, see [On-demand malware scanning](on-demand-malware-scanning.md).

### Deprecation of preview of container and container images vulnerability recommendations

March 04, 2026

As part of the transition to individual recommendations, Microsoft Defender for Cloud is deprecating existing grouped container vulnerability recommendations. This change enables more granular visibility, prioritization, and governance of container security findings.

Grouped recommendations previously aggregated multiple findings under a single recommendation. These findings are now surfaced as individual recommendations, created per software update, vulnerability, secret, or issue type.

During the transition period, grouped and individual recommendations may appear side by side. Grouped recommendations are on a deprecation path and will be removed in phases.

The following grouped container vulnerability recommendations will be deprecated on April 13, 2026:

**Container recommendations**

- [Preview] Containers running in Azure should have vulnerability findings resolved
- [Preview] Containers running in AWS should have vulnerability findings resolved
- [Preview] Containers running in GCP should have vulnerability findings resolved

**Container image recommendations**

- [Preview] Container images in Azure registry should have vulnerability findings resolved
- [Preview] Container images in AWS registry should have vulnerability findings resolved
- [Preview] Container images in GCP registry should have vulnerability findings resolved

Customers should update any queries, automation, governance rules, or workflows that rely on grouped recommendation keys to use individual recommendations and security categories instead.

When querying individual recommendations, the same logic can be applied across cloud providers by adjusting the `Source` value.

**Example: Container vulnerability recommendations**

The following query allows customers to identify the new individual container vulnerability recommendations for containers running in Azure. To target containers running in AWS or GCP, change the `Source` value to `"AWS"` or `"GCP"`.

```kusto
securityresources
| where type == "microsoft.security/assessments"
| where properties.metadata.recommendationCategory == "SoftwareUpdate"
| where properties.resourceDetails.ResourceType == "K8s-container"
| where properties.resourceDetails.Source == "Azure"
```

**Example: Container image vulnerability recommendations**

The following query allows customers to identify the new individual container image vulnerability recommendations in Azure container registries. To target AWS or GCP registries, update the `Source` value accordingly.

```kusto
securityresources
| where type == "microsoft.security/assessments"
| where properties.metadata.recommendationCategory == "SoftwareUpdate"
| where properties.resourceDetails.ResourceType == ".containerimage"
| where properties.resourceDetails.Source == "Azure"
```

Learn more about [security recommendations](review-security-recommendations.md) and [New individual recommendations format in Azure portal (Preview)](#new-individual-recommendations-format-in-azure-portal-preview).

### New individual recommendations format in Azure portal (Preview)

March 04, 2026

Microsoft Defender for Cloud is converting grouped recommendations into individual recommendations in the Azure portal. This change reflects a shift from grouping related findings under one recommendation to listing each recommendation separately.

**What's changing**

You might see a longer list of recommendations than before. Combined findings (such as vulnerabilities, exposed secrets, or misconfigurations) now show as individual recommendations rather than nested under a parent recommendation.

The grouped recommendations will still show side by side with the new format for now, but they will be deprecated in several months.

The new individual recommendations are marked as **Preview** with additional **New version** tag. These tags indicate that the recommendation is in an early state and doesn't affect Secure Score yet, as well as allowing you to filter the recommendations by it.

You can now manage exemptions at scale instead of for each recommendation.

**Benefits**

1. **Smart and accurate prioritization**

   Each finding (such as vulnerabilities, exposed secrets, or misconfigurations) is now scored and prioritized individually, so you can focus on what actually reduces risk fastest.

2. **Actionable context per finding**

   Each recommendation gives clear risk context and remediation guidance, making it easier to understand what's wrong, why it matters, and how to fix it.

3. **Better governance & tracking**

   You apply targeted exemptions and measure security progress accurately.

> [!NOTE]
> The grouped recommendations still appear side by side with the new format for now, but they will be deprecated in several months.

> [!IMPORTANT]
> To support the transition, learn more about best practices for [transitioning from grouped to individual recommendations](transition-grouped-individual-recommendations.md).

Learn more about [reviewing security recommendations](review-security-recommendations.md).

## February 2026

| Date | Category | Update |
| -------- | -------- | -------- |
| February 22, 2026 | Preview | [Container runtime anti-malware detection and blocking (Preview)](#container-runtime-anti-malware-detection-and-blocking-preview)
| February 22, 2026 | Update - Preview | [Binary drift now supports blocking (Preview)](#binary-drift-now-supports-blocking-preview) |
| February 10, 2026| Preview | [Database-level recommendations experience for SQL Vulnerability Assessment findings (Preview)](#database-level-recommendations-experience-for-sql-vulnerability-assessment-preview) |
| February 10, 2026| GA | [Scanning support for Minimus and Photon OS container images](#scanning-support-for-minimus-and-photon-os-container-images) |
| February 9, 2026| GA | [Simulate alerts for SQL servers on machines](#simulate-alerts-for-sql-servers-on-machines) |
| February 3, 2026| Preview | [Threat protection for AI agents (Preview)](#threat-protection-for-ai-agents-preview) |
|February 2, 2026| GA | [Updated CIEM recommendation logic](#updated-ciem-recommendation-logic) |
|February 2, 2026| Preview | [Threat protection for AI agents (Preview)](#threat-protection-for-ai-agents-preview) |

### Container runtime anti-malware detection and blocking (Preview)

February 22, 2026

Microsoft Defender for Cloud is announcing container runtime anti-malware detection and prevention in preview. This feature provides real-time detection and prevention of malware in containerized workloads across Azure Kubernetes Service (AKS), Amazon Elastic Kubernetes Service (EKS), and Google Kubernetes Engine (GKE) environments. With this release, you can create anti-malware rules to define conditions for generating alerts and blocking malware, helping you protect your clusters from threats while minimizing false positives.

Learn more about [anti-malware detection and blocking](anti-malware.md).

### Binary drift now supports blocking (Preview)

February 22, 2026

Binary drift now supports blocking in preview. With this update, you can configure binary drift policies to not only detect but also block unauthorized changes to container images at runtime. This enhancement helps prevent potential security breaches by stopping the execution of binaries within the containers that have been tampered with or contain unexpected modifications, providing an additional layer of protection for your containerized workloads.

Learn more about [binary drift detection and blocking](binary-drift-detection.md).

### Database-level recommendations experience for SQL Vulnerability Assessment (Preview)

February 10, 2026

Microsoft Defender for SQL is introducing a database-level recommendations experience for SQL Vulnerability Assessment in preview.

This update applies to SQL VA across all supported database types (PaaS and IaaS), including both Express and Classic configurations, and is available in the following portal experiences:

- [Azure portal](sql-azure-vulnerability-assessment-find.md#review-and-remediate-vulnerabilities-azure-portal)
- [Defender portal](sql-azure-vulnerability-assessment-find.md#review-and-remediate-vulnerabilities-defender-portal)

In this experience, each SQL Vulnerability Assessment rule generates a separate assessment for each affected database. Assessments are displayed and managed as recommendations in the Defender for Cloud **Recommendations** page.

In the previous model, findings were aggregated at the server or instance level and surfaced under these recommendations:

- SQL databases should have vulnerability findings resolved
- SQL servers on machines should have vulnerability findings resolved

The database-level experience keeps the same security capabilities and doesn’t affect SQL VA scanning logic, rules, queries, scan schedules, APIs, or pricing. It only provides another way to consume and manage findings that's consistent with all Defender for Cloud recommendations.

During preview, the new database-level assessments don’t affect Secure Score in the Azure portal but do contribute to Secure Score in the Defender portal.

The SQL [vulnerability assessment rules reference](sql-azure-vulnerability-assessment-rules.md) has been updated to include the new database-level recommendation names and assessment identifiers.

The existing server-level (aggregated) experience remains available during preview.

### Scanning support for Minimus and Photon OS container images

February 10, 2026

Microsoft Defender for Cloud's vulnerability scanner, powered by Microsoft Defender Vulnerability Management, is extending its scanning coverage to Minimus and Photon OS container images to help validate that they're shipping the most secure builds possible. As additional image types are scanned, your bill might increase. For all supported distributions, see [Registries and images support for vulnerability assessment](support-matrix-defender-for-containers.md#registries-and-images-support-for-vulnerability-assessment).

### Simulate alerts for SQL servers on machines

February 9, 2026

Microsoft Defender for Cloud’s SQL simulated alerts is now generally available. Simulated alerts let security teams safely validate SQL protection, detections, and automated response workflows without introducing real risk.

Simulated alerts generate realistic alerts with full SQL and machine context on Azure VMs or Arc-connected machines, enabling end-to-end testing of playbooks and SOC readiness. All alerts are produced locally using a safe script extension, with no external payloads or impact to production resources.

Learn how to [simulate alerts for SQL servers on machines](simulate-alerts-sql-machines.md).

### Updated CIEM recommendation logic  

February 2, 2026

Cloud Infrastructure Entitlement Management (CIEM) recommendations are now available as a native capability in Microsoft Defender for Cloud across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

This update changes how inactive identities and over-permissioned roles are evaluated and improves recommendation accuracy. It may affect existing recommendation results.

#### Key changes

- Inactive identity detection now evaluates unused role assignments instead of sign-in activity.
- The inactivity lookback window is extended to 90 days (previously 45 days).
- Identities created within the past 90 days aren’t evaluated as inactive.
- The Permissions Creep Index (PCI) metric is deprecated and no longer appears in recommendations.
- CIEM onboarding no longer requires elevated high-risk permissions.

#### Cloud-specific considerations

| Cloud | Details |
|--------|---------|
| **Azure** | Inactive identity recommendations include evaluation of read-level permissions. |
| **AWS** | CIEM evaluates AWS users and roles whose permissions can be reliably assessed. SAML and SSO identities require [AWS CloudTrail Logs (Preview)](integrate-cloud-trail.md) to be enabled in the Defender CSPM plan. Serverless and compute identities are excluded from CIEM inactivity evaluation, which might affect recommendation counts. |
| **GCP** | CIEM evaluation requires [Cloud Logging ingestion (Preview)](logging-ingestion.md) to be enabled in the Defender CSPM plan. |

Learn more about [permissions management in Defender for Cloud](permissions-management.md).

### Threat protection for AI agents (Preview)

February 2, 2026

Microsoft Defender for Cloud now includes threat protection for AI agents built with Foundry, available in preview as part of the Defender for AI Services plan. This new capability delivers advanced security from development through runtime, addressing high-impact, actionable threats aligned with OWASP guidance for LLM and agentic AI systems.

This release further expands Defender's AI threat protection coverage, helping organizations secure a broader range of AI platforms.

Learn more about [Threat Protection for AI Agents with Microsoft Defender for Cloud](/azure/defender-for-cloud/alerts-ai-workloads).  

## January 2026

|Date | Category | Update|
| -------- | -------- | -------- |
|January 8, 2026| Preview | [Microsoft Security Private Link (Preview)](#microsoft-security-private-link-preview) |

### Microsoft Security Private Link (Preview)

January 8, 2026

Microsoft Defender for Cloud is announcing Microsoft Security Private Link in Preview.

Microsoft Security Private Link enables private connectivity between Defender for Cloud and your workloads. The connection is established by creating private endpoints in your virtual network, allowing Defender for Cloud traffic to remain on the Microsoft backbone network and avoid exposure to the public internet.

Private endpoints are currently supported for the Defender for Containers plan.

Learn more about [Microsoft Security Private Link for Microsoft Defender for Cloud](concept-private-links.md).

## Next steps

Check [What's new in security recommendations and alerts](release-notes-recommendations-alerts.md).
