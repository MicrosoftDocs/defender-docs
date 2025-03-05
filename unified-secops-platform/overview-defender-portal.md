---
title: Microsoft Defender portal overview
description: Learn about the Microsoft services and features available in the Microsoft Defender portal.
search.appverid: met150
ms.service: unified-secops-platform
ms.author: cwatson
author: cwatson-cat
ms.localizationpriority: medium
ms.date: 11/14/2024
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: concept-article

# customer intent: As a security operations center leader, I want to learn about the services and features available in the Defender portal to help me determine whether Microsoft's unified SecOps platform meets my organization's requirements.
---

# Microsoft Defender portal

[Microsoft's unified security SecOps platform](overview-unified-security.md) combines Microsoft security services in the [Microsoft Defender portal](https://security.microsoft.com).

The portal provides a single location to monitor, manage, and configure pre-breach and post-breach security across on-premises and multicloud assets.

- **Pre-breach security**: Proactively visualize, assess, remediate, and monitor organizational security posture to reduce security risk and attack surfaces.
- **Post-breach security**: Continuously monitor, detect, investigate, and respond to real-time and emerging cybersecurity threats against organizational assets.

:::image type="content" source="./media/overview-defender-portal/defender-portal.png" alt-text="Screenshot of Microsoft Defender portal landing page" lightbox="./media/overview-defender-portal/defender-portal.png":::

## Portal services

The Defender portal combines many Microsoft security services.

Service | Details
--- | ---
**Microsoft Defender XDR**<br/><br/> Detect and respond to cybersecurity threats. | [Defender XDR includes a suite of services](/defender-xdr/microsoft-365-defender) that come together in the Defender portal to provide unified threat protection across the enterprise.<br/><br/> Defender XDR services collect, correlate, and analyze threat data and signals across endpoints and devices, identities, email, apps, and OT/IoT assets. In the portal you can review, investigate, and respond to security alerts and incidents, automatically disrupt attacks, and proactively hunt for threats.<br/><br/>[Learn more](defender-xdr-portal.md) about Defender XDR in the Defender portal.
**Microsoft Sentinel**<br/><br/> Collect, analyze, and manage security data at scale using automation and orchestration.| Microsoft Sentinel fully integrates with Defender XDR in the Defender portal, providing additional threat protection capabilities such as attack disruption, unified entities and incidents, and SOC optimization.<br/><br/> For more information, see [Microsoft Sentinel in the Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal).
**Microsoft Defender Threat Intelligence**<br/><br/> Integrate threat intelligence into SOC operations. | The [Defender Threat Intelligence](/defender/threat-intelligence/what-is-microsoft-defender-threat-intelligence-defender-ti) platform extends the threat intelligence capabilities that are included in Defender XDR and Microsoft Sentinel.<br/><br/> Gather data from multiple sources to provide a pool of threat intelligence signals and data. Security teams use this data to understand adversary activities, analyze attacks, and hunt for security threats.  
**Microsoft Security Exposure Management**<br/><br/> Proactively reduce security risk.| Use [Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management) to reduce organizational attack surfaces and remediate security posture.<br/><br/> Continuously discover assets and data to get a comprehensive view of security across business assets. With the additional data context that Security Exposure Management provides, you can clearly visualize, analyze, and remediate weak areas of security.
**Microsoft Defender for Cloud**<br/><br/> Protect cloud workloads. | [Defender for Cloud](/defender-xdr/microsoft-365-security-center-defender-cloud) improves multicloud security posture, and protects cloud workloads against threats.<br/><br/> Defender for Cloud integrates into the Defender portal to provide a unified view of cloud security alerts, and a single location for investigations.

## Accessing the portal

In the Defender portal **Permissions** page, use the following methods to configure user access:

Methods | Details
--- | ---
[Global Microsoft Entra roles](/defender-xdr/m365d-permissions) | Accounts with the following Global Microsoft Entra roles can access Microsoft Defender XDR functionality and data: <ul><li>Global administrator</li><li>Security administrator</li><li>Security Operator</li><li>Global Reader</li><li>Security Reader</li>
[Custom roles](/defender-xdr/custom-roles) | Allow access to specific data, tasks, and features using custom roles. Custom roles control granular access, and can be used together with Microsoft Entra global roles.
[Unified RBAC](/defender-xdr/manage-rbac) | Unified role-based access control (RBAC) provides a permissions management model for controlling user permissions in the Defender portal, and across services within the portal.

### Microsoft Sentinel permissions

When you're onboarded to Microsoft's unified SecOps platform, existing Azure RBAC permissions are used to work with Microsoft Sentinel features in the Defender portal.

- Manage roles and permissions for Microsoft Sentinel users in the Azure portal.
- Any Azure RBAC changes are reflected in the Defender portal.

For more information, see [Roles and permissions in Microsoft Sentinel](/azure/sentinel/roles).

## Working in the portal

On the **Home** page, your view is determined by the services included in your subscriptions. Access settings are based on your [portal permissions](#accessing-the-portal).

:::image type="content" source="./media/overview-defender-portal/home-page.png" alt-text="Screenshot of the Home page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/home-page.png":::

Feature | Details
--- | ---
**Home page** | The Home page provides a view of your environment's security state. Review active threats, resources at risk, and a summary of all-up security posture. Use the dashboard for an up-to-date snapshot, and drill down to details as needed.
**Portal notifications** | Portal notifications keep you up-to-date with important information, including updates, events, complete or in-progress actions, and warnings and errors.<br/><br/> Notifications are sorted by their generated time in the notification panel, with the most recent displayed first. For more information, see [Configure alert notifications](/defender-xdr/configure-email-notifications?toc=/unified-secops-platform/toc.json&bc=/unified-secops-platform/).
**Search** | As you search the portal, results are categorized by sections related to your search terms.<br/><br/> Search provides results from within the portal, from the Microsoft Tech Community, and from Microsoft Learn documentation. Search history is stored in your browser and is accessible for 30 days.
**Guided tour** | Get a guided tour of managing endpoint security, or managing email and collaboration security.
**What's new** | Learn about the latest updates from the [Microsoft Defender XDR blog](https://techcommunity.microsoft.com/category/microsoftsecurityandcompliance/blog/microsoftthreatprotectionblog).
**Community** | Learn from others in [Microsoft security discussion spaces](https://techcommunity.microsoft.com/category/MicrosoftSecurityandCompliance) on Tech Community.
**Add cards** | Customize the **Home** page to get information that's most important to you.

## Exposure management

In **Exposure management**, review the overall state of your security posture, exposure, and risk.

:::image type="content" source="./media/overview-defender-portal/exposure-management-page.png" alt-text="Screenshot of the Exposure Management page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/exposure-management-page.png":::

Feature | Details
--- | ---
**Exposure management overview** | This dashboard provides a quick view of devices and cloud resources, including internet-facing devices and critical assets. Learn how well your key security initiatives are doing and drill down into top metrics for high-value vulnerabilities. Get exposure levels for different types of resources, and track security progress over time.
**Attack surfaces** | Visualize exposure data with the attack surface map.<br/>Explore resources and connections on the map, and drill down to focus on specific assets.<br/>In the **Attack path management** dashboard, review potential attack paths across your organization that attackers might exploit, together with choke points and critical assets in the path.
**Exposure insights** | Review and explore aggregated security posture data and insights across resources and workloads.<br/>Assess posture and readiness for your most important security projects, and track project metrics over time.<br/>Get security recommendations to remediate exposure issues.
**Secure score** | Review posture metrics based on [Microsoft Secure Score](/defender-xdr/microsoft-secure-score). 
**Data connectors** | Connect third-party products to Security Exposure Management, and request new connectors.

For more information, see [Microsoft Security Exposure Management](/security-exposure-management/microsoft-security-exposure-management).

## Investigation and response 

The **Investigation and response** section provides a single location for investigating security incidents, and responding to threats across the enterprise.


### Investigate incidents and alerts

Manage and investigate security incidents in a single location and from a single queue in the Defender portal. The **Incidents** and **Alerts** queues shows current security incidents and alerts across your services.

:::image type="content" source="./media/overview-defender-portal/incidents-page.png" alt-text="Screenshot of the Incidents page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/incidents-page.png":::

Feature | Details
--- | ---
**Incidents** | On the **Incidents** dashboard, review a list of the latest incidents and prioritize those marked as high severity. Each incident groups correlated alerts and associated data that makes up an attack. Drill down in an incident to get a full attack story, including information about associated alerts, devices, users, investigations, and evidence.
**Alerts** | In the **Alerts** dashboard, review alerts. Alerts are signals issued by portal services in response to threat detection activity.<br/><br/> The unified alerts queue displays new and in progress alerts from the last seven days, with the most recent alerts at the top. Filter on alerts to investigate as needed.

For more information, see [Incidents and alerts in the Microsoft Defender portal](/defender-xdr/incidents-overview).

### Hunt for threats

The **Hunting** area allows you to proactively inspect security events and data to locate known and potential threats. 

:::image type="content" source="./media/overview-defender-portal/advanced-hunting-page.png" alt-text="Screenshot of the Advanted Hunting page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/advanced-hunting-page.png":::

Feature | Details
--- | ---
**Advanced hunting** | Explore and query up to 30 days of raw data. You can query using a guided query tool, use sample queries, or use [Kusto Query Language (KQL)](/kusto/query/?view=microsoft-sentinel&preserve-view=true) to build your own queries.
**Custom detection rules** | Create custom detection rules to proactively monitor and respond to events and system states. Use custom detection rules to trigger security alerts or automatic response actions.

For more information, see [Proactively hunt for threats with advanced hunting](/defender-xdr/advanced-hunting-overview) and [Custom detections overview](/defender-xdr/custom-detections-overview).

### Review pending threat remediations

Threat protection activity results in actions to remediate threats. Actions can be automated or manual. Actions that need approval or manual intervention are available in the **Action center**.

:::image type="content" source="./media/overview-defender-portal/action-center-page.png" alt-text="Screenshot of the Action Center page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/action-center-page.png":::

Feature | Details
--- | ---
**Action center** | Review the list of actions that need attention. Approve or reject actions one at a time, or in bulk. You can review action history to track remediation.
**Submissions** | Submit suspect spam, URLs, email issues and more to Microsoft.

For more information, see [Automated investigation and response](/defender-xdr/m365d-autoir) and [The Action center](/defender-xdr/m365d-action-center).

## Partner catalog

The **Partner catalog** section provides information about Defender partners.

:::image type="content" source="./media/overview-defender-portal/technology-partners-page.png" alt-text="Screenshot of the Technology Partners page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/technology-partners-page.png":::

The Defender portal supports the following types of partner integrations:

- **Third-party integrations** to help secure users with effective threat protection.
- **Professional services** that enhance detection, investigation, and threat intelligence capabilities.

## Threat intelligence

In the **Threat intelligence** section of the portal, get direct visibility into active and ongoing threat campaigns, and access threat intelligence information provided by the Defender Threat Intelligence platform.

:::image type="content" source="./media/overview-defender-portal/threat-analytics-page.png" alt-text="Screenshot of the Threat Analytics page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/threat-analytics-page.png":::

Feature | Details
--- | ---
**Threat analytics** | Learn which threats are currently relevant in your organization.<br/><br/>Assess threat severity, drill down into specific threat reports, and identity actions to take. Different types of threat analytics reports are available.
**Intel profiles** | Review curated threat intelligence content organized by threat actors, tools, and known vulnerabilities.
**Intel Explorer** | Review threat intelligence information, and drill down to search and investigate.
**Intel projects** | Review and create projects to organize indicators of interest and indicators of compromise from an investigation. A project includes associated artifacts and a detailed history of names, descriptions, collaborators, and monitoring profiles.

For more information, see [Threat analytics](/defender-xdr/threat-analytics).

## Assets

The **Assets** page provides a unified view of discovered and protected assets, including devices, users, mailboxes, and apps. Review the total number of assets of each type, and drill down into specific asset details.

:::image type="content" source="./media/overview-defender-portal/device-inventory-page.png" alt-text="Screenshot of the Device Inventory page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/device-inventory-page.png":::


Feature | Details
--- | ---
**Devices** |On the **Device Inventory** page, get an overview of discovered devices in each tenant to which you have access. Review devices by type, and focus on high risk or critical devices.<br/><br/> Group devices logically by adding tags for context, and exclude devices you don't want to assess. Start an automated investigation for devices.
**Identities** | Get a summary of your user and account inventory.

For more information, see [Device entity page](/defender-xdr/entity-page-device) and [User entity page](/defender-xdr/investigate-users).

## Microsoft Sentinel

Access Microsoft Sentinel capabilities in the Defender portal.

:::image type="content" source="./media/overview-defender-portal/sentinel-search-page.png" alt-text="Screenshot of the Sentinel Search page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/sentinel-search-page.png":::

Feature | Details
--- | ---
**Search** | [Search](/azure/sentinel/investigate-large-datasets) across logs, and access past searches.
**Threat management** | Visualize and monitor connected data with [workbooks](/azure/sentinel/monitor-your-data?tabs=defender-portal).<br/>[Investigate incidents](/azure/sentinel/investigate-incidents) and [classify alerts with entities](/azure/sentinel/customize-entity-activities?tabs=defender).<br/>Proactively [hunt for threats](/azure/sentinel/hunts) and [use notebooks](/azure/sentinel/hunting?tabs=azure-portal#notebooks-to-power-investigations) to power investigations.<br/> [Integrate threat intelligence](/azure/sentinel/threat-intelligence-integration) into threat detection, and [use the MITRE ATT&CK framework](/azure/sentinel/mitre-coverage) in analytics and incidents.
**Content management** | Discover and install out-of-the-box (OOTB) content from the [Content hub](/azure/sentinel/sentinel-solutions#discover-and-manage-microsoft-sentinel-content).<br/> Use [Microsoft Sentinel repositories](/azure/sentinel/ci-cd-custom-content) to connect to external source systems for continuous integration and delivery (CI/CD), rather than manually deploying and updating custom content.
**Configuration** | Ingest data by using [data connectors](/azure/sentinel/best-practices-data).<br/>[Create watchlists](/azure/sentinel/watchlists) to correlate and organize data sources.<br/>[Set up analytics rules](/azure/sentinel/threat-detection) to query and analyze collected data.<br/> [Automate](/azure/sentinel/automation/automation#automation-with-the-unified-security-operations-platform) threat responses.

For more information, see [Microsoft Sentinel](/azure/sentinel/overview) and [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal).

## Identities

In the **Identities** section of the Defender portal, monitor user and account health, and proactively manage identity-related risks with Defender for Identity.

:::image type="content" source="./media/overview-defender-portal/identity-dashboard.png" alt-text="Screenshot of the Identity Dashboard page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/identity-dashboard.png":::

Feature | Details
--- | ---
**ITDR dashboard** | On the [Identity threat detection and response (ITDR) dashboard](/defender-for-identity/dashboard), get insights and real-time data about the security state of users and accounts.<br/><br/> The dashboard includes information about Defender for Identity deployment, information about highly privileged identities, and information about identity-related incidents.<br/><br/> If there's a problem with a Defender for Identity workspace, it's raised on the [Health issues page](/defender-for-identity/health-alerts).
**Health issues** | Any Defender for Identity global or sensor-based health issues are displayed on this page.
**Tools** | Access common tools to help you manage Defender for Identity.

For more information, see [Microsoft Defender for Identity](/defender-for-identity).

## Endpoints

In the **Endpoints** section of the portal, monitor and manage asset vulnerabilities with Microsoft Defender Vulnerability Management.

:::image type="content" source="./media/overview-defender-portal/vulnerability-management-dashboard.png" alt-text="Screenshot of the Microsoft Defender Vulnerability Management dashboard in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/vulnerability-management-dashboard.png":::

Feature | Details
--- | ---
**Vulnerability management** | Review vulnerability state in the dashboard. Get recommendations based on vulnerability assessment of devices, and remediate as needed.<br/> Review your organizational [software inventory](/defender-vulnerability-management/tvm-software-inventory), including vulnerable components, certificates, and hardware.<br/>Review [CVEs and security advisories](/defender-vulnerability-management/tvm-weaknesses-security-advisories).<br/> Review the [event timeline](/defender-vulnerability-management/threat-and-vuln-mgt-event-timeline) to determine the impact of vulnerabilities.<br/> Use [security baseline assessment](/defender-vulnerability-management/tvm-security-baselines) to assess devices against security benchmarks.
**Connected applications** | Get information about the [Microsoft Entra applications connected to Defender for Endpoint](/defender-endpoint/connected-applications).
**API explorer** | [Use the API explorer](/defender-endpoint/api/api-explorer) to construct and run API queries, test, and sent requests for available Defender for Endpoint API endpoints.

For more information, see [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) and [Microsoft Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint).

## Email and collaboration

In the **Email & collaboration** section, monitor, investigate, and manage security threats and responses to email and collaboration apps with Microsoft Defender for Office 365.

<!--can we get a better screenshot here?-->

:::image type="content" source="./media/overview-defender-portal/email-investigations.png" alt-text="Screenshot of the Email Investigations page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/email-investigations.png":::

Feature | Details
--- | ---
**Investigations** | Run and review automated investigations.
**Explorer** | Hunt, investigate, and explore threats to emails and documents. Drill down into specific types of threats, including malware, phishing, and campaigns.
**Review** | Manage quarantined items and restricted senders.
**Campaigns** | Analyze coordinated attacks against your organization.
**Threat tracker** | Review saved and tracked queries, and follow trending campaigns.
**Policies and rules** | Configure and manage security policies to protect against threats, and receive activity alerts.

For more information, see [Microsoft Defender for Office 365](/defender-office-365/mdo-about).

## Cloud apps

In the **Cloud apps** section, review security to minimize risk and exposure to cloud apps using Microsoft Defender for Cloud Apps.

:::image type="content" source="./media/overview-defender-portal/cloud-apps-sample-report.png" alt-text="Screenshot of a Cloud Apps sample report in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/cloud-apps-sample-report.png":::

Feature | Details
--- | ---
**Cloud discovery** | Get an overview of cloud app security with [discovery reports](/defender-cloud-apps/set-up-cloud-discovery). Review a sample report, and create new reports.
**Cloud app catalog** | Get an overview of well-known cloud apps and their associated risk. You can sanction and unsanction apps as needed.
**OAuth apps** | Get visibility into [OAuth apps](/defender-cloud-apps/investigate-risky-oauth). Review apps, and filter settings to drill down.
**Activity log** | Review connected [app activity](/defender-cloud-apps/activity-filters) by cloud name, IP address, and related devices.
**Governance log** | Review [governance actions](/defender-cloud-apps/governance-actions).
**Policies** | Configure security policies for cloud apps. 

For more information, see [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps).

## SOC optimization

In the **SOC optimization** page, tighten up security controls to close threat coverage gaps, and tighten data ingestion rates  based on high-fidelity and actionable recommendations. SOC optimizations are tailored to your environment and based on your current coverage and threat landscape.

:::image type="content" source="./media/overview-defender-portal/soc-optimization-page.png" alt-text="Screenshot of the SOC Optimization page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/soc-optimization-page.png":::

For more information, see [Optimize your security operations](/azure/sentinel/soc-optimization/soc-optimization-access).

## Reports

In the **Reports** page, review security reports across all areas, assets, and workloads. Available reports depend on the security services you have access to.

:::image type="content" source="./media/overview-defender-portal/reports-page.png" alt-text="Screenshot of the Reports page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/reports-page.png":::

## Trials

In the **Trials** page, review trial solutions, designed to help you make decisions about upgrades and purchases.

:::image type="content" source="./media/overview-defender-portal/trials-page.png" alt-text="Screenshot of the  page Microsoft Security Trials page in the Microsoft Defender portal" lightbox="./media/overview-defender-portal/trials-page.png":::
