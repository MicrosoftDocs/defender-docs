---
title: Microsoft Security Copilot in advanced hunting
description: Learn about the different Microsoft Security Copilot advanced hunting capabilities in Microsoft Defender.
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - security-copilot
  - magic-ai-copilot
ms.custom:
- cx-ti
- cx-ah
ms.topic: how-to
ms.update-cycle: 180-days
ms.date: 12/12/2025
appliesto:
- Microsoft Defender
- Microsoft Defender XDR
- Microsoft Sentinel in the Microsoft Defender portal
---

# Microsoft Security Copilot in advanced hunting

[!INCLUDE [Prerelease](../includes/prerelease.md)]

[Microsoft Security Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md) provides two powerful capabilities in advanced hunting to enhance threat hunting and security analysis. 

The following table describes these capabilities, where they're best used, and the expected output:

| Capability | Description |Output |Experience |
| ------------- | ------------- |------------- |------------- |
| [Threat Hunting Agent](advanced-hunting-security-copilot-threat-hunting-agent.md) (preview) | AI-powered conversational threat hunting agent that's best used for complete investigations, multistep hunting, exploratory analysis, and getting direct answers |Conversational answers, Kusto query language (KQL) queries, results, insights, and recommendations|Investigation-focused |
| [Query assistant](advanced-hunting-security-copilot-query-assistant.md) | Natural language to KQL query generation that's best used for generating queries |KQL query with explanation|Query-focused |

These features empower you to hunt threats faster, more accurately, and with greater confidence without needing to write KQL queries.

## Get access
Users with access to Security Copilot can use these capabilities in advanced hunting.

You can only use one capability at a time. By default, the Threat Hunting Agent is the active mode. To switch to Query assistant mode, in the Security Copilot side pane, select the three-dot menu, then toggle the **Threat Hunting Agent** switch off.

![Screenshot of Security Copilot in advanced hunting showing the Threat Hunting Agent mode is active.](./media/advanced-hunting-security-copilot/advanced-hunting-security-copilot-access.png)

>[!NOTE]
>- Switching between modes is only available in specific user environments. 
>- Switching between modes resets your conversation with Security Copilot. 


## Scope of Security Copilot in advanced hunting

### Use case support
The Threat Hunting Agent and Query assistant both fully support generation of simple to medium complexity queries, which includes filter operation, and/or aggregation. Complex use cases (queries with joins, filtering, and aggregation) are supported, but we recommend validating their accuracy. Help us improve by [providing feedback](security-copilot-in-microsoft-365-defender.md#provide-feedback) with incorrect queries or response examples. 

### Best practices
- **Be unambiguous.** Ask questions with a clear subject. For example, "logins" could mean device logins or cloud logins.
- **Ask one question at a time.** Ask for a single task or type of information at a time. Don't expect the AI model to perform several unrelated tasks at once. You can always ask follow-up questions instead of combining unrelated asks into a single prompt.
- **Be specific.** If you know anything about the data you're looking for, provide that information in your question.

### Supported tables
The Threat Hunting Agent and Query assistant support the following tables in advanced hunting:

| Microsoft Defender tables | Microsoft Sentinel tables |
| ------------- | ------------- |
|<ul><li>AADSignInEventsBeta <li>AADSpnSignInEventsBeta <li>AlertEvidence <li>AlertInfo <li>BehaviorEntities <li>BehaviorInfo <li>CloudAppEvents <li>DeviceAlertEvents <li>DeviceBaselineComplianceAssessment <li>DeviceBaselineComplianceAssessmentKB <li>DeviceBaselineComplianceProfiles <li>DeviceEvents<li>DeviceFileCertificateInfo <li>DeviceFileEvents <li>DeviceImageLoadEvents <li>DeviceInfo <li>DeviceInternetFacing <li>DeviceLogonEvents <li>DeviceNetworkEvents <li>DeviceNetworkInfo <li>DeviceProcessEvents <li>DeviceRegistryEvents <li>DeviceScriptEvents <li>DeviceTvmInfoGathering <li>DeviceTvmInfoGatheringKB <li>DeviceTvmSecureConfigurationAssessment <li>DeviceTvmSecureConfigurationAssessmentKB <li>DeviceTvmSoftwareEvidenceBeta <li>DeviceTvmSoftwareInventory <li>DeviceTvmSoftwareVulnerabilities <li>DeviceTvmSoftwareVulnerabilitiesKB <li>DynamicEventCollection <li>EmailAttachmentInfo <li>EmailEvents <li>EmailPostDeliveryEvents <li>EmailUrlInfo <li>IdentityDirectoryEvents <li>IdentityInfo <li>IdentityLogonEvents <li>IdentityQueryEvents <li>UrlClickEvents</ul> |<ul><li>AADManagedIdentitySignInLogs <li>AADNonInteractiveUserSignInLogs <li>AADProvisioningLogs <li>AADRiskyUsers <li>AADServicePrincipalSignInLogs <li>AADUserRiskEvents <li>ABAPAuditLog_CL <li>AlertEvidence <li>AlertInfo <li>Anomalies <li>AppDependencies <li>AppTraces <li>AuditLogs <li>AWSCloudTrail <li>AWSGuardDuty <li>AzureActivity <li>AzureDevOpsAuditing <li>AzureDiagnostics <li>AzureMetrics <li>BehaviorAnalytics <li>CloudAppEvents <li>CommonSecurityLog <li>ContainerInventory <li>ContainerLog <li>DeviceEvents <li>DeviceFileCertificateInfo <li>DeviceFileEvents <li>DeviceImageLoadEvents <li>DeviceInfo <li>DeviceLogonEvents <li>DeviceNetworkEvents <li>DeviceNetworkInfo <li>DeviceProcessEvents <li>DeviceRegistryEvents <li>DnsEvents <li>Dynamics365Activity <li>EmailPostDeliveryEvents <li>Event <li>Heartbeat <li>IdentityInfo <li>InsightsMetrics <li>IntuneAuditLogs <li>IntuneDevices <li>LAQueryLogs <li>MicrosoftAzureBastionAuditLogs <li>MicrosoftPurviewInformationProtection <li>OfficeActivity <li>Perf <li>PowerBIActivity <li>ProtectionStatus <li>SecurityAlert <li>SecurityEvent <li>SecurityIncident <li>SecurityRecommendation <li>SigninLogs <li>SqlAtpStatus <li>StorageBlobLogs <li>StorageFileLogs <li>Syslog <li>ThreatIntelligenceIndicator <li>Update <li>UrlClickEvents <li>Usage <li>UserAccessAnalytics <li>UserPeerAnalytics <li>VMBoundPort <li>VMComputer <li>VMConnection <li>VMProcess <li>WindowsEvent <li>W3CIISLog <li>WindowsFirewall</ul>|