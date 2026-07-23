---
title: Required ABAP authorizations for the Microsoft Sentinel solution for SAP applications
description: Understand the ABAP authorizations required if you want to manually define roles based on the SAP logs you want to ingest to Microsoft Sentinel and the activities you want to run.
ms.author: monaberdugo
author: mberdugo
ms.topic: how-to
ms.date: 06/12/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
#Customer intent: As an SAP BASIS team member, I want to manually configure SAP authorizations based on the specific log files that I want to ingest to Microsoft Sentinel.

---

# Required ABAP authorizations

This article lists the ABAP authorizations required to ensure that the SAP user account used by Microsoft Sentinel's SAP data connector can correctly retrieve logs from the SAP systems.

The following tables group the required authorizations by purpose. You only need the authorizations that are listed for the kinds of logs you want to bring into Microsoft Sentinel.

- To create a role with all the required authorizations, load the role authorizations from the [**/MSFTSEN/SENTINEL_RESPONDER**](https://aka.ms/SAP_Sentinel_Responder_Role) file.
- If needed, you can [remove the user role and optional CRs](stop-collection.md#remove-the-user-role-and-any-optional-cr-installed-on-your-abap-system).

<a name="abap-application-log"></a>
## ABAP application log

The following table lists the authorization objects required for the ABAP application log.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_RFC | RFC_NAME | BAPI_XBP_APPL_LOG_CONTENT_GET |
| S_RFC | RFC_NAME | BAPI_XMI_LOGOFF |
| S_RFC | RFC_NAME | BAPI_XMI_LOGON |
| S_RFC | RFC_NAME | BAPI_XMI_SET_AUDITLEVEL |
| S_TABU_NAM | TABLE | BALHDR |
| S_XMI_PROD | EXTCOMPANY | Microsoft |
| S_XMI_PROD | EXTPRODUCT | Azure Sentinel |
| S_XMI_PROD | INTERFACE | XBP |
| S_APPL_LOG | ALG_OBJECT | * |
| S_APPL_LOG | ALG_SUBOBJ | * |
| S_APPL_LOG | ACTVT | Display |

<a name="abap-change-documents-log"></a>
## ABAP change documents log

The following table lists the required authorizations for the ABAP change documents log.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_TABU_NAM | TABLE | CDHDR |
| S_TABU_NAM | TABLE | CDPOS |

<a name="abap-cr-log"></a>
## ABAP CR log

Use the following authorization objects for the ABAP CR log.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_RFC | RFC_NAME | CTS_API_READ_CHANGE_REQUEST |
| S_TABU_NAM | TABLE | E070 |
| S_TRANSPRT | TTYPE | * |
| S_TRANSPRT | ACTVT | Display |

<a name="abap-db-table-data-log"></a>
## ABAP DB table data log

The following table lists the authorization objects required for the ABAP DB table data log.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_TABU_NAM | TABLE | DBTABLOG |
| S_TABU_NAM | TABLE | SACF_ALERT |
| S_TABU_NAM | TABLE | SOUD |
| S_TABU_NAM | TABLE | USR41 |
| S_TABU_NAM | TABLE | TMSQAFILTER |

<a name="abap-job-log"></a>
## ABAP job log

The following table shows the ABAP job log.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_RFC | RFC_NAME | BAPI_XBP_JOB_JOBLOG_READ |
| S_RFC | RFC_NAME | BAPI_XMI_LOGOFF |
| S_RFC | RFC_NAME | BAPI_XMI_LOGON |
| S_RFC | RFC_NAME | BAPI_XMI_SET_AUDITLEVEL |
| S_TABU_NAM | TABLE | TBTCO |
| S_XMI_PROD | EXTCOMPANY | Microsoft |
| S_XMI_PROD | EXTPRODUCT | Azure Sentinel |
| S_XMI_PROD | INTERFACE | XBP |

<a name="abap-security-audit-log"></a>
## ABAP security audit log

The following table lists the authorization objects needed for the ABAP security audit log.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_RFC | RFC_NAME | BAPI_USER_GET_DETAIL |
| S_RFC | RFC_NAME | BAPI_XMI_LOGOFF |
| S_RFC | RFC_NAME | BAPI_XMI_LOGON |
| S_RFC | RFC_NAME | BAPI_XMI_SET_AUDITLEVEL |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MTE_GETMLHIS |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MTE_GETTREE |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MTE_GETTIDBYNAME |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MS_GETLIST |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MON_GETLIST |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MON_GETTREE |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MTE_GETPERFCURVAL |
| S_RFC | RFC_NAME | BAPI_SYSTEM_MT_GETALERTDATA |
| S_RFC | RFC_NAME | BAPI_SYSTEM_ALERT_ACKNOWLEDGE |
| S_ADMI_FCD | S_ADMI_FCD | AUDD (Basis audit display auth.) |
| S_SAL | SAL_ACTVT | SHOW_LOG (Evaluate the file-based log) |
| S_USER_GRP | CLASS | SUPER |
| S_USER_GRP | ACTVT | Display |
| S_USER_GRP | CLASS | SUPER |
| S_USER_GRP | ACTVT | Lock |
| S_XMI_PROD | EXTCOMPANY | Microsoft |
| S_XMI_PROD | EXTPRODUCT | Azure Sentinel |
| S_XMI_PROD | INTERFACE | XAL |

<a name="abap-spool-logs"></a>
## ABAP spool logs

Use the following authorizations for ABAP spool logs.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_TABU_NAM | TABLE | TSP01 |
| S_ADMI_FCD | S_ADMI_FCD | SPOS (Use of Transaction SP01 (all systems)) |

<a name="abap-workflow-log"></a>
## ABAP workflow log

The following table lists the required authorizations for the ABAP workflow log.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_TABU_NAM | TABLE | SWWLOGHIST |
| S_TABU_NAM | TABLE | SWWWIHEAD |

<a name="all-logs"></a>
## All logs

The following authorization objects are required for all log types.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_RFC | RFC_TYPE | Function Module |
| S_RFC | RFC_NAME | /OSP/SYSTEM_TIMEZONE |
| S_RFC | RFC_NAME | DDIF_FIELDINFO_GET |
| S_RFC | RFC_NAME | RFCPING |
| S_RFC | RFC_NAME | RFC_GET_FUNCTION_INTERFACE |
| S_RFC | RFC_NAME | RFC_READ_TABLE |
| S_RFC | RFC_NAME | RFC_SYSTEM_INFO |
| S_RFC | RFC_NAME | SUSR_USER_AUTH_FOR_OBJ_GET |
| S_RFC | RFC_NAME | TH_SERVER_LIST |
| S_RFC | ACTVT | Execute |
| S_TCODE | TCD | SM51 |
| S_TABU_NAM | ACTVT | Display |
| S_TABU_NAM | TABLE | T000 |

<a name="configuration-history"></a>
## Configuration history

The following table lists the authorization objects required for configuration history.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_TABU_NAM | TABLE | PAHI |

<a name="optional-logs-if-the-microsoft-sentinel-solution-cr-is-implemented"></a>
## optional logs when the Microsoft Sentinel solution CR is implemented

If the Microsoft Sentinel solution CR is implemented, use the following additional authorization.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_RFC | RFC_NAME | /MSFTSEN/* |

<a name="snc-data"></a>
## SNC data

The following table lists the authorization objects required for SNC data.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_TABU_NAM | TABLE | SNCSYSACL |
| S_TABU_NAM | TABLE | USRACL |

<a name="user-data"></a>
## User data

The following table shows the authorization objects required for user data.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_TABU_NAM | TABLE | ADCP |
| S_TABU_NAM | TABLE | ADR6 |
| S_TABU_NAM | TABLE | AGR_1251 |
| S_TABU_NAM | TABLE | AGR_AGRS |
| S_TABU_NAM | TABLE | AGR_DEFINE |
| S_TABU_NAM | TABLE | AGR_FLAGS |
| S_TABU_NAM | TABLE | AGR_PROF |
| S_TABU_NAM | TABLE | AGR_TCODES |
| S_TABU_NAM | TABLE | AGR_USERS |
| S_TABU_NAM | TABLE | DEVACCESS |
| S_TABU_NAM | TABLE | USER_ADDR |
| S_TABU_NAM | TABLE | USGRP_USER |
| S_TABU_NAM | TABLE | USR01 |
| S_TABU_NAM | TABLE | USR02 |
| S_TABU_NAM | TABLE | USR05 |
| S_TABU_NAM | TABLE | USR21 |
| S_TABU_NAM | TABLE | USRSTAMP |
| S_TABU_NAM | TABLE | UST04 |

## Related content

[Configure your SAP system for the Microsoft Sentinel solution](preparing-sap.md).
