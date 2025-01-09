---
# required metadata

title: ATA SIEM log reference | Microsoft Docs 
description: Provides samples of security alert logs sent from ATA to your SIEM. 
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 601b48ba-a327-4aff-a1f9-2377a2bb7a42

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: ort

ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA SIEM log reference


[!INCLUDE [Banner for top of topics](includes/banner.md)]

ATA can forward security and health alert events to your SIEM. Alerts are forwarded in the CEF format. A sample of each type of security alert log to be sent to your SIEM, is below.

## Sample ATA security alerts in CEF format
The following fields and their values are forwarded to your SIEM:

- start – Time the alert started
- suser – Account (normally user account), involved in the alert
- shost – Source machine of the alert
- outcome – Alerts with defined activity success or failure performed in the alert  
- msg – Alert description
- cnt – Alerts with a count of the number of times the alert happened (for example brute force has an amount of guessed passwords)
- app – Alert protocol
- externalId – Event ID ATA writes to the event log that corresponds to the alert*
- cs#label & cs# – Customer strings that CEF allows to use the cs#label is the name of the new field, and cs# is the value, for example:
cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5909ae198ca1ec04d05e65fa

In this example, cs1 is a field that has a URL to the alert.

*If you create scripts or automation based on logs, use the permanent externalID of each log in place of using the log names, as log names are subject to change without notice. 

|Alert names|Alert Event IDs|
|---------|---------------|
|2001|Suspicion of identity theft based on abnormal behavior|
|2002|Unusual protocol implementation|
|2003|Reconnaissance using account enumeration|
|2004|Brute force attack using LDAP simple bind|
|2006|Malicious replication of Directory Services|
|2007|Reconnaissance using DNS|
|2008|Encryption downgrade activity|
|2009|Encryption downgrade activity (potential golden ticket)|
|2010|Encryption downgrade activity (potential overpass-the-hash)|
|2011|Encryption downgrade activity (potential skeleton key)|
|2012|Reconnaissance using SMB session enumeration|
|2013|Privilege escalation using forged authorization data|
|2014|Honeytoken activity|
|2016|Massive object deletion|
|2017|Identity theft using Pass-the-Hash attack|
|2018|Identity theft using Pass-the-Ticket attack|
|2019|Remote execution attempt detected|
|2020|Malicious data protection private information request|
|2021|Reconnaissance using Directory Services queries|
|2022|Kerberos Golden Ticket activity|
|2023|Suspicious authentication failures|
|2024|Abnormal modification of sensitive groups|
|2026|Suspicious service creation|



## Sample logs

Priorities:
3=Low
5=Medium
10=High

### Abnormal modification of sensitive groups
1 2018-12-12T16:53:22.925757+00:00 CENTER ATA 4688 AbnormalSensitiveGroupMembership CEF:0|Microsoft|ATA|1.9.0.0|AbnormalSensitiveGroupMembershipChangeSuspiciousActivity|Abnormal modification of sensitive groups|5|start=2018-12-12T18:52:58.0000000Z app=GroupMembershipChangeEvent suser=krbtgt msg=krbtgt has uncharacteristically modified sensitive group memberships. externalId=2024 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c113d028ca1ec1250ca0491

### Brute force attack using LDAP simple bind
12-12-2018 19:52:18 Auth.Warning 192.168.0.222 1 2018-12-12T17:52:18.899690+00:00 CENTER ATA 4688 LdapBruteForceSuspiciousActivity ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|LdapBruteForceSuspiciousActivity|Brute force attack using LDAP simple bind|5|start=2018-12-12T17:52:10.2350665Z app=Ldap msg=10000 password guess attempts were made on 100 accounts from W2012R2-000000-Server. One account password was successfully guessed. externalId=2004 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114acb8ca1ec1250cacdcb

### Encryption downgrade activity (Golden Ticket)
12-12-2018 20:12:35 Auth.Warning 192.168.0.222 1 2018-12-12T18:12:35.105942+00:00 CENTER ATA 4688 EncryptionDowngradeSuspiciousAct ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|EncryptionDowngradeSuspiciousActivity|Encryption downgrade activity|5|start=2018-12-12T18:10:35.0334169Z app=Kerberos msg=The encryption method of the TGT field of TGS_REQ message from W2012R2-000000-Server has been downgraded based on previously learned behavior. This may be a result of a Golden Ticket in-use on W2012R2-000000-Server. externalId=2009 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114f938ca1ec1250cafcfa

