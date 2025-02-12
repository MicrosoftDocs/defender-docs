---
title: Use network protection to help prevent connections to malicious or suspicious sites
description: Protect your network by preventing users from accessing known malicious and suspicious network addresses
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 02/10/2025
audience: ITPro
author: denisebmsft
ms.author: deniseb
ms.reviewer: 
manager: deniseb
ms.custom: asr
ms.subservice: asr
ms.topic: overview
ms.collection: 
- m365-security
- tier2
- mde-asr
search.appverid: met150
---

# Use network protection to help prevent connections to malicious or suspicious sites

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1 and 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- Microsoft Defender Antivirus

**Platforms**

- Windows
- macOS
- Linux

Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us).

## Overview of network protection

Network protection helps protect devices from certain Internet-based events by preventing connections to malicious or suspicious sites. Network protection is an attack surface reduction capability that helps prevent people in your organization from accessing domains that are considered dangerous through applications. Examples of dangerous domains are domains that host phishing scams, exploits, and other malicious content on the Internet. Network protection expands the scope of [Microsoft Defender SmartScreen](/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview) to block all outbound HTTP(S) traffic that attempts to connect to low-reputation sources (based on the domain or hostname).

Network protection extends the protection in [Web protection](web-protection-overview.md) to the operating system level, and is a core component for [Web Content Filtering](web-content-filtering.md) (WCF). It provides the web protection functionality found in Microsoft Edge to other supported browsers and nonbrowser applications. Network protection also provides visibility and blocking of indicators of compromise (IOCs) when used with [Endpoint detection and response](overview-endpoint-detection-response.md). For example, network protection works with your [custom indicators](indicators-overview.md) that you can use to block specific domains or host names.

### Network protection coverage

The following table summarizes network protection areas of coverage.

| Feature | Microsoft Edge | Non-Microsoft browsers | Nonbrowser processes <br/> (for example, PowerShell) |
|:---|:---|:---|:---|
| [Web Threat Protection](web-threat-protection.md) | SmartScreen must be enabled | Network protection must be in block mode | Network protection must be in block mode |
| [Custom Indicators](indicators-overview.md) | SmartScreen must be enabled | Network protection must be in block mode | Network protection must be in block mode |
| [Web Content Filtering](web-content-filtering.md) | SmartScreen must be enabled | Network protection must be in block mode | Not supported |

> [!NOTE]
> On Mac and Linux, you must have network protection in block mode for these features to be supported in the Microsoft Edge browser.
> On Windows, network protection doesn't monitor Microsoft Edge. For processes other than Microsoft Edge and Internet Explorer, web protection scenarios leverage network protection for inspection and enforcement.

### Known issues & limitations

- IP is supported for all three protocols (`TCP`, `HTTP`, and `HTTPS` (TLS)).
- Only single IP addresses are supported (no CIDR blocks or IP ranges) in custom indicators.
- Encrypted URLs (full path) are only blocked on Microsoft browsers (Internet Explorer, Microsoft Edge).
- Encrypted URLs (FQDN only) are blocked in non-Microsoft browsers.
- URLs loaded via HTTP connection coalescing, such as content loaded by modern CDNs, are only blocked on Microsoft browsers (Internet Explorer, Microsoft Edge), unless the CDN URL itself is added to the indicator list.
- Network Protection will block connections on both standard and non-standard ports.
- Full URL path blocks are applied for unencrypted URLs.

There might be up to two hours of latency (usually less) between the time when the action is taken and the URL/IP is blocked.
 
Watch this video to learn how network protection helps reduce the attack surface of your devices from phishing scams, exploits, and other malicious content:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=2d0270f9-f216-4e9e-85c7-5e2b183c6d73]

## Requirements for network protection

Network protection requires devices running one of the following operating systems:

