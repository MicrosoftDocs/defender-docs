---
title: Microsoft Sentinel components and patterns
description: This article describes best practices for creating your own integrations with Microsoft Sentinel.
author: EdB-MSFT
ms.author: edbaynash
ms.topic: concept-article
ms.date: 05/31/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012

# Customer intent: As a security partner, I want to create a content hub solution to integrate my product with Microsoft Sentinel so that SOC teams can leverage my data source types, detections, and automation for enhanced threat detection and response. I want to Decide what components to include in your solution so that I can create a comprehensive and effective Microsoft Sentinel solution that meets the needs of my customers.
---

# Decide which components to include in your solution

This article discusses the different components of a Microsoft Sentinel SIEM solution and how they can work together to address important customer scenarios. 

Microsoft Sentinel includes more than 400 connectors and other capabilities to help customers centralize and analyze security data in a cost-efficient way. Together with SIEM functionality, these capabilities enable customers and partners to create impactful solutions that can be published through the Microsoft Security Store. 

Sentinel SIEM is used by Security Operations (SOC) teams to generate detections, investigate malicious behavior, and remediate threats. By creating Sentinel connectors to bring in new data, and by creating content such as analytics rules, playbooks, hunting queries, parsers, and workbooks, partners can help SOC teams get the information they need to identify threats and respond appropriately. Sentinel SIEM solutions are published through Sentinel's Content Hub. 

## Data collection

When you're building a Sentinel SIEM integration, it's critical to have the right data for your scenario.  

[Sentinel Connectors](/azure/sentinel/create-codeless-connector) bring in data to Sentinel, which can then be analyzed using with Sentinel SIEM content such as analytics rules and hunting queries. Once the data has been ingested it can also be mirrored to the data lake for further analysis using Jupyter notebooks and Security Copilot agents.

That data can include the following types:

|Type  |Description  |
|---------|---------|
|**Unprocessed data**     | Supports detections and hunting processes. <br><br>Analyze raw operational data in which signs of malicious activity may be present. Bring unprocessed data to Microsoft Sentinel to use Microsoft Sentinel's built-in hunting and detection features to identify new threats and more. <br><br>Examples: Syslog data, CEF data over Syslog, application, firewall, authentication, or access logs, and more.      |
|**Security conclusions**     | Creates alert visibility and opportunity for correlation. <br><br>Alerts and detections are conclusions that have already been made about threats. Putting detections in context with all the activities and other detections visible in Microsoft Sentinel investigations, saves time for analysts and creates a more complete picture of an incident, resulting in better prioritization and better decisions.    <br><br>Examples: anti-malware alerts, suspicious processes, communication with known bad hosts, network traffic that was blocked and why, suspicious logons, detected password spray attacks, identified phishing attacks, data exfiltration events, and more.    |
|**Reference data**     | Builds context with referenced environments, saving investigation effort and increasing efficiency. <br><br>Examples: CMDBs, high value asset databases, application dependency databases, IP assignment logs, threat intelligence collections for enrichment, and more.|
|**Threat intelligence**     | Powers threat detection by contributing indicators of known threats. <br><br>Threat intelligence can include current indicators that represent immediate threats or historical indicators that are kept for future prevention. Historical data sets are often large and are best referenced ad-hoc, in place, instead of importing them directly to Microsoft Sentinel.|


## Parsers

Parsers are KQL functions which transform custom data from third-party products into a normalized ASIM schema. Normalization ensures that SOC analysts don’t have to learn details about new schemas and instead build analytic rules and hunting queries on the normalized schema that they're already familiar with. Review the available ASIM schemas provided by Microsoft Sentinel to identify relevant ASIM schemas (one or more) for your data to ensure easier onboarding for SOC analysts and to ensure that the existing security content written for the ASIM schema is applicable out-of-the-box for your product data. For more information on the available ASIM schemas, see [Advanced Security Information Model (ASIM) schemas](/azure/sentinel/normalization-about-schemas). Alternatively, if your connector uses a Data Collection Rule (DCR), you can normalize data at ingestion time rather than at query time. For more information, see [Transform or customize data at ingestion time in Microsoft Sentinel (preview)](../configure-data-transformation.md).

## Visualization

You can include visualizations to help customers manage and understand your data, by including graphical views of how well data flows into Microsoft Sentinel, and how effectively it contributes to detections.

## Monitoring and detection

Sentinel’s monitoring and detection features create automated detections to help customers scale their SOC team's expertise.  

The following sections describe monitoring and detection elements that you can include in your solution.

### Security Copilot agents

