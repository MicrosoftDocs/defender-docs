---
title: Useful queries for UEBA threat detection in Microsoft Sentinel | Microsoft Docs
description: Explore sample KQL queries for Microsoft Sentinel UEBA tables to detect compromised accounts, insider threats, lateral movement, data exfiltration, and service principal misuse.
author: guywi-ms
ms.author: guywild
ms.topic: reference
ms.date: 01/25/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ms.custom: sfi-image-nochange

#Customer intent: As a security analyst, I want sample KQL queries for UEBA tables so that I can quickly hunt for and investigate anomalous user and entity behavior in my environment.

---

# Useful queries for User and Entity Behavior Analytics (UEBA) threat detection in Microsoft Sentinel
  
Solutions in Microsoft Sentinel provide a consolidated way to acquire Microsoft Sentinel content, like data connectors, workbooks, analytics, and automation, in your workspace by using a single deployment step. 

These KQL queries unlock actionable insights from the UEBA (User and Entity Behavior Analytics) tables, primarily `BehaviorAnalytics`, `Anomalies`, and related enrichment tables. 

## Key use cases

- **Anomalous sign-ins and account activity**: 
 Detects interactive sign-ins by dormant or privileged accounts, anomalous password resets, and suspicious account creations - often by joining UEBA insights with audit logs. 

- **Privilege escalation and role assignments**: 
 Flags first-time or unusual role assignments, high-impact users performing new actions, and anomalous admin group additions. 

- **Geographic and device anomalies**: 
 Surfaces sign-ins from rare or new countries, failed authentications from high-risk accounts, and remote interactive authentications (such as RDP) flagged by UEBA. 

- **Insider threat and data exfiltration**: 
 Identifies terminated employees accessing resources, anomalous database exports, and high-risk administrative operations (such as Key Vault modifications). 

- **Cross-cloud and third-party integrations**: 
 Includes queries for AWS, GCP, and Okta, such as AWS authentications without MFA from uncommon countries, Okta MFA anomalies, and GCP IAM access anomalies. 

- **VIP and high-value account monitoring**: 
 Highlights VIP users with non-zero investigation priority and tracks anomalous activity involving high-blast-radius accounts. 


UEBA provides a solution, "UEBA Essentials," which consists of dozens of useful queries. To install, follow the steps in [Discover and deploy Microsoft Sentinel out-of-the-box content](/azure/sentinel/sentinel-solutions-deploy?tabs=defender-portal). 

<!-- This was the info the PM asked to move to Ref 4 -->

Compromised account detection, insider threat detection, lateral movement, data exfiltration, and service principal misuse are common use cases. 

## How UEBA fits into Microsoft Sentinel and your SOC 

Microsoft Sentinel and the Microsoft Defender portal integrate UEBA. Entity profiles, alert enrichment, and custom analytics that use KQL support investigation and hunting workflows. 

## UEBA in action: example scenarios

The following scenarios illustrate how UEBA detects threats across common attack patterns, with sample KQL queries you can adapt for your environment.

### Compromised account detection
Goal: Identify legitimate accounts being misused by attackers. 
Scenario: A finance user downloads thousands of files from OneDrive and uploads them to a personal cloud service. UEBA flags this behavior as abnormal compared to historical activity and peer norms. 

Example KQL query to flag abnormal file download activity compared to historical baselines:

```kusto
BehaviorAnalytics
| where ActivityType == "FileDownload"
| where ActivityInsights.FirstTimeUserConnectedFromCountry == True
| where ActivityInsights.CountryUncommonlyConnectedFromAmongPeers == True
| summarize Downloads = count() by UserPrincipalName, Country
``` 

### Insider threat detection

Goal: Detect malicious or negligent insider behavior. 
Scenario: An employee authenticates from multiple IP addresses across risky geographies within minutes. UEBA correlates sign-ins with peer baselines and highlights the anomaly. 

Example KQL query to detect suspicious sign-in patterns indicating insider risk:

```kusto
BehaviorAnalytics
| where ActivityType == "SignIn"
| summarize Countries = dcount(ActivityInsights.Country), IPs = dcount(ActivityInsights.IPAddress) by UserPrincipalName
| where Countries > 3 or IPs > 5
``` 

### Lateral movement

Goal: Spot unusual privilege escalations and access patterns. 
Scenario: An account executes Azure Run Command on multiple VMs for the first time, deviating from its usual read-only operations. 

Example KQL query to identify anomalous privilege escalation or persistence activity:

```kusto
BehaviorAnalytics
| where ActivityType == "AzureActivity"
| where ActivityInsights.FirstTimeUserPerformedOperation == true
| where ActivityInsights.OperationName contains "runCommand"
| summarize VMCount = dcount(ActivityInsights.ResourceId) by User| summarize VMCount = dcount(ActivityInsights.ResourceId) by UserPrincipalName
``` 

### Data exfiltration

Goal: Identify abnormal data transfer activities. 
Scenario: A user uploads hundreds of sensitive files to external domains after hours. UEBA compares this behavior against normal working hours and peer behavior, and assigns a high-risk score. 

Example KQL query to detect abnormal data transfer compared to peer group norms:

```kusto
BehaviorAnalytics
| where ActivityType == "FileUpload"
| where ActivityInsights.FirstTimeUserPerformedOperation == true
| where ActivityInsights.FolderPath contains "Confidential| where ActivityInsights.FolderPath contains "Confidential"
| summarize FileCount = count() by UserPrincipalName
``` 

### Service principal misuse

Goal: Monitor non-human identities for suspicious activity. 
Scenario: A service principal starts authenticating from new regions and performs privileged actions outside its usual automation pattern. 

Example KQL query to flag unusual privileged operations by non-human identities:

```kusto
BehaviorAnalytics
| where ActivityType == "ServicePrincipalActivity"
| where ActivityInsights.FirstTimeUserConnectedFromCountry| where ActivityInsights.FirstTimeUserConnectedFromCountry == true 
| summarize Actions = count() by ServicePrincipalName
``` 


## Next steps

- [Enable UEBA in Microsoft Sentinel](enable-entity-behavior-analytics.md).
- Use BehaviorAnalytics and Anomalies tables for hunting and triage. 
- Combine queries with risk scoring and peer comparison for prioritization. 

 