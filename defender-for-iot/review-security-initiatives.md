---
title: Review security initiatives with Microsoft Defender for IoT in the Defender portal
description: This article describes how to review security initiatives with Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 11/17/2024
ms.topic: how-to
---

# Review security initiatives

[Security initiatives](/security-exposure-management/exposure-insights-overview#security-initiatives) offer a focused, metric-driven way of tracking exposure in specific security areas using security initiatives.

Microsoft Defender for IoT in the Defender portal allows you to review Microsoft Security Exposure Management security initiatives dedicated to OT and enterprise IoT device protection.

In this article, you learn how to review security initiatives so that your security teams can prioritize, discover, and validate OT-related security findings across your sites.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## OT Security initiative

The **OT Security** initiative improves your OT site security posture by monitoring and protecting OT environments in the organization, and employing network layer monitoring. This initiative identifies devices and ensures that systems are working correctly, and data is protected.

Your security teams can use the **OT Security** initiative to:

- Identify unprotected devices.
- Harden posture across sites through vulnerability assessments, with actionable guidance to help remediate at-risk devices.

## Enterprise IoT Security initiative

The **Enterprise IoT Security** initiative allows you to identify unmanaged IoT devices and enhance your organization's security. With continuous monitoring, vulnerability assessments, and tailored recommendations specifically designed for enterprise IoT devices, you gain comprehensive visibility into the risks posed by these devices. This initiative not only helps you understand the potential threats but also strengthens your organization's resilience in mitigating them.

Review the full [security initiatives catalog](/security-exposure-management/initiatives-list).

## Prerequisites

- Review the Defender for IoT [prerequisites](prerequisites.md).
- Review the [prerequisites for the **OT Security** initiative](#prerequisites-for-ot-security-initiative).
    
### Prerequisites for OT Security initiative

When you view the **OT security** initiative, if you haven't yet onboarded Defender for IoT and set up sites, the **More data is required to support this initiative** section is displayed.

:::image type="content" source="media/review-security-initiatives/more-data-required.png" alt-text="Screenshot showing the **More data is required to support this initiative** section in Microsoft Defender for IoT in the Microsoft Defender portal.":::

If the **More data is required to support this initiative** section is displayed:

1. Review the **Unprotected OT devices** metric to understand the impact on your network. For example, the **Unprotected OT devices** metric shows 24 affected assets.

    :::image type="content" source="media/review-security-initiatives/unprotected-ot-devices.png" alt-text="Screenshot showing the Unprotected OT devices metric **Overview** tab in Microsoft Defender for IoT in the Microsoft Defender portal.":::

1. Select **Get started with Microsoft Defender for IoT** and follow the procedure to [onboard Defender for IoT in the Defender portal](get-started.md).

1. Select **create new sites** to [set up sites](set-up-sites.md).

## Review initiatives

1. Follow the procedure to [open the Initiatives page and review an initiative](/security-exposure-management/initiatives#view-initiatives-page).
1. For the **OT Security** initiative, if you haven't yet onboarded Defender for IoT and set up sites, the **More data is required to support this initiative** section is displayed. In this case, see the [prerequisites for the OT Security initiative](#prerequisites-for-ot-security-initiative).

1. Review the data in the initiative page, including the initiative score, top metrics, and more (learn more about [initiatives](/security-exposure-management/exposure-insights-overview)). For example, this **OT Security** initiative page shows an initiative score of 83%, and shows that 61.9% of the detected OT devices are protected.

    :::image type="content" source="media/review-security-initiatives/ot-security-initiative.png" alt-text="Screenshot showing the OT Security initiative in Microsoft Defender for IoT in the Microsoft Defender portal." lightbox="media/review-security-initiatives/ot-security-initiative.png":::

1. Select the metric from the **Top metrics** area in the initiative page or from the **Related metrics** area in the small overview. 
    - Review the **Overview** tab to drill down into additional security data and recommendations, including the weight of the metrics, affected assets, and score impact. For example, the **Unprotected OT devices** metric shows 24 affected assets, and 3.81 score impact.

    - Review the recommendations in the **Security recommendations** tab. For example, for the **Site-linked devices using insecure protocols** metric, you're recommended to disable the Telnet administration protocol, and remove the SNMP V1 and SNMP V2 administration protocols.
    
        :::image type="content" source="media/review-security-initiatives/security-recommendations.png" alt-text="Screenshot showing the **Security recommendations** tab for a metric in Microsoft Defender for IoT in the Microsoft Defender portal.":::

    Learn more about [working with metrics](/security-exposure-management/exposure-insights-overview#working-with-metrics).

## Next steps

[Learn about vulnerabilities](discover-vulnerabilities-overview.md) or proceed to [investigate and remediate vulnerabilities](prioritize-vulnerabilities.md).