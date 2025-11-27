---
title: Microsoft Security Copilot in advanced hunting
description: Learn about the different Microsoft Security Copilot advanced hunting capabilities in Microsoft Defender.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords:
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - security-copilot
  - magic-ai-copilot
ms.custom:
- cx-ti
- cx-ah
ms.topic: how-to
ms.date: 12/01/2025
appliesto:
- Microsoft Defender
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Microsoft Security Copilot in advanced hunting

[Microsoft Security Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md) provides two powerful capabilities in advanced hunting to enhance threat hunting and security analysis:

- [Threat Hunting Agent](advanced-hunting-security-copilot-threat-hunting-agent.md) - AI-powered conversational threat hunting experience
- [Query assistant](advanced-hunting-security-copilot-query-assistant.md) - Natural language to KQL query generation

These features empower security analysts of all skill levels to hunt threats faster, more accurately, and with greater confidence—without needing to write complex KQL queries.

Users with access to Security Copilot have access to these capabilities in advanced hunting.

## Choosing the right capability
Both capabilities are designed to enhance your threat hunting experience, but they serve different purposes:
Capability	Best for	Output	Experience
Query assistant	Generating queries	KQL query with explanation	Query-focused
Threat Hunting Agent	Complete investigations, complex multi-step hunting, exploratory analysis, getting direct answers	Conversational answers, KQL queries, results, insights, and recommendations	Investigation-focused


## Switching between capabilities
These two modes can not be active at the same time, only one mode needs to be selected.

The default mode is Threat Hunting Agent. To switch to Query assistant mode, you will need to click the 3 dots menu at the top right corner of the chat, and toggle off the Threat Hunting Agent button.  When switching between modes, the conversation would be reset. 

## Scope of Security Copilot in advanced hunting

### Use case support
The Threat Hunting Agent and Query assistant both fully support generation of simple to medium complexity queries, which includes filter operation, and/or aggregation. Complex use cases (queries with joins, filtering and aggregation), our supported, but we recommend on validating their accuracy. Help us improve by providing feedback with incorrect queries or responses exmamples. 
Best practices
1.	Be unambiguous: try to ask questions with a clear subject. For example, "logins" could mean device logins or cloud logins.
2.	Ask one question at a time: ask for a single task/type of information at a time when possible. Don't expect the model to perform several unrelated tasks at once. You can always ask follow up questions instead of combining unrelated asks into a single response.
Be specific: if you know anything about the data you are looking for, help provide that information in your question.

### Supported tables
The Threat Hunting Agent and Query assistant supports the following tables in advanced hunting:

**Microsoft Defender tables:**
- AADSignInEventsBeta
- AADSpnSignInEventsBeta
- AlertEvidence
- AlertInfo
- BehaviorEntities
- BehaviorInfo
- CloudAppEvents
- DeviceAlertEvents
- DeviceBaselineComplianceAssessment
- DeviceBaselineComplianceAssessmentKB
- DeviceBaselineComplianceProfiles
- DeviceEvents
- DeviceFileCertificateInfo
- DeviceFileEvents
- DeviceImageLoadEvents
- DeviceInfo
- DeviceInternetFacing
- DeviceLogonEvents
- DeviceNetworkEvents
- DeviceNetworkInfo
- DeviceProcessEvents
- DeviceRegistryEvents
- DeviceScriptEvents
- DeviceTvmInfoGathering
- DeviceTvmInfoGatheringKB
- DeviceTvmSecureConfigurationAssessment
- DeviceTvmSecureConfigurationAssessmentKB
- DeviceTvmSoftwareEvidenceBeta
- DeviceTvmSoftwareInventory
- DeviceTvmSoftwareVulnerabilities
- DeviceTvmSoftwareVulnerabilitiesKB
- DynamicEventCollection
- EmailAttachmentInfo
- EmailEvents
- EmailPostDeliveryEvents
- EmailUrlInfo
- IdentityDirectoryEvents
- IdentityInfo
- IdentityLogonEvents
- IdentityQueryEvents
- UrlClickEvents

**Microsoft Sentinel tables:**
-	AADManagedIdentitySignInLogs 
-	AADNonInteractiveUserSignInLogs 
-	AADProvisioningLogs 
-	AADRiskyUsers 
-	AADServicePrincipalSignInLogs 
-	AADUserRiskEvents 
-	ABAPAuditLog_CL 
-	AlertEvidence 
-	AlertInfo 
-	Anomalies 
-	AppDependencies 
-	AppTraces 
-	AuditLogs 
-	AWSCloudTrail 
-	AWSGuardDuty 
-	AzureActivity 
-	AzureDevOpsAuditing 
-	AzureDiagnostics 
-	AzureMetrics 
-	BehaviorAnalytics 
-	CloudAppEvents 
-	CommonSecurityLog 
-	ContainerInventory 
-	ContainerLog 
-	DeviceEvents 
-	DeviceFileCertificateInfo 
-	DeviceFileEvents 
-	DeviceImageLoadEvents 
-	DeviceInfo 
-	DeviceLogonEvents 
-	DeviceNetworkEvents 
-	DeviceNetworkInfo 
-	DeviceProcessEvents 
-	DeviceRegistryEvents 
-	DnsEvents 
-	Dynamics365Activity 
-	EmailPostDeliveryEvents 
-	Event 
-	Heartbeat 
-	IdentityInfo 
-	InsightsMetrics 
-	IntuneAuditLogs 
-	IntuneDevices 
-	LAQueryLogs 
-	MicrosoftAzureBastionAuditLogs 
-	MicrosoftPurviewInformationProtection 
-	OfficeActivity 
-	Perf 
-	PowerBIActivity 
-	ProtectionStatus 
-	SecurityAlert 
-	SecurityEvent 
-	SecurityIncident 
-	SecurityRecommendation 
-	SigninLogs 
-	SqlAtpStatus 
-	StorageBlobLogs 
-	StorageFileLogs 
-	Syslog 
-	ThreatIntelligenceIndicator 
-	Update 
-	UrlClickEvents 
-	Usage 
-	UserAccessAnalytics 
-	UserPeerAnalytics 
-	VMBoundPort 
-	VMComputer 
-	VMConnection 
-	VMProcess 
-	WindowsEvent 
-	W3CIISLog 
-	WindowsFirewall
