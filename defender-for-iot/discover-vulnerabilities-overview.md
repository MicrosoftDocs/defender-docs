---
title: Overview of vulnerability management and weaknesses with Microsoft Defender for IoT in the Defender portal
description: This article describes the vulnerability management and weaknesses features of Microsoft Defender for IoT in the Defender portal.
ms.service: defender-for-iot
author: limwainstein
ms.author: lwainstein
ms.localizationpriority: medium
ms.date: 06/24/2024
ms.topic: conceptual
---

# Overview of vulnerability management

With vulnerability management, Microsoft Defender for IoT in the Defender portal provides extended coverage for OT networks, gathers OT device data into one place, and displays the data with the other devices on your network.

The OT security administrator proactively manages network exposure based on the vulnerability details and recommended remediation actions.

[!INCLUDE [defender-iot-preview](../includes//defender-for-iot-defender-public-preview.md)]

## Vulnerability management capabilities

The key vulnerability management capabilities are:

|Capability |Description |
|----|----|
|Extended vulnerability coverage| Defender for IoT uses detailed OT device firmware information and discovers the device vendor, model, and version to identify known vulnerabilities. |
|[Security recommendations page](/defender-vulnerability-management/tvm-security-recommendation)|Offers actionable steps to update and mitigate vulnerable products. |
|[Weaknesses page](/defender-vulnerability-management/tvm-weaknesses)|Includes a detailed list of vulnerabilities like zero-days and known exploits. |
|[Management](/defender-vulnerability-management/tvm-weaknesses#view-common-vulnerabilities-and-exposures-cve-entries-in-other-places)|You can manage and control the vulnerabilities globally, per tenant or device group, per device from the device page, or per vulnerable product through the Inventory page. |
|[Exception handling](/defender-vulnerability-management/tvm-security-recommendation#file-for-exception)| Create exceptions for recommendations that can't be patched.|
|[Customizable Vulnerability Notifications](/defender-endpoint/configure-vulnerability-email-notifications)| Alert key stakeholders with customizable notifications.|
|[Reporting Inaccuracies](/defender-vulnerability-management/tvm-weaknesses#report-inaccuracy)| Users can report inaccuracies on discovered CVEs or request support for new vulnerabilities.|

## Weaknesses page

The Microsoft Defender portal displays Microsoft Defender for IoT security vulnerabilities in the **Endpoints > Weaknesses** page.

Vulnerabilities are listed based on their publicly registered Common Vulnerability and Exposures(CVEs) ID.

The **Weaknesses** page lists the detected security vulnerabilities across all devices, endpoints, applications and other sources on your network. The data can be filtered according to device groups based on the created sites.

The OT security administrator uses the list of detected vulnerabilities in the **Weaknesses** page to send a remediation request for the relevant team to handle.

Learn more about the [Weaknesses page in the Microsoft Defender Vulnerability Management](/defender-vulnerability-management/tvm-weaknesses).

## Next steps

[Prioritize and investigate vulnerabilities](prioritize-vulnerabilities.md) in Microsoft Defender for IoT.
