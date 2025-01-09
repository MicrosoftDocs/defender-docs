---
title: New and upcoming changes in recommendations, alerts, and incidents
description: Get release notes for new and upcoming changes in recommendations, alerts, and incidents in Microsoft Defender for Cloud. 
ms.topic: overview
ms.date: 11/18/2024
#customer intent: As a Defender for Cloud admin, I want to stay up to date on the latest new and changed security recommendations and alerts.
---

# What's new in Defender for Cloud recommendations, alerts, and incidents

This article summarizes what's new in security recommendations, alerts, and incidents in Microsoft Defender for Cloud. It includes information about new, modified, and deprecated recommendations and alerts.

<!-- Please don't adjust this next line without getting approval from the Defender for Cloud documentation team. It is necessary for proper RSS functionality. -->
- This page is updated frequently with the latest recommendations and alerts in Defender for Cloud.
                                                                               
- Recommendations older than six months are found in the relevant recommendations reference list.        
- Find the latest information about new and updated Defender for Cloud features in [What's new in Defender for Cloud features](release-notes.md).

> [!TIP]
> Get notified when this page is updated by copying and pasting the following URL into your feed reader:
> `https://aka.ms/mdc/rss-recommendations-alerts`

- Review a complete list of multicloud security recommendations and alerts:
  - [AI recommendations](recommendations-reference-ai.md)
  - [Compute recommendations](recommendations-reference-compute.md)
  - [Container recommendations](recommendations-reference-container.md)
  - [Data recommendations](recommendations-reference-data.md)
  - [DevOps recommendations](recommendations-reference-devops.md)
  - [Identity and access recommendations](recommendations-reference-identity-access.md)
  - [IoT recommendations](recommendations-reference-iot.md)
  - [Networking recommendations](recommendations-reference-networking.md)
  - [Deprecated recommendations](recommendations-reference-deprecated.md)
  - [Security alerts](alerts-reference.md).
  - [Security incidents](incidents-reference.md)

## Recommendations, alerts, and incidents updates

New and updated recommendations, alerts, and incidents are added to the table in date order.

<!-- 1. Add your new recommendation/alert to the table.-->
<!-- 2. In Date, specify the date you added the item.-->
<!-- 3. In Type specify whether it's a Recommendation, Alert, or Incident.-->
<!-- 4. In State specify whether it's GA, Preview, Update, Deprecation, Upcoming Update, or Upcoming Deprecation, or other as needed.-->
<!-- 5. If you're adding a new recommendation entry to the table, first add the recommendation to the relevant recommendations-reference page. There are multiple pages for recommendations for AI, APIs, App Services, Compute, Container, Data, DevOps, Identity & Access, IoT, networking, and deprecated recommendations.-->
<!-- 6. If you're adding a new alert here, make sure you also add it to the alerts reference page-->
<!-- 7. After adding the alert to the alerts reference page or adding the recommendation to the recommendations page, in Name, add the name of the alert or recommendation, and add a link to the relevant entry that you added in the alerts or recommendations reference page. Note that all details about the alert or recommendation should be on the reference page. This page should only have minimum information.-->

| **Date**     | **Type**                       | **State**                                                    | **Name**                                                     |
| ------------ | ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| December 19 | Alert                          | GA                                                      | The following Azure Storage alerts are GA: </br> [Malicious blob was downloaded from a storage account](alerts-azure-storage.md#malicious-blob-was-downloaded-from-a-storage-account) </br> [Unusual SAS token was used to access an Azure storage account from a public IP address](alerts-azure-storage.md#unusual-sas-token-was-used-to-access-an-azure-storage-account-from-a-public-ip-address)</br> [Suspicious external operation to an Azure storage account with overly permissive SAS token](alerts-azure-storage.md#suspicious-external-access-to-an-azure-storage-account-with-overly-permissive-sas-token)</br> [Suspicious external access to an Azure storage account with overly permissive SAS token](alerts-azure-storage.md#suspicious-external-operation-to-an-azure-storage-account-with-overly-permissive-sas-token)</br> [Unusual unauthenticated public access to a sensitive blob container](alerts-azure-storage.md#unusual-unauthenticated-public-access-to-a-sensitive-blob-container)</br> [Unusual amount of data extracted from a sensitive blob container](alerts-azure-storage.md#unusual-amount-of-data-extracted-from-a-sensitive-blob-container)</br> [Unusual number of blobs extracted from a sensitive blob container](alerts-azure-storage.md#unusual-number-of-blobs-extracted-from-a-sensitive-blob-container)</br> [Access from an unusual location to a sensitive blob container](alerts-azure-storage.md#access-from-an-unusual-location-to-a-sensitive-blob-container)</br> [Access from a known suspicious application to a sensitive blob container](alerts-azure-storage.md#access-from-a-known-suspicious-application-to-a-sensitive-blob-container)</br> [Access from a known suspicious IP address to a sensitive blob container](alerts-azure-storage.md#access-from-a-known-suspicious-ip-address-to-a-sensitive-blob-container)</br> [Access from a Tor exit node to a sensitive blob container](alerts-azure-storage.md#access-from-a-tor-exit-node-to-a-sensitive-blob-container) |
| December 16 | Alert                          | Preview                                                      | [AI - Access from a Tor IP](alerts-ai-workloads.md#access-from-a-tor-ip) |
| November 19 | Deprecation | GA | [MFA recommendations are deprecated as Azure now requires it.](https://azure.microsoft.com/blog/announcing-mandatory-multi-factor-authentication-for-azure-sign-in/). <br> The following recommendations are deprecated:</br> \* Accounts with read permissions on Azure resources should be MFA enabled </br> \* Accounts with write permissions on Azure resources should be MFA enabled </br> \* Accounts with owner permissions on Azure resources should be MFA enabled |
| November 19 | Alert                          | Preview                                                      | [AI - suspicious user agent detected](alerts-ai-workloads.md#suspicious-user-agent-detected) |
| November 19 | Alert                          | Preview                                                      | [ASCII Smuggling prompt injection detected](alerts-ai-workloads.md#ascii-smuggling-prompt-injection-detected) |
| October 30   | Alert                          | GA                                                           | [Suspicious extraction of Azure Cosmos DB account keys](alerts-azure-cosmos-db.md#suspicious-extraction-of-azure-cosmos-db-account-keys) |
| October 30   | Alert                          | GA                                                           | [The access level of a sensitive storage blob container was changed to allow unauthenticated public access](alerts-azure-storage.md#the-access-level-of-a-sensitive-storage-blob-container-was-changed-to-allow-unauthenticated-public-access) |
| October 30   | Recommendation                 | Upcoming Deprecation                                         | [MFA recommendations are deprecated as Azure now requires it.](https://azure.microsoft.com/blog/announcing-mandatory-multi-factor-authentication-for-azure-sign-in/). <br> The following recommendations will be deprecated:</br> \* Accounts with read permissions on Azure resources should be MFA enabled </br> \* Accounts with write permissions on Azure resources should be MFA enabled </br> \* Accounts with owner permissions on Azure resources should be MFA enabled |
| October 12   | Recommendation                 | GA                                                           | [Azure Database for PostgreSQL flexible server should have Microsoft Entra authentication only enabled](recommendations-reference-data.md#azure-database-for-postgresql-flexible-server-should-have-microsoft-entra-authentication-only-enabled) |
| October 6    | Recommendation                 | Update                                                       | [[Preview] Containers running in GCP should have vulnerability findings resolved](recommendations-reference-container.md#preview-containers-running-in-gcp-should-have-vulnerability-findings-resolved) |
| October 6    | Recommendation                 | Update                                                       | [[Preview] Containers running in AWS should have vulnerability findings resolved](recommendations-reference-container.md#preview-containers-running-in-aws-should-have-vulnerability-findings-resolved) |
| October 6    | Recommendation                 | Update                                                       | [[Preview] Containers running in Azure should have vulnerability findings resolved](recommendations-reference-container.md#preview-containers-running-in-azure-should-have-vulnerability-findings-resolved) |
| September 10 | Alert                          | Preview                                                      | [Corrupted AI application\model\data directed a phishing attempt at a user](alerts-ai-workloads.md#corrupted-ai-applicationmodeldata-directed-a-phishing-attempt-at-a-user) |
| September 10 | Alert                          | Preview                                                      | [Phishing URL shared in an AI application](alerts-ai-workloads.md#phishing-url-shared-in-an-ai-application) |
| September 10 | Alert                          | Preview                                                      | [Phishing attempt detected in an AI application](alerts-ai-workloads.md#phishing-attempt-detected-in-an-ai-application) |
| September 5  | Recommendation                 | GA                                                           | [System updates should be installed on your machines (powered by Azure Update Manager)](recommendations-reference-compute.md) |
| September 5  | Recommendation                 | GA                                                           | [Machines should be configured to periodically check for missing system updates](recommendations-reference-compute.md) |

## Related content

For information about new features, see [What's new in Defender for Cloud features](release-notes.md).
