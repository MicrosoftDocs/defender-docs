---
# required metadata

title: Install Advanced Threat Analytics - Step 3
description: Step three of installing ATA helps you download the ATA Gateway setup package.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 7fb024e6-297a-4ad9-b962-481bb75a0ba3

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.tgt_pltfrm:
#ms.custom:

---

# Install ATA - Step 3

[!INCLUDE [Banner for top of topics](includes/banner.md)]

> [!div class="step-by-step"]
> [« Step 2](install-ata-step2.md)
> [Step 4 »](install-ata-step4.md)

## Step 3: Download the ATA Gateway setup package

After configuring the domain connectivity settings, you can download the ATA Gateway setup package. The ATA Gateway can be installed on a dedicated server or on a domain controller. If you install it on a domain controller, it is installed as an ATA Lightweight Gateway. For more information on the ATA Lightweight Gateway, see [ATA Architecture](ata-architecture.md). 

Select **Download Gateway Setup** in the list of steps at the top of the page to go to the **Gateways** page.

![ATA gateway configuration settings.](media/ATA_1.7-welcome-download-gateway.PNG)

> [!NOTE] 
> To reach the Gateway configuration screen later, select the **settings icon** (upper right corner) and select **Configuration**, then, under **System**, select **Gateways**.  

1. Select **Gateway Setup**.
  ![Download ATA Gateway Setup.](media/download-gateway-setup.png)
1. Save the package locally.
1. Copy the package to the dedicated server or domain controller onto which you are installing the ATA Gateway. Alternatively, you can open the ATA Console from the dedicated server or domain controller and skip this step.

The zip file includes the following files:

- ATA Gateway installer

- Configuration setting file with the required information to connect to the ATA Center

> [!div class="step-by-step"]
> [« Step 2](install-ata-step2.md)
> [Step 4 »](install-ata-step4.md)

## See also

- [ATA POC deployment guide](/samples/browse/?redirectedfrom=TechNet-Gallery)
- [ATA sizing tool](https://aka.ms/atasizingtool)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
- [Configure event collection](configure-event-collection.md)
- [ATA prerequisites](ata-prerequisites.md)
