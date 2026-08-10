---
title: Use matching analytics to detect threats
titleSuffix: Microsoft Sentinel
description: This article explains how to detect threats with Microsoft-generated threat intelligence in Microsoft Sentinel.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted


#Customer intent: As a security operations analyst, I want to match my security data with Microsoft threat intelligence so I can generate high fidelity alerts and incidents.

---

# Use matching analytics in Microsoft Sentinel to detect threats

Use Microsoft threat intelligence to generate high-fidelity alerts and incidents. Enable the **Microsoft Defender Threat Intelligence Analytics** rule, a built-in rule in Microsoft Sentinel. This rule matches indicators with Common Event Format (CEF) logs, Windows DNS events, syslog data, and more. It checks for domain and IPv4 threat indicators across these data sources.

## Prerequisites

Install one or more supported data connectors. You don't need a premium Microsoft Defender Threat Intelligence license. To connect your data sources, install the right solutions from the **Content hub**. The following data sources are supported:

  - Common Event Format (CEF) via Legacy Agent
  - Windows DNS via Legacy Agent (Preview)
  - Syslog via Legacy Agent
  - Microsoft 365 (formerly, Office 365)
  - Azure activity logs
  - Windows DNS via AMA
  - Advanced Security Information Model (ASIM) Network sessions

  :::image type="content" source="media/use-matching-analytics-to-detect-threats/matching-analytics-template-ga.png" alt-text="A screenshot that shows the Microsoft Defender Threat Intelligence Analytics rule data source connections."::: 

  For example, depending on your data source, you might use the following solutions and data connectors:

  |Solution |Data connector  |
  |---------|---------|
  |[Common Event Format solution for Sentinel](https://azuremarketplace.microsoft.com/marketplace/apps/azuresentinel.azure-sentinel-solution-commoneventformat?tab=Overview) | [Common Event Format connector for Microsoft Sentinel](data-connectors-reference.md#syslog-and-common-event-format-cef-connectors)
  |[Windows Server DNS](https://azuremarketplace.microsoft.com/marketplace/apps/azuresentinel.azure-sentinel-solution-dns?tab=Overview)  |[DNS connector for Microsoft Sentinel](connect-dns-ama.md) |
  |[Syslog solution for Sentinel](https://azuremarketplace.microsoft.com/marketplace/apps/azuresentinel.azure-sentinel-solution-syslog?tab=Overview)  |[Syslog connector for Microsoft Sentinel](cef-syslog-ama-overview.md)  |
  |[Microsoft 365 solution for Sentinel](https://azuremarketplace.microsoft.com/marketplace/apps/azuresentinel.azure-sentinel-solution-office365?tab=Overview) | [Office 365 connector for Microsoft Sentinel](data-connectors-reference.md#microsoft-365-formerly-office-365)    |
  |[Azure Activity solution for Sentinel](https://azuremarketplace.microsoft.com/marketplace/apps/azuresentinel.azure-sentinel-solution-azureactivity?tab=Overview)    |  [Azure Activity connector for Microsoft Sentinel](data-connectors-reference.md#azure-activity)   |
  |[Windows Firewall](https://azuremarketplace.microsoft.com/marketplace/apps/azuresentinel.azure-sentinel-solution-windowsfirewall?tab=Overview)  | [Windows Firewall Events via AMA connector](data-connectors-reference.md#windows-firewall-events-via-ama)  |

## Configure the matching analytics rule

Matching analytics is configured when you enable the **Microsoft Defender Threat Intelligence Analytics** rule.

> [!IMPORTANT]
> Before you enable this rule, install at least one supported data connector and its corresponding Content hub solution. See [Prerequisites](#prerequisites) for the full list of supported data sources.

1. Under the **Configuration** section, select the **Analytics** menu.

1. Select the **Rule templates** tab.

1. In the search window, enter **threat intelligence**.

1. Select the **Microsoft Defender Threat Intelligence Analytics** rule template.

1. Select **Create rule**. The rule details are read only, and the default status of the rule is enabled.

1. Select **Review** > **Create**.

:::image type="content" source="media/use-matching-analytics-to-detect-threats/configure-matching-analytics-rule.png" alt-text="Screenshot that shows the Microsoft Defender Threat Intelligence Analytics rule enabled on the Active rules tab." lightbox="media/use-matching-analytics-to-detect-threats/configure-matching-analytics-rule.png":::

<a name="data-sources-and-indicators"></a>
## Review supported data sources and indicators

Microsoft Defender Threat Intelligence Analytics matches your logs with domain, IP, and URL indicators in the following ways:

- **CEF logs** ingested into the Log Analytics `CommonSecurityLog` table match URL and domain indicators if populated in the `RequestURL` field, and IPv4 indicators in the `DestinationIP` field.
- **Windows DNS logs**, where `SubType == "LookupQuery"` ingested into the `DnsEvents` table matches domain indicators populated in the `Name` field, and IPv4 indicators in the `IPAddresses` field.
- **Syslog events**, where `Facility == "cron"` ingested into the `Syslog` table matches domain and IPv4 indicators directly from the `SyslogMessage` field.
- **Office activity logs** ingested into the `OfficeActivity` table match IPv4 indicators directly from the `ClientIP` field.
- **Azure activity logs** ingested into the `AzureActivity` table match IPv4 indicators directly from the `CallerIpAddress` field.
- **ASIM DNS logs** ingested into the `ASimDnsActivityLogs` table match domain indicators if populated in the `DnsQuery` field, and IPv4 indicators in the `DnsResponseName` field.
- **ASIM Network Sessions** ingested into the `ASimNetworkSessionLogs` table match IPv4 indicators if populated in one or more of the following fields: `DstIpAddr`, `DstNatIpAddr`, `SrcNatIpAddr`, `SrcIpAddr`, `DvcIpAddr`.

## Triage an incident generated by matching analytics

If the **Microsoft Defender Threat Intelligence Analytics** rule finds a match, any alerts generated are grouped into incidents.

Use the following steps to triage through the incidents generated by the **Microsoft Defender Threat Intelligence Analytics** rule:

1. In the Microsoft Sentinel workspace where you enabled the **Microsoft Defender Threat Intelligence Analytics** rule, select **Incidents**, and search for *Microsoft Defender Threat Intelligence Analytics*.

    Any incidents that are found appear in the grid.

1. Select **View full details** to view entities and other details about the incident, such as specific alerts.

    Here's an example.

    :::image type="content" source="media/use-matching-analytics-to-detect-threats/matching-analytics.png" alt-text="Screenshot of incident generated by matching analytics with details pane.":::

1. Check the severity of the alerts and the incident. Alert severity ranges from `Informational` to `High` based on how the indicator is matched. For example, an indicator matched with firewall logs that allowed traffic produces a high-severity alert. The same indicator matched with firewall logs that blocked traffic produces a low or medium alert.

    Alerts are grouped by the indicator they match. For example, all alerts in a 24-hour period that match the `contoso.com` domain are grouped into one incident. The incident severity is based on the highest alert severity.

1. Observe the indicator information. When a match is found, the indicator is published to the Log Analytics `ThreatIntelligenceIndicators` table, and it appears on the **Threat Intelligence** page. For any indicators published from this rule, the source is defined as `Microsoft Threat Intelligence Analytics`.

Here's an example of the `ThreatIntelligenceIndicators` table.

:::image type="content" source="media/use-matching-analytics-to-detect-threats/matching-analytics-logs.png" alt-text="Screenshot that shows the ThreatIntelligenceIndicator table showing indicator with SourceSystem of Microsoft Threat Intelligence Analytics." lightbox="media/use-matching-analytics-to-detect-threats/matching-analytics-logs.png":::

Here's an example of searching for the indicators in the management interface.

:::image type="content" source="media/use-matching-analytics-to-detect-threats/matching-analytics-threat-intelligence.png" alt-text="Screenshot that shows the Threat Intelligence overview with indicator selected showing the source as Microsoft Threat Intelligence Analytics." lightbox="media/use-matching-analytics-to-detect-threats/matching-analytics-threat-intelligence.png":::

## Get more context from Microsoft Defender Threat Intelligence

Some Microsoft Defender Threat Intelligence indicators also include a link to a related Intel Explorer article. Use this link to get more details about the indicator.

:::image type="content" source="media/use-matching-analytics-to-detect-threats/mdti-article-link.png" alt-text="Screenshot that shows an incident with a link to the Microsoft Defender Threat Intelligence reference article.":::

For more information, see [Threat analytics in Microsoft Defender XDR](/defender-xdr/threat-analytics).

## Related content

To learn more about threat intelligence in Microsoft Sentinel, see the following articles:

- [Work with threat indicators in Microsoft Sentinel](work-with-threat-indicators.md)
- Connect Microsoft Sentinel to [STIX/TAXII threat intelligence feeds](./connect-threat-intelligence-taxii.md).
- [Connect threat intelligence platforms](./connect-threat-intelligence-tip.md) to Microsoft Sentinel.
- See which [TIP platforms, TAXII feeds, and enrichments](threat-intelligence-integration.md) can be readily integrated with Microsoft Sentinel.
