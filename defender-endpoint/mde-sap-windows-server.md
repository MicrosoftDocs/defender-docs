---
title: "Microsoft Defender Endpoint on Windows Server with SAP"
description: Understand how Microsoft Defender for Endpoint with EDR and other advanced security capabilities interacts with SAP applications.
author: cgardin
ms.author: cgardin
manager: dansimp
ms.date: 05/07/2024
ms.topic: overview
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: normal
ms.collection:
ms.custom:
- partner-contribution
ms.reviewer: cgardin; shlomiakirav
search.appverid: MET150
f1.keywords: NOCSH
audience: ITPro
---

# Microsoft Defender for Endpoint on Windows Server with SAP

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

If your organization uses SAP, it's essential to understand the compatibility and support between [antivirus](microsoft-defender-antivirus-on-windows-server.md) and [EDR](overview-endpoint-detection-response.md) in Microsoft Defender for Endpoint and your SAP applications. This article helps you understand the support provided by SAP for endpoint protection security solutions like Defender for Endpoint and how they interact with SAP applications.

This article describes how to use Microsoft Defender for Endpoint on Windows Server alongside SAP applications, such as NetWeaver and S4 Hana, and SAP standalone engines, such as LiveCache. In this article, we focus on antivirus and EDR capabilities in Defender for Endpoint. For an overview of all of the Defender for Endpoint capabilities, see [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md).

This article doesn't cover SAP client software, such as SAPGUI or Microsoft Defender Antivirus on Windows client devices.

## Enterprise security and your SAP Basis team

Enterprise security is a specialist role and the activities described in this article should be planned as a joint activity between your enterprise security team and the SAP Basis team. The enterprise security team needs to coordinate with the SAP Basis team and jointly design the Defender for Endpoint configuration and analyze any exclusions.

### Get an overview of Defender for Endpoint

Defender for Endpoint is a component of [Microsoft Defender XDR](/defender-xdr/), and can be integrated with your SIEM/SOAR solution.

Before you begin to plan or deploy Defender for Endpoint on Windows Server with SAP, take a moment to get an overview of Defender for Endpoint. The following video provides an overview:

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4wDob]

For more detailed information about Defender for Endpoint and Microsoft security offerings, see the following resources:

- [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md)
- [Microsoft Security documentation and training - Security documentation](/security/)

Defender for Endpoint includes capabilities that are beyond the scope of this article. In this article, we focus on two main areas:

- **Next-generation protection** (which includes antivirus protection). [Next-generation protection](next-generation-protection.md) is an antivirus product like other antivirus solutions for Windows environments.
- **Endpoint Detection and Response** (EDR). [EDR capabilities](overview-endpoint-detection-response.md) detect suspicious activity and system calls, and provide an extra layer of protection against threats that bypassed antivirus protection.

