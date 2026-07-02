---
title:  Run the client analyzer on Windows
description: Learn how to run the Microsoft Defender for Endpoint Client Analyzer on Windows.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.reviewer: younghree
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
- mde-ngp
ms.topic: how-to
ms.subservice: ngp
ms.date: 06/16/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---
# Run the client analyzer on Windows


> [!TIP]
> Watch this video to get an overview of the client analyzer: [Defender for Endpoint client analyzer overview](https://www.youtube.com/watch?v=GnqDsvYYL6w)

The Microsoft Defender for Endpoint client analyzer collects diagnostic data and support logs to troubleshoot sensor health, connectivity, and performance issues on Windows devices. You have two options for running the client analyzer:

- Use live response
- Run the client analyzer locally on the device

## Option 1: Live response

You can collect the Defender for Endpoint analyzer support logs remotely using [Live Response](troubleshoot-collect-support-log.md).

## Option 2: Run MDE Client Analyzer locally

Perform the following steps to download and run MDE Client Analyzer directly on the Windows device:

1. Download the [MDE Client Analyzer tool](https://aka.ms/mdatpanalyzer) or [MDE Client Analyzer tool (preview)](https://aka.ms/MDEClientAnalyzerPreview) to the Windows device you want to investigate. The file is saved to your Downloads folder by default.

1. Extract the contents of `MDEClientAnalyzer.zip` to an available folder.

1. Open a command line with administrator permissions: 

   1. Go to **Start** and type **cmd**.
   
   1. Right-click **Command prompt** and select **Run as administrator**.

1. Type the following command and then press **Enter**:

   ```cmd
   *DrivePath*\MDEClientAnalyzer.cmd
   ```

   Replace *DrivePath* with the path where you extracted MDEClientAnalyzer. For example, if you extracted the tool to `C:\Work\tools`, run the following command:

   ```cmd
   C:\Work\tools\MDEClientAnalyzer\MDEClientAnalyzer.cmd
   ```

In addition to running the client analyzer locally on the device, you can also [collect analyzer support logs with Live Response](troubleshoot-collect-support-log.md).

> [!NOTE]
> On Windows 10 and 11, Windows Server 2019 and 2022, or Windows Server 2012R2 and 2016 with the [modern unified solution](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2) installed, the client analyzer script calls into an executable file called `MDEClientAnalyzer.exe` to run the connectivity tests to cloud service URLs.
>
> On Windows 8.1, Windows Server 2016 or any previous OS edition where Microsoft Monitoring Agent (MMA) is used for onboarding, the client analyzer script calls into an executable file called `MDEClientAnalyzerPreviousVersion.exe` to run connectivity tests for Command and Control (CnC) URLs while also calling into Microsoft Monitoring Agent connectivity tool `TestCloudConnection.exe` for Cyber Data channel URLs.

> [!TIP]
> Watch this video to learn more about onboarding issues: [Defender for Endpoint client analyzer onboarding issues](https://www.youtube.com/watch?v=HdhePgMBqs8)

## Important points to keep in mind

All the PowerShell scripts and modules included with the analyzer are Microsoft-signed. If files were modified in any way, then the analyzer is expected to exit with the following error:

:::image type="content" source="media/sigerror.png" alt-text="The client analyzer error" lightbox="media/sigerror.png":::

If the analyzer exits with a file-signature validation error, the issuerInfo.txt output contains detailed information about why the signature check failed and which file was affected:

:::image type="content" source="media/issuerinfo.png" alt-text="The issuer info" lightbox="media/issuerinfo.png":::

The following example shows the contents of issuerInfo.txt when MDEClientAnalyzer.ps1 has been modified:

:::image type="content" source="media/modified-ps1.png" alt-text="The  modified ps1 file" lightbox="media/modified-ps1.png":::

## Result package contents on Windows

After the analyzer completes, it produces a result package containing diagnostic files and folders.

> [!NOTE]
> The exact files captured might change depending on factors such as:
>
> - The version of windows on which the analyzer is run.
> - Event log channel availability on the machine.
> - The start state of the EDR sensor (Sense is stopped if machine isn't yet onboarded).
> - If an advanced troubleshooting parameter was used with the analyzer command.

By default, the unpacked `MDEClientAnalyzerResult.zip` file contains the items listed in the following table:

| Folder | Item | Description |
|--|--|--|
| | `MDEClientAnalyzer.htm` | This is the main HTML output file, which contains the findings and guidance that the analyzer script run on the machine can produce. |
| `SystemInfoLogs` | `AddRemovePrograms.csv` | List of x64 installed software on x64 OS collected from registry |
| `SystemInfoLogs` | `AddRemoveProgramsWOW64.csv` | List of x86 installed software on x64 OS collected from registry |
| `SystemInfoLogs` | `CertValidate.log` | Detailed result from certificate revocation executed by calling into [CertUtil](/windows-server/administration/windows-commands/certutil) |
| `SystemInfoLogs` | `dsregcmd.txt` | Output from running [dsregcmd](/azure/active-directory/devices/troubleshoot-device-dsregcmd). This provides details about the Microsoft Entra status of the machine. |
| `SystemInfoLogs` | `IFEO.txt` | Output of [Image File Execution Options](/previous-versions/windows/desktop/xperf/image-file-execution-options) configured on the machine |
| `SystemInfoLogs` | `MDEClientAnalyzer.txt` | This is verbose text file showing with details of the analyzer script execution. |
| `SystemInfoLogs` | `MDEClientAnalyzer.xml` | XML format containing the analyzer script findings |
| `SystemInfoLogs` | `RegOnboardedInfoCurrent.Json` | The onboarded machine information gathered in JSON format from the registry |
| `SystemInfoLogs` | `RegOnboardingInfoPolicy.Json` | The onboarding policy configuration gathered in JSON format from the registry |
| `SystemInfoLogs` | `SCHANNEL.txt` | Details about [SCHANNEL configuration](/windows-server/security/tls/manage-tls) applied to the machine such gathered from registry | 
| `SystemInfoLogs` | `SessionManager.txt` | Session Manager specific settings gather from registry |
| `SystemInfoLogs` | `SSL_00010002.txt` | Details about [SSL configuration](/windows-server/security/tls/manage-tls) applied to the machine gathered from registry |
| `EventLogs` | `utc.evtx` | Export of DiagTrack event log |
| `EventLogs` | `senseIR.evtx` | Export of the Automated Investigation event log |
| `EventLogs` | `sense.evtx` | Export of the Sensor main event log |
| `EventLogs` | `OperationsManager.evtx` | Export of the Microsoft Monitoring Agent event log |
| `MdeConfigMgrLogs` | `SecurityManagementConfiguration.json` | Configurations sent from MEM (Microsoft Endpoint Manager) for enforcement |
| `MdeConfigMgrLogs` | `policies.json` | Policies settings to be enforced on the device |
| `MdeConfigMgrLogs` | `report_xxx.json` | Corresponding enforcement results |


## See also

- [Client analyzer overview](overview-client-analyzer.md)
- [Data collection for advanced troubleshooting on Windows](data-collection-analyzer.md)
- [Understand the analyzer HTML report](analyzer-report.md)




