---
title: Connected applications in Microsoft Defender for Endpoint
ms.reviewer:
description: View connected partner applications that use standard OAuth 2.0 protocol to authenticate and provide tokens for use with Microsoft Defender for Endpoint APIs.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 12/18/2020
---

# Connected applications in Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)


> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

Connected applications integrates with the Defender for Endpoint platform using APIs.

Applications use standard OAuth 2.0 protocol to authenticate and provide tokens for use with Microsoft Defender for Endpoint APIs. In addition, Microsoft Entra applications allow tenant admins to set explicit control over which APIs can be accessed using the corresponding app.

You'll need to follow [these steps](api/apis-intro.md) to use the APIs with the connected application.

From the left navigation menu, select **Partners & APIs** (under **Endpoints**) > **Connected applications**.

## View connected application details

The Connected applications page provides information about the Microsoft Entra applications connected to Microsoft Defender for Endpoint in your organization. You can review the usage of the connected applications: last seen, number of requests in the past 24 hours, and request trends in the last 30 days.

:::image type="content" source="media/connected-apps.png" alt-text="The connected applications" lightbox="media/connected-apps.png":::
 
## Edit, reconfigure, or delete a connected application

The **Open application settings** link opens the corresponding Microsoft Entra application management page in the Azure portal. From the Azure portal, you can manage permissions, reconfigure, or delete the connected applications.
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
