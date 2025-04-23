---
title: Understand the analyst report section in threat analytics in Microsoft Defender XDR
ms.reviewer: 
description: Learn about the analyst report section of each threat analytics report. Understand how it provides information about threats, mitigations, detections, advanced hunting queries, and more.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords:
- NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-ta
- seo-marvel-apr2020
ms.date: 10/18/2024
---

# Understand the analyst report in threat analytics in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender XDR

[!INCLUDE [Prerelease](../includes/prerelease.md)]

Each [threat analytics report](threat-analytics.md) includes dynamic sections and a comprehensive written section called the _analyst report_. To access this section, open the report about the tracked threat and select the **Analyst report** tab.

:::image type="content" source="/defender/media/threat-analytics/ta_analystreport_mtp.png" alt-text="The analyst report section of a threat analytics report" lightbox="/defender/media/threat-analytics/ta_analystreport_mtp.png":::

_Analyst report section of a threat analytics report_

## Know the different analyst report types
A threat analytics report can be classified under one of the following report types:
- **Activity profile** – Provides information on a specific attack campaign that's often associated with a threat actor. This report discusses how an attack happened, why should you care about it, and how Microsoft protects its customers from it. An activity profile might also include details like timeline of events, attack chains, and behaviors and methodologies.
- **Actor profile** – Provides information about a specific Microsoft-tracked threat actor behind notable cyberattacks. This report discusses the actor's motivations, industry and/or geographical targets, and their tactics, techniques, and procedures (TTPs). An actor profile might also include information about the actor's attack infrastructure, malware (custom or open source) and exploits they used, and notable events or campaigns that they were part of.
- **Technique profile** – Provides information about a specific technique used by threat actors—for example, malicious use of PowerShell or credential harvesting in business email compromise (BEC)—and how Microsoft protects its customers by detecting activity associated with the technique.
- **Threat overview** – Summarizes multiple profile reports into a narrative that paints a broader picture of a threat that uses or is related to these reports. For example, threat actors use different techniques to steal on-premise credentials, and a threat overview about on-premise credential theft might link to technique profiles on brute-force attacks, Kerberos attacks, or information-stealing malware. Microsoft Threat Intelligence uses their sensors on the top threats affecting customer environments to assess which threat might merit this report type.
- **Tool profile** – Provides information about a specific custom or open-source tool that's often associated with a threat actor. This report discusses the tool's capabilities, the goals the threat actor using it might be trying to accomplish, and how Microsoft protects its customers by detecting activity associated with it. 
- **Vulnerability profile** – Provides information about a specific Common Vulnerabilities and Exposures (CVE) ID or group of similar CVEs affecting a product. A vulnerability profile typically discusses noteworthy vulnerabilities, such as those being used by threat actors and notable attack campaigns. It covers one or more of the following types of information: type of vulnerability, impacted services, zero-day or in-the-wild exploitation, severity score and potential impact, and Microsoft's coverage.

## Scan the analyst report

Each section of the analyst report is designed to provide actionable information. While reports vary, most reports include the sections described in the following table.

