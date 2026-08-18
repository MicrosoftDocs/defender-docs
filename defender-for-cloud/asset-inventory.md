---
title: Cloud asset inventory
description: Use the cloud asset inventory in Microsoft Defender for Cloud to view connected resources across Azure, AWS, and GCP, grouped by workload, criticality, coverage status, and risk signals.
ms.date: 07/03/2026
ms.topic: how-to
zone_pivot_groups: defender-portal-experience
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to use cloud asset inventory so that I can review the security posture of connected resources across my multicloud environment.
ai-usage: ai-assisted
---
# Use cloud asset inventory

The asset inventory page of Microsoft Defender for Cloud shows the [security posture](concept-cloud-security-posture-management.md) of your connected resources. It gives you one view of cloud infrastructure across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP). It groups assets by workload, criticality, and coverage status. It also combines health data, device actions, and risk signals in one place.

Defender for Cloud periodically analyzes the security state of connected resources. When resources have active [security recommendations](security-policy-concept.md) or [security alerts](alerts-overview.md), they appear in the inventory.

This article explains how to use the asset inventory page to review connected resources, filter and export inventory data, investigate security recommendations and alerts, and query software inventory using Azure Resource Graph.

::: zone pivot="azure-portal"

## Access asset inventory in the Azure portal

In the Azure portal, navigate to **Microsoft Defender for Cloud** > **Inventory**.

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
    - **Resource count by environment**: Total of Azure, AWS, and GCP resources.
1. Select a resource to drill down for details.
1. On the **Resource Health** page for the resource, review information about the resource.
    - The **Recommendations** tab shows any active security recommendations, in order of risk. You can drill down into each recommendation for more details and remediation options.
    - The **Alerts** tab shows any relevant security alerts.
    - The **Installed applications** tab shows software detected on the resource, when software inventory is available.

## Review software inventory

Use the software inventory to review installed applications across your connected resources and identify machines that run specific software.

:::image type="content" source="media/asset-inventory/asset-inventory-features.png" alt-text="Screenshot that shows the main features of the asset inventory page in Microsoft Defender for Cloud." lightbox="media/asset-inventory/asset-inventory-features.png":::

To review software inventory details:

1. Select **Installed application**.
1. In **Value**, select the apps to filter on.
    - **Total resources**: The total number of resources connected to Defender for Cloud.
    - **Unhealthy resources**: Resources with active security recommendations that you can implement. For remediation guidance, see [Review security recommendations](review-security-recommendations.md).
    - **Resource count by environment**: The number of resources in each environment.
    - **Unregistered subscriptions**: Any subscription in the selected scope that hasn't yet been connected to Microsoft Defender for Cloud.
1. Resources connected to Defender for Cloud that run those apps are displayed. Blank options show machines where Defender for Servers or Defender for Endpoint isn't available.

### Review installed applications for a resource

On the **Resource Health** page for a supported resource, select **Installed applications** to review software detected on the asset.

The **Installed applications** tab provides the following information:

| Field | Description |
|---|---|
| **Vendor** | The vendor or publisher of the software. |
| **Software name** | The name of the software product. |
| **Version** | The detected software version. |
| **First seen at** | The date and time when the software was first seen on the asset, when available for that software. |
| **Evidence** | The file paths, registry paths, or both that indicate where the software was detected, when available. |
| **Number of known vulnerabilities** | The number of known vulnerabilities associated with the detected software version. |
| **End of support status** | The support lifecycle status of the software or software version, when available. |

## Filter the inventory

As soon as you apply filters, the summary metrics (such as **Total resources**, **Unhealthy resources**, and **Resource count by environment**) update to reflect the query results.

<a name="export-tools"></a>
### Export tools for asset inventory

The Defender for Cloud **Inventory** page provides the following export options:

**Download CSV report** - Export the results of your selected filter options to a CSV file.

