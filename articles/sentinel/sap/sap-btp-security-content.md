---
title: Microsoft Sentinel Solution for SAP BTP - security content reference
description: Learn about the built-in security content provided by the  Microsoft Sentinel Solution for SAP BTP.
author: batamig
ms.author: bagol
ms.topic: reference
ms.date: 07/17/2024
ms.custom: sfi-image-nochange


#Customer intent: As a security analyst, I want to use the Microsoft Sentinel solution for SAP BTP so that I can monitor, detect, and respond to security threats within my SAP BTP environment.

---

# Microsoft Sentinel Solution for SAP BTP: security content reference

This article details the security content available for the Microsoft Sentinel Solution for SAP BTP.

Available security content currently includes a built-in workbook and analytics rules. You can also add SAP-related [watchlists](../watchlists.md) to use in your search, detection rules, threat hunting, and response playbooks.

[Learn more about the solution](sap-btp-solution-overview.md).

## SAP BTP workbook

The BTP Activity Workbook provides a dashboard overview of BTP activity. 

:::image type="content" source="./media/sap-btp-security-content/sap-btp-workbook-btp-overview.png" alt-text="Screenshot of the Overview tab of the SAP BTP workbook." lightbox="./media/sap-btp-security-content/sap-btp-workbook-btp-overview.png":::

The **Overview** tab shows: 

- An overview of BTP subaccounts, helping analysts identify the most active accounts and the type of ingested data. 
- Subaccount sign-in activity, helping analysts identify spikes and trends that might be associated with sign-in failures in SAP Business Application Studio (BAS). 
- Timeline of BTP activity and number of BTP security alerts, helping analysts search for any correlation between the two.
 
The **Identity Management** tab shows a grid of identity management events, such as user and security role changes, in a human-readable format. The search bar lets you quickly find specific changes.

:::image type="content" source="./media/sap-btp-security-content/sap-btp-workbook-identity-management.png" alt-text="Screenshot of the Identity Management tab of the SAP BTP workbook." lightbox="./media/sap-btp-security-content/sap-btp-workbook-identity-management.png":::

For more information, see [Tutorial: Visualize and monitor your data](../monitor-your-data.md) and [Deploy Microsoft Sentinel Solution for SAP BTP](deploy-sap-btp-solution.md).

## Built-in analytics rules

