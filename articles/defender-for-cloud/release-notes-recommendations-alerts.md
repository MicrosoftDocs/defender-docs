---
title: New and upcoming changes in recommendations, alerts, and incidents
description: Get release notes for new and upcoming changes in recommendations, alerts, and incidents in Microsoft Defender for Cloud. 
ms.topic: overview
ms.date: 11/30/2025
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
  - [Keyvault recommendations](recommendations-reference-keyvault.md)
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

| **Date announced**     | **Type**       | **State**            | **Name**                                                     |
| ------------ | -------------- | -------------------- | ------------------------------------------------------------ |
| December 11, 2025  | Alert          | Upcoming Deprecation | The following alerts are going to be deprecated as part of our ongoing quality and accuracy improvement process: <br>\* AppServices_AnomalousPageAccess<br>\* AppServices_CurlToDisk<br>\* AppServices_WpThemeInjection<br>\* AppServices_SmartScreen<br>\* AppServices_ScanSensitivePage<br>\* AppServices_CommandlineSuspectDomain<br>\* AzureDNS_ThreatIntelSuspectDomain<br>\* AppServices_FilelessAttackBehaviorDetection<br>\* AppServices_FilelessAttackTechniqueDetection<br>\* AppServices_FilelessAttackToolkitDetection<br>\* AppServices_PhishingContent<br>\* AppServices_ProcessWithKnownSuspiciousExtension<br><br>These alerts are being retired as part of a quality improvement process and replaced by newer, more advanced alerts that provide greater accuracy and improved threat detection capabilities. This update ensures enhanced security coverage and reduced noise. |
| December 3, 2025 | Recommendation | Upcoming deprecation (30 day notice) | The following recommendation is set for deprecation 30 days from now: `Microsoft Defender for SQL status should be protected for Arc-enabled SQL Servers` for Defender for SQL Servers on Machines plan. |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Code Signing should be enabled on Lambda](recommendations-reference-serverless-protection.md#preview-code-signing-should-be-enabled-on-lambda) |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Security mechanism should be used on lambda function API Gateway](recommendations-reference-serverless-protection.md#preview-security-mechanism-should-be-used-on-lambda-function-api-gateway) |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Authentication should be enabled on Lambda Function URLs](recommendations-reference-serverless-protection.md#preview-authentication-should-be-enabled-on-lambda-function-urls) |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Lambda function should implement Reserved Concurrency to prevent resource exhaustion](recommendations-reference-serverless-protection.md#preview-lambda-function-should-implement-reserved-concurrency-to-prevent-resource-exhaustion) |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Lambda function should be configured with automatic runtime version updates](recommendations-reference-serverless-protection.md#preview-lambda-function-should-be-configured-with-automatic-runtime-version-updates) |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Authentication should be enabled on Azure Functions](recommendations-reference-serverless-protection.md#preview-authentication-should-be-enabled-on-azure-functions) |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Overly permissive permissions should not be configured on Function App, Web App or Logic App](recommendations-reference-serverless-protection.md#preview-overly-permissive-permissions-shouldnt-be-configured-on-function-app-web-app-or-logic-app) |
| December 1, 2025  | Recommendation | Preview              | [(Preview) Restricted network access should be configured on Internet exposed Function app](recommendations-reference-serverless-protection.md#preview-restricted-network-access-should-be-configured-on-internet-exposed-function-app) |
| October 21, 2025  | Alert         | Update | The following changes will apply to K8S.Node_* Alerts for EKS and GKE clusters. The resourceIdentifiers property will reference the MDC Connector Identifier: Microsoft.Security/securityConnectors/CONNECTOR_NAME/securityentitydata/EKS_CLUSTER_NAME instead of the Arc resource ID Microsoft.Kubernetes/connectedClusters/ARC_CLUSTER_NAME. The Entitiesproperty will reference the Cloud Native Identifier arn:aws:eks:AWS_REGION:AWS_ACCOUNT:cluster/CLUSTER_NAME or container.googleapis.com/projects/PROJECT_ID/zones/ZONE/clusters/CLUSTER_NAME, rather than the Arc resource ID Microsoft.Kubernetes/connectedClusters/ARC_CLUSTER_NAME. The resourceTypefield under extendedPropertieswill change from "Kubernetes – Azure Arc" to the respective "AWS EKS Cluster" or "GCP GKE Cluster" resource type. |
| June 1, 2025       | Alert          | Upcoming Deprecation | The following alert will be deprecated since the method is no longer supported in PowerZure:<br/>* Usage of PowerZure function to maintain persistence in your Azure environment |
| May 15, 2025       | Alert          | Upcoming Deprecation | The following [alerts ](/azure/ddos-protection/ddos-view-alerts-defender-for-cloud)will be deprecated and will not be available through XDR Integration: <br/>* DDoS Attack detected for Public IP <br/>* DDoS Attack mitigated for Public IP <br/> **Note**: The alerts will be available on Defender for Cloud portal. |
| May 1, 2025        | Alert          | GA                   | [AI alerts](alerts-ai-workloads.md) have been released to GA with the plan's official GA release |
| April 20 2025     | Alert          | Preview              | [(Preview) AI - Suspicious anomaly detected in sensitive data exposed by AI resource](alerts-ai-workloads.md#preview-suspicious-anomaly-detected-in-sensitive-data-exposed-by-an-ai-resource), this replaces the previous sensitive data exposure alert |
| April 29, 2025     | Recommendation | GA                   | [Role-Based Access Control should be used on Keyvault Services](recommendations-reference-keyvault.md#role-based-access-control-should-be-used-on-keyvault-services) |
| April 20, 2025     | Alert          | Preview              | AI - Suspicious anomaly detected in sensitive data exposed by AI resource, this replaces the previous sensitive data exposure alert |
| February 5, 2025   | Recommendation | Upcoming Deprecation | The following recommendations will be deprecated:<br/>* Configure Microsoft Defender for Storage (Classic) to be enabled<br/>* Configure basic Microsoft Defender for Storage to be enabled (Activity Monitoring only) |
| January 29, 2025   | Recommendation | GA                   | We have further hardened the [Running containers as root user should be avoided](recommendations-reference-container.md#running-containers-as-root-user-should-be-avoided) recommendation.<br/><br/>**What's Changing?**<br/><br/>We now require at least one range to be specified for the "Run as group rule". This change was needed to ensure containers will not get access to files owned by root, and groups with permissions to the root group. |
| January 13, 2025   | Alert          | Preview              | [AI - Access from a suspicious IP](alerts-ai-workloads.md#access-from-suspicious-ip) |
| January 13, 2025   | Alert          | Preview              | [AI - Suspected wallet attack](alerts-ai-workloads.md#suspected-wallet-attack---recurring-requests) |
| December 19, 2024  | Alert          | GA                   | The following Azure Storage alerts are GA: </br> [Malicious blob was downloaded from a storage account](alerts-azure-storage.md#malicious-blob-was-downloaded-from-a-storage-account) </br> [Unusual SAS token was used to access an Azure storage account from a public IP address](alerts-azure-storage.md#unusual-sas-token-was-used-to-access-an-azure-storage-account-from-a-public-ip-address)</br> [Suspicious external operation to an Azure storage account with overly permissive SAS token](alerts-azure-storage.md#suspicious-external-access-to-an-azure-storage-account-with-overly-permissive-sas-token)</br> [Suspicious external access to an Azure storage account with overly permissive SAS token](alerts-azure-storage.md#suspicious-external-operation-to-an-azure-storage-account-with-overly-permissive-sas-token)</br> [Unusual unauthenticated public access to a sensitive blob container](alerts-azure-storage.md#unusual-unauthenticated-public-access-to-a-sensitive-blob-container)</br> [Unusual amount of data extracted from a sensitive blob container](alerts-azure-storage.md#unusual-amount-of-data-extracted-from-a-sensitive-blob-container)</br> [Unusual number of blobs extracted from a sensitive blob container](alerts-azure-storage.md#unusual-number-of-blobs-extracted-from-a-sensitive-blob-container)</br> [Access from an unusual location to a sensitive blob container](alerts-azure-storage.md#access-from-an-unusual-location-to-a-sensitive-blob-container)</br> [Access from a known suspicious application to a sensitive blob container](alerts-azure-storage.md#access-from-a-known-suspicious-application-to-a-sensitive-blob-container)</br> [Access from a known suspicious IP address to a sensitive blob container](alerts-azure-storage.md#access-from-a-known-suspicious-ip-address-to-a-sensitive-blob-container)</br> [Access from a Tor exit node to a sensitive blob container](alerts-azure-storage.md#access-from-a-tor-exit-node-to-a-sensitive-blob-container) |
| December 16, 2024   | Alert          | Preview              | [AI - Access from a Tor IP](alerts-ai-workloads.md#access-from-a-tor-ip) |
| November 19, 2024   | Deprecation    | GA                   | [MFA recommendations are deprecated as Azure now requires it.](https://azure.microsoft.com/blog/announcing-mandatory-multi-factor-authentication-for-azure-sign-in/). <br> The following recommendations are deprecated:</br> \* Accounts with read permissions on Azure resources should be MFA enabled </br> \* Accounts with write permissions on Azure resources should be MFA enabled </br> \* Accounts with owner permissions on Azure resources should be MFA enabled |
| November 19, 2024   | Alert          | Preview              | [AI - suspicious user agent detected](alerts-ai-workloads.md#suspicious-user-agent-detected) |
| November 19, 2024   | Alert          | Preview              | [ASCII Smuggling prompt injection detected](alerts-ai-workloads.md#ascii-smuggling-prompt-injection-detected) |
| October 30, 2024    | Alert          | GA                   | [Suspicious extraction of Azure Cosmos DB account keys](alerts-azure-cosmos-db.md#suspicious-extraction-of-azure-cosmos-db-account-keys) |
| October 30, 2024   | Alert          | GA                   | [The access level of a sensitive storage blob container was changed to allow unauthenticated public access](alerts-azure-storage.md#the-access-level-of-a-sensitive-storage-blob-container-was-changed-to-allow-unauthenticated-public-access) |
| October 30, 2024    | Recommendation | Upcoming Deprecation | [MFA recommendations are deprecated as Azure now requires it.](https://azure.microsoft.com/blog/announcing-mandatory-multi-factor-authentication-for-azure-sign-in/). <br> The following recommendations will be deprecated:</br> \* Accounts with read permissions on Azure resources should be MFA enabled </br> \* Accounts with write permissions on Azure resources should be MFA enabled </br> \* Accounts with owner permissions on Azure resources should be MFA enabled |
| October 12, 2024    | Recommendation | GA                   | [Azure Database for PostgreSQL flexible server should have Microsoft Entra authentication only enabled](recommendations-reference-data.md#azure-database-for-postgresql-flexible-server-should-have-microsoft-entra-authentication-only-enabled) |
| October 6, 2024     | Recommendation | Update               | [[Preview] Containers running in GCP should have vulnerability findings resolved](recommendations-reference-container.md#preview-containers-running-in-gcp-should-have-vulnerability-findings-resolved) |
| October 6, 2024     | Recommendation | Update               | [[Preview] Containers running in AWS should have vulnerability findings resolved](recommendations-reference-container.md#preview-containers-running-in-aws-should-have-vulnerability-findings-resolved) |
| October 6, 2024     | Recommendation | Update               | [[Preview] Containers running in Azure should have vulnerability findings resolved](recommendations-reference-container.md#preview-containers-running-in-azure-should-have-vulnerability-findings-resolved) |
| September 10, 2024  | Alert          | Preview              | [Corrupted AI application\model\data directed a phishing attempt at a user](alerts-ai-workloads.md#corrupted-ai-applicationmodeldata-directed-a-phishing-attempt-at-a-user) |
| September 10, 2024  | Alert          | Preview              | [Phishing URL shared in an AI application](alerts-ai-workloads.md#phishing-url-shared-in-an-ai-application) |
| September 10, 2024  | Alert          | Preview              | [Phishing attempt detected in an AI application](alerts-ai-workloads.md#phishing-attempt-detected-in-an-ai-application) |
| September 5, 2024   | Recommendation | GA                   | [System updates should be installed on your machines (powered by Azure Update Manager)](recommendations-reference-compute.md) |
| September 5, 2024   | Recommendation | GA                   | [Machines should be configured to periodically check for missing system updates](recommendations-reference-compute.md) |

## Related content

For information about new features, see [What's new in Defender for Cloud features](release-notes.md).
