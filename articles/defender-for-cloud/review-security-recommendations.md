---
title: Review Security Recommendations
description: Learn how to review security recommendations in Microsoft Defender for Cloud to improve the security posture of your environments.
ms.topic: how-to
author: ElazarK
ms.author: elkrieger
ms.date: 04/22/2025
ms.custom: sfi-image-nochange
zone_pivot_groups: defender-portal-experience
#customer intent: As a security analyst, I want to learn how to review security recommendations in Microsoft Defender for Cloud so that I can improve the security posture of my environments.
---

# Review security recommendations

In Microsoft Defender for Cloud, resources and workloads are assessed against built-in and custom security policies and regulatory compliance frameworks, which are applied in your cloud environments (Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP) and more). Based on those assessments, security recommendations provide practical steps to remediate security issues and improve security posture.

Defender for Cloud proactively uses a dynamic engine that assesses the risks in your environment, while it considers the potential for exploitation and the potential business effect on your organization. The engine prioritizes security recommendations based on the risk factors of each resource. The context of the environment determines these risk factors.

## Prerequisites

- Recommendations are included with Defender for Cloud, but you can't see [risk prioritization](risk-prioritization.md) unless you enable Defender CSPM on your environment.

## Review the recommendations page

::: zone pivot="azure-portal"

Review recommendations and make sure all the details are correct before you resolve them.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Select a recommendation.

## Understanding risk prioritization

Microsoft Defender for Cloud proactively utilizes a dynamic engine that assesses the risks in your environment while taking into account the potential for exploitation and the potential business impact to your organization. The engine prioritizes security recommendations based on the risk factors of each resource, which are determined by the context of the environment, including the resource's configuration, network connections, and security posture.

When Defender for Cloud performs a risk assessment of your security issues, the engine identifies the most significant security risks while distinguishing them from less risky issues. The recommendations are then sorted based on their risk level, allowing you to address the security issues that pose immediate threats with the greatest potential of being exploited in your environment.

### What are risk factors?

Defender for Cloud utilizes the context of an environment, including the resource's configuration, network connections, and security posture, to perform a risk assessment of potential security issues. By doing so, it identifies the most significant security risks while distinguishing them from less risky issues. The recommendations are then sorted based on their risk level.

This risk assessment engine considers essential risk factors, such as:
- **Internet exposure**: Whether resources are accessible from the internet
- **Data sensitivity**: The presence of sensitive or confidential data
- **Lateral movement**: Potential for attackers to move between resources
- **Attack paths**: Whether the security issue is part of potential attack scenarios

### Risk levels and calculation

Defender for Cloud uses a context-aware risk-prioritization engine to calculate the risk level of each security recommendation. The risk level is determined by the risk factors of each resource, such as its configuration, network connections, and security posture. The risk level is calculated based on the potential impact of the security issue being breached, the categories of risk, and the attack path that the security issue is part of.

Recommendations are classified into five categories based on their risk level:

- **Critical**: Recommendations that indicate a critical security vulnerability an attacker can exploit to gain unauthorized access to your systems or data.
- **High**: Recommendations that indicate a potential security risk that should be addressed in a timely manner, but might not require immediate attention.
- **Medium**: Recommendations that indicate a relatively minor security issue that can be addressed at your convenience.
- **Low**: Recommendations that indicate a relatively minor security issue that can be addressed at your convenience.
- **Not evaluated**: Recommendations that haven't been evaluated yet. This could be due to the resource not being covered by the Defender CSPM plan, which is a prerequisite for risk level.

### Recommendations dashboard details

On the recommendations page, you can review the following risk-prioritized details:

- **Title**: The title of the recommendation
- **Affected resource**: The resource that the recommendation applies to
- **Risk level**: The exploitability and the business impact of the underlying security issue, taking into account environmental resource context such as: Internet exposure, sensitive data, lateral movement, and more
- **Risk factors**: Environmental factors of the resource affected by the recommendation, which influences the exploitability and the business impact of the underlying security issue
- **Attack paths**: The number of attack paths that the recommendation is part of based on the security engine's search for all potential attack paths
- **Owner**: The person the recommendation is assigned to
- **Status**: The current status of the recommendation (unassigned, on time, overdue)
- **Insights**: Information related to the recommendation such as if it's in preview, if it can be denied, if there's a fix option available

::: zone-end

::: zone pivot="defender-portal"

> [!NOTE]
> This capability is currently in preview.
> For details about current gaps and restrictions, see [Known limitations](defender-portal/known-limitations.md).

