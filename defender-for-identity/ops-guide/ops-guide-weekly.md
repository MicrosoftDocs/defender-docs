---
title: Weekly operational guide - Microsoft Defender for Identity
description: Learn about the Microsoft Defender for Identity activities that we recommend for your team on a weekly basis.
ms.date: 06/15/2026
ms.topic: how-to
ms.reviewer: martin77s
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Weekly operational guide - Microsoft Defender for Identity

This article reviews the Microsoft Defender for Identity activities we recommend for your team on a weekly basis. These tasks include reviewing Secure Score recommendations, responding to emerging threats with custom detections, and proactively hunting for threats. Performing these checks each week helps security administrators and SOC analysts identify identity-related risks early and maintain a strong security posture.

## Review Secure score recommendations

**Where**: In Microsoft Defender, select **Secure score**.

**Persona**: Security and compliance administrators, SOC analysts

Microsoft Secure Score shows security recommendations that matter most to your organization. For Defender for Identity, these recommendations focus on monitoring on-premises identities and weak points in your identity infrastructure.

To view Secure Score recommendations per product, in Microsoft Defender, select **Secure score > Recommended actions**, and group the list by **Product**.

For more information, see:

- [Microsoft Defender for Identity's security posture assessments](../security-assessment.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

## Review and respond to emerging threats

**Where**: In Microsoft Defender, select **Hunting > Advanced hunting**

**Persona**: Security and compliance administrators, SOC analysts

We recommend that you configure custom detections in Microsoft Defender to monitor and respond to various events and system states, such as suspected breach activity and misconfigured endpoints.

Custom detection rules use advanced hunting queries. They can trigger alerts and response actions automatically. Run these rules regularly to stay on top of new alerts and take action.

For more information, see:

- [Custom detections overview](/microsoft-365/security/defender/custom-detections-overview)
- [Create and manage custom detections rules](/microsoft-365/security/defender/custom-detection-rules)

## Proactively hunt

**Where**: In Microsoft Defender, select **Hunting > Advanced hunting**.

**Persona**: SOC analysts

You might want to proactively hunt on a daily or weekly basis, depending on your level as a SOC analyst.

Use Microsoft Defender advanced hunting to proactively explore through the last 30 days of raw data, including Defender for Identity data correlated with data streaming from other Microsoft Defender services.

Inspect events in your network to locate threat indicators and entities, including both known and potential threats.

We recommend that beginners use guided advanced hunting, which provides a query builder. If you're comfortable using Kusto Query Language (KQL), build queries from scratch as needed for your investigations.

For more information, see [Proactively hunt for threats with advanced hunting in Microsoft Defender](/microsoft-365/security/defender/advanced-hunting-overview).

## Related content

For more information, see:

- [Microsoft Defender Security operations overview](/security/operations/overview)
- [Microsoft Defender for Identity operational guide](ops-guide.md)
- [Daily operational guide - Microsoft Defender for Identity](ops-guide-daily.md)
- [Monthly operational guide - Microsoft Defender for Identity](ops-guide-monthly.md)
- [Quarterly / Ad hoc operational guide - Microsoft Defender for Identity](ops-guide-quarterly.md)