These analytics rules detect suspicious activity using SAP BTP audit logs. The rules are organized by SAP service or product area. For more information about security events logged by SAP BTP services, see [Security Events Logged by Cloud Foundry Services](https://help.sap.com/docs/btp/sap-business-technology-platform/security-events-logged-by-cf-services?version=Cloud).

**Data sources**: SAPBTPAuditLog_CL

### SAP Cloud Integration

| Rule name | Description | Source action | Tactics |
| --------- | --------- | --------- | --------- |
| **BTP - Cloud Integration access policy tampering** | Identifies changes to access policies controlling authorization for integration artifacts in SAP Cloud Integration. | Create, change, or delete access policies or artifact references in SAP Cloud Integration. | Defense Evasion, Privilege Escalation |
| **BTP - Cloud Integration artifact deployment** | Identifies deployment and undeployment of integration artifacts (flows) in SAP Cloud Integration. | Deploy or undeploy integration artifacts in SAP Cloud Integration. | Execution, Persistence |
| **BTP - Cloud Integration JDBC data source changes** | Identifies deployment/undeployment of JDBC data source configurations containing database credentials in SAP Cloud Integration. | Deploy or undeploy JDBC data sources in SAP Cloud Integration. | Credential Access, Lateral Movement |
| **BTP - Cloud Integration package import or transport** | Identifies import and transport operations for integration packages and artifacts in SAP Cloud Integration. | Import or transport integration packages/artifacts in SAP Cloud Integration. | Initial Access, Persistence |
| **BTP - Cloud Integration tampering with security material** | Identifies operations on security material (credentials, certificates, keys) in SAP Cloud Integration. | Create, update, or delete credentials, X.509 certificates, or PGP keys in SAP Cloud Integration. | Credential Access, Defense Evasion |

### SAP Cloud Identity Service

| Rule name | Description | Source action | Tactics |
| --------- | --------- | --------- | --------- |
| **BTP - Cloud Identity Service application configuration monitor** | Identifies CRUD operations on application (SAML/OIDC) configurations in SAP Cloud Identity Service. | Create, update, or delete SSO domain/service provider configurations in SAP Cloud Identity Service. | Credential Access, Privilege Escalation |
| **BTP - Mass user deletion in Cloud Identity Service** | Identifies mass user deletion activity in SAP Cloud Identity Service where the number of deleted users exceeds a predefined threshold.<br>Default threshold: 10 | Delete count of user accounts over the defined threshold in SAP Cloud Identity Service. | Impact |
| **BTP - User added to privileged Administrators list** | Identifies users granted privileged administrator permissions (ManageIdP, ManageSP, ManageUsers, etc.) in SAP Cloud Identity Service. | Grant privileged administrator permissions to a user in SAP Cloud Identity Service. | Lateral Movement, Privilege Escalation |

### SAP Business Application Studio (BAS)

| Rule name | Description | Source action | Tactics |
| --------- | --------- | --------- | --------- |
| **BTP - Failed access attempts across multiple BAS subaccounts** | Identifies failed SAP Business Application Studio (BAS) access attempts over a predefined number of subaccounts.<br>Default threshold: 3 | Run failed sign-in attempts to BAS over the defined threshold number of subaccounts. | Discovery, Reconnaissance |
| **BTP - Malware detected in BAS dev space** | Identifies instances of malware detected by the SAP internal malware agent within BAS developer spaces. | Copy or create a malware file in a BAS developer space. | Execution, Persistence, Resource Development |

### SAP Build Work Zone

| Rule name | Description | Source action | Tactics |
| --------- | --------- | --------- | --------- |
| **BTP - Build Work Zone unauthorized access and role tampering** | Identifies unauthorized OData access attempts and mass role/user deletions in SAP Build Work Zone Standard Edition. | Detect unauthorized OData service access or mass deletion of roles/users in SAP Build Work Zone. | Initial Access, Persistence, Defense Evasion |

### SAP BTP platform and subaccounts

| Rule name | Description | Source action | Tactics |
| --------- | --------- | --------- | --------- |
| **BTP - Audit log service unavailable** | Identifies SAP BTP subaccounts with no audit logs for an unusual period, indicating potential service tampering or availability issues. | Subaccount fails to report audit logs exceeding configured threshold (default: 60 minutes). | Defense Evasion |
| **BTP - Mass user deletion in a subaccount** | Identifies user account deletion activity where the number of deleted users exceeds a predefined threshold.<br>Default threshold: 10 | Delete count of user accounts over the defined threshold. | Impact |
| **BTP - Trust and authorization Identity Provider monitor** | Identifies create, read, update, and delete (CRUD) operations on Identity Provider settings within a subaccount. | Change, read, update, or delete any of the identity provider settings within a subaccount. | Credential Access, Privilege Escalation |
| **BTP - User added to sensitive privileged role collection** | Identifies identity management actions where a user is added to a set of monitored privileged role collections. | Assign one of the following role collections to a user: <br>- `Subaccount Service Administrator`<br>- `Subaccount Administrator`<br>- `Connectivity and Destination Administrator`<br>- `Destination Administrator`<br>- `Cloud Connector Administrator` | Lateral Movement, Privilege Escalation |

## Next steps

In this article, you learned about the security content provided with the Microsoft Sentinel Solution for SAP BTP.

- [Deploy Microsoft Sentinel solution for SAP BTP](deploy-sap-btp-solution.md)
- [Microsoft Sentinel Solution for SAP BTP overview](sap-btp-solution-overview.md)
