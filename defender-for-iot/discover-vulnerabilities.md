---
title: Discover vulnerabilities with Microsoft Defender for IoT in Defender portal
description: This article describes how to discover vulnerabilities in the Site security feature of Microsoft Defender for IoT in Defender portal
ms.service: defender-for-iot
author: lwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 05/19/2024
ms.topic: how-to
---

# Discover vulnerabilities

Microsoft Defender for IoT extends vulnerability management capabilities by providing comprehensive coverage for OT networks, gathering OT device data into one place, and displaying it with the other devices on your network.
The OT security user<!-- IT security technician --> proactively manages network risks based on the vulnerability details and recommended remediation advice.

The key vulnerability features are:

| Feature | Description|
|----|----|
|Extended Vulnerability Coverage| Defender for IoT uses detailed OT device firmware information to discover its vendor, model, and version to identify known vulnerabilities.|
|Security Recommendations Page| Offers actionable steps to update and mitigate vulnerable products.|
|Weaknesses Page| Includes a comprehensive list of vulnerabilities such as zero-days and known exploits.|
|Management| The vulnerabilities can be managed and controlled globally, per device, or per vulnerable product.|
|Exception Handling| Create exceptions for recommendations that can't be patched.|
|Customizable Vulnerability Notifications| Alert key stakeholders with customizable notifications.|
|Reporting Inaccuracies| Users can report inaccuracies on discovered CVEs or request support for new vulnerabilities.|

The Microsoft Defender portal displays Microsoft Defender for IoT security vulnerabilities in the **Weaknesses** page of the Endpoints navigation menu. The **Weaknesses** page lists the detected security vulnerabilities across all devices, endpoints, applications and other sources on your network. <!--The Security administrator uses the list of detected vulnerabilities in the **Weaknesses** page, to create a remediation request that is sent to the IT administrator to implement.-->

Vulnerabilities are listed based on their publicly registered Common Vulnerability and Exposures(CVEs) ID. The public registry of CVEs can be accessed from [https://www.cve.org/](https://www.cve.org/).  

The Weaknesses page lists each CVE and gives it a severity rating, a CVSS score (10 is most severe), and lists the number of exposed devices. Use the metrics to prioritize dealing with these security vulnerabilities.

For more information, see [Weaknesses page in the Microsoft Defender Vulnerability Management](/defender-vulnerability-management/tvm-weaknesses.md).

>[!Important]
>Some information in this article relates to a prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Investigate vulnerabilities

1. In the Defender portal, go to **Endpoints > Vulnerability management > Weaknesses**.

1. Set filter settings as you need them.

1. Select a CVE name and the Vulnerability details open in the side panel.

    The panel also displays the **Exposed devices** and **Affected software** tabs.

    :::image type="content" source="media/weaknesses-detail-panel.png" alt-text="Screenshot of the Weaknesses page with the open Vulnerabilities detail side panel.":::

1. Select the **Go to related security recommendations** button. The Security recommendations page opens filtered for the CVE ID you were investigating.

    :::image type="content" source="media/recommendations-panel-remediate.png" alt-text="Screenshot of the Security recommendations page filtered for a specific CVE with remediation panel open.":::

1. Select a recommendation. The side panel opens.

    1. Select **Request remediation** and then follow the [Request mediation instructions](/defender-vulnerability-management/tvm-remediation#request-remediation). This sends a request to a team member to perform the requested remediation.<br>
    Or
    1. Select **Exception options**, fill out the form. For more information, see [justification for an exception](/defender-vulnerability-management/tvm-security-recommendation.md#explore-security-recommendation-options). To complete, select **Submit**.

    :::image type="content" source="media/create-exception.png" alt-text="Screenshot of the exception form in the remediation panel of the Security recommendations page for a specific CVE.":::
