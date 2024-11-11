---
title: What's new in Microsoft Defender for Cloud features
description: What's new and updated in Microsoft Defender for Cloud features
ms.topic: overview
ms.date: 10/31/2024
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

## November 2024

|Date | Category | Update|
|--|--|--|
|November 17|GA|[Critical assets protection in Microsoft Defender for Cloud](#Critical-assets-protection-in-Microsoft-Defender-for-Cloud)|
| November 7 | GA | [Enhanced Kubernetes (K8s) Alert Documentation and Simulation Tool](#enhanced-kubernetes-k8s-alert-documentation-and-simulation-tool) |
| November 6 | GA | [Enhanced API security support for multi-regional Azure API Management deployments and managing API revisions](#enhanced-api-security-support-for-multi-regional-azure-api-management-deployments-and-managing-api-revisions) |

### Critical assets protection in Microsoft Defender for Cloud

November 17, 2024

Today we are releasing the Critical assets protection in Microsoft Defender for Cloud for General Availability. With Critical assets protection, Security Admins can tag the most critical resources to their business, to empower Defender for Cloud protect them in the most 

- Extend support for Kubernetes and Non-human identities

### Enhanced Kubernetes (K8s) Alert Documentation and Simulation Tool

November 7, 2024

#### Key features

* Scenario-based alert documentation: K8s alerts are now documented based on real-world scenarios, providing clearer guidance on potential threats and recommended actions.
* Microsoft Defender for Endpoint (MDE) integration: Alerts are enriched with additional context and threat intelligence from MDE, improving you the ability to respond effectively.
* New Simulation Tool: A powerful simulation tool is available to test your security posture by simulating various attack scenarios and generating corresponding alerts.

#### Benefits

* Improved alert understanding: Scenario-based documentation provides a more intuitive understanding of K8s alerts.
* Enhanced threat response: Alerts are enriched with valuable context, enabling faster and more accurate responses.
* Proactive security testing: The new simulation tool allows you to test your security defenses and identify potential vulnerabilities before they are exploited.

### Enhanced API security support for multi-regional Azure API Management deployments and managing API revisions

November 6, 2024

API security coverage within Defender for Cloud will now have full support for Azure API Management multi-region deployments, including full security posture and threat detection support to both primary and secondary regions

Onboarding and offboarding APIs to Defender for APIs will now be managed at the Azure API Management API level. All associated [Azure API Management revisions](/azure/api-management/api-management-revisions) will automatically be included in the process, eliminating the need to manage onboarding and offboarding for each API revision individually.

This change will include a one-time rollout to existing Defender for APIs customers.

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
| October 6 | GA | [Improved attack path analysis](#improved-attack-path-analysis) |
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

Kubernetes Identity and Access information is added to the security graph, including nodes that represent all Kubernetes Role Based Access Control (RBAC) related entitles (service accounts, roles, role bindings, etc.), and edges that represent the permissions between Kubernetes objects. Customers can now query the security graph for their Kubernetes RBAC, and related relationships between Kubernetes entities (Can Authenticate As, Can Impersonate As, Grants Role, Access Defined By, Grants Access To, Has Permission To, etc.)

### Kubernetes Identity and Access information-based attack paths (preview)

October 6, 2024

Using the Kubernetes RBAC data in the security graph, Defender for Cloud now detects Kubernetes, Kubernetes to Cloud, and inner Kubernetes lateral movement and reports on other attack paths where attackers can abuse Kubernetes and Cloud authorization for lateral movement to, from, and within Kubernetes clusters.

### Improved attack path analysis

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
|September 1| Preview |[Public Preview for Docker Hub container registry support by Defender for Containers](#public-preview-for-docker-hub-container-registry-support-by-defender-for-containers) |

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

Learn how to [enable Azure Policy guest configuration on your environment](configure-servers-coverage.md#enable-azure-policy-guest-configuration).

### Public Preview for Docker Hub container registry support by Defender for Containers

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

As part of this release, the [FIM experience over AMA](file-integrity-monitoring-enable-ama.md) will no longer be available in the Defender for Cloud portal.
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
> We recommend that current customers, who have onboarded on-premises servers using the [legacy approach](quickstart-onboard-machines.md#connect-on-premises-machines-by-using-the-azure-portal), should now connect these machines via Azure Arc-enabled servers.  We  also recommend enabling the Defender for Servers Plan 2 on the Azure subscriptions to which these servers are connected.
>
>For those customers who have selectively enabled Defender for Servers Plan 2 on specific Azure VMs through the [legacy approach](quickstart-onboard-machines.md#connect-on-premises-machines-by-using-the-azure-portal), we recommend enabling the Defender for Servers Plan 2 on the Azure subscriptions of these machines. You can then exclude individual machines from the Defender for Servers coverage using the Defender for Servers [per-resource configuration](tutorial-enable-servers-plan.md#enable-defender-for-servers-at-the-resource-level).
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
| June 10 | Preview              | [Copilot for Security in Defender for Cloud](#preview-copilot-for-security-in-defender-for-cloud) |
| June 10 | Upcoming update      | [SQL vulnerability assessment automatic enablement using express configuration on unconfigured servers](#update-sql-vulnerability-assessment-automatic-enablement).<br/><br/> Estimated update: July 10, 2024. |
| June 3  | Upcoming update      | [Changes in identity recommendations behavior](#update-changes-in-identity-recommendations-behavior)<br/><br/> Estimated update: July 10 2024. |

### GA: Checkov IaC Scanning in Defender for Cloud

June 27, 2024

We're announcing the general availability of the Checkov integration for Infrastructure-as-Code (IaC) scanning through [MSDO](azure-devops-extension.yml). As part of this release, Checkov will replace TerraScan as a default IaC analyzer that runs as part of the MSDO CLI. TerraScan might still be configured manually through MSDO's [environment variables](https://github.com/microsoft/security-devops-azdevops/wiki) but won't run by default.

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

### Preview: Copilot for Security in Defender for Cloud

June 10, 2024

We're announcing the integration of Microsoft Copilot for Security into Defender for Cloud in public preview. Copilot's embedded experience in Defender for Cloud provides users with the ability to ask questions and get answers in natural language. Copilot can help you understand the context of a recommendation, the effect of implementing a recommendation, the steps needed to take to implement a recommendation, assist with the delegation of recommendations, and assist with the remediation of misconfigurations in code.

Learn more about [Copilot for Security in Defender for Cloud](copilot-security-in-defender-for-cloud.md).

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

Defender for Cloud's agentless malware detection for Azure VMs, AWS EC2 instances, and GCP VM instances is now generally available as a new feature in [Defender for Servers Plan 2](plan-defender-for-servers-select-plan.md#plan-features).

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

Learn more about [security policies in Microsoft Defender for Cloud](security-policy-concept.md#working-with-security-standards).

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

For details on the new API version, see [Microsoft Defender for Cloud REST APIs](/rest/api/defenderforcloud/operation-groups).

## Next steps

Check [What's new in security recommendations and alerts](release-notes-recommendations-alerts.md).
