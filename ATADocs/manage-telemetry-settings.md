---
# required metadata

title: Manage Advanced Threat Analytics system-generated logs
description: Describes the data collected by ATA and provides steps to turn off data collection.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: article
ms.service: advanced-threat-analytics
ms.assetid: 8c1c7a1b-a3de-4105-9fd0-08a061952172

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Manage system-generated logs

[!INCLUDE [Banner for top of topics](includes/banner.md)]

[!INCLUDE [Handle personal data](../includes/gdpr-intro-sentence.md)]

 > [!NOTE]
 > Advanced Threat Analytics (ATA) collects anonymized system-generated log data about ATA and transmits the data over an HTTPS connection to Microsoft servers. This data is used by Microsoft to help improve future versions of ATA.

## Data collected

Collected anonymized data includes the following parameters:

- Performance counters from both the ATA Center and the ATA Gateway

- Product ID from licensed copies of ATA

- Deployment date of the ATA Center

- Number of deployed ATA Gateways

- The following anonymized Active Directory information:

    - Domain ID for the domain whose name would be the first domain when sorted alphabetically

    - Number of domain controllers

    - Number of domain controllers monitored by ATA via port mirroring

    - Number of Sites

    - Number of Computers

    - Number of Groups

    - Number of Users

- Suspicious Activities  – The following anonymized data is collected for each suspicious activity:

    (Computer names, user names, and IP addresses are **not** collected)

    - Suspicious activity type

    - Suspicious activity ID

    - Status

    - Start and End Time

    - Input provided

- Health issues – The following anonymized data is collected for each health issue:

    (Computer names, user names, and IP addresses are not collected)

    - Health issue type

    - Health issue ID

    - Status

    - Start and End Time

- ATA Console URL addresses - URL addresses when using the ATA Console, that is, which pages in the ATA Console are visited.


### Disable data collection
Perform the following steps to stop collecting and sending telemetry data to Microsoft:

1. Log in to the ATA Console, click the three dots in the toolbar and select **About**.

1. Uncheck the box for **Send us usage information to help improve your customer experience in the future**.

## See Also
- [Troubleshooting ATA using the event log](troubleshooting-ata-using-logs.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
