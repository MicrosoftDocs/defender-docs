---
title: Access indicators in threat analytics in Microsoft Defender (preview)
ms.reviewer: 
description: Learn about the indicators section of each threat analytics report and how to get access to it
ms.service: defender-xdr
ms.subservice: adv-hunting
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier1
ms.topic: how-to
ms.custom:
- msecd-doc-authoring-1014
- cx-ti
- cx-ta
ms.date: 07/02/2026
ai-usage: ai-assisted
---

# Get access to IOCs in threat analytics in Microsoft Defender (preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender XDR

[!INCLUDE [Prerelease](../includes/prerelease.md)]

Each [threat analytics report](threat-analytics.md) includes an *indicators* section that lists all indicators of compromise (IOCs) associated with the threat. Microsoft researchers update these IOCs in real time as they find new evidence related to the threat. These IOCs and their real-time updates help your security operations center (SOC) and threat intelligence analysts with remediation and proactive hunting. The list also retains expired IOCs, so you can investigate past threats and understand their impact in your environment.

Because IOCs are valuable information in the context of prevalent threats and threat campaigns, only verified Microsoft Defender customers can access them. This article explains how you can check if you have access to the indicators section and how you unlock it if you don't.

## View IOCs in threat analytics
To access the indicators section, go to the **Threat analytics** page, open the report about the tracked threat, and select the **Indicators** tab.

If you're a verified customer, you can immediately see the list of IOCs displayed in the **Indicators** tab.

:::image type="content" source="/defender-xdr/media/ta-indicators/indicators-full.png" alt-text="Screenshot of the Indicators tab in a threat analytics report." lightbox="/defender-xdr/media/ta-indicators/indicators-full.png":::

If you're not a verified customer, the **Indicators** tab displays a message that access to indicators is restricted. 

:::image type="content" source="media/threat-analytics-indicators/indicators-restricted.png" alt-text="Screenshot of a restricted Indicators tab in a threat analytics report." lightbox="media/threat-analytics-indicators/indicators-restricted.png":::

## Unlock access to indicators
To unlock the **Indicators** tab, complete these steps:

1. On the **Indicators** page, select **Complete Verification**.
1. Provide the required information and any supporting documents.
1. Select **Submit verification request**.

Verification can take an hour or more. After it completes, refresh the **Indicators** tab. If your tenant is validated, the list of IOCs appears.

>[!NOTE]
>In some cases, we might require additional information during the verification process. We communicate these requirements through email.

If you still don't have access to the **Indicators** section after going through the verification process, contact the email address displayed on the **Indicators** page.

:::image type="content" source="media/threat-analytics-indicators/indicators-contact.png" alt-text="Screenshot of a restricted Indicators tab in a threat analytics report showing the email address to contact." lightbox="media/threat-analytics-indicators/indicators-contact.png":::

<a name="see-also"></a>
## Related content

- [Threat analytics overview](threat-analytics.md)
- [Understand the analyst report section](threat-analytics-analyst-reports.md)
- [Proactively find threats with advanced hunting](advanced-hunting-overview.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]