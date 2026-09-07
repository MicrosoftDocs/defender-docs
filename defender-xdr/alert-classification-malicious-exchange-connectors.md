---
title: Investigate and classify alerts for malicious Exchange connectors
description: Learn how to investigate and classify alerts on malicious Exchange connectors activity and protect your network from attacks.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier2
ms.custom: admindeeplinkDEFENDER, msecd-doc-authoring-1016
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender XDR
ai-usage: ai-assisted
#customer intent: As a SOC analyst, I want to know how to investigate and classify alerts for malicious Exchange connectors so that I can take the necessary actions to remediate the attack and protect my network.
---

# Investigate and classify alerts for malicious Exchange connectors

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Threat actors use compromised Microsoft Exchange connectors for sending out spam and phishing emails in bulk to unsuspecting recipients by masquerading legitimate emails. Since the connector is compromised, the emails would usually be trusted by the recipients. These kinds of phishing emails are common vectors for phishing campaigns, and business email compromise (BEC) scenario. Hence, emails sent through compromised connectors need to be monitored heavily due to the likelihood of successful recipients' compromises being high.

This malicious Exchange connector investigation playbook helps in investigating instances where malicious connectors are setup/deployed by malicious actors. Accordingly, security teams can take the necessary steps to remediate the attack and mitigate the security risks arising from it. The playbook helps in classifying the alerts as either true positive (TP) or false positive (FP). If alerts are TP, the playbook lists necessary recommended actions for remediating the attack. This playbook is available for security teams who review, handle/manage, and grade the alerts.

Following are the results of using a playbook:

- Determination of the alert as malicious (TP) or benign (FP).
- If malicious, remediate/remove the malicious connector from the environment.

## What are Exchange connectors?

Exchange connectors are a collection of instructions that customize the way your email flows to and from your Microsoft 365 or Office 365 organization. Usually, most Microsoft 365 and Office 365 organizations don't need connectors for regular mail flow.

Connectors are used to route mail traffic between remote email systems and Office 365 (O365) or O365, and on-premises email systems.

### Malicious Exchange connectors

Attackers may compromise an existing Exchange connector or compromise an admin, and set up a new connector by sending phish or spam/bulk emails.

The typical indicators of a malicious connector can be found when looking at email traffic and its headers. For example, when email traffic is observed from a connector node with a mismatch between the header sender (P1) and envelope sender (P2) addresses, along with no information on the sender's AccountObjectId.

The malicious Exchange connector alert tries to identify such instances of mail flow where the mail sending activity seems suspicious and relevant information on the sender is unavailable.

## Playbook workflow

You must follow the sequence to identify malicious Exchange connectors:

- Identify which accounts are sending emails:
  - Do accounts appear to be compromised?
- Identify the connector relaying on emails to check:
  - If the connector is supposed to send out high volume emails?
  - If the connector was modified or created recently?
- Are emails going to internal email addresses?
  - Are emails going to external addresses (Spray and pray spam)?
  - Are emails going to external addresses belonging to customers or vendors (supply chain type attack)?
- Check if the FROM header and Envelope Sender domains are the same or different.

## Investigate malicious connectors

The following steps help investigate a malicious Exchange connector alert and remediate the associated security risk.

- Determine whether the connector demonstrates bad (malicious) behavior.
  - Look for events indicating unusual mail traffic and identify, whether any new and recently added Exchange connector.
    - For mail traffic observed, determine if the email accounts are compromised by inspecting whether the accounts are responsible for unusual mail traffic.
  - Look for mail content containing malicious artifacts (bad links/attachments).
  - Look for domains that are not part of your environment.
- Determine the email accounts are not compromised. Identify the connector that was recently added or modified in the environment.
- Look for:
  - Field values in the P1 sender (email header sender) and P2 sender (envelope sender), and check whether there's a mismatch.
  - Empty values in the SenderObjectId field.
- Use email and audit telemetry from EmailEvents and CloudAppEvents to note:
  - The NetworkMessageId (Message ID) of the emails that were sent from the malicious connector.
  - The connector creation date, last modified date, and last modified by date.
  - The IP address of the connector from where the email traffic is observed.

<a name="advanced-hunting-queries"></a>
## Use advanced hunting queries to investigate connectors

You can use [advanced hunting](advanced-hunting-overview.md) queries to gather information related to an alert and determine whether the activity is suspicious.

Ensure you have access to the following tables:

|Table Name|Description|
|---|---|
|EmailEvents| Contains information related to email flow.|
|CloudAppEvents|Contains audit log of user activities.|
|IdentityLogonEvents|Contains login information for all users.|

### Sample queries

Use the sample queries for new connector creation, connector-to-mail-flow correlation, and external domain detection to investigate connector creation and suspicious mail activity.

- Run this KQL to check new connector creation.

  ```KQL
  //modify timeWindow to modify the lookback.
  let timeWindow = now(-7d); let timeNow = now();
  CloudAppEvents
  | where Timestamp between (timeWindow .. timeNow)
  | where isnotempty(AccountObjectId)
  | where ActionType == "New-InboundConnector"
  | mvexpand property = RawEventData.Parameters
  | extend ConnectorName = iff(property.Name == "Name", property.Value, ""), 
  IsEnabled = iff((property.Name == "Enabled" and property.Value == "True"), 
  true, false)
  | where isnotempty( ConnectorName) or IsEnabled
  | project-reorder ConnectorName, IsEnabled
  ```

