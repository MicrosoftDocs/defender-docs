---
author: limwainstein
ms.author: lwainstein
ms.date: 02/24/2026
ms.topic: include
ms.service: defender-endpoint
---

Select the tab for information about exclusions for that operating system.

### [**Windows**](#tab/Windows)

The specific exclusions to configure depend on which version of Windows your endpoints or devices are running, and are listed in the following table.

| OS | Exclusions |
|--|--|
| Windows 11<br/>Windows 10, version 1803 or later (See Windows 10 release information)<br/>Windows 10, version 1703 or 1709 with KB4493441 installed<br/>Windows Server 2025 <br/> Azure Stack HCI OS, version 23H2 and later <br/>Windows Server 2022<br/>Windows Server 2019<br/>Windows Server, version 1803<br/>Windows Server 2016 running the modern unified solution<br/>Windows Server 2012 R2 running the modern unified solution | **EDR exclusions**: <br/>`C:\Program Files\Windows Defender Advanced Threat Protection\MsSense.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseCncProxy.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseSampleUploader.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseIR.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseCM.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseNdr.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\Classification\SenseCE.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\DataCollection`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseTVM.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseTracer.exe`<br/>`C:\Program Files\Windows Defender Advanced Threat Protection\SenseDlpProcessor.exe` <br/><br/> **Registry path**:<br/>`HKLM\SOFTWARE\Microsoft\Windows Advanced Threat Protection\*` <br/><br/> **Antivirus exclusions**:<br/>`C:\Program Files\Windows Defender\MsMpEng.exe`<br/>`C:\Program Files\Windows Defender\NisSrv.exe`<br/>`C:\Program Files\Windows Defender\ConfigSecurityPolicy.exe`<br/>`C:\Program Files\Windows Defender\MpCmdRun.exe`<br/>`C:\Program Files\Windows Defender\MpDefenderCoreService.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\MsMpEng.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\NisSrv.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\ConfigSecurityPolicy.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\MpCopyAccelerator.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\MpCmdRun.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\MpDefenderCoreService.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\mpextms.exe` <br/><br/> **Endpoint Data Loss Prevention (Endpoint DLP) exclusions**:<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\MpDlpService.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\MpDlpCmd.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\MipDlp.exe`<br/>`C:\ProgramData\Microsoft\Windows Defender\Platform\4.18.*\DlpUserAgent.exe`|
| Windows Server 2016 or Windows Server 2012 R2 running the [modern unified solution](/editor/MicrosoftDocs/defender-docs-pr/defender-endpoint%2Fswitch-to-mde-phase-2.md/main/76b249d7-f914-4c03-3eaf-48aa43b2fa4a/onboard-server.md) | The following **additional** exclusions are required after updating the Sense EDR component using [KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac): <br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Platform\*\MsSense.exe` <br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Platform\*\SenseCnCProxy.exe` <br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Platform\*\SenseIR.exe` <br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Platform\*\SenseCE.exe` <br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Platform\*\SenseSampleUploader.exe` <br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Platform\*\SenseCM.exe` <br/>`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\DataCollection`<br/> `C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Platform\*\SenseTVM.exe`|
| [Windows 8.1](/windows/release-health/status-windows-8.1-and-windows-server-2012-r2) [Windows 7](/windows/release-health/status-windows-7-and-windows-server-2008-r2-sp1) [Windows Server 2008 R2 SP1](/windows/release-health/status-windows-7-and-windows-server-2008-r2-sp1) | `C:\Program Files\Microsoft Monitoring Agent\Agent\Health Service State\Monitoring Host Temporary Files 6\45\MsSenseS.exe` <br/>( Monitoring Host Temporary Files 6\45 can be different numbered subfolders.) <br/>`C:\Program Files\Microsoft Monitoring Agent\Agent\AgentControlPanel.exe`<br/> `C:\Program Files\Microsoft Monitoring Agent\Agent\HealthService.exe`<br/>`C:\Program Files\Microsoft Monitoring Agent\Agent\HSLockdown.exe`<br/>`C:\Program Files\Microsoft Monitoring Agent\Agent\MOMPerfSnapshotHelper.exe`<br/>`C:\Program Files\Microsoft Monitoring Agent\Agent\MonitoringHost.exe`<br/>`C:\Program Files\Microsoft Monitoring Agent\Agent\TestCloudConnection.exe` |

### [**macOS**](#tab/macOS)

For macOS devices, the following table lists processes to exclude in your non-Microsoft antivirus/antimalware solution:

| Process | Location |
|--|--|
| `wdavdaemon_enterprise`<br/>EDR engine | `/Library/Application Support/Microsoft/Defender/` |  
| `wdavdaemon_unprivileged`<br/>Antivirus engine | `/Library/Application Support/Microsoft/Defender/` |
| `telemetryd_v1`<br/>Telemetry daemon for EDR | `/Library/Application Support/Microsoft/Defender/`  |
| `Netext`<br/>Network extension  | `/Library/SystemExtensions/*/com.microsoft.wdav.netext.systemextension/Contents/MacOS/` |
| `Epsext` <br/>Endpoint security extension | `/Library/SystemExtensions/*/com.microsoft.wdav.epsext.systemextension/Contents/MacOS/`  |
| `msupdate`<br/>Microsoft AutoUpdate update tool | `/Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS` |

### [**Linux**](#tab/Linux)

For Linux servers, the following table lists processes to exclude in your non-Microsoft antivirus/antimalware solution:

| Process | Location |
|---|---|
| `wdavdaemon`<br/>Core daemon (service). Uses FANotify for both antimalware and EDR purposes (TALPA on older RHEL). | `/opt/microsoft/mdatp/sbin/` |
| `wdavdaemon enterprise`<br/>EDR engine. Used for enrichment. | `/opt/microsoft/mdatp/sbin/`  |
| `wdavdaemon unprivileged`<br/> Antivirus engine  | `/opt/microsoft/mdatp/sbin/` |
| `crashpad_handler`<br/>Collects crash dumps  | `/opt/microsoft/mdatp/sbin/` |
| `mdatp` <br/>Command line utility| `/opt/microsoft/mdatp/sbin/Wdavdaemonclient`  |
| `mde_netfilter` <br/>Packet filter for Network protection, also used for response capabilities | `/opt/microsoft/mde_netfilter/sbin` |

---