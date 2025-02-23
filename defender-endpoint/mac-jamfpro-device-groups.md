---
title: Set up device groups in Jamf Pro
description: Learn how to set up device groups in Jamf Pro for Microsoft Defender for Endpoint on macOS
ms.service: defender-endpoint
author: emmwalshh
ms.author: ewalsh
ms.reviewer: joshbregman
manager: deniseb
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: conceptual
ms.subservice: macos
search.appverid: met150
ms.date: 04/30/2024
---

# Set up Microsoft Defender for Endpoint on macOS device groups in Jamf Pro

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

> [!NOTE]
> Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.  

Set up the device groups similar to Group policy  organizational unite (OUs), Microsoft Endpoint Configuration Manager's device collection, and Intune's device groups.

1. Navigate to **Static Computer Groups**.

2. Select **New**. 

   :::image type="content" source="media/jamf-pro-static-group.png" alt-text="The Jamf Pro1 page" lightbox="media/jamf-pro-static-group.png":::

3. Provide a display name and select **Save**.

   :::image type="content" source="media/jamfpro-machine-group.png" alt-text="The Jamf Pro2 page" lightbox="media/jamfpro-machine-group.png":::

4. Now you see the **Contoso's Machine Group** under **Static Computer Groups**.

   :::image type="content" source="media/contoso-machine-group.png" alt-text="The Jamf Pro3 page" lightbox="media/contoso-machine-group.png":::

> [!NOTE]
> You aren't required to use static groups. It's often more convenient and flexible to use, for example, [JAMF Pro's smart groups](https://docs.jamf.com/10.40.0/jamf-pro/documentation/Smart_Groups.html) instead.

## Next step
- [Set up Microsoft Defender for Endpoint on macOS policies in Jamf Pro](mac-jamfpro-policies.md)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
