---
title: Support across Azure clouds
author: Elazark
ms.author: elkrieger
description: This article provides an overview of the supported features and plans for Defender for Cloud in Azure commercial cloud and government clouds.
ms.topic: limits-and-quotas
ms.date: 10/23/2025
---

# Defender for Cloud support matrices for Azure commercial/other clouds

[!INCLUDE [21Vianet](./includes/21vianet-retirement.md)]

This article indicates which Defender for Cloud features are supported in Azure commercial and government clouds.

## Cloud support

In the support table, **NA** indicates that the feature isn't available.

|**Feature/Plan** | **Azure** | **Azure Government** | **Microsoft Azure operated by 21Vianet**|
|--- | --- | --- | --- |
|**GENERAL FEATURES** | | ||
|[Continuous data export](continuous-export.md) | GA | GA | GA |
|[Response automation with Azure Logic Apps](./workflow-automation.yml) | GA | GA | GA |
|[Security alerts](alerts-overview.md)<br/> Generated when one or more Defender for Cloud plans is enabled. | GA | GA | GA |
|[Alert email notifications](configure-email-notifications.md) | GA | GA | GA |
|[Alert suppression rules](alerts-suppression-rules.md) | GA | GA | GA |
|[Alert bi-directional synchronization with Microsoft Sentinel](/azure/sentinel/connect-azure-security-center) | GA | GA | GA |
|[Azure Workbooks integration for reporting](custom-dashboards-azure-workbooks.md) | GA | GA | GA |
|[Automatic component/agent/extension provisioning](monitoring-components.md) | GA | GA | GA |
|**FOUNDATIONAL Cloud Security Posture Management (CSPM) FEATURES (FREE)** | | ||
|[Copilot in Defender for Cloud](copilot-security-in-defender-for-cloud.md) | GA | NA | GA |
|**FOUNDATIONAL CSPM FEATURES (FREE)** | | ||
|[Asset inventory](asset-inventory.md) | GA | GA | GA |
|[Security recommendations](security-policy-concept.md) based on the [Microsoft Cloud Security Benchmark](concept-regulatory-compliance.md)  | GA | GA | GA |
|[Recommendation exemptions](exempt-resource.md) | Preview | NA | GA |
|[Secure score](secure-score-security-controls.md) | GA | GA | GA |
|[DevOps security posture](concept-devops-environment-posture-management-overview.md) | Preview | NA | GA |
| **DEFENDER Cloud Security Posture Management (CSPM) FEATURES** | | | |
| [Data and AI security dashboard](data-aware-security-dashboard-overview.md) | GA | NA | GA |
| [Attack path](concept-attack-path.md) | GA | NA | GA |
| [AI security posture management](ai-security-posture.md) | GA | GA | GA |
| [Active user](active-user.md) | Public preview | NA | GA |
| Security recommendations |GA|GA|GA|
| Asset inventory |GA|GA|GA|
| Secure score |GA|GA|GA|
| [Workbooks](custom-dashboards-azure-workbooks.md) |GA|GA|GA|
| Continues Export |GA|GA|GA|
| Workflow automation |GA|GA|GA|
| Quick Fix |GA|GA|GA|
| Agentless Virtual Machine (VM) vulnerability scanning |GA|GA|GA|
| Agentless VM secrets scanning |GA|GA|GA|
| Attack path analysis |GA|GA|GA|
| Risk prioritization |GA|GA|GA|
| Security Explorer |GA|GA|GA|
| Code-to-cloud mapping for containers |GA|NA|GA|
| Code-to-cloud mapping for IaC |GA|NA|GA|
| PR annotations |GA|NA|GA|
| Internet exposure analysis |GA|GA|GA|
| External attack surface management |GA|NA|GA|
| Cloud Infrastructure Entitlement Management (CIEM) |GA|NA|GA|
| Regulatory compliance |GA|GA|GA|
| ServiceNow Integration |GA|NA|GA|
| Critical assets protection |GA|GA|GA|
| Governance |GA|GA|GA|
| Sensitive data scanning (DSPM) |GA|GA|GA|
| Agentless scanning for Kubernetes |GA|GA|GA|
| Custom Recommendations (Preview) |Public Preview|NA|GA|
| Agentless containers vulnerability assessment |GA|GA|GA|
| API security posture management (Preview) |Public Preview|NA|GA|
|**DEFENDER FOR CLOUD PLANS** | | ||
|[Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md)| GA | GA| GA|
|[Defender for AI Services](ai-threat-protection.md) | GA | NA | GA |
|[Defender for APIs](defender-for-apis-introduction.md) | GA | NA | GA|
|[Defender for App Service](defender-for-app-service-introduction.md) | GA | NA | GA |
|[Defender for Containers](defender-for-containers-introduction.md)<br/>[Review detailed feature support](support-matrix-defender-for-containers.md) | GA | GA | GA|
|[DevOps Security](defender-for-devops-introduction.md) | GA | NA | GA|
|[Defender for Domain Name System (DNS)](defender-for-dns-introduction.md) | GA | GA | GA|
|[Defender for Key Vault](defender-for-key-vault-introduction.md) | GA | NA | GA|
|[Defender for Resource Manager](defender-for-resource-manager-introduction.md) | GA | GA | GA|
|[Defender for Servers](plan-defender-for-servers.md) Plan 1 (P1) and Plan 2 (P2) <br><br/>[Review detailed feature support](support-matrix-defender-for-servers.md) | GA | GA | NA|
|[Defender for Storage](defender-for-storage-introduction.md) | GA | GA | GA|
| **DEFENDER FOR STORAGE FEATURES** | | | |
| Activity monitoring (security alerts) | GA | GA| GA|
| [Malware scanning](defender-for-storage-malware-scan.md) | GA<sup>[1](#footnote1)</sup> | GA | GA |
| [Sensitive data threat detection (Sensitive Data Discovery)](defender-for-storage-data-sensitivity.md) | GA<sup>[1](#footnote1)</sup> | NA | GA |
| **DEFENDER FOR DATABASES FEATURES** | | | |
| [Defender for Azure SQL database servers](defender-for-sql-introduction.md) | GA | GA | GA|
| [Defender for SQL servers on machines](defender-for-sql-servers-introduction.md) | GA | GA | GA |
| [Defender for SQL Servers on Machines](defender-for-sql-introduction.md) | GA | GA | GA |
| [Vulnerability assessment](sql-azure-vulnerability-assessment-overview.md) Express and Classic configurations | GA | GA | GA |
| [Advanced threat protection](/azure/azure-sql/database/threat-detection-overview?view=azuresql&preserve-view=true) | GA | GA | GA |
| [Defender for Open-Source Relational Databases](defender-for-databases-introduction.md) | GA | GA | GA |
| [Defender for Azure Cosmos DB](concept-defender-for-cosmos.md) | GA | NA | GA|
| **DEFENDER FOR SERVERS FEATURES** | | | |
| [File Integrity Monitoring](file-integrity-monitoring-overview.md) | GA | GA<sup>[2](#footnote2)</sup> |  GA |

<sup><a name="footnote1"></a>1</sup>: Azure DNS Zone isn't supported for malware scanning and sensitive data threat detection.
<sup><a name="footnote2"></a>2</sup>: GovCon Cloud Moderate (GCCM) doesn't support File Integrity Monitoring.

[!INCLUDE [Defender for DNS note](./includes/defender-for-dns-note.md)]

## Next steps

Start reading about [Defender for Cloud features](defender-for-cloud-introduction.md).
