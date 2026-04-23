---
title: Which logs should you ingest into the data lake
titleSuffix: Microsoft Security
description: Learn how to choose which log sources to ingest into the Microsoft Sentinel data lake tier versus the analytics tier based on detection, hunting, and cost requirements.
author: EdB-MSFT
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform 
ms.topic: concept-article
ms.date: 04/23/2026
ms.author: ebaynash
ms.collection: ms-security

# Customer intent: As a security administrator, I want to understand which log sources to ingest into the data lake versus the analytics tier so that I can balance cost efficiency with real-time detection and long-term security insights.

--- 

# Ingest directly into the data lake tier

You can configure log sources to ingest directly into the data lake tier without mirroring to the analytics tier. Direct ingestion is useful when you have high-volume log sources that you want to retain for hunting and forensic purposes but don't need for real-time alerting. By ingesting these sources directly into the data lake tier, you avoid analytics tier ingestion costs while still making the data available for KQL queries, Spark notebooks, and long-term analysis. This article helps you determine which log sources are good candidates for direct data lake ingestion based on their value for detection, hunting, and investigation workloads.

Configure direct data lake ingestion from the connector setup pages or the **Table management** page in the Microsoft Defender portal. For more information, see [Configure table settings in Microsoft Sentinel](../manage-table-tiers-retention.md).



## Which logs should you ingest into the data lake?

After you onboard to [Microsoft Sentinel data lake](sentinel-lake-overview.md), you can choose which log sources to send to the data lake tier, the analytics tier, or both. The analytics tier is optimized for real-time detection and alerting, while the data lake tier is optimized for cost-effective long-term retention and hunting. Use the following guidance to determine which log sources to ingest into each tier based on their value for different security workloads.

### Analytics tier

You use the analytics tier to ingest log data into Microsoft Sentinel workspaces, where you can run analytics rules, custom detections, and live queries. Ingest log sources into the analytics tier when you need:

- **Real-time detection and correlation**: Alert on critical events from endpoints, identity systems, cloud security controls, and network perimeter devices.
- **Active incident investigation**: Run live queries against current data during incident response.
- **High-fidelity signals**: Ingest sources with direct detection value, such as EDR alerts, privileged access logs, authentication events, and threat intelligence indicators.

## Data lake tier

You use the data lake tier to store logs at lower cost for workloads that don't require real-time alerting. Ingest log sources into the data lake tier when you need:

- **High-volume log retention**: Store sources that are useful for forensic analysis or periodic threat hunts but are too costly to retain in the analytics tier.
- **Threat hunting**: Run cross-log searches, trend analysis, and historical queries to identify patterns across extended time ranges.
- **Batch analytics and summarization**: Use Spark notebooks, KQL, or similar tools to enrich, correlate, or summarize data, then forward only high-priority signals to the analytics tier.
- **Machine learning and advanced analytics**: Apply big data techniques to identify complex relationships and anomalies in historical data.

## Analytics rules and custom detections

You can't run analytics rules or custom detections on data in the data lake tier. If you ingest logs only into the data lake tier, those logs don't generate alerts. To maintain real-time detection coverage, keep time-sensitive, high-fidelity log sources in the analytics tier. 

## Log source guidance

Use the following table as a general guide to decide where to ingest each log source type. Assess your own workloads, alerting requirements, and risk tolerance when you configure log ingestion.

