---
title: Recommendation methods and properties
description: Retrieves the top recent alerts.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
search.appverid: met150
ms.date: 12/18/2020
---

# Recommendation resource type

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](../microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint](../microsoft-defender-endpoint.md)

Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!include[Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!include[Improve request performance](../../includes/improve-request-performance.md)]

[!include[Prerelease information](../../includes/prerelease.md)]

## Methods

<br/>

****

|Method|Return Type|Description|
|---|---|---|
|[List all recommendations](get-all-recommendations.md)|Recommendation collection|Retrieves a list of all security recommendations affecting the organization|
|[Get recommendation by ID](get-recommendation-by-id.md)|Recommendation|Retrieves a security recommendation by its ID|
|[Get recommendation software](list-recommendation-software.md)|[Software](software.md)|Retrieves a security recommendation related to a specific software|
|[Get recommendation devices](get-recommendation-machines.md)|MachineRef collection|Retrieves a list of devices associated with the security recommendation|
|[Get recommendation vulnerabilities](get-recommendation-vulnerabilities.md)|[Vulnerability](vulnerability.md) collection|Retrieves a list of vulnerabilities associated with the security recommendation|
|

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

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