The **Recommendations** page within Exposure Management provides a prioritized list of security actions designed to improve your cloud security posture by addressing vulnerabilities and misconfigurations. These recommendations are ranked by effective risk, helping security teams focus on the most critical threats first.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).

1. Navigate to **Exposure Management** > **Recommendations** > **Cloud Assets** tab.

   :::image type="content" source="media/defender-portal-recommendations.png" alt-text="Screenshot of Recommendations page in Defender Portal." lightbox="media/defender-portal-recommendations.png":::

1. Apply filters such as:
   - **Exposed asset**: Filter by assets with exposure to threats
   - **Asset risk factors**: Filter by specific risk conditions
   - **Environment**: Filter by Azure, AWS, or GCP
   - **Workload**: Filter by specific workload types
   - **Recommendation maturity**: Filter by recommendation readiness level

1. In the left-hand side of the page, you can choose to view recommendations by security category:
   - **All recommendations**: Complete list of security recommendations
   - **Misconfigurations**: Configuration-related security issues
   - **Vulnerabilities**: Software vulnerabilities requiring patches
   - **Exposed Secrets**: Credentials and secrets that may be compromised

   > [!NOTE]
   > When you select a security category filter, both the recommendations list and the summary cards update to reflect only the recommendations in that category.

### Recommendations summary cards

For each view, the page displays summary cards that provide an at-a-glance overview of your cloud security posture:

- **Cloud secure score**: Shows your overall cloud security health based on the security recommendations in your environment
- **Score history**: Tracks your Secure Score changes over the last 7 days, helping you identify trends and measure improvement
- **Recommendations by risk level**: Summarizes the number of active security recommendations, categorized by severity (Critical, High, Medium, Low)
- **How risk level is calculated**: Explains how severity ratings and asset-specific risk factors are combined to determine the overall risk level for each recommendation

### Recommendation views

The Defender portal provides two distinct ways to view and interact with recommendations:

#### Recommendation per asset view

This view displays a list of all recommendations organized by individual assets, ordered by risk level. Each row represents a single recommendation affecting a specific resource.

When you select a recommendation row, a side panel opens displaying:

- **Overview**: General information about the recommendation, including its description, details of the exposed asset, and other relevant recommendation specifics
- **Remediation steps**: Actionable guidance to resolve the security issue
- **Map preview**: Displays all related attack paths passing through the asset, aggregated by target node type. You can:
  - Click on an aggregated path to reveal all associated attack and additional paths
  - Select a specific path to view its detailed visualization
- **Related initiatives**: Security initiatives and compliance frameworks associated with the recommendation
- Additional tabs may appear for specific recommendations with relevant contextual information

#### Recommendation title view

This view aggregates recommendations by title, showing a consolidated list ordered by risk level. Each row represents all instances of a particular recommendation across your environment.

When you select an aggregated recommendation row, a side panel opens displaying:

- **Overview**: General information including the recommendation description, risk level distribution across affected resources, governance status, and other relevant details
- **Remediation steps**: Actionable guidance to resolve the security issue
- **Exposed assets**: A list of all resources affected by this recommendation
- **Related initiatives**: Security initiatives and compliance frameworks associated with the recommendation
- Additional tabs may appear for specific recommendations with relevant contextual information

:::image type="content" source="media/review-security-recommendations/defender-portal-recommendation-side-pane.png" alt-text="Screenshot of recommendations side pane." lightbox="media/review-security-recommendations/defender-portal-recommendation-side-pane.png":::

Alternative access paths to recommendations:

- **Cloud infrastructure**  > **Overview** > **Security posture** > **Security recommendations** > **View recommendations**
- **Exposure Management** > **Initiatives** > **Cloud Security** > **Open initiative page** > **Security Recommendations** tab

> [!NOTE]
> **Why you might see different resources between the Azure portal and Defender portal:**
> - **Deleted resources**: You may notice deleted resources still showing in the Azure portal. This happens because the Azure portal currently shows the last known state of resources. We're working to fix this so that deleted resources no longer appear.
> - **Azure Policy resources**: Some resources that come from Azure Policy may not show up in the Defender portal. During preview, we only display resources that have security context and contribute to meaningful security insights.

## Understanding risk prioritization in Defender portal

The Defender portal's Exposure Management experience provides advanced risk prioritization capabilities that help security teams focus on the most critical threats. Microsoft Defender for Cloud's dynamic risk assessment engine evaluates the risks in your environment while considering the potential for exploitation and the potential business impact to your organization.

