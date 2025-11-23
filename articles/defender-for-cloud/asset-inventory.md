---
title: Cloud asset inventory
description: Learn about the cloud asset inventory in Microsoft Defender for Cloud and Security Exposure Management
ms.date: 09/03/2025
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
zone_pivot_groups: defender-portal-experience
---
# Cloud asset inventory

The asset inventory page of Microsoft Defender for Cloud shows the [security posture](concept-cloud-security-posture-management.md) of the resources you connected to Defender for Cloud. It offers a unified, contextual view of cloud infrastructure across Azure, AWS, and GCP. It categorizes assets by workload, criticality, and coverage status, while integrating health data, device actions, and risk signals into a single interface.  Defender for Cloud periodically analyzes the security state of resources connected to your subscriptions to identify potential security issues and provides you with active recommendations. Active recommendations are recommendations that can be resolved to improve your security posture.

Defender for Cloud periodically analyzes the security state of resources connected to it. When resources have active [security recommendations](security-policy-concept.md) or [security alerts](alerts-overview.md) associated with it, they appear in the inventory.

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

### Export tools

**Download CSV report** - Export the results of your selected filter options to a CSV file.

**Open query** - Export the query itself to [Azure Resource Graph (ARG)](/azure/governance/resource-graph/) to further refine, save, or modify the Kusto Query Language (KQL) query.

## How does asset inventory work?

In addition to the predefined filters, you can explore the software inventory data from Resource Graph Explorer.

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

1. If you defined some filters and left the page open, Defender for Cloud doesn't update the results automatically. Any changes to resources won't affect the displayed results unless you manually reload the page or select **Refresh**.

## Export the inventory

1. To save filtered inventory in CSV form, select **Download CSV report**.
1. To save a query in Resource Graph Explorer, select **Open a query**. When you're ready to save a query, select **Save as** and in **Save query**, specific a query name and description, and whether the query is private or shared.

    ![Inventory query in ARG.](./media/asset-inventory/inventory-query-in-resource-graph-explorer.png)

Changes made to resources won't affect the displayed results unless you manually reload the page or select **Refresh**.

## Access a software inventory

To access the software inventory, you need one of the following plans:

- [Agentless machine scanning](concept-agentless-data-collection.md) from [Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md).
- [Agentless machine scanning](concept-agentless-data-collection.md) from [Defender for Servers P2](plan-defender-for-servers-select-plan.md).
- [Microsoft Defender for Endpoint integration](integration-defender-for-endpoint.md) from [Defender for Servers](defender-for-servers-introduction.md).

### Examples using Azure Resource Graph Explorer to access and explore software inventory data

1. Open **Azure Resource Graph Explorer**.

    :::image type="content" source="./media/multi-factor-authentication-enforcement/opening-resource-graph-explorer.png" alt-text="Screenshot shows how to launch Azure Resource Graph Explorer** recommendation page." :::

1. Select the following subscription scope: **securityresources/softwareinventories**

1. Enter any of the following queries (or customize them or write your own!) and select **Run query**.

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

## Next steps

- [Review security recommendations](review-security-recommendations.md)
- [Manage and respond to security alerts](manage-respond-alerts.md)
- [Continuous export](continuous-export.md) - Export security data to SIEM, SOAR, or other tools
- [Create custom security dashboards with Azure Workbooks](custom-dashboards-azure-workbooks.md)
- [Enable Defender for Cloud plans](enable-enhanced-security.md)
- [Connect AWS accounts](quickstart-onboard-aws.md)
- [Connect GCP projects](quickstart-onboard-gcp.md)

::: zone-end

::: zone pivot="defender-portal"

This article describes how to use the unified cloud asset inventory in Microsoft Defender for Cloud within the Microsoft Defender XDR portal to manage and monitor your multicloud infrastructure.

> [!NOTE]
> This capability is currently in preview.
> For details about current gaps and restrictions, see [Known limitations](defender-portal/known-limitations.md).

## Overview

The cloud asset inventory provides a unified, contextual view of cloud infrastructure across Azure, AWS, and GCP environments. It categorizes assets by workload, criticality, and coverage status while integrating health data, device actions, and risk signals into a single interface.

:::image type="content" source="media/asset-inventory/cloud-infrastructure.png" alt-text="Screenshot of cloud asset inventory in the Defender portal" lightbox="media/asset-inventory/cloud-infrastructure.png":::

## Key capabilities

### Unified multicloud visibility

- **Comprehensive coverage**: View all cloud assets across Azure, AWS, GCP, and other supported platforms
- **Consistent interface**: Single pane of glass for multicloud asset management
- **Real-time synchronization**: Up-to-date asset information across all connected cloud environments
- **Cross-platform relationships**: Understand dependencies and connections between assets across different cloud providers

### Workload-specific insights

The inventory is organized by workload types, each providing tailored visibility and data:

- **Virtual Machines**: Compute instances across cloud providers with security posture and vulnerability data
- **Data Resources**: Databases, storage accounts, and data services with compliance and exposure insights
- **Containers**: Kubernetes clusters, container instances, and container registries with security scanning results
- **AI/ML Services**: Artificial intelligence and machine learning resources with governance and security context
- **APIs**: REST APIs, serverless functions, and integration services with exposure analysis
- **DevOps Resources**: CI/CD pipelines, repositories, and development tools with security insights
- **Identity Resources**: Service accounts, managed identities, and access control components
- **Serverless**: Functions, logic apps, and event-driven compute resources

### Advanced filtering and scoping

