---
title: Log and table reference for the Microsoft Sentinel solution for SAP applications
description: Learn about the SAP logs, tables, and functions available from the Microsoft Sentinel solution for SAP applications.
ms.author: monaberdugo
author: mberdugo
ms.topic: reference
ms.custom: mvc
ms.date: 08/04/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security

#Customer intent: As a security analyst, I want to understand the functions, logs, and tables available in the Microsoft Sentinel solution for SAP applications so that I can effectively monitor and analyze SAP system security and performance.

ai-usage: ai-assisted
---

# Log and table reference for the Microsoft Sentinel solution for SAP applications

This article describes the logs and tables available as part of the Microsoft Sentinel solution for SAP applications and its data connector.


Content in this article is intended for your **SAP BASIS** teams.

## Use functions in your queries instead of underlying logs or tables

We *strongly recommend* that you use available functions as the subjects of their analysis whenever possible, instead of the underlying logs or tables.

[Functions](/azure/azure-monitor/logs/functions) provided with the Microsoft Sentinel solution for SAP applications are intended to serve as the principal user interface to the data. They form the basis for all the built-in analytics rules and workbooks available to you out of the box. Using functions allows for changes to be made to the data infrastructure beneath the functions, without breaking user-created content.

For more information, see [Microsoft Sentinel solution for SAP applications - functions reference](sap-solution-function-reference.md) and [Functions in Azure Monitor log queries](/azure/azure-monitor/logs/functions).

## Log coverage

The Microsoft Sentinel solution for SAP applications collects logs from the application, OS, and data layers, providing comprehensive protection for your SAP system:

- **Application layer**: Microsoft Sentinel monitors activities within the ABAP layer, which is the primary application layer in SAP systems, responsible for executing business logic and processing transactions. For example, Microsoft Sentinel collects logs that include user actions like sign-ins, password changes, and access to reports or files.

    In addition to security monitoring, logs collected at the application layer can also be used for compliance and auditing purposes.

- **OS layer**: Microsoft Sentinel gathers logs from the operating system to provide insights into OS-level activities, such as from the ABAP server and the virtual machines on which the SAP applications are running.

    Use the Microsoft Sentinel solution for SAP applications together with security content and data connectors for your other services for comprehensive and central monitoring, correlating information across all your systems and enhancing your overall security posture.

- **Database layer**: Ingest database logs into Microsoft Sentinel to monitor database activities, such as database administration activities and changes to table data. The Microsoft Sentinel solution for SAP applications is database-agnostic.


## Logs collected by the agentless data connector

The following built-in Log Analytics tables are collected by the agentless data connector:

- <a name="abap-security-audit-log"></a>[ABAPAuditLog](/azure/azure-monitor/reference/tables/abapauditlog)
- [ABAPAuthorizationDetails](/azure/azure-monitor/reference/tables/abapauthorizationdetails)
- [ABAPChangeDocsLog](/azure/azure-monitor/reference/tables/abapchangedocslog)
- [ABAPUserDetails](/azure/azure-monitor/reference/tables/abapuserdetails)




## Related content

For more information, see:

- [Deploy the Microsoft Sentinel solution for SAP applications](deployment-overview.md)
- [Microsoft Sentinel solution for SAP applications: built-in security content](sap-solution-security-content.md)
- [Troubleshooting your Microsoft Sentinel solution for SAP applications deployment](sap-deploy-troubleshoot.md)