The recommendations in the Defender portal are automatically prioritized based on effective risk, which takes into account multiple contextual factors about each resource and its environment. This risk-based approach ensures that security teams can address the most critical security issues first, making remediation efforts more efficient and effective.

### Risk-based filtering and prioritization

The Defender portal offers advanced filtering capabilities that allow you to focus on recommendations based on risk factors:

- **Exposed assets**: Filter by resources that have direct exposure to threats, such as internet-facing resources or resources with vulnerable configurations
- **Asset risk factors**: Target specific risk conditions like data sensitivity, lateral movement potential, or critical infrastructure exposure
- **Risk level breakdown**: View recommendations categorized by Critical, High, Medium, and Low risk levels
- **Attack path integration**: Focus on recommendations that are part of identified attack paths

### Risk calculation in Exposure Management

The unified Exposure Management experience calculates risk levels using a context-aware engine that considers:

- **Environmental context**: Resource configuration, network topology, and security posture
- **Exploitability factors**: How easily an attacker could exploit the vulnerability
- **Business impact**: The potential consequences if the security issue were exploited
- **Attack surface**: The resource's exposure to potential threats
- **Choke point analysis**: Whether the resource serves as a critical junction in potential attack paths

### Risk levels in Defender portal

Recommendations in the Defender portal are classified into five risk levels:

- **Critical**: The most severe security issues with immediate exploitability and high business impact that require urgent attention
- **High**: Significant security risks that should be addressed promptly but may not require immediate action
- **Medium**: Moderate security issues that can be addressed as part of regular security maintenance
- **Low**: Minor security issues that can be addressed at your convenience during routine operations
- **Not evaluated**: Recommendations that haven't been risk-assessed, typically due to resource coverage limitations

### Enhanced recommendation details

Each recommendation in the Defender portal provides comprehensive risk context:

- **Risk assessment summary**: Overall risk calculation and contributing factors
- **Attack surface mapping**: Visual representation of how the resource relates to potential attack scenarios
- **Initiative correlation**: Connection to broader security initiatives and compliance frameworks
- **CVE associations**: Links to relevant Common Vulnerabilities and Exposures when applicable
- **Historical context**: Trends and changes in risk levels over time

::: zone-end

1. On the recommendation page, review the following details:
   - **Risk level**: The vulnerability and business effect of the underlying security issue, considering the environmental resource context like internet exposure, sensitive data, lateral movement, and more.
   - **Risk factors**: Environmental factors of the resource affected by the recommendation, which influence the vulnerability and business effect of the underlying security issue. Examples of risk factors include internet exposure, sensitive data, and lateral movement potential.
   - **Resource**: The name of the affected resource.
   - **Status**: The status of the recommendation, like unassigned, on time, or overdue.
   - **Description**: A brief description of the security issue.
   - **Attack paths**: The number of attack paths.
   - **Scope**: The affected subscription or resource.
   - **Freshness**: The freshness interval of the recommendation.
   - **Last change date**: The date when this recommendation was last changed.
   - **Severity**: The severity of the recommendation: **High**, **Medium**, or **Low**. More details are provided later in this article.
   - **Owner**: The person assigned to the recommendation.
   - **Due date**: The assigned due date for resolving the recommendation.
   - **Tactics & techniques**: The tactics and techniques mapped to MITRE ATT&CK.

## Explore a recommendation

::: zone pivot="azure-portal"

You can interact with recommendations in multiple ways. If an option isn't available, that means it's not relevant to the recommendation.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Select a recommendation.

1. In **Take action**:

   - **Remediate**: A description of the manual steps required to resolve the security issue on the affected resources. For recommendations with the **Fix** option, you can select **View remediation logic** before applying the suggested fix to your resources.
   - **Recommendation owner and set due date**: If you enable a [governance rule](governance-rules.md) for the recommendation, you can assign an owner and due date.
   - **Exempt**: You can exempt resources from the recommendation or disable specific findings by using disable rules.
   - **Workflow automation**: Set a logic app to trigger with the recommendation.

   :::image type="content" source="media/review-security-recommendations/recommendation-take-action.png" alt-text="Screenshot that shows what you can see in the recommendation when you select the Take action tab." lightbox="media/review-security-recommendations/recommendation-take-action.png":::

1. In **Findings**, you can review affiliated findings by severity.

   :::image type="content" source="media/review-security-recommendations/recommendation-findings.png" alt-text="Screenshot that shows the findings tab in a recommendation, including all the attack paths for that recommendation." lightbox="media/review-security-recommendations/recommendation-findings.png":::