### Encryption downgrade activity (overpass-the-hash)
12-12-2018 19:00:31 Auth.Warning 192.168.0.222 1 2018-12-12T17:00:31.963485+00:00 CENTER ATA 4688 EncryptionDowngradeSuspiciousAct ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|EncryptionDowngradeSuspiciousActivity|Encryption downgrade activity|5|start=2018-12-12T17:00:31.2975188Z app=Kerberos msg=The encryption method of the Encrypted_Timestamp field of AS_REQ message from W2012R2-000000-Server has been downgraded based on previously learned behavior. This may be a result of a credential theft using Overpass-the-Hash from W2012R2-000000-Server. externalId=2010 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c113eaf8ca1ec1250ca0883

###  Encryption downgrade activity (Skeleton Key)
12-12-2018 20:07:24 Auth.Warning 192.168.0.222 1 2018-12-12T18:07:24.065140+00:00 CENTER ATA 4688 EncryptionDowngradeSuspiciousAct ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|EncryptionDowngradeSuspiciousActivity|Encryption downgrade activity|5|start=2018-12-12T18:07:24.0222746Z app=Kerberos msg=The encryption method of the ETYPE_INFO2 field of KRB_ERR message from W2012R2-000000-Server has been downgraded based on previously learned behavior. This may be a result of a Skeleton Key on DC1. externalId=2011 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114e5c8ca1ec1250cafafe

### Honeytoken activity
12-12-2018 19:51:52 Auth.Warning 192.168.0.222 1 2018-12-12T17:51:52.659618+00:00 CENTER ATA 4688 HoneytokenActivitySuspiciousActi ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|HoneytokenActivitySuspiciousActivity|Honeytoken activity|5|start=2018-12-12T17:51:52.5855994Z app=Kerberos suser=USR78982 msg=The following activities were performed by USR78982 LAST78982:\r\nAuthenticated from CLIENT1 using NTLM when accessing domain1.test.local\cifs on DC1. externalId=2014 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114ab88ca1ec1250ca7f76

### Identity theft using Pass-the-Hash attack
12-12-2018 19:56:02 Auth.Error 192.168.0.222 1 2018-12-12T17:56:02.047236+00:00 CENTER ATA 4688 PassTheHashSuspiciousActivity ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|PassTheHashSuspiciousActivity|Identity theft using Pass-the-Hash attack|10|start=2018-12-12T17:54:01.9582400Z app=Ntlm suser=USR46829 LAST46829 msg=USR46829 LAST46829's hash was stolen from one of the computers previously logged into by USR46829 LAST46829 and used from W2012R2-000000-Server. externalId=2017 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114bb28ca1ec1250caf673

### Identity theft using Pass-the-Ticket attack
12-12-2018 22:03:51 Auth.Error 192.168.0.222 1 2018-12-12T20:03:51.643633+00:00 CENTER ATA 4688 PassTheTicketSuspiciousActivity ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|PassTheTicketSuspiciousActivity|Identity theft using Pass-the-Ticket attack|10|start=2018-12-12T17:54:12.9960662Z app=Kerberos suser=Birdie Lamb msg=Birdie Lamb (Software Engineer)'s Kerberos tickets were stolen from W2012R2-000106-Server to W2012R2-000051-Server and used to access domain1.test.local\host. externalId=2018 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114b458ca1ec1250caf5b7

### Kerberos Golden Ticket activity
12-12-2018 19:53:26 Auth.Error 192.168.0.222 1 2018-12-12T17:53:26.869091+00:00 CENTER ATA 4688 GoldenTicketSuspiciousActivity ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|GoldenTicketSuspiciousActivity|Kerberos Golden Ticket activity|10|start=2018-12-13T06:51:26.7290524Z app=Kerberos suser=Sonja Chadsey msg=Suspicious usage of Sonja Chadsey (Software Engineer)'s Kerberos ticket, indicating a potential Golden Ticket attack, was detected. externalId=2022 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114b168ca1ec1250caf556

### Malicious data protection private information request
12-12-2018 20:03:49 Auth.Error 192.168.0.222 1 2018-12-12T18:03:49.814620+00:00 CENTER ATA 4688 RetrieveDataProtectionBackupKeyS ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|RetrieveDataProtectionBackupKeySuspiciousActivity|Malicious data protection private information request|10|start=2018-12-12T17:58:56.3537533Z app=LsaRpc shost=W2012R2-000000-Server msg=An unknown user performed 1 successful attempt from W2012R2-000000-Server to retrieve DPAPI domain backup key from DC1. externalId=2020 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114d858ca1ec1250caf983

