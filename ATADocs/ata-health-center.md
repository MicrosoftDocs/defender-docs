---
# required metadata

title: Monitor Advanced Threat Analytics System Health and Events
description: Use the ATA Health Center to check how the ATA service is working and be alerted to potential problems and view system events in the Event viewer.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: d6c783b2-46c5-4211-b21a-d6b17f08d03d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.tgt_pltfrm:
#ms.custom:

---

# Working with ATA system health and events

[!INCLUDE [Banner for top of topics](includes/banner.md)]

## ATA Health Center

The ATA Health Center lets you know how your ATA service is performing and alerts you to problems.

## Working with the ATA Health Center

The ATA Health Center lets you know that there's a problem by raising an alert (a red dot) above the Health Center icon in the menu bar.

![ATA Health Center red dot toolbar.](media/ATA-Health-Center-Alert-red-dot.png)

### Managing ATA health

To check up on your system's overall health, select the Health Center icon in the menu bar ![ATA Health Center icon.](media/ATA-red-dot.png)

- All open alerts can be managed by setting them to **Close**, **Suppress**, or **Delete** by selecting the three dots in the corner of the alert and making your selection.

- **Open**: All new suspicious activities appear in this list.

- **Close**: Is used to track suspicious activities that you identified, researched, and fixed for mitigated.

    > [!NOTE]
    > ATA may reopen a closed activity if the same activity is detected again within a short period of time.

- **Suppress**: Suppressing an activity means you want to ignore it for now, and only be alerted again if there's a new instance. If there's a similar alert ATA doesn't reopen it. But if the alert stops for seven days, and is then seen again, you are alerted again.

- **Delete**: If you Delete an alert, it is deleted from the system, from the database and you will NOT be able to restore it. After you select delete, you'll be able to delete all suspicious activities of the same type.

![ATA Health Center issues image.](media/ATA-Health-Issue.JPG)

## See Also

- [Working with suspicious activities](working-with-suspicious-activities.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
