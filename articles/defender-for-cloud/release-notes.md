---
title: What's new in Microsoft Defender for Cloud features
description: What's new and updated in Microsoft Defender for Cloud features
ms.topic: overview
ms.date: 05/07/2025
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

On-upload malware scanning now supports customizable filters. Users can set exclusion rules for on-upload malware scans based on blob path prefixes, suffixes as well as by blob size. By excluding specific blob paths and types, such as logs or temporary files, you can avoid unnecessary scans and reduce costs.

Learn how to [configure customizable on-upload malware scanning filters](/azure/defender-for-cloud/on-upload-malware-scanning).


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

Note: Existing connectors will continue to work without the new functionality if the above action is not taken.

### Update to Defender for SQL servers on Machines plan

April 28, 2025

The Defender for SQL Server on machines plan in Microsoft Defender for Cloud protects SQL Server instances hosted on Azure, AWS, GCP, and on-premises machines.

Starting today, we're gradually releasing an enhanced agent solution for the plan. The agent-based solution eliminates the need to deploy the Azure Monitor Agent (AMA) and instead uses the existing SQL infrastructure. The solution is designed to make the onboarding processes easier and improve protection coverage.

**Required customer actions**

1. [Update Defender for SQL Servers on Machines plan configuration](update-sql-machine-configuration.md): Customers who enabled Defender for SQL Server on machines plan before today are required to follow these instructions to update their configuration, following the enhanced agent release.

1. [Verify SQL Server instances protection status](verify-machine-protection.md): With an estimated starting date of May 2025, customers must verify the protection status of their SQL Server instances across their environments. Learn how to [troubleshoot any deployment issues Defender for SQL on machines configuration](troubleshoot-sql-machines-guide.md).

