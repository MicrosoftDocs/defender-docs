---
# required metadata

title: What threats does Advanced Threat Analytics detect?
description: Lists the threats that Advanced Threat Analytics detects 
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 283e7b4e-996a-4491-b7f6-ff06e73790d2

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# What threats does ATA look for?


[!INCLUDE [Banner for top of topics](includes/banner.md)]

ATA provides detection for the following various phases of an advanced attack: reconnaissance, credential compromise, lateral movement, privilege escalation, domain dominance, and others. These detections are aimed at detecting advanced attacks and insider threats before they cause damage to your organization.
The detection of each phase results in several suspicious activities relevant for the phase in question, where each suspicious activity correlates to different flavors of possible attacks.
These phases in the kill-chain where ATA currently provides detections are highlighted in the following image:

![ATA focus on lateral activity in attack kill chain.](media/attack-kill-chain-small.jpg)


For more information, see [Working with suspicious activities](working-with-suspicious-activities.md) and the [ATA suspicious activity guide](suspicious-activity-guide.md).


## What's next?

- For more information about how ATA fits into your network: [ATA architecture](ata-architecture.md)

- To get started deploying ATA: [Install ATA](install-ata-step1.md)


## See Also
[Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
