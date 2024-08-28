---
title: Asset inventory in Defender for Cloud
description: Learn about the asset inventory in Microsoft Defender for Cloud
ms.date: 06/14/2023
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
---
# Review the asset inventory

The Inventory page in Microsoft Defender for Cloud summarizes the resources that are connected to Defender for Cloud.

Defender for Cloud periodically analyzes the security state of resources connected to it. When resources have active [security recommendations](security-policy-concept.md) or [security alerts](alerts-overview.md) associated with it, they appear in the inventory.

The Inventory page provides information about:

- **Connected resources**. Quickly see which resources are connected to Defender for Cloud.
- **Overall security state**: Get a clear summary about the security state of connected Azure, AWS, and GCP resources, including the total resources connected to Defender for Cloud, resources by environment, and a count of unhealthy resources.
- **Recommendations, alerts**: Drill down into the state of specific resources to see active security recommendations and security alerts for a resource.
- **Risk prioritization**: Risk-based recommendations assigns risk levels to recommendations, based on factors such as data sensitivity, internet exposure, lateral movement potential, and potential attack paths.
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
    - The **Recommendations** tab show any active security recommendations, in order of risk. You can drill down into each recommendation for more details and remediation options.
    - The **Alerts** tab shows any relevant security alerts. 

## Review software inventory

To see the software inventory, one of these paid plans must be enabled.
- [Defender CSPM plan](concept-cloud-security-posture-management.md) with [agentless machine scanning](concept-agentless-data-collection.md) enabled.
- [Defender for Server Plan 1 or Plan 2](defender-for-servers-introduction.md) with [Microsoft Defender for Endpoint integrated](integration-defender-for-endpoint.md), or Defender for Servers Plan 2 using agentless machine scanning.


1. Select **Installed application**
1. In **Value**, select the apps to filter on.

    :::image type="content" source="media/asset-inventory/software-inventory-filters.gif" alt-text="If you've enabled the threat and vulnerability solution, Defender for Cloud's asset inventory offers a filter to select resources by their installed software.":::

1. Resources connected to Defender for Cloud and running those apps are displayed. Blank options show machines where Defender for Servers/Defender for Endpoint isn't available.

## Filter the inventory

Refine visibility into the inventory with filtered values to focus on specific resources.

1. Decide which filter you want to use. 
1. If the filter doesn't appear on the page, select **Add filter**.

    - Select **Subscription** to retrieve the assets in a specific Azure subscription.
    - Select **Resource type** to filter by asset type.
    - Select **Resource group** to select a specific Azure resource group.
    - Select **Environment** to filter for Azure, AWS, or GCP assets.
    - Select **AWS account** or **GCP project** to see assets in connected AWS accounts or GCP projects.
    - Select **Recommendations** to filter with a specific security recommendation.
    - Select **Contains exemptions** to find resources that contain exemptions from security recommendations. [Learn more](exempt-resource.md) about resource exemptions.
    - Select **Tags** to find resources by assigned asset tags. Select from a list of tags. 
    - Select **Security findings** to find vulnerability findings. You can specify an operator and a free text value from the ID, security check, or CVE name of a finding to filter resources.


## Query in Resource Graph Explorer

1. Select **Open query** to open **Azure Resource Graph Explorer**.
1. In the main query pane, review the currently selected filter options in query form.

    - To create a manual query, select **New query**.
    - To open an existing query, select **Open a query**. 
    - To run the query that appears in the main query pane, select **Run query**.
    - In **Get started** tab, you can open any of the example queries. These example queries are designed to help you with some common tasks, including:
        - Count resources such as resources in your subscriptions, key vault resources, resources with IP addresses configured.
        - List resources sorted by name, show VMs by name, list Azure resources with public IP addresses, specific tag values, and more.

## Query the software inventory

In addition to the predefined filters, you can explore the software inventory data from  Resource Graph Explorer.

1. Select **Azure Resource Graph Explorer**.

    :::image type="content" source="./media/multi-factor-authentication-enforcement/opening-resource-graph-explorer.png" alt-text="Launching Azure Resource Graph Explorer** recommendation page" :::

1. Select the following subscription scope: securityresources/softwareinventories

1. Use one of the following query examples, or customize/write your own. 
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
