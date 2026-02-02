---
title: Which logs should you ingest into the Microsoft Sentinel data lake
description: How to choose which log sources to ingest into your Microsoft Sentinel data lake.
ms.topic: conceptual
ms.date: 01/29/2026
author: EdB-MSFT
ms.author: edbaynash
ms.service: microsoft-sentinel
ms.subservice: sentinel-graph

# Customer intent: As a security architect, I want to decide which log sources belong in the Sentinel data lake so that I balance cost and visibility.

---


# Which logs should you ingest into the data lake?


## Lake mirroring by default

Microsoft Sentinel data lake uses a tiered data architecture that separates log data into two tiers: the analytics tier and the data lake tier. This architecture allows you to optimize costs while maintaining visibility and analytical capabilities. After onboarding to Microsoft Sentinel data lake all log data stored in the analytics tier is automatically mirrored to the data lake tier. You can configure the retention times for each tier independently based on your organization's needs. 


## Choosing which logs to ingest directly into the data lake

You can choose to ingest some log data directly into the data lake tier without keeping data in the analytics tier. This approach is useful for high-volume log sources that are less critical for real-time detection but valuable for deep analysis and forensics.


The analytics tier in Sentinel provides real-time analysis and alerting capabilities by using log data ingested into Sentinel workspaces. The analytics tier supports the following use cases:
+ **Real-time detection and correlation**: Immediate alerting on critical events such as endpoints, identity, cloud security, perimeter.
+ **Rapid investigation**: Live searches for active incidents and threat responses.
+ **High-fidelity, actionable logs**: Focus on sources with direct security value, such as EDR signals, privileged access, authentication, threat alerts.

The data lake tier in Sentinel provides large-scale, long-term storage and advanced analytics capabilities. The data lake supports the following use cases:
+ **High-volume, lower-priority logs**: Sources that are valuable for deep forensics, analysis of past incidents to understand attack vectors and impacts, or periodic hunts but are costly to keep in the analytics tier.
+ **Analytics and threat hunting**: Cross-log searching, long-term trend analysis, and proactive exploration of historical data to identify hidden threats and patterns.
+ **Batch analytics and summarization**: Use Spark, KQL, or similar tools to enrich, correlate, or summarize data before forwarding only high-risk signals to the analytics tier.
+ **Advanced analytics and machine learning**: Use big data techniques to uncover complex relationships and trends.

Depending on your organization's security needs, you might choose to ingest different log sources into the data 
lake. Store high-volume logs that are less critical for real-time detection but valuable for deep analysis and forensics in the lake, and retain only high-value logs in the analytics tier.  

Use the following table to prioritize which sources belong in the data lake versus the analytics tier.

