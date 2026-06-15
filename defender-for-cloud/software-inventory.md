---
title: Review the software inventory in Defender for Cloud
description: Learn how to review the software inventory in Microsoft Defender for Cloud
ms.date: 06/02/2026
ms.topic: how-to
---
# Review the software inventory

The Defender for Servers plan in Microsoft Defender for Cloud provides vulnerability scanning using Microsoft Defender Vulnerability Management. Microsoft Defender for Endpoint and Defender Vulnerability Management are integrated natively into Defender for Cloud.

The software inventory feature, provided by Defender Vulnerability Management, shows a list of known software in your organization, with security information about discovered applications.

- Defender for Cloud shows the integrated software inventory on the **Inventory** page, summarizing software running on resources connected to Defender for Cloud.
- To query and retrieve inventory data at scale, use [Azure Resource Graph (ARG)](/azure/governance/resource-graph/index). For deep custom insights, use [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/).

This article explains how to review the software inventory.

## Prerequisites

To see the software inventory, enable one of these paid plans.

- [Defender CSPM plan](concept-cloud-security-posture-management.md) with [agentless machine scanning](concept-agentless-data-collection.md) enabled.
- [Defender for Servers Plan 1 or Plan 2](defender-for-servers-introduction.md) with [Defender for Endpoint integration](integration-defender-for-endpoint.md) enabled, or Defender for Servers Plan 2 with agentless machine scanning enabled.

> [!NOTE]
> If software that isn't supported appears in the inventory, only limited data is available.

## Review the software inventory

1. In Defender for Cloud, select **Inventory**.
1. If prerequisites are in place, the **Installed applications** filter shows you a list of software deployed in the environment.
1. In **Value**, filter for a specific app.

    Resources connected to Defender for Cloud and running those apps are displayed. Blank options show machines where Defender for Servers/Defender for Endpoint isn't available.

## Query the software inventory

In addition to the predefined filters, you can explore the software inventory data from Azure Resource Graph Explorer.

1. Select **Azure Resource Graph Explorer**.

    :::image type="content" source="./media/multi-factor-authentication-enforcement/opening-resource-graph-explorer.png" alt-text="Screenshot showing Azure Resource Graph Explorer opened in the Azure portal." :::

1. Select the following subscription scope: securityresources/softwareinventories

1. Use one of the following query examples, customize one, or write your own.
1. Select **Run query**.

### Query examples

To generate a basic list of installed software:

```kusto
securityresources
| where type == "microsoft.security/softwareinventories"
| project id, Vendor=properties.vendor, Software=properties.softwareName, Version=properties.version
```

To filter by version numbers:

```kusto
securityresources
| where type == "microsoft.security/softwareinventories"
| project id, Vendor=properties.vendor, Software=properties.softwareName, Version=tostring(properties.version)
| where Software=="windows_server_2019" and parse_version(Version)<=parse_version("10.0.17763.1999")
```

To find machines with a combination of software products:

```kusto
securityresources
| where type == "microsoft.security/softwareinventories"
| extend vmId = properties.azureVmId
| where properties.softwareName == "apache_http_server" or properties.softwareName == "mysql"
| summarize count() by tostring(vmId)
| where count_ > 1
```

To combine a software product with another security recommendation:

(For example, machines that have MySQL installed and exposed management ports)

```kusto
securityresources
| where type == "microsoft.security/softwareinventories"
| extend vmId = tolower(properties.azureVmId)
| where properties.softwareName == "mysql"
| join (
    securityresources
| where type == "microsoft.security/assessments"
| where properties.displayName == "Management ports should be closed on your virtual machines" and properties.status.code == "Unhealthy"
| extend vmId = tolower(properties.resourceDetails.Id)
) on vmId
```

## Export the inventory

1. To save filtered inventory in CSV form, select **Download CSV report**.
1. To save a query in Resource Graph Explorer, select **Open a query**. When you're ready to save a query, select **Save as** and in **Save query**, specify a query name and description, and whether the query is private or shared.

## Next step

> [!div class="nextstepaction"]
> [Query software bill of materials data in Microsoft Defender for Cloud](query-software-bill-of-materials.md)
