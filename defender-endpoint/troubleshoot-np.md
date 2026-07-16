---
title: Troubleshoot problems with Network protection
description: Troubleshoot false positives, false negatives, and network performance issues with Network protection in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.reviewer: oogunrinde, yongrhee
ms.subservice: asr
ms.topic: how-to
ms.collection:
- m365-security
- tier3
- mde-asr
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Troubleshoot network protection

This article provides troubleshooting information for [network protection](network-protection.md), in cases, such as:

- Network protection blocks a website that is safe (false positive)
- Network protection fails to block a suspicious or known malicious website (false negative)

There are four steps to troubleshoot false positives and false negatives in network protection:

1. Confirm prerequisites
1. Use audit mode to test the rule
1. Add exclusions for the specified rule (for false positives)
1. Submit support logs

## Confirm prerequisites

Network protection works on devices with the following conditions:

> [!div class="checklist"]
>
> - Endpoints are running Windows 10 Pro or Enterprise edition, version 1709 or higher.
> - Endpoints are using Microsoft Defender Antivirus as the sole antivirus protection app. [See what happens when you're using a non-Microsoft antivirus solution](/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-antivirus-compatibility).
> - [Real-time protection](/windows/security/threat-protection/microsoft-defender-antivirus/configure-real-time-protection-microsoft-defender-antivirus) is enabled.
> - [Behavior Monitoring](behavior-monitor.md) is enabled.
> - [Cloud-delivered protection](/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus) is enabled.
> - [Cloud Protection network connectivity](configure-network-connections-microsoft-defender-antivirus.md) is functional.
> - Audit mode isn't enabled. Use [Group Policy](enable-network-protection.md#group-policy) to set the rule to **Disabled** (value: **0**).

## Use audit mode

You can enable network protection in audit mode and then visit the [network protection demo site](https://smartscreentestratings2.net) to test the feature. All website connections are allowed by network protection but an event is logged to indicate any connection that would be blocked if network protection were enabled.

1. Set network protection to **Audit mode**. Audit mode allows all connections but logs any connection that would be blocked, so you can test whether blocking is causing the issue.

   ```PowerShell
   Set-MpPreference -EnableNetworkProtection AuditMode
   ```

1. Perform the connection activity that is causing an issue (for example, attempt to visit the site, or connect to the IP address you do or don't want to block).

1. [Review the network protection event logs](network-protection.md#review-network-protection-events-in-windows-event-viewer) to see if the feature would block the connection if it were set to **Enabled**.

   If network protection isn't blocking a connection that you're expecting it should block, run the following command to re-enable Network Protection in block mode and restore enforcement:

   ```PowerShell
   Set-MpPreference -EnableNetworkProtection Enabled
   ```

## Report a false positive or false negative

If you tested the feature with the demo site and audit mode, network protection might work on preset scenarios but not for a specific connection. To report this issue, use the [Windows Defender Security Intelligence web-based submission form](https://www.microsoft.com/wdsi/filesubmission) to submit a false negative or false positive. With an E5 subscription, you can also link to any related alert from the [Alerts queue](alerts-queue.md).

See [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md).

## Add exclusions

The current exclusion options are:

1. Setting up a custom allow indicator.

1. Using IP exclusions: `Add-MpPreference -ExclusionIpAddress 192.168.1.1`.

1. Excluding an entire process. For more information, see [Microsoft Defender Antivirus exclusions](configure-exclusions-microsoft-defender-antivirus.md).

<a name="network-performance-issues"></a>
## Troubleshoot network performance issues

A network protection component might slow down connections to Domain Controllers or Exchange servers. You might also see Event ID 5783 NETLOGON errors. These errors mean the device can't connect to a Domain Controller.

To fix slow network connections or Event ID 5783 NETLOGON errors, switch Network Protection from 'block mode' to '[audit mode](troubleshoot-np.md)' or 'disabled'. If that resolves the problem, disable Network Protection components one at a time to isolate which component causes the issue.

Disable the following components one at a time and test your network speed after each change:

1. [Disable Datagram Processing on Windows Server](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable Network Protection Perf Telemetry](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable FTP parsing](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable SSH parsing](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable RDP parsing](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable HTTP parsing](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable SMTP parsing](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable DNS over TCP parsing](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable DNS parsing ](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable inbound connection filtering](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)
1. [Disable TLS parsing](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)

If your network performance issues persist after disabling each Network Protection component listed earlier, then the issues are probably not related to network protection. Look for other causes of your network performance issues.

## Collect diagnostic data for file submissions

When you report a problem with network protection, you're asked to collect and submit diagnostic data for Microsoft support and engineering teams to help troubleshoot issues. You collect and submit the diagnostic data by running `MpCmdrun.exe -GetFiles`, which saves the data at `C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab`.

For detailed instructions, see [Collect Microsoft Defender Antivirus diagnostic data](collect-diagnostic-data.md).

## Resolve connectivity issues with network protection (for E5 customers)

Because network protection can't see your operating system proxy settings, network protection clients might be unable to reach the cloud service in some environments. To resolve these connectivity issues, configure one of the following registry keys so that network protection becomes aware of the proxy configuration. You can configure the registry key by using PowerShell, Microsoft Configuration Manager, or Group Policy.

If your environment uses a fixed proxy endpoint, configure Microsoft Defender to route traffic through that proxy server by setting the address and port:

```powershell
Set-MpPreference -ProxyServer <proxy IP address: Port>
```

---OR---

If your network routes traffic dynamically through a PAC file instead of a static proxy, use the following command to configure Microsoft Defender to use that PAC URL:

```powershell
Set-MpPreference -ProxyPacUrl <Proxy PAC url>
```

You can configure the registry key by using PowerShell, Microsoft Configuration Manager, or Group Policy. Here are some resources to help:

- [Working with Registry Keys](/powershell/scripting/samples/working-with-registry-keys)
- [Configure custom client settings for Endpoint Protection](/intune/configmgr/protect/deploy-use/endpoint-protection-configure-client)
- [Use Group Policy settings to manage Endpoint Protection](/intune/configmgr/protect/deploy-use/endpoint-protection-group-policies)

## See also

- [Network protection](network-protection.md)
- [Network protection and the TCP three-way handshake](network-protection.md#network-protection-and-the-tcp-three-way-handshake)
- [Evaluate network protection](evaluate-network-protection.md)
- [Enable network protection](enable-network-protection.md)
- [Address false positives/negatives in Defender for Endpoint](defender-endpoint-false-positives-negatives.md)
