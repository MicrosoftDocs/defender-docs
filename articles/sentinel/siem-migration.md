---
title: Use the SIEM migration experience
titleSuffix: Microsoft Sentinel
description: Migrate security monitoring use cases from other Security Information and Event Management (SIEM) systems to Microsoft Sentinel. 
author: mberdugo
ms.topic: how-to
ms.date: 11/27/2025
ms.author: monaberdugo
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal

#Customer intent: As an security operations administrator, I want to use the SIEM migration so I can streamline a migration to Microsoft Sentinel to enhance my security monitoring capabilities.
---

# Migrate to Microsoft Sentinel with the SIEM migration experience

Migrate your SIEM to Microsoft Sentinel for all your security monitoring use cases. Automated assistance from the SIEM Migration experience simplifies your migration.

> [!NOTE]
> The old migration tool is deprecated. This article describes the current SIEM migration experience.

The SIEM Migration experience includes the following features:

**Splunk**

- The experience focuses on migrating Splunk security monitoring to Microsoft Sentinel and mapping out-of-the-box (OOTB) analytics rules wherever possible.
- The experience supports migration of Splunk detections to Microsoft Sentinel analytics rules.

## Prerequisites

### Microsoft Sentinel requirements

- Microsoft Sentinel in Microsoft Defender portal
- At least Contributor permissions in the Microsoft Sentinel workspace
- [Security Copilot](https://securitycopilot.microsoft.com/) enabled in your tenant with at least a workspace operator role assigned

> [!NOTE]
> Though you need [Security Copilot](https://securitycopilot.microsoft.com/) enabled in your tenant, it doesn't consume any SCUs so it doesn't incur additional costs.

## Export rules from your current SIEM

In the **Search and Reporting** app in Splunk, run the following query:

```kusto
| rest splunk_server=local count=0 /servicesNS/-/-/saved/searches | search disabled=0 | search alert_threshold != "" | table title, search, description, cron_schedule, dispatch.earliest_time, alert.severity, alert_comparator, alert_threshold, alert.suppress.period, id, eai:acl.app, actions, action.correlationsearch.annotations, action.correlationsearch.enabled | tojson | table _raw | rename _raw as alertrules | mvcombine delim=", " alertrules | append [ | rest splunk_server=local count=0 /servicesNS/-/-/admin/macros | table title,definition,args,iseval | tojson | table _raw | rename _raw as macros | mvcombine delim=", " macros ] | filldown alertrules |tail 1 
```

You need a Splunk admin role to export all Splunk alerts. For more information, see [Splunk role-based user access](https://docs.splunk.com/Documentation/Splunk/9.1.3/Security/Aboutusersandroles).

<!---
QRadar

Export your QRadar rule data as a CSV file, as explained here Exporting rules - IBM Documentation. Two notes regarding the export: 

1. The default export includes the alert rules, but not the building blocks which can carry important information. Clear any filter values for the “Rule or Building Block(BB)” to allow both the rules and the BBs to be exported. 

1. Only include the following fields in your export to avoid duplications which can lead to QRadar application freeze: 

"Rule name", "Type", "Rule enabled", "Notes", "Action details", "Response details", "Rule response: Event description", "Is rule", "Rule installed", "Rule response: Event name", "Rule: test definition", "Content extension name", "Content category" 
--->

## Start the SIEM migration experience

After exporting the rules,

1. Go to `security.microsoft.com`.

1. From the **SOC Optimization** blade
1. , select **Set up your new SIEM**.

    :::image type="content" source="./media/siem-migration/set-up-new-siem.png" alt-text="Screenshot of the Setup your new SIEM option in the top right corner of the SOC Optimization screen.":::

1. Select **migrate from current SIEM**:

    :::image type="content" source="./media/siem-migration/migrate.png" alt-text="Screenshot of the Migrate from current SIEM option.":::

1. Select *Splunk* or *QRadar* depending on your SIEM type and upload the [rules export](#export-rules-from-your-current-siem). Select **Next**.

    :::image type="content" source="./media/siem-migration/other-siem.png" alt-text="Screenshot of the Select Splunk or QRadar option.":::

    The migration tool analyzes the export and identifies the number of data sources and detection rules in the file you provided. Use this information to confirm that you have the right export. If it doesn't look correct, select **Replace file** from the top right corner and upload a new export. If it's looks good, select **Next**.

    :::image type="content" source="./media/siem-migration/confirm-siem.png" alt-text="Screenshot of the confirmation screen showing the number of data sources and detection rules.":::

1. Once the correct file is uploaded, the migration tool maps the detection rules to Microsoft Sentinel data sources and detection rules.

    :::image type="content" source="./media/siem-migration/getting-ready.png" alt-text="Screenshot of the migration tool getting ready to analyze the rules.":::

1. Refresh the page and select the **SIEM setup analysis status** to view the progress of the analysis:

    :::image type="content" source="./media/siem-migration/setup-analysis-status.png" alt-text="Screenshot of the SIEM Set-up analysis status showing the progress of the analysis.":::

    When the analysis completes, the migration tool generates use-case-based recommendations, grouped by Content Hub solutions. The recommendations appear under **SIEM Setup**.

    :::image type="content" source="./media/siem-migration/recommendations.png" alt-text="A screenshot of recommendations generated by the migration tool.":::

1. Select one of the recommendation cards to view the data sources and rules mapped.

    :::image type="content" source="./media/siem-migration/recommendation-card.png" alt-text="A screenshot of a recommendation card.":::

    The tool matches the Splunk or QRadar rules to out-of-box Microsoft Sentinel data connectors and out-of-box Microsoft Sentinel detection rules as shown in the next screenshots:

    :::image type="content" source="./media/siem-migration/connectors.png" alt-text="Screenshot of Microsoft Sentinel data connectors matched to Splunk or QRadar rules.":::

    :::image type="content" source="./media/siem-migration/detection.png" alt-text="Screenshot of Microsoft Sentinel detection rules matched to Splunk or QRadar rules.":::

   To see more information about the connections, select **View full details** from the side panel.

1. Select the rule. This action opens the rules details side panel, where you can view the rules template details.

    Enable connection: {If the data connector isn't installed and configured to stream logs, you can enable it from here by selecting **Enable connection**.}

    At the bottom of the panel, select **More actions** > **Compare with origin**.

    :::image type="content" source="./media/siem-migration/more-actions.png" alt-text="Screenshot of the More actions button in the rules wizard.":::

    The wizard shows the Splunk SPL rule and you can compare it with the Microsoft Sentinel KQL.

    :::image type="content" source="./media/siem-migration/compare-rules.png" alt-text="Screenshot of the comparison between Splunk SPL rule and Microsoft Sentinel KQL.":::

If the data connector isn't installed and configured to stream logs, *Enable detection* is disabled.

The SIEM migration tool doesn't explicitly install any connectors or enable detection rules

## Limitations

- The migration tool maps the rules export to out-of-the-box Microsoft Sentinel data connectors and detection rules.

Before step 5?
If WS has no recommendations, recommendations will be created (getting recs ready etc    )
If has recommendations

Setupanalysis status:
Select ws for analysis
 Prepare... will be chacked when done
3 checkmarks means all recommedations were created. If no recommendations seen, nothing as found migration didn't fail, but there are no matches. 
Pie chart how many detections uploaded how many matched not matched not applicable
Open to see progress. Doesn't refresh automatically. Close and open to refresh
When done, go to SIEM setup to see recommendations

Download report: Also includes what we didn't find good solution for. detailedanalysis of migration rec jobs. Inlcudinv non aplicable not detectd etc.

Detections tab #7
Current detection (second column From siem
Rec detection
Status: Not installed, not in use (intalled fro content hub but jsut template - rule not created, enabled, disabled)
Required connectors: connectors needed for rule to work. Usuually one wometimes more. If all connected, green check
If connector not connected and wamt to use, go to connectors tab and select connector and connect from connector page

If connector not downloaded from content hub(not installed), go to content hub and install the solution that contains the connector

#8 compare with origin 38 minutes

Can enable muliple ruels at once by checking boxes 

If already enabled, Edit button instead of enable detection

Tip - 
Enable from template and then edit as needed


Rule not in use: More actions button allows to create rule manally from template

View rule in content hub: Opens content hub page then decide if you want to install it.
