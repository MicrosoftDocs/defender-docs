---
# required metadata

title: Disaster recovery for Advanced Threat Analytics
description: Describes how you can quickly recover ATA functionality after disaster
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 7620e171-76d5-4e3f-8b03-871678217a3a

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: arzinger
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA disaster recovery

[!INCLUDE [Banner for top of topics](includes/banner.md)]

This article describes how to quickly recover your ATA Center and restore ATA functionality when the ATA Center functionality is lost but the ATA Gateways are still working. 

>[!NOTE]
> The process described does not recover previously detected suspicious activities but does return the ATA Center to full functionality. Additionally, the learning period needed for some behavioral detections will restart, but most of the detection that ATA offers is operational after the ATA Center is restored. 

## Back up your ATA Center configuration

1. The ATA Center configuration is backed up to a file every 4 hours. Locate the latest backup copy of the ATA Center configuration and save it on a separate computer. For a full explanation of how to locate these files, see [Export and import the ATA configuration](ata-configuration-file.md). 
1. Export the ATA Center certificate.
    1. In the certificate manager, navigate to **Certificates (Local Computer)** -> **Personal** ->**Certificates**, and select **ATA Center**.
    2. Right-click **ATA Center** and select **All Tasks** followed by **Export**. 
     ![ATA Center Certificate.](media/ata-center-cert.png)
    3. Follow the instructions to export the certificate, making sure to export the private key as well.
    4. Back up the exported certificate file on a separate computer.

   > [!NOTE] 
   > If you cannot export the private key, you must create a new certificate and deploy it to ATA, as described in [Change the ATA Center certificate](modifying-ata-center-configuration.md), and then export it. 

## Recover your ATA Center

1. Create a new Windows Server machine using the same IP address and computer name as the previous ATA Center machine.
1. Import the certificate you backed up earlier, to the new server.
1. Follow the instructions to [Deploy the ATA Center](install-ata-step1.md) on the newly created Windows Server. There is no need to deploy the 
ATA Gateways again. When prompted for a certificate, provide the certificate you exported when backing up the ATA Center configuration. 
 ![ATA Center restore.](media/disaster-recovery-deploymentss.png)
1. Stop the ATA Center service.
1. Import the backed-up ATA Center configuration:
    1. Remove the default ATA Center System Profile document from the MongoDB: 
        1. Go to **C:\Program Files\Microsoft Advanced Threat Analytics\Center\MongoDB\bin**. 
        2. Run `mongo.exe ATA` 
        3. Run this command to remove the default system profile: `db.SystemProfile.remove({})`
        4. Leave the Mongo shell and return to the command prompt by entering: `exit`
    2. Run the command: `mongoimport.exe --db ATA --collection SystemProfile --file "<SystemProfile.json backup file>" --upsert` using the backup file from step 1.</br>
    For a full explanation of how to locate and import backup files, see [Export and import the ATA configuration](ata-configuration-file.md). 
    3. Start the ATA Center service.
    4. Open the ATA Console. You should see all the ATA Gateways linked under the Configuration/Gateways tab.
    5. Make sure to define a [**Directory services user**](install-ata-step2.md) and to choose a [**Domain controller synchronizer**](install-ata-step5.md). 






## See Also
- [ATA prerequisites](ata-prerequisites.md)
- [ATA capacity planning](ata-capacity-planning.md)
- [Configure event collection](install-ata-step6.md)
- [Configuring Windows event forwarding](configure-event-collection.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
