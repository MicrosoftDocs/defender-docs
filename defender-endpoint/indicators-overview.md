---
title: Overview of indicators in Microsoft Defender for Endpoint
description: Create indicators for a file hash, IP address, URLs, or domains that define the detection, prevention, and exclusion of entities.
ms.service: defender-endpoint
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
ms.reviewer: ericlaw
audience: ITPro
ms.collection: 
- m365-security
- tier2
- mde-edr
ms.topic: concept-article
ms.subservice: edr
search.appverid: met150
ms.date: 04/08/2025
---

# Overview of indicators in Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](defender-endpoint-plan-1.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

## Indicator of compromise (IoC) overview

An Indicator of compromise (IoC) is a forensic artifact observed on the network or host. An IoC indicates--with high confidence--that a computer or network intrusion has occurred. IoCs are observable, which links them directly to measurable events. Some IoC examples include:

- hashes of known malware
- signatures of malicious network traffic
- URLs or domains that are known malware distributors

To halt other compromise or prevent breaches of known IoCs, successful IoC tools should be able to detect all malicious data that is enumerated by the tool's rule set. IoC matching is an essential feature in every endpoint protection solution. This capability gives SecOps the ability to set a list of indicators for detection and for blocking (prevention and response).

Organizations can create indicators that define the detection, prevention, and exclusion of IoC entities. You can define the action to be taken as well as the duration for when to apply the action, and the scope of the device group to apply it to.

This video shows a walkthrough of creating and adding indicators:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=a4469df9-4f31-4ed0-9577-8b26ac5293ad]

### About Microsoft indicators

As a general rule, you should only create indicators for known bad IoCs, or for any files / websites that should be explicitly allowed in your organization. For more information on the types of sites that Defender for Endpoint can block by default, see [Microsoft Defender SmartScreen overview](/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview).