> [!NOTE]
> After the agent upgrade occurs, you might experience a billing increase if additional SQL Server instances are protected with your enabled Defender for SQL Servers on Machines plan. For billing information, review the 
[Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

### New default cap for on-upload malware scanning in Microsoft Defender for Storage

April 27, 2025

The default cap value for on-upload malware scanning has been updated from 5,000GB to 10,000GB. This new cap applies to the following scenarios:

- **New Subscriptions:** Subscriptions where Defender for Storage is enabled for the first time.

- **Re-enabled Subscriptions:** Subscriptions where Defender for Storage was previously disabled and is now re-enabled.

When Defender for Storage Malware Scanning is enabled for these subscriptions, the default cap for on-upload malware scanning will be set to 10,000GB. This cap is adjustable to meet your specific needs.

For more detailed information, please refer to the section on [Malware scanning - billing per GB, monthly capping, and configuration](/azure/defender-for-cloud/defender-for-storage-introduction)

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
Providing security protection for these Kubernetes nodes allow customers to maintain security and compliance across the managed Kubernetes service, as well as understand their part in the shared security responsibility they have with the managed cloud provider.
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

On-upload malware scanning now supports customizable filters. Users can set exclusion rules for on-upload malware scans based on blob path prefixes, suffixes as well as by blob size. By excluding specific blob paths and types, such as logs or temporary files, you can avoid unnecessary scans and reduce costs.

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

This improved FIM experience replaces the existing one that set for deprecation with the Log Analytics Agent (MMA) retirement. The [FIM experience over MMA](/azure/defender-for-cloud/file-integrity-monitoring-enable-log-analytics) will remain supported in Azure Government until the end of March 2023.

With this release, an in-product experience will be released to allow you to migrate your FIM configuration over MMA to the new FIM over Defender for Endpoint version.

For information on how to enable FIM over Defender for Endpoint, see [File Integrity Monitoring using Microsoft Defender for Endpoint](/azure/defender-for-cloud/file-integrity-monitoring-enable-defender-endpoint). For information on how to disable previous versions and use the migration tool, see [Migrate File Integrity Monitoring from previous versions](/azure/defender-for-cloud/migrate-file-integrity-monitoring).

> [!IMPORTANT]
> The availability of File Integrity Monitoring in Azure China 21Vianet and in GCCM clouds is not currently planned to be supported.
> 

## February 2025

|Date | Category | Update|
|--|--|--|
| February 27 | Change |[Improved AWS EC2 Resource Name display](#improved-aws-ec2-resource-name-display)|
| February 27 | GA | [On-demand malware scanning in Microsoft Defender for Storage](#on-demand-malware-scanning-in-microsoft-defender-for-storage) |
| February 27 | GA | [Defender for Storage malware scanning for blobs up to 50 GB](#defender-for-storage-malware-scanning-for-blobs-up-to-50-gb) |
| February 23 | Preview | [Container registry agnostic agentless vulnerability assessment for AKS runtime containers (Preview)](#container-registry-agnostic-agentless-vulnerability-assessment-for-aks-runtime-containers-preview) |
| February 23 | Preview | [Data and AI security dashboard (Preview)](#data-and-ai-security-dashboard-preview) |
| February 19 | Preview | [MDC Cost Calculator (Preview)](#mdc-cost-calculator-preview) |
| February 19 | Preview | [31 new and enhanced multicloud regulatory standards coverage](#31-new-and-enhanced-multicloud-regulatory-standards-coverage) |

### Improved AWS EC2 Resource Name display

February 27, 2025

**Estimated date for change:** March 2025

We're enhancing how resource names are shown for AWS EC2 instances in our platform. If an EC2 instance has a "name" tag defined, the *Resource Name* field will now display the value of that tag. If no "name" tag is present, the *Resource Name* field will continue to show the *instance ID* as before. The *Resource ID* will still be available in the *Resource ID* field for reference.

Using the EC2 "name" tag lets you easily identify your resources with custom, meaningful names instead of IDs. This makes it quicker to locate and manage specific instances, reducing the time and effort spent searching or cross-referencing instance details.

### On-demand malware scanning in Microsoft Defender for Storage 

February 27, 2025

On-demand malware scanning in Microsoft Defender for Storage, now in GA, enables scanning of existing blobs in Azure Storage accounts whenever needed. Scans can be initiated from the Azure portal UI or via the REST API, supporting automation through Logic Apps, Automation playbooks, and PowerShell scripts. This feature uses Microsoft Defender Antivirus with the latest malware definitions for every scan and provides upfront cost estimation in the Azure portal before scanning.

Use cases:

- **Incident response**: Scan specific storage accounts after detecting suspicious activity.
- **Security baseline**: Scan all stored data when first enabling Defender for Storage.
- **Compliance**: Set automation to schedule scans that help meet regulatory and data protection standards.

For more information, see [On-demand malware scanning](on-demand-malware-scanning.md).

### Defender for Storage malware scanning for blobs up to 50 GB

February 27, 2025

Defender for Storage malware scanning now supports blobs up to 50GB in size (previously limited to 2GB).

Please note that for storage accounts where large blobs are uploaded, the increased blob size limit will result in higher monthly charges.

To avoid unexpected high charges, you may want to set an appropriate cap on the total GB scanned per month. For more information, see [Cost control for on-upload malware scanning](on-upload-malware-scanning.md).

### Container registry agnostic agentless vulnerability assessment for AKS runtime containers (Preview)

February 23, 2025

Defender for Containers and Defender for Cloud Security Posture Management (CSPM) plans, now include container registry agnostic agentless vulnerability assessment for AKS runtime containers. This enhancement extends vulnerability assessment coverage to include running containers with images from any registry (not restricted to supported registries), in addition to scanning Kubernetes add-ons and third party tools running in your AKS clusters. To enable this feature, make sure that **Agentless machine scanning** is enabled for your subscription in the Defender for Cloud environment settings.

### Data and AI security dashboard (Preview)

February 23, 2025

Defender for Cloud is enhancing the Data security dashboard to include AI Security with the new Data and AI security dashboard in Preview. The dashboard provides a centralized platform to monitor and manage data and AI resources, along with their associated risks and protection status.

Key Benefits of the Data and AI security dashboard include:

- **Unified view**: Gain a comprehensive view of all organizational data and AI resources.
- **Data insights**: Understand where your data is stored and the types of resources holding it.
- **Protection coverage**: Assess the protection coverage of your data and AI resources.
- **Critical issues**: Highlight resources that require immediate attention based on high-severity recommendations, alerts, and attack paths.
- **Sensitive data discovery**: Locate and summarize sensitive data resources in your cloud and AI assets.
- **AI workloads**: Discover AI application footprints, including services, containers, data sets, and models.

Learn more about the [Data and AI security dashboard](data-aware-security-dashboard-overview.md).

### MDC Cost Calculator (Preview)

February 19, 2025

We're excited to introduce our new [MDC Cost Calculator](https://portal.azure.com/#view/Microsoft_Azure_Security/CostEstimator.ReactView) to help you easily estimate the costs associated with protecting your cloud environments. This tool is tailored to provide you with a clear and accurate understanding of your expenses, ensuring you can plan and budget effectively.

**Why Use the Cost Calculator?**

Our cost calculator simplifies the process of estimating costs by allowing you to define the scope of your protection needs. You select the environments and plans you want to enable, and the calculator automatically fills in the billable resources for each plan, including any applicable discounts. You're given a comprehensive view of your potential costs without any surprises.

**Key Features:**

***Scope Definition:*** Select the plans and environments that interest you. The calculator performs a discovery process to automatically populate the number of billable units for each plan per environment.

***Automatic and Manual Adjustments:*** The tool allows for both automatic collection of data and manual adjustments. You can modify the unit quantity and discount levels to see how changes affect the overall cost.

***Comprehensive Cost Estimation:*** The calculator provides an estimate for each plan and a total cost report. You're provided a detailed breakdown of costs, making it easier to understand and manage your expenses.

***Multicloud Support:*** Our solution works for all supported clouds, ensuring that you get accurate cost estimations regardless of your cloud provider.

***Export and Share:*** Once you have your cost estimate, you can easily export and share it for budget planning and approvals.

### 31 new and enhanced multicloud regulatory standards coverage

February 19, 2025

We are excited to announce the enhanced and expanded support of over 31 security and regulatory frameworks in Defender for Cloud across Azure, AWS & GCP. This enhancement simplifies the path to achieving and maintaining compliance, reduces the risk of data breaches, and helps avoid fines and reputational damage.

**The new and enhanced frameworks are**:

|Standards|Clouds|
| -------- | -------- |
|EU 2022 2555 (NIS2) 2022  |Azure, AWS, GCP|
|EU General Data Protection Regulation (GDPR) 2016 679  |Azure, AWS, GCP|
|NIST CSF v2.0  |Azure, AWS, GCP|
|NIST 800 171 Rev3  |Azure, AWS, GCP|
|NIST SP 800 53 R5.1.1  |Azure, AWS, GCP|
|PCI DSS v4.0.1  |Azure, AWS, GCP|
|CIS AWS Foundations v3.0.0  |AWS|
|CIS Azure Foundations v2.1.0  |Azure|
|CIS Controls v8.1  |Azure, AWS, GCP|
|CIS GCP Foundations v3.0  |GCP|
|HITRUST CSF v11.3.0  |Azure, AWS, GCP|
|SOC 2023  |Azure, AWS, GCP|
|SWIFT Customer Security Controls Framework 2024  |Azure, AWS, GCP|
|ISO IEC 27001:2022  |Azure, AWS, GCP|
|ISO IEC 27002:2022  |Azure, AWS, GCP|
|ISO IEC 27017:2015  |Azure, AWS, GCP|
|Cybersecurity Maturity Model Certification (CMMC) Level 2 v2.0  |Azure, AWS, GCP|
|AWS Well Architected Framework 2024  |AWS|
|Canada Federal PBMM 3.2020  |Azure, AWS, GCP|
|APRA CPS 234 2019  |Azure, AWS|
|CSA Cloud Controls Matrix v4.0.12  |Azure, AWS, GCP|
|Cyber Essentials v3.1  |Azure, AWS, GCP|
|Criminal Justice Information Services Security Policy v5.9.5  |Azure, AWS, GCP|
|FFIEC CAT 2017  |Azure, AWS, GCP|
|Brazilian General Data Protection Law (LGPD) 2018  |Azure|
|NZISM v3.7  |Azure, AWS, GCP|
|Sarbanes Oxley Act 2022 (SOX)  |Azure, AWS|
|NCSC Cyber Assurance Framework (CAF) v3.2  |Azure, AWS, GCP|

This joins the recent releases of CIS Azure Kubernetes Service (AKS) v1.5, CIS Google Kubernetes Engine (GKE) v1.6, and CIS Amazon Elastic Kubernetes Service (EKS) v.15 from few months ago ([link](/azure/defender-for-cloud/release-notes)).

For more information about Defender for Cloud Regulatory Compliance offering, [Learn more>](/azure/defender-for-cloud/concept-regulatory-compliance-standards)

## January 2025

|Date | Category | Update|
|--|--|--|
| January 30 | GA | [Update to scan criteria for container registries](#update-to-scan-criteria-for-container-registries) |
| January 29 | Change | [Enhancements for the Containers Vulnerabilities Assessment scanning powered by MDVM](#enhancements-for-the-containers-vulnerabilities-assessment-scanning-powered-by-mdvm) |
| January 27 | GA | [Permissions added to GCP connector to support AI platforms](#permissions-added-to-gcp-connector-to-support-ai-platforms) |
| January 20 | Change | [Enhancements for the Linux Baselines recommendation powered by GC](#enhancements-for-the-linux-baselines-recommendation-powered-by-gc) |

### Update to scan criteria for container registries

January 30, 2025

We are updating one of the scan criteria for registry images in the preview recommendation for registry images across all clouds and external registries ([Azure](recommendations-reference-container.md#preview-container-images-in-azure-registry-should-have-vulnerability-findings-resolved), [AWS](recommendations-reference-container.md#preview-container-images-in-aws-registry-should-have-vulnerability-findings-resolved), [GCP](recommendations-reference-container.md#preview-container-images-in-gcp-registry-should-have-vulnerability-findings-resolved), [Docker](recommendations-reference-container.md#preview-container-images-in-docker-hub-registry-should-have-vulnerability-findings-resolved), [JFrog](recommendations-reference-container.md#preview-container-images-in-jfrog-artifactory-registry-should-have-vulnerability-findings-resolved)).

**What's Changing?**

Currently, we rescan images for 90 days after they have been pushed to a registry. This will now be changed to scan 30 days back.

> [!NOTE]
> There are no changes for the related GA recommendations for container vulnerability assessment (VA) on registry images.

### Enhancements for the Containers Vulnerabilities Assessment scanning, powered by MDVM

January 29, 2025

We are excited to announce enhancements to our container vulnerability assessment scanning coverage with the following updates:

- **Additional Programming Languages**: Now supporting PHP, Ruby, and Rust.

- **Extended Java Language Support**: Includes scanning for exploded JARs.

- **Improved Memory Usage**: Optimized performance when reading large container image files.

### Permissions added to GCP connector to support AI platforms

January 27, 2025

The [GCP connector now has additional permissions](permissions.md#permissions-on-gcp) to support the GCP AI Platform (Vertex AI):

- aiplatform.batchPredictionJobs.list
- aiplatform.customJobs.list
- aiplatform.datasets.list
- aiplatform.datasets.get
- aiplatform.endpoints.getIamPolicy
- aiplatform.endpoints.list
- aiplatform.indexEndpoints.list
- aiplatform.indexes.list
- aiplatform.models.list
- aiplatform.models.get
- aiplatform.pipelineJobs.list
- aiplatform.schedules.list
- aiplatform.tuningJobs.list
- discoveryengine.dataStores.list
- discoveryengine.documents.list
- discoveryengine.engines.list
- notebooks.instances.list

### Enhancements for the Linux Baselines recommendation powered by GC
 
January 20, 2025

We are enhancing the Baselines Linux (powered by GC) feature to improve its accuracy and coverage. During February, you may notice changes such as updated rule names and additional rules. These improvements are designed to make the baselines assessment more accurate and up-to-date. For more information about the changes, please refer to the relevant [blog](/azure/osconfig/quickstart-sec-baseline-mc?tabs=azure-cli)

Some of the changes may include additional "public preview" changes. This update is beneficial for you, and we want to keep you informed. If you prefer, you can opt out of this recommendation by exempting it from your resource or removing the GC extension.

## December 2024

|Date | Category | Update|
|--|--|--|
| December 31 | GA | [Changes to the scan interval of existing cloud connectors](#changes-to-the-scan-interval-of-existing-cloud-connectors) |
| December 22| GA | [Microsoft Defender for Endpoint client version update is required to receive File Integrity Monitoring (FIM) experience](#microsoft-defender-for-endpoint-client-version-update-is-required-to-receive-file-integrity-monitoring-fim-experience) |
| December 17 | Preview | [Integrate Defender for Cloud CLI with Popular CI/CD Tools](#integrate-defender-for-cloud-cli-with-popular-cicd-tools) |
| December 10 | GA | [Defender for Cloud Setup experience](#defender-for-cloud-setup-experience) |
| December 10 | GA | [Revised interval options for Defender for Cloud scan of a cloud environment](#revised-interval-options-for-defender-for-cloud-scan-of-a-cloud-environment) |
| December 17 | GA | [Sensitivity scanning capabilities now include Azure file shares](#sensitivity-scanning-capabilities-now-include-azure-file-shares) |

### Changes to the scan interval of existing cloud connectors

December 31, 2024

Earlier this month, an [update was published](#revised-interval-options-for-defender-for-cloud-scan-of-a-cloud-environment) regarding the revised Defender for Cloud interval options for scanning a cloud environment. The scan interval setting determines how often Defender for Cloud's discovery services scan your cloud resources. This change ensures a more balanced scanning process, optimizing performance, and minimizing the risk of reaching API limits.

Scan interval settings for existing AWS and GCP cloud connectors will be updated to ensure Defender for Cloud's ability to scan your cloud environments.

The following adjustments will be made:

- Intervals currently set between 1–3 hours will be updated to 4 hours.
- Intervals set to 5 hours will be updated to 6 hours.
- Intervals set between 7–11 hours will be updated to 12 hours.
- Intervals of 13 hours or more will be updated to 24 hours.

If you prefer a different scan interval, you can adjust cloud connectors using the environment settings page. These changes will be applied automatically to all customers in early February 2025, and no further action is required.

### Sensitivity scanning capabilities now include Azure file shares

December 17, 2024

Defender for Cloud's Security Posture Management (CSPM) sensitivity scanning capabilities now include Azure file shares in GA in addition to blob containers.

Before this update, enabling the Defender CSPM plan on a subscription would automatically scan blob containers within storage accounts for sensitive data. With this update, Defender for CSPM's sensitivity scanning feature now includes file shares within those storage accounts. This enhancement improves the risk assessment and protection of sensitive storage accounts, providing a more comprehensive analysis of potential risks.

Learn more about [sensitivity scanning](concept-data-security-posture-prepare.md).

### Integrate Defender for Cloud CLI with Popular CI/CD Tools

Defender for Cloud CLI scanning integration with popular CI/CD tools in Microsoft Defender for Cloud is now available for public preview. The CLI can now be incorporated into CI/CD pipelines to scan and identify security vulnerabilities in containerized source code. This feature assists development teams in detecting and addressing code vulnerabilities during pipeline execution. It requires authentication to Microsoft Defender for Cloud and modifications to the pipeline script. Scan results will be uploaded to Microsoft Defender for Cloud, allowing security teams to view and correlate them with containers in the container registry. This solution delivers continuous and automated insights to expedite risk detection and response, ensuring security without disrupting workflows.

Use cases:

- Pipeline scanning within CI/CD tools: Securely monitor all pipelines that invoke the CLI.
- Early vulnerability detection: Results are published in the pipeline and sent to Microsoft Defender for Cloud.
- Continuous security insights: Maintain visibility and respond swiftly across development cycles without hindering productivity.

For more information, see [Integrate Defender for Cloud CLI with Popular CI/CD Tools](cli-cicd-integration.md).

### Defender for Cloud Setup experience

December 10, 2024

The Setup experience allows you to start your initial steps with Microsoft Defender for Cloud by connecting cloud environments such as cloud infrastructure, code repositories, and external container registries.

You're guided through the setup of your cloud environment, to protect your assets with advanced security plans, effortlessly perform quick actions to increase security coverage at scale, be aware of connectivity issues, and be notified of new security capabilities. You can navigate to the new experience from the [Defender for Cloud menu by selecting **Setup**](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/SetupExperience).

### Revised interval options for Defender for Cloud scan of a cloud environment

December 10, 2024

The scan interval options for cloud connectors associated with AWS, GCP, Jfrog, and DockerHub have been revised. The scan interval feature allows you to control the frequency at which the Defender for Cloud initiates a scan of the cloud environment. You can set the scan interval to 4, 6, 12, or 24 hours, when adding or editing a cloud connector. The default scan interval for new connectors continues to be 12 hours.

### Microsoft Defender for Endpoint client version update is required to receive File Integrity Monitoring (FIM) experience

June, 2025

Starting June 2025, File Integrity Monitoring (FIM) requires a minimum Defender for Endpoint (MDE) client version. Please ensure that you are at the minimum following client versions to continue benefiting from the FIM experience in Microsoft Defender for Cloud: for Windows: 10.8760, for Linux: 30.124082. [Learn more](file-integrity-monitoring-enable-defender-endpoint.md)

## Next steps

Check [What's new in security recommendations and alerts](release-notes-recommendations-alerts.md).
