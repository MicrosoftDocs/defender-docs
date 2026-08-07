---
title: Required ABAP authorizations for the Microsoft Sentinel solution for SAP applications
description: Understand the ABAP authorizations required for the SAP user account used by the Microsoft Sentinel agentless data connector.
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

This article lists the ABAP authorizations required for the SAP user account used by the Microsoft Sentinel agentless data connector.

To create a role with the required authorizations, load the authorizations from the [**MSFTSEN_SENTINEL_READER**](https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Solutions/SAP/Sample%20Authorizations%20Role%20File/MSFTSEN_SENTINEL_READER.SAP) file.

The following table lists the authorizations in the reader role. If you manually define a role, include all the listed authorizations.

## Agentless data collection

The following authorization objects are required for agentless data collection.

| Authorization object | Field | Value |
| -------------------- | ----- | ----- |
| S_ADMI_FCD | S_ADMI_FCD | AUDD |
| S_RFC | ACTVT | Execute |
| S_RFC | RFC_NAME | /OSP/SYSTEM_TIMEZONE |
| S_RFC | RFC_NAME | BAPI_USER_GET_DETAIL |
| S_RFC | RFC_NAME | RFCPING |
| S_RFC | RFC_NAME | RFC_METADATA_GET |
| S_RFC | RFC_NAME | RFC_READ_TABLE |
| S_RFC | RFC_NAME | RSAU_API_GET_LOG_DATA |
| S_RFC | RFC_NAME | SIAG_ROLE_GET_AUTH |
| S_RFC | RFC_TYPE | Function group |
| S_RFC | RFC_TYPE | Function module |
| S_SAL | SAL_ACTVT | SHOW_LOG |
| S_TABU_NAM | ACTVT | Display |
| S_TABU_NAM | TABLE | AGR_1251 |
| S_TABU_NAM | TABLE | AGR_DEFINE |
| S_TABU_NAM | TABLE | AGR_USERS |
| S_TABU_NAM | TABLE | CDHDR |
| S_TABU_NAM | TABLE | CDPOS |
| S_TABU_NAM | TABLE | PAHI |
| S_TABU_NAM | TABLE | T000 |
| S_TABU_NAM | TABLE | USR02 |
| S_TABU_NAM | TABLE | USRSTAMP |
| S_TCODE | TCD | SUIM |
| S_USER_GRP | ACTVT | Display |
| S_USER_GRP | ACTVT | Lock |
| S_USER_GRP | CLASS | SUPER |
| S_USER_UID | ACTVT | Display |
| S_USER_UID | CLASS | SUPER |
| S_USER_UID | EXTUID_TYPGU | * |

## Related content

[Configure your SAP system for the Microsoft Sentinel solution](preparing-sap.md).
