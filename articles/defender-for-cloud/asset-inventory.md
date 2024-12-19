---
title: Asset inventory in Defender for Cloud
description: Learn about the asset inventory in Microsoft Defender for Cloud
ms.date: 06/14/2023
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
---
# Review the asset inventory

The asset inventory page of Microsoft Defender for Cloud shows the [security posture](concept-cloud-security-posture-management.md) of the resources you connected to Defender for Cloud. Defender for Cloud periodically analyzes the security state of resources connected to your subscriptions to identify potential security issues and provides you with active recommendations. Active recommendations are recommendations that can be resolved to improve your security posture.

Defender for Cloud periodically analyzes the security state of resources connected to it. When resources have active [security recommendations](security-policy-concept.md) or [security alerts](alerts-overview.md) associated with it, they appear in the inventory.

The Inventory page provides information about:

- **Connected resources**. Quickly see which resources are connected to Defender for Cloud.
- **Overall security state**: Get a clear summary about the security state of connected Azure, AWS, and GCP resources, including the total resources connected to Defender for Cloud, resources by environment, and a count of unhealthy resources.
- **Recommendations, alerts**: Drill down into the state of specific resources to see active security recommendations and security alerts for a resource.
- **Risk prioritization**: Risk-based recommendations assign risk levels to recommendations, based on factors such as data sensitivity, internet exposure, lateral movement potential, and potential attack paths.
- Risk prioritization is available when the Defender CSPM plan is enabled.
- **Software**. You can review resources by installed applications. To take advantage of the software inventory, either the Defender Cloud Security Posture Management (CSPM) plan, or a Defender for Servers plan must be enabled.

The Inventory uses [Azure Resource Graph (ARG)](/azure/governance/resource-graph/index) to query and retrieve data at scale. For deep custom insights, you can use [KQL](/azure/data-explorer/kusto/query/) to query the inventory.

## Review the inventory

1. In Defender for Cloud in the Azure portal, select **Inventory**. By default the resources are sorted by the number of active security recommendations.
1. Review the available settings:
    - In **Search**, you can use a free text search to find resources.
    - **Total resources** displays the number of resources connected to Defender for Cloud.
    - **Unhealthy resources** displays the number of resources with active security recommendations and alerts.
    - **Resource count by environment**: The number of Azure, AWS, and GCP resources.
1. Select a resource to drill down for details.
1. On the **Resource Health** page for the resource, review information about the resource.
    - The **Recommendations** tab shows any active security recommendations, in order of risk. You can drill down into each recommendation for more details and remediation options.
    - The **Alerts** tab shows any relevant security alerts. 

## Review software inventory

:::image type="content" source="media/asset-inventory/asset-inventory-features.png" alt-text="Screenshot that shows the main features of the asset inventory page in Microsoft Defender for Cloud." lightbox="media/asset-inventory/asset-inventory-features.png":::


1. Select **Installed application**
1. In **Value**, select the apps to filter on.

- **Total resources**: The total number of resources connected to Defender for Cloud.
- **Unhealthy resources**: Resources with active security recommendations that you can implement. [Learn more about implementing security recommendations](review-security-recommendations.md).
- **Resource count by environment**: The number of resources in each environment.
- **Unregistered subscriptions**: Any subscription in the selected scope that hasn't yet been connected to Microsoft Defender for Cloud.

1. Resources connected to Defender for Cloud and running those apps are displayed. Blank options show machines where Defender for Servers/Defender for Endpoint isn't available.

## Filter the inventory

As soon as you apply filters, the summary values are updated to relate to the query results.

### 3 - Export tools

**Download CSV report** - Export the results of your selected filter options to a CSV file.

**Open query** - Export the query itself to [Azure Resource Graph (ARG)](/azure/governance/resource-graph/) to further refine, save, or modify the Kusto Query Language (KQL) query.


## How does asset inventory work?

In addition to the predefined filters, you can explore the software inventory data from  Resource Graph Explorer.

ARG is designed to provide efficient resource exploration with the ability to query at scale.

You can use [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/) in the asset inventory to quickly produce deep insights by cross-referencing Defender for Cloud data with other resource properties.

## How to use asset inventory

1. From Defender for Cloud's sidebar, select **Inventory**.

1. Use the **Filter by name** box to display a specific resource, or use the filters to focus on specific resources.

    By default, the resources are sorted by the number of active security recommendations.

    > [!IMPORTANT]
    > The options in each filter are specific to the resources in the currently selected subscriptions **and** your selections in the other filters.
    >
    > For example, if you've selected only one subscription, and the subscription has no resources with outstanding security recommendations to remediate (0 unhealthy resources), the **Recommendations** filter will have no options.

1. To use the **Security findings** filter, enter free text from the ID, security check, or CVE name of a vulnerability finding to filter to the affected resources:

    :::image type="content" source="media/asset-inventory/security-findings-has-hardware.png" alt-text="Screenshot showing how to set the security findings filter." lightbox="media/asset-inventory/security-findings-has-hardware.png":::

    > [!TIP]
    > The **Security findings** and **Tags** filters only accept a single value. To filter by more than one, use **Add filters**.

1. To view the current selected filter options as a query in Resource Graph Explorer, select **Open query**.

    ![Inventory query in ARG.](./media/asset-inventory/inventory-query-in-resource-graph-explorer.png)

1. If you defined some filters and left the page open, Defender for Cloud doesn't update the results automatically. Any changes to resources won't impact the displayed results unless you manually reload the page or select **Refresh**.

## Access a software inventory

To access the software inventory, you need one of the following plans:

- [Agentless machine scanning](concept-agentless-data-collection.md) from [Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md).
- [Agentless machine scanning](concept-agentless-data-collection.md) from [Defender for Servers P2](plan-defender-for-servers-select-plan.md).
- [Microsoft Defender for Endpoint integration](integration-defender-for-endpoint.md) from [Defender for Servers](defender-for-servers-introduction.md).

### Examples using Azure Resource Graph Explorer to access and explore software inventory data

1. Open **Azure Resource Graph Explorer**.

    :::image type="content" source="./media/multi-factor-authentication-enforcement/opening-resource-graph-explorer.png" alt-text="Screenshot shows how to launch Azure Resource Graph Explorer** recommendation page." :::

1. Select the following subscription scope: **securityresources/softwareinventories**

3. Enter any of the following queries (or customize them or write your own!) and select **Run query**.

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
| project id, Vendor=properties.vendor, Software=properties.softwareName, Version=tostring(properties.    version)
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

(In this example – machines having MySQL installed and exposed management ports)

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
1. To save a query in Resource Graph Explorer, select **Open a query**. When you're ready to save a query, select **Save as** and in **Save query**, specific a query name and description, and whether the query is private or shared.

    ![Inventory query in ARG.](./media/asset-inventory/inventory-query-in-resource-graph-explorer.png)

Changes made to resources won't impact the displayed results unless you manually reload the page or select **Refresh**.