| Report section | Description |
|--|--|
| Executive summary | Snapshot of the threat, which might include when it was first seen, its motivations, notable events, major targets, and distinct tools and techniques. You can use this information to further assess how to prioritize the threat in the context of your industry, geographic location, and network. |
| Overview | Technical analysis about the threat, which, depending on the report type, might include the details of an attack and how attackers might use a new technique or attack surface.<br><br>This section also has different headings and further subsections, depending on the report type, to provide more context and details. For example, a vulnerability profile has a separate section that lists **Impacted technologies**, while an actor profile might include **Tools and TTPs** and **Attribution** sections. |
| Detections/Hunting queries | Specific and generic [detections](#understand-how-each-threat-can-be-detected) provided by Microsoft security solutions that can surface activity or components associated with the threat. <br><br>This section also provides [hunting queries](#find-subtle-threat-artifacts-using-advanced-hunting) for proactively identifying possible threat activity. Most queries are provided to supplement detections, especially for locating potentially malicious components or behaviors that couldn't be dynamically assessed to be malicious. |
| MITRE ATT&CK techniques observed | How observed techniques map to the [MITRE ATT&CK attack framework](https://attack.mitre.org/) |
| [Recommendations](#apply-additional-mitigations) | Actionable steps that can stop or help reduce the impact of the threat. This section also includes mitigations that aren't tracked dynamically as part of the threat analytics report. |
| References | Microsoft and third-party publications referenced by analysts during the creation of the report. Threat analytics content is based on data validated by Microsoft researchers. Information from publicly available, third-party sources are identified clearly as such. |
| Change log | The time the report was published and when significant changes were made to the report. |

## Understand how each threat can be detected

The analyst report also provides information from various Microsoft solutions that can help detect the threat. It lists detections specific to this threat from each of the products listed in the following sections, as applicable. Alerts from these threat-specific detections show up in the alert status cards of the Threat analytics page. 

Some analyst reports also mention alerts that are designed to generically flag suspicious behavior and might not be associated with the tracked threat. In such cases, the report will clearly state that the alert can be triggered by unrelated threat activity and that it isn't monitored in the status cards provided in the Threat analytics page.


### Microsoft Defender Antivirus

Antivirus detections are available on devices with  [Microsoft Defender Antivirus in Windows](/defender-endpoint/microsoft-defender-antivirus-windows) turned on. These detections are linked to their respective malware encyclopedia descriptions in the [Microsoft Security Intelligence](https://www.microsoft.com/en-us/wdsi/threats/), when available.

### Microsoft Defender for Endpoint 

Endpoint detection and response (EDR) alerts are raised for devices onboarded to [Microsoft Defender for Endpoint](/defender-endpoint/onboard-configure). These alerts rely on security signals collected by the Defender for Endpoint sensor and other endpoint capabilities—such as antivirus, network protection, tamper protection—that serve as powerful signal sources.

### Microsoft Defender for Office 365 

Detections and mitigations from [Defender for Office 365](/defender-office-365/mdo-about) are also included in analyst reports. Defender for Office 365 is a seamless integration into Microsoft 365 subscriptions that protects against threats in email, links (URLs), file attachments, and collaboration tools.

### Microsoft Defender for Identity

[Defender for Identity](/defender-for-identity/what-is) is a cloud-based security solution that helps secure your identity monitoring across your organization. It uses signals from both on-premises Active Directory and cloud identities to help you better identify, detect, and investigate advanced threats directed at your organization.

### Microsoft Defender for Cloud Apps

[Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps) delivers full protection for SaaS applications, helping you monitor and protect your cloud app data, using fundamental cloud access security broker (CASB) functionality, SaaS Security Posture Management (SSPM) features, advanced threat protection, and app-to-app protection.

### Microsoft Defender for Cloud

[Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction) is a cloud-native application protection platform (CNAPP) made up of security measures and practices that are designed to protect cloud-based applications from various threats and vulnerabilities.  


## Find subtle threat artifacts using advanced hunting

While detections allow you to identify and stop the tracked threat automatically, many attack activities leave subtle traces that require more inspection. Some attack activities exhibit behaviors that can also be normal, so detecting them dynamically can result in operational noise or even false positives. Hunting queries let you proactively locate these potentially malicious components or behaviors.

### Microsoft Defender XDR advanced hunting queries

[Advanced hunting](advanced-hunting-overview.md) provides a query interface based on Kusto Query Language that simplifies locating subtle indicators of threat activity. It also lets you surface contextual information and verify whether indicators are connected to a threat.

Advanced hunting queries in the analyst reports have been vetted by Microsoft analysts and are ready for you to run in the [advanced hunting query editor](https://security.microsoft.com/advanced-hunting). You can also use the queries to create [custom detection rules](custom-detection-rules.md) that trigger alerts for future matches.

### Microsoft Sentinel queries

Analyst reports could also include applicable [hunting queries for Microsoft Sentinel customers](/azure/sentinel/hunting?tabs=azure-portal). 

Microsoft Sentinel has powerful hunting search and query tools to hunt for security threats across your organization's data sources. To help you look proactively for new anomalies that aren't detected by your security apps or even by your scheduled analytics rules, Sentinel hunting queries guide you into asking the right questions to find issues in the data you already have on your network.


## Apply additional mitigations

Threat analytics dynamically tracks the status of certain [security updates](threat-analytics.md#endpoints-exposure-know-the-deployment-status-of-security-updates) and [secure configurations](threat-analytics.md#recommended-actions-review-list-of-mitigations-and-the-status-of-your-devices). These types of information are available as charts and tables in the **Endpoints exposures** and **Recommended actions** tabs, and are repeatable recommendations that apply to this threat and might apply to other threats, too.

In addition to these tracked recommendations, the analyst report could also discuss mitigations that are *not* dynamically monitored because they're specific to just the threat or situation being discussed in the report. Here are some examples of important mitigations that aren't dynamically tracked:

- Block emails with _.lnk_ attachments or other suspicious file types
- Randomize local administrator passwords
- Educate end users about phishing email and other threat vectors
- Turn on specific [attack surface reduction rules](/defender-endpoint/attack-surface-reduction/)

While you can use the **Endpoints exposures** and **Recommended actions** tabs to assess your security posture against a threat, these recommendations let you take other steps towards improving your security posture. Carefully read all the mitigation guidance in the analyst report and apply them whenever possible.

## See also

- [Threat analytics overview](threat-analytics.md)
- [Proactively find threats with advanced hunting](advanced-hunting-overview.md)
- [Custom detection rules](custom-detection-rules.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