- Run this KQL to correlate outbound connector changes with message flow to identify potentially malicious connector abuse. The query checks the volume of emails sent through the alerted connector within a configurable time window.

  ```KQL
  //modify timeWindow to modify the lookback.
  let timeWindow = now(-7d); let timeNow = now();
  let connectorOperations = pack_array("Set-OutboundConnector", 
  "New-OutboundConnector", "Set-InboundConnector", "New-InboundConnector");
  let mailThreshold = 100; //define threshold for inspection and filtering
  let myConnector= //use this code block to specify relevant connector(s)
  CloudAppEvents
  | where Timestamp between (timeWindow .. timeNow)
  | where ActionType has_any (connectorOperations)
  | mv-expand property = RawEventData.Parameters
  | where property.Name == "Name"
  | summarize by ConnectorName=tostring(property.Value)
  ;
  EmailEvents
  | where isnotempty( toscalar (myConnector))
  | where Timestamp between (timeWindow .. timeNow)
  | where isnotempty( SenderObjectId) and isnotempty( Connectors)
  | where Connectors in (toscalar (myConnector))
  | summarize MailCount = dcount(NetworkMessageId) by Connectors, 
  SenderObjectId, bin(Timestamp, 1h)
  | where MailCount >= mailThreshold
   ```

- Run this KQL to check whether emails are being sent to external domains.

  ```KQL
  //modify timeWindow to modify the lookback.
  let timeWindow = now(-7d); let timeNow = now();
  EmailEvents
  | where Timestamp between (timeWindow .. timeNow)
  | where isnotempty( SenderObjectId)
  | extend RecipientDomain= split(RecipientEmailAddress, "@")[1]
  | where (SenderFromDomain != RecipientDomain) or (SenderMailFromDomain 
  != RecipientDomain)
  | where EmailDirection !in ("Intra-org" , "Inbound") //comment this line to 
  look across all mailflow directions
  ```

  - If emails from the alerted connector are being sent to external domains, identify who else in the environment is sending similar emails (could indicate a compromised user if the recipient is in an unknown domain).

     ```KQL
     //modify timeWindow to modify the lookback.
     let timeWindow = now(-7d); let timeNow = now();
     let countThreshold= 100; //modify count threshold accordingly 
     EmailEvents
     | where Timestamp between (timeWindow .. timeNow)
     | where isnotempty( SenderObjectId)
     | extend RecipientDomain= split(RecipientEmailAddress, "@")[1]
     | where (SenderFromDomain != RecipientDomain) or (SenderMailFromDomain 
     != RecipientDomain)
     | where EmailDirection !in ("Intra-org" , "Inbound")
     | summarize MailCount= dcount(NetworkMessageId) by SenderObjectId, 
     SenderFromAddress, SenderMailFromAddress , bin(Timestamp, 1h)
     | where MailCount > countThreshold
     ```

    - Check the mail content for bad behavior
    - Look at URLs in the email or email having attachments.

### Query considerations

Consider the following admin logon checks when protecting recipients from malicious attack.

- Check for admin logins for those who frequently manage connectors from unusual locations (generate stats and exclude locations from where most successful logins are observed).

- Look for login failures from unusual locations. The following query correlates failed logon attempts with subsequent successful logons to detect potential brute-force compromises of admin accounts that manage connectors.

  ```kusto
  //modify timeWindow to modify the lookback.
  let timeWindow = now(-7d); let timeNow = now();
  let logonFail= materialize (
  IdentityLogonEvents
  | where Timestamp between (timeWindow .. timeNow)
  | where isnotempty(AccountObjectId)
  | where Application != "Active Directory"
  | where ActionType == "LogonFailed"
  | where ISP != "Microsoft Azure"
  | summarize failedLogonCount=count(), LatestTime = max(Timestamp), 
  EarliestTime = min(Timestamp) by AccountObjectId, Application, ISP, 
  CountryCode, bin(Timestamp, 60s)
  | where failedLogonCount > 100);
  // let hasLogonFails = isnotempty(toscalar (logonFail));
  let logonFailUsers = materialize ( logonFail | distinct AccountObjectId | 
  take 100);
  let hasLogonFails = isnotempty(toscalar (logonFailUsers));
  let logonSuccess=
  IdentityLogonEvents
  | where hasLogonFails
  | where Timestamp between (timeWindow .. timeNow)
  | where AccountObjectId in (logonFailUsers)
  | where Application != "Active Directory"
  | where ISP != "Microsoft Azure"
  | where ActionType == "LogonSuccess"
  | project SuccessTime= Timestamp, ReportId, AccountUpn, AccountObjectId, 
  ISP, CountryCode, Application;
  logonFail
  | join kind = innerunique logonSuccess on AccountObjectId, ISP, Application
  | where SuccessTime between (LatestTime .. (LatestTime + 10s))
  | summarize arg_min(SuccessTime, ReportId), EarliestFailedTime=min
  (EarliestTime), LatestFailedTime=max(LatestTime), failedLogonCount=
  take_any(failedLogonCount), SuccessLogonCount=count(), ISPSet=
  make_set(ISP), CountrySet=make_set(CountryCode), AppSet=make_set
  (Application) by AccountObjectId, AccountUpn
  | project-rename Timestamp=SuccessTime
  ```

## Recommended actions

Once you determine that the alert activity is a true positive (TP), classify the alert accordingly and perform the following actions:

- Disable or remove the connector that was found to be malicious.
- If the admin account was compromised, reset the admin's account credentials. Also, disable/revoke tokens for the compromised admin account and enable multi-factor authentication for all admin accounts.
- Look for suspicious activities performed by the admin.
- Check for other suspicious activities across other connectors in the environment.

## See also

- [Overview of alert classification](alert-classification-playbooks.md)
- [Investigate alerts](investigate-alerts.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
