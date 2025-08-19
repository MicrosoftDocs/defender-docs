---
title: "Custom detection rules with advanced hunting: Protecting SAP external OS commands (SAPXPG)"
description: Learn how to use advanced hunting with Defender for Endpoint to safeguard the SAPXPG mechanism with SAP systems.
author: emmwalshh
ms.author: ewalsh
manager: deniseb
ms.date: 05/20/2025
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

# Custom detection rules with advanced hunting: Protecting SAP external OS commands (SAPXPG)

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

SAP Systems can execute OS level commands by using `SAPXPG – Transaction Code SM49/SM69`. This article describes how to use advanced hunting with Microsoft Defender for Endpoint to help safeguard the SAPXPG mechanism to protect it from being exploited. The example illustrated in this article features SAP running on Linux; however, the procedure for SAP running on Windows Server is similar.

## Before you begin

Make sure to read the following articles before you begin:

- [Create custom detection rules](/defender-xdr/custom-detection-rules)
- [SAP Documentation: Starting External Commands and Programs](https://help.sap.com/doc/saphelp_nw73ehp1/7.31.19/en-US/4b/2b2bed365474fee10000000a421937/frameset.htm)

The SAP BASIS Team and the security team should codevelop the solution. The SAP BASIS team doesn't have access to the [Microsoft Defender portal](/defender-xdr/microsoft-365-security-center-mde), and the security team doesn't know the specifics of the SAP Batch Jobs and External Commands. Both teams should work together.

## Recommended implementation sequence

1. The SAP BASIS team identifies and categorizes the external commands and scripts running on all SAP Environments (Dev, QA, PRD).

2. The security team and the SAP BASIS team ensure that Defender for Endpoint is correctly deployed and configured on all SAP servers. For deployment guidance, see the following articles:

   - [Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP](https://aka.ms/mde4sap-linux)
   - [Microsoft Defender for Endpoint on Windows Server with SAP](https://aka.ms/mde4sap-windows)

3. The security team identifies all the SAP servers and runs a query for `"InitiatingProcessName" == "sapxpg"`, noting which servers are starting SAPXPG. 

   We recommended limiting the number of servers running SAPXPG to a minimum, and disallowing SAPXPG on most SAP servers. And, the SAP BASIS team and security team should limit access to the authorization objects and transaction codes for SAPXPG. 

4. The SAP BASIS team briefs the security team on any "allowed" utilities, such as `BRTOOLS` (for Oracle customers), `AzCopy` (if used) or other specific utilities for printing or archiving.

5. The security team works with the SAP BASIS team to query SAPXPG commands and parameters. An example query to detect `wget` (which can be used to download malicious payloads) is as follows:

   ```kusto

   DeviceProcessEvents
    | where Timestamp >= ago (1d)
    | where (InitiatingProcessFileName == "sapxpg" or  InitiatingProcessFileName =="sapxpg.exe")  and FileName == "wget"

   // Query shows SAPXPG commands that execute "wget"

   ```

   This query is designed to work on Linux (`sapxpg`) and Windows (`sapxpg.exe`).

   Another query/rule design logic is to block SAPXPG from executing any command other than specified allowed commands. In the following query, any command that is not in the set ("cp", "ls", "mkdir") can be alerted or blocked. 

   ```kusto
   
   DeviceProcessEvents
    | where Timestamp >= ago (1d)
    | where (InitiatingProcessFileName == "sapxpg" or  InitiatingProcessFileName =="sapxpg.exe")  and FileName !in ("cp", "ls", "mkdir")

   //Query shows SAPXPG commands that execute any command other than "cp" or "mv" or mkdir

   ```

6. The security team [creates a custom detection rule](/defender-xdr/custom-detection-rules#2-create-new-rule-and-provide-alert-details) to detect suspicious commands. Suspicious commands could include: 

   - `ncat`
   - `netcat`
   - `socat`
   - `azcopy`
   - `wget`
   - `curl`
   - `echo`
   - `base64`
   - `/dev/tcp`
   - `pwd`
   - `whoami`
   - `chmod +x`

7. The security team deploys the rule to non-production environments. The security team monitors detections, and the SAP BASIS team monitors jobs/interfaces for errors.

8. The security team deploys the rule to production environments. The SAP BASIS team should monitor jobs and interfaces, and the security team should monitor any alerts that are generated.

## Additional information

- To trace SAPXPG using `sapxpg_trace`, see [SAP documentation: Analyzing Problems with External Commands and Programs](https://help.sap.com/doc/saphelp_snc700_ehp01/7.0.1/en-US/4b/272d0ed1341780e10000000a42189c/content.htm?no_cache=true).

- To learn more about advanced hunting, see [Proactively hunt for threats with advanced hunting in Microsoft Defender](/defender-xdr/advanced-hunting-overview).

- To learn more about custom rules, see [Create custom detection rules](/defender-xdr/custom-detection-rules#2-create-new-rule-and-provide-alert-details).
