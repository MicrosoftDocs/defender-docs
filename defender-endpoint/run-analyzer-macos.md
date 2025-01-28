---
title: Run the client analyzer on macOS
description: Learn how to use the Defender for Endpoint Client Analyzer on Mac to identify health or performance issue causes.
author: denisebmsft
ms.author: deniseb
manager: deniseb
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.subservice: macos
ms.localizationpriority: medium
ms.topic: troubleshooting-general
ms.date: 01/08/2025
ms.custom: partner-contribution
ms.collection:
- m365-security
- tier3
- mde-macos
search.appverid: met150
audience: ITPro
f1.keywords: NOCSH 
---

# Run the client analyzer on macOS

If you're experiencing reliability or device health issues with Microsoft Defender for Endpoint on macOS, you can use the XMDE Client Analyzer to diagnose these issues. This article describes two ways to use the client analyzer tool:

1. Using a binary version (no external Python dependency)
2. Using a Python-based solution

## Use the binary version of the client analyzer

1. Download the [XMDE Client Analyzer Binary](https://go.microsoft.com/fwlink/?linkid=2297517) tool to the macOS machine you need to investigate. 

   If you're using a terminal, download the tool by running the following command:

   ```bash
   wget --quiet -O XMDEClientAnalyzerBinary.zip https://go.microsoft.com/fwlink/?linkid=2297517
   ```

2. Verify the download.

   ```bash
   echo '4E96E75B16244BB25BDBF34CBB3EB596BC2E9CE368BC4E532E8AE12DF2A1E19D  XMDEClientAnalyzerBinary.zip' | shasum -a 256 -c
   ```

2. Extract the contents of `XMDEClientAnalyzerBinary.zip` on the machine. 

   If you're using a terminal, extract the files by running the following command:

   ```bash
   unzip -q XMDEClientAnalyzerBinary.zip -d XMDEClientAnalyzerBinary
   ```

3. Change to the tool's directory by running the following command:

   ```bash
   cd XMDEClientAnalyzerBinary
   ```

4. Notice that the following two zipped files are produced:

   - `SupportToolLinuxBinary.zip`: For all Linux devices
   - `SupportToolMacOSBinary.zip`: For Mac devices

5. Unzip the SupportToolMacOSBinary.zip. 

   ```bash
    unzip -q SupportToolMacOSBinary.zip
   ```
   
6. Run the tool as root to generate your diagnostic package:

   ```bash
   sudo ./MDESupportTool -d
   ```

## Use the Python-based client analyzer

The client analyzer depends on few extra PIP packages (`decorator`, `sh`, `distro`, `lxml`, and `psutil`) that are installed in the operating system when in root mode to produce the result output. If not installed, the analyzer attempts to fetch it from the [official repository for Python packages](https://pypi.org/search/?q=lxml).

The tool currently requires Python version 3 or later to be installed on your device. If your device is behind a proxy, then you can pass the proxy server as an environment variable to the `mde_support_tool.sh` script. For example: `https_proxy=https://myproxy.contoso.com:8080 ./mde_support_tool.sh"`.

> [!WARNING]
> Running the Python-based client analyzer requires the installation of PIP packages which could cause some issues in your environment. To avoid issues from occurring, it is recommended that you install the packages into a user PIP environment.

1. Download the [XMDE Client Analyzer](https://aka.ms/XMDEClientAnalyzer) tool to the Mac machine you're investigating.

   If you're using a terminal, download the tool by running the following command:
   
      ```bash
   wget --quiet -O XMDEClientAnalyzer.zip https://aka.ms/XMDEClientAnalyzer
      ```
      
2. Verify the download. 

   | OS | Command |
   |--|--|
   | Linux | `echo '84C9718FF3D29DA0EEE650FB2FC0625549A05CD1228AC253DBB92C8B1D9F1D11 XMDEClientAnalyzer.zip'| sha256sum -c` |
   | macOS | `echo '84C9718FF3D29DA0EEE650FB2FC0625549A05CD1228AC253DBB92C8B1D9F1D11  XMDEClientAnalyzer.zip'| shasum -a 256 -c` |
   
3. Extract the contents of `XMDEClientAnalyzer.zip` on the machine. 

   If you're using a terminal, extract the files by using the following command:
   
   ```bash
   unzip -q XMDEClientAnalyzer.zip -d XMDEClientAnalyzer
   ```
   
4. Change directory to the extracted location.

   ```bash
   cd XMDEClientAnalyzer
   ```
   
5. Give the tool executable permission:

   ```bash
   chmod a+x mde_support_tool.sh
   ```
   
6. Run as a nonroot user to install required dependencies:

   ```bash
   ./mde_support_tool.sh
   ```
   
7. When you download files on macOS, it automatically adds a new extended attribute called com.apple.quarantine which is scanned by Gatekeeper.  Before running, you will want to remove this extended attribute:

   ```bash
   xattr -c MDESupportTools
   ```

   Otherwise you might get the following warning:

      "You might get a "MDESupportTool" Not Opened

      Apple could not verify "MDESupportTool" is free of malware that may harm your Mac or compromise your privacy"

8. To collect actual diagnostic package and generate the result archive file, run again as root:

   ```bash
   sudo ./mde_support_tool.sh -d
   ```
      
## Command line options

### Primary command lines

Use the following command to get the machine diagnostic.

```console
-h, --help            show this help message and exit
--output OUTPUT, -o OUTPUT
                      Output path to export report
--outdir OUTDIR       Directory where diagnostics file will be generated
--no-zip, -nz         If set a directory will be created instead of an archive file
--force, -f           Will overwrite if output directory exists
--diagnostic, -d      Collect extensive machine diagnostic information
--bypass-disclaimer   Do not display disclaimer banner
--interactive, -i     Interactive diagnostic
--delay DELAY, -dd DELAY
                      Set MDATP log level. If you use interactive or delay mode, the log level will set to debug automatically, and reset after 48h.
--mdatp-log {info,debug,verbose,error,trace,warning}
                      Set MDATP log level
--max-log-size MAX_LOG_SIZE
                      Maximum log file size in MB before rotating(Will restart mdatp)
```

Usage example: `sudo ./MDESupportTool -d`

> [!NOTE]
> The log level autoreset feature is only available in 2405 or newer client version.

### Positional arguments

#### Collect performance info

Collect extensive machine performance tracing for analysis of a performance scenario that can be reproduced on demand.

```console
-h, --help            show this help message and exit
--frequency FREQUENCY
                      profile at this frequency
--length LENGTH       length of time to collect (in seconds)
```

Usage example: `sudo ./MDESupportTool performance --frequency 2`

#### Use OS trace (for macOS only)

Use OS tracing facilities to record Defender for Endpoint performance traces.

> [!NOTE]
> This functionality exists in the Python solution only.

```console
-h, --help       show this help message and exit
--length LENGTH  Length of time to record the trace (in seconds).
--mask MASK      Mask to select with event to trace. Defaults to all
```

On running this command for the first time, it installs a Profile configuration.

To approve profile installation, see the [Apple Support Guide](https://support.apple.com/guide/mac-help/configuration-profiles-standardize-settings-mh35561/mac#:~:text=Install%20a%20configuration%20profile%20you%E2%80%99ve%20received).

Usage example `./mde_support_tool.sh trace --length 5`

## Result package contents on macOS

| File | Description |
|---|---|
| `report.html` | The main HTML output file that contains the findings and guidance from running the client analyzer tool on the device. This file is only generated when running the Python-based version of the client analyzer tool. |
| `mde_diagnostic.zip` | Same diagnostic output that gets generated when running `mdatp diagnostic create` on [macOS](mac-resources.md#collecting-diagnostic-information). |
| `mde.xml` | XML output that is generated while running and is used to build the html report file. |
| `Processes_information.txt` | Contains the details of the running Microsoft Defender for Endpoint related processes on the system. |
| `Log.txt` | Contains the same log messages written on screen during the data collection. |
| `Health.txt` | The same basic health output that is shown when running *mdatp health* command. |
| `Events.xml` | Another XML file used by the analyzer when building the HTML report. |
| `Audited_info.txt` | Details on audited service and related components for [Linux](linux-resources.md) OS. |
| `perf_benchmark.tar.gz` | The performance test reports. You see this file only if you're using the performance parameter. |

## See also

### Defender for Endpoint on macOS troubleshooting

[Troubleshooting mode in Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-troubleshoot-mode)

[Troubleshoot installation issues for Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-support-install)

[Troubleshoot license issues for Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-support-license)

[Troubleshoot system extension issues in Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-support-sys-ext)

[Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on macOS](/defender-endpoint/troubleshoot-cloud-connect-mdemac)

[Overview for how to troubleshoot performance issues for Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-support-perf-overview)

[Address false positives/negatives in Microsoft Defender for Endpoint](/defender-endpoint/defender-endpoint-false-positives-negatives)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
