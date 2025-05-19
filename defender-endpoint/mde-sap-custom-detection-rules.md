---
title: "Custom Detection Rules - Advanced Hunting: Protecting SAP External OS Commands (SAPXPG)"
description: Learn how to use advanced hunting with Defender for Endpoint to safeguard the SAPXPG mechanism with SAP systems.
author: emmwalshh
ms.author: ewalsh
manager: deniseb
ms.date: 05/19/2025
ms.topic: overview
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.collection:
ms.custom:
- partner-contribution
ms.reviewer: cgardin
search.appverid: MET150
f1.keywords: NOCSH
audience: ITPro
---

# Custom Detection Rules - Advanced Hunting: Protecting SAP External OS Commands (SAPXPG)

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

SAP Systems can execute OS level commands by using SAPXPG – Transaction Code SM49/SM69. This article describes how to use advanced hunting with Microsoft Defender for Endpoint to help safeguard the SAPXPG mechanism. The example illustrated in this article features SAP running on Linux; however, the procedure for SAP running on Windows 11 is similar.

## Before you begin

Make sure to read the following articles before you begin:

- [Create custom detection rules](/defender-xdr/custom-detection-rules)
- [SAP Documentation: Starting External Commands and ProgramsLocate this document in the navigation structure](https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/4b/2b2bed365474fee10000000a421937/frameset.htm)

The SAP BASIS Team and the Security team should co-develop the solution. The SAP BASIS team doesn't have access to the Microsoft Defender portal, and the Security team won't know the specifics of the SAP Batch Jobs and External Commands.

## Recommended implementation sequence

1. The SAP BASIS team identifies and categorizes the external commands and scripts running on all SAP Environments (Dev, QA, PRD).

2. The Security team and the SAP BASIS team ensure that Defender for Endpoint is correctly deployed and configured on all SAP servers. For deployment guidance, see the following articles:

   - [Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP](https://aka.ms/mde4sap-linux)
   - [Microsoft Defender for Endpoint on Windows Server with SAP](https://aka.ms/mde4sap-windows)