- Windows 10 or 11 (Pro or Enterprise) (see [Supported Windows versions](minimum-requirements.md#supported-windows-versions))
- Windows Server, version 1803 or later (see [Supported Windows versions](minimum-requirements.md#supported-windows-versions))
- macOS version 12 (Monterey) or later (see [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md))
- A supported Linux version (see [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md))

Network protection also requires Microsoft Defender Antivirus with real-time protection enabled.

| Windows version | Microsoft Defender Antivirus |
|:---|:---|
| Windows 10 version 1709 or later, Windows 11, Windows Server 1803 or later | Make sure that [Microsoft Defender Antivirus real-time protection](configure-real-time-protection-microsoft-defender-antivirus.md), [behavior monitoring](behavior-monitor.md), and [cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md) are enabled (active) |
| Windows Server 2012 R2 and Windows Server 2016 using the [modern unified agent](/defender-endpoint/configure-server-endpoints#functionality-in-the-modern-unified-solution) | Platform update version `4.18.2001.x.x` or newer |

## Why network protection is important

Network protection is a part of the [attack surface reduction](overview-attack-surface-reduction.md) group of solutions in Microsoft Defender for Endpoint. Network protection enables the network layer to block URLs and IP addresses. Network protection can block URLs from being accessed by using certain browsers and standard network connections. By default, network protection guards your computers from known malicious URLs using the SmartScreen feed, which blocks malicious URLs in a manner similar to SmartScreen in Microsoft Edge browser. The network protection functionality can be extended to:

- Block IP/URL addresses from your own threat intelligence ([indicators](indicator-ip-domain.md))
- Block unsanctioned services from [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps)
- Block browser access to websites based on category ([Web content filtering](web-content-filtering.md))

Network protection is a critical part of the Microsoft protection and response stack.

> [!TIP]
> For details about network protection for Windows Server, Linux, MacOS and Mobile Threat Defense (MTD), see [Proactively hunt for threats with advanced hunting](/defender-xdr/advanced-hunting-overview).

### Block Command and Control attacks

Command and Control (C2) server computers are used by malicious users to send commands to systems previously compromised by malware. C2 attacks typically hide in cloud-based services such as file-sharing and webmail services, enabling the C2 servers to avoid detection by blending in with typical traffic.

C2 servers can be used to initiate commands that can:

- Steal data
- Control compromised computers in a botnet
- Disrupt legitimate applications
- Spread malware, such as ransomware

The network protection component of Defender for Endpoint identifies and blocks connections to C2 infrastructures used in human-operated ransomware attacks, using techniques like machine learning and intelligent indicator-of-compromise (IoC) identification.

#### Network protection: C2 detection and remediation

In its initial form, ransomware is a commodity threat that's preprogrammed and focused on limited, specific outcomes (like encrypting a computer). However, ransomware has evolved into a sophisticated threat that is human-driven, adaptive, and focused on larger scale and more widespread outcomes, like holding an entire organization's assets or data for ransom.

Support for Command and Control servers (C2) is an important part of this ransomware evolution, and it's what enables these attacks to adapt to the environment they target. Breaking the link to the command-and-control infrastructure stops the progression of an attack to its next stage. For more information about C2 detection and remediation, see [Detecting and remediating command and control attacks at the network layer](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/detecting-and-remediating-command-and-control-attacks-at-the/ba-p/3650607).

#### Network protection: New toast notifications

| New mapping  | Response category  | Sources |
| --- | --- | --- |
| `phishing` | `Phishing` | `SmartScreen` |
| `malicious` | `Malicious` | `SmartScreen` |
| `command and control` | `C2` | `SmartScreen` |
| `command and control` | `COCO` | `SmartScreen` |
| `malicious` | `Untrusted` | `SmartScreen` |
| `by your IT admin` | `CustomBlockList` |   |
| `by your IT admin` | `CustomPolicy` |   |

> [!NOTE]
> `customAllowList` does not generate notifications on endpoints.

### New notifications for network protection determination

New capabilities in network protection use functions in SmartScreen to block phishing activities from malicious command and control sites. When an end user attempts to visit a website in an environment in which network protection is enabled, three scenarios are possible, as outlined in the following table:

| Scenario | What happens |
|--|--|
| The URL has a known good reputation | The user is permitted access without obstruction, and there's no toast notification presented on the endpoint. In effect, the domain or URL is set to *Allowed*. |
| The URL has an unknown or uncertain reputation | The user's access is blocked, but with the ability to circumvent (unblock) the block. In effect, the domain or url is set to *Audit*. |
| The URL has a known bad (malicious) reputation | The user is prevented from access. In effect, the domain or url is set to *Block*. |

#### Warn experience

A user visits a website. If the url has an unknown or uncertain reputation, a toast notification presents the user with the following options:

- **Ok**: The toast notification is released (removed), and the attempt to access the site is ended.
- **Unblock**: The user has access to the site for 24 hours; at which point the block is reenabled. The user can continue to use **Unblock** to access the site until such time that the administrator prohibits (blocks) the site, thus removing the option to **Unblock**.
- **Feedback**: The toast notification presents the user with a link to submit a ticket, which the user can use to submit feedback to the administrator in an attempt to justify access to the site.

:::image type="content" source="media/network-protection-phishing-warn-2.png" alt-text="Shows a network protection phishing content warn notification.":::

> [!NOTE]
> The images shown in this article for both the `warn` experience and `block` experience use "blocked url" as example placeholder text. In a functioning environment, the actual url or domain is listed.  

#### Use CSP to enable `Convert warn verdict to block`

[/windows/client-management/mdm/defender-csp](/windows/client-management/mdm/defender-csp#configurationenableconvertwarntoblock)

#### Use Group Policy to enable Convert warn verdict to block

By enabling this setting, network protection blocks network traffic instead of displaying a warning.

1. On your Group Policy management computer, open the [Group Policy Management Console](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731212(v=ws.11)).

2. Right-click the Group Policy Object you want to configure, and then select **Edit**.

3. In the **Group Policy Management Editor** go to **Computer configuration** and then select **Administrative templates**.

4. Expand the tree to **Windows components** > **Microsoft Defender Antivirus** > **Network inspection system**.

5. Double-click **Convert warn verdict to block** and set the option to **Enabled**.

6. Select **OK**. 

#### Block experience

A user visits a website. If the url has a bad reputation, a toast notification presents the user with the following options:

- **Ok**: The toast notification is released (removed), and the attempt to access the site is ended.
- **Feedback**: The toast notification presents the user with a link to submit a ticket, which the user can use to submit feedback to the administrator in an attempt to justify access to the site.

:::image type="content" source="media/network-protection-phishing-blocked.png" alt-text="Shows a network protection known phishing content blocked notification." lightbox="media/network-protection-phishing-blocked.png":::

## SmartScreen Unblock

With indicators in Defender for Endpoint, administrators can allow end users to bypass warnings that are generated for some URLs and IPs. Depending on why the URL is blocked, when a SmartScreen block is encountered, it could offer the user the ability to unblock the site for up to 24 hours. In such cases, a Windows Security toast notification appears, permitting the user to select **Unblock**. In such cases, the URL or IP is unblocked for the specified period of time.  

:::image type="content" source="media/network-protection-smart-screen-block-notification.png" alt-text="Windows Security notification for network protection.":::

Microsoft Defender for Endpoint administrators can configure SmartScreen Unblock functionality in the [Microsoft Defender portal](https://security.microsoft.com) using an allow indicator for IPs, URLs, and domains.

:::image type="content" source="media/network-protection-smart-screen-block-configuration.png" alt-text="Network protection SmartScreen block configuration URL and IP form.":::

See [Create indicators for IPs and URLs/domains](indicator-ip-domain.md).

## Using network protection

Network protection is enabled per device, which is typically done using your management infrastructure. For supported methods, see [Turn on network protection](enable-network-protection.md).

> [!NOTE]
> Microsoft Defender Antivirus must be in active mode to enable network protection.

You can enable network protection in `audit` mode or `block` mode. If you want to evaluate the impact of enabling network protection before actually blocking IP addresses or URLs, you can enable network protection in audit mode, and gather data on what would be blocked. Audit mode logs whenever end users connect to an address or site that would otherwise be blocked by network protection. In order for indicators of compromise (IoC) or Web content filtering (WCF) to work, network protection must be in `block` mode.

For information about network protection for Linux and macOS see the following articles: 

- [Network protection for Linux](network-protection-linux.md)
- [Network protection for macOS](network-protection-macos.md)

## Advanced hunting

If you're using advanced hunting to identify audit events, you have up to 30 days history available from the console. See [Advanced hunting](/defender-xdr/advanced-hunting-overview).

You can find the audit events in **Advanced hunting** in the Defender for Endpoint portal ([https://security.microsoft.com](https://security.microsoft.com)).  

Audit events are in DeviceEvents with an ActionType of `ExploitGuardNetworkProtectionAudited`. Blocks are shown with an ActionType of `ExploitGuardNetworkProtectionBlocked`.  

Here's an example query for viewing Network Protection events for non-Microsoft browsers:

```kusto

DeviceEvents
|where ActionType in ('ExploitGuardNetworkProtectionAudited','ExploitGuardNetworkProtectionBlocked')

```

:::image type="content" source="media/network-protection-advanced-hunting.png" alt-text="Advanced hunting for auditing and identifying events." lightbox="media/network-protection-advanced-hunting.png":::

> [!TIP]
> These entries have data in the **AdditionalFields** column which gives you great info around the action, if you expand **AdditionalFields** you can also get the fields: **IsAudit**, **ResponseCategory**, and **DisplayName**.

Here's another example:

```kusto

DeviceEvents
|where ActionType contains "ExploitGuardNetworkProtection"
|extend ParsedFields=parse_json(AdditionalFields)
|project DeviceName, ActionType, Timestamp, RemoteUrl, InitiatingProcessFileName, IsAudit=tostring(ParsedFields.IsAudit), ResponseCategory=tostring(ParsedFields.ResponseCategory), DisplayName=tostring(ParsedFields.DisplayName)
|sort by Timestamp desc

```

The Response category tells you what caused the event, as in this example:

| ResponseCategory | Feature responsible for the event |
|:---|:---|
| `CustomPolicy` |  WCF  |
| `CustomBlockList`  |   Custom indicators   |
| `CasbPolicy`   |   Defender for Cloud Apps   |
| `Malicious`   |   Web threats  |
| `Phishing`  |   Web threats  |

For more information, see [Troubleshoot endpoint blocks](web-protection-overview.md#troubleshoot-endpoint-blocks).

If you're using the Microsoft Edge browser, use this query for Microsoft Defender SmartScreen events:

```kusto

DeviceEvents
| where ActionType == "SmartScreenUrlWarning"
| extend ParsedFields=parse_json(AdditionalFields)
| project DeviceName, ActionType, Timestamp, RemoteUrl, InitiatingProcessFileName 

```

You can use the resulting list of URLs and IPs to determine what would be blocked if network protection is set to block mode on the device. You can also see which features would block URLs and IPs. Review the list to identify any URLS or IPs that are necessary for your environment. You can then create an allow indicator for those URLs or IP addresses. Allow indicators take precedence over any blocks.

Once you've created an indicator, you can look at resolving the underlying issue as follows:

- **SmartScreen**: request review
- **Indicator**: modify existing indicator
- **MCA**: review unsanctioned app
- **WCF**: request recategorization

Using this data you can make an informed decision on enabling network protection in Block mode. See [Order of precedence for Network protection blocks](web-protection-overview.md#order-of-precedence).

> [!NOTE]
> As this is a per-device setting, if there are devices that cannot move to Block mode you can simply leave them on audit until you can rectify the challenge and you will still receive the auditing events.

For information about how to report false positives see [Report false positives](web-protection-overview.md#report-false-positives).

For details on how to create your own Power BI reports, see [Create custom reports using Power BI](api/api-power-bi.md).

## Configuring network protection

For more information about how to enable network protection, see **[Enable network protection](enable-network-protection.md)**. Use Group Policy, PowerShell, or MDM CSPs to enable and manage network protection in your network.

After you've enabled network protection, you might need to configure your network or firewall to allow the connections between your endpoint devices and the web services:

- `.smartscreen.microsoft.com`
- `.smartscreen-prod.microsoft.com`

## Viewing network protection events

Network protection works best with [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md), which gives you detailed reporting into exploit protection events and blocks as part of [alert investigation scenarios](investigate-alerts.md).

When network protection blocks a connection, a notification is displayed from the Action Center. Your security operations team can [customize the notification](attack-surface-reduction-rules-deployment-implement.md#customize-attack-surface-reduction-rules) with your organization's details and contact information. In addition, individual attack surface reduction rules can be enabled and customized to suit certain techniques to monitor.

You can also use [audit mode](overview-attack-surface-reduction.md) to evaluate how network protection would impact your organization if it were enabled.

<a name='review-network-protection-events-in-the-microsoft-365-defender-portal'></a>

## Review network protection events in the Microsoft Defender portal

Defender for Endpoint provides detailed reporting into events and blocks as part of its [alert investigation scenarios](investigate-alerts.md). You can view these details in the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) in the [alerts queue](review-alerts.md) or by using [advanced hunting](/defender-xdr/advanced-hunting-overview). If you're using [audit mode](overview-attack-surface-reduction.md), you can use advanced hunting to see how network protection settings would affect your environment if they were enabled.

## Review network protection events in Windows Event Viewer

You can review the Windows event log to see events that are created when network protection blocks (or audits) access to a malicious IP or domain:

1. [Copy the XML directly](/defender-endpoint/overview-attack-surface-reduction#copy-the-xml-directly).

2. Select **OK**.

This procedure creates a custom view that filters to only show the following events related to network protection:

|Event ID|Description|
|---|---|
|`5007`|Event when settings are changed|
|`1125`|Event when network protection fires in audit mode|
|`1126`|Event when network protection fires in block mode|

## Network protection and the TCP three-way handshake

With network protection, the determination of whether to allow or block access to a site is made after the completion of the [three-way handshake via TCP/IP](/troubleshoot/windows-server/networking/three-way-handshake-via-tcpip). Thus, when network protection blocks a site, you might see an action type of `ConnectionSuccess` under [`DeviceNetworkEvents`](/defender-xdr/advanced-hunting-devicenetworkevents-table) in the Microsoft Defender portal, even though the site was blocked. `DeviceNetworkEvents` are reported from the TCP layer, and not from network protection. After the three-way handshake has completed, access to the site is allowed or blocked by network protection.

Here's an example of how that works:

1. Suppose that a user attempts to access a website on their device. The site happens to be hosted on a dangerous domain, and it should be blocked by network protection.  

2. The three-way handshake via TCP/IP commences. Before it completes, a `DeviceNetworkEvents` action is logged, and its `ActionType` is listed as `ConnectionSuccess`. However, as soon as the three-way handshake process completes, network protection blocks access to the site. All of this happens quickly. A similar process occurs with [Microsoft Defender SmartScreen](/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview); it's when the three-way handshake completes that a determination is made, and access to a site is either blocked or allowed.

3. In the Microsoft Defender portal, an alert is listed in the [alerts queue](alerts-queue.md). Details of that alert include both `DeviceNetworkEvents` and [`AlertEvidence`](/defender-xdr/advanced-hunting-alertevidence-table). You can see that the site was blocked, even though you also have a `DeviceNetworkEvents` item with the ActionType of `ConnectionSuccess`.

## Considerations for Windows virtual desktop running Windows 10 Enterprise Multi-Session

Due to the multi-user nature of Windows 10 Enterprise, keep the following points in mind:

1. Network protection is a device-wide feature and can't be targeted to specific user sessions.

2. Web content filtering policies are also device-wide.

3. If you need to differentiate between user groups, consider creating separate Windows Virtual Desktop host pools and assignments.

4. Test network protection in audit mode to assess its behavior before rolling out.

5. Consider resizing your deployment if you have a large number of users or a large number of multi-user sessions.

### Alternative option for network protection

For Windows Server 2012 R2 and Windows Server 2016 using the [modern unified solution](/defender-endpoint/configure-server-endpoints#functionality-in-the-modern-unified-solution), Windows Server version 1803 or later, and Windows 10 Enterprise Multi-Session 1909 and later, used in Windows Virtual Desktop on Azure, network protection for Microsoft Edge can be enabled using the following method:

1. Use [Turn on network protection](enable-network-protection.md) and follow the instructions to apply your policy.

2. Execute the following PowerShell commands:

   - `Set-MpPreference -EnableNetworkProtection Enabled`
   - `Set-MpPreference -AllowNetworkProtectionOnWinServer 1`
   - `Set-MpPreference -AllowNetworkProtectionDownLevel 1`
   - `Set-MpPreference -AllowDatagramProcessingOnWinServer 1`

   > [!NOTE]
   > In some cases, depending on your infrastructure, volume of traffic, and other conditions, `Set-MpPreference -AllowDatagramProcessingOnWinServer 1` can have an effect on network performance.

### Network protection for Windows Servers

Following is information specific to Windows Servers.

#### Verify that network protection is enabled

Verify whether network protection is enabled on a local device by using Registry Editor.

1. Select the **Start** button in the task bar and type `regedit` to open Registry Editor.

2. Select **HKEY_LOCAL_MACHINE** from the side menu.

3. Navigate through the nested menus to **SOFTWARE** > **Policies** > **Microsoft** > **Windows Defender** > **Windows Defender Exploit Guard** > **Network Protection**.

   (If the key isn't present, navigate to **SOFTWARE** > **Microsoft** > **Windows Defender** > **Windows Defender Exploit Guard** > **Network Protection**)

4. Select **EnableNetworkProtection** to see the current state of network protection on the device:

   - `0` = Off
   - `1` = On (enabled)
   - `2` = Audit mode

For more information, see [Turn on network protection](enable-network-protection.md).

#### Network protection suggested registry keys

For Windows Server 2012 R2 and Windows Server 2016 using the [modern unified solution](/defender-endpoint/configure-server-endpoints#functionality-in-the-modern-unified-solution), Windows Server version 1803 or later, and Windows 10 Enterprise Multi-Session 1909 and later (used in Windows Virtual Desktop on Azure), enable other registry keys, as follows:

1. Go to **HKEY_LOCAL_MACHINE** > **SOFTWARE** > **Microsoft** > **Windows Defender** > **Windows Defender Exploit Guard** > **Network Protection**.

2. Configure the following keys:

   - `AllowNetworkProtectionOnWinServer` (DWORD) set to `1` (hex)
   - `EnableNetworkProtection` (DWORD) set to `1` (hex)
   - (On Windows Server 2012 R2 and Windows Server 2016 only) `AllowNetworkProtectionDownLevel` (DWORD) set to `1` (hex) 

> [!NOTE]
> Depending on your infrastructure, volume of traffic, and other conditions, **HKEY_LOCAL_MACHINE** > **SOFTWARE** > **Policies** > **Microsoft** > **Windows Defender** > **NIS** > **Consumers** > **IPS** - **AllowDatagramProcessingOnWinServer (dword) 1 (hex)** can have an effect on network performance.

For more information, see: [Turn on network protection](enable-network-protection.md).

#### Windows Servers and Windows Multi-session configuration requires PowerShell

For Windows Servers and Windows Multi-session, there are other items that you must enable by using PowerShell cmdlets. For Windows Server 2012 R2 and Windows Server 2016 using the [modern unified solution](/defender-endpoint/configure-server-endpoints#functionality-in-the-modern-unified-solution), Windows Server version 1803 or later, and Windows 10 Enterprise Multi-Session 1909 and later, used in Windows Virtual Desktop on Azure, run the following PowerShell commands:

```powershell

Set-MpPreference -EnableNetworkProtection Enabled

Set-MpPreference -AllowNetworkProtectionOnWinServer 1

Set-MpPreference -AllowNetworkProtectionDownLevel 1

Set-MpPreference -AllowDatagramProcessingOnWinServer 1

```

> [!NOTE]
> In some cases, depending on your infrastructure, volume of traffic, and other conditions, `Set-MpPreference -AllowDatagramProcessingOnWinServer 1` can affect network performance.

## Network protection troubleshooting

Due to the environment where network protection runs, the feature might not be able to detect operating system proxy settings. In some cases, network protection clients are unable to reach the cloud service. To resolve the connectivity problem, [configure a static proxy for Microsoft Defender Antivirus](configure-proxy-internet.md#configure-a-static-proxy-for-microsoft-defender-antivirus).

> [!NOTE]
> Before starting troubleshooting, make sure to set the QUIC protocol to `disabled` in browsers that are used. QUIC protocol is not supported with network protection functionality.

<!--- Would be helpful for customer if we provide instructions to disable--->

Because Global Secure Access doesn't currently support UDP traffic, UDP traffic to port `443` can't be tunneled. You can disable the QUIC protocol so that Global Secure Access clients fall back to using HTTPS (TCP traffic on port 443). You must make this change if the servers that you're trying to access do support QUIC (for example, through Microsoft Exchange Online). To disable QUIC, you can take one of the following actions:

### Disable QUIC in Windows Firewall

The most generic method to disable QUIC is to disable that feature in Windows Firewall. This method affects all applications, including browsers and client apps (such as Microsoft Office). In PowerShell, run the `New-NetFirewallRule` cmdlet to add a new firewall rule that disables QUIC for all outbound traffic from the device:


```powershell

Copy
$ruleParams = @{
    DisplayName = "Block QUIC"
    Direction = "Outbound"
    Action = "Block"
    RemoteAddress = "0.0.0.0/0"
    Protocol = "UDP"
    RemotePort = 443
}
New-NetFirewallRule @ruleParams

```

### Disable QUIC in a web browser

You can disable QUIC at the web browser level. However, this method of disabling QUIC means that QUIC continues to work on nonbrowser applications. To disable QUIC in Microsoft Edge or Google Chrome, open the browser, locate the Experimental QUIC protocol setting (`#enable-quic` flag), and then change the setting to `Disabled`. The following table shows which URI to enter in the browser's address bar so that you can access that setting.

| Browser | URI |
|---|---|
| Microsoft Edge | `edge://flags/#enable-quic` |
| Google Chrome | `chrome://flags/#enable-quic` |

## Optimizing network protection performance

Network protection includes performance optimization that allows `block` mode to asynchronously inspect long-lived connections, which might provide a performance improvement. This optimization can also help with app compatibility problems. This capability is on by default. 

#### Use CSP to enable AllowSwitchToAsyncInspection

[/windows/client-management/mdm/defender-csp](/windows/client-management/mdm/defender-csp#configurationallowswitchtoasyncinspection)

#### Use Group Policy to enable Turn on asynchronous inspection

This procedure enables network protection to improve performance by switching from real-time inspection to asynchronous inspection.

1. On your Group Policy management computer, open the [Group Policy Management Console](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc731212(v=ws.11)).

2. Right-click the Group Policy Object you want to configure, and then select **Edit**.

3. In the Group Policy Management Editor, go to **Computer configuration**, and then select **Administrative templates**.

4. Expand the tree to **Windows components** > **Microsoft Defender Antivirus** > **Network inspection system**.

5. Double-click **Turn on asynchronous inspection**, and then set the option to **Enabled**.

6. Select **OK**. 


#### Use Microsoft Defender Antivirus Powershell cmdlet to enable Turn on asynchronous inspection

You can turn on this capability by using the following PowerShell cmdlet: 

`Set-MpPreference -AllowSwitchToAsyncInspection $true`

## See also

- [Evaluate network protection](evaluate-network-protection.md) | Undertake a quick scenario that demonstrates how the feature works, and what events would typically be created.
- [Enable network protection](enable-network-protection.md) | Use Group Policy, PowerShell, or MDM CSPs to enable and manage network protection in your network.
- [Configuring attack surface reduction capabilities in Microsoft Intune](/mem/intune/protect/endpoint-security-asr-policy)
- [Network protection for Linux](network-protection-linux.md) | To learn about using Microsoft Network protection for Linux devices.
- [Network protection for macOS](network-protection-macos.md) | To learn more about Microsoft Network protection for macOS

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
