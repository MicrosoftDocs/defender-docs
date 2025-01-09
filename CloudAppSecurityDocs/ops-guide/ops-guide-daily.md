---
title: Daily operational guide - Microsoft Defender for Cloud Apps
description: This article provides daily operational recommendations to help security operations teams to plan and run security activities.
ms.date: 05/15/2024
ms.topic: reference
---

# Daily operational guide - Microsoft Defender for Cloud Apps

This article lists daily operational activities that we recommend you perform with Defender for Cloud Apps.

## Review alerts and incidents

Alerts and incidents are two of the most important items your security operations (SOC) team should be reviewing on a daily basis.

- Triage incidents and alerts regularly from the [incidents queue](https://security.microsoft.com/incidents) in Microsoft Defender XDR, prioritizing high and medium severity alerts.

- If you're working with a SIEM system, your SIEM system is usually the first stop for triage. SIEM systems provide more context with extra logs and SOAR functionality. Then, use Microsoft Defender XDR for a deeper understanding of an alert or incident timeline.

### Triage your incidents from Microsoft Defender XDR

**Where**: In Microsoft Defender XDR, select **Incidents & alerts**

**Persona**: SOC analysts

**When triaging incidents**:

1. In the incident dashboard, filter for the following items:

    |Filter  |Values  |
    |---------|---------|
    |**Status**     |  New, In progress       |
    |**Severity**     |  High, Medium, Low       |
    |**Service source**     |  Keep all service sources checked. Keeping all service source checked should list alerts with the most fidelity, with correlation across other Microsoft XDR workloads. Select **Defender for Cloud Apps** to view items that come specifically from Defender for Cloud Apps.       |

1. Select each incident to review all details. Review all tabs in the incident, the activity log, and advanced hunting.

    In the incident's **Evidence and response** tab, select each evidence item. Select the options menu > **Investigate** and then select **Activity log** or **Go hunt** as needed.

1. Triage your incidents. For each incident, select **Manage incident** and then select one of the following options:

    - **True positive**
    - **False positive**
    - **Informational, expected activity**

    For true alerts, specify the treat type to help your security team see threat patterns and defend your organization from risk.

1. When you're ready to start your active investigation, assign the incident to a user and update the incident status to **In progress**.

1. When the incident is remediated, resolve it to resolve all linked and related active alerts.

For more information, see:

- [Prioritize incidents in Microsoft Defender XDR](/microsoft-365/security/defender/incident-queue)
- [Investigate alerts in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-alerts)
- [Incident response playbooks](/security/operations/incident-response-playbooks)
- [How to investigate anomaly detection alerts](../investigate-anomaly-alerts.md)
- [Manage app governance alerts](../app-governance-manage-alerts.md)
- [Investigate threat detection alerts](../app-governance-anomaly-detection-alerts.md)

### Triage your incidents from your SIEM system

**Persona**: SOC analysts

**Prerequisites**: You must be connected to a SIEM system, and we recommend integrating with Microsoft Sentinel. For more information, see:

- [Microsoft Sentinel integration (Preview)](../siem-sentinel.md)
- [Connect data from Microsoft Defender XDR to Microsoft Sentinel](/azure/sentinel/connect-microsoft-365-defender)
- [Generic SIEM integration](../siem.md)

Integrating Microsoft Defender XDR with Microsoft Sentinel allows you to stream all Microsoft Defender XDR incidents into Microsoft Sentinel and keep them synchronized between both portals. Microsoft Defender XDR incidents in Microsoft Sentinel include all associated alerts, entities, and relevant information, providing enough context to triage and run a preliminary investigation.

Once in Microsoft Sentinel, incidents remain synchronized with Microsoft Defender XDR so that you can use the features from both portals in your investigation.

- When installing Microsoft Sentinel's data connector for Microsoft Defender XDR, make sure to include the Microsoft Defender for Cloud Apps option.
- Consider using a [streaming API](/microsoft-365/security/defender/streaming-api) to send data to an event hub, where it can be consumed through any partner SIEM with an event hub connector, or placed in Azure Storage.

For more information, see:

- [Microsoft Defender XDR integration with Microsoft Sentinel](/azure/sentinel/microsoft-365-defender-sentinel-integration)
- [Navigate and investigate incidents in Microsoft Sentinel](/azure/sentinel/investigate-incidents)
- [Create custom analytics rules to detect threats](/azure/sentinel/detect-threats-custom)

## Review threat detection data

**Where**: In the Microsoft Defender XDR Portal, select:

- **Incidents & alerts**
- **Cloud apps > Policies > Policy management > Threat Detection**
- **Cloud apps > Oauth apps**

**Persona**: Security administrators and SOC analysts

Cloud app threat detection is where many SOC analysts focus their daily activities, identifying high-risk users who showing abnormal behavior.

Defender for Cloud Apps threat detection uses Microsoft threat intelligence and security research data. Alerts are available in Microsoft Defender XDR and should be [triaged regularly](#review-alerts-and-incidents).

When security administrators and SOC analysts deal with alerts, they handle the following main types of threat detection policies:

- [Activity policies](../user-activity-policies.md)
- [Anomaly detection policies](../anomaly-detection-policy.md)
- [OAuth Policies](../app-permission-policy.md) and [App governance policies](../app-governance-manage-app-governance.md) 

**Persona**: Security administrator

Make sure to create the threat protection policies needed by your organization, including handling any prerequisites.

## Review application governance

**Where**: In the Microsoft Defender XDR Portal, select:

- **Incidents & alerts**
- **Incidents & alerts / App governance**

**Persona**: SOC analysts

App governance offers in-depth visibility and control over OAuth apps. App governance helps to combat increasingly sophisticated campaigns that exploit the apps deployed on-premises and in cloud infrastructures, establishing a starting point for privilege escalation, lateral movement, and data exfiltration.

App governance is provided together with Defender for Cloud Apps. Alerts are also available in Microsoft Defender XDR, and should be [triaged regularly](#review-alerts-and-incidents). 

For more information, see:

- [Discovery alerts](../app-governance-anomaly-detection-alerts.md#discovery-alerts)
- [Investigate predefined app policy alerts](../app-governance-investigate-predefined-policies.md)
- [Investigate and remediate risky OAuth apps](../investigate-risky-oauth.md)

### Check app governance overview page 

**Where**: In the Microsoft Defender XDR Portal, select:

- **Incidents & alerts**
- **Cloud apps > App governance > Overview**

**Persona**: SOC analysts and Security administrator

We recommend that you run a quick, daily assessment of the compliance posture of your apps and incidents. For example, check the following details:

- The number of over-privileged or highly privileged apps
- Apps with an unverified publisher
- Data usage for services and resources that were accessed using Graph API
- The number of apps that accessed data with the most common sensitivity labels
- The number of apps that accessed data with and without sensitivity labels across Microsoft 365 services
- An overview of app governance-related incidents

Based on the data you review, you might want to create new or adjust app governance policies.

For more information, see:

- [View and manage incidents and alerts](/microsoft-365/security/defender/mto-incidents-alerts)
- [View your app details with app governance](../app-governance-visibility-insights-view-apps.md)
- [Create app policies in app governance](../app-governance-app-policies-create.md).

### Review OAuth app data

**Where**: In the Microsoft Defender XDR Portal, select:

- **Incidents & alerts**
- **Cloud apps > App governance > Azure AD**

We recommend that you check your list of OAuth-enabled apps daily, together with relevant app metadata and usage data. Select an app to view deeper insights and information.

App governance uses machine learning-based detection algorithms to detect anomalous app behavior in your Microsoft Defender XDR tenant, and generates alerts that you can see, investigate, and resolve. Beyond this built-in detection capability, you can use a set of default policy templates or create your own app policies that generate other alerts.

For more information, see:

- [View and manage incidents and alerts](/microsoft-365/security/defender/mto-incidents-alerts)
- [View your app details with app governance](../app-governance-visibility-insights-view-apps.md)
- [Getting detailed information on an app](../app-governance-visibility-insights-view-apps.md#getting-detailed-information-on-an-app)

### Create and manage app governance policies

**Where**: In the Microsoft Defender XDR Portal, select **Cloud apps > App governance > Policies**

**Persona**: Security administrators

We recommend that you check your OAuth apps daily for regular in-depth visibility and control. Generate alerts based on machine learning algorithms, and create app policies for app governance.

For more information, see:

- [Create app policies in app governance](../app-governance-app-policies-create.md)
- [Manage app policies](../app-governance-app-policies-manage.md)

## Review Conditional Access app control

**Where**: In the Microsoft Defender XDR Portal, select:

- **Incidents & alerts**
- **Cloud apps > Policies > Policy Management > Conditional Access**

To configure Conditional Access app control, select **Settings > Cloud apps > Conditional Access App Control**

**Persona**: Security administrator

Conditional Access app control provides you with the ability to monitor and control user app access and sessions in real time, based on access and session policies.

Generated alerts are available in Microsoft Defender XDR and should be [triaged regularly](#review-alerts-and-incidents).

By default, there's no access or session policies deployed, and therefore no related alerts available. You can onboard any web app to work with access and session controls, Microsoft Entra ID apps are automatically onboarded. We recommend that you create session and access policies as needed for your organization.

For more information, see:

- [View and manage incidents and alerts](/microsoft-365/security/defender/mto-incidents-alerts)
- [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](../proxy-intro-aad.md)
- [Block and protect download of sensitive data to unmanaged or risky devices](../best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices)
- [Secure collaboration with external users by enforcing real-time session controls](../best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls)

**Persona**: SOC administrator

We recommend that you review Conditional Access app control alerts daily, and the activity log. Filter activity logs by source, access control, and session control.

For more information, see [Review alerts and incidents](#review-alerts-and-incidents)

## Review shadow IT - cloud discovery

**Where**: In the Microsoft Defender XDR Portal, select:

- **Incidents & alerts**
- **Cloud apps > Cloud discovery / Cloud app catalog**
- **Cloud apps > Policies > Policy Management > Shadow IT**

**Persona**: Security administrators

Defender for cloud apps analyzes your traffic logs against the cloud apps catalog of over 31,000 cloud apps. Apps are ranked and scored based on more than 90 risk factors to provide ongoing visibility into cloud use, Shadow IT, and the risks that Shadow IT poses into your organization.

Alerts related to cloud discovery are available in Microsoft Defender XDR and should be [triaged regularly](#review-alerts-and-incidents).

Create app discovery policies to start alerting and tagging newly discovered apps based on certain conditions, like risk scores, categories, and app behaviors like daily traffic and downloaded data.

> [!TIP]
> We recommend that you integrate Defender for Cloud Apps with Microsoft Defender for Endpoint to discover cloud apps beyond your corporate network or secure gateways and apply governance actions on your endpoints.

For more information, see:

- [View and manage incidents and alerts](/microsoft-365/security/defender/mto-incidents-alerts)
- [Cloud discovery policies](../policies-cloud-discovery.md)
- [Create cloud discovery policies](../cloud-discovery-policies.md)
- [Set up cloud discovery](../set-up-cloud-discovery.md)
- [Discover and assess cloud apps](../best-practices.md#discover-and-assess-cloud-apps)

**Persona**: Security and Compliance administrators, SOC analysts

When you have large numbers of discovered apps, you might want to use the filtering options to learn more about your discovered apps. 

For more information, see [Discovered app filters and queries in Microsoft Defender for Cloud Apps](../discovered-app-queries.md).

## Review the cloud discovery dashboard

**Where**: In the Microsoft Defender XDR Portal, select **Cloud apps > Cloud discovery > Dashboard**.

**Persona**: Security and Compliance administrators, SOC analysts

We recommend reviewing your cloud discovery dashboard on a daily basis. The cloud discovery dashboard is designed to give you more insight into how cloud apps are used in your organization, with an at-a-glance overview of the kids of apps being used, your open alerts, and the risk levels of apps in your organization.

**On the cloud discovery dashboard**:

1. Use the widgets at the top of the page to understand your overall cloud app usage.
1. Filter the dashboard graphs to generate specific views, depending on your interest. For example:

    - Understand top categories of apps used in your org, especially for sanctioned apps.
    - Review risk scores for your discovered apps.
    - Filter views to see your top apps in specific categories.
    - View top users and IP addresses to identify the users who are the most dominant users of cloud apps in your organization.
    - View app data on a world map to understand how discovered apps spread by geographic location.

After reviewing the list of discovered apps in your environment, we recommend that you secure your environment by approving safe apps (*Sanctioned* apps), prohibiting unwanted apps (*Unsanctioned* apps), or applying custom tags.

You might also want to proactively review and apply tags to the apps available in the cloud app catalog before they're discovered in your environment. To help you govern those applications, create relevant cloud discovery policies, triggered by specific tags. 

For more information, see:

- [Working with discovery data](../working-with-cloud-discovery-data.md)
- [Working with discovered apps](../discovered-apps.md)

> [!TIP]
> Depending on your environment configuration, you might benefit from the seamless and automated blocking, or even the *warn and educate* features provided by Microsoft Defender for Endpoint. For more information, see [Integrate Microsoft Defender for Endpoint with Microsoft Defender for Cloud Apps](../mde-integration.md).


## Review information protection

**Where**: In the Microsoft Defender XDR Portal, select:

- **Incidents & alerts**
- **Cloud apps > Files**
- **Cloud apps > Policies > Policy Management > Information protection**

**Persona**: Security and Compliance administrators, SOC analysts

Defender for Cloud Apps file policies and alerts allow you to enforce a wide range of automated processes. Create policies to provide information protection, including continuous compliance scans, legal eDiscovery tasks, and data loss protection (DLP) for sensitive content shared publicly.

In addition to [triaging alerts and incidents](#review-alerts-and-incidents), we recommend that your SOC teams run extra, proactive actions and queries. In the **Cloud apps > Files** page, check for the following questions:

- How many files are shared publicly so that anyone can access them without a link?
- Which partners are you sharing files to using outbound sharing?
- Do any files have sensitive names?
- Are any of the files being shared with someone's personal account?

Use the results of these queries to adjust existing file policies or create new policies.

For more information, see:

- [View and manage incidents and alerts](/microsoft-365/security/defender/mto-incidents-alerts)
- [Information protection policies](../policies-information-protection.md).

## Related content

[Microsoft Defender for Cloud Apps operational guide](ops-guide.md)
