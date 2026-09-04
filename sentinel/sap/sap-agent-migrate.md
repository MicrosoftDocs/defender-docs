---
title: Migrate to the Microsoft Sentinel agentless SAP data connector
description: Migrate from the containerized SAP agent to the agentless data connector before retirement so SAP logs continue flowing to Microsoft Sentinel.
ms.author: monaberdugo
author: mberdugo
ms.topic: how-to
ms.date: 08/24/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1015
# customer intent: As a security operations team member, I want to migrate from the containerized SAP agent to the agentless data connector so that SAP log collection continues after the containerized agent is retired.
---

# Migrate to the Microsoft Sentinel agentless SAP data connector

Follow this guide to migrate from the containerized SAP agent to the agentless data connector for the Microsoft Sentinel solution for SAP applications.

Microsoft will retire and permanently disable the containerized data connector agent on September 14, 2026. After this date, the agent stops delivering SAP logs to Microsoft Sentinel. Customers who use the agentless data connector aren't affected.

## Why move to the agentless data connector?

The agentless connector offers these advantages:

- Simplified deployment with zero footprint on SAP NetWeaver.
- Reduced maintenance overhead without container management and standard SAP updates.
- Future-proof architecture based on SAP Integration Suite and SAP Cloud Connector.
- Improved scalability.

The migration process involves deploying the agentless connector side by side with the existing containerized agent, validating log retrieval from the agentless connector, and then decommissioning the containerized agent.

Existing analytics rules, workbooks, and playbooks for the Microsoft Sentinel solution for SAP applications remain functional with the agentless data connector. Enhancements to the [KQL functions](sap-solution-function-reference.md) support both data ingestion methods side by side. The functions use the fuzzy union operator to combine data from both sources when available.

## Migration path

Creation of new containerized agents is already disabled. Use the agentless data connector when you onboard new SAP systems, and migrate existing containerized agents before September 14, 2026.

1. **Assess**: Review your existing containerized SAP agent deployment to identify monitored SAP systems, log types collected, and any custom configurations.
1. **Review**: Compare the configuration options and capabilities of the containerized agent and the agentless data connector.
1. **Deploy**: Set up the agentless data connector by following [Deploy the Microsoft Sentinel solution for SAP applications](deploy-sap-security-content.md).
1. **Validate**: Confirm that all required SAP tables and log types are being collected correctly from your SAP systems by the agentless data connector. Use KQL queries to verify log ingestion.
    ```kql
    let startTime = ago(1h);
    let endTime = now();
    ABAPAuditLog
    | where TimeGenerated between (startTime .. endTime)
    | summarize Count = count() by SourceSystem, bin(TimeGenerated, 5m)
    | order by TimeGenerated desc
    ```
1. **Monitor**: Run both the containerized agent and the agentless data connector in parallel for a defined period to ensure stable and complete log collection. Confirm that analytics rules, workbooks, hunting queries, and playbooks return the expected results with logs ingested by the agentless connector. After September 14, 2026, these analytics rules and other dependent content stop returning results for affected SAP systems if the required logs aren't ingested through the agentless connector.
1. **Decommission**: After you validate the agentless data connector, decommission the containerized SAP agent by following [Stop SAP data collection](stop-collection.md).

> [!TIP]
> Follow the [agentless migration video playlist](https://www.youtube.com/playlist?list=PLmAptfqzxVEV69k9hwfI4zVOb_o6LgfDV) for latest insights for a smooth transition.

> [!IMPORTANT]
> Review the authorizations of the Sentinel user and role on your SAP systems used with the containerized agent. The agentless data connector requires less but different authorizations compared to the containerized SAP agent. Refer to the [configuration guide](/azure/sentinel/sap/preparing-sap#configure-the-microsoft-sentinel-role) for details and SAP role sample for minimum authorizations.

> [!WARNING]
> The retirement doesn't change pricing or billing meters. However, the agentless data connector uses different identification methods than the containerized data connector. Review billing exclusions for selected SAP SIDs, and contact your account representative before you migrate.

## Feature parity

The agentless data connector provides built-in feature parity with the containerized SAP agent for most important use cases regarding analytic rules and workbooks. See the [content reference](sap-solution-security-content.md) for details. 

All analytics rules and workbooks built on the underlying SAP sources mentioned on the [table reference](./sap-solution-log-reference.md#logs-collected-by-the-agentless-data-connector) remain functional without any changes.

These sources include but are not limited to the following [logs](sap-solution-security-content.md#built-in-analytics-rules):

- SAPcon - Audit Log
- SAPcon - Change Documents Log
- User and User Authorization Details

The solution scope can be extended through [extensions patterns](https://github.com/Azure-Samples/Sentinel-For-SAP-Community) available for the agentless data connector. Watchlists and Playbooks remain fully functional without any changes.

SAP HANA database or OS-level detections are out of scope for the comparison because they are covered by their own connectors in Microsoft Sentinel.

> [!NOTE]
> The cross-workspace deployment option (installing SAP data and SOC data on separate workspaces) is no longer needed with the unified workspace in the Microsoft Defender portal and has been removed from the portal experience. If you still need a split deployment, the underlying ARM APIs continue to support it - the option is only removed from the UI.

## Next steps

- [Discover the agentless migration video playlist](https://www.youtube.com/playlist?list=PLmAptfqzxVEV69k9hwfI4zVOb_o6LgfDV)

- [Learn more about Microsoft Sentinel Solution for SAP applications](solution-overview.md).

- [Learn more about Microsoft Sentinel Solution for SAP BTP](sap-btp-solution-overview.md).

- [Learn more about Microsoft Sentinel Solution for SAP partner add-ons](solution-partner-overview.md).
