---
title: Configure Microsoft Sentinel scoping (row-level RBAC)
description: Create and apply Microsoft Sentinel scopes to control access to data at the row level.
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tbeerthuis
ms.date: 08/05/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1020

#customer intent: As a security administrator, I want to configure Microsoft Sentinel scoping to control access to data at the row level, so that I can ensure that users only have access to the data relevant to their role and responsibilities.
---

# Configure Microsoft Sentinel scoping (row-level RBAC)

Microsoft Sentinel scoping provides row-level role-based access control (RBAC), enabling granular, row-level access without requiring workspace separation. Microsoft Sentinel scoping allows multiple teams to operate securely within a shared Microsoft Sentinel environment while using consistent and reusable scope definitions across tables and experiences.

Configure scoping in the Microsoft Defender portal. Sentinel in the Azure portal (Ibiza) doesn't support scoping.

## What is Microsoft Sentinel scoping?

Microsoft Sentinel scoping extends permissions management in the Defender portal so the administrator can grant permissions to specific subsets of data in Sentinel tables. To create scopes, complete the following steps:

- [Define logical scopes](#step-1-create-a-sentinel-scope): Create scope definitions that align with your organizational structure (by business unit, region, or data sensitivity)
- [Assign users or groups to scopes](#step-2-assign-scope-tags-to-users-or-groups): Assign specific users or groups to one or more scopes using Unified RBAC (role-based access control)
- [Tag data rows at ingestion time](#step-3-tag-tables-with-scope): Apply scope tags to rows in tables using Table Management, allowing you to create rules that tag newly ingested data automatically
- [Restrict access by scope](#step-4-access-scoped-data): Limit user access to alerts, incidents, hunting queries, and data lake exploration based on their assigned scope

> [!NOTE]
> Scopes are additive. Users assigned multiple roles get the broadest permissions available to them from all their assignments. For example, if you hold both an Entra global reader role and a Defender XDR URBAC role that provides scoped permissions on *System tables*, you're unrestricted by scopes on System tables due to the Entra role. Another example is if you hold the same role permissions in Microsoft Defender XDR for a workspace, with two different scopes, you have those permissions for both scopes.

Scopes apply to Sentinel tables that support ingestion-time transformations.

<a name="use-cases"></a>
## Use cases for Microsoft Sentinel scoping

Microsoft Sentinel scoping is useful in the following scenarios:

- **Distributed or federated SOC teams**: Large enterprises and MSSPs often operate federated SOC models where different teams are responsible for specific regions, business units, or customers. Scoping allows each SOC team to operate independently within a shared Sentinel workspace, ensuring that they can investigate and respond to threats in their domain without accessing unrelated data.
- **Scoped access for external, non-security teams**: Teams such as networking, IT operations, or compliance often require access to specific raw data sources without needing visibility into broader security content. Row-level scoping enables these external teams to securely access only the data relevant to their function.
- **Sensitive data protection**: Protect certain data or tables by applying a least privilege data access approach, ensuring sensitive information is only accessible to authorized users.

## Prerequisites

Before you begin, verify the following prerequisites:

- **Access to the Microsoft Defender portal**: `https://security.microsoft.com`
- **Microsoft Sentinel workspaces onboarded to the Defender portal**: Sentinel workspaces must be available in the Defender portal before you can assign roles and permissions.
- **Sentinel enabled in Unified RBAC**: You must [enable Microsoft Sentinel in URBAC](/defender-xdr/manage-rbac) before using this feature.
- **Required permissions** for the person assigning scope and tagging tables:
  - **Security Authorization (Manage)** permission (URBAC) to create scopes and assignments
  - **Data Operations (Manage)** and **Alerts (Manage)** permissions (URBAC) for Table Management
  - **Subscription owner** or assigned with the `Microsoft.Insights/DataCollectionRules/Write` permission to create Data Collection Rules (DCRs)

## Step 1: Create a Sentinel scope

To create a Sentinel scope, follow these steps:

1. In the Microsoft Defender portal, go to **System** > **Permissions**.
1. Select **Microsoft Defender XDR**.
1. Open the **Scopes** tab.
1. Select **Add Sentinel scope**.
1. Enter a scope name and optional description.
1. Select **Create scope**.

You can create multiple scopes and define custom scope names and descriptions for each scope to reflect your organizational structure and policies.

> [!NOTE]
> You can create up to 100 unique Sentinel scopes per tenant.

:::image type="content" source="./media/scoping/add-scope.png" alt-text="Screenshot of the Add Sentinel scope tab and dialog." lightbox="./media/scoping/add-scope.png":::

## Step 2: Assign scope tags to users or groups

To assign scope tags to users or groups, follow these steps:

1. In **Permissions**, open the **Roles** tab.
1. Select **Create custom role**.
1. Enter the role name and description, and select **Next**.

    :::image type="content" source="./media/scoping/set-up-basics.png" alt-text="Screenshot of dialog for creating name and description of a custom role." lightbox="./media/scoping/set-up-basics.png":::

1. Assign the required permissions to the role and select **Apply**.

     :::image type="content" source="./media/scoping/assign-permissions.png" alt-text="Screenshot of dialog for assigning permissions to a custom role." lightbox="./media/scoping/assign-permissions.png":::

1. In **Assignments**, enter a name and select:
    - Users or user groups (Microsoft Entra ID groups)
   - Data sources and data collections (Sentinel workspaces)
1. Under **Scope**, select **Edit**.
1. Select one or more scopes to assign to this role.
1. Save the role.

You can assign users to multiple scopes simultaneously over multiple workspaces, and access rights aggregate from all assigned scopes. Restricted users can only access SIEM data associated with their assigned scopes.

> [!NOTE]
> You can only assign Sentinel scopes to Defender XDR RBAC roles. Azure RBAC permissions on workspaces and Entra global role permissions aren't supported. Experiences that can't use row-level RBAC, such as Jupyter Notebooks, don't allow scoped users to view data for those workspaces.

:::image type="content" source="./media/scoping/edit-scope.png" alt-text="Screenshot of assigning Sentinel scopes to a custom role." lightbox="./media/scoping/edit-scope.png":::

## Step 3: Tag tables with scope

Enforce scopes by tagging data during ingestion. This tagging process creates a Data Collection Rule (DCR) that applies scope tags to newly ingested data.

Keep the following limits in mind before you tag a table:

- Only tables that support ingestion-time transformations can be tagged. Custom tables built on CLv1 aren't supported; CLv2 tables are supported.
- XDR tables aren't supported, including extended retention of XDR tables into the lake.
- You can only add transformations in the same subscription as your user subscription.
- You can only tag newly ingested data. Previously ingested data isn't included and can't be retroactively scoped.
- The Log Analytics tables `SecurityAlerts` and `SecurityIncidents` don't automatically inherit scope from the raw tables that generated them, so scoped users can't access them by default. As a workaround, either:
  - Use the XDR `AlertsInfo` and `AlertsEvidence` tables, where scope is inherited automatically, or
  - Apply scope to these Log Analytics tables manually. This method is limited to the attributes in the table and might not be equivalent to inheritance from the source data tables.

To tag a table:

1. In Microsoft Sentinel, go to **Configuration** > **Tables**.
1. Select a table that supports ingestion-time transformations.
1. Select **Scope tag rule**.

    :::image type="content" source="./media/scoping/scope-tag-rule.png" alt-text="Screenshot of the Scope tag rule tab." lightbox="./media/scoping/scope-tag-rule.png":::

1. Enable the **Allow use of scope tags for RBAC** toggle.
1. Enable the **Scope tag rule** toggle.
1. Define a KQL expression that selects rows using [transformKQL supported operators and limits](/azure/azure-monitor/essentials/data-collection-transformations).

    Example to scope by location:

    ```kql
    Location == 'Spain'
    ```

1. Select the scope to apply to rows matching the expression.
1. Save the rule.

You can only tag newly ingested data. Previously ingested data isn't included. After tagging, it can take up to an hour for the new rule to take effect.

> [!TIP]
> You can create multiple scope tag rules on the same table to tag different rows with different scopes. Records can belong to multiple scopes simultaneously.

:::image type="content" source="./media/scoping/table-scope-tag-rule.png" alt-text="Screenshot of the table scope tag rule." lightbox="./media/scoping/table-scope-tag-rule.png":::

### Manually tag data by using a DCR

If your organization manages table schemas and ingestion-time transformations outside the Microsoft Defender portal, you can apply scope tags directly in Azure Monitor. This option supports both direct configuration and automated deployment workflows, including CI/CD. Complete the table schema and DCR configuration before you enable scoped access for the table in Microsoft Sentinel.

1. Add a custom column named `SentinelScope_CF` with the `string` data type to the table schema. For more information, see [Manage tables in a Log Analytics workspace](/azure/azure-monitor/logs/manage-logs-tables#view-table-properties).
1. Create or update a DCR for the table. Add a transformation that populates `SentinelScope_CF` with the Microsoft Sentinel scope values for each row. For guidance on selecting and configuring the DCR, see [Configure your data transformation](/azure/sentinel/configure-data-transformation).
1. In the Microsoft Defender portal, go to **Microsoft Sentinel** > **Configuration** > **Tables**.
1. Select the table, and then select **Scope tag rule**.
1. Set **Control access with scope tags** to **On**. Leave **Rule status** set to **Off** because the DCR applies the tags.

    :::image type="content" source="./media/scoping/control-access-scope-tags-toggle-cropped.png" alt-text="Screenshot of the Scope tagging pane showing Control access with scope tags set to On and Rule status set to Off." lightbox="./media/scoping/control-access-scope-tags-toggle.png":::

1. Select **Save**.

> [!NOTE]
> Turning on **Control access with scope tags** enables scoped access for rows tagged by the DCR. It doesn't create the `SentinelScope_CF` column or update the DCR.

## Step 4: Access scoped data

After you create, assign, and apply scopes to tables, scoped users can access Microsoft Sentinel experiences based on their assigned scope. All newly ingested data automatically gets tagged with scope. Historical (previously ingested) data isn't included. Scoped users can't see any data that isn't explicitly scoped. Unscoped users can see all data within the workspace.

Scoped users can:

- View alerts generated from scoped data.
- Manage alerts if they have access to all events linked to that alert.
- View incidents that contain at least one scoped alert.
- Manage incidents if they have access to all underlying alerts and have the required permission.
- Run advanced hunting queries over scoped rows only.
- Query and explore data in the Sentinel lake (tables with scope).
- Filter alerts and incidents based on their Sentinel scope.

Alerts inherit scope from the underlying data. Incidents are visible if at least one alert is within scope.

Use the `SentinelScope_CF` custom field in queries and detection rules to reference scope in your analytics.

> [!NOTE]
> When you create custom detections and analytics rules, you must project the `SentinelScope_CF` column in their KQL so that alerts inherit scope correctly. If you don't project this column, even scoped rules produce unscoped alerts that aren't visible to scoped users.

:::image type="content" source="./media/scoping/scoped-alerts-view.png" alt-text="Screenshot of alerts filtered by Sentinel scope." lightbox="./media/scoping/scoped-alerts-view.png":::

<a name="limitations"></a>
## Limitations of Microsoft Sentinel scoping

:::image type="content" source="./media/scoping/select-scopes-detection.png" alt-text="Screenshot of selecting specific scopes for a custom detection rule." lightbox="./media/scoping/select-scopes-detection.png":::

1. If you're an unscoped user, you can also select **All data**. By selecting this option, the rule is unscoped, runs over all data, and is visible and editable only to unscoped users.

1. Complete the wizard and save the rule.

    :::image type="content" source="./media/scoping/review-scoped-detection.png" alt-text="Screenshot of the review step for a scoped custom detection rule." lightbox="./media/scoping/review-scoped-detection.png":::

Keep the following limits in mind for scoped custom detections:

- Custom detections over `AlertInfo` and `AlertEvidence` aren't supported and run over all data, regardless of the defined scope.
- Don't create scoped detections on unscoped tables. Querying unscoped tables from a scoped detection always returns no results.
- Scoped detections can't use custom frequency when XDR tables are included in the query. Custom frequency requires data to be fetched from Sentinel, where XDR tables are unscoped. XDR tables can only be queried by unscoped detections.

### Create scoped automation rules

To create scoped automation rules, follow these steps:

1. In the Microsoft Defender portal, go to **Microsoft Sentinel** > **Configuration** > **Automation**.
1. Open the **Enhanced rules** tab.

    :::image type="content" source="./media/scoping/automation-enhanced-rules.png" alt-text="Screenshot of the Enhanced rules tab in Automation." lightbox="./media/scoping/automation-enhanced-rules.png":::

1. Select **Create** to add a new automation rule, then fill in the details for your automation rule.

    :::image type="content" source="./media/scoping/create-automation-rule.png" alt-text="Screenshot of creating a new enhanced automation rule." lightbox="./media/scoping/create-automation-rule.png":::

1. Select the **Sentinel scope** to apply to the rule:

    - If you're a scoped user (you have one or more Sentinel scopes assigned to you), you must choose a scope.
    - If you're an unscoped user, you can choose **All available and future Sentinel scopes**.

    :::image type="content" source="./media/scoping/automation-rule-scope.png" alt-text="Screenshot of the Sentinel scope selector for an automation rule." lightbox="./media/scoping/automation-rule-scope.png":::

1. Save the rule.

The automation rule applies to the data associated with the selected scope and is only visible to users assigned to that scope.

> [!NOTE]
> Playbooks and integrations don't yet support Sentinel scoping.

<a name="permissions-and-access"></a>
## How permissions and access work with scoped data

The following points describe how permissions and scoped access behave in Microsoft Sentinel:

- Users can view an incident if they have access to at least one alert in the incident. They can manage the incident only if they have access to all alerts in the incident and have the required permission.
- The scoped user can only see the data associated with their scope. If the alert contains entities that the user has no access to, the user can't see those entities. If the user has access to at least one of the associated entities, they can see the alert itself.
- To scope an entire table, use a rule that matches all rows (for example, using a condition that is always true). Previously ingested data can't be scoped retroactively.
- Scoped users can't manage resources (such as detection rules, playbooks, automation rules) unless permission is assigned to them in a separate role assignment.

## Next steps

Use the following resources to continue planning your scoping deployment:

- Review the list of [tables that support ingestion-time transformations](/azure/azure-monitor/logs/tables-feature-support)
- Plan scope names and logic before tagging data
- Start with a pilot scope for a small team or data subset
- Learn more about [Unified RBAC in Microsoft Defender XDR](/defender-xdr/manage-rbac)