**Open query** - Export the query itself to [Azure Resource Graph (ARG)](/azure/governance/resource-graph/) to further refine, save, or modify the Kusto Query Language (KQL) query.

## How does asset inventory work?

In addition to the predefined filters, you can explore the software inventory data from Resource Graph Explorer.

ARG is designed to provide efficient resource exploration with the ability to query at scale.

You can use [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/) in the asset inventory to quickly produce deep insights by cross-referencing Defender for Cloud data with other resource properties.

## How to use asset inventory

To work with filters and query options in asset inventory:

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

    :::image type="content" source="media/asset-inventory/inventory-query-in-resource-graph-explorer.png" alt-text="Screenshot of Azure Resource Graph Explorer showing the generated inventory query from selected Defender for Cloud inventory filters." lightbox="media/asset-inventory/inventory-query-in-resource-graph-explorer.png":::

1. If you defined some filters and left the page open, Defender for Cloud doesn't update the results automatically. Any changes to resources won't affect the displayed results unless you manually reload the page or select **Refresh**.

## Export the inventory

To export filtered inventory data:

1. To save filtered inventory in CSV form, select **Download CSV report**.
1. To save a query in Resource Graph Explorer, select **Open a query**. When you're ready to save a query, select **Save as**. In **Save query**, specify a query name, description, and whether the query is private or shared.

    :::image type="content" source="media/asset-inventory/inventory-query-in-resource-graph-explorer.png" alt-text="Screenshot of Azure Resource Graph Explorer showing the generated inventory query from selected Defender for Cloud inventory filters." lightbox="media/asset-inventory/inventory-query-in-resource-graph-explorer.png":::

Changes made to resources won't affect the displayed results unless you manually reload the page or select **Refresh**.

## Access a software inventory

To access the software inventory, you need one of the following plans:

- [Agentless machine scanning](concept-agentless-data-collection.md) from [Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md).
- [Agentless machine scanning](concept-agentless-data-collection.md) from [Defender for Servers P2](plan-defender-for-servers-select-plan.md).
- [Microsoft Defender for Endpoint integration](integration-defender-for-endpoint.md) from [Defender for Servers](defender-for-servers-introduction.md).

### Examples using Azure Resource Graph Explorer to access and explore software inventory data

To query software inventory data in Azure Resource Graph Explorer:

1. Open **Azure Resource Graph Explorer**.

    :::image type="content" source="./media/multi-factor-authentication-enforcement/opening-resource-graph-explorer.png" alt-text="Screenshot of the Azure portal showing how to open Azure Resource Graph Explorer from search results." :::

1. Select the following subscription scope: **securityresources/softwareinventories**

1. Enter any of the following queries (or customize them or write your own!) and select **Run query**.

<a name="query-examples"></a>
### Software inventory query examples for Azure Resource Graph

Use the following Kusto Query Language (KQL) queries in Azure Resource Graph Explorer to explore Defender for Cloud software inventory data.

The following query lists all discovered software inventory records from the `securityresources` table, returning the vendor, software name, and version for each asset:

```kusto
securityresources
| where type == "microsoft.security/softwareinventories"
| project id, Vendor=properties.vendor, Software=properties.softwareName, Version=properties.version
```

Use the following query to retrieve software inventory records and filter by version number. This example finds Windows Server 2019 machines running a version at or below a specific build:

```kusto
securityresources
| where type == "microsoft.security/softwareinventories"
| project id, Vendor=properties.vendor, Software=properties.softwareName, Version=tostring(properties.    version)
| where Software=="windows_server_2019" and parse_version(Version)<=parse_version("10.0.17763.1999")
```

Use the following query to identify Azure virtual machines that have more than one specific software product installed. The query correlates software inventory entries with Azure VM identifiers and returns only machines with multiple matches:

```kusto
securityresources
| where type == "microsoft.security/softwareinventories"
| extend vmId = properties.azureVmId
| where properties.softwareName == "apache_http_server" or properties.softwareName == "mysql"
| summarize count() by tostring(vmId)
| where count_ > 1
```