Security Copilot agents automate repetitive tasks and reduce manual workloads. They enhance security and IT operations across cloud, data security and privacy, identity, and network security. For Sentinel, agents can query the SIEM or data lake and call APIs to enrich Microsoft Sentinel data. They can utilize notebook jobs for intensive data processing or analysis and utilize any number of plug-ins.  

### Analytics rules

Analytics rules are sophisticated detections that can create accurate, meaningful alerts.

Add analytics rules to your solution to help your customers benefit from data from your system in Microsoft Sentinel. For example, analytics rules can help provide expertise and insight about the activities that can be detected in the data your integration delivers. 

They can output alerts (notable events), incidents (units of investigation), or trigger automation playbooks. 

You can add analytics rules by including them in a solution and via the Microsoft Sentinel ThreatHunters community. Contribute via the community to encourage community creativity over partner-sourced data, helping customers with more reliable and effective detections.
 
### Hunting queries

Hunting queries enable SOC analysts to proactively look for new anomalies that aren't detected by the currently scheduled analytics rules. Hunting queries guide SOC analysts into asking the right questions to find issues from the data that is already available in Microsoft Sentinel and helps them identify potential threat scenarios. By including hunting queries, you can help customers find unknown threats in the data you supply.

### Workbooks

Workbooks provide interactive reports and dashboards that help users visualize security data and identify patterns. The need for workbooks depends on the specific use case. As you design your solution, think of scenarios that are best explained visually. For example, workbooks are well suited for summarizing authentication failures and suspicious login patterns across your data, visualizing geographic distributions of threat activity, mapping detected events to MITRE ATT&CK tactics and techniques, showing trends in blocked or flagged activity over time, or providing an at-a-glance view of the top threats and anomalies surfaced from your connector's data.

## Investigation

The Sentinel investigation graph provides investigators with relevant data when they need it, providing visibility about security incidents and alerts via connected entities. Investigators can use the investigation graph to find relevant or related, contributing events to the threat that's under investigation.

Partners can contribute to the investigation graph by providing:

- **Microsoft Sentinel alerts and incidents**, created via analytics rules in partner solutions.
- **Custom exploration queries** for partner-supplied data. Custom exploration queries provide rich exploration and connectivity between data and insights for security investigators.


## Response

Playbooks support workflows with rich automation, running security-related tasks across customer environments. They're critical to ensure that SOC analysts aren't overburdened by tactical items and can focus on the more strategic and deeper root cause of vulnerabilities. For example, if a high-severity alert is detected, a playbook can automatically initiate a series of actions, such as notifying the security team, isolating affected systems, and gathering relevant logs for further analysis.

Playbooks can help in any of the following ways:
- Blocking a user account or IP address in a partner product in response to a Sentinel incident.
- Enriching an incident with user, device, or threat context retrieved from an external API.
- Creating or updating a ticket in an ITSM system such as ServiceNow or Jira when a Sentinel incident is opened or escalated.
- Closing or updating an incident in a partner platform when the corresponding Sentinel incident is resolved.
- Sending incident details and a direct investigation link to a Teams or Slack channel for immediate analyst awareness.

As you design your solution, think of the automated actions that can be taken to resolve incidents created by the analytics rules defined in your solution.


## Sentinel SIEM scenario examples

The following sections describe common partner scenarios, and recommendations for what to include in a solution for each scenario.

### Your product generates data that is important to security investigations

**Scenario**: Your product generates data that can inform security investigations.

**Example**: Products that supply some form of log data include firewalls, cloud application security brokers, physical access systems, Syslog output, commercially available and enterprise-built LOB applications, servers, network metadata, anything deliverable over Syslog in Syslog or CEF format, or over REST API in JSON format.

**How to use your data in Microsoft Sentinel**: Import your product's data into Microsoft Sentinel via a data connector to provide analytics, hunting, investigations, visualizations, and more.

**What to build**: For this scenario, include the following elements in your solution:

|Type  |Elements to include  |
|---------|---------|
|**Required**     |  - A Microsoft Sentinel data connector to deliver the data and link other customizations in the portal.  <br><br>Sample data queries     |
|**Recommended**     | - Workbooks <br><br>- Analytics rules, to build detections based your data in Microsoft Sentinel       |
|**Optional**     |  - Hunting queries, to provide hunters with out-of-the-box queries to use when hunting <br><br>- Notebooks, to deliver a fully guided, repeatable hunting experience       |


### Your product provides detections

**Scenario**: Your product provides detections that complement alerts and incidents from other systems

