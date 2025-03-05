---
title: Custom reporting solutions with automated investigation and response
f1.keywords:
- NOCSH
author: chrisda
ms.author: chrisda
manager: deniseb
audience: ITPro
ms.topic: conceptual
ms.localizationpriority: medium
search.appverid:
- MET150
- MOE150
ms.collection:
- m365-security
- tier2
description: Learn how to integrate automated investigation and response with a custom or third-party reporting solution.
ms.date: 07/10/2024
ms.custom: 
- air
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# Custom or third-party reporting solutions for Microsoft Defender for Office 365 Plan 2

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

Automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2 returns detailed information about the results. For more information, see [Details and results of automated investigation and response (AIR) in Microsoft Defender for Office 365 Plan 2](air-view-investigation-results.md).

However, some Microsoft 365 organizations use custom or third-party reporting solutions. Those organizations can use the **Office 365 Management Activity APIs** to integrate information from AIR into other reporting solutions.

|Resource|Description|
|:---|:---|
|[Office 365 Management APIs overview](/office/office-365-management-api/office-365-management-apis-overview)|The Office 365 Management Activity API provides information about various user, admin, system, and policy actions and events from Microsoft 365 and Microsoft Entra activity logs.|
|[Get started with Office 365 Management APIs](/office/office-365-management-api/get-started-with-office-365-management-apis)|The Office 365 Management API uses Microsoft Entra ID to provide authentication services for your application to access Microsoft 365 data. Follow the steps in this article to set this up.|
|[Office 365 Management Activity API reference](/office/office-365-management-api/office-365-management-activity-api-reference)|You can use the Office 365 Management Activity API to retrieve information about user, admin, system, and policy actions and events from Microsoft 365 and Microsoft Entra activity logs. Read this article to learn more about how this works.|
|[Office 365 Management Activity API schema](/office/office-365-management-api/office-365-management-activity-api-schema)|Get an overview of the [Common schema](/office/office-365-management-api/office-365-management-activity-api-schema#common-schema) and the [Defender for Office 365 and threat investigation and response schema](/office/office-365-management-api/office-365-management-activity-api-schema#office-365-advanced-threat-protection-and-threat-investigation-and-response-schema) to learn about specific kinds of data available through the Office 365 Management Activity API.|

## See also

- [Microsoft Defender for Office 365](mdo-about.md)
- [Automated investigation and response in Microsoft Defender XDR](/defender-xdr/m365d-autoir)
