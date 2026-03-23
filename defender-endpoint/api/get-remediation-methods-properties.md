---
title: Remediation activity methods and properties
description: The API response contains Microsoft Defender Vulnerability Management remediation activities created in your tenant. You can request all the remediation activities, only one remediation activity, or information about exposed devices for a selected remediation task.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
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
  - Microsoft Defender Vulnerability Management
---

# Remediation activity methods and properties

[!INCLUDE [Prerelease information](../../includes/prerelease.md)]

The API response contains [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) remediation activities that have been created in your tenant. For more information,see: [remediation activities](/defender-vulnerability-management/tvm-remediation).

## Properties

|Property ID|Data type|Description|
|---|---|---|
|Category|String|Category of the remediation activity (Software/Security configuration)|
|completerEmail|String|If the remediation activity was manually completed by someone, this column contains their email|
|completerId|String|If the remediation activity was manually completed by someone, this column contains their object ID|
|completionMethod|String|A remediation activity can be completed "automatically" (if all the devices are patched) or "manually" by a person who selects "mark as completed."|
|createdOn|DateTime|Time this remediation activity was created|
|Description|String|Description of this remediation activity|
|dueOn|DateTime|Due date the creator set for this remediation activity|
|fixedDevices||The number of devices that have been fixed|
|ID|String|ID of this remediation activity|
|nameId|String|Related product name|
|Priority|String|Priority the creator set for this remediation activity (High\Medium\Low)|
|productId|String|Related product ID|
|productivityImpactRemediationType|String|A few configuration changes could be requested only for devices that don't affect users. This value indicates the selection between "all exposed devices" or "only devices with no user impact."|
|rbacGroupNames|String|Related device group names|
|recommendedProgram|String|Recommended program to upgrade to|
|recommendedVendor|String|Recommended vendor to upgrade to|
|recommendedVersion|String|Recommended version to update/upgrade to|
|relatedComponent|String|Related component of this remediation activity (similar to the related component for a security recommendation)|
|requesterEmail|String|Creator email address|
|requesterId|String|Creator object ID|
|requesterNotes|String|The notes (free text) the creator added for this remediation activity|
|Scid|String|SCID of the related security recommendation|
|Status|String|Remediation activity status (Active/Completed)|
|statusLastModifiedOn|DateTime|Date when the status field was updated|
|targetDevices|Long|Number of exposed devices that this remediation is applicable to|
|Title|String|Title of this remediation activity|
|Type|String|Remediation type|
|vendorId|String|Related vendor name|
