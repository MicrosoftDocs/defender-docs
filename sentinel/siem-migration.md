---
title: Use the SIEM migration experience
titleSuffix: Microsoft Sentinel
description: Migrate security monitoring use cases from other Security Information and Event Management (SIEM) systems to Microsoft Sentinel.
ms.author: monaberdugo
author: mberdugo
ms.reviewer: yohasson
ms.topic: how-to
ms.date: 07/01/2026
ai-usage: ai-assisted
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
ms.custom: msecd-doc-authoring-1016

#Customer intent: As an security operations administrator, I want to use the SIEM migration so I can streamline a migration to Microsoft Sentinel to enhance my security monitoring capabilities.
---

# Migrate to Microsoft Sentinel with the SIEM migration experience

The SIEM migration tool analyzes Splunk and QRadar detections, including custom detections, and recommends best-fit Microsoft Sentinel detections and Defender XDR native detections. It also provides recommendations for data connectors, both Microsoft and third-party connectors available in Content Hub to enable the recommended detections. You can track migration by assigning the right status to each recommendation card.

The SIEM Migration experience includes the following features:

- The experience focuses on migrating Splunk and QRadar security monitoring to Microsoft Sentinel and mapping out-of-the-box (OOTB) analytics rules wherever possible.
- The experience supports migration of Splunk and QRadar detections to Microsoft Sentinel analytics rules.

## Prerequisites

