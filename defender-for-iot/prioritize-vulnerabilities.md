---
title: Prioritize and remediate vulnerabilities with Microsoft Defender for IoT in the Defender portal
description: This article describes how to prioritize and remediate vulnerabilities with Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/24/2024
ms.topic: how-to
---

# Prioritize and remediate vulnerabilities

With vulnerability management, Microsoft Defender for IoT provides extended coverage for OT networks, gathers OT device data into one place, and displays the data with the other devices on your network.

In this article, you learn how to investigate vulnerabilities and take recommended remediation actions.

Learn more about how Defender for IoT [discovers vulnerabilities](discover-vulnerabilities-overview.md).

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Investigate vulnerabilities

1. In the Defender portal, select **Endpoints > Vulnerability management > Weaknesses**.

1. Set filter settings as you need them. If device groups are created for your sites, you can use them filter the weaknesses page.

    1. Select **Filter by device groups**.
    1. Select a device group.
    1. Select **Apply**.

1. Select a CVE.

    A side panel opens with the CVE ID as the title, and the **Vulnerability details** tab visible. You can also select the **Exposed devices** and **Affected software** tabs.

    :::image type="content" source="media/weaknesses-detail-panel.png" alt-text="Screenshot of the Weaknesses page with the open Vulnerabilities detail side panel." lightbox="media/weaknesses-detail-panel.png":::

1. Select **Go to related security recommendation**.

    The **Security recommendations** page opens, filtered to show the CVE you're investigating.

    :::image type="content" source="media/recommendations-panel-remediate.png" alt-text="Screenshot of the Security recommendations page filtered for a specific CVE with remediation panel open." lightbox="media/recommendations-panel-remediate.png":::

1. Select a recommendation. A side panel opens. Do one of the following:

    - Select **Request remediation** and follow the [Request remediation instructions](/defender-vulnerability-management/tvm-remediation#request-remediation). This sends a request to the relevant team to perform the remediation.
    - Select **Exception options** and fill in the details. For more information, see [justification for an exception](/defender-vulnerability-management/tvm-security-recommendation.md#explore-security-recommendation-options). To complete, select **Submit**.

    :::image type="content" source="media/create-exception.png" alt-text="Screenshot of the exception form in the remediation panel of the Security recommendations page for a specific CVE." lightbox="media/create-exception.png":::
