---
title: Set up device groups in Jamf Pro
description: Create static device groups in Jamf Pro to organize macOS devices for Microsoft Defender for Endpoint deployment and management.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: how-to
ms.subservice: macos
ms.date: 06/17/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Set up Microsoft Defender for Endpoint on macOS device groups in Jamf Pro

> [!NOTE]
> Device group creation is supported in Defender for Endpoint Plan 1 and Plan 2.  

Set up Jamf Pro device groups similar to Group Policy organizational units (OUs), Microsoft Configuration Manager device collections, and Intune device groups.

1. Navigate to **Static Computer Groups**.

1. Select **New**.

   :::image type="content" source="media/jamf-pro-static-group.png" alt-text="The Jamf Pro1 page" lightbox="media/jamf-pro-static-group.png":::

1. Provide a display name and select **Save**.

   :::image type="content" source="media/jamfpro-machine-group.png" alt-text="The Jamf Pro2 page" lightbox="media/jamfpro-machine-group.png":::

1. After saving, **Contoso's Machine Group** appears under **Static Computer Groups**.

   :::image type="content" source="media/contoso-machine-group.png" alt-text="The Jamf Pro3 page" lightbox="media/contoso-machine-group.png":::

> [!NOTE]
> You aren't required to use static groups. It's often more convenient and flexible to use, for example, [JAMF Pro's smart groups](https://docs.jamf.com/10.40.0/jamf-pro/documentation/Smart_Groups.html) instead.

## Next step

After you set up device groups, the next step is to [set up Microsoft Defender for Endpoint on macOS policies in Jamf Pro](mac-jamfpro-policies.md).