1. In **Graph**, you can view and investigate all the context that's used for risk prioritization, including [attack paths](how-to-manage-attack-path.md). You can select a node in an attack path to view the details of the selected node.

   :::image type="content" source="media/review-security-recommendations/recommendation-graph.png" alt-text="Screenshot that shows the Graph tab in a recommendation, including all the attack paths for that recommendation." lightbox="media/review-security-recommendations/recommendation-graph.png":::

1. To view more details, select a node.

   :::image type="content" source="media/review-security-recommendations/select-node.png" alt-text="Screenshot that shows the Graph tab with a node selected, displaying additional details." lightbox="media/review-security-recommendations/select-node.png":::

1. Select **Insights**.

1. To view details, select a vulnerability from the dropdown menu.

   :::image type="content" source="media/review-security-recommendations/insights.png" alt-text="Screenshot of the Insights tab for a node." lightbox="media/review-security-recommendations/insights.png":::

1. (Optional) To view the associated recommendation page, select **Open the vulnerability page**.

1. [Remediate the recommendation](implement-security-recommendations.md).

::: zone-end

::: zone pivot="defender-portal"

In the Defender portal, you can interact with recommendations in multiple ways through the Exposure Management experience. Once you've selected a recommendation from the **Exposure Management** > **Recommendations** > **Cloud assets** tab, you can explore detailed information and take action.

Apply filters and filter sets such as **Exposed asset**, **Asset risk factors**, **Environment**, **Workload**, **Recommendation maturity** and others.

On the left navigation pane, you can choose to either view all recommendations or view by a specific category.

There are separate views for issue types:

- **Misconfigurations**
- **Vulnerabilities**
- **Exposed Secrets**.

For each view you will view the **Cloud secure score**, **Score history**, **Recommendation by risk level** and how the risk is calculated.

> [!NOTE]
> In the Defender portal, some recommendations that previously appeared as a single aggregated item now display as multiple individual recommendations. This change reflects a shift from grouping related findings under one recommendation to listing each recommendation separately.
>
> - You may notice a longer list of recommendations compared to before. Combined findings (such as vulnerabilities, exposed secrets, or misconfigurations) are now shown individually rather than nested under a parent recommendation.
> - The old grouped recommendations still appear side by side with the new format for now, but they will eventually be deprecated.
> - These recommendations are marked as Preview. This tag indicates that the recommendation is in an early state and does not affect Secure Score yet.
> - Secure Score currently applies to the parent recommendation only, not to each individual item.
>
 **Tip**: If you see both formats or recommendations with a Preview tag, this is expected during the transition. The goal is to improve clarity and allow customers to act on specific recommendations more easily.

With the integration of Defender for Cloud in the Defender portal, you can also access enhanced cloud recommendations through the unified interface:

Key improvements in the cloud recommendations experience include:

- **Risk factors per asset**: Assess the broader exposure context of each recommendation for informed decisions
- **Risk-based scoring**: New scoring that weighs recommendations based on severity, asset context, and potential impact
- **Enhanced data**: Core recommendation data from Azure Recommendations enriched with additional fields and capabilities from Exposure Management
- **Prioritized by criticality**: Greater emphasis on critical issues that pose the highest risk to your organization

The recommendation details page provides comprehensive information including:

1. **Overview**: Summary of the recommendation with:
   - - Description
   - Recommendation details (risk level, attack paths, status, owner)
   - Exposed asset details (Asset name, type, environment)
1. **Remediation steps** where available.
1. **Map preview**: A visual representation of the resource's attack surface and its relation to potential attack scenarios.
1. **Related initiatives**: The security initiatives and compliance frameworks associated with the recommendation.
1. **Associated CVEs**: Links to relevant Common Vulnerabilities and Exposures when applicable.

The unified experience ensures that cloud security recommendations are contextualized within the broader security landscape, enabling more informed decision-making and efficient remediation workflows.

::: zone-end

::: zone pivot="azure-portal"

## Group recommendations by title

You can group recommendations by title with the Defender for Cloud recommendation page. This feature is useful when you want to remediate a recommendation that affects multiple resources due to a specific security issue.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Select **Group by title**.

    :::image type="content" source="media/review-security-recommendations/group-by-title.png" alt-text="Screenshot of the recommendations page that shows the location of the Group by title toggle." lightbox="media/review-security-recommendations/group-by-title.png":::