Microsoft and other security software vendors track threats and provide trend information. For information, see [Cyberthreats, viruses, and malware - Microsoft Security Intelligence](https://www.microsoft.com/en-us/wdsi/threats).

> [!NOTE]
> For information on Microsoft Defender for SAP on Linux, see [Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md). Defender for Endpoint on Linux is significantly different than the Windows version.

## SAP support statement on Defender for Endpoint and other security solutions

SAP provides basic documentation for conventional file scan antivirus solutions. Conventional file scan antivirus solutions compare file signatures against a database of known threats. When an infected file is identified, the antivirus software typically alerts and quarantines the file. The mechanisms and behavior of file scan antivirus solutions are reasonably well known and are predictable; therefore, SAP support can provide a basic level of support for SAP applications interacting with file scan antivirus software.

File based threats are now only one possible vector for malicious software. Fileless malware and malware that lives off the land, highly polymorphic threats that mutate faster than traditional solutions can keep up with, and human-operated attacks that adapt to what adversaries find on compromised devices. Traditional antivirus security solutions aren't sufficient to stop such attacks. Artificial intelligence (AI) and device learning (ML) backed capabilities, such as behavioral blocking and containment are required. Security software such as Defender for Endpoint has advanced threat protection features to mitigate modern threats.

Defender for Endpoint is continuously monitoring operating system calls, such as file read, file write, create socket, and other process level operations. The Defender for Endpoint EDR sensor acquires opportunistic locks on local NTFS files systems and is, therefore, unlikely to impact applications. Opportunistic locks aren't possible on remote network file systems. In rare cases, a lock could cause general nonspecific errors, such as *Access Denied* in SAP applications.

SAP isn't able to provide any level of support for EDR/XDR software like [Microsoft Defender XDR](/defender-xdr/microsoft-365-defender) or [Defender for Endpoint](microsoft-defender-endpoint.md). The mechanisms in such solutions are adaptive; therefore, they're not predictable. Further, issues are potentially not reproducible. When problems are identified on systems running advanced security solutions, SAP recommends disabling the security software and then attempting to reproduce the problem. A support case can then be raised with the security software vendor.

For more information about the SAP Support policy, see [3356389 - Antivirus or other security software affecting SAP operations](https://me.sap.com/notes/3356389).

## Recommended SAP OSS Notes

Here's a list of SAP articles you can use as needed:

- [3356389 - Antivirus or other security software affecting SAP operations - SAP for Me](https://me.sap.com/notes/3356389)
- [106267 - Virus scanner software on Windows - SAP for Me](https://me.sap.com/notes/106267)
- [690449 - Transport buffer lock file (.LOB) remains blocked on Windows - SAP for Me](https://me.sap.com/notes/690449)
- [2311946 - Filesystem errors on Windows - SAP for Me](https://me.sap.com/notes/2311946)
- [2496239 - Ransomware / malware on Windows - SAP for Me](https://me.sap.com/notes/2496239)
- [1497394 - Which files and directories should be excluded from an antivirus scan for SAP BusinessObjects Business Intelligence Platform products in Windows? - SAP for Me](https://me.sap.com/notes/1497394/E)

## SAP applications on Windows Server: Top 10 recommendations

1. **Limit access to SAP servers, block network ports, and take all other common security protection measures**. This first step is essential. The threat landscape has evolved from file-based viruses to file-less complex and sophisticated threats. Actions, such as **blocking ports and limiting logon/access** to VMs are **no longer considered sufficient** to fully mitigate modern threats.

2. **Deploy Defender for Endpoint to nonproductive systems first before deploying to production systems**. Deploying Defender for Endpoint directly to production systems without testing is highly risky and can lead to downtime. If you can't delay deploying Defender for Endpoint to your production systems, consider temporarily disabling [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) and [real-time protection](configure-protection-features-microsoft-defender-antivirus.md).

3. **Remember that real-time protection is enabled by default in Windows Server**. If problems are identified that might be related to Defender for Endpoint, it's recommended to [configure exclusions](defender-endpoint-antivirus-exclusions.md) and/or [open a support case](contact-support.md) via the Microsoft Defender portal.

4. **Have the SAP Basis team and your security team work together on Defender for Endpoint deployment**. The two teams need to jointly create a phased deployment, testing, and monitoring plan.

5. **Use tools like PerfMon (Windows) to create a performance baseline before deploying and activating Defender for Endpoint**. Compare the performance utilization before and after activating Defender for Endpoint. See [perfmon](/windows-server/administration/windows-commands/perfmon).

6. **Deploy the latest version of Defender for Endpoint and use the latest releases of Windows**, ideally Windows Server 2019 or newer. See [Minimum requirements for Microsoft Defender for Endpoint](minimum-requirements.md).

7. **Configure certain exclusions for Microsoft Defender Antivirus**. These include:

   - DBMS data files, log files, and temp files, including disks containing backup files
   - The entire contents of the SAPMNT directory
   - The entire contents of the SAPLOC directory
   - The entire contents of the TRANS directory
   - The entire contents of directories for standalone engines such as TREX

   Advanced users can consider using [contextual file and folder exclusions](configure-contextual-file-folder-exclusions-microsoft-defender-antivirus.md).

   For more information about DBMS exclusions, use the following resources:

      - **SQL Server**: [Configure antivirus software to work with SQL Server](/troubleshoot/sql/database-engine/security/antivirus-and-sql-server)
      - **Oracle**: [How To Configure Anti-Virus On Oracle Database Server (Doc ID 782354.1)](https://support.oracle.com/knowledge/Oracle%20Database%20Products/782354_1.html)
      - **DB2**: [Which DB2 directories to exclude from Linux Anti-virus software](https://www.ibm.com/support/pages/which-db2-directories-exclude-linux-anti-virus-software) (use the same commands on Windows Server)
      - **SAP ASE**: Contact SAP
      - **MaxDB**: Contact SAP

8. **Verify Defender for Endpoint settings**. Microsoft Defender Antivirus with SAP applications should have the following settings in most cases:

   - `AntivirusEnabled                   : True`
   - `AntivirusSignatureAge              : 0`
   - `BehaviorMonitorEnabled             : True`
   - `DefenderSignaturesOutOfDate        : False`
   - `IsTamperProtected                  : True`
   - `RealTimeProtectionEnabled          : True`

9. **Use tools, such as [Intune](/mem/intune/protect/endpoint-security) or [Defender for Endpoint security settings management](/mem/intune/protect/mde-security-integration) to set up Defender for Endpoint**. Such tools can help ensure that Defender for Endpoint is configured correctly and uniformly deployed.

   To use Defender for Endpoint security settings management, in the Microsoft Defender portal, go to **Endpoints** > **Configuration management** > **Endpoint security policies**, and then select **Create new Policy**. For more information, see [Manage endpoint security policies in Microsoft Defender for Endpoint](manage-security-policies.md).

10. **Use the latest release of Defender for Endpoint**. Several new features are being implemented in Defender for Endpoint on Windows, and these features were tested with SAP systems. These new features reduce blocking and lower CPU consumption. For more information about new features, see [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md).

## Deployment methodology

SAP and Microsoft both don't recommend deploying Defender for Endpoint on Windows directly to all development, QAS, and production systems simultaneously, and/or without careful testing and monitoring. Customers who deployed Defender for Endpoint and other similar software in an uncontrolled manner without adequate testing experienced system downtime as a result.

Defender for Endpoint on Windows and any other software or configuration change should be deployed into development systems first, validated in QAS, and only then deployed into production environments.

Using tools, such as [Defender for Endpoint security settings management](/mem/intune/protect/mde-security-integration) to deploy Defender for Endpoint to an entire SAP landscape without testing is likely to cause downtime.

Here's a list of what to check:

1. **Deploy Defender for Endpoint with [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) enabled**. If issues arise, enable [troubleshooting mode](enable-troubleshooting-mode.md), disable [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md), disable [real-time protection](configure-protection-features-microsoft-defender-antivirus.md), and configure [scheduled scans](schedule-antivirus-scans.md).

2. **Exclude DBMS files and executables** following your DBMS vendor recommendations.

3. **Analyze SAPMNT, SAP TRANS_DIR, Spool, and Job Log directories**. If there are more than 100,000 files, consider archiving to reduce the number of files.

4. **Confirm the performance limits and quotas of the shared file system used for SAPMNT**. The SMB share source could be a NetApp appliance, a Windows Server shared disk, or Azure Files SMB.

5. **Configure exclusions so that all SAP application servers aren't scanning the SAPMNT share simultaneously**, as it could overload your shared storage server.

6. **In general, host interface files on a dedicated non-SAP file server**. Interface files are recognized as an attack vector. Real-time protection should be activated on this dedicated file server. SAP Servers should never be used as file servers for interface files.

   > [!NOTE]
   > Some large SAP systems have more than 20 SAP application servers each with a connection to the same SAPMNT SMB share. 20 application servers simultaneously scanning the same SMB server may overload the SMB server. It is recommended to exclude SAPMNT from regular scans.
>
## Important configuration settings for Defender for Endpoint on Windows Server with SAP

1. **Get an overview of [Microsoft Defender for Endpoint](microsoft-defender-endpoint.md)**. In particular, review information about [next-generation protection](next-generation-protection.md) and [EDR](overview-endpoint-detection-response.md).

   > [!NOTE]
   > The term *Defender* is sometimes used to refer to an entire suite of products and solutions. See [What is Microsoft Defender XDR?](/defender-xdr/microsoft-365-defender). In this article, we focus on antivirus and EDR capabilities in Defender for Endpoint.

2. **Check the status of Microsoft Defender Antivirus**. Open Command Prompt, and run the following PowerShell commands:

   **[Get-MpComputerStatus](/powershell/module/defender/get-mpcomputerstatus?view=windowsserver2022-ps&preserve-view=true)**, as follows:

   ```powershell
   Get-MpPreference |Select-Object -Property  DisableCpuThrottleOnIdleScans, DisableRealtimeMonitoring, DisableScanningMappedNetworkDrivesForFullScan , DisableScanningNetworkFiles, ExclusionPath, MAPSReporting
   ```

   Expected output for `Get-MpComputerStatus`:

   ```output
   DisableCpuThrottleOnIdleScans                 : True
   DisableRealtimeMonitoring                     : False
   DisableScanningMappedNetworkDrivesForFullScan : True
   DisableScanningNetworkFiles                   : False
   ExclusionPath                                 :   <<configured exclusions will show here>>
   MAPSReporting                                 : 2
   ```

   **[Get-MpPreference](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true)**, as follows:

   ```powershell
   Get-MpComputerStatus |Select-Object -Property AMRunningMode, AntivirusEnabled, BehaviorMonitorEnabled, IsTamperProtected , OnAccessProtectionEnabled, RealTimeProtectionEnabled
   ```

   Expected output for `Get-MpPreference`:

   ```output
   AMRunningMode             : Normal
   AntivirusEnabled          : True
   BehaviorMonitorEnabled    : True
   IsTamperProtected         : True
   OnAccessProtectionEnabled : True
   RealTimeProtectionEnabled : True
   ```

3. **Check the status of EDR**. Open Command Prompt, and then run the following command:

   ```powershell
   PS C:\Windows\System32> Get-Service -Name sense | FL *
   ```

   You should see output that resembles the following code snippet:

   ```output
   Name        : sense
   RequiredServices  : {}
   CanPauseAndContinue : False
   CanShutdown     : False
   CanStop       : False
   DisplayName     : Windows Defender Advanced Threat Protection Service
   DependentServices  : {}
   MachineName     : .
   ServiceName     : sense
   ServicesDependedOn : {}
   ServiceHandle    :
   Status       : Running
   ServiceType     : Win32OwnProcess
   StartType      : Automatic
   Site        :
   Container      :
   ```

   The values you want to see are `Status: Running` and `StartType: Automatic`.

   For more information about the output, see [Review events and errors using Event Viewer](event-error-codes.md).

4. **Make sure that Microsoft Defender Antivirus is up to date**. The best way to make sure your antivirus protection is up to date is by using Windows Update. If you encounter issues or get an error, contact your security team.

   For more information about updates, see [Microsoft Defender Antivirus security intelligence and product updates](microsoft-defender-antivirus-updates.md).

5. **Make sure [behavior monitoring](behavioral-blocking-containment.md) is turned on**. When tamper protection is enabled, behavior monitoring is turned on by default. Use the default configuration of tamper protection enabled, behavior monitoring enabled, and real-time monitoring enabled unless a specific problem is identified.

   For more information, see [Built-in protection helps guard against ransomware](built-in-protection.md).

6. **Make sure [real-time protection is enabled](configure-real-time-protection-microsoft-defender-antivirus.md)**. The current recommendation for Defender for Endpoint on Windows is to enable real-time scanning, with tamper protection enabled, behavior monitoring enabled, and real-time monitoring enabled, unless a specific problem is identified.

   For more information, see [Built-in protection helps guard against ransomware](built-in-protection.md).

7. **Keep in mind how scans work with network shares**. By default, the Microsoft Defender Antivirus component on Windows scans SMB shared network file systems (for example, a Windows server share `\\server\smb-share` or a NetApp share) when these files are accessed by processes.

   [Defender for Endpoint EDR](overview-endpoint-detection-response.md) on Windows might scan SMB shared network file systems. The EDR sensor scans certain files that are identified as interesting for EDR analysis during file modification, delete, and move operations.

   Defender for Endpoint on Linux doesn't scan NFS file systems during [scheduled scans](linux-schedule-scan-mde.md).

8. **Troubleshoot sense health or reliability issues**. To troubleshoot such issues, use the [Defender for Endpoint Client Analyzer tool](overview-client-analyzer.md). The Defender for Endpoint Client Analyzer can be useful when diagnosing sensor health or reliability issues on onboarded devices running either Windows, Linux, or macOS. Get the latest version of the Defender for Endpoint Client Analyzer here: [https://aka.ms/MDEAnalyzer](https://aka.ms/MDEAnalyzer).

9. **Open a support case** if you need help. See [Contact Microsoft Defender for Endpoint support](contact-support.md).

10. **If you're using production SAP VMs with [Microsoft Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction), keep in mind that Defender for Cloud deploys the Defender for Endpoint extension to all VMs**. If a VM isn't onboarded to Defender for Endpoint, it could be used as an attack vector. If you need more time to test Defender for Endpoint before deplying to your production environment, [contact support](contact-support.md).

## Useful Commands: Microsoft Defender for Endpoint with SAP on Windows Server

The following sections describe how to confirm or configure Defender for Endpoint settings by using PowerShell and Command Prompt:

### Update Microsoft Defender Antivirus definitions manually

Use Windows Update, or run the following command:

```powershell
PS C:\Program Files\Windows Defender> .\MpCmdRun.exe -SignatureUpdate
```

You should see an output that resembles the following code snippet:

```output
Signature update started . . .
Service Version: 4.18.23050.9
Engine Version: 1.1.23060.1005
AntiSpyware Signature Version: 1.393.925.0
Antivirus Signature Version: 1.393.925.0
Signature update finished.
PS C:\Program Files\Windows Defender>
```

Another option is to use this command:

```powershell
PS C:\Program Files\Windows Defender> Update-MpSignature
```

For more information about these commands, see the following resources:

- [MpCmdRun.exe](command-line-arguments-microsoft-defender-antivirus.md)
- [Update-MpSignature](/powershell/module/defender/update-mpsignature?view=windowsserver2022-ps&preserve-view=true)

### Determine whether EDR in block mode is turned on

[EDR in block mode](edr-in-block-mode.md) provides added protection from malicious artifacts when Microsoft Defender Antivirus isn't the primary antivirus product and is running in passive mode. You can determine whether EDR in block mode is enabled by running the following command:

```powershell
Get-MPComputerStatus|select AMRunningMode
```

There are two modes: Normal and Passive Mode. Testing with SAP systems was done only with `AMRunningMode = Normal` for SAP systems.

For more information about this command, see [Get-MpComputerStatus](/powershell/module/defender/get-mpcomputerstatus?view=windowsserver2022-ps&preserve-view=true).

### Configure antivirus exclusions

Before you configure exclusions, make sure that the SAP Basis team coordinates with your security team. Exclusions should be configured centrally and not at the VM level. Exclusions such as the shared SAPMNT file system should be excluded via a policy using the [Intune admin portal](https://intune.microsoft.com).

To view exclusions, use the following command:

```powershell
Get-MpPreference | Select-Object -Property ExclusionPath
```

For more information about this command, see [Get-MpComputerStatus](/powershell/module/defender/get-mpcomputerstatus?view=windowsserver2022-ps&preserve-view=true).

For more information about exclusions, see the following resources:

- [Manage exclusions for Microsoft Defender for Endpoint and Microsoft Defender Antivirus](defender-endpoint-antivirus-exclusions.md)
- [Configure custom exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md)
- [Contextual file and folder exclusions](configure-contextual-file-folder-exclusions-microsoft-defender-antivirus.md)

### Configure EDR exclusions

It isn't recommended to exclude files, paths, or processes from EDR as such exclusions comprise the protection from modern nonfile based threats. If necessary, open a support case with Microsoft Support via the Microsoft Defender portal specifying executables and/or paths to exclude. See [Contact Microsoft Defender for Endpoint support](contact-support.md).

### Completely disable Defender for Endpoint on Windows for testing purposes

> [!CAUTION]
> It is not recommended to disable security software unless there is no alternative to solve or isolate a problem.

Defender for Endpoint should be configured with [tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) turned on. To temporarily disable Defender for Endpoint to isolate problems, use [troubleshooting mode](enable-troubleshooting-mode.md).

To shut down various subcomponents of the Microsoft Defender Antivirus solution, run the following commands:

```powershell
Set-MPPreference -DisableTamperProtection $true
Set-MpPreference -DisableRealtimeMonitoring $true
Set-MpPreference -DisableBehaviorMonitoring $true
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -DisableIOAVProtection $true
Set-MpPreference -EnableNetworkProtection Disabled
```

For more information about these commands, see [Set-MpPreference](/powershell/module/defender/set-mppreference?view=windowsserver2022-ps&preserve-view=true).

> [!IMPORTANT]
> You can't turn off EDR subcomponents on a device. The only way to turn off EDR is to [offboard the device](configure-endpoints-script.md#offboard-devices-using-a-local-script).

To turn off [cloud-delivered protection](cloud-protection-microsoft-defender-antivirus.md) (Microsoft Advanced Protection Service, or MAPS), run the following commands:

```powershell
PowerShell Set-MpPreference -MAPSReporting 0
PowerShell Set-MpPreference -MAPSReporting Disabled
```

For more information about cloud-delivered protection, see the following resources:

- [Cloud protection and Microsoft Defender Antivirus](cloud-protection-microsoft-defender-antivirus.md)
- [Cloud protection and sample submission at Microsoft Defender Antivirus](cloud-protection-microsoft-antivirus-sample-submission.md) (if you're considering whether to use automatic sample submission with your security policies)

## Related articles

- [Deployment guidance for Microsoft Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md)

- [Microsoft Defender Antivirus on Windows Server](microsoft-defender-antivirus-on-windows-server.md)

- [Overview of endpoint detection and response](overview-endpoint-detection-response.md)