| Log source type | Typical log volume | Value for real-time threat detection and alerting | Value for threat hunting | Value for incident investigation and forensics | Data lake only ingestion fit |
|---|---|---|---|---|---|
| AAA (TACACS/Radius) | Medium | High | High | High | Poor fit |
| Active Directory (on-premises) | High | High | High | High | Poor fit |
| Application Logs | High | Medium | Medium | High | Suitable fit |
| AV Logs (Windows Events 5000s & 3rd party) | Medium | High | High | High | Poor fit |
| Azure Activity | Medium | High | High | High | Poor fit |
| Biometric Access System Logs | Low | Medium | Low | High | Suitable fit |
| Building Security System Logs | Low | Low | Low | Medium | Suitable fit |
| Call Center/VoIP Logs | Medium | Low | Low | Medium | Suitable fit |
| CASB | High | High | High | High | Suitable fit |
| Citrix/Horizon/ALBs | Medium | Medium | Medium | High | Suitable fit |
| Cloud IAM | Medium | High | High | High | Poor fit |
| Cloud PaaS | High | High | High | High | Suitable fit |
| Cloud Security Controls | Medium | High | Medium | High | Poor fit |
| Cloud Storage (S3, Blob, etc.) Logs | High | Low | High | High | Poor fit |
| CRM Audit Logs | Low-Medium | Low | Low | Medium | Poor fit |
| Database Audit Tools | Medium | High | High | High | Suitable fit |
| DHCP Logs | Medium | Medium | Medium | High | Suitable fit |
| DLP Alerts | Low | High | High | High | Suitable fit |
| DNS Logs | High | High | High | High | Suitable fit |
| Endpoint Detection and Response (EDR) (Alerts) | Medium | High | High | High | Poor fit |
| Endpoint Detection and Response (EDR) (Raw) | High | High | High | High | Suitable fit |
| Email Security (3rd party alerts) | Medium | High | Medium | High | Poor fit |
| ERP Audit Logs | Low-Medium | Low | Low | Medium | Suitable fit |
| File Integrity | Low | Medium | Medium | High | Suitable fit |
| Firewall Threat/Malware/IPS/IDS | High | High | High | High | Poor fit |
| Firewall Traffic Logs | High | High | High | High | Suitable fit |
| GitHub/GitLab/Code Repo Logs | Low-Medium | Medium | Medium | High | Suitable fit |
| Google Workspace Logs | Medium | Medium | Medium | High | Suitable fit |
| Identity (Entra ID, Okta, LDAP) | Medium | High | High | High | Poor fit |
| IIS/Apache Logs | Medium | High | High | High | Suitable fit |
| IoT Device Logs | High | Medium | Medium | Medium | Suitable fit |
| Kubernetes/Container Logs (alerts, critical) | High | High | High | High | Poor fit |
| Kubernetes/Container Logs (raw logs) | High | High | High | High | Suitable fit |
| LAN/WAN Router Switch | High | Medium | Medium | Medium | Suitable fit |
| Linux Server AuditD | Medium | High | High | High | Poor fit |
| Mobile Device Management (Intune) | Medium | Medium | Medium | Medium | Suitable fit |
| Microsoft Office Logs (Teams, Office, SharePoint) | Medium | Medium | Medium | High | Poor fit |
| Microsoft XDR Alerts (Defender: Office, Identity, Endpoint, CloudApp) | Medium | High | High | High | Poor fit |
| Multifactor authentication (MFA) | Medium | High | Medium | High | Poor fit |
| Netflow | High | Medium | High | Medium | Suitable fit |
| Network Detection (Corelight, Vectra, Darktrace) | High | High | High | High | Poor fit |
| OT/ICS System Logs | Medium | High | High | High | Suitable fit |
| PAM (Privileged Access Management) | Low | High | High | High | Poor fit |
| PIM (Privileged Identity Management) | Low | High | High | High | Poor fit |
| POS System Logs | High | High | High | High | Suitable fit |
| Proxy Logging (URL filtering) | High | High | High | High | Suitable fit |
| Salesforce Audit Logs | Medium | Medium | Medium | High | Suitable fit |
| SD-WAN | Medium | Medium | Medium | Medium | Suitable fit |
| ServiceNow Audit Logs | Low | Low | Low | Medium | Suitable fit |
| SIEM/SOAR Platform Logs | Medium | High | High | High | Not recommended |
| Slack/Teams Collaboration Logs | Medium | Low | Medium | Medium | Suitable fit |
| Sysmon (Endpoint, for EDR complement) | Medium | High | High | High | Suitable fit |
| Threat Intelligence Indicators | Low | High | High | High | Not recommended |
| VDI Logs | Medium | Medium | Medium | High | Suitable fit |
| VPN | Medium | High | High | High | Not recommended |
| Vulnerability Scanning | Low | Medium | Medium | Medium | Suitable fit |
| Web Application Firewall (WAF) Logs | Medium | High | High | High | Suitable fit |
| Windows Server Events | High | High | High | High | Not recommended |
| XDR Source Logs (Defender: Office, Identity, Endpoint, CloudApp) | Medium | High | High | High | Not recommended |
| Zoom Meeting Logs | Low-Medium | Low | Low | Medium | Suitable fit |

## Related content

- [Manage data tiers and retention in Microsoft Sentinel](../manage-data-overview.md)
- [Configure table settings in Microsoft Sentinel](../manage-table-tiers-retention.md)
- [Set up connectors for the Microsoft Sentinel data lake](sentinel-lake-connectors.md)
