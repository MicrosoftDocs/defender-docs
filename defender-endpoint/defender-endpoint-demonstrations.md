---
title: Microsoft Defender for Endpoint demonstration scenarios
description: Lists Microsoft Defender for Endpoint demonstration scenarios that you can run.
search.appverid: met150
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.reviewer: yongrhee
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
- demo
ms.topic: article
ms.subservice: ngp
ms.date: 10/16/2024
---

# Microsoft Defender for Endpoint - demonstration scenarios

**Applies to:**

- [Microsoft Defender Antivirus](microsoft-defender-antivirus-windows.md)
- [Microsoft Defender for Endpoint Plan 1 or 2](microsoft-defender-endpoint.md)
- Microsoft Defender for Servers
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)
- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)

Demonstration scenarios help you learn about the capabilities of Microsoft Defender for Endpoint on Windows, Mac, and Linux. Demonstration scenarios are provided for the following Microsoft Defender for Endpoint protection areas:

- Attack surface protection (**ASR**)
- Next Generation Protection (**NGP**)
- Endpoint detection and response (**EDR**)

:::image type="content" source="media/microsoft-defender-for-endpoint-cloud-protection.png" alt-text="Shows the areas of Microsoft Defender for Endpoint demonstration scenarios covered in this collection" lightbox="media/microsoft-defender-for-endpoint-cloud-protection.png":::

> [!NOTE]
> None of the sample files or _suspicious_ links provided in this collection are actually malicious; all links and demonstration files are harmless.
>
> We encourage you to read [Microsoft Defender Antivirus documentation](next-generation-protection.md), and to download the [Evaluation guide](evaluate-microsoft-defender-antivirus.md).

## Demonstrations

The following table lists the available demonstrations alphabetically, with their associated protection area.

| Demonstration name | Protection area | Description |
|---|---|---|
| [AMSI demonstrations](mde-demonstration-amsi.md) | NGP | Confirm that an AMSI script is detected and blocked. |
|[Antimalware validation](validate-antimalware.md)| NGP |Confirm that antivirus/antimalware is detecting and blocking malware. |
| [Attack surface reduction rules demonstrations](defender-endpoint-demonstration-attack-surface-reduction-rules.md)| ASR | Download sample files to trigger each ASR rule. |
|[App reputation demonstration](defender-endpoint-demonstration-app-reputation.md)| NGP | Navigate to the app reputation page to see the demonstration scenario using Microsoft Edge.|
|[Behavior Monitoring demonstration](demonstration-behavior-monitoring.md)| NGP |Confirm that behavior monitoring is detecting and blocking malware. |
|[Cloud-delivered protection demonstration](defender-endpoint-demonstration-cloud-delivered-protection.md)| NGP |Confirm that cloud-delivered protection is working properly on your computer. |
| [Controlled folder access (CFA) demonstration (block script)](defender-endpoint-demonstration-controlled-folder-access-test-tool.md)| ASR | Download the CFA test tool. |
| [Controlled folder access (CFA) demonstrations (block ransomware)](defender-endpoint-demonstration-controlled-folder-access.md)|  ASR| Download and execute a sample file to trigger CFA ransomware protection.|
|[Endpoint Detection and Response (EDR) detections](edr-detection.md)| EDR |Confirm that EDR is detecting cyber threats such as malware.|
| [Exploit protection (EP) demonstrations](defender-endpoint-demonstration-exploit-protection.md) | ASR | Apply custom exploit protection settings. |
| [Network protection demonstrations](defender-endpoint-demonstration-network-protection.md)| ASR | Navigate to a suspicious URL to trigger network protection. |
|[Potentially unwanted applications (PUA) demonstration](defender-endpoint-demonstration-potentially-unwanted-applications.md)| NGP |Confirm that potentially unwanted applications (PUAs) are being blocked on your network by downloading a fake (safe) PUA file. |
|[URL reputation demonstrations](defender-endpoint-demonstration-smartscreen-url-reputation.md)| NGP | Navigate to the URL Reputation page to see the demonstration scenarios using Microsoft Edge. |

## See also

[Attack surface protection overview](overview-attack-surface-reduction.md)
[Test attack surface reduction rules](attack-surface-reduction-rules-deployment-test.md)
[Next Generation Protection overview](next-generation-protection.md)
[Endpoint detection and response overview](overview-endpoint-detection-response.md)
[Microsoft Defender for Endpoint security blog](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/bg-p/MicrosoftDefenderATPBlog)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