A false positive (FP) refers to a false positive in Microsoft's threat intelligence. If a given resource is not actually a threat, you can create an Allow IoC to allow the resource. You can also help drive improvements to Microsoft's security intelligence by submitting false positives, and suspicious or known-bad IoCs for analysis. If a warning or block is incorrectly shown for a file or application, or if you suspect an undetected file is malware, you can submit a file to Microsoft for review. For more information, see [Submit files for analysis](https://www.microsoft.com/en-us/wdsi/filesubmission/).

#### IP/URL/Domain indicators

You can use IP and URL/Domain indicators to manage site access.

To block connections to an IP address, type the IPv4 address in dotted-quad form (e.g. `8.8.8.8`). For IPv6 addresses, specify all 8 segments (e.g. `2001:4860:4860:0:0:0:0:8888`). Note that wildcards and ranges are not supported.

To block connections to a domain and any of its subdomains, specify the domain (e.g. `example.com`). This indicator will match `example.com` as well as `sub.example.com` and `anything.sub.example.com`.

To block a specific URL path, specify the URL path (e.g. `https://example.com/block`). This indicator will match resources under the `/block` path on `example.com`. Note that HTTPS URL paths will only be matched in Microsoft Edge; HTTP URL paths can be matched in any browser.

You can also create IP and URL indicators to unblock users from a SmartScreen block or selectively bypass web content filtering blocks of sites that you'd like to allow to load. For example, consider a case where you have web content filtering set to block all social media websites. However, the marketing team has a requirement to use a specific social media site to monitor their ad placements. In this case, you can unblock the specific social media site by creating a domain Allow indicator and assigning it to the marketing team's device group.

See [Web protection](web-protection-overview.md) and [Web content filtering](web-content-filtering.md)

## IP/URL Indicators: Network protection and the TCP three-way handshake

With network protection, the determination of whether to allow or block access to a site is made after the completion of the [three-way handshake via TCP/IP](/troubleshoot/windows-server/networking/three-way-handshake-via-tcpip). Thus, when a site is blocked by network protection, you might see an action type of `ConnectionSuccess` under `NetworkConnectionEvents` in the Microsoft Defender portal, even though the site was blocked. `NetworkConnectionEvents` are reported from the TCP layer, and not from network protection. After the three-way handshake has completed, access to the site is allowed or blocked by network protection.

Here's an example of how that works:

1. Suppose that a user attempts to access a website on their device. The site happens to be hosted on a dangerous domain, and it should be blocked by network protection.  

2. The three-way handshake via TCP/IP commences. Before it completes, a `NetworkConnectionEvents` action is logged, and its `ActionType` is listed as `ConnectionSuccess`. However, as soon as the three-way handshake process completes, network protection blocks access to the site. All of this happens quickly. A similar process occurs with [Microsoft Defender SmartScreen](/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview); it's when the three-way handshake completes that a determination is made, and access to a site is either blocked or allowed.

3. In the Microsoft Defender portal, an alert is listed in the [alerts queue](alerts-queue.md). Details of that alert include both `NetworkConnectionEvents` and `AlertEvents`. You can see that the site was blocked, even though you also have a `NetworkConnectionEvents` item with the ActionType of `ConnectionSuccess`.

#### File hash indicators

In some cases, creating a new indicator for a newly identified file IoC - as an immediate stop-gap measure - might be appropriate to block files or even applications. However, using indicators to attempt to block an application might not provide the expected results as applications are typically composed of many different files. The preferred methods of blocking applications are to use [Windows Defender Application Control (WDAC)](/windows/security/threat-protection/windows-defender-application-control/wdac-and-applocker-overview) or AppLocker.

Because each version of an application has a different file hash, using indicators to block hashes isn't recommended.  

[Windows Defender Application Control (WDAC)](/windows/security/threat-protection/windows-defender-application-control/select-types-of-rules-to-create)

#### Certificate indicators

You may create an IoC to allow or block files and applications signed by that certificate. Certificate indicators can be supplied in the .CER or .PEM file format. See [Create indicators based on certificates](indicator-certificates.md) for more details.

## IoC detection engines

Currently, the supported Microsoft sources for IoCs are:

- [Cloud detection engine](#cloud-detection-engine) of Defender for Endpoint
- [Automated investigation and remediation (AIR) engine](#automated-investigation-and-remediation-engine) in Microsoft Defender for Endpoint
- [Endpoint prevention engine](#endpoint-prevention-engine) (Microsoft Defender Antivirus)

## Cloud detection engine

The cloud detection engine of Defender for Endpoint regularly scans collected data and tries to match the indicators you set. When there's a match, action is taken according to the settings you specified for the IoC.

## Endpoint prevention engine

The same list of indicators is honored by the prevention agent. Meaning, if Microsoft Defender Antivirus is the primary antivirus configured, the matched indicators are treated according to the settings. For example, if the action is *block and remediate*, Microsoft Defender Antivirus prevents file executions and a corresponding alert appears. On the other hand, if the Action is set to *Allow*, Microsoft Defender Antivirus doesn't detect or block the file.

## Automated investigation and remediation engine

The automated investigation and remediation behave similarly to the endpoint prevention engine. If an indicator is set to *Allow*, automated investigation and remediation ignores a *bad* verdict for it. If set to *Block*, automated investigation and remediation treats it as *bad*.

The `EnableFileHashComputation` setting computes the file hash during file scans. It supports IoC enforcement against hashes belonging to trusted applications. It's concurrently enabled with the allow or block file setting. `EnableFileHashComputation` is enabled manually through Group Policy, and is disabled by default.

## Enforcement types for Indicators 

When your security team creates a new indicator (IoC), the following actions are available:

- **Allow**: the IoC is allowed to run on your devices.
- **Audit**: an alert is triggered when the IoC runs.
- **Warn**: the IoC prompts a warning that the user can bypass
- **Block execution**: the IoC isn't allowed to run.
- **Block and remediate**: the IoC isn't allowed to run and a remediation action is applied to the IoC.

> [!NOTE]
> Using Warn mode prompts users with a warning if they open a risky app or website. The prompt doesn't block them from allowing the application or website to run, but you can provide a custom message and links to a company page that describes appropriate usage of the app. Users can still bypass the warning and continue to use the app if necessary. For more information, see [Govern apps discovered by Microsoft Defender for Endpoint](/defender-cloud-apps/mde-govern).

You can create an indicator for:

- [Files](indicator-file.md)
- [IP addresses](indicator-ip-domain.md)
- [URLs/domains](indicator-ip-domain.md)
- [Certificates](indicator-certificates.md)

The table below shows which actions are available per indicator (IoC) type:

| IoC type | Available actions |
|:---|:---|
| [Files](indicator-file.md) | Allow <br> Audit <br> Warn <br> Block execution <br> Block and remediate |
| [IP addresses](indicator-ip-domain.md) | Allow <br> Audit <br> Warn <br> Block execution |
| [URLs and domains](indicator-ip-domain.md) | Allow <br> Audit <br> Warn <br> Block execution |
| [Certificates](indicator-certificates.md) | Allow <br> Block and remediate |

The functionality of preexisting IoCs doesn't change. However, the indicators are renamed to match the currently-supported response actions:

- The *alert only* response action was renamed to *audit* with the generated alert setting enabled.
- The *alert and block* response was renamed to *block and remediate* with the optional generate alert setting.

The IoC API schema and the threat IDs in Advanced Hunting are updated to align with the renaming of the IoC response actions. The API scheme changes apply to all IoC Types.

> [!NOTE]
> There is a limit of 15,000 indicators per tenant. Increases to this limit are not supported.
> 
> File and certificate indicators do not block [exclusions defined for Microsoft Defender Antivirus](/windows/security/threat-protection/microsoft-defender-antivirus/configure-exclusions-microsoft-defender-antivirus). Indicators are not supported in Microsoft Defender Antivirus when it is in passive mode.
> 
> The format for importing new indicators (IoCs) has changed according to the new updated actions and alerts settings. We recommend downloading the new CSV format that can be found at the bottom of the import panel.
>
> If indicators are synced to the Microsoft Defender portal from Microsoft Defender for Cloud Apps for sanctioned or unsanctioned applications, the `Generate Alert` option is enabled by default in the Microsoft Defender portal. If you try to clear the `Generate Alert` option for Defender for Endpoint, it is re-enabled after some time because the Defender for Cloud Apps policy overrides it.

## Known issues and limitations

Microsoft Store apps cannot be blocked by Microsoft Defender because they're signed by Microsoft.

Customers might experience issues with alerts for IoCs. The following scenarios are situations where alerts aren't created or are created with inaccurate information. Each issue is investigated by our engineering team.

- **Block indicators**: Generic alerts with informational severity only are created. Custom alerts (that is, custom title and severity) aren't fired in these cases.
- **Warn indicators**: Generic alerts and custom alerts are possible in this scenario; however, the results aren't deterministic due to an issue with the alert detection logic. In some cases, customers might see a generic alert, whereas a custom alert might show in other cases.
- **Allow**: No alerts are generated (by design).
- **Audit**: Alerts are generated based on the severity provided by the customer (by design).
- In some cases, alerts coming from EDR detections might take precedence over alerts stemming from antivirus blocks, in which case an information alert is generated.

## Related articles

- [Exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
- [Create contextual IoC](respond-file-alerts.md#add-indicator-to-block-or-allow-a-file)
- [Use the Microsoft Defender for Endpoint indicators API](api/ti-indicator.md)
- [Use partner integrated solutions](partner-applications.md)


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
