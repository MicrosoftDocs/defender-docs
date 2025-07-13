---
title: Permissions in Microsoft Defender XDR Unified role-based access control (RBAC)
description: Learn about the custom permissions available in Microsoft Defender XDR Security role-based access control (RBAC)
ms.service: defender-xdr
ms.author: bagol
author: batamig
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection:
- m365-security
- tier3
ms.custom:
ms.topic: concept-article
ms.date: 07/13/2025
ms.reviewer:
search.appverid: met150
appliesto:
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender XDR
- Microsoft Defender for Identity
- Microsoft Defender for Office 365 P2
- Microsoft Defender Vulnerability Management
- Microsoft Defender for Cloud
- Microsoft Security Exposure Management
- Microsoft Defender for Cloud Apps
---

# Permissions in Microsoft Defender XDR Unified role-based access control (RBAC)
<a name='microsoft-365-defender-unified-rbac-permission-details'></a>

Use Microsoft Defender Unified role-based access control (RBAC) to manage permissions for users and groups in your organization. Unified RBAC supports selecting permissions from each permission group to customize a role.

This article provides details about the permissions available to configure for your users, based on the tasks they need to do.

Unless otherwise stated, all permissions are applicable to all supported workloads and will be applied to the data scope selected during the data source and assignment stage.

## Security operations – Security data

Permissions for managing day-to-day operations and responding to incidents and advisories.

|Permission name|Level|Description|
|---|---|---|
|Security data basics|Read|View info about incidents, alerts, investigations, advanced hunting, devices, submissions, evaluation lab, and reports. View data lake data and experiences (Preview).|
|Alerts|Manage|Manage alerts, start automated investigations, run scans, collect investigation packages, and manage device tags.|
|Response|Manage|Take response actions, approve or dismiss pending remediation actions, and manage blocked and allowed lists for automation.|
|Basic live response|Manage|Initiate a live response session, download files, and perform read-only actions on devices remotely.|
|Advanced live response|Manage|Create live response sessions and perform advanced actions, including uploading files and running scripts on devices remotely.|
|File collection|Manage|Collect or download relevant files for analysis, including executable files.|
|Email & collaboration quarantine|Manage|View and release email from quarantine.|
|Email & collaboration advanced actions|Manage|Move or Delete email to the junk email folder, deleted items or inbox, including soft and hard delete of email.|

## Security operations – Raw data (Email & collaboration)

|Permission name|Level|Description|
|---|---|---|---|
|Email & collaboration metadata|Read|View email and collaboration data in hunting scenarios, including advanced hunting, threat explorer, campaigns, and email entity.|
|Email & collaboration content|Read|View and download email content and attachments.|

## Security posture – Posture management

Permissions for managing the organization's security posture and performing vulnerability management.

|Permission name|Level|Description|
|---|---|---|
|Vulnerability management|Read|View Defender Vulnerability Management data for the following: software and software inventory, weaknesses, missing KBs, advanced hunting, security baselines assessment, and devices.|
|Exception handling|Manage|Create security recommendation exceptions and manage active exceptions in Defender Vulnerability Management.|
|Remediation handling|Manage|Create remediation tickets, submit new requests, and manage remediation activities in Defender Vulnerability Management.|
|Application handling|Manage|Manage vulnerable applications and software, including blocking and unblocking them in Defender Vulnerability Management.|
|Security baseline assessment|Manage|Create and manage profiles so you can assess if your devices comply with security industry baselines.|
|Exposure Management|Read / Manage|View or manage Exposure Management insights, including Microsoft Secure Score recommendations from all products that are covered by Secure Score.|

## Authorization and settings

Permissions to manage the security and system settings and to create and assign roles.

|Permission name|Level|Description|
|---|---|---|
|Authorization|Read / Manage|View or manage device groups, and custom and built-in roles.|
|Core security settings|Read / Manage|View or manage core security settings for the Microsoft Defender portal.|
|Detection tuning| Manage |Manage tasks related to detections in the Microsoft Defender portal including Custom detections, Alerts Tuning and Threat Indicators of compromise.|
|System settings|Read / Manage|View or manage general systems settings for the Microsoft Defender portal.|


## Data operations (Preview)

Permissions for managing the organization's security data and controlling advanced analytics permissions, supported for Microsoft Sentinel workspaces [onboarded to the Defender portal](/unified-secops-platform/microsoft-sentinel-onboard) and the [Microsoft Sentinel data lake](https://aka.ms/data-lake-overview).

The following permissions can be assigned for both Microsoft Sentinel SIEM and data lake capabilities, which includes data lake data stored in the default data lake workspace. 

|Permission name|Level|Description|
|---|---|---|
|Data |  Manage | Manage data retention, move data between tiers, create data lake tables, and manage connectors for the Microsoft Sentinel data lake. |
|Analytics Jobs Schedule | Read / Manage | Schedule and manage analytics jobs within the Microsoft Sentinel data lake using Lake Exploration, Azure Data Explorer, or Notebooks.|

## Next steps

- [Create custom roles](create-custom-rbac-roles.md)
- [Activate Microsoft Defender XDR Unified RBAC](activate-defender-rbac.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