Use the following query to join software inventory data with security assessments and find machines that have a specific software product installed alongside an unhealthy security recommendation. This example finds machines that have MySQL installed and exposed management ports by normalizing Azure VM IDs to lowercase for accurate joins:

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

## Next steps

- [Review security recommendations](review-security-recommendations.md)
- [Manage and respond to security alerts](manage-respond-alerts.md)
- [Continuous export](continuous-export.md) - Export security data to SIEM, SOAR, or other tools
- [Create custom security dashboards with Azure Workbooks](custom-dashboards-azure-workbooks.md)
- [Enable Defender for Cloud plans](connect-azure-subscription.md)
- [Connect AWS accounts](quickstart-onboard-aws.md)
- [Connect GCP projects](quickstart-onboard-gcp.md)

::: zone-end

::: zone pivot="defender-portal"

This article describes how to use the unified cloud asset inventory in Microsoft Defender for Cloud within the Microsoft Defender XDR portal to manage and monitor your multicloud infrastructure.

## Overview

The cloud asset inventory gives you one view of cloud infrastructure across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP). It groups assets by workload, criticality, and coverage status. It also combines health data, device actions, and risk signals in one interface.

:::image type="content" source="media/asset-inventory/cloud-infrastructure.png" alt-text="Screenshot of cloud asset inventory in the Defender portal." lightbox="media/asset-inventory/cloud-infrastructure.png":::

## Key capabilities

The unified cloud asset inventory provides the following core capabilities for managing and monitoring your multicloud infrastructure.

### Unified multicloud visibility

The cloud asset inventory helps you monitor and manage assets consistently across cloud providers.

- **Comprehensive coverage**: View assets across Azure, AWS, GCP, and other supported platforms.
- **Consistent interface**: Use one interface to manage multicloud assets.
- **Real-time synchronization**: See current asset data from connected cloud environments.
- **Cross-platform relationships**: Review dependencies across cloud providers.

### Workload-specific insights

The inventory is organized by workload types, each providing tailored visibility and data:

- **Virtual Machines**: Compute instances across cloud providers with security posture and vulnerability data
- **Data Resources**: Databases, storage accounts, and data services with compliance and exposure insights
- **Containers**: Kubernetes clusters, container instances, and container registries with security scanning results
- **AI and ML services**: Artificial intelligence (AI) and machine learning (ML) resources with governance and security context.
- **APIs**: Representational State Transfer (REST) application programming interfaces (APIs), serverless functions, and integration services with exposure analysis.
- **DevOps resources**: Continuous integration and continuous deployment (CI/CD) pipelines, repositories, and development tools with security insights.
- **Identity Resources**: Service accounts, managed identities, and access control components
- **Serverless**: Functions, logic apps, and event-driven compute resources

### Advanced filtering and scoping

Filtering and scoping features help you narrow inventory views to the assets that matter most.

- **Persistent scoping**: Use cloud scopes for consistent filtering across experiences.
- **Multi-dimensional filtering**: Filter by environment, workload, risk level, and compliance status.
- **Search capabilities**: Find assets quickly with built-in search.
- **Saved views**: Save filtered views for repeated operational tasks.

## Asset categorization and metadata

The asset inventory enriches each resource with classification and coverage metadata to help you prioritize security efforts.

### Asset criticality classification

Assets are automatically classified based on:

- **Business impact**: Determined by asset type, dependencies, and organizational importance
- **Security posture**: Based on configuration, vulnerabilities, and compliance status
- **Risk factors**: Including exposure to internet, data sensitivity, and access patterns
- **Custom classifications**: User-defined criticality rules and manual overrides

### Coverage status indicators

Each asset displays coverage information:

