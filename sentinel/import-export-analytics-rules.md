---
title: Import and export Microsoft Sentinel analytics rules
description: Export Microsoft Sentinel analytics rules to ARM templates and import them into other workspaces or tenants to manage and control your deployments as code.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: how-to
ms.date: 06/15/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014

#Customer intent: As a security engineer, I want to export and import analytics rules using ARM templates so that I can manage and control my Microsoft Sentinel deployments as code.

---

# Export and import analytics rules to and from ARM templates

>[!IMPORTANT]
> [**Custom detections**](/defender-xdr/custom-detections-overview?toc=/azure/sentinel/TOC.json&bc=/azure/sentinel/breadcrumb/toc.json) is now the best way to create new rules across Microsoft Sentinel SIEM Microsoft Defender XDR. With custom detections, you can reduce ingestion costs, get unlimited real-time detections, and benefit from seamless integration with Defender XDR data, functions, and remediation actions with automatic entity mapping. For more information, read [Custom detections are now the unified experience for creating detections in Microsoft Defender XDR](https://techcommunity.microsoft.com/blog/microsoftthreatprotectionblog/custom-detections-are-now-the-unified-experience-for-creating-detections-in-micr/4463875).

> [!IMPORTANT]
> Exporting and importing rules is in **PREVIEW**. See the [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) for additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

<a name="introduction"></a>
## How ARM template export and import works for analytics rules

You can now export your analytics rules to Azure Resource Manager (ARM) template files, and import rules from these files, as part of managing and controlling your Microsoft Sentinel deployments as code. The export action will create a JSON file (named *Azure_Sentinel_analytic_rule.json*) in your browser's downloads location, that you can then rename, move, and otherwise handle like any other file.

The exported JSON file is workspace-independent, so it can be imported to other workspaces and even other tenants. As code, it can also be version-controlled, updated, and deployed in a managed CI/CD framework.

The file includes all the parameters defined in the analytics rule, so for **Scheduled** rules it includes the underlying query and its accompanying scheduling settings, the severity, incident creation, event- and alert-grouping settings, assigned MITRE ATT&CK tactics, and more. Any type of analytics rule - not just **Scheduled** - can be exported to a JSON file.

## Export rules

Perform the following steps to export an analytics rule to an ARM template file:

1. From the Microsoft Sentinel navigation menu, select **Analytics**.

1. Select the rule you want to export and click **Export** from the bar at the top of the screen.

    :::image type="content" source="./media/import-export-analytics-rules/export-analytics-rule.png" alt-text="Export analytics rule" lightbox="./media/import-export-analytics-rules/export-analytics-rule.png":::

    > [!NOTE]
    > - You can select multiple analytics rules at once for export by marking the check boxes next to the rules and clicking **Export** at the end.
    >
    > - You can export all the rules on a single page of the display grid at once, by marking the check box in the header row (next to **SEVERITY**) before clicking **Export**. You can't export more than one page's worth of rules at a time, though.
    >
    > - Be aware that in this scenario, a single file (named *Azure_Sentinel_analytic_**rules**.json*) will be created, and will contain JSON code for all the exported rules.

## Import rules

Perform the following steps to import an analytics rule from an ARM template file:

1. Have an analytics rule ARM template JSON file ready.

1. From the Microsoft Sentinel navigation menu, select **Analytics**.

1. Click **Import** from the bar at the top of the screen. In the resulting dialog box, navigate to and select the JSON file representing the rule you want to import, and select **Open**.

    :::image type="content" source="./media/import-export-analytics-rules/import-analytics-rule.png" alt-text="Import analytics rule" lightbox="./media/import-export-analytics-rules/import-analytics-rule.png":::

    > [!NOTE]
    > You can import **up to 50** analytics rules from a single ARM template file.

## Next steps

You can export and import analytics rules to and from ARM templates to manage your Microsoft Sentinel deployments as code.
- Learn more about [analytics rules](detect-threats-built-in.md), including [custom scheduled rules](detect-threats-custom.md).
- Learn more about [ARM templates](/azure/azure-resource-manager/templates/overview).
