---
title: Listen for SIEM events | Microsoft Defender for Identity
description: Learn how to configure your Microsoft Defender for Identity sensor to listen for SIEM events and enhance your detection abilities with extra Windows events.
ms.date: 08/10/2023
ms.topic: how-to
---

# Listen for SIEM events on your Defender for Identity standalone sensor

This article describes the required message syntax when configuring a Defender for Identity standalone sensor to listen for supported SIEM event types. Listening for SIEM events is one method for enhancing your detection abilities with extra Windows events that aren't available from the domain controller network.

For more information, see [Windows event collection overview](event-collection-overview.md).

> [!IMPORTANT]
> Defender for Identity standalone sensors do not support the collection of Event Tracing for Windows (ETW) log entries that provide the data for multiple detections. For full coverage of your environment, we recommend deploying the Defender for Identity sensor.

## RSA Security Analytics

Use the following message syntax to configure your standalone sensor to listen for RSA Security Analytics events:

```text
<Syslog Header>RsaSA\n2015-May-19 09:07:09\n4776\nMicrosoft-Windows-Security-Auditing\nSecurity\XXXXX.subDomain.domain.org.il\nYYYYY$\nMMMMM \n0x0
```

In this syntax:

- The syslog header is optional.

- The `\n` character separator is required between all fields.

- The fields, in order, are:

  1. (Required) RsaSA constant
  1. The timestamp of the actual event. Make sure that it's not the timestamp of the *arrival* to the SIEM, or when it's sent to Defender for Identity. We highly recommend using an accuracy of milliseconds.
  1. The Windows event ID
  1. The Windows event provider name
  1. The Windows event log name
  1. The name of the computer receiving the event, such as the domain controller
  1. The name of the user authenticating
  1. The name of the source host name
  1. The result code of the NTLM

> [!IMPORTANT]
> The order of the fields is important and nothing else should be included in the message.

## MicroFocus ArcSight

Use the following message syntax to configure your standalone sensor to listen for MicroFocus ArcSight events:

```text
CEF:0|Microsoft|Microsoft Windows||Microsoft-Windows-Security-Auditing:4776|The domain controller attempted to validate the credentials for an account.|Low| externalId=4776 cat=Security rt=1426218619000 shost=KKKKKK dhost=YYYYYY.subDomain.domain.com duser=XXXXXX cs2=Security cs3=Microsoft-Windows-Security-Auditing cs4=0x0 cs3Label=EventSource cs4Label=Reason or Error Code
```

In this syntax:

- Your message must comply with the protocol definition.

- No syslog header is included.

- The header part, separated by a *pipe* (**|**) must be included, as stated in the protocol

- The following keys in the *Extension* part must be present in the event:

    |Key  |Description  |
    |---------|---------|
    |**externalId**     | The Windows event ID        |
    |**rt**     | The timestamp of the actual event. Make sure that the value isn't the timestamp of the *arrival* to the SIEM, or when it's sent to Defender for Identity. Also make sure to use an accuracy of milliseconds.   |
    |**cat**     |     The Windows event log name    |
    |**shost**     |   The source host name      |
    |**dhost**     |   The computer receiving the event, such as the domain controller      |
    |**duser**     |    The user authenticating     |
    
    The order isn't important for the *Extension* part.

- You must have a custom key and **keyLable** for the following fields:

    - `EventSource`
    - `Reason or Error Code` = The result code of the NTLM

## Splunk

Use the following message syntax to configure your standalone sensor to listen for Splunk events:

```text
<Syslog Header>\r\nEventCode=4776\r\nLogfile=Security\r\nSourceName=Microsoft-Windows-Security-Auditing\r\nTimeGenerated=20150310132717.784882-000\r\ComputerName=YYYYY\r\nMessage=
```

In this syntax:

- The syslog header is optional.

- There's a `\r\n` character separator between all required fields. These are `CRLF` control characters, (`0D0A` in hex), and not literal characters.

- The fields are in `key=value` format.

- The following keys must exist and have a value:

    |Name  |Description  |
    |---------|---------|
    |**EventCode**     |   The Windows event ID      |
    |**Logfile**     |The Windows event log name         |
    |**SourceName**     |   The Windows event provider name      |
    |**TimeGenerated**     |    The timestamp of the actual event. Make sure that the value isn't the timestamp of the *arrival* to the SIEM, or when it's sent to Defender for Identity. The timestamp format must be `The format should match yyyyMMddHHmmss.FFFFFF`, and you must use an accuracy of milliseconds.    |
    |**ComputerName**     |    The source host name     |
    |**Message**     |     The original event text from the Windows event    |

- The *Message Key* and value must be last.

- The order isn't important for the key=value pairs.

A message similar to the following appears:

```bash
The computer attempted to validate the credentials for an account.

Authentication Package: MICROSOFT_AUTHENTICATION_PACKAGE_V1_0

Logon Account: Administrator

Source Workstation: SIEM

Error Code: 0x0
```


## QRadar

QRadar enables event collection via an agent. If the data is gathered using an agent, the time format is gathered without millisecond data.

Because Defender for Identity needs millisecond data, you must first configure QRadar to use agentless Windows event collection. For more information, see [QRadar: Agentless Windows Events Collection using the MSRPC Protocol](https://www.ibm.com/support/pages/qradar-agentless-windows-events-collection-using-msrpc-protocol-msrpc-faq).

Use the following message syntax to configure your standalone sensor to listen for QRadar events:

```text
<13>Feb 11 00:00:00 %IPADDRESS% AgentDevice=WindowsLog AgentLogFile=Security Source=Microsoft-Windows-Security-Auditing Computer=%FQDN% User= Domain= EventID=4776 EventIDCode=4776 EventType=8 EventCategory=14336 RecordNumber=1961417 TimeGenerated=1456144380009 TimeWritten=1456144380009 Message=The computer attempted to validate the credentials for an account. Authentication Package: MICROSOFT_AUTHENTICATION_PACKAGE_V1_0 Logon Account: Administrator Source Workstation: HOSTNAME Error Code: 0x0
```

In this syntax, you must include the following fields:

- The agent type for the collection
- The Windows event log provider name
- The Windows event log source
- The DC fully qualified domain name
- The Windows event ID
- `TimeGenerated`, which is the timestamp of the actual event. Make sure that the value isn't the timestamp of the *arrival* to the SIEM, or when it's sent to Defender for Identity. The timestamp format must be `The format should match yyyyMMddHHmmss.FFFFFF`, and must have an accuracy of milliseconds.

Make sure that the message includes the original event text from the Windows event, and that you have `\t` between the key=value pairs.

>[!NOTE]
> Using WinCollect for Windows event collection is not supported.

## Related content

For more information, see:

- [Configure port mirroring](configure-port-mirroring.md)
- [Configure Windows event forwarding to your Defender for Identity standalone sensor](configure-event-forwarding.md)