- **Protected**: Full Defender for Cloud protection enabled
- **Partial**: Some security features enabled, others available for upgrade
- **Unprotected**: No Defender for Cloud protection, requires onboarding
- **Excluded**: Explicitly excluded from monitoring or protection

### Health and risk signals

Integrated risk indicators provide comprehensive asset context:

- **Security alerts**: Active security incidents and threat detections
- **Vulnerabilities**: Known security weaknesses and required patches
- **Compliance status**: Regulatory and policy compliance assessment
- **Exposure metrics**: Internet accessibility, privileged access, and attack surface data

## Navigation and filtering

Use the following navigation and filtering features to find and scope cloud assets in the Defender portal.

### Accessing the cloud inventory

To open the cloud inventory in the Microsoft Defender portal:

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com)
1. Select **Assets** > **Cloud** from the main navigation
1. Use workload-specific tabs for focused views:
   - **All Assets**: Comprehensive view across all workload types
   - **VMs**: Virtual machine-specific inventory and insights
   - **Data**: Data resources including databases and storage
   - **Containers**: Container and Kubernetes resources
   - **AI**: Artificial intelligence and machine learning services
   - **API**: APIs and integration services
   - **DevOps**: Development and deployment pipeline resources
   - **Identity**: Identity and access management components
   - **Serverless**: Function and event-driven compute resources

### Using filters effectively

Use filters to narrow the inventory to the assets and risks you want to investigate.

- **Environment filtering**: Select specific cloud providers or view all environments.
- **Scope filtering**: Apply cloud scopes to match organizational boundaries.
- **Risk-based filtering**: Focus on high-risk or exposed assets.
- **Workload filtering**: Narrow results to specific cloud resource types.
- **Status filtering**: Filter by protection status, compliance state, or health indicators.

### Search and discovery

Search and discovery tools help you quickly locate relevant assets in large environments.

- **Text search**: Find assets by name, resource ID, or metadata.
- **Tag-based search**: Locate assets by cloud provider tags and labels.
- **Advanced queries**: Combine filters for precise asset discovery.
- **Export capabilities**: Export filtered results for reporting and analysis.

## Asset details and insights

Selecting an asset in the inventory reveals detailed configuration, security, and relationship information.

### Comprehensive asset information

Each asset provides detailed information including:

- **Basic metadata**: Resource names, IDs, locations, and creation times.
- **Configuration details**: Current settings, policies, and applied configurations.
- **Security posture**: Compliance status, vulnerability assessments, and security recommendations.
- **Risk assessment**: Exposure analysis, threat intelligence, and risk scores.
- **Relationships**: Dependencies, connections, and related resources.

### Security recommendations integration

Assets link directly to relevant security recommendations:

- **Configuration improvements**: Fix misconfigurations and improve hardening.
- **Vulnerability remediation**: Prioritize patching and security updates.
- **Access control**: Improve identity and permissions settings.
- **Network security**: Improve firewall rules, segmentation, and exposure controls.

### Incident response workflows

The inventory supports security operations through:

- **Alert correlation**: Link alerts to specific assets for faster investigation.
- **Response actions**: Open remediation workflows directly from asset context.
- **Forensics support**: Use detailed asset context during incident analysis.
- **Automation integration**: Use API access for orchestration and automated response.

## Integration with Exposure Management

### Attack path visualization

Assets in the inventory integrate with attack path analysis:

- **Path participation**: See which attack paths include specific assets.
- **Choke point identification**: Highlight assets that are key convergence points.
- **Target classification**: Identify common attack targets.
- **Entry point analysis**: Identify assets that can provide initial access paths.

### Critical asset management

The inventory supports critical asset workflows:

- **Automatic classification**: Assets can be marked critical by predefined rules.
- **Manual designation**: Security teams can manually mark assets as critical.
- **Criticality inheritance**: Asset relationships can affect criticality classifications.
- **Protection prioritization**: Critical assets get enhanced monitoring and protection.

### Vulnerability management integration

