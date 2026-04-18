---
title: View attack surface reduction events in Windows Event Viewer
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
ms.date: 04/17/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus

#customer intent: As a security administrator, I want to view attack surface reduction events in Windows Event Viewer so that I can monitor and troubleshoot attack surface reduction capabilities.

---

# View attack surface reduction events in Windows Event Viewer

Review attack surface reduction events in Windows Event Viewer to monitor which rules or settings are working. You can also determine if any settings are too noisy or are affecting your day-to-day workflow.

Reviewing events is useful when you evaluate attack surface reduction features. You can enable audit mode for features or settings, and then review what would happen if they were fully enabled.

If you have a Microsoft Defender for Endpoint Plan 2 subscription, you get detailed reporting into events, blocks, and warnings in the Microsoft Defender portal.

## Create custom views

To see events for specific attack surface reduction capabilities, create custom views in Windows Event Viewer. The easiest way is to import a custom view as an XML file. You can copy the XML directly from the [Custom XML templates](#custom-xml-templates-for-attack-surface-reduction-events) section.

You can also manually navigate to the event area that corresponds to the feature.

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

## Attack surface reduction event reference

All attack surface reduction events are located under **Applications and Services Logs** \> **Microsoft** \> **Windows** and then the folder or provider as described in the following tables.

You can access these events in Windows Event Viewer:

1. Select **Start**, type **Event Viewer**, and then press **Enter** to open Event Viewer.

1. Expand **Applications and Services Logs** \> **Microsoft** \> **Windows** and then go to the folder listed under **Provider/source** in the following table.

1. To see events, double-click the subitem. Scroll through the events to find the one you're looking for.

### Exploit protection events

|Provider/source|Event ID|Description|
|---|:---:|---|
|Security-Mitigations (Kernel Mode/User Mode)|1|ACG audit|
|Security-Mitigations (Kernel Mode/User Mode)|2|ACG enforce|
|Security-Mitigations (Kernel Mode/User Mode)|3|Don't allow child processes audit|
|Security-Mitigations (Kernel Mode/User Mode)|4|Don't allow child processes block|
|Security-Mitigations (Kernel Mode/User Mode)|5|Block low integrity images audit|
|Security-Mitigations (Kernel Mode/User Mode)|6|Block low integrity images block|
|Security-Mitigations (Kernel Mode/User Mode)|7|Block remote images audit|
|Security-Mitigations (Kernel Mode/User Mode)|8|Block remote images block|
|Security-Mitigations (Kernel Mode/User Mode)|9|Disable win32k system calls audit|
|Security-Mitigations (Kernel Mode/User Mode)|10|Disable win32k system calls block|
|Security-Mitigations (Kernel Mode/User Mode)|11|Code integrity guard audit|
|Security-Mitigations (Kernel Mode/User Mode)|12|Code integrity guard block|
|Security-Mitigations (Kernel Mode/User Mode)|13|EAF audit|
|Security-Mitigations (Kernel Mode/User Mode)|14|EAF enforce|
|Security-Mitigations (Kernel Mode/User Mode)|15|EAF+ audit|
|Security-Mitigations (Kernel Mode/User Mode)|16|EAF+ enforce|
|Security-Mitigations (Kernel Mode/User Mode)|17|IAF audit|
|Security-Mitigations (Kernel Mode/User Mode)|18|IAF enforce|
|Security-Mitigations (Kernel Mode/User Mode)|19|ROP StackPivot audit|
|Security-Mitigations (Kernel Mode/User Mode)|20|ROP StackPivot enforce|
|Security-Mitigations (Kernel Mode/User Mode)|21|ROP CallerCheck audit|
|Security-Mitigations (Kernel Mode/User Mode)|22|ROP CallerCheck enforce|
|Security-Mitigations (Kernel Mode/User Mode)|23|ROP SimExec audit|
|Security-Mitigations (Kernel Mode/User Mode)|24|ROP SimExec enforce|
|WER-Diagnostics|5|CFG Block|
|Win32K (Operational)|260|Untrusted Font|

### Network protection events

|Provider/source|Event ID|Description|
|---|:---:|---|
|Windows Defender (Operational)|5007|Event when settings are changed|
|Windows Defender (Operational)|1125|Event when network protection fires in audit mode|
|Windows Defender (Operational)|1126|Event when network protection fires in block mode|

### Controlled folder access events

|Provider/source|Event ID|Description|
|---|:---:|---|
|Windows Defender (Operational)|5007|Event when settings are changed|
|Windows Defender (Operational)|1124|Audited controlled folder access event|
|Windows Defender (Operational)|1123|Blocked controlled folder access event|
|Windows Defender (Operational)|1127|Blocked controlled folder access sector write block event|
|Windows Defender (Operational)|1128|Audited controlled folder access sector write block event|

### Attack surface reduction rule events

|Provider/source|Event ID|Description|
|---|:---:|---|
|Windows Defender (Operational)|5007|Event when settings are changed|
|Windows Defender (Operational)|1122|Event when rule fires in audit mode|
|Windows Defender (Operational)|1121|Event when rule fires in block mode|

> [!NOTE]
> For ASR rules [that support **Warn** mode](attack-surface-reduction-rules-reference.md#asr-rule-modes), users receive a notification pop-up.

## Custom XML templates for attack surface reduction events

### XML for attack surface reduction rule events

```xml
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-Windows Defender/Operational">
   <Select Path="Microsoft-Windows-Windows Defender/Operational">*[System[(EventID=1121 or EventID=1122 or EventID=5007)]]</Select>
   <Select Path="Microsoft-Windows-Windows Defender/WHC">*[System[(EventID=1121 or EventID=1122 or EventID=5007)]]</Select>
  </Query>
</QueryList>
```

### XML for controlled folder access events

```xml
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-Windows Defender/Operational">
   <Select Path="Microsoft-Windows-Windows Defender/Operational">*[System[(EventID=1123 or EventID=1124 or EventID=5007)]]</Select>
   <Select Path="Microsoft-Windows-Windows Defender/WHC">*[System[(EventID=1123 or EventID=1124 or EventID=5007)]]</Select>
  </Query>
</QueryList>
```

### XML for exploit protection events

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

### XML for network protection events

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