| Log source type                                    | Typical log volume | Value for real-time threat detection and alerting | Value for threat hunting | Value for incident investigation and forensics | Ingest to data lake |
|-------------------------------------------------|--------------------|-------------------------------------|----------------|-----------------------------------|-----------------------|
| AAA (TACACS/Radius)                             | Medium             | High                                | High           | High                              | Yes                   |
| Active Directory (on-premises)                      | High               | High                                | High           | High                              | No                    |
| Application Logs                                | High               | Medium                              | Medium         | High                              | Yes                   |
| AV Logs (Windows Events 5000s & 3rd party)      | Medium             | High                                | High           | High                              | No                    |
| Azure Activity                                  | Medium             | High                                | High           | High                              | No                    |
| Biometric Access System Logs                    | Low                | Medium                              | Low            | High                              | Yes                   |
| Building Security System Logs                   | Low                | Low                                 | Low            | Medium                            | Yes                   |
| Call Center/VoIP Logs                           | Medium             | Low                                 | Low            | Medium                            | Yes                   |
| CASB                                            | High               | High                                | High           | High                              | Yes                   |
| Citrix/Horizon/ALBs                             | Medium             | Medium                              | Medium         | High                              | Yes                   |
| Cloud IAM                                       | Medium             | High                                | High           | High                              | No                    |
| Cloud PaaS                                      | High               | High                                | High           | High                              | Yes                   |
| Cloud Security Controls                         | Medium             | High                                | Medium         | High                              | No                    |
| Cloud Storage (S3, Blob, etc.) Logs             | High               | High                                | High           | High                              | No                    |
| CRM Audit Logs                                  | Low-Medium         | Low                                 | Low            | Medium                            | Yes                   |
| Database Audit Tools                            | Medium             | High                                | High           | High                              | Yes                   |
| DHCP Logs                                       | Medium             | Medium                              | Medium         | High                              | Yes                   |
| DLP Alerts                                      | Low                | High                                | High           | High                              | Yes                   |
| DNS Logs                                        | High               | High                                | High           | High                              | Yes                   |
| Endpoint Detection and Response (EDR) (Alerts)  | Medium             | High                                | High           | High                              | No                    |
| Endpoint Detection and Response (EDR) (Raw)     | High               | High                                | High           | High                              | Yes                   |
| Email Security (3rd party alerts)               | Medium             | High                                | Medium         | High                              | No                    |
| ERP Audit Logs                                  | Low-Medium         | Low                                 | Low            | Medium                            | Yes                   |
| File Integrity                                  | Low                | Medium                              | Medium         | High                              | Yes                   |
| Firewall Threat/Malware/IPS/IDS                 | High               | High                                | High           | High                              | No                    |
| Firewall Traffic Logs                           | High               | High                                | High           | High                              | Yes                   |
| GitHub/GitLab/Code Repo Logs                    | Low-Medium         | Medium                              | Medium         | High                              | Yes                   |
| Google Workspace Logs                           | Medium             | Medium                              | Medium         | High                              | Yes                   |
| Identity (Entra ID, Okta, LDAP)                 | Medium             | High                                | High           | High                              | No                    |
| IIS/Apache Logs                                 | Medium             | High                                | High           | High                              | Yes                   |
| IoT Device Logs                                 | High               | Medium                              | Medium         | Medium                            | Yes                   |
| Kubernetes/Container Logs (alerts, critical)    | High               | High                                | High           | High                              | No                    |
| Kubernetes/Container Logs (raw logs)            | High               | High                                | High           | High                              | Yes                   |
| LAN/WAN Router Switch                           | High               | Medium                              | Medium         | Medium                            | Yes                   |
| Linux Server AuditD                             | Medium             | High                                | High           | High                              | No                    |
| Mobile Device Management (Intune)               | Medium             | Medium                              | Medium         | Medium                            | Yes                   |
| Microsoft Office Logs (Teams, Office, SharePoint)| Medium            | Medium                              | Medium         | High                              | No                    |
| Microsoft XDR Alerts (Defender: Office, Identity, Endpoint, CloudApp) | Medium | High | High | High | No |
| Multifactor authentication (MFA)               | Medium             | High                                | Medium         | High                              | No                    |
| Netflow                                         | High               | Medium                              | High           | Medium                            | Yes                   |
| Network Detection (Corelight, Vectra, Darktrace)| High               | High                                | High           | High                              | No                    |
| OT/ICS System Logs                              | Medium             | High                                | High           | High                              | Yes                   |
| PAM (Privileged Access Management)              | Low                | High                                | High           | High                              | No                    |
| PIM (Privileged Identity Management)            | Low                | High                                | High           | High                              | No                    |
| POS System Logs                                 | High               | High                                | High           | High                              | Yes                   |
| Proxy Logging (URL filtering)                   | High               | High                                | High           | High                              | Yes                   |
| Salesforce Audit Logs                           | Medium             | Medium                              | Medium         | High                              | Yes                   |
| SD-WAN                                          | Medium             | Medium                              | Medium         | Medium                            | Yes                   |
| ServiceNow Audit Logs                           | Low                | Low                                 | Low            | Medium                            | Yes                   |
| SIEM/SOAR Platform Logs                         | Medium             | High                                | High           | High                              | No                    |
| Slack/Teams Collaboration Logs                  | Medium             | Low                                 | Medium         | Medium                            | Yes                   |
| Sysmon (Endpoint, for EDR complement)           | Medium             | High                                | High           | High                              | Yes                   |
| Threat Intelligence Indicators                  | Low                | High                                | High           | High                              | No                    |
| VDI Logs                                        | Medium             | Medium                              | Medium         | High                              | Yes                   |
| VPN                                             | Medium             | High                                | High           | High                              | No                    |
| Vulnerability Scanning                          | Low                | Medium                              | Medium         | Medium                            | Yes                   |
| Web Application Firewall (WAF) Logs             | Medium             | High                                | High           | High                              | Yes                   |
| Windows Server Events                           | High               | High                                | High           | High                              | No                    |
| XDR Source Logs (Defender: Office, Identity, Endpoint, CloudApp) | Medium | High | High | High | No |
| Zoom Meeting Logs                               | Low-Medium         | Low                                 | Low            | Medium                            | Yes                   |


## Related articles

- [Manage data tiers and retention in Microsoft Sentinel](../manage-data-overview.md)
- [Configure table settings in Microsoft Sentinel](../manage-table-tiers-retention.md)
- [Set up connectors for the Microsoft Sentinel data lake](../datalake/sentinel-lake-connectors.md)