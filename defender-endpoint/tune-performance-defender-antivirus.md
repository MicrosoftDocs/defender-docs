---
title: Performance analyzer for Microsoft Defender Antivirus
description: Describes the procedure to tune the performance of Microsoft Defender Antivirus.
ms.service: defender-endpoint
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.collection: 
- m365-security
- mde-ngp
ms.topic: how-to
ms.subservice: ngp
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Performance analyzer for Microsoft Defender Antivirus


## What is the Microsoft Defender Antivirus performance analyzer?

If devices running Microsoft Defender Antivirus are experiencing performance issues, you can use the performance analyzer to improve the performance of Microsoft Defender Antivirus. The performance analyzer is a PowerShell command-line tool that helps you determine files, file extensions, and processes that might be causing performance issues on individual endpoints during antivirus scans. You can use the information gathered by performance analyzer to assess performance issues and apply remediation actions.

Similar to the way mechanics perform diagnostics and service on a vehicle that has performance problems, the performance analyzer can help you improve Microsoft Defender Antivirus performance.

:::image type="content" source="media/performance-analyzer-improve-defender-antivirus-performance.png" alt-text="Conceptual performance analyzer image for Microsoft Defender Antivirus." lightbox="media/performance-analyzer-improve-defender-antivirus-performance.png":::

Some options to analyze include:

- Top paths that impact scan time
- Top files that impact scan time
- Top processes that impact scan time
- Top file extensions that impact scan time
- Combinations – for example:
  - top files per extension
  - top paths per extension
  - top processes per path
  - top scans per file
  - top scans per file per process

## Prerequisites 

Before you run the performance analyzer, make sure your device meets the following version and operating system requirements.

### Required versions

The performance analyzer requires the following platform and PowerShell versions:

- Platform Version: `4.18.2108.7` or later
- PowerShell Version: PowerShell Version 5.1, PowerShell ISE, remote PowerShell (4.18.2201.10+), PowerShell 7.x (4.18.2201.10+)
- For Windows Server 2012 R2, the Windows ADK (Windows Performance Toolkit) is needed. [Download and install the Windows ADK](/windows-hardware/get-started/adk-install)


### Supported operating systems 

The performance analyzer is supported on the following operating systems:

   - Windows 10
   - Windows 11
   - Windows Server 2016 and later
   - Windows Server 2012 R2 (when onboarded using [Functionality in the modern unified solution for Windows Server 2016 and Windows Server 2012 R2](onboard-server.md#functionality-in-the-modern-unified-solution-for-windows-server-2016-and-windows-server-2012-r2))

<a name="running-performance-analyzer"></a>
## Run the Microsoft Defender Antivirus performance analyzer

The high-level process for running the performance analyzer involves the following steps:

1. Run the performance analyzer to collect a performance recording of Microsoft Defender Antivirus events on the endpoint.

   > [!NOTE]
   > Performance of Microsoft Defender Antivirus events of the type `Microsoft-Antimalware-Engine` are recorded through the performance analyzer.

2. Analyze the scan results using different recording reports.

<a name="using-performance-analyzer"></a>
## Record and analyze events with the Microsoft Defender Antivirus performance analyzer

To start recording system events, open PowerShell in administrator mode and perform the following steps:

1. Run the following command to start the recording:

   ```powershell
   New-MpPerformanceRecording -RecordTo <recording.etl>
   ```

   where `-RecordTo` parameter specifies full path location in which the trace file is saved. For more cmdlet information, see [Microsoft Defender Antivirus cmdlets](/powershell/module/defender).

1. If there are processes or services thought to be affecting performance, reproduce the situation by carrying out the relevant tasks.

1. Press **ENTER** to stop and save recording, or **Ctrl+C** to cancel recording.

1. Analyze the results using the performance analyzer's `Get-MpPerformanceReport` parameter. For example, on executing the command `Get-MpPerformanceReport -Path <recording.etl> -TopFiles 3 -TopScansPerFile 10`, the user is provided with a list of top-ten scans for the top three files affecting performance.

   For more information on command-line parameters and options, see the [New-MpPerformanceRecording](/powershell/module/defenderperformance/new-mpperformancerecording)   and [Get-MpPerformanceReport](/powershell/module/defenderperformance/get-mpperformancereport).

> [!NOTE]
> When running a recording, if you get the error "Cannot start performance recording because Windows Performance Recorder is already recording", run the following command to stop the existing trace with the new command: `wpr -cancel -instancename MSFT_MpPerformanceRecording`.

## Performance tuning data and information

Based on the query, the user is able to view data for scan counts, duration (total/min/average/max/median), path, process, and reason for scan. The following image shows sample output for a simple query of the top 10 files for scan impact.

:::image type="content" source="media/example-output.png" alt-text="Example output for a basic TopFiles query" lightbox="media/example-output.png":::

## Exporting and converting to CSV and JSON

The results of the performance analyzer can also be exported and converted to a CSV or JSON file. The following examples describe how to export and convert performance analyzer results through sample code.

Starting with Defender version `4.18.2206.X`, users are able to view scan skip reason information under `SkipReason` column. The possible values for the `SkipReason` column are:

- Not Skipped
- Optimization (typically due to performance reasons)
- User skipped (typically due to user-set exclusions)

<a name="for-csv"></a>
### Export or convert performance analyzer results to CSV

Use the following commands to export or convert performance analyzer results to CSV.

- **To export**:

    ```powershell
    (Get-MpPerformanceReport -Path .\Repro-Install.etl -Topscans 1000).TopScans | Export-CSV -Path .\Repro-Install-Scans.csv -Encoding UTF8 -NoTypeInformation
    ```

- **To convert**:
  
    ```powershell
    (Get-MpPerformanceReport -Path .\Repro-Install.etl -Topscans 100).TopScans | ConvertTo-Csv -NoTypeInformation
    ```

<a name="for-json"></a>
### Convert performance analyzer results to JSON

Use the following command to convert performance analyzer results to JSON.

- **Convert the top 1000 scans to JSON with a depth of one level**:
    ```powershell
    (Get-MpPerformanceReport -Path .\Repro-Install.etl -Topscans 1000).TopScans | ConvertTo-Json -Depth 1
    ```

To ensure machine-readable output for exporting with other data processing systems, it's recommended to use `-Raw` parameter for `Get-MpPerformanceReport`. For more details, see [Export or convert results to CSV](#for-csv) and [Convert results to JSON](#for-json) earlier in this section.

<a name="reference"></a>
## Performance analyzer reference

For detailed information about performance analyzer cmdlet parameters, options, and output fields, see [Microsoft Defender Antivirus Performance Analyzer reference](performance-analyzer-reference.md).