**Examples**: Anti-malware, enterprise detection and response solutions, network detection and response solutions, mail security solutions such as anti-phishing products, vulnerability scanning, mobile device management solutions, UEBA solutions, information protection services, and so on.

**How to use your data in Microsoft Sentinel**: Make your detections, alerts, or incidents available in Microsoft Sentinel to show them in context with other alerts and incidents that may be occurring in your customers' environments. Also consider delivering the logs and metadata that power your detections, as extra context for investigations.

**What to build**: For this scenario, include the following elements in your solution:

|Type  |Elements to include  |
|---------|---------|
|**Required**     |  A Microsoft Sentinel data connector to deliver the data and link other customizations in the portal.   |
|**Recommended**     | Analytics rules, to create Microsoft Sentinel incidents from your detections that are helpful in investigations |
|**Optional**     | - Playbooks to synchronize incident state back to your platform, for example, closing or updating an incident in your product when the corresponding Microsoft Sentinel incident is closed. This is particularly valuable if your product has its own case management or investigation workflow. <br><br>- Hunting queries to help analysts navigate and investigate the raw data your connector delivers, useful for threat hunting, triage, and building custom detections on top of your logs. |

### Your product supplies threat intelligence indicators

**Scenario**: Your product supplies threat intelligence indicators that can provide context for security events occurring in customers' environments

**Examples**: TIP platforms, STIX/TAXII collections, and public or licensed threat intelligence sources. Reference data, such as WhoIS, GeoIP, or newly observed domains.

**How to use your data in Microsoft Sentinel**: Deliver current indicators to Microsoft Sentinel for use across Microsoft detection platforms. Use large scale or historical datasets for enrichment scenarios, via remote access.

**What to build**: For this scenario, include the following elements in your solution:

|Type  |Elements to include  |
|---------|---------|
|**Current threat intelligence**     | Provide a STIX 2.0 or 2.1 TAXII server that customers can use with the out-of-the-box TAXII data connector. <br><br>As an alternate option, create a function app connector that uses our TI API. For more information, see [Import threat intelligence with the upload API - Microsoft Sentinel](/azure/sentinel/stix-objects-api). |


### Your product provides extra context for investigations

**Scenario**: Your product provides extra, contextual data for investigations based in Microsoft Sentinel.

**Examples**: Extra context CMDBs, high value asset databases, VIP databases, application dependency databases, incident management systems, ticketing systems

**How to use your data in Microsoft Sentinel**: Use your data in Microsoft Sentinel to enrich both alerts and incidents.

**What to build**: For this scenario, include the following elements in your solution:

- A data connector
- An enrichment workflow playbook
- An external incident lifecycle management workflow (optional)

### Your product can implement security policies

**Scenario**: Your product can implement security policies in Azure Policy and other systems

**Examples**: 	Firewalls, NDR, EDR, MDM, Identity solutions, Conditional Access solutions, physical access solutions, or other products that support block/allow or other actionable security policies

**How to use your data in Microsoft Sentinel**: Microsoft Sentinel actions and workflows enabling remediations and responses to threats

**What to build**: For this scenario, include the following elements in your solution:

- An action workflow playbook

## Related content

- [Build and publish Microsoft Sentinel solutions](./sentinel-integration-guide.md)

**Data collection**:

- [Data collection best practices](../best-practices-data.md)
- [Microsoft Sentinel data connectors](../connect-data-sources.md)
- [Find your Microsoft Sentinel data connector](../data-connectors-reference.md)
- [Understand threat intelligence in Microsoft Sentinel](../understand-threat-intelligence.md)

**Threat detection**:

- [Automate incident handling in Microsoft Sentinel with automation rules](../automate-incident-handling-with-automation-rules.md)
- [Investigate incidents with Microsoft Sentinel](../investigate-cases.md)
- [Automate threat response with playbooks in Microsoft Sentinel](../automation/automate-responses-with-playbooks.md)

**Hunting and notebooks**:

- [Hunt for threats with Microsoft Sentinel](../hunting.md)
- [Manage hunting queries in Microsoft Sentinel using REST API](../hunting-with-rest-api.md)
- [Use Jupyter notebooks to hunt for security threats](../notebooks.md)

**Visualization**: [Visualize collected data](../get-visibility.md).

**Investigation**: [Investigate incidents with Microsoft Sentinel](../investigate-cases.md).

**Response**:

- [Automate threat response with playbooks in Microsoft Sentinel](../automation/automate-responses-with-playbooks.md)
- [Create and customize Microsoft Sentinel playbooks from built-in templates](../automation/use-playbook-templates.md)
