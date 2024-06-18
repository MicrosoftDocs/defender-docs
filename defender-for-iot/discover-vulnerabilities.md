---
title: Discover vulnerabilties with Microsoft Defender for IoT in XDR Defender portal
description: This article describes how to discover vulnerabilities in the Site security feature of Microsoft Defender for IoT in XDR Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Discover vulnerabilities

The Security administrator uses the list of detected vulnerabilities to create recommendations that are send to IT administrators to remediate.
  
The Microsoft Defender portal displays Microsoft Defender for IoT security vulnerabilities in the **Weaknesses** page of the Endpoints navigation menu. The **Weaknesses** page lists the detected security vulnerabilities across all devices, endpoints, applications and other sources on your network.

Vulnerabilities are listed based on their publicly registered Common Vulnerabilitiy and Exposures(CVEs) ID. The public registry of CVEs can be accessed from [https://www.cve.org/](https://www.cve.org/).  

The Weaknesses page lists each CVE and gives it a severity rating, a CVSS score (10 is most severe), and lists the number of exposed devices. Use the metrics to prioritize dealing with these security vulnerabilities.
The Weaknesses page is found in the Vulnerability management section of the Endpoints menu.

For more details, see [Weaknesses page in the Microsoft Defender Vulnerabiltiiy Management](/defender-vulnerability-management/tvm-weaknesses.md).

## Investigate vulnerabiltites

1. In the Defender portal, go to **Endpoints > Vulnerability managemenr > Weaknesses**.

1. Set filter settings as you need them.

1. Select a CVE name and the Vulnerabiltity details open in the side panel.

    The panel also displays the **Exposed devices** and **Affected software** tabs. Examine the details in the pane and decide which security recommendations to act on.

    :::image type="content" source="media/weaknesses-detail-panel.png" alt-text="Screenshot of the Weaknesses page with the open Vulnerabilities detail side panel.":::

1. Select the **Go to related security recommenations** button. The Security recommendations page opens filtered for the CVE ID you were investigating.

1. Select a recommendation. The side panel opens.

    1. Select **Request remediation** and then follow the [Request mediation instructions](/defender-vulnerability-management/tvm-remediation#request-remediation).

    Or
    1. Select **Exception options**, fill out the form and select **Submit**.

    :::image type="content" source="media/recommendations-panel-remediate.png" alt-text="Screenshot of the Security recommendations page filtered for a specific CVE with remediation panel open.":::

## Apply recommendations

for more info see [remediations](/defender-vulnerability-management/tvm-remediation)