## Manage your assigned recommendations

Defender for Cloud supports governance rules for recommendations. You can assign a recommendation owner or a due date. You can help ensure accountability by using governance rules, which also support a service-level agreement (SLA) for recommendations.

- Recommendations appear as **On time** until their due date passes. Then they change to **Overdue**.
- When a recommendation isn't classified as **Overdue**, it doesn't affect your Microsoft Secure Score.
- You can also apply a grace period so that overdue recommendations don't affect your Secure Score.

Learn more about how to configure [governance rules](governance-rules.md).

To see all of your assigned recommendations:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Select **Add filter** > **Owner**.

1. Select your user entry.

1. Select **Apply**.

1. In the recommendation results, review the recommendations, including affected resources, risk factors, attack paths, due dates, and status.

1. Select a recommendation to review it further.

To make changes to an assignment, complete the following steps:

1. Go to **Take action** > **Change owner & due date**.

1. Select **Edit assignment** to change the recommendation owner or due date.

1. If you select a new remediation date, specify why remediation should be completed by that date in **Justification**.
  
1. Select **Save**.

   > [!NOTE]
   > When you change the expected completion date, the due date for the recommendation doesn't change, but security partners can see that you plan to update the resources by the specified date.

By default, the owner of the resource receives a weekly email that shows all the recommendations assigned to them.

You can also use the **Set email notifications** option to:

- Override the default weekly email to the owner.
- Notify owners weekly with a list of open or overdue tasks.
- Notify the owner's direct manager with an open task list.

## Review recommendations in Azure Resource Graph

You can use [Azure Resource Graph](/azure/governance/resource-graph/) to write a [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/) query to query Defender for Cloud security posture data across multiple subscriptions. Azure Resource Graph provides an efficient way to query at scale across cloud environments by viewing, filtering, grouping, and sorting data.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Recommendations**.

1. Select a recommendation.

1. Select **Open query**.

1. You can open the query in one of two ways:

   - **Query returning affected resource**: Returns a list of all of the resources that the recommendation affects.
   - **Query returning security findings**: Returns a list of all security issues that the recommendation found.

1. Select **run query**.

   :::image type="content" source="./media/review-security-recommendations/run-query.png" alt-text="Screenshot of Azure Resource Graph Explorer that shows the results for the recommendation from the previous screenshot." lightbox="media/review-security-recommendations/run-query.png":::

1. Review the results.

## How are recommendations classified?

Every security recommendation from Defender for Cloud is given one of three severity ratings.

### High severity

We recommend that you address these recommendations immediately. They indicate that there's a critical security vulnerability that an attacker could exploit to gain unauthorized access to your systems or data.

Examples of high severity recommendations include:

- Unprotected secrets on a machine.
- Overly permissive inbound network security group rules.
- Clusters that allow images to be deployed from untrusted registries.
- Unrestricted public access to storage accounts or databases.

### Medium severity

These recommendations indicate a potential security risk. We recommend that you address these recommendations in a timely manner, but they might not require immediate attention.

Examples of medium severity recommendations include:

- Containers that share sensitive host namespaces.
- Web apps that don't use managed identities.
- Linux machines that don't require SSH keys during authentication.
- Unused credentials left in the system after 90 days of inactivity.

### Low severity

These recommendations indicate a relatively minor security issue that can be addressed at your convenience.

Examples of low severity recommendations include:

- The use of local authentication instead of Microsoft Entra ID.
- Health issues with your endpoint protection solution.
- Users not following best practices with network security groups.
- Misconfigured logging settings, which might make it harder to detect and respond to security incidents.

An organization's internal policies might differ from Microsoft's classification of a specific recommendation. We recommend that you always carefully review each recommendation and consider its potential effect on your security posture before you decide how to address it.

> [!NOTE]
> Defender CSPM customers have access to a richer classification system where recommendations feature a **Risk level** determination that utilizes the *context* of the resource and all related resources. Learn more about [risk prioritization](risk-prioritization.md) and detailed guidance in the risk prioritization sections above.

### Example

In this example, the **Recommendation details** page shows 15 affected resources:

:::image type="content" source="./media/review-security-recommendations/open-query.png" alt-text="Screenshot of the Open query button on the Recommendation details page." lightbox="media/review-security-recommendations/open-query.png":::

When you open and run the underlying query, Azure Resource Graph Explorer returns the same affected resources for this recommendation.

:::zone-end

## Related content

- [Remediate security recommendations](implement-security-recommendations.md)