- [Microsoft Sentinel in Microsoft Defender portal](/unified-secops/microsoft-sentinel-onboard#onboard-microsoft-sentinel)
- At least [Microsoft Sentinel Contributor](/azure/role-based-access-control/built-in-roles#microsoft-sentinel-contributor) permissions in the Microsoft Sentinel workspace
- <a href="/copilot/security/get-started-security-copilot" target="_blank">[Security Copilot](/defender-xdr/security-copilot-in-microsoft-365-defender)</a> enabled in your tenant with at least a [workspace operator role](/copilot/security/authentication#assign-security-copilot-access) assigned

> [!NOTE]
>The SIEM Migration tool is powered by [Security Copilot](https://securitycopilot.microsoft.com/), so you need Security Copilot enabled in your tenant to use the SIEM Migration tool. However, the SIEM Migration tool doesn't consume SCUs or generate any SCU‑based charges no matter how you configure Security Copilot. You can optimize your Security Copilot setup based on your preferences for access and cost management, and workflow remains completely SCU‑free. Any SCU usage would apply only to other Security Copilot features you intentionally use.
>
> :::image type="content" source="./media/siem-migration/monitor-usage.png" alt-text="Screenshot of the Security Copilot usage monitoring settings.":::

## Export detection rules from your current SIEM

Export your existing detection rules from your current SIEM so the SIEM migration experience can analyze them.

### [Splunk](#tab/splunk)

In the **Search and Reporting** app in Splunk, run the following query:

```kusto
| rest splunk_server=local count=0 /servicesNS/-/-/saved/searches | search disabled=0 | search alert_threshold != "" | table title, search, description, cron_schedule, dispatch.earliest_time, alert.severity, alert_comparator, alert_threshold, alert.suppress.period, id, eai:acl.app, actions, action.correlationsearch.annotations, action.correlationsearch.enabled | tojson | table _raw | rename _raw as alertrules | mvcombine delim=", " alertrules | append [ | rest splunk_server=local count=0 /servicesNS/-/-/admin/macros | table title,definition,args,iseval | tojson | table _raw | rename _raw as macros | mvcombine delim=", " macros ] | filldown alertrules |tail 1 
```

You need a Splunk admin role to export all Splunk alerts. For more information, see [Splunk role-based user access](https://docs.splunk.com/Documentation/Splunk/9.1.3/Security/Aboutusersandroles).

### [QRadar](#tab/qradar)

Use the QRadar migration data collector script to export your QRadar detection rules and building blocks to a CSV file that the SIEM migration experience can analyze.

Before you start, make sure you have:

- Python 3 installed on the machine where you'll run the script. The latest stable release is recommended.
- A QRadar authorized service token with Admin privileges. For more information, see [Creating authorized service tokens in IBM QRadar](https://www.ibm.com/docs/qradar-common?topic=configuration-creating-authorized-service-token).
- Network access from the script machine to your QRadar console.

1. In the SIEM migration experience, select **QRadar**, then select **Download script**.
1. Save `qradar_collector.py` to the machine where you'll run it.
1. From a terminal, run the script with your QRadar console hostname or IP address:

    ```bash
    python3 qradar_collector.py --host <qradar-host-or-ip>
    ```

    If `python3` isn't recognized, use the Python command for your environment, such as `python`.

1. When prompted, enter your QRadar authorized service token. The token input is hidden. Don't include the token in the command line.
1. When the script finishes, upload the generated `qradar_rules_YYYYMMDDHHMMSS.csv` file in the SIEM migration experience, then select **Next**.

For more information about the QRadar migration data collector script and its parameters, see the [QRadar migration data collector README](https://github.com/Azure/Azure-Sentinel/tree/master/Tools/QRadarMigration).

#### Troubleshoot QRadar exports

If the script fails and you need a workaround, manually export QRadar rules as a CSV file by using [Exporting rules - IBM Documentation](https://go.microsoft.com/fwlink/?linkid=2332524).

When you export manually:

1. Clear any filter values for *Rule or Building Block(BB)* so the export includes both rules and building blocks.

1. Include only the supported fields:

   "Rule name", "Type", "Rule enabled", "Notes", "Action details", "Response details", "Rule response: Event description", "Is rule", "Rule installed", "Rule response: Event name", "Rule: test definition", "Content extension name", "Content category"

Manual exports can produce less accurate migration results than the collector script because the script enriches and normalizes QRadar data for migration analysis.

---

## Start the SIEM migration experience

After exporting the rules, do the following:

1. Go to `security.microsoft.com`.

1. From the **SOC Optimization** tab, select **Set up your new SIEM**.

    :::image type="content" source="./media/siem-migration/set-up-new-siem.png" alt-text="Screenshot of the Setup your new SIEM option in the top right corner of the SOC Optimization screen.":::

1. Select **Migrate from your current SIEM**:

    :::image type="content" source="./media/siem-migration/migrate.png" alt-text="Screenshot of the Migrate from current SIEM option.":::

1. Select the SIEM you're migrating from.

    :::image type="content" source="./media/siem-migration/select-siem.png" alt-text="Screenshot of the UI asking the user to select the SIEM they're migrating from.":::

1. Upload the configuration data that you exported (see [Export detection rules from your current SIEM](#export-detection-rules-from-your-current-siem)) and select **Next**.

    The migration tool analyzes the export and identifies the number of data sources and detection rules in the file you provided. Use this information to confirm that you have the right export.

    If the data doesn't look correct, select **Replace file** from the top right corner and upload a new export. When the correct file is uploaded, select **Next**.

    :::image type="content" source="./media/siem-migration/confirm-siem.png" alt-text="Screenshot of the confirmation screen showing the number of data sources and detection rules.":::

1. Select a workspace, then select **Start Analyzing**.

    :::image type="content" source="./media/siem-migration/select-workspace.png" alt-text="Screenshot of the UI asking the user to select a workspace.":::

    The migration tool maps the detection rules to Microsoft Sentinel data sources and detection rules. If there are no recommendations in the workspace, recommendations are created. If there are existing recommendations, the SIEM migration tool deletes and replaces them with new ones.

    :::image type="content" source="./media/siem-migration/getting-ready.png" alt-text="Screenshot of the migration tool getting ready to analyze the rules.":::

1. Refresh the page and select the **SIEM setup analysis status** to view the progress of the analysis:

    :::image type="content" source="./media/siem-migration/setup-analysis-status.png" alt-text="Screenshot of the SIEM Set-up analysis status showing the progress of the analysis.":::

    The SIEM setup analysis status page doesn't refresh automatically. To see the latest status, close and reopen the page.

    The analysis is complete when all three check marks are green. If the three checkmarks are green but there are no recommendations, it means that no matches were found for your rules.

    :::image type="content" source="./media/siem-migration/status-complete.png" alt-text="Screenshot showing all three check marks green indicating analysis is complete.":::

    When the SIEM migration analysis completes, the migration tool generates use-case-based recommendations, grouped by Content Hub solutions. You can also download a detailed report of the analysis. The report contains a detailed analysis of recommended migration jobs, including Splunk and QRadar rules that don't have a good match, weren't detected, or aren't applicable.

    :::image type="content" source="./media/siem-migration/recommendations.png" alt-text="A screenshot of recommendations generated by the migration tool." lightbox="./media/siem-migration/recommendations.png":::

    Filter *recommendation type* by *SIEM Setup* to see migration recommendations.

1. Select one of the recommendation cards to view the data sources and rules mapped.

    :::image type="content" source="./media/siem-migration/recommendation-card.png" alt-text="A screenshot of a recommendation card." lightbox="./media/siem-migration/recommendation-card.png":::

    The SIEM migration tool matches Splunk and QRadar rules to out-of-box Microsoft Sentinel data connectors, out-of-box Microsoft Sentinel detection rules, and Defender XDR native detections.
    The *connectors* tab shows the data connectors matched to the rules from your SIEM and the status (connected or not disconnected). If the connector you want to use isn't already connected, you can connect from the connector tab. If a connector isn't installed, go to the Microsoft Sentinel Content hub and install the solution that contains the connector you want to use.

    :::image type="content" source="./media/siem-migration/connectors.png" alt-text="Screenshot of Microsoft Sentinel data connectors matched to Splunk or QRadar rules.":::

    The *detections* tab shows the following information:

    - Recommendations from the SIEM migration tool.
    - The current Splunk or QRadar detection rule from your uploaded file.
    - The product, which indicates whether the matched detection is a Microsoft Sentinel detection rule or a Defender XDR native detection.
    - The status of the detection rule in Microsoft Sentinel. The status can be:
        - *Enabled*: The detection rule is created from the rule template, enabled, and active (from a previous action)
        - *Disabled*: The detection rule is installed from the Content Hub but not enabled in the Microsoft Sentinel workspace
        - *Not in use*: The detection rule was installed from Content Hub and is available as a template to be enabled
        - *Not installed*: The detection rule wasn't installed from the Content Hub
    - The required connectors that need to be configured to bring the logs required for the recommended detection rule. If a required connector isn't available, there's a side panel with a wizard to install it from the Content Hub. If all required connectors are connected, a green check mark appears.

    :::image type="content" source="./media/siem-migration/detection.png" alt-text="Screenshot of Microsoft Sentinel detection rules matched to Splunk or QRadar rules." lightbox="./media/siem-migration/detection.png":::

## Enable detection rules

After reviewing the matched results, you can enable the recommended Microsoft Sentinel detection rules or review Defender XDR native detections.

### [Microsoft Sentinel detection rules](#tab/sentinel-detection-rules)

When you select a recommended detection rule, the rule details side panel opens and you can view the rule template details.

:::image type="content" source="./media/siem-migration/rule-details.png" alt-text="Screenshot of the rule details side panel." lightbox="./media/siem-migration/rule-details.png":::

- If the associated data connector is installed and configured, select **Enable detection** to enable the detection rule.

    :::image type="content" source="./media/siem-migration/enable-detection.png" alt-text="Screenshot of the Enable detection button in the rule details side panel." lightbox="./media/siem-migration/enable-detection.png":::

- Select **More actions** > **Create manually** to open the analytics rules wizard so you can review and edit the rule before enabling it.
- If the rule is already enabled, select **Edit** to open the analytics rules wizard to review and edit the rule.

    :::image type="content" source="./media/siem-migration/more-actions.png" alt-text="Screenshot of the More actions button in the rules wizard.":::

    The wizard shows the Splunk SPL rule and you can compare it with the Microsoft Sentinel KQL.

    :::image type="content" source="./media/siem-migration/compare-rules.png" alt-text="Screenshot of the comparison between Splunk SPL rule and Microsoft Sentinel KQL.":::

> [!TIP]
> Instead of creating rules manually from scratch, consider enabling the rule from the template and then editing the rule as needed.

*Enable detection* is only enabled if the data connector is installed and configured to stream logs.

- You can enable several rules at once by selecting the check boxes next to each rule you want to enable and then selecting **Enable selected detections** at the top of the page.

    :::image type="content" source="./media/siem-migration/enable-multiple-rules.png" alt-text="Screenshot of the list of rules in the detection tab with checkboxes next to them." lightbox="./media/siem-migration/enable-multiple-rules.png":::

The SIEM migration tool doesn't explicitly install any connectors or enable detection rules.

### [Defender XDR native detections](#tab/defender-xdr-native-detections)

Defender XDR native detections are built-in detection logic that generate alerts, which are then correlated into incidents. The SIEM migration tool maps Splunk and QRadar rules to these native detections. Matched Defender XDR native detections are in active status. Defender XDR native detections don't require Microsoft Sentinel data connectors to be installed, configured, and connected.

:::image type="content" source="./media/siem-migration/defender-detections.png" alt-text="Screenshot of the list of matched Defender XDR native detections." lightbox="./media/siem-migration/defender-detections.png":::

Select a matched Defender XDR rule to view full details. You won't see matching KQL because Defender XDR native detections use built-in detection logic.

:::image type="content" source="./media/siem-migration/defender-matched-rules.png" alt-text="Screenshot of the details side panel for a Defender XDR native detection." lightbox="./media/siem-migration/defender-matched-rules.png":::

---

## Limitations

The migration tool maps the rules export to out-of-the-box Microsoft Sentinel data connectors and detection rules.