### Malicious replication of Directory Services
12-12-2018 19:56:49 Auth.Error 192.168.0.222 1 2018-12-12T17:56:49.312648+00:00 CENTER ATA 4688 DirectoryServicesReplicationSusp ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|DirectoryServicesReplicationSuspiciousActivity|Malicious replication of Directory Services|10|start=2018-12-12T17:52:34.3287329Z app=Drsr shost=W2012R2-000000-Server msg=Malicious replication requests were successfully performed from W2012R2-000000-Server against DC1. outcome=Success externalId=2006 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114be18ca1ec1250caf6b8

### Privilege escalation using forged authorization data
12-12-2018 19:51:15 Auth.Error 192.168.0.222 1 2018-12-12T17:51:15.658608+00:00 CENTER ATA 4688 ForgedPacSuspiciousActivity ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|ForgedPacSuspiciousActivity|Privilege escalation using forged authorization data|10|start=2018-12-12T17:51:15.0261128Z app=Kerberos suser=triservice msg=triservice attempted to escalate privileges against DC1 from W2012R2-000000-Server by using forged authorization data. externalId=2013 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114a938ca1ec1250ca7f48

### Reconnaissance using Directory Services queries
12-12-2018 20:23:52 Auth.Warning 192.168.0.222 1 2018-12-12T18:23:52.155531+00:00 CENTER ATA 4688 SamrReconnaissanceSuspiciousActi ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|SamrReconnaissanceSuspiciousActivity|Reconnaissance using Directory Services queries|5|start=2018-12-12T18:04:12.9868815Z app=Samr shost=W2012R2-000000-Server msg=The following directory services queries using SAMR protocol were attempted against DC1 from W2012R2-000000-Server:\r\nSuccessful query about Incoming Forest Trust Builders (Members of this group can create incoming, one-way trusts to this forest) in domain1.test.local externalId=2021 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114e758ca1ec1250cafb2e

### Reconnaissance using account enumeration
1 2018-12-12T16:57:09.661680+00:00 CENTER ATA 4688 AccountEnumerationSuspiciousActi CEF:0|Microsoft|ATA|1.9.0.0|AccountEnumerationSuspiciousActivity|Reconnaissance using account enumeration|5|start=2018-12-12T16:57:09.1706828Z app=Kerberos shost=W2012R2-000000-Server msg=Suspicious account enumeration activity using Kerberos protocol, originating from W2012R2-000000-Server, was detected. The attacker performed a total of 100 guess attempts for account names, 1 guess attempt matched existing account names in Active Directory. externalId=2003 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c113de58ca1ec1250ca06d8

### Reconnaissance using DNS
1 2018-12-12T16:57:20.743634+00:00 CENTER ATA 4688 DnsReconnaissanceSuspiciousActiv CEF:0|Microsoft|ATA|1.9.0.0|DnsReconnaissanceSuspiciousActivity|Reconnaissance using DNS|5|start=2018-12-12T16:57:20.2556472Z app=Dns shost=W2012R2-000000-Server msg=Suspicious DNS activity was observed, originating from W2012R2-000000-Server (which is not a DNS server) against DC1. externalId=2007 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c113df08ca1ec1250ca074c

### Reconnaissance using SMB session enumeration
12-12-2018 19:50:51 Auth.Warning 192.168.0.222 1 2018-12-12T17:50:51.090247+00:00 CENTER ATA 4688 EnumerateSessionsSuspiciousActiv ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|EnumerateSessionsSuspiciousActivity|Reconnaissance using SMB session enumeration|5|start=2018-12-12T17:00:42.7234229Z app=SrvSvc shost=W2012R2-000000-Server msg=SMB session enumeration attempts failed from W2012R2-000000-Server against DC1. No accounts were exposed. externalId=2012 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114a788ca1ec1250ca7735

### Remote execution attempt detected
12-12-2018 19:58:45 Auth.Warning 192.168.0.222 1 2018-12-12T17:58:45.082799+00:00 CENTER ATA 4688 RemoteExecutionSuspiciousActivit ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|RemoteExecutionSuspiciousActivity|Remote execution attempt detected|5|start=2018-12-12T17:54:23.9523766Z shost=W2012R2-000000-Server msg=The following remote execution attempts were performed on DC1 from W2012R2-000000-Server:\r\nFailed remote scheduling of one or more tasks. externalId=2019 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114c548ca1ec1250caf783

