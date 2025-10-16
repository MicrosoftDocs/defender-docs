---
title: Access indicators in threat analytics in Microsoft Defender XDR (preview)
ms.reviewer: 
description: Learn about the indicators section of each threat analytics report and how to get access to it
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords:
- NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: how-to
ms.custom: 
- cx-ti
- cx-ta
ms.date: 10/22/2025
---

# Get access to IOCs in threat analytics in Microsoft Defender XDR (preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender XDR

[!INCLUDE [Prerelease](../includes/prerelease.md)]

Each [threat analytics report](threat-analytics.md) includes an *indicators* section that lists all indicators of compromise (IOCs) associated with the threat. These IOCs are updated in real time as Microsoft researchers find new evidence related to the threat, aiding your security operations center (SOC) and threat intelligence analysts in remediation and proactive hunting. The list also retains expired IOCs, offering you historical hunting capabilities to investigate past threats and understand their impact in your environment.

Because IOCs are valuable information in the context of prevalent threats and threat campaigns, only verified Microsoft Defender customers can access to them. This article provides information on how you can check if you have access to the indicators section and how you unlock them if you don't.

## Check if you have access to indicators
To access the indicators section, in the **Threat analytics** page, open the report about the tracked threat and select the **Indicators** tab.

If you're a verified customer, you can immediately see the list of IOCs displayed in this section. The tab also displays a green check icon next to it.

[Screenshot]

Otherwise, the page informs you that access to indicators is restricted. The tab also displays a warning icon next to it.

[Screenshot]

## Unlock access to indicators
To unlock the indicators section, follow these steps:

1. Select **Start verification**.
2. On the **Tenant verification** page, provide the details required information and supporting documents, if applicable.

   [Screenshot]

3. Select **Submit verification request**.

The verification process might take at least an hour, after which, you can check and refresh the **Indicators** tab. If your account was validated successfully, you should now see the list of IOCs displayed in this section.

If you still don't have access to the indicators section even after going through the validation process, contact the email address displayed on the page.

[Screenshot]

## See also

- [Threat analytics overview](threat-analytics.md)
- [Understand the analyst report section](threat-analytics-analyst-reports.md)
- [Proactively find threats with advanced hunting](advanced-hunting-overview.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]