- **Persistent scoping**: Leverage cloud scopes for consistent filtering across experiences
- **Multi-dimensional filtering**: Filter by environment, workload, risk level, compliance status, and more
- **Search capabilities**: Quick asset discovery through comprehensive search functionality
- **Saved views**: Create and maintain custom filtered views for different operational needs

## Asset categorization and metadata

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

### Accessing the cloud inventory

1. Navigate to the [Microsoft Defender portal](https://security.microsoft.com)
1. Select **Assets** > **Cloud Infrastructure** from the main navigation
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

- **Environment filtering**: Select specific cloud providers (Azure, AWS, GCP) or view all environments
- **Scope filtering**: Apply cloud scopes for organizational boundary management
- **Risk-based filtering**: Focus on high-risk or exposed assets requiring immediate attention
- **Workload filtering**: Narrow results to specific types of cloud resources
- **Status filtering**: Filter by protection status, compliance state, or health indicators

### Search and discovery

- **Text search**: Find assets by name, resource ID, or metadata attributes
- **Tag-based search**: Locate assets using cloud provider tags and labels
- **Advanced queries**: Use complex filter combinations for precise asset discovery
- **Export capabilities**: Export filtered results for reporting and analysis

## Asset details and insights

### Comprehensive asset information

Each asset provides detailed information including:

- **Basic metadata**: Resource names, IDs, locations, and creation timestamps
- **Configuration details**: Current settings, policies, and applied configurations
- **Security posture**: Compliance status, vulnerability assessments, and security recommendations
- **Risk assessment**: Exposure analysis, threat intelligence, and risk scoring
- **Relationships**: Dependencies, connections, and related resources across the environment

### Security recommendations integration

Assets link directly to relevant security recommendations:

- **Configuration improvements**: Misconfigurations and hardening opportunities
- **Vulnerability remediation**: Patch management and security updates
- **Access control**: Identity and permissions optimization
- **Network security**: Firewall rules, network segmentation, and exposure reduction

### Incident response workflows

The inventory supports security operations through:

- **Alert correlation**: Link security alerts to specific assets for faster investigation
- **Response actions**: Direct access to remediation workflows and response capabilities
- **Forensics support**: Detailed asset context for incident investigation and analysis
- **Automation integration**: API access for security orchestration and automated response

## Integration with Exposure Management

### Attack path visualization

Assets in the inventory integrate with attack path analysis:

- **Path participation**: See which attack paths include specific assets
- **Choke point identification**: Highlight assets that are critical convergence points
- **Target classification**: Identify assets that are common attack targets
- **Entry point analysis**: Understand which assets provide initial access opportunities

### Critical asset management

The inventory supports critical asset workflows:

- **Automatic classification**: Assets can be automatically classified as critical based on predefined rules
- **Manual designation**: Security teams can manually designate assets as critical
- **Criticality inheritance**: Asset relationships can influence criticality classifications
- **Protection prioritization**: Critical assets receive enhanced monitoring and protection

### Vulnerability management integration

Cloud assets connect seamlessly with vulnerability management:

- **Unified vulnerability view**: See both cloud and endpoint vulnerabilities in consolidated dashboards
- **Risk-based prioritization**: Vulnerabilities are prioritized based on asset context and business impact
- **Remediation tracking**: Monitor vulnerability remediation progress across cloud environments
- **Compliance reporting**: Generate vulnerability reports that include cloud and endpoint data

## Reporting and analytics

### Built-in reporting

- **Coverage reports**: Assess Defender for Cloud deployment across your cloud estate
- **Risk assessments**: Comprehensive risk analysis across multi-cloud environments  
- **Compliance dashboards**: Track regulatory compliance status across all cloud assets
- **Trend analysis**: Monitor changes in security posture over time

### Custom analytics

- **Advanced hunting**: Query cloud asset data using KQL for custom analysis
- **API access**: Programmatic access to inventory data for custom reporting and integration
- **Export capabilities**: Export asset data in various formats for external analysis
- **Dashboard integration**: Create custom dashboards using cloud asset inventory data

## Limitations and considerations

### Current limitations

- **Software inventory**: Not yet available for cloud assets (planned post-M1 release)
- **Real-time updates**: Some asset changes may have slight delays before appearing in inventory
- **Historical data**: Limited historical asset information during initial rollout period

### Performance considerations

- **Large environments**: Filtering and scoping help manage performance in environments with thousands of assets
- **Refresh rates**: Asset data is refreshed periodically; real-time data may require direct cloud provider console access
- **Network dependencies**: Inventory functionality requires reliable connectivity to cloud provider APIs

### Scoping limitations

Some assets may appear outside defined cloud scopes:

- **Cross-scope dependencies**: Assets with relationships spanning multiple scopes
- **Floating assets**: Certain asset types that don't support fine-grained scoping
- **Inherited permissions**: Assets that inherit permissions from parent resources outside the scope

## Best practices

### Inventory management

- **Regular reviews**: Periodically review asset inventory for accuracy and completeness
- **Tagging strategy**: Implement consistent tagging across cloud environments for better organization
- **Scope configuration**: Set up appropriate cloud scopes to match organizational structure
- **Filter optimization**: Create and save useful filter combinations for efficient daily operations

### Security operations

- **Critical asset focus**: Prioritize monitoring and protection of business-critical assets
- **Risk-based approach**: Use risk indicators to guide security attention and resource allocation
- **Integration workflows**: Leverage inventory data in incident response and vulnerability management processes
- **Automation opportunities**: Identify repetitive tasks that can be automated using inventory APIs

## Review the inventory

1. In the Microsoft Defender portal, navigate to **Assets** > **Cloud Infrastructure**.
1. Review the unified cloud infrastructure assets overview:
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
