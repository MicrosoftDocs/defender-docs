---
title: Attack surface reduction events in Windows Event Viewer
description: Use Windows Event Viewer custom views to review events from attack surface reduction rules, controlled folder access, exploit protection, and network protection.
author: chrisda
ms.author: chrisda
ms.service: defender-endpoint
ms.subservice: asr
ms.topic: how-to
ms.collection:
  - m365-security
  - tier2
  - mde-asr
ms.custom: msecd-doc-authoring-1012
ms.date: 04/22/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

#customer intent: As a security administrator, I want to view attack surface reduction events in Windows Event Viewer so that I can monitor and troubleshoot attack surface reduction capabilities.

---

# Attack surface reduction events in Windows Event Viewer

Reviewing events in Event Viewer is useful when you evaluate attack surface reduction features. For example, you can enable audit mode for features or settings, and then review what would happen if they were fully enabled. You can also view the effects of attack surface reduction feature when they're fully enabled.

This article describes how to use [Windows Event Viewer](/training/modules/manage-monitor-event-logs/) to view events from attack surface reduction (ASR) capabilities, including:

- [Attack surface reduction rules](attack-surface-reduction-rules-overview.md)
- [Controlled folder access](controlled-folders.md)
- [Exploit protection](exploit-protection.md)
- [Network protection](network-protection.md)

To view attack surface reduction events, you have the following options as explained in the rest of this article:

- [Browse attack surface reduction events in Windows Event Viewer](#browse-attack-surface-reduction-events-in-windows-event-viewer): How to navigate to attack surface reduction events in Event Viewer, and the event IDs for each attack surface reduction capability.
- [Use custom views in Windows Event Viewer to view attack surface reduction events](#use-custom-views-in-windows-event-viewer-to-view-attack-surface-reduction-events): How to create or import custom views to filter Event Viewer for specific ASR capabilities, and ready-to-use XML query templates.

> [!TIP]
> You can use [Windows Event Forwarding](/windows/security/operating-system-security/device-management/use-windows-event-forwarding-to-assist-in-intrusion-detection) to centralize attack surface reduction event collection from multiple devices.
>
> The Microsoft Defender portal also provides reporting for attack surface reduction features that's easier to use than Windows Event Viewer:
>
> - [Attack surface reduction rules report](attack-surface-reduction-rules-report.md)
> - [Controlled folder access report](controlled-folders.md)
> - [Exploit protection report](exploit-protection.md)
> - [Network protection report](network-protection.md)

## Browse attack surface reduction events in Windows Event Viewer

All attack surface reduction events are located in **Applications and Services Logs**. To view attack surface reduction events, do the following steps:

1. Select **Start**, type **Event Viewer**, and then press **Enter** to open Event Viewer.

1. In Event Viewer, expand **Applications and Services Logs** \> **Microsoft** \> **Windows**.

1. Continue to expand the path for the different types of attack surface reduction events as described in the following subsections.

1. Find and filter the events you want to see as described in the following subsections.

### ASR rule events

ASR rule events are located in the **Windows Defender** \> **Operational** log:

|Event ID|Description|
|:---:|---|
|1121|Event when rule fires in block mode|
|1122|Event when rule fires in audit mode|
|1129|Event when user overrides block in warn mode|
|5007|Event when settings are changed|

### Controlled folder access events

Controlled folder access events are located in **Windows Defender** \> **Operational**.

|Event ID|Description|
|:---:|---|
|5007|Event when settings are changed|
|1124|Audited controlled folder access event|
|1123|Blocked controlled folder access event|
|1127|Blocked controlled folder access sector write block event|
|1128|Audited controlled folder access sector write block event|

### Exploit protection events

The following exploit protection events are located in the **Security-Mitigations** \> **Kernel Mode** and **Security-Mitigations** \> **User Mode** logs:

|Event ID|Description|
|:---:|---|
|1|ACG audit|
|2|ACG enforce|
|3|Don't allow child processes audit|
|4|Don't allow child processes block|
|5|Block low integrity images audit|
|6|Block low integrity images block|
|7|Block remote images audit|
|8|Block remote images block|
|9|Disable win32k system calls audit|
|10|Disable win32k system calls block|
|11|Code integrity guard audit|
|12|Code integrity guard block|
|13|EAF audit|
|14|EAF enforce|
|15|EAF+ audit|
|16|EAF+ enforce|
|17|IAF audit|
|18|IAF enforce|
|19|ROP StackPivot audit|
|20|ROP StackPivot enforce|
|21|ROP CallerCheck audit|
|22|ROP CallerCheck enforce|
|23|ROP SimExec audit|
|24|ROP SimExec enforce|

The following exploit protection event is located in the **WER-Diagnostics** \> **Operational** log:

|Event ID|Description|
|:---:|---|
|5|CFG Block|

The following exploit protection event is located in the **Win32k** \> **Operational** log:

|Event ID|Description|
|:---:|---|
|260|Untrusted Font|

### Network protection events

Network protection events are located in **Windows Defender** \> **Operational**.

|Event ID|Description|
|:---:|---|
|5007|Event when settings are changed|
|1125|Event when network protection fires in audit mode|
|1126|Event when network protection fires in block mode|

## Use custom views in Windows Event Viewer to view attack surface reduction events

You can create custom views in Windows Event Viewer to see only the events for specific attack surface reduction capabilities. The easiest way is to import a custom view as an XML file. You can also copy the XML directly into Event Viewer.

For ready-to-use XML templates, see the [Custom XML templates for attack surface reduction events](#custom-xml-templates-for-attack-surface-reduction-events) section.

### Import an existing XML custom view

1. Create an empty .txt file and copy the XML for the custom view you want to use into the .txt file. Do this step for each of the custom views you want to use. Rename the files as follows (ensure you change the type from .txt to .xml):

   - Controlled folder access events custom view: *cfa-events.xml*
   - Exploit protection events custom view: *ep-events.xml*
   - Attack surface reduction events custom view: *asr-events.xml*
   - Network protection events custom view: *np-events.xml*

1. Select **Start**, type **Event Viewer**, and then press **Enter** to open Event Viewer.

1. Select **Action** \> **Import Custom View...**

   > [!div class="mx-imgBorder"]
   > ![Animation that shows how to import a custom view in Event Viewer.](media/events-import.gif)

1. Navigate to the XML file for the custom view you want and select it.

1. Select **Open**.

The custom view filters to show only the events related to that feature.

### Copy the XML directly

1. Select **Start**, type **Event Viewer**, and then press **Enter** to open Event Viewer.

1. In the **Actions** pane, select **Create Custom View...**

1. Go to the XML tab and select **Edit query manually**. A warning indicates that you can't edit the query using the **Filter** tab when you use the XML option. Select **Yes**.

1. Paste the XML code for the feature you want to filter events from into the XML section.

1. Select **OK**. Specify a name for your filter. The custom view filters to show only the events related to that feature.

### Custom XML templates for attack surface reduction events

#### XML for attack surface reduction rule events

```xml
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-Windows Defender/Operational">
   <Select Path="Microsoft-Windows-Windows Defender/Operational">*[System[(EventID=1121 or EventID=1122 or EventID=5007)]]</Select>
   <Select Path="Microsoft-Windows-Windows Defender/WHC">*[System[(EventID=1121 or EventID=1122 or EventID=5007)]]</Select>
  </Query>
</QueryList>
```

#### XML for controlled folder access events

```xml
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-Windows Defender/Operational">
   <Select Path="Microsoft-Windows-Windows Defender/Operational">*[System[(EventID=1123 or EventID=1124 or EventID=5007)]]</Select>
   <Select Path="Microsoft-Windows-Windows Defender/WHC">*[System[(EventID=1123 or EventID=1124 or EventID=5007)]]</Select>
  </Query>
</QueryList>
```

#### XML for exploit protection events

```xml
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-Security-Mitigations/KernelMode">
   <Select Path="Microsoft-Windows-Security-Mitigations/KernelMode">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/Concurrency">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/Contention">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/Messages">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/Operational">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/Power">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/Render">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/Tracing">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Win32k/UIPI">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="System">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
   <Select Path="Microsoft-Windows-Security-Mitigations/UserMode">*[System[Provider[@Name='Microsoft-Windows-Security-Mitigations' or @Name='Microsoft-Windows-WER-Diag' or @Name='Microsoft-Windows-Win32k' or @Name='Win32k'] and ( (EventID &gt;= 1 and EventID &lt;= 24)  or EventID=5 or EventID=260)]]</Select>
  </Query>
</QueryList>
```

#### XML for network protection events

```xml
<QueryList>
 <Query Id="0" Path="Microsoft-Windows-Windows Defender/Operational">
  <Select Path="Microsoft-Windows-Windows Defender/Operational">*[System[(EventID=1125 or EventID=1126 or EventID=5007)]]</Select>
  <Select Path="Microsoft-Windows-Windows Defender/WHC">*[System[(EventID=1125 or EventID=1126 or EventID=5007)]]</Select>
 </Query>
</QueryList>
```

## Related content

- [Attack surface reduction capabilities overview](attack-surface-reduction-overview.md)
- [Attack surface reduction rules overview](attack-surface-reduction-rules-overview.md)
- [Protect important folders with controlled folder access](controlled-folders.md)
- [Protect devices from exploits](exploit-protection.md)
- [Network protection](network-protection.md)
