---
title: Use the SIEM migration experience
titleSuffix: Microsoft Sentinel
description: Migrate security monitoring use cases from other Security Information and Event Management (SIEM) systems to Microsoft Sentinel. 
author: mberdugo
ms.topic: how-to
ms.date: 9/23/2025
ms.author: monaberdugo
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
    - 
#Customer intent: As an security operations administrator, I want to use the SIEM migration so I can streamline a migration to Microsoft Sentinel to enhance my security monitoring capabilities.
---

# Migrate to Microsoft Sentinel with the SIEM migration experience

Migrate your SIEM to Microsoft Sentinel for all your security monitoring use cases. Automated assistance from the SIEM Migration experience simplifies your migration.

> [!NOTE]
> The old migration tool is deprecated. This article describes the current SIEM migration experience.

The SIEM Migration experience currently includes the following features: 

**Splunk**
- The experience focuses on migrating Splunk security monitoring to Microsoft Sentinel and mapping out-of-the-box (OOTB) analytics rules wherever possible.
- The experience supports migration of Splunk detections to Microsoft Sentinel analytics rules, including mapping Splunk data sources and lookups.

## Prerequisites

### Microsoft Sentinel requirements

- Microsoft Sentinel must be onboarded to the Microsoft Defender portal
- At least Security Admin permissions at the tenant level
- Copilot enabled in your tenant

### Splunk requirements

In the **Search and Reporting** app in Splunk, run the following query:

```
| rest splunk_server=local count=0 /servicesNS/-/-/saved/searches | search disabled=0 | search alert_threshold != "" | table title, search, description, cron_schedule, dispatch.earliest_time, alert.severity, alert_comparator, alert_threshold, alert.suppress.period, id, eai:acl.app, actions, action.correlationsearch.annotations, action.correlationsearch.enabled | tojson | table _raw | rename _raw as alertrules | mvcombine delim=", " alertrules | append [ | rest splunk_server=local count=0 /servicesNS/-/-/admin/macros | table title,definition,args,iseval | tojson | table _raw | rename _raw as macros | mvcombine delim=", " macros ] | filldown alertrules |tail 1 
```

- You need a Splunk admin role to export all Splunk alerts. For more information, see [Splunk role-based user access](https://docs.splunk.com/Documentation/Splunk/9.1.3/Security/Aboutusersandroles).

<!---
QRadar

Export your QRadar rule data as a CSV file, as explained here Exporting rules - IBM Documentation. Two notes regarding the export: 

1. The default export includes the alert rules, but not the building blocks which can carry important information. Clear any filter values for the “Rule or Building Block(BB)” to allow both the rules and the BBs to be exported. 

1. Only include the following fields in your export to avoid duplications which can lead to QRadar application freeze: 

"Rule name", "Type", "Rule enabled", "Notes", "Action details", "Response details", "Rule response: Event description", "Is rule", "Rule installed", "Rule response: Event name", "Rule: test definition", "Content extension name", "Content category" 
--->


SCUs
Doesn't cost SCUs

## Start the SIEM migration experience

After obtaining the rules export, use the feature flag URL provided to login into [https://security.microsoft.com/sentinel/precision?flight=PrecisionRedesign](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsecurity.microsoft.com%2Fsentinel%2Fprecision%3Fflight%3DPrecisionRedesign&data=05%7C02%7Cmmwaura%40microsoft.com%7C9ca1c4a2a9e444102d7808dddfea314e%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638912919272517602%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=LQgGzTHedB58lwGTVIt6jt8%2BJ7tbzq0INvwVjkL8D0A%3D&reserved=0)

1. From the on the SOC Optimization blade select **Set up your new SIEM**.

    :::image type="content" source="./media/siem-migration/set-up-new-siem.png" alt-text="Screenshot of the Set up your new SIEM option in the top right corner of the SOC Optimization blade.":::

1. Select migrate from current SIEM:

    :::image type="content" source="./media/siem-migration/migrate.png" alt-text="Screenshot of the Migrate from current SIEM option.":::

1. Select *Splunk* or *QRadar* depending on your SIEM type and upload the rules export. Click next.

    :::image type="content" source="./media/siem-migration/other-siem.png" alt-text="Screenshot of the Select Splunk or QRadar option.":::

    The migration tool analyzes the export and identifies the number of data sources and detection rules in the file you provided. Use this to confirm that you have the right export.

    :::image type="content" source="./media/siem-migration/confirm-siem.png" alt-text="Screenshot of the confirmation screen showing the number of data sources and detection rules.":::

1. Select **Start analyzing**. The migration tool will start mapping the detection rules to Microsoft Sentinel data sources and detection rules.

    :::image type="content" source="./media/siem-migration/getting-ready.png" alt-text="Screenshot of the migration tool getting ready to analyze the rules.":::

1. Refresh the page and click on the SIEM Set-up analysis status to view the progress of the analysis:

    :::image type="content" source="./media/siem-migration/setup-analysis-status.png" alt-text="Screenshot of the SIEM Set-up analysis status showing the progress of the analysis.":::

    Once the analysis is completed, the migration tool generates use-case-based recommendations, grouped by Content Hub solutions. The recommendations are under SIEM Setup.

    :::image type="content" source="./media/siem-migration/recommendations.png" alt-text="A screenshot of recommendations generated by the migration tool.":::

1. Select one of the recommendations cards to view the data sources and rules mapped.

    :::image type="content" source="./media/siem-migration/recommendation-card.png" alt-text="A screenshot of a recommendation card.":::

    The tool matches the Splunk or QRadar rules to out-of-box Microsoft Sentinel data connectors and out-of-box Microsoft Sentinel detection rules as shown in the next screenshots:

    :::image type="content" source="./media/siem-migration/connectors.png" alt-text="Screenshot of Microsoft Sentinel data connectors matched to Splunk or QRadar rules.":::

    :::image type="content" source="./media/siem-migration/detection.png" alt-text="Screenshot of Microsoft Sentinel detection rules matched to Splunk or QRadar rules.":::

1. Select the rule. This opens the rules wizard, and you can view the rules template details.

  At the bottom of the wizard, select **More actions** > **Compare with origin**.

   :::image type="content" source="./media/siem-migration/more-actions.png" alt-text="Screenshot of the More actions button in the rules wizard.":::

   The wizard shows the Splunk SPL rule and you can compare it with the Microsoft Sentinel KQL.

   :::image type="content" source="./media/siem-migration/compare-rules.png" alt-text="A screenshot of a computer AI-generated content may be incorrect.":::

If the matched Microsoft Sentinel rule is correct for your use case, proceed to create the rule.

If the data connector is not configured, the option will be greyed out.

The migration does not explicitly install any connectors or rules.

## Limitations

- The migration tool currently works with out-of-box Splunk or QRadar rules.
- The migration tool maps the rules export to Out of box Microsoft Sentinel data connectors and Detection rules.
