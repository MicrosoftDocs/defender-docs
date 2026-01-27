---
title: Interoperability with Azure services, Azure clouds, and client operating systems
description: Learn about the Azure cloud environments where Defender for Cloud can be used, the Azure services that Defender for Cloud protects, and the client operating systems that Defender for Cloud supports.
ms.topic: limits-and-quotas
author: Elazark
ms.author: elkrieger
ms.date: 01/27/2026
---

# Support matrices for Defender for Cloud

[!INCLUDE [21Vianet](./includes/21vianet-retirement.md)]

This article indicates the [Azure services](#security-benefits-for-azure-services), [client operating systems](#supported-operating-systems), and which [features are supported in Azure commercial and government clouds](#cloud-support) by Microsoft Defender for Cloud.

## Security benefits for Azure services

Defender for Cloud provides recommendations, security alerts, and vulnerability assessment for these Azure services:

|Service|[Recommendations](security-policy-concept.md) free with [Foundational CSPM](concept-cloud-security-posture-management.md) |[Security alerts](alerts-overview.md) |Vulnerability assessment|
|:----|:----:|:----:|:----:|
|Azure App Service|✔|✔|-|
|Azure Automation account|✔|-|-|
|Azure Batch account|✔|-|-|
|Azure Blob Storage|✔|✔|-|
|Azure Cache for Redis|✔|-|-|
|Azure Cloud Services|✔|-|-|
|Azure AI Search|✔|-|-|
|Azure AI Service|✔|✔|-|
|Azure Container Registry|✔|✔|[Defender for Containers](defender-for-containers-introduction.md)|
|Azure Cosmos DB*|✔|✔|-|
|Azure Data Lake Analytics|✔|-|-|
|Azure Data Lake Storage|✔|✔|-|
|Azure Database for MySQL*|-|✔|-|
|Azure Database for PostgreSQL*|-|✔|-|
|Azure Event Hubs namespace|✔|-|-|
|Azure Files|✔|✔|-|
|Azure Functions app|✔|-|-|
|Azure Key Vault|✔|✔|-|
|Azure Kubernetes Service|✔|✔|-|
|Azure Load Balancer|✔|-|-|
|Azure Logic Apps|✔|-|-|
|Azure SQL Database|✔|✔|[Defender for Azure SQL](defender-for-sql-introduction.md)|
|Azure SQL Managed Instance|✔|✔|[Defender for Azure SQL](defender-for-sql-introduction.md)|
|Azure Service Bus namespace|✔|-|-|
|Azure Service Fabric account|✔|-|-|
|Azure Stream Analytics|✔|-|-|
|Azure Subscription|✔ **|✔|-|
|Azure Virtual Network</br> (incl. subnets, NICs, and network security groups)|✔|-|-|

\* These features are currently supported in preview.

\*\* Microsoft Entra recommendations are available only for subscriptions with [enhanced security features enabled](enable-enhanced-security.md).

## Cloud support

In the support table, **NA** indicates that the feature isn't available.

|**Feature/Plan** | **Azure** | **Azure Government** | **Microsoft Azure operated by 21Vianet**<sup>[3](#footnote3)</sup>|
|--- | --- | --- | --- |
|**GENERAL FEATURES** | | ||
| [Alert bi-directional synchronization with Microsoft Sentinel](/azure/sentinel/connect-azure-security-center) | GA | GA | NA |
| [Alert email notifications](configure-email-notifications.md) | GA | GA | NA |
| [Alert suppression rules](alerts-suppression-rules.md) | GA | GA | NA |
| [Automatic component/agent/extension provisioning](monitoring-components.md) | GA | GA | GA |
| [Azure Workbooks integration for reporting](custom-dashboards-azure-workbooks.md) | GA | GA | GA |
| [Continuous data export](continuous-export.md) | GA | GA | NA |
| [Exempt resources from recommendations](exempt-resource.md) | Preview | NA | NA |
| [Response automation with Azure Logic Apps](./workflow-automations.md) | GA | GA | NA |
| [Security alerts](alerts-overview.md)<br/> Generated when one or more Defender for Cloud plans is enabled. | GA | GA | NA |
|**FOUNDATIONAL Cloud Security Posture Management (CSPM) FEATURES (FREE)** | | ||
| [Copilot in Defender for Cloud](copilot-security-in-defender-for-cloud.md) | GA | NA | NA |
|**FOUNDATIONAL CSPM FEATURES (FREE)** | | ||
| [Asset inventory](asset-inventory.md) | GA | GA | GA |
| [Security recommendations](security-policy-concept.md) based on the [Microsoft Cloud Security Benchmark](concept-regulatory-compliance.md)  | GA | GA | GA |
| [Secure score](secure-score-security-controls.md) | GA | GA | GA |
| [DevOps security posture](concept-devops-environment-posture-management-overview.md) | Preview | NA | NA |
| **DEFENDER Cloud Security Posture Management (CSPM) FEATURES** | | | |
| [Data and AI security dashboard](data-aware-security-dashboard-overview.md) | GA | NA | NA |
| [Attack path](concept-attack-path.md) | GA | NA | NA |
| [AI security posture management](ai-security-posture.md) | GA | GA | NA |
| [Active user](active-user.md) | Public preview | NA | NA |
| Security recommendations |GA|GA|NA|
| Asset inventory |GA|GA|NA|
| Secure score |GA|GA|NA|
| [Workbooks](custom-dashboards-azure-workbooks.md) |GA|GA|GA|
| Continues Export |GA|GA|NA|
| Workflow automation |GA|GA|NA|
| Quick Fix |GA|GA|NA|
| Agentless Virtual Machine (VM) vulnerability scanning |GA|GA|NA|
| Agentless VM secrets scanning |GA|GA|NA|
| Attack path analysis |GA|GA|NA|
| Risk prioritization |GA|GA|NA|
| Security Explorer |GA|GA|NA|
| Code-to-cloud mapping for containers |GA|NA|NA|
| Code-to-cloud mapping for IaC |GA|NA|NA|
| PR annotations |GA|NA|NA|
| Internet exposure analysis |GA|GA|NA|
| External attack surface management |GA|NA|NA|
| Cloud Infrastructure Entitlement Management (CIEM) |GA|NA|NA|
| Regulatory compliance |GA|GA|NA|
| ServiceNow Integration |GA|NA|NA|
| Critical assets protection |GA|GA|NA|
| Governance |GA|GA|NA|
| Sensitive data scanning (DSPM) |GA|GA|NA|
| Agentless scanning for Kubernetes |GA|GA|NA|
| Custom Recommendations (Preview) |Public Preview|NA|NA|
| Agentless containers vulnerability assessment |GA|GA|NA|
| API security posture management (Preview) |Public Preview|NA|NA|
|**DEFENDER FOR CLOUD PLANS** | | ||
|[Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md)| GA | GA| NA|
|[Defender for AI Services](ai-threat-protection.md) | GA | NA | NA |
|[Defender for APIs](defender-for-apis-introduction.md) | GA | NA | NA|
|[Defender for App Service](defender-for-app-service-introduction.md) | GA | NA | GA |
|[Defender for Containers](defender-for-containers-introduction.md)<br/>[Review detailed feature support](support-matrix-defender-for-containers.md) | GA | GA | GA|
|[DevOps Security](defender-for-devops-introduction.md) | GA | NA | NA|
|[Defender for Domain Name System (DNS)](defender-for-dns-introduction.md) | GA | GA | GA|
|[Defender for Key Vault](defender-for-key-vault-introduction.md) | GA | NA | NA|
|[Defender for Resource Manager](defender-for-resource-manager-introduction.md) | GA | GA | NA|
|[Defender for Servers](plan-defender-for-servers.md) Plan 1 (P1) and Plan 2 (P2) <br><br/>[Review detailed feature support](support-matrix-defender-for-servers.md) | GA | GA | NA|
|[Defender for Storage](defender-for-storage-introduction.md) | GA | GA | NA|
| **DEFENDER FOR STORAGE FEATURES** | | | |
| Activity monitoring (security alerts) | GA | GA| GA|
| [Malware scanning](defender-for-storage-malware-scan.md) | GA<sup>[1](#footnote1)</sup> | GA | NA |
| [Sensitive data threat detection (Sensitive Data Discovery)](defender-for-storage-data-sensitivity.md) | GA<sup>[1](#footnote1)</sup> | NA | NA |
| **DEFENDER FOR DATABASES FEATURES** | | | |
| [Defender for Azure SQL database servers](defender-for-sql-introduction.md) | GA | GA | GA<br/><br/>A subset of alerts/vulnerability assessments is available.<br/>Behavioral threat protection isn't available. |
| [Defender for SQL servers on machines](defender-for-sql-servers-introduction.md) | GA | GA | GA |
| [Defender for SQL Servers on Machines](defender-for-sql-introduction.md) | GA | GA | GA |
| [Vulnerability assessment](sql-azure-vulnerability-assessment-overview.md) Express and Classic configurations | GA | GA | GA |
| [Advanced threat protection](/azure/azure-sql/database/threat-detection-overview?view=azuresql&preserve-view=true) | GA | GA | GA |
| [Defender for Open-Source Relational Databases](defender-for-databases-introduction.md) | GA | GA | GA |
| [Defender for Azure Cosmos DB](concept-defender-for-cosmos.md) | GA | NA | NA |
| **DEFENDER FOR SERVERS FEATURES** | | | |
| [File Integrity Monitoring](file-integrity-monitoring-overview.md) | GA | GA<sup>[2](#footnote2)</sup> |  NA |

<sup><a name="footnote1"></a>1</sup>: Azure DNS Zone isn't supported for malware scanning and sensitive data threat detection. <br>
<sup><a name="footnote2"></a>2</sup>: GovCon Cloud Moderate (GCCM) doesn't support File Integrity Monitoring. <br>
<sup><a name="footnote3"></a>3</sup>: All Microsoft Defender for Cloud features will be officially retired in the Azure in China region on August 18, 2026. Learn more about the [retirement of Microsoft Defender for Cloud in Azure operated by 21Vianet](https://azure.microsoft.com/updates/?id=498749).

[!INCLUDE [Defender for DNS note](./includes/defender-for-dns-note.md)]

## Supported operating systems

To learn more about the specific Defender for Cloud features available on Windows and Linux, review:

- [Defender for Servers support](support-matrix-defender-for-servers.md)
- [Defender for Containers support](support-matrix-defender-for-containers.md)

> [!NOTE]
> Even though Microsoft Defender for Servers is designed to protect servers, some features are available on certain desktop operating systems. One feature that isn't currently supported for Windows desktop systems is [Defender for Cloud's integrated EDR solution: Microsoft Defender for Endpoint](integration-defender-for-endpoint.md).

## Next steps

- [Manage security recommendations in Defender for Cloud](review-security-recommendations.md)
- [Manage and respond to security alerts in Defender for Cloud](manage-respond-alerts.md)
