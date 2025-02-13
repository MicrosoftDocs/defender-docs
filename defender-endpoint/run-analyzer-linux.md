---
title: Run the client analyzer on Linux
description: Run the Defender for Endpoint client analyzer on Linux
author: denisebmsft
ms.author: deniseb
manager: deniseb
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.subservice: linux
ms.localizationpriority: medium
ms.topic: troubleshooting-general
ms.date: 01/08/2024
ms.custom: partner-contribution
ms.collection:
- m365-security
- tier3
- mde-macos
search.appverid: met150
audience: ITPro
f1.keywords: NOCSH 
---

# Run the client analyzer on Linux

**Applies to:**
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

If you're experiencing reliability or device health issues with Defender for Endpoint on Linux, and you contact support, you might be asked to provide the output package of the Microsoft Defender for Endpoint Client Analyzer tool. This article describes how to use the client analyzer tool locally on the device or together with live response. In either case, you can use a Python-based solution or a binary version that has no external Python dependency. 

## Use live response in Defender for Endpoint to collect support logs

The XMDE Client Analyzer tool can be downloaded as a [binary](https://go.microsoft.com/fwlink/?linkid=2297517) or [Python](https://aka.ms/XMDEClientAnalyzer) package that can be extracted and executed on Linux machines. Both versions of the XMDE Client Analyzer can be executed during a Live Response session.

- For installation, the `unzip` package is required.
- For execution, the `acl` package is required.

> [!IMPORTANT]
> Window uses the Carriage Return and Line Feed invisible characters to represent the end of one line and beginning of a new line in a file, but Linux systems uses only the Line Feed invisible character at the end of its file lines. When using the following scripts, if done on Windows, this difference can result in errors and failures of the scripts to run. A potential solution to this is to utilize the Windows Subsystem for Linux and the `dos2unix` package to reformat the script so it aligns with the Unix and Linux format standard.

### Install the XMDE Client Analyzer

Download and extract the XMDE Client Analyzer. You can use either the binary or Python version, as follows:

- [Binary version of the Client Analyzer](run-analyzer-linux.md#run-the-binary-version-of-the-client-analyzer)
- [Python version of the Client Analyzer](run-analyzer-linux.md#run-the-python-based-client-analyzer)

Due to the limited commands available in live response, the steps detailed must be executed in a bash script. By splitting the installation and execution portion of these commands, it's possible to run the install script once, and run the execution script multiple times.

> [!IMPORTANT]
> The example scripts assume the machine has direct internet access and can retrieve the XMDE Client Analyzer from Microsoft. If the machine does not have direct internet access, then the installation scripts must be updated to fetch the XMDE Client Analyzer from a location the machines can access successfully.

#### Binary client analyzer install script

The following script performs the first six steps of the [Running the Binary version of the Client Analyzer](run-analyzer-linux.md#details). When complete, the XMDE Client Analyzer binary is available from the `/tmp/XMDEClientAnalyzerBinary/ClientAnalyzer` directory.

1. Create a bash file `InstallXMDEClientAnalyzer.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "Starting Client Analyzer Script. Running As:"
   whoami

   echo "Getting XMDEClientAnalyzerBinary"
   wget --quiet -O /tmp/XMDEClientAnalyzerBinary.zip https://go.microsoft.com/fwlink/?linkid=2297517
   echo '9D0552DBBD1693D2E2ED55F36147019CFECFDC009E76BAC4186CF03CD691B469 /tmp/XMDEClientAnalyzerBinary.zip' | sha256sum -c

   echo "Unzipping XMDEClientAnalyzerBinary.zip"
   unzip -q /tmp/XMDEClientAnalyzerBinary.zip -d /tmp/XMDEClientAnalyzerBinary

   echo "Unzipping SupportToolLinuxBinary.zip"
   unzip -q /tmp/XMDEClientAnalyzerBinary/SupportToolLinuxBinary.zip -d /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer

   echo "MDESupportTool installed at /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer"

   ```

#### Python client analyzer install script

The following script performs the first six steps of the [Running the Python version of the Client Analyzer](run-analyzer-linux.md#run-the-python-based-client-analyzer). When complete, the XMDE Client Analyzer Python scripts are available from the `/tmp/XMDEClientAnalyzer` directory.

1. Create a bash file `InstallXMDEClientAnalyzer.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "Starting Client Analyzer Install Script. Running As:"
   whoami
  
   echo "Getting XMDEClientAnalyzer.zip"
   wget --quiet -O XMDEClientAnalyzer.zip https://aka.ms/XMDEClientAnalyzer 
   echo '36C2B13AE657456119F3DC2A898FD9D354499A33F65015670CE2CD8A937F3C66 XMDEClientAnalyzer.zip' | sha256sum -c  

   echo "Unzipping XMDEClientAnalyzer.zip"
   unzip -q XMDEClientAnalyzer.zip -d /tmp/XMDEClientAnalyzer  

   echo "Setting execute permissions on mde_support_tool.sh script"
   cd /tmp/XMDEClientAnalyzer 
   chmod a+x mde_support_tool.sh  

   echo "Performing final support tool setup"
   ./mde_support_tool.sh

   ```

#### Run the client analyzer install scripts

1. Initiate a [Live Response session](live-response.md#initiate-a-live-response-session-on-a-device) on the machine you want to investigate.

2. Select **Upload file to library**.

3. Select **Choose file**.

4. Select the downloaded file named `InstallXMDEClientAnalyzer.sh`, and then select **Confirm**.

5. While still in the LiveResponse session, use the following commands to install the analyzer:

   ```console
   run InstallXMDEClientAnalyzer.sh
   ```

### Run the XMDE client analyzer

Live response doesn't support running the XMDE Client Analyzer or Python directly, so an execution script is necessary.

> [!IMPORTANT]
> The following scripts assume the XMDE Client Analyzer was installed using the same locations from the scripts mentioned earlier. If your organization has chosen to install the scripts into a different location, then the scripts must be updated to align with your organization's chosen installation location.

#### Binary client analyzer run script

The binary version of the client analyzer accepts command line parameters to perform different analysis tests. To provide similar capabilities during live response, the execution script takes advantage of the `$@` bash variable to pass all input parameters provided to the script to the XMDE Client Analyzer.

1. Create a bash file `MDESupportTool.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "cd /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer"
   cd /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer

   echo "Running MDESupportTool"
   ./MDESupportTool $@

   ```

#### Python client analyzer run script

The Python version of the client analyzer accepts command line parameters to perform different analysis tests. To provide similar capabilities during live response, the execution script takes advantage of the `$@` bash variable to pass all input parameters provided to the script to the XMDE Client Analyzer.

1. Create a bash file `MDESupportTool.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash  

   echo "cd /tmp/XMDEClientAnalyzer"
   cd /tmp/XMDEClientAnalyzer 

   echo "Running mde_support_tool"
   ./mde_support_tool.sh $@

   ```

#### Run the client analyzer script

> [!NOTE]
> If you have an active live response session you can skip Step 1.

1. Initiate a [Live Response session](live-response.md#initiate-a-live-response-session-on-a-device) on the machine you want to investigate. 

2. Select **Upload file to library**.

3. Select **Choose file**.

4. Select the downloaded file named `MDESupportTool.sh`, and then select **Confirm**.

5. While still in the live response session, use the following commands to run the analyzer and collect the resulting file:

   ```
   run MDESupportTool.sh -parameters "--bypass-disclaimer -d"
   GetFile "/tmp/your_archive_file_name_here.zip"
   ```
   
## Collect Microsoft Defender for Endpoint support logs locally

This section provides instructions on how to run the tool locally on the Linux machines.

### Run the binary version of the client analyzer

#### Summary

1. Obtain from [https://go.microsoft.com/fwlink/?linkid=2297517](https://go.microsoft.com/fwlink/?linkid=2297517). Or, if your Linux server has internet access use `wget` to download the file:

   ```bash
   wget --quiet -O XMDEClientAnalyzerBinary.zip https://go.microsoft.com/fwlink/?linkid=2297517
   ```

2. Unzip the file that is downloaded, and then of the extracted files unzip again the SupportToolLinuxBinary.zip

   ```bash
   unzip -q XMDEClientAnalyzerBinary.zip -d XMDEClientAnalyzerBinary
   ```

3. Run the binary

   ```
   sudo ./MDESupportTool -d --mdatp-log debug
   ```
   
4. Follow the on-screen instructions and then follow up with at the end of the log collection, the logs will be located in the `/tmp` directory.

5. The log set will be owned by root user so you may need root privileges to remove the log set.

6. Upload the file for the support engineer.

#### Details

1. Download the [XMDE Client Analyzer Binary](https://go.microsoft.com/fwlink/?linkid=2297517) tool to the Linux machine you need to investigate.

   If you're using a terminal, download the tool by entering the following command:

   ```bash
   wget --quiet -O XMDEClientAnalyzerBinary.zip https://go.microsoft.com/fwlink/?linkid=2297517
   ```

2. Verify the download.

   ```bash
   echo '2A9BF0A6183831BE43C7BCB7917A40D772D226301B4CDA8EE4F258D00B6E4E97 XMDEClientAnalyzerBinary.zip' | sha256sum -c
   ```

3. Extract the contents of `XMDEClientAnalyzerBinary.zip` on the machine.

   If you're using a terminal, extract the files by entering the following command:

   ```bash
   unzip -q XMDEClientAnalyzerBinary.zip -d XMDEClientAnalyzerBinary
   ```

3. Change to the tool's directory by entering the following command:

   ```bash
   cd XMDEClientAnalyzerBinary
   ```

1. Two new zip files are produced:

   - `SupportToolLinuxBinary.zip`: For all Linux devices
   - `SupportToolMacOSBinary.zip`: For Mac devices, ignore this one.
      
1. Unzip the SupportToolLinuxBinary.zip for the Linux machine you want to investigate.

   ```bash
    unzip -q SupportToolLinuxBinary.zip 
   ```
   
6. Run the tool as root to generate diagnostic package:

   ```bash
   sudo ./MDESupportTool -d
   ```

## Run the Python-based client analyzer

> [!NOTE]
> - The analyzer depends on few extra PIP packages (`decorator`, `sh`, `distro`, `lxml`, and `psutil`) which are installed in the operating system when in root to produce the result output. If not installed, the analyzer attempts to fetch it from the [official repository for Python packages](https://pypi.org/search/?q=lxml).
> - In addition, the tool currently requires Python version 3 or later to be installed on your device.
> - If your device is behind a proxy, then you can simply pass the proxy server as an environment variable to the `mde_support_tool.sh` script. For example: `https_proxy=https://myproxy.contoso.com:8080 ./mde_support_tool.sh"`.

> [!WARNING]
> Running the Python-based client analyzer requires the installation of PIP packages which may cause some issues in your environment. To avoid issues from occurring, it is recommended that you install the packages into a user PIP environment.

1. Download the [XMDE Client Analyzer](https://aka.ms/XMDEClientAnalyzer) tool to the Linux machine you need to investigate.

   If you're using a terminal, download the tool by running the following command:

      ```bash
   wget --quiet -O XMDEClientAnalyzer.zip https://aka.ms/XMDEClientAnalyzer
   ```

2. Verify the download.

   ```bash
   echo '84C9718FF3D29DA0EEE650FB2FC0625549A05CD1228AC253DBB92C8B1D9F1D11 XMDEClientAnalyzer.zip' | sha256sum -c
   ```

3. Extract the contents of `XMDEClientAnalyzer.zip` on the machine.

   If you're using a terminal, extract the files by using the following command:

   ```bash
   unzip -q XMDEClientAnalyzer.zip -d XMDEClientAnalyzer
   ```

4. Change your directory to the extracted location.

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

7. To collect actual diagnostic package and generate the result archive file, run again as root:

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
> The log level autoreset feature only available in 2405 or newer client version.

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

#### Exclude mode

Add exclusions for auditd monitoring.

> [!NOTE]
> This functionality exists for Linux only.

```console
  -h, --help            show this help message and exit
  -e <executable>, --exe <executable>
                        exclude by executable name, i.e: bash
  -p <process id>, --pid <process id>
                        exclude by process id, i.e: 911
  -d <directory>, --dir <directory>
                        exclude by target path, i.e: /var/foo/bar
  -x <executable> <directory>, --exe_dir <executable> <directory>
                        exclude by executable path and target path, i.e: /bin/bash /var/foo/bar
  -q <q_size>, --queue <q_size>
                        set dispatcher q_depth size
  -r, --remove          remove exclusion file
  -s, --stat            get statistics about common executables
  -l, --list            list auditd rules
  -o, --override        Override the existing auditd exclusion rules file for mdatp
  -c <syscall number>, --syscall <syscall number>
                        exclude all process of the given syscall
```

Usage example: `sudo ./MDESupportTool exclude -d /var/foo/bar`

### AuditD rate limiter

Syntax that can be used to limit the number of events reported by the auditD plugin. This option sets the rate limit globally for AuditD causing a drop in all the audit events. When the limiter is enabled the number of auditd events are limited to 2500 events/sec. This option can be used in cases where we see high CPU usage from AuditD side.

> [!NOTE]
> This functionality exists for Linux only.

```console
-h, --help                                  show this help message and exit
-e <true/false>, --enable <true/false>      enable/disable the rate limit with default values
```

Usage example: `sudo ./mde_support_tool.sh ratelimit -e true`

> [!NOTE]
> This functionality should be carefully used as limits the number of events being reported by the auditd subsystem as a whole. This could reduces the number of events for other subscribers as well.

### AuditD skip faulty rules

This option enables you to skip the faulty rules added in the auditd rules file while loading them. This option allows the auditd subsystem to continue loading rules even if there's a faulty rule. This option summarizes the results of loading the rules. In the background, this option runs the auditctl with the -c option.

> [!NOTE]
> This functionality is only available on Linux.

```console
-h, --help                                  show this help message and exit
-e <true/false>, --enable <true/false>      enable/disable the option to skip the faulty rules. In case no argumanet is passed, the option will be true by default.
```

Usage example: `sudo ./mde_support_tool.sh skipfaultyrules -e true`

> [!NOTE]
> This functionality will be skipping the faulty rules. The faulty rule then needs to be further identified and fixed.

## Result package contents on Linux

| File | Description |
|--|--|
| `report.html` | The main HTML output file that contains the findings and guidance from running the client analyzer tool on the device. This file is only generated when running the Python-based version of the client analyzer tool. |
| `mde_diagnostic.zip` | Same diagnostic output that gets generated when running *mdatp diagnostic create* on [Linux](linux-resources.md#collect-diagnostic-information). |
| `mde.xml` | XML output that is generated while running and is used to build the html report file. |
| `Processes_information.txt` | Contains the details of the running Microsoft Defender for Endpoint related processes on the system. |
| `Log.txt` | Contains the same log messages written on screen during the data collection. |
| `Health.txt` | The same basic health output that is shown when running *mdatp health* command. |
| `Events.xml` | Another XML file used by the analyzer when building the HTML report. |
| `Audited_info.txt` | Details on audited service and related components for [Linux](linux-resources.md) OS.| 
| `perf_benchmark.tar.gz` | The performance test reports. You see this file only if you're using the performance parameter. |


## See also

- [Client analyzer overview](overview-client-analyzer.md)

- [Download and run the client analyzer](download-client-analyzer.md)

- [Run the client analyzer on Windows](run-analyzer-windows.md)

- [Run the client analyzer on macOS or Linux](run-analyzer-macos-linux.md)

- [Data collection for advanced troubleshooting on Windows](data-collection-analyzer.md)

- [Understand the analyzer HTML report](analyzer-report.md)

#### Defender for Endpoint on Linux troubleshooting documents

- [Troubleshoot installation issues for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-install)

- [Investigate agent health issues](/defender-endpoint/health-status)

- [Troubleshoot cloud connectivity issues for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-connectivity)

- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-perf)

- [Troubleshoot missing events or alerts issues for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-support-events)

- [Address false positives/negatives in Microsoft Defender for Endpoint](/defender-endpoint/defender-endpoint-false-positives-negatives)

 

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]