### Unusual protocol implementation
1 2018-12-12T16:50:46.930234+00:00 CENTER ATA 4688 AbnormalProtocolSuspiciousActivi CEF:0|Microsoft|ATA|1.9.0.0|AbnormalProtocolSuspiciousActivity|Unusual protocol implementation|5|start=2018-12-12T16:48:46.6480337Z app=Ntlm shost=W2012R2-000000-Server outcome=Success msg=triservice successfully authenticated from W2012R2-000000-Server against DC1 using an unusual protocol implementation. This may be a result of malicious tools used to execute attacks such as Pass-the-Hash and brute force. externalId=2002 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c113c668ca1ec1250ca0397

### Suspicion of identity theft based on abnormal behavior
1 2018-12-12T16:50:35.746877+00:00 CENTER ATA 4688 AbnormalBehaviorSuspiciousActivi CEF:0|Microsoft|ATA|1.9.0.0|AbnormalBehaviorSuspiciousActivity|Suspicion of identity theft based on abnormal behavior|5|start=2018-12-12T16:48:35.5501183Z app=Kerberos suser=USR45964 msg=USR45964 LAST45964 exhibited abnormal behavior when performing activities that were not seen over the last month and are also not in accordance with the activities of other accounts in the organization. The abnormal behavior is based on the following activities:\r\nPerformed interactive login from 30 abnormal workstations.\r\nRequested access to 30 abnormal resources. externalId=2001 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c113c5b8ca1ec1250ca0355

### Suspicious authentication failures
12-12-2018 19:50:34 Auth.Warning 192.168.0.222 1 2018-12-12T17:04:25.214067+00:00 CENTER ATA 4688 BruteForceSuspiciousActivity ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|BruteForceSuspiciousActivity|Suspicious authentication failures|5|start=2018-12-12T17:03:58.5892462Z app=Kerberos shost=W2012R2-000106-Server msg=Suspicious authentication failures indicating a potential brute-force attack were detected from W2012R2-000106-Server. externalId=2023 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c113f988ca1ec1250ca5810

### Suspicious service creation
12-12-2018 19:53:49 Auth.Warning 192.168.0.222 1 2018-12-12T17:53:49.913034+00:00 CENTER ATA 4688 MaliciousServiceCreationSuspicio ‹¯¨CEF:0|Microsoft|ATA|1.9.0.0|MaliciousServiceCreationSuspiciousActivity|Suspicious service creation|5|start=2018-12-12T19:53:49.0000000Z app=ServiceInstalledEvent shost=W2012R2-000000-Server msg=triservice created FakeService in order to execute potentially malicious commands on W2012R2-000000-Server. externalId=2026 cs1Label=url cs1=https\://192.168.0.220/suspiciousActivity/5c114b2d8ca1ec1250caf577

## Health alerts

### GatewayDisconnectedMonitoringAlert
1 2018-12-12T16:52:41.520759+00:00 CENTER ATA 4688 GatewayDisconnectedMonitoringAle CEF:0|Microsoft|ATA|1.9.0.0|GatewayDisconnectedMonitoringAlert|GatewayDisconnectedMonitoringAlert|5|externalId=1011 cs1Label=url cs1=https\://192.168.0.220/monitoring msg=There has not been communication from the Gateway CENTER for 5 minutes. Last communication was on 12/12/2018 4:47:03 PM UTC.

### GatewayStartFailureMonitoringAlert
1 2018-12-12T15:36:59.701097+00:00 CENTER ATA 1372 GatewayStartFailureMonitoringAle CEF:0|Microsoft|ATA|1.9.0.0|GatewayStartFailureMonitoringAlert|GatewayStartFailureMonitoringAlert|5|externalId=1018 cs1Label=url cs1=https\://192.168.0.220/monitoring msg=The Gateway service on DC1 failed to start. It was last seen running on 12/12/2018 3:04:12 PM UTC.

> [!NOTE]
> All health alerts are sent with the same template as above.


## See Also
- [ATA prerequisites](ata-prerequisites.md)
- [ATA capacity planning](ata-capacity-planning.md)
- [Configure event collection](configure-event-collection.md)
- [Configuring Windows event forwarding](configure-event-collection.md)
- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
