---
# required metadata

title: Troubleshooting Advanced Threat Analytics using the database
description: Describes how you can use the ATA database to help troubleshoot issues 
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 377a3c81-5c1d-486f-8942-85249aacf560

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Troubleshooting ATA using the ATA database

[!INCLUDE [Banner for top of topics](includes/banner.md)]

ATA uses MongoDB as its database.
You can interact with the database using the default command line or using a user interface tool to perform advanced tasks and troubleshooting.

## Interacting with the database
The default and most basic way to query the database is using the Mongo shell:

1. Open a command-line window and change the path to the MongoDB bin folder. The default path is: **C:\Program Files\Microsoft Advanced Threat Analytics\Center\MongoDB\bin**.

1. Run: `mongo.exe ATA`. Make sure to type ATA with all capital letters.

> [!div class="mx-tableFixed"]
> 
> |How to...|Syntax|Notes|
> |-------------|----------|---------|
> |Check for collections in the database.|`show collections`|Useful as an end-to-end test to see that traffic is being written to the database and that event 4776 is being received by ATA.|
> |Get the details of a user/computer/group (UniqueEntity), such as user ID.|`db.UniqueEntity.find({CompleteSearchNames: "<name of entity in lower case>"})`||
> |Find Kerberos authentication traffic originating from a specific computer on a specific day.|`db.KerberosAs_<datetime>.find({SourceComputerId: "<Id of the source computer>"})`|To get the &lt;ID of the source computer&gt; you can query the UniqueEntity collections, as shown in the example.<br /><br />Each network activity type, for example Kerberos authentications, has its own collection per UTC date.|
> |Make advanced configuration changes. In this example, change the send queue size for all ATA Gateways to 10,000.|`db.SystemProfile.update( {_t: "GatewaySystemProfile"} ,`<br>`{$set:{"Configuration.EntitySenderConfiguration.EntityBatchBlockMaxSize" : "10000"}})`|`|

The following example provides sample code using the syntax provided earlier. If you are investigating a suspicious activity that occurred on 20/10/2015 and want to learn more about the NTLM activities that "John Doe" performed on that day:<br /><br />First, find the ID of "John Doe"

`db.UniqueEntity.find({Name: "John Doe"})`<br>Take a note of the ID as indicated by the value of `_id` For example, assume the ID is `123bdd24-b269-h6e1-9c72-7737as875351`<br>Then, search for the collection with the closest date that is before the date you are looking for, in the example 20/10/2015.<br>Then, search for John Doe's account NTLM activities: 

`db.Ntlms_<closest date>.find({SourceAccountId: "123bdd24-b269-h6e1-9c72-7737as875351"})`

## See Also
- [ATA prerequisites](ata-prerequisites.md)
- [ATA capacity planning](ata-capacity-planning.md)
- [Configure event collection](configure-event-collection.md)
- [Configuring Windows event forwarding](configure-event-collection.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
