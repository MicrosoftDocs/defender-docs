---
title: Weekly operational guide - Microsoft Defender for Identity
description: Learn about the Microsoft Defender for Identity activities that we recommend for your team on a weekly basis.
ms.date: 01/29/2024
ms.topic: how-to
---

# Weekly operational guide - Microsoft Defender for Identity

This article reviews the Microsoft Defender for Identity activities we recommend for your team on a weekly basis.

## Review Secure score recommendations

**Where**: In Microsoft Defender XDR, select **Secure score**.

**Persona**: Security and compliance administrators, SOC analysts

Microsoft Secure score recommendations are based on the Microsoft security recommendations that are most relevant to your organization. Secure score recommendations for Defender for Identity include monitoring for on-premises identities and identity infrastructure weak points.

To view Secure Score recommendations per product, in Microsoft Defender XDR, select **Secure score > Recommended actions**, and group the list by **Product**.

For more information, see:

- [Microsoft Defender for Identity's security posture assessments](../security-assessment.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

## Review and respond to emerging threats

**Where**: In Microsoft Defender XDR, select **Hunting > Advanced hunting**

**Persona**: Security and compliance administrators, SOC analysts

We recommend that you configure custom detections in Microsoft Defender XDR to monitor and respond to various events and system states, such as suspected breach activity and misconfigured endpoints.

Custom detection rules can automatically trigger both alerts and response actions, and are based on advanced hunting queries. Run your custom detection rules regularly to generate alerts and take relevant response actions.

For more information, see:

- [Custom detections overview](/microsoft-365/security/defender/custom-detections-overview)
- [Create and manage custom detections rules](/microsoft-365/security/defender/custom-detection-rules)

## Proactively hunt

**Where**: In Microsoft Defender XDR, select **Hunting > Advanced hunting**.

**Persona**: SOC analysts

You might want to proactively hunt on a daily or weekly basis, depending on your level as a SOC analyst.

Use Microsoft Defender XDR advanced hunting to proactively explore through the last 30 days of raw data, including Defender for Identity data correlated with data streaming from other Microsoft Defender XDR services.

Inspect events in your network to locate threat indicators and entities, including both known and potential threats.

We recommend that beginners use guided advanced hunting, which provides a query builder. If you're comfortable using Kusto Query Language (KQL), build queries from scratch as needed for your investigations.

For more information, see [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/microsoft-365/security/defender/advanced-hunting-overview).

## Related content

For more information, see:

- [Microsoft Defender XDR Security operations overview](/security/operations/overview)
- [Microsoft Defender for Identity operational guide](ops-guide.md)
- [Daily operational guide - Microsoft Defender for Identity](ops-guide-daily.md)
- [Monthly operational guide - Microsoft Defender for Identity](ops-guide-monthly.md)
- [Quarterly / Ad hoc operational guide - Microsoft Defender for Identity](ops-guide-quarterly.md)
