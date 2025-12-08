---
title: What's new in Microsoft Defender for Cloud features
description: What's new and updated in Microsoft Defender for Cloud features
ms.topic: overview
ms.date: 12/08/2025
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

## December 2025

|Date | Category | Update|
| -------- | -------- | -------- |
|December 2, 2025| Upcoming change | [Updated CIEM recommendation logic](#upcoming-change-to-ciem-recommendation-logic)|
|December 1, 2025| GA | [General availability of the Endor Labs integration](#general-availability-of-the-endor-labs-integration) |
| December 1, 2025 | Preview | [Cloud posture management adds serverless protection for Azure and AWS (Preview)](#cloud-posture-management-adds-serverless-protection-for-azure-and-aws-preview) |

### Upcoming change to CIEM recommendation logic

December 2, 2025

As part of the ongoing [deprecation of the Microsoft Entra Permissions Management](https://techcommunity.microsoft.com/blog/microsoft-entra-blog/important-change-announcement-microsoft-entra-permissions-management-end-of-sale/4399382) functionality, Microsoft Defender for Cloud is updating its Cloud Infrastructure Entitlement Management (CIEM) recommendation logic across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP). This update improves accuracy, reduces noise, and changes how inactive identities and over-permissioned roles are evaluated.

**Key changes to CIEM**

- Inactive identity detection now uses unused role assignments rather than sign-in activity.
- Lookback window extended to 90 days (previously 45).
- Identities created within the past 90 days will not be evaluated as inactive.

**Cloud-specific requirements**

| Cloud | Change |
|-------|--------|
| Azure | Inactive identity recommendations now include read-level permission evaluation for improved fidelity. |
| AWS | - CIEM evaluations now apply to all AWS users and roles whose permissions can be reliably assessed.<br>- SAML and SSO identities require AWS CloudTrail Logs (Preview) to be enabled within the Defender CSPM plan.<br>- Serverless and compute identities are no longer included in CIEM’s inactivity logic, which may change recommendation counts. |
| GCP | CIEM evaluations require Cloud Logging ingestion (Preview) to be enabled within the Defender CSPM plan. |

The Permissions Creep Index (PCI) metric is being deprecated and will no longer appear in the Defender for Cloud recommendations. PCI is replaced by the improved activity-based CIEM logic, offering clearer guidance and more consistent identity risk insights.

Learn more about [permissions management in Defender for Cloud](permissions-management.md).

### General availability of the Endor Labs integration

December 1, 2025

Defender for Cloud's integration with Endor labs is now generally available.

Defender for Cloud's integration with Endor Labs enhances vulnerability analysis by using reachability-based Software Composition Analysis (SCA), which shows exploitable vulnerabilities from code to runtime.

Learn more about the [Endor Labs integration](integration-endor-labs.md).

### Cloud posture management adds serverless protection for Azure and AWS (Preview)

December 1, 2025

Defender for Cloud extends the capabilities of the Defender Cloud Security Posture Management (CSPM) plan to serverless workloads in Azure and Amazon Web Service (AWS) **(Preview)** in both the Azure portal and the Defender portal.

Currently, the available features vary by portal. The following table shows which features are available in each portal: 

| Feature | Defender for Cloud portal | Defender portal |
|--|--|--|
| Onboarding through the Defender CSPM plan | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: |
| Review misconfiguration recommendations | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | 
| Build queries with the cloud security explorer | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="../defender-for-cloud/media/icons/no-icon.png"::: |
| Explore workloads in Cloud Inventory | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: | 
| Investigate attack paths | :::image type="icon" source="./media/icons/yes-icon.png"::: | :::image type="icon" source="./media/icons/yes-icon.png"::: |
| Vulnerability Assessment | - | :::image type="icon" source="./media/icons/yes-icon.png"::: |

This release introduces automatic discovery and security posture assessment for:
- Azure Functions
- Azure Web Apps
- AWS Lambda functions

Security teams can view all serverless resources in a centralized inventory and identify misconfigurations, vulnerabilities, and insecure dependencies.

Learn more about [Serverless protection](serverless-protection.md).

## November 2025

|Date | Category | Update|
| -------- | -------- | -------- |
|November 26, 2025 | GA | [Kubernetes gated deployment (GA)](#kubernetes-gated-deployment-ga)|
|November 25, 2025 | Preview | [Defender for Cloud integration into the Defender portal](#defender-for-cloud-integration-into-the-defender-portal-preview)|
|November 25, 2025 | Update | [Documentation updates](#documentation-updates) |
|November 25, 2025 | Preview | [Discover Azure AI Foundry agents in your environment (Preview)](#discover-azure-ai-foundry-agents-in-your-environment-preview) |
|November 25, 2025 | GA | [General availability of AI security posture management in GCP Vertex](#general-availability-of-ai-security-posture-management-in-gcp-vertex) |
|November 24, 2025 | Update | [Update to Attack Path Analysis logic](#update-to-attack-path-analysis-logic)|
|November 24,2025 | Upcoming change | [Update to CSPM multicloud network requirements](#update-to-cspm-multicloud-network-requirements) |
|November 20, 2025| GA | [Attack Path now includes Entra OAuth application compromise](#attack-path-now-includes-microsoft-entra-oauth-application-compromise)|
|November 19, 2025| Preview |[In-pipeline container vulnerability scanning (preview)](#in-pipeline-container-vulnerability-scanning-preview)|
|November 19, 2025| GA | [General availability of agentless vulnerability assessment for AKS runtime containers](#general-availability-of-agentless-vulnerability-assessment-for-aks-runtime-containers)|
|November 18, 2025| Preview|[Advanced security posture for API discovery (Preview)](#advanced-security-posture-for-api-discovery-preview)|
|November 17, 2025| Preview | [Microsoft Cloud Security Benchmark v2 in Defender for Cloud (Preview)](#microsoft-cloud-security-benchmark-v2-in-defender-for-cloud-preview)|
|November 12, 2025| Preview |[Restrict Pod Access response action (preview)](#restrict-pod-access-response-action-preview)|
|November 10, 2025| GA |[Updates to container image continuous vulnerability rescan policy](#updates-to-container-image-continuous-vulnerability-rescan-policy)|
|November 3, 2025| GA | [General Availability release for Jfrog Artifactory and Docker Hub container registries support by Defender for Containers and Defender CSPM](#general-availability-of-jfrog-artifactory-and-docker-hub-container-registry-support)|
|November 3, 2025| GA | [Additional compliance frameworks now generally available](#general-availability-of-compliance-frameworks)|

### Kubernetes gated deployment (GA)

November 26, 2025

Kubernetes gated deployment in Microsoft Defender for Containers is now generally available. This feature enforces container image security at deployment time by using Kubernetes admission control.

**Key capabilities**

- **Admission control for Kubernetes clusters**: Blocks or audits deployments of container images that violate organizational security rules.
- **Security rules framework**: Define custom rules for AKS, EKS, and GKE clusters based on vulnerability assessment results.
- **Audit and Deny modes**: 
  - *Audit*: Generates recommendations when deployments violate security rules
  - *Deny*: Prevents noncompliant images from being deployed
- **Multicloud support**: Works with Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), and Google Artifact Registry.
- **Integrated monitoring**: View admission monitoring and violation details in the Defender for Cloud portal.

**GA improvements**

- Streamlined setup experience in the Defender for Cloud portal
- Default audit rule enabled for faster onboarding
- Scoped exemption management for specific namespaces or workloads
- Performance optimizations with reduced latency for admission decisions
- Enhanced documentation for troubleshooting and developer experience

Learn more about [gated deployment for Kubernetes container images](runtime-gated-overview.md), [how to enable gated deployment](enablement-guide-runtime-gated.md), and [gated deployment FAQ](faq-runtime-gated.md).

### Defender for Cloud integration into the Defender portal (preview)

November 25, 2025

**Microsoft Defender for Cloud** (MDC) is now deeply integrated into the Defender portal and part of the broader Microsoft Security eco-system. With threat protection already deeply embedded into the Defender portal, this integration adds posture management, bringing together a complete cloud security solution in one unified experience. This native-integration eliminates silos so security teams can see and act on threats across all cloud, hybrid, and code environments from one place.

This integration brings new value and benefits for security personas:

**Unified cloud security experience** – Cloud security is now fully integrated into the Microsoft Defender portal at security.microsoft.com, giving security teams a single, unified view across all workloads. This integration eliminates the need to switch between tools and portals, enabling SOC teams to work more efficiently with complete security posture visibility across workloads. The new cloud-agnostic integration supports Azure, AWS, GCP, and other platforms in a single interface, making it ideal for hybrid and multicloud organizations seeking comprehensive exposure management too. For more information.

**Cloud dashboard** - The new cloud security dashboard centralizes both posture management and threat protection, giving security personas an overview of their environment. It also highlights the top improvement actions for risk reduction, workload-specific views with security insights and includes tools to track security progress over time out of the box. The unified dashboard consolidates security posture, Defender coverage, cloud assets, health data, and exposure insights across Azure, AWS, and GCP environments. For more information, see [Cloud Overview dashboard](cloud-infrastructure-dashboard.md).

**Cloud asset inventory** – A centralized inventory that offers a comprehensive view of cloud and code assets across Azure, AWS, and GCP. Assets are categorized by workload, criticality, and coverage, with integrated health data, device actions, and risk signals. Information security and SOC teams can easily access resource-specific views, exposure map, and metadata to address security recommendations and respond quickly to threats. For more information, see [Asset inventory](asset-inventory.md?pivots=defender-portal).

**Unified cloud security posture capabilities** – We're unifying all the cloud security posture management (CSPM) capabilities into **Microsoft Security Exposure Management** (MSEM). Security personas can now view secure scores, prioritized recommendations, attack paths and vulnerabilities in a single pane of glass, empowering them to reduce risk and get a holistic view of all their posture end-to-end including devices, identities, SaaS apps, and data. For more information, see [What's new in Microsoft Security Exposure Management](/security-exposure-management/whats-new).

**Granular access management** – Security teams can now provide targeted access to security content, so only relevant users see necessary information. This access model allows users to view security insights without direct resource permissions, enhancing operational security and compliance. Using a new cloud scopes capability, cloud accounts like Azure subscriptions, AWS accounts, and GCP projects can be organized into logical groups for improved data pivoting and RBAC, supporting segmentation by business unit, region, or workload with persistent filtering across dashboards and workflows. For more information, see [Cloud Scopes and Unified RBAC](cloud-scopes-unified-rbac.md).

**New modeling for security recommendations**

Security recommendations now use a unified model where each finding appears as its own recommendation. Previously, some recommendations grouped multiple findings (for example, **“Vulnerabilities should be resolved”**), which made prioritization and governance harder.

With this change, you get:

- **Smarter prioritization** based on individual impact  
- **Governance** - more detailed usage of governance, recommendations, and exemption capabilities
- **More accurate scoring** since each finding counts separately  

In the Defender portal, only the new model is available. In the Azure portal, the new experience is in preview alongside the current model. This unified approach eliminates the need to treat aggregated recommendations differently, they’re now regular recommendations like all others. For more information, see [Security recommendations](review-security-recommendations.md?pivots=defender-portal).

**Risk-based Cloud Secure Score** - The new Cloud Secure Score introduces a new score formula, that allows you to objectively assess and monitor your cloud security posture. The Cloud Secure Score is based on asset risk factors and asset criticality, making the score more accurate and enabling smarter prioritization of high risk level recommendations. The new Cloud Secure Score is available only in the Defender portal. The classic Secure Score is still available in Azure portal. For more information, see [Cloud Secure Score](secure-score-security-controls.md?pivots=defender-portal).

For more information, see [Defender for Cloud in the Defender portal](defender-portal/defender-for-cloud-defender-portal.md)

### Documentation updates

November 25, 2025

We’ve begun a major revamp of the Microsoft Defender for Cloud documentation to streamline structure, remove outdated content, and add new material for the integration into the Defender portal.

**Highlights:**  

- **Simplified navigation**: A unified table of contents based on customer feedback.  
- **Mixed-mode experience**: Articles that cover both Azure and Defender portals with entry points at the top of the article.  
- **New Defender portal section**: Features recent enhancements, opt-in guidance, and known limitations.  

### Discover Azure AI Foundry agents in your environment (Preview)

November 25, 2025

You can now discover Azure AI Foundry agents in your environment using Defender for Cloud. This new preview feature helps you identify and monitor AI Foundry agents deployed across your resources, providing insights into their security posture and risks.

Learn more about [AI security posture management](ai-security-posture.md).

### General availability of AI security posture management in GCP Vertex

November 25, 2025

Defender for Cloud is announcing the general availability of AI security posture management for GCP Vertex AI. This new capability helps secure AI workloads on GCP by providing continuous monitoring, risk assessments, and actionable recommendations.

Learn more about [AI security posture management](ai-security-posture.md).

### Update to Attack Path Analysis logic

November 24, 2025

Attack paths that involve lateral movement with plain text keys are generated when both the source and target resources are protected by Defender CSPM. Because of this change, you might see a reduction in the number of attack paths displayed.

To maintain comprehensive attack path analysis, ensure that all of your cloud environments have the Defender CSPM plan enabled.

Learn more about [Attack Path Analysis](concept-attack-path.md) and how to enable [Defender CSPM](tutorial-enable-cspm-plan.md)

### Update to CSPM multicloud network requirements
 
November 24, 2025
Estimated date for change: December 2025

In December 2025, Defender for Cloud is adding IP addresses to its multicloud discovery services to accommodate improvements and ensure a more efficient experience for all users.

To ensure uninterrupted access from our services, your IP allow list should be [updated with the new ranges](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/Network%20requirements). 

You should make the necessary adjustments in your firewall settings, security groups, or any other configurations that might be applicable to your environment. The list is sufficient for full capability of the CSPM foundational (free) offering.

Learn more about [Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md).

### Attack Path now includes Microsoft Entra OAuth application compromise

November 20, 2025

Attack Path now shows how bad actors use compromised Microsoft Entra OAuth applications to move across environments and reach critical resources. This release helps security teams identify over-privileged identities and vulnerable OAuth applications to improve visibility and speed up remediation.

Learn more about [how to manage Attack Path](/azure/defender-for-cloud/how-to-manage-attack-path).

### In-pipeline container vulnerability scanning (preview)

November 19, 2025

In-pipeline container vulnerability scanning for Defender for DevOps Security is now available in preview through the Defender for Cloud CLI.

Scanning built container images directly within CI/CD workflows provides real-time feedback before they're pushed to registries or deployed. This feature helps you detect vulnerabilities earlier, accelerate remediation, and align security gates with DevOps practices.  

Learn more about the [Defender for Cloud CLI](cli-cicd-integration.md).

### General availability of agentless vulnerability assessment for AKS runtime containers

November 19, 2025

Defender for Containers and Defender for Cloud Security Posture Management (CSPM) plans now include agentless vulnerability assessment for AKS runtime containers. This update extends vulnerability assessment coverage to running containers that use images from any container registry, rather than only supported registries. It also continues to scan Kubernetes add-ons and third-party tooling running in your AKS clusters.

To enable this feature, make sure that **Agentless machine scanning** is turned on for your subscription in Defender for Cloud environment settings.

Learn more about [container vulnerability scanning in Defender for Cloud](agentless-vulnerability-assessment-azure.md).

### Advanced security posture for API discovery (Preview)

November 18, 2025

Microsoft Defender for Cloud API security posture management now automatically identifies unauthenticated APIs and APIs exposed to the internet across your environment, including APIs discovered on Azure Functions and Logic Apps.

With this release, you can uncover high-risk API endpoints earlier, prioritize API risks by using new posture insights and risk factors, and view and analyze discovered API risks across your environment by using security explorer.

Learn more about [API security posture management in Defender for Cloud](api-security-posture-overview.md).

### Microsoft Cloud Security Benchmark v2 in Defender for Cloud (Preview)

November 17, 2025  

Defender for Cloud is announcing the Microsoft Cloud Security Benchmark (MCSB) compliance standard v2 in preview. 

The MCSB provides a collection of high-impact security controls and recommendations to help secure cloud services across single and multicloud environments. MCSB v2 adds expanded risk and threat-based guidance, expanded Azure Policy measurements, and controls for securing AI workloads. The Regulatory compliance dashboard allows you to assess resources against MCSB v2 controls and track compliance posture across cloud environments. 

Learn more about the [Microsoft cloud security benchmark in Defender for Cloud](concept-regulatory-compliance.md).

### Restrict Pod Access response action (preview)

November 12, 2025

Defender for Containers now includes a new Restrict Pod Access response action, available in preview in Microsoft Defender XDR.

The action blocks sensitive interfaces within Kubernetes pods that could enable lateral movement or privilege escalation. Using this control helps contain potential breaches and reduce exposure within your cluster environments.  

Learn more about [Restrict Pod Access in Defender XDR](/defender-xdr/investigate-respond-container-threats).

### Updates to container image continuous vulnerability rescan policy

November 10, 2025

Microsoft Defender for Cloud has temporarily updated its container image continuous vulnerability rescan policy.

Images stored in container registries are scanned when pushed and periodically rescanned to maintain up-to-date vulnerability assessments. With this temporary update, images are now rescanned daily if they were pushed to or pulled from the registry within the last 30 days.

This change shortens the previous 90-day rescan period to 30 days, ensuring more current vulnerability data for actively used images. Vulnerability information for images older than 30 days remains available from previous scans but is no longer updated.

Learn more about [container vulnerability scanning in Defender for Cloud](agentless-vulnerability-assessment-azure.md). 

### General Availability of Jfrog Artifactory and Docker Hub container registry support

November 3, 2025

We’re announcing the general availability of Jfrog Artifactory (Cloud) and Docker Hub container registry support in Microsoft Defender for Containers and Defender CSPM.

This release extends Microsoft Defender for Containers coverage to external registries, enabling vulnerability scanning of container images stored in your organization’s JFrog Artifactory (Cloud) and Docker Hub accounts using Microsoft Defender Vulnerability Management (MDVM). This enhancement helps you detect vulnerabilities earlier and strengthen your cloud security posture.

Learn more about [Agentless vulnerability assessment for Jfrog Artifactory (Cloud)](agentless-vulnerability-assessment-jfrog-artifactory.md) and [Agentless vulnerability assessment for Docker Hub](agentless-vulnerability-assessment-docker-hub.md).

> [!NOTE]
> Billing for Jfrog Artifactory (Cloud) & container registry support by Defender for Containers & Defender CSPM will begin on **December 2, 2025**.
> For more information, see the [Microsoft Defender for Cloud Pricing Page](https://azure.microsoft.com/pricing/details/defender-for-cloud/)

### General availability of compliance frameworks

November 3, 2025

The following regulatory compliance standards, previously available in preview, are now generally available in Microsoft Defender for Cloud.

| Standard | Cloud |
|----------|-------|
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

- **Via email (for organization owners):** GitHub sends an automated email to **organization owners** with the subject **"Review permissions request for Microsoft Security DevOps"**. Select **Review permission request** to approve or reject the change.

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

Defender for Cloud now includes **open-source dependency vulnerability scanning** powered by [Trivy in filesystem mode](https://trivy.dev/docs/latest/scanner/vulnerability/). This helps you strengthen security by automatically detecting operating-system and library vulnerabilities across GitHub and Azure DevOps repositories.  

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

Learn more about [Defender for Cloud's government cloud coverage](support-matrix-defender-for-cloud.md).

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

## Next steps

Check [What's new in security recommendations and alerts](release-notes-recommendations-alerts.md).
