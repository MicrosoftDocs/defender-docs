---
title: Run remote MDE Client Analyzer traces via live response
description: Step-by-step guidelines to start and stop MDE Client Analyzer tracing on Windows devices via live response.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- mde-edr
ms.topic: troubleshooting
ms.subservice: edr
search.appverid: met150
ms.date: 01/13/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 2
---

# Run remote MDE Client Analyzer traces via live response

On [Windows devices that support live response](live-response.md#supported-operating-systems), you can start and stop remote trace collection without signing in to the device. You can use this capability in the following scenarios:

- An issue happens only when the user is signed out.
- The specific environment where the issue happens is restricted. Direct user interaction for log collection isn't possible.

The rest of this article describes how to use live response to run the MDE Client Analyzer remotely on supported devices.

## Prerequisites

- Verify live response is enabled in Microsoft Defender for Endpoint. For instructions, see [Other requirements for live response](live-response.md#other-requirements).
- Download the latest version of the MDE Client Analyzer from <https://aka.ms/Betamdeanalyzer>.

## Step 1: Upload Files to your live response library

[Upload the following required files to your live response library](live-response.md#to-upload-a-file-in-the-library):

- `MDEClientAnalyzerPreview.zip`
- The following files extracted from the `Tools` folder of `MDEClientAnalyzerPreview.zip`:
  - `MDELiveAnalyzer.ps1`
  - `MDELiveAnalyzerPerf.ps1`

Other scripts for scenario-specific troubleshooting are also available in the `Tools` folder:

- `MDELiveAnalyzerAppCompat.ps1`
- `MDELiveAnalyzerAV.psl`
- `MDELiveAnalyzerNet.ps1`

## Step 2: Deploy the MDE Client Analyzer on the device

[Initiate a live response session on the device](live-response.md#initiate-a-live-response-session-on-a-device) and then run the following command in the session:

```dos
putfile MDEClientAnalyzerPreview.zip
```

The command output looks like this:

```dos
The file was uploaded to the device.
Path: C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\MDEClientAnalyzerPreview.zip
```

> [!TIP]
> If you're uploading a newer version of the package, add the `-overwrite` switch to the `putfile` command.

## Step 3: Start trace collection on the device

In the live response session, run the following command to start background tracing:

```dos
run MDELiveAnalyzerPerf.ps1&
```

The command output looks like this:

```dos
[afb7f18a-8ad2-3b95-8eb3-6819159e253d]   (Just created)   Run MDELiveAnalyzerPerf.ps1&
```

> [!IMPORTANT]
>
> - Record the returned GUID value for session management. You use this value in a later step. This value is returned when calling a script with the `&` instruction.
> - Adjust the script name for specific scenarios. For example, use `MDELiveAnalyzerNet.ps1` for network related troubleshooting scenarios.
> - Wait a few minutes to ensure the analyzer initiates tracing before you go to the next step.

To verify the trace started successfully, do either of the following steps:

- Verify the existence of `WPR_initiated_sense_sense.etl` file in your live response session with the following `fileinfo` command:

  ```dos
  fileinfo C:\Windows\Temp\WPR_initiated_Sense_Sense.etl
  ```

  The output looks like this:

  ```dos
  {
    "C:\Windows\Temp\WPR_initiated_Sense_Sense.etl": {
      "error": O
      "path": "C:\Windows\Temp\WPR_initiated Sense Sense.etl",
      "size": 5373952,
      "downloaded" : false,
      "created": "2021-11-30 19:36:59",
      "modified": "2021-11-30 19:39:40",
      "mime type" : "application/octet-stream
      "compressed" : false,
      "executable_type": 0,
      "vendor": "",
      "directory_types": [
        "Temporary",
        "System"
      ],
      "read only": false,
      "hidden" : false,
      "3ha256": "f5ede3a2d3af8e125f8d238c4b3de80baa1ec4629887ef84e3e5b94b6925f9f9",
      "sha1": "50ff8c34e526b37e7c46c47b730e1dc29f23b9e5"
      "md5": "7def8ffbe58d6fcafb91a91fe2c338fa"
      "packed" : null,
      "ms verified" : false,
      "last access error": O,
      "last raw access error
      "file state": O,
      "file state display": [
        "Default"
      ],
      "digital signature" : null
  ...
  ```

- Use **Performance monitor** (run `perfmon.exe`) to verify **WPR_initiated_Sense_Sense** is running under **Data Collector Sets** \> **Event Trace sessions** on the device as shown in the following screenshot:

  :::image type="content" source="media/client-analyzer-performance-monitor.png" alt-text="Screenshot of WPR_initiated_Sense_Sense running in Performance Monitor." lightbox="media/client-analyzer-performance-monitor.png":::

## Step 4: Reproduce the issue on the device

Do the steps that trigger the problem on the device while the trace runs.

## Step 5: Stop trace collection on the device

After you reproduce the issue, run the following command in the live session to stop trace collection on the device:

```dos
Run MDELiveAnalyzer.ps1
```

The output looks like this:

```dos
Transcript started, output file is C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Temp\PSScriptOutputs\PSScript_Transcript_{0D5EC-4812-2A6A-81EC-C369F458}.txt
MDEClientAnalyzer EULA Accepted
Another non-interactive trace is already running... stopping log collection and exiting.
```

Bring the previous trace collection script from [Step 3](#step-3-start-trace-collection-on-the-device) to the foreground of the live session by using the GUID value from Step 3 in the following `fg` command. For example:

```dos
fg afb7f18a-8ad2-3b95-8eb3-6819159e253d
```

The output looks like this:

```dos
Transcript started, output file is C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Temp\PSScriptOutputs\PSScript_Transcript_{afb7f18a-8ad2-3b95-8eb3-6819159e253d}.txt
MDEClientAnalyzer EULA Accepted
2025-11-30 21:36:21Z [Informational] EDRCloud CnC 130017: Test connection to the Microsoft Defender for (CnC) cloud service URLs completed successfully. N/A
2025-11-30 21:36:21Z [Informational] EDRCloud Cyber 130018: Test connection to the Microsoft Defender for Endpoint (Cyber) cloud service URLs completed successfully. N/A
2025-11-30 21:36:21Z [Informational] EDRCloud AutoIR 130019: Test connection to the Microsoft Defender for Endpoint (AutoIR) cloud service URLs completed successfully. N/A
2025-11-30 21:36:21Z [Informational] AVCloud SampleUpload 130020: Test connection to the Microsoft Defender for Endpoint (SampleUpload) cloud service URLs completed successfully. N/A
2025-11-30 21:36:21Z [Informational] EDRCloud MdeConfigMgr 130021: Test connection to the Microsoft Defender for Endpoint (MdeConfigMgr) cloud service URLs completed successfully. N/A
2025-11-30 21:36:22Z [Informational] AVCloud 130011: Test connection to the Microsoft Defender Antivirus cloud service completed successfully. N/A
2025-11-30 21:36:22Z [Informational] AVCloud 130012: Current network connection is not metered. N/A
Running MpCmdRun -GetFiles...
Stopping any running WPR trace profiles
Stopping any running perfmon trace profiles
WARNING: Trace started... Note that you can stop this non-interactive mode by running 'MDEClientAnalyzer.cmd' from another window or session
Remaining seconds: 3599
Remaining seconds: 3272
Remaining seconds: 3271
Stop event was triggered!
Remaining seconds: 3270
Stopping any running trace profiles
Stopping and merging Defender Antivirus traces if running
Running MpCmdRun -GetFiles...
VERBOSE: Performing the operation "Copy File" on target "Item: C:\ProgramData\Microsoft\Windows Defender\Support\MpSupportFiles.cab Destination: C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\MDEClientAnalyzerResult\DefenderAV\MpSupportFiles.cab".
2025-11-30 21:46:29Z [Informational] CertRevocation 130010: Certificate validation for the Defender for Endpoint cloud service completed successfully. N/A
Evaluating cloud platform metadata...
Evaluating sensor condition...
Compressing results directory...
Result is available at C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\MDEClientAnalyzerResult.zip".
```

## Step 6: Download the trace results from the device

To retrieve the results from the device, run the following `getfile` command in the live session:

```dos
getfile "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\MDECA\MDEClientAnalyzerResult.zip"
```

## Related articles

[Collect support logs in Microsoft Defender for Endpoint using live response](troubleshoot-collect-support-log.md)

[Live response command examples](live-response-command-examples.md)