Cloud assets connect seamlessly with vulnerability management:

- **Unified vulnerability view**: See cloud and endpoint vulnerabilities in one dashboard.
- **Risk-based prioritization**: Prioritize vulnerabilities by asset context and business impact.
- **Remediation tracking**: Track remediation progress across cloud environments.
- **Compliance reporting**: Generate reports that include cloud and endpoint data.

## Reporting and analytics

### Built-in reporting

- **Coverage reports**: Assess Defender for Cloud deployment across your cloud estate.
- **Risk assessments**: Review risk across multicloud environments.
- **Compliance dashboards**: Track regulatory compliance status across cloud assets.
- **Trend analysis**: Monitor security posture changes over time.

### Custom analytics

- **Advanced hunting**: Query cloud asset data by using Kusto Query Language (KQL).
- **API access**: Access inventory data programmatically for custom reports and integrations.
- **Export capabilities**: Export asset data in multiple formats for external analysis.
- **Dashboard integration**: Build custom dashboards by using cloud asset inventory data.

## Limitations and considerations

### Current limitations

- **Real-time updates**: Some asset changes can take time to appear in inventory.
- **Historical data**: Historical asset data can be limited during early rollout.

### Performance considerations

- **Large environments**: Filtering and scoping improve performance in environments with many assets.
- **Refresh rates**: Asset data refreshes periodically. For real-time checks, use the cloud provider console.
- **Network dependencies**: Inventory features require reliable connectivity to cloud provider application programming interfaces (APIs).

### Scoping limitations

Some assets may appear outside the cloud scopes configured in Defender for Cloud:

- **Cross-scope dependencies**: Assets with relationships that span multiple scopes.
- **Floating assets**: Some asset types don't support fine-grained scoping.
- **Inherited permissions**: Assets that inherit permissions from parent resources outside the scope.

## Best practices

### Inventory management

- **Regular reviews**: Review inventory regularly for accuracy and completeness.
- **Tagging strategy**: Use consistent tags across cloud environments for better organization.
- **Scope configuration**: Configure cloud scopes to match your organization.
- **Filter optimization**: Save useful filter combinations for daily tasks.

### Security operations

- **Critical asset focus**: Prioritize monitoring and protection for business-critical assets.
- **Risk-based approach**: Use risk indicators to guide security focus and resource allocation.
- **Integration workflows**: Use inventory data in incident response and vulnerability workflows.
- **Automation opportunities**: Identify repetitive tasks to automate by using inventory APIs.

## Review the inventory

1. In the Microsoft Defender portal, navigate to **Assets** > **Cloud**.
1. Review the unified cloud assets overview:
    - **Total resources** across all connected cloud environments
    - **Security posture summary** showing healthy vs. unhealthy resources
    - **Coverage metrics** indicating Defender for Cloud protection status
    - **Risk distribution** showing assets by risk level

1. Use workload-specific tabs to focus on particular asset types:
    - Select **VMs** for virtual machines and compute instances
    - Select **Data** for databases and storage resources
    - Select **Containers** for Kubernetes and container-related assets
    - Select **AI** for AI and machine learning workloads
    - Select **API** for API management and endpoints
    - Select **DevOps** for development pipeline resources
    - Select **Identity** for identity and access management assets
    - Select **Serverless** for functions and serverless compute

1. Apply the global scope filter to focus on specific cloud scopes or organizational boundaries

1. Select an asset to view detailed information:
    - **Security recommendations** prioritized by risk level
    - **Security alerts** with threat detection insights
    - **Attack path involvement** showing participation in potential attack scenarios
    - **Compliance status** against security standards
    - **Risk factors** including internet exposure and lateral movement potential

## Next steps

- [Cloud overview dashboard](cloud-infrastructure-dashboard.md?pivots=defender-portal)
- [Manage security recommendations](review-security-recommendations.md?pivots=defender-portal)

::: zone-end


