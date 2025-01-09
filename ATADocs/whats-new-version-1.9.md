---
# required metadata

title: What's new in ATA version 1.9
description: Lists what was new in ATA version 1.9 along with known issues
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 51de491c-49ba-4aff-aded-cc133a8ccf0b

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: 
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# What's new in ATA version 1.9

The latest update version of ATA can be [downloaded from the Download Center](https://www.microsoft.com/download).

These release notes provide information about updates, new features, bug fixes, and known issues in this version of Advanced Threat Analytics.

## New & updated detections

-  **Suspicious service creation**: Attackers attempt to run a suspicious service on your network. ATA now raises an alert when it identifies that someone runs a new service, that seems suspicious, on a domain controller. This detection is based on events (not network traffic), for more information, see the [Suspicious activity guide](suspicious-activity-guide.md#suspicious-service-creation).


## New reports to help you investigate 

- The [**Passwords exposed in cleartext**](reports.md) enables you to detect when accounts, both sensitive and non-sensitive, send account credentials in plain text. This allows you to investigate and mitigate the use of LDAP simple bind in your environment, improving your network security level. This report replaces the service and sensitive account cleartext suspicious activity alerts.

- The [**Lateral movement paths to sensitive accounts**](reports.md) lists the sensitive accounts that are exposed via lateral movement paths. This enables you to mitigate these paths and harden your network to minimize the attack surface risk. This enables you to prevent lateral movement so that attackers can't move across your network between users and computers until they hit the virtual security jackpot: your sensitive admin account credentials.

## Improved investigation

- ATA 1.9 includes a new and improved [entity profile](entity-profiles.md). The entity profile provides you with a dashboard designed for full deep-dive investigation of users, the resources they accessed, and their history. The entity profile also enables you to identify sensitive users who are accessible via lateral movement paths. 

- ATA 1.9 enables you to [manually tag groups](tag-sensitive-accounts.md) or accounts as sensitive to enhance detections. This tagging impacts many ATA detections, such as sensitive group modification detection and lateral movement path, rely on which groups and accounts are considered sensitive.

## Performance improvements

- The ATA Center infrastructure was improved for performance: the aggregated view of the traffic enables optimization of CPU and packet pipeline, and reuses sockets to the domain controllers to minimize SSL sessions to the DC.



## Additional changes

- After a new version of ATA is installed, the [**What's new**](working-with-ata-console.md) icon appears in the toolbar to let you know what was changed in the latest version. It also provides you with a link to the in-depth version changelog.


## Removed and deprecated features

- The **Broken trust suspicious activity** alert was removed.
- The passwords exposed in clear text suspicious activity was removed. It was replaced by the [**Passwords exposed in clear text report**](reports.md).



## See Also
[Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)

[Update ATA to version 1.9 - migration guide](ata-update-1.9-migration-guide.md)

