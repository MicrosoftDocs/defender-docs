---
title: Alerts API
description: This article provides information about using the Alerts API.
ms.date: 01/29/2023
ms.topic: reference
---
# Alerts API



The Alerts API provides you with information about immediate risks identified by Defender for Cloud Apps that require attention. Alerts can result from suspicious usage patterns or from files containing content that violates company policy.

The following lists the supported requests:

- [List alerts](api-alerts-list.md)
- [Close benign](api-alerts-close-benign.md)
- [Close false positive](api-alerts-close-false-positive.md)
- [Close true positive](api-alerts-close-true-positive.md)
- [Fetch alert](api-alerts-fetch.md)
- [Mark alert as read](api-alerts-mark-read.md)
- [Mark alert as unread](api-alerts-mark-unread.md)

## Deprecated requests

The following table lists the requests deprecated as obsolete, and the requests that replace them.

| Obsolete request | Alternative |
| --- | --- |
| Bulk dismiss | [Close false positive](api-alerts-close-false-positive.md) |
| Bulk resolve | [Close true positive](api-alerts-close-true-positive.md) |
| Dismiss alert | [Close false positive](api-alerts-close-false-positive.md) |

> [!NOTE]
> The deprecated requests have been mapped to their alternatives to avoid disruption. However, if you are using obsolete requests in your environment, we recommend updating them to their alternatives.

## Properties

The response object defines the following properties.

| Property | Type | Description |
| --- | --- | --- |
| _id | int | Alert type identifier |
| timestamp | long | [Timestamp](api-introduction.md#timestamps) of when the alert was raised |
| entities | list | A list of entities related to the alert |
| title                | string | The title of the alert                                       |
| description          | string | The alert's description                                          |
| isMarkdown           | bool   | Flag to indicate if the alert's description is already in HTML |
| statusValue               | int    | The alert's state. Possible values include:<br /><br />**0**: UNREAD<br />**1**: READ<br />**2**: ARCHIVED |
| severityValue             | int    | The alert's severity. Possible values include:<br /><br />**0**: LOW<br />**1**: MEDIUM<br />**2**: HIGH<br />**3**: INFORMATIONAL |
| resolutionStatusValue     | int    | Alert's status. Possible values include:<br /><br />**0**: OPEN<br />**1**: DISMISSED<br />**2**: RESOLVED<br />**3**: FALSE_POSITIVE<br />**4**: BENIGN<br />**5**: TRUE_POSITIVE |
| stories              | list    | Risk category. Possible values include:<br /><br />**0**: THREAT_DETECTION<br />**1**: PRIVILEGED_ACCOUNT_MONITORING<br />**2**: COMPLIANCE<br />**3**: DLP<br />**4**: DISCOVERY<br />**5**: SHARING_CONTROL<br />**7**: ACCESS_CONTROL<br />**8**: CONFIGURATION_MONITORING |
| evidence             | list   | List of short descriptions of main parts of the alert        |
| intent               | list   | A field that specifies the kill chain related intent behind the alert. Multiple values can be reported in this field. The **intent** enumeration values follow the [MITRE att@ck enterprise matrix model](https://attack.mitre.org/matrices/enterprise/). Further guidance on the different techniques that make up each intent can be found in MITRE's documentation.<br>  Possible values include:<br/><br>**0**: UNKNOWN<br />**1**: PREATTACK<br />**2**: INITIAL_ACCESS<br />**3**: PERSISTENCE<br />**4**: PRIVILEGE_ESCALATION<br />**5**: DEFENSE_EVASION<br />**6**: CREDENTIAL_ACCESS<br />**7**: DISCOVERY<br />**8**: LATERAL_MOVEMENT<br />**9**: EXECUTION<br />**10**: COLLECTION<br />**11**: EXFILTRATION<br />**12**: COMMAND_AND_CONTROL<br />**13**: IMPACT |
| isPreview            | bool   | Alerts that have been recently released as GA                |
| audits *(optional)*  | list   | List of event IDs that are related to the alert              |

## Filters

For information about how filters work, see [Filters](api-introduction.md#filters).

The following table describes the supported filters:

| Filter | Type | Operators | Description |
| --- | --- | --- | --- |
| entity.entity | entity pk | eq,neq | Filter alerts related to specified entities. Example: `[{ "id": "entity-id", "inst": 0 }]` |
| entity.ip | string | eq, neq | Filter alerts related to specified IP addresses |
| entity.service | integer | eq, neq | Filter alerts related to the specified service appId, e.g: 11770 |
| entity.instance | integer | eq, neq | Filter alerts related to the specified instances, e.g: 11770, 1059065 |
| entity.policy | string | eq, neq | Filter alerts related to the specified policies |
| entity.file | string | eq, neq | Filter alerts related to specified file |
| alertOpen | boolean | eq | If set to *true*, returns only open alerts, if set to *false*, returns only closed alerts |
| severity | integer | eq, neq | Filter by severity. Possible values include:<br /><br />**0**: Low<br />**1**: Medium<br/>**2**: High |
| resolutionStatus | integer | eq, neq | Filter by alert resolution status, possible values include:<br /><br />**0**: Open <br />**1**: Dismissed (legacy status)<br />**2**: Resolved (legacy status)<br />**3**: Closed as false positive<br />**4**: Closed as benign<br />**5**: Closed as true positive |
| read | boolean | eq | If set to *true*, returns only read alerts, if set to *false*, returns unread alerts |
| date | timestamp | lte, gte, range, lte_ndays, gte_ndays | Filter by the time when an alert was triggered |
| resolutionDate | timestamp | lte, gte, range | Filter by the time when an alert was resolved |
| risk | integer | eq, neq | Filter by risk |
| alertType | integer | eq, neq | Filter by alert type |
| ID | string | eq, neq | Filter by alert IDs |
| source | string | eq | The alert's origin, either built-in or policy |

[!INCLUDE [Open support ticket](includes/support.md)]
