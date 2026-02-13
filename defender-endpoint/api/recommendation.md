---
title: Recommendation methods and properties
description: Retrieves the top recent alerts.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 11/13/2025
appliesto:
  - Microsoft Defender for Endpoint
  - Microsoft Defender for Endpoint Plan 1
---

# Recommendation resource type

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

## Properties

<br/>

****

|Property|Type|Description|
|---|---|---|
|id|String|Recommendation ID|
|productName|String|Related software name|
|recommendationName|String|Recommendation name|
|Weaknesses|Long|Number of discovered vulnerabilities|
|Vendor|String|Related vendor name|
|recommendedVersion|String|Recommended version|
|recommendedProgram|String|Recommended program|
|recommendedVendor|String|Recommended vendor|
|recommendationCategory|String|Recommendation category. Possible values are: `Accounts`, `Application`, `Network`, `OS`, `SecurityControls`|
|subCategory|String|Recommendation subcategory|
|severityScore|Double|Potential impact of the configuration to the organization's Microsoft Secure Score for Devices (1-10)|
|publicExploit|Boolean|Public exploit is available|
|activeAlert|Boolean|Active alert is associated with this recommendation|
|associatedThreats|String collection|Threat analytics report is associated with this recommendation|
|remediationType|String|Remediation type. Possible values are: `ConfigurationChange`,`Update`,`Upgrade`,`Uninstall`|
|Status|Enum|Recommendation exception status. Possible values are: `Active` and `Exception`|
|configScoreImpact|Double|Microsoft Secure Score for Devices impact|
|exposureImpact|Double|Exposure score impact|
|totalMachineCount|Long|Number of installed devices|
|exposedMachinesCount|Long|Number of installed devices that are exposed to vulnerabilities|
|nonProductivityImpactedAssets|Long|Number of devices that aren't affected|
|relatedComponent|String|Related software component|
|exposedCriticalDevices|Numeric|The sum of critical devices in all levels of criticality except "not critical" for a particular recommendation|
