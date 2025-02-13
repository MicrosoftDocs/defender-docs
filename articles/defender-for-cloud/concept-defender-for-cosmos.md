---
title: Overview of Defender for Azure Cosmos DB
description: Learn about the benefits, features, and security capabilities of Microsoft Defender for Azure Cosmos DB to help protect your databases.
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
ms.date: 12/24/2024
#customer intent: As a security administrator, I want to understand the features of Microsoft Defender for Azure Cosmos DB so that I can protect my databases from threats.
---

# Overview of Microsoft Defender for Azure Cosmos DB

In Microsoft Defender for Cloud, the *Defender for Azure Cosmos DB* component of the Defender for Databases plan detects potential SQL injections, known bad actors, and suspicious access patterns based on [Microsoft Threat Intelligence](https://www.microsoft.com/security/blog/topic/threat-intelligence/). It also identifies potential exploitation of your database through compromised identities or malicious insiders.

Defender for Azure Cosmos DB continually analyzes the personal data stream from the Azure Cosmos DB service. When it detects potentially malicious activities, it generates security alerts in Defender for Cloud. These alerts provide details of the suspicious activity, along with relevant investigation steps, remediation actions, and security recommendations to prevent future attacks.

You can [enable Microsoft Defender for Azure Cosmos DB](quickstart-enable-database-protections.md) for all your databases (recommended), or you can enable it at either the subscription level or the resource level. Importantly, Defender for Azure Cosmos DB doesn't access the Azure Cosmos DB account data and doesn't affect the service's performance.

For billing information about Defender for Azure Cosmos DB, see the [Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

The following table lists supported and unsupported Azure Cosmos DB APIs in Defender for Azure Cosmos DB:

| Supported | Not supported |
|--|--|
| Azure Cosmos DB for NoSQL |  Azure Cosmos DB for Apache Cassandra <br>  Azure Cosmos DB for MongoDB <br> Azure Cosmos DB for Table <br> Azure Cosmos DB for Apache Gremlin |

For cloud availability, see [Defender for Cloud support matrices for Azure commercial/other clouds](support-matrix-cloud-environment.md).

## Benefits

Defender for Azure Cosmos DB uses advanced threat detection capabilities and Microsoft Threat Intelligence data. It continuously monitors your Azure Cosmos DB accounts for threats like SQL injection, compromised identities, and data exfiltration.

Defender for Cloud provides action-oriented security alerts with details of the suspicious activity and guidance on how to mitigate threats. Use this information to quickly remediate security issues and improve the security of your Azure Cosmos DB accounts.

You can export alerts to Microsoft Sentinel, to any partner security information and event management (SIEM) solution, or to any external tool. To learn how to stream alerts, see [Stream alerts to monitoring solutions](export-to-siem.md).

## Alert types

Activities that trigger security alerts enriched with threat intelligence include:

- **Potential SQL injection attacks**: Due to the structure and capabilities of Azure Cosmos DB queries, many known SQL injection attacks don't work in Azure Cosmos DB. However, some variations of SQL injections could succeed and might result in exfiltrating data from your Azure Cosmos DB accounts. Defender for Azure Cosmos DB detects both successful and failed attempts, and it helps you harden your environment to prevent these threats.
- **Anomalous database access patterns**: An example is access from an onion router (Tor) exit node, known suspicious IP addresses, unusual applications, and unexpected locations.
- **Suspicious database activity**: An example is suspicious key-listing patterns that resemble known malicious lateral movement techniques and data extraction patterns.

> [!TIP]
> For a comprehensive list of all Defender for Azure Cosmos DB alerts, see [Alerts for Azure Cosmos DB](alerts-azure-cosmos-db.md). This information is useful for workload owners who want to know what threats can be detected. It can also help security operations center (SOC) teams gain familiarity with detections before investigating them. [Learn more about how to manage and respond to security alerts in Microsoft Defender for Cloud](managing-and-responding-alerts.yml).

## Related content

[Protect your databases with Defender for Databases](quickstart-enable-database-protections.md)
