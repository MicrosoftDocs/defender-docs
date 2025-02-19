---
title: What's new in Microsoft Defender for Cloud features
description: What's new and updated in Microsoft Defender for Cloud features
ms.topic: overview
ms.date: 11/28/2024
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

## February 2025

|Date | Category | Update|
|--|--|--|
| February 19 | Preview | [MDC Cost Calculator (Preview)](#mdc-cost-calculator-preview) |
|February 19|Preview| [31 new and enhanced multi-cloud regulatory standards coverage](#31-new-and-enhanced-multi-cloud-regulatory-standards-coverage)|

### MDC Cost Calculator (Preview)

February 19, 2025

Introducing the New MDC Cost Calculator: Simplify Your Cost Estimations

We're excited to introduce our new MDC cost calculator to help you easily estimate the costs associated with protecting your cloud environments. This tool is tailored to provide you with a clear and accurate understanding of your expenses, ensuring you can plan and budget effectively.

**Why Use the Cost Calculator?**

Our cost calculator simplifies the process of estimating costs by allowing you to define the scope of your protection needs. You select the environments and plans you want to enable, and the calculator automatically fills in the billable resources for each plan, including any applicable discounts. You're given a comprehensive view of your potential costs without any surprises.

**Key Features:**

***Scope Definition:*** Select the plans and environments that interest you. The calculator performs a discovery process to automatically populate the number of billable units for each plan per environment.

***Automatic and Manual Adjustments:*** The tool allows for both automatic collection of data and manual adjustments. You can modify the unit quantity and discount levels to see how changes affect the overall cost.

***Comprehensive Cost Estimation:*** The calculator provides an estimate for each plan and a total cost report. You're provided a detailed breakdown of costs, making it easier to understand and manage your expenses.

***Multi-Cloud Support:*** Our solution works for all supported clouds, ensuring that you get accurate cost estimations regardless of your cloud provider.

***Export and Share:*** Once you have your cost estimate, you can easily export and share it for budget planning and approvals.

### 31 new and enhanced multi-cloud regulatory standards coverage

February 19, 2025

We are excited to announce the enhanced and expanded support of over 31 security and regulatory frameworks in Defender for Cloud across Azure, AWS & GCP. This enhancement simplifies the path to achieving and maintaining compliance, reduces the risk of data breaches, and helps avoid fines and reputational damage.

**The new and enhanced frameworks are**:

|Standards|Clouds|
| -------- | -------- |
|EU 2022 2555 (NIS2) 2022  |Azure , AWS, GCP|
|EU General Data Protection Regulation (GDPR) 2016 679  |Azure , AWS, GCP|
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
|FFIEC CAT 2017  |Azure, AWS ,GCP|
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

Starting at June 2025, File Integrity Monitoring (FIM) requires a minimum Defender for Endpoint (MDE) client version. Please ensure that you are at the minimum following client versions to continue benefiting from the FIM experience in Microsoft Defender for Cloud: for Windows: 10.8760, for Linux: 30.124082. [Learn more](file-integrity-monitoring-enable-defender-endpoint.md)

## November 2024

|Date | Category | Update|
|--|--|--|
| November 28 | Preview | [Sensitivity scanning capabilities now include Azure file shares (Preview)](#sensitivity-scanning-capabilities-now-include-azure-file-shares-preview) |
| November 26 | Change| [Sensitivity label consent changes](#sensitivity-label-consent-changes) |
| November 26 | Change | [Sensitivity label changes](#sensitivity-label-changes) |
| November 25 | Preview | [Defender for Storage malware scanning for blobs up to 50 GB](#defender-for-storage-malware-scanning-for-blobs-up-to-50-gb-preview) |
| November 19 | Preview | [Updated versions of CIS standards for managed Kubernetes environments and new recommendations](#updated-versions-of-cis-standards-for-managed-kubernetes-environments-and-new-recommendations) |
| November 19 | Preview | [Public preview of Kubernetes cloud process events in advanced hunting](#public-preview-of-kubernetes-cloud-process-events-in-advanced-hunting) |
| November 19 | Deprecation | [Deprecation of Bring your own License (BYOL) feature in vulnerability management](#deprecation-of-bring-your-own-license-byol-feature-in-vulnerability-management) |
| November 19 | Preview | [Agentless code scanning in Microsoft Defender for Cloud](#agentless-code-scanning-in-microsoft-defender-for-cloud-preview) |
| November 19 | Preview | [On-demand malware scanning in Microsoft Defender for Storage (Preview)](#on-demand-malware-scanning-in-microsoft-defender-for-storage-preview) |
| November 18 | Preview | [JFrog Artifactory container registry support by Defender for Containers](#jfrog-artifactory-container-registry-support-by-defender-for-containers-preview) |
| November 18 | GA | [AI security posture management is now generally available (GA)](#ai-security-posture-management-is-now-generally-available-ga) |
| November 18 | GA | [Critical assets protection in Microsoft Defender for Cloud](#critical-assets-protection-in-microsoft-defender-for-cloud)|
| November 18 | GA | [Enhanced critical asset protection for containers](#enhanced-critical-asset-protection-for-containers) |
| November 18 | GA | [Enhancements to detect & respond to container threats](#enhancements-to-detect--respond-to-container-threats) |
| November 15 | Preview | [API Security Posture Management Native Integration within Defender CSPM plan now in public preview](#api-security-posture-management-native-integration-within-defender-cspm-plan-now-in-public-preview)|
| November 13| Preview | [Enhanced container protection with vulnerability assessment and malware detection for AKS nodes](#enhanced-container-protection-with-vulnerability-assessment-and-malware-detection-for-aks-nodes-preview)|
| November 7 | GA | [Enhanced Kubernetes (K8s) Alert Documentation and Simulation Tool](#enhanced-kubernetes-k8s-alert-documentation-and-simulation-tool) |
| November 6 | GA | [Enhanced Support for API sensitive data classification](#enhanced-support-for-api-sensitive-data-classification) |
| November 6 | Public Preview | [New support for mapping Azure API Management API endpoints to backend compute](#new-support-for-mapping-azure-api-management-api-endpoints-to-backend-compute) |
| November 6 | GA | [Enhanced API security support for multi-regional Azure API Management deployments and managing API revisions](#enhanced-api-security-support-for-multi-regional-azure-api-management-deployments-and-managing-api-revisions) |

### Sensitivity scanning capabilities now include Azure file shares (Preview)

November 28, 2024

Defender for Cloud's Security Posture Management (CSPM) sensitivity scanning capabilities now include Azure file shares (in preview) in addition to blob containers.

Before this update, enabling the Defender CSPM plan on a subscription would automatically scan blob containers within storage accounts for sensitive data. With this update, Defender for CSPM's sensitivity scanning feature now includes file shares within those storage accounts. This enhancement improves the risk assessment and protection of sensitive storage accounts, providing a more comprehensive analysis of potential risks.

Learn more about [sensitivity scanning](concept-data-security-posture-prepare.md).

### Sensitivity label consent changes

November 26, 2024

You no longer need to select the dedicated consent button under the "Information Protection" section within the "Labels" page, to benefit from custom information types and sensitivity labels configured in the Microsoft 365 Defender portal or Microsoft Purview compliance portal.

With this change, all custom information types and sensitivity labels are automatically imported into the Microsoft Defender for Cloud portal.

Learn more about [data sensitivity settings](data-sensitivity-settings.md#import-custom-sensitivity-info-typeslabels).

### Sensitivity label changes

November 26, 2024

Until recently, Defender for Cloud imported all sensitivity labels from the Microsoft 365 Defender portal that met the following two conditions:

- Sensitivity labels that have their scope set to "Items -> Files", or "Items -> Emails", under the "Define the scope of your label" section in the Information Protection section.
- The sensitivity label has an automatic labeling rule configured.

As of November 26, 2024 the names of the sensitivity label scopes in the user interface (UI) have been updated in both the Microsoft 365 Defender portal and the Microsoft Purview compliance portal. Defender for Cloud now will only import sensitivity labels with the "Files and other data assets" scope applied to them. Defender for Cloud no longer imports labels with the "Emails" scope applied to them.

> [!NOTE]
> Labels that were configured with "Items -> Files" before this change took place are automatically migrated to the new "Files and other data assets" scope.

Learn more about [how to configure sensitivity labels](data-sensitivity-settings.md).

### Defender for Storage malware scanning for blobs up to 50 GB (Preview)

November 25, 2024

**Estimated date for change:** December 1, 2024

Starting on December 1, 2024, Defender for Storage malware scanning will **support blobs up to 50GB in size** (previously limited to 2GB).

Please note that for storage accounts where large blobs are uploaded, the increased blob size limit will result in higher monthly charges.

To avoid unexpected high charges, you may want to set an appropriate cap on total GB scanned per month. For more information, see [Cost control for on-upload malware scanning](on-upload-malware-scanning.md).

### Updated versions of CIS standards for managed Kubernetes environments and new recommendations

November 19, 2024

Defender for Cloud's regulatory compliance dashboard now offers updated versions of the Center for Internet Security (CIS) standards for assessing the security posture of managed Kubernetes environments.

From the dashboard, you can assign the following standards to your AWS/EKS/GKE Kubernetes resources:

- CIS Azure Kubernetes Service (AKS) v1.5.0
- CIS Google Kubernetes Engine (GKE) v1.6.0
- CIS Amazon Elastic Kubernetes Service (EKS) v1.5.0

To ensure the best possible depth of coverage for these standards, we've enriched our coverage by also releasing 79 new Kubernetes-centric recommendations.

To use these new recommendations, either assign the standards listed above or create a custom standard and include one or more of the new assessments in it.

### Public preview of Kubernetes cloud process events in advanced hunting

We're announcing the preview release of Kubernetes cloud process events in advanced hunting. This powerful integration provides detailed information about Kubernetes process events occurring across your multicloud environments. You can use it to discover threats that can be observed through process details, such as malicious processes invoked in your cloud infrastructure. For more information, see [CloudProcessEvents](/defender-xdr/advanced-hunting-cloudprocessevents-table).

### Deprecation of Bring your own License (BYOL) feature in vulnerability management

November 19, 2024

**Estimated date for change:**

- **February 3 2025**: The feature will no longer be available for onboarding new machines and subscriptions.

- **May 1 2025**: The feature will be fully deprecated and no longer available.

As part of our efforts to improve the Defender for Cloud security experience, we're streamlining our vulnerability assessment solutions. We're removing the "Bring Your Own License" feature in Defender for Cloud. You'll now use Microsoft Security Exposure Management connectors for a more seamless, integrated, and complete solution.

We recommend that you transition to the new connector solution within Microsoft Security Exposure Management. Our team is here to support you through this transition.

For more information on using the connectors, see [Overview of connecting data sources in Microsoft Security Exposure Management - Microsoft Security Exposure Management](/security-exposure-management/overview-data-connectors).

### Agentless code scanning in Microsoft Defender for Cloud (preview)

November 19, 2024

Agentless code scanning in Microsoft Defender for Cloud is now available for public preview. It offers fast and scalable security for all repositories in Azure DevOps organizations with one connector. This solution helps security teams find and fix vulnerabilities in code and infrastructure as code (IaC) configurations across Azure DevOps environments. It doesn't require agents, changes to pipelines, or interruptions to developer workflows, making setup and maintenance simple. It works independently from continuous integration and continuous deployment (CI/CD) pipelines. The solution provides continuous and automated insights to speed up risk detection and response, ensuring security without interrupting workflows.  

Use cases:

- **Organization-wide scanning:** You can securely monitor all repositories in Azure DevOps organizations with one connector.  
- **Early vulnerability detection:** Quickly find code and IaC risks for proactive risk management.  
- **Continuous security insights:** Keep visibility and respond quickly across development cycles without affecting productivity.

For more information, see [Agentless code scanning in Microsoft Defender for Cloud](agentless-code-scanning.md).

### On-demand malware scanning in Microsoft Defender for Storage (Preview)

November 19, 2024

On-demand malware scanning in Microsoft Defender for Storage, now in public preview, enables scanning of existing blobs in Azure Storage accounts whenever needed. Scans can be initiated from the Azure portal UI or via the REST API, supporting automation through Logic Apps, Automation playbooks, and PowerShell scripts. This feature uses Microsoft Defender Antivirus with the latest malware definitions for every scan and provides upfront cost estimation in the Azure portal before scanning.

Use cases:

- **Incident response**: Scan specific storage accounts after detecting suspicious activity.
- **Security baseline**: Scan all stored data when first enabling Defender for Storage.
- **Compliance**: Set automation to schedule scans that help meet regulatory and data protection standards.

For more information, see [On-demand malware scanning](on-demand-malware-scanning.md).

### JFrog Artifactory container registry support by Defender for Containers (Preview)

November 18, 2024

This feature extends Microsoft Defender for Containers coverage of external registries to include JFrog Artifactory. Your JFrog Artifactory container images are scanned using Microsoft Defender Vulnerability Management to identify security threats and mitigate potential security risks.

### AI security posture management is now generally available (GA)

November 18, 2024

Defender for Cloud's AI security posture management features are now generally available (GA).

Defender for Cloud reduces risk to cross cloud AI workloads by:

- Discovering generative AI Bill of Materials (AI BOM), which includes application components, data, and AI artifacts from code to cloud.

- Strengthening generative AI application security posture with built-in recommendations and by exploring and remediating security risks.

- Using the attack path analysis to identify and remediate risks.

Learn more about [AI security posture management](ai-security-posture.md).

### Critical assets protection in Microsoft Defender for Cloud

November 18, 2024

Today, we're excited to announce the General Availability of Critical Assets Protection in Microsoft Defender for Cloud. This feature enables security administrators to tag the "crown jewel" resources that are most critical to their organizations, allowing Defender for Cloud to provide them with the highest level of protection and prioritize security issues on these assets above all others. [Learn more about critical assets protection](critical-assets-protection.md).

Alongside the General Availability release, we're also expending support for tagging Kubernetes and nonhuman identity resources.

### Enhanced critical asset protection for containers

November 18, 2024

[Critical asset protection](./critical-assets-protection.md) is extended to support additional use cases for containers.

Users can now create custom rules that mark assets managed by Kubernetes (workloads, containers, etc.) as critical based on the asset Kubernetes namespace and/or the asset Kubernetes label.

As with other critical asset protection use cases, Defender for Cloud takes into account asset criticality for risk prioritization, attack path analysis, and security explorer.

### Enhancements to detect & respond to container threats

November 18, 2024

Defender for Cloud provides a suite of new features to empower SOC teams to [tackle container threats](/defender-xdr/investigate-respond-container-threats) in cloud-native environments with greater speed and precision. These enhancements include Threat Analytics, GoHunt capabilities, Microsoft Security Copilot guided response, and cloud-native response actions for Kubernetes pods.

#### Introducing cloud-native response actions for Kubernetes pods (Preview)

Defender for Cloud now offers multicloud response actions for Kubernetes pods, accessible exclusively from the Defender XDR portal. These capabilities enhance incident response for AKS, EKS, and GKE clusters.

The following are new response actions:

**Network Isolation** - Instantly block all traffic to a pod, preventing lateral movement and data exfiltration. Requires network policy configuration on your kubernetes cluster.

**Pod Termination** - Quickly terminate suspicious pods, stopping malicious activity without disrupting the broader application.

These actions empower SOC teams to contain threats effectively across cloud environments.

#### Threat Analytics report for containers

We're introducing a dedicated Threat Analytics report, designed to provide comprehensive visibility into threats targeting containerized environments. This report equips SOC teams with insights to detect and respond to the latest attack patterns on AKS, EKS, and GKE clusters.

**Key Highlights**:

- Detailed analysis of top threats and associated attack techniques within Kubernetes environments.
- Actionable recommendations to strengthen your cloud-native security posture and mitigate emerging risks.

#### GoHunt for Kubernetes pods & Azure resources

GoHunt now extends its hunting capabilities to include Kubernetes pods and Azure resources, within the Defender XDR portal. This feature enhances proactive threat hunting, enabling SOC analysts to conduct in-depth investigations across cloud-native workloads.

**Key Features**:

- Advanced query capabilities to detect anomalies in Kubernetes pods and Azure resources, offering richer context for threat analysis.
- Seamless integration with Kubernetes entities for efficient threat hunting and investigation.

#### Security Copilot Guided Response for Kubernetes pods

Introducing Guided Response for Kubernetes pods, a feature powered by Security Copilot. This new capability provides real-time, step-by-step guidance, helping SOC teams respond to container threats swiftly and effectively.

**Key Benefits**:

- Contextual response playbooks tailored to common Kubernetes attack scenarios.
- Expert, real-time support from Security Copilot, bridging the knowledge gap and enabling faster resolution.

### API Security Posture Management Native Integration within Defender CSPM plan now in public preview

November 15, 2024

API security posture management (Preview) capabilities are now included in the Defender CSPM plan and can be enabled through extensions within the plan under environment settings page. For more information, see [Improve your API security posture (Preview)](api-security-posture-overview.md).

### Enhanced container protection with vulnerability assessment and malware detection for AKS nodes (Preview)

November 13, 2024

Defender for Cloud now provides vulnerability assessment and malware detection for the nodes in Azure Kubernetes Service (AKS), and provides clarity to customers on their part in the shared security responsibility they have with the managed cloud provider.

Providing security protection for these Kubernetes nodes allow customers to maintain security and compliance across the managed Kubernetes service.

To receive the new capabilities, you have to enable the **agentless scanning for machines** option in the Defender CSPM, Defender for Containers, or Defender for Servers P2 plan in your subscription.

#### Vulnerability Assessment

A new recommendation is now available in Azure portal: `AKS nodes should have vulnerability findings resolved`. Through this recommendation, you can now review and remediate vulnerabilities and CVEs found on Azure Kubernetes Service (AKS) nodes.

#### Malware detection

New security alerts are triggered when the agentless malware detection capability detects malware in AKS nodes.

Agentless malware detection uses the Microsoft Defender Antivirus anti-malware engine to scan and detect malicious files. When threats are detected, security alerts are directed into Defender for Cloud and Defender XDR, where they can be investigated and remediated.

> [!IMPORTANT]
> Malware detection for AKS nodes is available only for Defender for Containers or Defender for Servers P2 enabled environments.

### Enhanced Kubernetes (K8s) Alert Documentation and Simulation Tool

November 7, 2024

#### Key features

- Scenario-based alert documentation: K8s alerts are now documented based on real-world scenarios, providing clearer guidance on potential threats and recommended actions.
- Microsoft Defender for Endpoint (MDE) integration: Alerts are enriched with additional context and threat intelligence from MDE, improving you the ability to respond effectively.
- [New Simulation Tool](alerts-containers.md#kubernetes-alerts-simulation-tool): A powerful simulation tool is available to test your security posture by simulating various attack scenarios and generating corresponding alerts.

#### Benefits

- Improved alert understanding: Scenario-based documentation provides a more intuitive understanding of K8s alerts.
- Enhanced threat response: Alerts are enriched with valuable context, enabling faster and more accurate responses.
- Proactive security testing: The new simulation tool allows you to test your security defenses and identify potential vulnerabilities before they're exploited.

### Enhanced support for API sensitive data classification

November 6, 2024

Microsoft Defender for Cloud extends API Security sensitive data classification capabilities to API URL path and query parameters along with API request and responses, including the source of sensitive information found in the API properties. This information will be available in the Attack Path Analysis experience, the Cloud Security Explorer's **Additional Details** page when API Management operations with sensitive data are selected, and on the API Security Dashboard under the Workload Protections within API collection details page, with a new side context menu that provides detailed insights into sensitive data found, enabling security teams efficiently locate and mitigate data exposure risks.

> [!NOTE]
> This change will include a one-time rollout to existing Defender for APIs and Defender CSPM customers.

### New support for mapping Azure API Management API endpoints to backend compute

November 6, 2024

Defender for Cloud's API security posture now supports mapping API endpoints published through Azure API Management Gateway to backend compute resources, such as virtual machines, in the Defender Cloud Security Posture Management (Defender CSPM) Cloud Security Explorer. This visibility helps identify API traffic routing to backend cloud compute destinations, enabling you to detect and address exposure risks associated with API endpoints and their connected backend resources.

### Enhanced API security support for multi-regional Azure API Management deployments and managing API revisions

November 6, 2024

API security coverage within Defender for Cloud will now have full support for Azure API Management multi-region deployments, including full security posture and threat detection support to both primary and secondary regions

Onboarding and offboarding APIs to Defender for APIs will now be managed at the Azure API Management API level. All associated [Azure API Management revisions](/azure/api-management/api-management-revisions) will automatically be included in the process, eliminating the need to manage onboarding and offboarding for each API revision individually.

This change includes a one-time rollout to existing Defender for APIs customers.

Rollout Details:

- The rollout will occur during the week of November 6 for existing Defender for APIs customers.
- If the 'current' revision for an Azure API Management API is already onboarded to Defender for APIs, all associated revisions for that API will also be automatically onboarded to Defender for APIs.
- If the 'current' revision for an Azure API Management API isn't onboarded to Defender for APIs, any associated API revisions that were onboarded to Defender for APIs will be offboarded.

## October 2024

|Date | Category | Update|
|--|--|--|
| October 31 | Upcoming change | [Enhanced API security support for multi-regional Azure API Management deployments and managing API revisions](#enhanced-api-security-support-for-multi-regional-azure-api-management-deployments-and-managing-api-revisions) |
| October 28 | GA | [MMA migration experience is now available](#mma-migration-experience-is-now-available) |
| October 21 | GA | [Security findings for GitHub repositories without GitHub Advanced Security is now GA](#security-findings-for-github-repositories-without-github-advanced-security-is-now-ga) |
| October 14 | Upcoming change|[Deprecation of three compliance standards](#deprecation-of-three-compliance-standards)|
| October 14 | Upcoming change|[Deprecation of three Defender for Cloud standards](#deprecation-of-three-defender-for-cloud-standards)|
| October 9 | GA | [Binary drift detection released as GA](#binary-drift-detection-released-as-ga)|
| October 6 | Preview | [Updated containers runtime recommendations](#updated-containers-runtime-recommendations-preview)|
| October 6 | Preview | [Kubernetes Identity and Access information in the security graph](#kubernetes-identity-and-access-information-in-the-security-graph-preview) |
| October 6 | Preview | [Kubernetes identity and access information-based attack paths](#kubernetes-identity-and-access-information-based-attack-paths-preview) |
| October 6 | GA | [Improved attack path analysis for containers](#improved-attack-path-analysis-for-containers) |
| October 6 | GA | [Full discovery of container images in supported registries](#full-discovery-of-container-images-in-supported-registries) |
| October 6 | GA | [Containers software inventory with Cloud Security Explorer](#containers-software-inventory-with-cloud-security-explorer) |
  
### MMA migration experience is now available

October 28, 2024

You can now ensure that all of your environments are fully prepared for the post Log Analytics agent (MMA) deprecation expected at the end of November 2024.

Defender for Cloud added a new experience that allows you to take action at scale for all of your affected environments:

- That's missing prerequisites necessary to gain the full security coverage offered by Defender for Servers Plan 2.
- That's [connected to Defender for Servers Plan 2 using the legacy onboarding approach via Log Analytics workspace](prepare-deprecation-log-analytics-mma-agent.md#changes-to-legacy-defender-for-servers-plan-2-onboarding-via-log-analytics-agent).
- That uses the old File Integrity Monitoring (FIM) version with the Log Analytics agent (MMA) need to migrate to the new, [improved FIM version with Defender for Endpoint (MDE)](file-integrity-monitoring-enable-defender-endpoint.md).

Learn how to [use the new MMA migration experience](prepare-deprecation-log-analytics-mma-agent.md#mma-migration-experience).

### Security findings for GitHub repositories without GitHub Advanced Security is now GA

October 21, 2024

The ability to receive security findings for infrastructure-as-code (IaC) misconfigurations, container vulnerabilities, and code weaknesses for GitHub repositories without GitHub Advanced Security is now generally available.

Note that secret scanning, code scanning using [GitHub CodeQL](https://codeql.github.com/), and dependency scanning still require GitHub Advanced Scanning.

To learn more about required licenses, see the [DevOps support page](devops-support.md). To learn how to onboard your GitHub environment to Defender for Cloud, follow the [GitHub onboarding guide](quickstart-onboard-github.md). To learn how to configure the Microsoft Security DevOps GitHub Action, see our [GitHub Action documentation](github-action.md).

### Deprecation of three compliance standards

October 14, 2024

**Estimated date for change:** November 17, 2024

Three compliance standards are being removed from the product:

- **SWIFT CSP-CSCF v2020 (for Azure)** - This was superseded by the v2022 version
- **CIS Microsoft Azure Foundations Benchmark v1.1.0** and **v1.3.0** - We have two newer versions available (v1.4.0 and v2.0.0)

Learn more about the compliance standards available in Defender for Cloud in [Available compliance standards](concept-regulatory-compliance-standards.md#available-compliance-standards).

### Deprecation of three Defender for Cloud standards

October 8, 2024

**Estimated date for change:** November 17, 2024

To simplify the management of Defender for Cloud with AWS accounts and GCP projects, we're removing the following three Defender for Cloud standards:

- For AWS - **AWS CSPM**
- For GCP - **GCP CSPM** and **GCP Default**

The default standard, [Microsoft Cloud Security Benchmark (MCSB)](concept-regulatory-compliance.md), now contains all the assessments which were unique to these standards.

### Binary drift detection released as GA

October 9, 2024

Binary drift detection is now released as GA in the Defender for Container plan. Note that binary drift detection now works on all AKS versions.

### Updated containers runtime recommendations (preview)

October 6, 2024

The preview recommendations for "Containers running in AWS/Azure/GCP should have vulnerabilities findings resolved" are updated to group all containers that are part of the same workload into a single recommendation, reducing duplications and avoid fluctuations due to new and terminated containers.

As of October 6, 2024 the following assessment IDs are replaced for these recommendations:

| Recommendation                                                          | Previous assessment ID               | New assessment ID                    |
|-------------------------------------------------------------------------|--------------------------------------|--------------------------------------|
|--|--|--|
| Containers running in Azure should have vulnerability findings resolved | e9acaf48-d2cf-45a3-a6e7-3caa2ef769e0 | c5045ea3-afc6-4006-ab8f-86c8574dbf3d |
| Containers running in AWS should have vulnerability findings resolved   | d5d1e526-363a-4223-b860-f4b6e710859f | 8749bb43-cd24-4cf9-848c-2a50f632043c |
| Containers running in GCP should have vulnerability findings resolved   | c7c1d31d-a604-4b86-96df-63448618e165 | 1b3abfa4-9e53-46f1-9627-51f2957f8bba |

 If you're currently retrieving vulnerability reports from these recommendations via API, ensure you update the API call with the new assessment ID.

### Kubernetes Identity and Access information in the security graph (preview)

October 6, 2024

Kubernetes Identity and Access information is added to the security graph, including nodes that represent all Kubernetes Role Based Access Control (RBAC) related entities (service accounts, roles, role bindings, etc.), and edges that represent the permissions between Kubernetes objects. Customers can now query the security graph for their Kubernetes RBAC, and related relationships between Kubernetes entities (Can Authenticate As, Can Impersonate As, Grants Role, Access Defined By, Grants Access To, Has Permission To, etc.)

### Kubernetes Identity and Access information-based attack paths (preview)

October 6, 2024

Using the Kubernetes RBAC data in the security graph, Defender for Cloud now detects Kubernetes, Kubernetes to Cloud, and inner Kubernetes lateral movement and reports on other attack paths where attackers can abuse Kubernetes and Cloud authorization for lateral movement to, from, and within Kubernetes clusters.

### Improved attack path analysis for containers

October 6, 2024

The new attack path analysis engine [released last November now supports container use cases as well](release-notes-archive.md#attack-path-analysis-new-engine-and-extensive-enhancements), dynamically detecting new types of attack paths in cloud environments based on the data added to the graph. We can now find more attack paths for containers and detect more complex and sophisticated attack patterns used by attackers to infiltrate cloud and Kubernetes environments.

### Full discovery of container images in supported registries

October 6, 2024

Defender for Cloud now collects inventory data for all container images in supported registries, providing full visibility within the security graph to all images in your cloud environments, including images that currently don't have any posture recommendations.

Querying capabilities through the Cloud Security Explorer are improved so users can now search for container images based on their metadata (digest, repository, OS, tag, and etc.)

### Containers software inventory with Cloud Security Explorer

October 6, 2024

Customers are now able to get a [list of software installed in their containers and container images through the Cloud Security Explorer](cloud-security-explorer-software-vulnerabilities.md). This list can also be used to quickly gain other insights into the customer environment, such as finding all containers and container images with software impacted by a zero-day vulnerability, even before a CVE is published.

## September 2024

|Date | Category | Update|
|--|--|--|
| September 22 |Upcoming change|[Cloud security explorer experience improvements](#cloud-security-explorer-experience-improvements)|
| September 18 | GA | [General Availability of File Integrity Monitoring based on Microsoft Defender for Endpoint](#general-availability-of-file-integrity-monitoring-based-on-microsoft-defender-for-endpoint) |
| September 18 | GA | [FIM migration experience is available in Defender for Cloud](#fim-migration-experience-is-available-in-defender-for-cloud) |
| September 18 | Deprecation | [Deprecation of MMA auto-provisioning capability](#deprecation-of-mma-auto-provisioning-capability) |
| September 15 | GA | [Integration with Power BI](#integration-with-power-bi) |
|September 11|Upcoming change|[Update to CSPM multicloud network requirements](#update-to-cspm-multicloud-network-requirements)|
| September 9 | Deprecation | [Defender for Servers feature deprecation](#defender-for-servers-feature-deprecation) |
| September 9 | GA | [Spanish National Security Framework (Esquema Nacional de Seguridad (ENS)) added to regulatory compliance dashboard for Azure](#spanish-national-security-framework-esquema-nacional-de-seguridad-ens-added-to-regulatory-compliance-dashboard-for-azure)|
| September 8 | GA | [Remediate system updates and patches recommendations on your machines](#remediate-system-updates-and-patches-recommendations-on-your-machines)|
| September 4 | GA | [ServiceNow's integration now includes Configuration Compliance module](#servicenows-integration-now-includes-configuration-compliance-module) |
| September 4 | Upcoming change | [Defender for Storage (classic) per-transaction storage protection plan not available for new subscriptions](#defender-for-storage-classic-per-transaction-storage-protection-plan-not-available-for-new-subscriptions) |
| September 1 | GA  | [Azure Policy guest configuration is now generally available (GA)](#azure-policy-guest-configuration-is-now-generally-available-ga) |
|September 1| Preview |[Public Preview for Docker Hub container registry support by Defender for Containers](#preview-for-docker-hub-container-registry-support-by-defender-for-containers) |

### Cloud security explorer experience improvements

September 22, 2024

**Estimated date for change:** October 2024

The Cloud Security Explorer is set to improve performance and grid functionality, provide more data enrichment on each cloud asset, improve search categories, and improve CSV export report with more insights on the exported cloud assets.

### General Availability of File Integrity Monitoring based on Microsoft Defender for Endpoint

September 18, 2024

The new version of File Integrity Monitoring based on Microsoft Defender for Endpoint is now GA as part of Defender for Servers Plan 2. FIM enables you to:

- Meet compliance requirements by monitoring critical files and registries in real-time and auditing the changes.
- Identify potential security issues by detecting suspicious file content changes.

This improved FIM experience replaces the existing one that set for deprecation with the Log Analytics Agent (MMA) retirement. The [FIM experience over MMA](file-integrity-monitoring-enable-log-analytics.md) will remain supported until the end of November 2024.

With this release, an in-product experience is released to allow you to migrate your FIM configuration over MMA to the new FIM over Defender for Endpoint version.

For information on how to enable FIM over Defender for Endpoint, see [File Integrity Monitoring using Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md). For information on how to disable previous versions, see [Migrate File Integrity Monitoring from previous versions](migrate-file-integrity-monitoring.md).

### FIM migration experience is available in Defender for Cloud

September 18, 2024

An in-product experience is released to allow you to migrate your FIM configuration over MMA to the new FIM over Defender for Endpoint version.
With this experience you can:

- Review affected environment with previous FIM version over MMA enabled and required migration.
- Export your current FIM rules from MMA- based experience and reside on workspaces
- Migrate to P2 enabled subscriptions with new FIM over MDE.

To use the migration experience, navigate to the **Environment settings** pane and select the **MMA migration** button in the upper row.

### Deprecation of MMA auto-provisioning capability

September 18, 2024
As part of the MMA agent retirement, the auto provisioning capability that provides the installation and configuration of the agent for MDC customers, will be deprecated as well in two stages:

1. **By the end of September 2024**- auto provisioning of MMA will be disabled for customers that are no longer using the capability, as well as for newly created subscriptions. After end of September, the capability will no longer be able to be re-enabled on those subscriptions.

1. **End of November 2024-** auto provisioning of MMA will be disabled on subscriptions that haven't yet switched it off. From that point forward, it can no longer be possible to enable the capability on existing subscriptions.

### Integration with Power BI

September 15, 2024

Defender for Cloud can now integrate with Power BI. This integration allows you to create custom reports and dashboards using the data from Defender for Cloud. You can use Power BI to visualize and analyze your security posture, compliance, and security recommendations.

Learn more about the new [integration with Power BI](integration-power-bi.md).

### Update to CSPM multicloud network requirements

September 11, 2024

**Estimated date for change:** October 2024

Beginning October 2024, we're adding more IP addresses to our multicloud discovery services to accommodate improvements and ensure a more efficient experience for all users.

To ensure uninterrupted access from our services, you should update your IP allowlist with the new ranges [provided here](https://aka.ms/CSPM-network-requirements). You should make the necessary adjustments in your firewall settings, security groups, or any other configurations that might be applicable to your environment. The list is sufficient for full capability of the CSPM foundational (free) offering.

### Defender for Servers feature deprecation

September 9, 2024

Both Adaptive application controls, and Adaptive network hardening are now deprecated.

### Spanish National Security Framework (Esquema Nacional de Seguridad (ENS)) added to regulatory compliance dashboard for Azure

September 9, 2024

Organizations that wish to check their Azure environments for compliance with the ENS standard can now do so using Defender for Cloud.

The ENS standard applies to the entire public sector in Spain, as well as to suppliers collaborating with the Administration. It establishes basic principles, requirements, and security measures to protect information and services processed electronically. The goal is to ensure access, confidentiality, integrity, traceability, authenticity, availability, and data preservation.

Check out the [full list of supported compliance standards](concept-regulatory-compliance-standards.md#available-compliance-standards).

### Remediate system updates and patches recommendations on your machines

September 8, 2024

You can now remediate system updates and patches recommendations on your Azure Arc-enabled machines and Azure VMs. System updates and patches are crucial for keeping the security and health of your machines. Updates often contain security patches for vulnerabilities that, if left unfixed, are exploitable by attackers.

Information about missing machine updates is now gathered using Azure Update Manager.

In order to maintain the security of your machines for system updates and patches, you'll need to enable the periodic assessment updates settings on your machines.

Learn how to [Remediate system updates and patches recommendations on your machines](enable-periodic-system-updates.md).

### ServiceNow's integration now includes Configuration Compliance module

September 4, 2024

Defender for Cloud's CSPM plan's integration with ServiceNow now includes ServiceNow's Configuration Compliance module. This feature allows you to identify, prioritize, and remediate configuration issues in your cloud assets while reducing security risks and improving your overall compliance posture through automated workflows and real-time insights.

Learn more about [ServiceNow's integration with Defender for Cloud](integration-servicenow.md).

### Defender for Storage (classic) per-transaction storage protection plan not available for new subscriptions

September 4, 2024

**Estimated date for change**: February 5, 2025

After February 5, 2025, you won't be able to activate the legacy Defender for Storage (classic) per-transaction storage protection plan unless it's already enabled in your subscription. For more information, see [Move to the new Defender for Storage plan](defender-for-storage-classic-migrate.md).

### Azure Policy guest configuration is now generally available (GA)

September 1, 2024

Defender for Server's Azure Policy guest configuration is now generally available (GA) for all multicloud Defender for Servers Plan 2 customers. Guest Configuration provides a unified experience for managing security baselines across your environment. It enables you to assess and enforce security configurations on your servers, including Windows and Linux machines, Azure VMs, AWS EC2, and GCP instances.

Learn how to [enable Azure Policy machine configuration on your environment](security-baseline-guest-configuration.md).

### Preview for Docker Hub container registry support by Defender for Containers

September 1, 2024

We're introducing the public preview of the Microsoft Defender for Containers extension of coverage to include external registries, beginning with Docker Hub container registries. As part of your organization's Microsoft Cloud Security Posture Management, the extension of coverage to Docker Hub container registries provides the benefits of scanning your Docker Hub container images  using Microsoft Defender Vulnerability Management to identify security threats and mitigate potential security risks.

For more information about this feature, see [Vulnerability Assessment for Docker Hub](agentless-vulnerability-assessment-docker-hub.md)

## August 2024

|Date | Category | Update|
|--|--|--|
| August 28 | Preview | [New version of File Integrity Monitoring based on Microsoft Defender for Endpoint](#new-version-of-file-integrity-monitoring-based-on-microsoft-defender-for-endpoint) |
| August 22 | Upcoming deprecation | [Retirement of Defender for Cloud alert integration with Azure WAF alerts](#retirement-of-defender-for-cloud-alert-integration-with-azure-waf-alerts) |
| August 1 | GA | [Enable Microsoft Defender for SQL servers on machines at scale](#enable-microsoft-defender-for-sql-servers-on-machines-at-scale) |

### New version of File Integrity Monitoring based on Microsoft Defender for Endpoint

August 28, 2024

The new version of File Integrity Monitoring based on Microsoft Defender for Endpoint is now in public preview. It's part of Defender for Servers Plan 2. It enables you to:

- Meet compliance requirements by monitoring critical files and registries in real-time and auditing the changes.
- Identify potential security issues by detecting suspicious file content changes.

As part of this release, the FIM experience over AMA will no longer be available in the Defender for Cloud portal.
The [FIM experience over MMA](file-integrity-monitoring-enable-log-analytics.md) will remain supported until the end of November 2024.
In the beginning of September, an in-product experience will be released which allows you to migrate your FIM configuration over MMA to the new FIM over Defender for Endpoint version.

For information on how to enable FIM over Defender for Endpoint, see [File Integrity Monitoring using Microsoft Defender for Endpoint](file-integrity-monitoring-enable-defender-endpoint.md).
For information on how to migrate from previous versions, see [Migrate File Integrity Monitoring from previous versions](migrate-file-integrity-monitoring.md).

### Retirement of Defender for Cloud alert integration with Azure WAF alerts

August 22, 2024

**Estimated date for change**: September 25, 2024

Defender for Cloud alert [integration](other-threat-protections.md#display-azure-waf-alerts-in-defender-for-cloud) with Azure WAF alerts will be retired on September 25, 2024. No action is needed on your end. For Microsoft Sentinel customers, you can configure the Azure Web Application Firewall [connector](/azure/web-application-firewall/waf-sentinel).

### Enable Microsoft Defender for SQL servers on machines at scale

August 1, 2024

You can now enable Microsoft Defender for SQL servers on machines at scale. This feature allows you to enable Microsoft Defender for SQL on multiple servers at once, saving time and effort.

Learn how to [enable Microsoft Defender for SQL servers on machines at scale](enable-defender-sql-at-scale.md).

## July 2024

| Date    | Category        | Update                                                       |
| ------- | --------------- | ------------------------------------------------------------ |
| July 31 | GA              | [General availability of enhanced discovery and configuration recommendations for endpoint protection](#general-availability-of-enhanced-discovery-and-configuration-recommendations-for-endpoint-protection) |
| July 31 | Upcoming update | [Adaptive network hardening deprecation](#adaptive-network-hardening-deprecation) |
| July 22 | Preview         | [Security assessments for GitHub no longer require additional licensing](#preview-security-assessments-for-github-no-longer-require-additional-licensing) |
| July 18 | Upcoming update | [Updated timelines toward MMA deprecation in Defender for Servers Plan 2](#updated-timelines-toward-mma-deprecation-in-defender-for-servers-plan-2) |
| July 18 | Upcoming update | [Deprecation of MMA-related features as part of agent retirement](#deprecation-of-mma-related-features-as-part-of-agent-retirement) |
| July 15 | Preview         | [Binary Drift Public Preview in Defender for Containers](#binary-drift-public-preview-now-available-in-defender-for-containers) |
| July 14 | GA              | [Automated remediation scripts for AWS and GCP are now GA](#automated-remediation-scripts-for-aws-and-gcp-are-now-ga) |
| July 11 | Upcoming update | [GitHub application permissions update](#github-application-permissions-update) |
| July 10 | GA              | [Compliance standards are now GA](#compliance-standards-are-now-ga) |
| July 9  | Upcoming update | [Inventory experience improvement](#inventory-experience-improvement) |
| July 8  | Upcoming update | [Container mapping tool to run by default in GitHub](#container-mapping-tool-to-run-by-default-in-github) |

### General availability of enhanced discovery and configuration recommendations for endpoint protection

July 31, 2024

Improved discovery features for endpoint protection solutions and enhanced identification of configuration issues are now GA and available for multicloud servers. These updates are included in the Defender for Servers Plan 2 and Defender Cloud Security Posture Management (CSPM).  

The enhanced recommendations feature uses [agentless machine scanning](concept-agentless-data-collection.md), enabling comprehensive discovery and assessment of the configuration of [supported endpoint detection and response solutions](endpoint-detection-response.md). When configuration issues are identified, remediation steps are provided.  

With this general availability release, the list of [supported solutions](endpoint-detection-response.md) is expanded to include two more endpoint detection and response tools:  

- Singularity Platform by SentinelOne  
- Cortex XDR

### Adaptive network hardening deprecation

July 31, 2024

**Estimated date for change**: August 31, 2024

Defender for Server's adaptive network hardening is being deprecated.

The feature deprecation includes the following experiences:

- **Recommendation**: [Adaptive network hardening recommendations should be applied on internet facing virtual machines](recommendations-reference-networking.md#adaptive-network-hardening-recommendations-should-be-applied-on-internet-facing-virtual-machines) [assessment Key: f9f0eed0-f143-47bf-b856-671ea2eeed62]
- **Alert**: [Traffic detected from IP addresses recommended for blocking](alerts-azure-network-layer.md#traffic-detected-from-ip-addresses-recommended-for-blocking)

### Preview: Security assessments for GitHub no longer require additional licensing

July 22, 2024

GitHub users in Defender for Cloud no longer need a GitHub Advanced Security license to view security findings. This applies to security assessments for code weaknesses, Infrastructure-as-Code (IaC) misconfigurations, and vulnerabilities in container images that are detected during the build phase.

Customers with GitHub Advanced Security will continue to receive additional security assessments in Defender for Cloud for exposed credentials, vulnerabilities in open source dependencies, and CodeQL findings.

To learn more about DevOps security in Defender for Cloud, see the [DevOps Security Overview](defender-for-devops-introduction.md). To learn how to onboard your GitHub environment to Defender for Cloud, follow the [GitHub onboarding guide](quickstart-onboard-github.md). To learn how to configure the Microsoft Security DevOps GitHub Action, see our [GitHub Action](github-action.md) documentation.

### Updated timelines toward MMA deprecation in Defender for Servers Plan 2

July 18, 2024

**Estimated date for change**: August 2024

With the [upcoming deprecation of Log Analytics agent in August](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/microsoft-defender-for-cloud-strategy-and-plan-towards-log/ba-p/3883341), all security value for server protection in Defender for Cloud will rely on integration with Microsoft Defender for Endpoint (MDE) as a single agent and on agentless capabilities provided by the cloud platform and agentless machine scanning.

The following capabilities have updated timelines and plans, thus the support for them over MMA will be extended for Defender for Cloud customers to the end of November 2024:

- **File Integrity Monitoring (FIM):** Public preview release for FIM new version over MDE is planned for **August 2024**. The GA version of FIM powered by Log Analytics agent will continue to be supported for existing customers until the end of **November 2024**.

- **Security Baseline:** as an alternative to the version based on MMA, the current preview version based on Guest Configuration will be released to general availability in **September 2024.** OS Security Baselines powered by Log Analytics agent will continue to be supported for existing customers until the end of **November 2024.**

For more information, see [Prepare for retirement of the Log Analytics agent](prepare-deprecation-log-analytics-mma-agent.md).

### Deprecation of MMA-related features as part of agent retirement

July 18, 2024

**Estimated date for change**: August 2024

As part of the [deprecation of the Microsoft Monitoring Agent (MMA) and the updated Defender for Servers deployment strategy](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/microsoft-defender-for-cloud-strategy-and-plan-towards-log/ba-p/3883341), all security features for Defender for Servers will now be provided through a single agent (Defender for Endpoint), or via agentless scanning capabilities. This won't require dependence on either the MMA or Azure Monitoring Agent (AMA).

As we approach the agent's retirement in August 2024, the following MMA-related features will be removed from the Defender for Cloud portal:

- Display of MMA installation status on the **Inventory** and **Resource Health** blades.
- [The capability](quickstart-onboard-machines.md#connect-on-premises-machines-by-using-the-azure-portal) to onboard new non-Azure servers to Defender for Servers via Log Analytics workspaces will be removed from both the **Inventory** and **Getting Started** blades.  

> [!NOTE]
> We recommend that current customers, who have onboarded on-premises servers using the [legacy approach](quickstart-onboard-machines.md), should now connect these machines via Azure Arc-enabled servers.  We  also recommend enabling the Defender for Servers Plan 2 on the Azure subscriptions to which these servers are connected.
>
>For those customers who have selectively enabled Defender for Servers Plan 2 on specific Azure VMs through the [legacy approach](quickstart-onboard-machines.md#connect-on-premises-machines-by-using-the-azure-portal), we recommend enabling the Defender for Servers Plan 2 on the Azure subscriptions of these machines. You can then exclude individual machines from the Defender for Servers coverage using the Defender for Servers [per-resource configuration](tutorial-enable-servers-plan.md).
>
> These steps will ensure there is no loss of security coverage due to the retirement of the Log Analytics agent.

To maintain security continuity, we advise customers with Defender for Servers Plan 2 to enable [agentless machine scanning](enable-agentless-scanning-vms.md) and [integration with Microsoft Defender for Endpoint](enable-defender-for-endpoint.md) on their subscriptions.

You can use [this custom workbook](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Workbooks/Defender%20for%20Servers%20Deployment%20Status) to keep track of your Log Analytics Agent (MMA) estate and monitor the deployment status of Defender for Servers across Azure VMs and Azure Arc machines.

For more information, see [Prepare for retirement of the Log Analytics agent](prepare-deprecation-log-analytics-mma-agent.md).

### Binary Drift public preview now available in Defender for Containers

We're introducing the public preview of Binary Drift for Defender for Containers. This feature aids in identifying and mitigating potential security risks associated with unauthorized binaries in your containers. Binary Drift autonomously identifies and sends alerts about potentially harmful binary processes within your containers. Furthermore, it allows the implementation of a new Binary Drift Policy to control alert preferences, offering the ability to tailor notifications to specific security needs.
For more information about this feature, see [Binary Drift Detection](binary-drift-detection.md)

### Automated remediation scripts for AWS and GCP are now GA

July 14, 2024

In March, we released automated remediation scripts for AWS & GCP to Public Preview, that allows you to remediate recommendations for AWS & GCP at scale programmatically.

Today we're releasing this feature to  generally available (GA). [Learn how to use automated remediation scripts](implement-security-recommendations.md).

### GitHub application permissions update

July 11, 2024

**Estimated date for change**: July 18, 2024

DevOps security in Defender for Cloud is constantly making updates that require customers with GitHub connectors in Defender for Cloud to update the permissions for the Microsoft Security DevOps application in GitHub.

As part of this update, the GitHub application will require GitHub Copilot Business read permissions. This permission will be used to help customers better secure their GitHub Copilot deployments. We suggest updating the application as soon as possible.

Permissions can be granted in two different ways:

1. In your GitHub organization, navigate to the Microsoft Security DevOps application within **Settings > GitHub Apps** and accept the permissions request.

1. In an automated email from GitHub Support, select **Review permission request** to accept or reject this change.

### Compliance standards are now GA

July 10, 2024

In March, we added preview versions of many new compliance standards for customers to validate their AWS and GCP resources against.

Those standards included CIS Google Kubernetes Engine (GKE) Benchmark, ISO/IEC 27001 and ISO/IEC 27002, CRI Profile, CSA Cloud Controls Matrix (CCM), Brazilian General Personal Data Protection Law (LGPD), California Consumer Privacy Act (CCPA), and more.

Those preview standards are now generally available (GA).

Check out the [full list of supported compliance standards](concept-regulatory-compliance-standards.md#available-compliance-standards).

### Inventory experience improvement

July 9, 2024

**Estimated date for change**: July 11, 2024

The inventory experience will be updated to improve performance, including improvements to the pane's 'Open query' query logic in Azure Resource Graph. Updates to the logic behind Azure resource calculation might result in other resources counted and presented.

### Container mapping tool to run by default in GitHub

July 8, 2024

**Estimated date for change**: August 12, 2024

With DevOps security capabilities in Microsoft Defender Cloud Security Posture Management (CSPM), you can map your cloud-native applications from code to cloud to easily kick off developer remediation workflows and reduce the time to remediation of vulnerabilities in your container images. Currently, you must manually configure the container image mapping tool to run in the Microsoft Security DevOps action in GitHub. With this change, container mapping will run by default as part of the Microsoft Security DevOps action. [Learn more about the Microsoft Security DevOps action](https://github.com/microsoft/security-devops-action/blob/main/README.md#advanced).

## June 2024

| Date    | Category             | Update                                                       |
| ------- | -------------------- | ------------------------------------------------------------ |
| June 27 | GA                   | [Checkov IaC Scanning in Defender for Cloud](#ga-checkov-iac-scanning-in-defender-for-cloud). |
| June 24 | Update               | [Change in pricing for multicloud Defender for Containers](#update-change-in-pricing-for-defender-for-containers-in-multicloud) |
| June 20 | Upcoming deprecation | [Reminder of deprecation for adaptive recommendations at Microsoft Monitoring Agent (MMA) deprecation](#deprecation-reminder-of-deprecation-for-adaptive-recommendations).<br/><br/> Estimated deprecation August 2024. |
| June 10 | Preview              | [Copilot in Defender for Cloud](#preview-copilot-in-defender-for-cloud) |
| June 10 | Upcoming update      | [SQL vulnerability assessment automatic enablement using express configuration on unconfigured servers](#update-sql-vulnerability-assessment-automatic-enablement).<br/><br/> Estimated update: July 10, 2024. |
| June 3  | Upcoming update      | [Changes in identity recommendations behavior](#update-changes-in-identity-recommendations-behavior)<br/><br/> Estimated update: July 10 2024. |

### GA: Checkov IaC Scanning in Defender for Cloud

June 27, 2024

We're announcing the general availability of the Checkov integration for Infrastructure-as-Code (IaC) scanning through Microsoft Security DevOps ([MSDO](azure-devops-extension.yml)). As part of this release, Checkov will replace TerraScan as a default IaC analyzer that runs as part of the MSDO Command-Line Interface (CLI). TerraScan might still be configured manually through MSDO's [environment variables](https://github.com/microsoft/security-devops-azdevops/wiki) but won't run by default.

Security findings from Checkov present as recommendations for both Azure DevOps and GitHub repositories under the assessments *Azure DevOps repositories should have infrastructure as code findings resolved* and *GitHub repositories should have infrastructure as code findings resolved*.

To learn more about DevOps security in Defender for Cloud, see the [DevOps Security Overview](defender-for-devops-introduction.md). To learn how to configure the MSDO CLI, see the [Azure DevOps](azure-devops-extension.yml) or [GitHub](github-action.md) documentation.

### Update: Change in pricing for Defender for Containers in multicloud

June 24, 2024

Since Defender for Containers in multicloud is now generally available, it's no longer free of charge. For more information, see [Microsoft Defender for Cloud pricing](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

### Deprecation: Reminder of deprecation for adaptive recommendations

June 20, 2024

**Estimated date for change**: August  2024

As part of the [MMA deprecation and the Defender for Servers updated deployment strategy](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/microsoft-defender-for-cloud-strategy-and-plan-towards-log/ba-p/3883341), Defender for Servers security features will be provided through the Microsoft Defender for Endpoint (MDE) agent, or through the [agentless scanning capabilities](enable-agentless-scanning-vms.md). Both of these options won't depend on either the MMA or Azure Monitoring Agent (AMA).

Adaptive Security Recommendations, known as Adaptive Application Controls and Adaptive Network Hardening, will be discontinued. The current GA version based on the MMA and the preview version based on the AMA will be deprecated in August 2024.

### Preview: Copilot in Defender for Cloud

June 10, 2024

We're announcing the integration of Microsoft Security Copilot into Defender for Cloud in public preview. Copilot's embedded experience in Defender for Cloud provides users with the ability to ask questions and get answers in natural language. Copilot can help you understand the context of a recommendation, the effect of implementing a recommendation, the steps needed to take to implement a recommendation, assist with the delegation of recommendations, and assist with the remediation of misconfigurations in code.

Learn more about [Microsoft Security Copilot in Defender for Cloud](copilot-security-in-defender-for-cloud.md).

### Update: SQL vulnerability assessment automatic enablement

June 10, 2024

**Estimated date for change**: July 10, 2024

Originally, SQL Vulnerability Assessment (VA) with Express Configuration was only automatically enabled on servers where Microsoft Defender for SQL was activated after the introduction of Express Configuration in December 2022.

We'll be updating all Azure SQL Servers that had Microsoft Defender for SQL activated before December 2022 and had no existing SQL VA policy in place, to have SQL Vulnerability Assessment (SQL VA) automatically enabled with Express Configuration.

- The implementation of this change will be gradual, spanning several weeks, and doesn't require any action on the user's part.
- This change applies to Azure SQL Servers where Microsoft Defender for SQL was activated at the Azure subscription level.
- Servers with an existing classic configuration (whether valid or invalid) won't be affected by this change.
- Upon activation, the recommendation 'SQL databases should have vulnerability findings resolved' might appear and could potentially impact your secure score.

### Update: Changes in identity recommendations behavior

June 3, 2024

**Estimated date for change**: July 2024

These changes:

- The assessed resource will become the identity instead of the subscription
- The recommendations won't have 'subrecommendations' anymore
- The value of the 'assessmentKey' field in the API will be changed for those recommendations

Will be applied to the following recommendations:

- Accounts with owner permissions on Azure resources should be MFA enabled
- Accounts with write permissions on Azure resources should be MFA enabled
- Accounts with read permissions on Azure resources should be MFA enabled
- Guest accounts with owner permissions on Azure resources should be removed
- Guest accounts with write permissions on Azure resources should be removed
- Guest accounts with read permissions on Azure resources should be removed
- Blocked accounts with owner permissions on Azure resources should be removed
- Blocked accounts with read and write permissions on Azure resources should be removed
- A maximum of three owners should be designated for your subscription
- There should be more than one owner assigned to your subscription

## May 2024

|Date|Category|Update |
|--|--|--|
| May 30 | GA | [Agentless malware detection in Defender for Servers Plan 2](#ga-agentless-malware-detection-in-defender-for-servers-plan-2) |
| May 22 | Update |[Configure email notifications for attack paths](#update-configure-email-notifications-for-attack-paths) |
| May 21 | Update |[Advanced hunting in Microsoft Defender XDR includes Defender for Cloud alerts and incidents](#update-advanced-hunting-in-microsoft-defender-xdr-includes-defender-for-cloud-alerts-and-incidents) |
| May 9 | Preview | [Checkov integration for IaC scanning in Defender for Cloud](#preview-checkov-integration-for-iac-scanning-in-defender-for-cloud) |
| May 7 | GA | [Permissions management in Defender for Cloud](#ga-permissions-management-in-defender-for-cloud) |
| May 6 | Preview | [AI multicloud security posture management is available for Azure and AWS](#preview-ai-multicloud-security-posture-management). |
| May 6 | Limited preview | [Threat protection for AI workloads in Azure](#limited-preview-threat-protection-for-ai-workloads-in-azure). |
| May 2 | Update |[Security policy management](#ga-security-policy-management). |
| May 1 | Preview | [Defender for open-source databases is now available on AWS for Amazon instances](#preview-defender-for-open-source-databases-available-in-aws). |
| May 1 | Upcoming deprecation |[Removal of FIM over AMA and release of new version over Defender for Endpoint](#deprecation-removal-of-fim-with-ama).<br/><br/> Estimated Deprecation August 2024. |

### GA: Agentless malware detection in Defender for Servers Plan 2

May 30, 2024

Defender for Cloud's agentless malware detection for Azure VMs, AWS EC2 instances, and GCP VM instances is now generally available as a new feature in [Defender for Servers Plan 2](defender-for-servers-overview.md).

Agentless malware detection uses the [Microsoft Defender Antivirus](/microsoft-365/security/defender-endpoint/microsoft-defender-antivirus-windows) anti-malware engine to scan and detect malicious files. Detected threats trigger security alerts directly into Defender for Cloud and Defender XDR, where they can be investigated and remediated. Learn more about [agentless malware scanning](agentless-malware-scanning.md) for servers and [agentless scanning for VMs](concept-agentless-data-collection.md).

### Update: Configure email notifications for attack paths

May 22, 2024

You can now configure email notifications when an attack path is detected with a specified risk level or higher.
Learn how to [configure email notifications](configure-email-notifications.md).

### Update: Advanced hunting in Microsoft Defender XDR includes Defender for Cloud alerts and incidents

May 21, 2024

Defender for Cloud's alerts and incidents are now integrated with Microsoft Defender XDR and can be accessed in the Microsoft Defender Portal. This integration provides richer context to investigations that span cloud resources, devices, and identities. Learn about [advanced hunting in XDR integration](concept-integration-365.md#advanced-hunting-in-xdr).

### Preview: Checkov integration for IaC scanning in Defender for Cloud

May 9, 2024

Checkov integration for DevOps security in Defender for Cloud is now in preview. This integration improves both the quality and total number of Infrastructure-as-Code checks run by the MSDO CLI when scanning IaC templates.

While in preview, Checkov must be explicitly invoked through the 'tools' input parameter for the MSDO CLI.

Learn more about [DevOps security in Defender for Cloud](defender-for-devops-introduction.md) and configuring the MSDO CLI for [Azure DevOps](azure-devops-extension.yml) and [GitHub](github-action.md).

### GA: Permissions management in Defender for Cloud

May 7, 2024

[Permissions management](permissions-management.md) is now generally available in Defender for Cloud.

### Preview: AI multicloud security posture management

May 6, 2024

 AI security posture management is available in preview in Defender for Cloud. It provides AI security posture management capabilities for Azure and AWS, to enhance the security of your AI pipelines and services.

Learn more about [AI security posture management](ai-security-posture.md).

### Limited preview: Threat protection for AI workloads in Azure

May 6, 2024

Threat protection for AI workloads in Defender for Cloud is available in limited preview. This plan helps you monitor your Azure OpenAI powered applications in runtime for malicious activity, identify, and remediate security risks. It provides contextual insights into AI workload threat protection, integrating with [Responsible AI](/azure/ai-services/responsible-use-of-ai-overview) and Microsoft Threat Intelligence. Relevant security alerts are integrated into the Defender portal.

Learn more about [threat protection for AI workloads](ai-threat-protection.md).

### GA: Security policy management

May 2, 2024

Security policy management across clouds (Azure, AWS, GCP) is now generally available. This enables security teams to manage their security policies in a consistent way and with new features

Learn more about [security policies in Microsoft Defender for Cloud](security-policy-concept.md#work-with-security-standards).

### Preview: Defender for open-source databases available in AWS

May 1, 2024

Defender for open-source databases on AWS is now available in preview. It adds support for various types of Amazon Relational Database Service (RDS) instance types.

Learn more about [Defender for open-source databases](defender-for-databases-introduction.md) and how to [enable Defender for open-source databases on AWS](enable-defender-for-databases-aws.md).

### Deprecation: Removal of FIM (with AMA)

May 1, 2024

**Estimated date for change**: August 2024

As part of the [MMA deprecation and the Defender for Servers updated deployment strategy](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/microsoft-defender-for-cloud-strategy-and-plan-towards-log/ba-p/3883341), all Defender for Servers security features will be provided via a single agent (MDE), or via agentless scanning capabilities, and without dependency on either the MMA or AMA.

The new version of File Integrity Monitoring (FIM) over Microsoft Defender for Endpoint (MDE) allows you to meet compliance requirements by monitoring critical files and registries in real-time, auditing changes, and detecting suspicious file content alterations.

As part of this release, FIM experience over AMA will no longer be available through the Defender for Cloud portal beginning August 2024. For more information, see [File Integrity Monitoring experience - changes and migration guidance](prepare-deprecation-log-analytics-mma-agent.md#file-integrity-monitoring-experience---changes-and-migration-guidance).

For details on the new API version, see [Microsoft Defender for Cloud REST APIs](/rest/api/defenderforcloud-composite/operation-groups?view=rest-defenderforcloud-composite-latest&preserve-view=true).

## Next steps

Check [What's new in security recommendations and alerts](release-notes-recommendations-alerts.md).
