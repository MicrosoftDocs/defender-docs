---
title: Access indicators in threat analytics in Microsoft Defender (preview)
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
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.topic: how-to
ms.custom: 
- cx-ti
- cx-ta
ms.date: 11/03/2025
---

# Get access to IOCs in threat analytics in Microsoft Defender (preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender XDR

[!INCLUDE [Prerelease](../includes/prerelease.md)]

Each [threat analytics report](threat-analytics.md) includes an *indicators* section that lists all indicators of compromise (IOCs) associated with the threat. Microsoft researchers update these IOCs in real time as they find new evidence related to the threat. This information helps your security operations center (SOC) and threat intelligence analysts with remediation and proactive hunting. The list also retains expired IOCs, so you can investigate past threats and understand their impact in your environment.

Because IOCs are valuable information in the context of prevalent threats and threat campaigns, only verified Microsoft Defender customers can access them. This article explains how you can check if you have access to the indicators section and how you unlock it if you don't.

## View IOCs in threat analytics
To access the indicators section, go to the **Threat analytics** page, open the report about the tracked threat, and select the **Indicators** tab.

If you're a verified customer, you can immediately see the list of IOCs displayed in this section.

:::image type="content" source="/defender-xdr/media/ta-indicators/indicators-full.png" alt-text="Screenshot of the Indicators tab in a threat analytics report." lightbox="/defender-xdr/media/ta-indicators/indicators-full.png":::

Otherwise, the page informs you that access to indicators is restricted. 

:::image type="content" source="media/threat-analytics-indicators/indicators-restricted.png" alt-text="Screenshot of a restricted Indicators tab in a threat analytics report." lightbox="media/threat-analytics-indicators/indicators-restricted.png":::

## Unlock access to indicators
To unlock the indicators section, follow these steps:

1. On the **Indicators** page, select **Complete Verification**
1. On the verification page that opens, provide the required information and supporting documents, if applicable
1. Select **Submit verification request**

The verification process might take at least an hour. After the process completes, refresh the **Indicators** tab. If your tenant is validated successfully, you see the list of IOCs displayed in this section.

>[!NOTE]
>In some cases, we might require additional information during the verification process. We communicate these requirements through email.

If you still don't have access to the **Indicators** section after going through the verification process, contact the email address displayed on the page.

:::image type="content" source="media/threat-analytics-indicators/indicators-contact.png" alt-text="Screenshot of a restricted Indicators tab in a threat analytics report showing the email address to contact." lightbox="media/threat-analytics-indicators/indicators-contact.png":::

## See also

- [Threat analytics overview](threat-analytics.md)
- [Understand the analyst report section](threat-analytics-analyst-reports.md)
- [Proactively find threats with advanced hunting](advanced-hunting-overview.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]