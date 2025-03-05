---
title: Microsoft Defender for Endpoint reports
description: Access the various reports for devices, protection features, and more in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
ms.topic: conceptual
search.appverid: met150
ms.date: 2/04/2025
---

# Microsoft Defender for Endpoint reports

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

This article provides an overview of the reports available to Microsoft Defender for Endpoint users. It offers information on various reports that can be used to collect data, summarize findings, and obtain recommended actions when applicable.

## Monthly security summary

The **monthly security summary** report helps organizations get a visual summary of key findings and overall preventative actions taken to enhance the organization's overall security posture completed in the last 30 or 90 days. It helps you identify areas of strength and improvement, track your progress over time, and prioritize your actions based on risk and impact. 

To access this report, navigate to **Reports > Endpoints > Monthly Security Summary**. The monthly security summary report contains the following sections:

| Section  | Description |
|---------|---------|
| [Microsoft Secure Score](/defender-xdr/microsoft-secure-score) | Microsoft Secure Score is a measurement of an organization's security posture and how well you have implemented security best practices and recommendations across the devices in your organization. The secure score card shows how the overall cybersecurity strength of an organization has improved in the past month and how it compares to other companies with similar number of managed devices. |
|Secure score compared to other organizations | This score is an evaluation of an organization's security score in relation to organizations of a similar size. It's a way to benchmark an organization's performance in implementing security measures compared to other organizations of an equivalent size. |
| Devices onboarded | The devices card provides information on the number of devices that were onboarded in the last month as well as devices still not onboarded. Onboarding devices are essential for enabling protection and detection capabilities. |
| Protection against specific threats | This card shows how effective your defenses are against common attack vectors such as phishing and ransomware. A higher number indicates better defense in place against phishing and ransomware. The report shows how many threats were blocked or mitigated in the last month and how your protection level has increased. |
| Web content monitoring and filtering | Shows the number of malicious URLs that were blocked by Microsoft Defender for Endpoint in the last month. The report also shows the categories of URLs that were blocked and the number of clicks for each category. |
| Suspicious or malicious activities | Track how many incidents and alerts were resolved in the past month using the incidents card. The card also shows all active incidents and alerts that require attention. You'll also be able to see a list of the top 10 severe incidents, their status, number of alerts, and the impacted devices and users. |

You can generate a PDF report of the summary, by selecting **Generate PDF report**. The generated report is a summary of the last 30 days.

## Threat protection report

To gather data on Defender for Endpoint threat protection information, you can use the Microsoft Defender portal's alerts queue or create advanced hunting queries. The following sections provide guidance on how to use these tools to find the information you need.

### Use the alert queue filter in the Microsoft Defender portal

You can use the Microsoft Defender portal alerts view, using Defender for Endpoint as the **detection source**, to see the current status of alerts for protected devices. Use the **Status** filter to see *New*, *In progress*, and *Resolved* alerts. [Learn more about the alerts queue](/defender-xdr/investigate-alerts).

### Use advanced hunting queries

You can also use advanced hunting queries to find Defender for Endpoint threat protection information. [Learn more about advanced hunting in Defender XDR](/defender-xdr/advanced-hunting-overview). The following sample advanced hunting queries show alert-related information.

#### Alert information by severity, detection source, and category

```kusto
// Severity
AlertInfo
| where Timestamp > startofday(now()) // Today
| summarize count() by Severity
| render columnchart

// Detection source
AlertInfo
| where Timestamp > startofday(now()) // Today
| summarize count() by DetectionSource
| render columnchart

// Detection category
AlertInfo
| where Timestamp > startofday(now()) // Today
| summarize count() by Category
| render columnchart
```

#### Alert trends by severity, detection source, and category

```kusto
// Severity
AlertInfo
| where Timestamp > ago(30d)
| summarize count() by Severity , bin(Timestamp, 1d)
| render timechart

// Detection source
AlertInfo
| where Timestamp > ago(30d)
| summarize count() by DetectionSource , bin(Timestamp, 1d)
| render timechart

// Detection category
AlertInfo
| where Timestamp > ago(30d)
| summarize count() by Category , bin(Timestamp, 1d)
| render timechart
```

## Reports about Defender for Endpoint capabilities

The following reports provide in-depth information about events and actions related to Defender for Endpoint capabilities:

- [Device health reports](device-health-reports.md)
  - [Microsoft Defender Antivirus health report](device-health-microsoft-defender-antivirus-health.md)
  - [Sensor health & OS report](device-health-sensor-health-os.md)
- [Host firewall reporting](host-firewall-reporting.md)
- [Web protection monitoring report](web-protection-monitoring.md)
- [Attack surface reduction rules report](attack-surface-reduction-rules-report.md)
- [Device control report](device-control-report.md)

## Create custom reports using Power BI

You can also create customized reports using Power BI. To create your own report, see [Create custom reports using Power BI](/defender-endpoint/api/api-power-bi).

## Aggregated reporting

You can review all signals collected by Defender for Endpoint by turning on aggregated reporting.

To turn aggregated reporting on, go to **Settings > Endpoints > Advanced features**. Toggle on the **Aggregated reporting** feature. Learn more about [aggregated reporting in Defender for Endpoint](/defender-endpoint/aggregated-reporting).

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
