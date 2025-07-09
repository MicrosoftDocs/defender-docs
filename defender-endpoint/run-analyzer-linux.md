---
title: Run the client analyzer on Linux
description: Run the Defender for Endpoint client analyzer on Linux
author: emmwalshh
ms.author: ewalsh
manager: deniseb
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.subservice: linux
ms.localizationpriority: medium
ms.topic: troubleshooting-general
ms.date: 05/24/2025
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

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

If you have issues with Microsoft Defender for Endpoint on Linux and need support, you might be asked to provide the output from the Client Analyzer tool. This article explains how to use the tool on your device or with live response. You can use either a Python-based solution or a binary version that doesn't need Python.

> [!TIP]
> Watch this video to get an overview of the client analyzer: [Defender for Endpoint client analyzer overview](https://www.youtube.com/watch?v=GnqDsvYYL6w)

## Running the binary version of the client analyzer

1. Download the [XMDE Client Analyzer Binary](https://aka.ms/XMDEClientAnalyzerBinary) tool to the Linux machine that you're to investigating. If you're using a terminal, download the tool by entering the following command:

    ```bash
    wget --quiet -O XMDEClientAnalyzerBinary.zip https://aka.ms/XMDEClientAnalyzerBinary
    ```

2. Verify the download.

    ```bash
    echo 'C65A4E4C6851D130942BFACD147A9D18B8A92B4F50FACF519477FD1C41A1C323 XMDEClientAnalyzerBinary.zip' | sha256sum -c
    ```

3. Extract the contents of `XMDEClientAnalyzerBinary.zip` on the machine.

    ```bash
    unzip -q XMDEClientAnalyzerBinary.zip -d XMDEClientAnalyzerBinary
    ```

4. Change the directory:

    ```bash
    cd XMDEClientAnalyzerBinary
    ```

5. Two new zip files are produced:

   - **SupportToolLinuxBinary.zip**: For all Linux devices
   - **SupportToolMacOSBinary.zip**: For Mac devices

6. Unzip `SupportToolLinuxBinary.zip` file.

     ```bash
     unzip -q SupportToolLinuxBinary.zip
     ```
7. Run the tool as _root_ to generate diagnostic package:

   ```bash
   sudo ./MDESupportTool -d
   ```

## Running the Python-based client analyzer

> [!NOTE]
> - The analyzer depends on a few extra PIP packages (`decorator`, `sh`, `distro`, `lxml`, and `psutil`) which are installed in the operating system when in root to produce the result output. If not installed, the analyzer attempts to fetch it from the [official repository for Python packages](https://pypi.org/search/?q=lxml).
> - In addition, the tool currently requires Python version 3 or later to be installed on your device.
> - If your device is behind a proxy, then you can pass the proxy server as an environment variable to the `mde_support_tool.sh` script. For example: `https_proxy=https://myproxy.contoso.com:8080 ./mde_support_tool.sh"`.

> [!WARNING]
> Running the Python-based client analyzer requires the installation of PIP packages which could cause some issues in your environment. To avoid issues from occurring, we recommend that you install the packages into a user PIP environment.

1. Download the [XMDE Client Analyzer](https://aka.ms/XMDEClientAnalyzer) tool on the Linux machine you need to investigate. If you're using a terminal, download the tool by entering the following command:

    ```bash
    wget --quiet -O XMDEClientAnalyzer.zip https://aka.ms/XMDEClientAnalyzer
    ```

2. Verify the download.

    ```bash
    echo '07E6A7B89E28A78309D5B6F1E25E4CDFBA9CA141450E422D76441C03AD3477E7 XMDEClientAnalyzer.zip' | sha256sum -c
    ```

3. Extract the contents of `XMDEClientAnalyzer.zip` on the machine.

    ```bash
    unzip -q XMDEClientAnalyzer.zip -d XMDEClientAnalyzer
    ```

4. Change the directory.

    ```bash
    cd XMDEClientAnalyzer
    ```

5. Give the tool executable permission.

    ```bash
    chmod a+x mde_support_tool.sh
    ```

6. Run as a nonroot user to install required dependencies.

    ```bash
    ./mde_support_tool.sh
    ```

7. To collect the diagnostic package and generate the result archive file, run again as root.

    ```bash
    sudo ./mde_support_tool.sh -d
    ```

> [!TIP]
> Watch this video to learn more about onboarding issues: [Defender for Endpoint client analyzer onboarding issues](https://www.youtube.com/watch?v=HdhePgMBqs8)

## Command line options
Below are the command line options provided by client analyzer

```console

usage: MDESupportTool [-h] [--output OUTPUT] [--outdir OUTDIR] [--no-zip]
                      [--force] [--diagnostic] [--skip-mdatp]
                      [--bypass-disclaimer] [--interactive] [--delay DELAY]
                      [--mdatp-log {trace,info,warning,error,debug,verbose}]
                      [--max-log-size MAX_LOG_SIZE]
                      {certinfocollection,performance,installation,exclude,ratelimit,skipfaultyrules,trace,observespikes,connectivitytest}
                      ...

MDE Diagnostics Tool

positional arguments:
  {certinfocollection,performance,installation,exclude,ratelimit,skipfaultyrules,trace,observespikes,connectivitytest}
    certinfocollection  Collect cert information: Subject name and Hashes
    performance         Collect extensive machine performance tracing for
                        analysis of a performance scenario that can be
                        reproduced on demand
    installation        Collect different installation/onboarding reports
    exclude             Exclude specific processes from audit-d monitoring.
    ratelimit           Set the rate limit for auditd events. Rate limit will
                        update the limits for auditd events for all the
                        applications using auditd, which could impact
                        applications other than MDE.
    skipfaultyrules     Continue loading rules in spite of an error. This
                        summarizes the results of loading the rules. The exit
                        code will not be success if any rule fails to load.
    trace               Use OS tracing facilities to record Defender
                        performance traces.
    observespikes       Collect the process logs in case of spike or mdatp
                        crash
    connectivitytest    Perform connectivity test for MDE

optional arguments:
  -h, --help            show this help message and exit
  --output OUTPUT, -o OUTPUT
                        Output path to export report
  --outdir OUTDIR       Directory where diagnostics file will be generated.
  --no-zip, -nz         If set a directory will be created instead of an
                        archive file.
  --force, -f           Will overwrite if output directory exists.
  --diagnostic, -d      Collect extensive machine diagnostic information.
  --skip-mdatp          Skip any mdatp command. Use this when the mdatp
                        command is unresponsive.
  --bypass-disclaimer   Do not display disclaimer banner.
  --interactive, -i     Interactive diagnostic,
  --delay DELAY, -dd DELAY
                        Delay diagnostic by how many minutes (0~2880), use
                        this to wait for more debug logs before it collects.
  --mdatp-log {trace,info,warning,error,debug,verbose}
                        Set MDATP log level. If you use interactive or delay
                        mode, the log level will set to debug automatically,
                        and reset after 48h.
  --max-log-size MAX_LOG_SIZE
                        Maximum log file size in MB before rotating(Will
                        restart mdatp).

```

### Diagnostics mode

Diagnostics mode is used to collect extensive set of machine information, such as memory, disk, and MDATP logs.
This set of files gives the primary set of information required to debug any issue related to Defender For Endpoint.

The options supported are as follows:

```console

optional arguments:
  -h, --help            show this help message and exit
  --output OUTPUT, -o OUTPUT
                        Output path to export report
  --outdir OUTDIR       Directory where diagnostics file will be generated.
  --no-zip, -nz         If set a directory will be created instead of an
                        archive file.
  --force, -f           Will overwrite if output directory exists.
  --diagnostic, -d      Collect extensive machine diagnostic information.
  --skip-mdatp          Skip any mdatp command. Use this when the mdatp
                        command is unresponsive.
  --bypass-disclaimer   Do not display disclaimer banner.
  --interactive, -i     Interactive diagnostic,
  --delay DELAY, -dd DELAY
                        Delay diagnostic by how many minutes (0~2880), use
                        this to wait for more debug logs before it collects.
  --mdatp-log {trace,info,warning,error,debug,verbose}
                        Set MDATP log level. If you use interactive or delay
                        mode, the log level will set to debug automatically,
                        and reset after 48h.
  --max-log-size MAX_LOG_SIZE
                        Maximum log file size in MB before rotating(Will
                        restart mdatp).

```

Usage example: `sudo ./MDESupportTool -d`

> [!NOTE]
> The log level autoreset feature is available only in agent version 101.24052.0002 or above.

The files generated when using this mode are summarized in the following table:

| File  | Remarks |
| ------------- | ------------- |
| `mde_diagnostic.zip`  | Defender for Endpoint logs and configs  |
| `health.txt`  | The health status of Defender for Endpoint <br/>(Present only when Defender for Endpoint is installed) |
| `health_details_features.txt`  | The health status of other Defender for Endpoint features <br/>(Present only when Defender for Endpoint is installed) |
| `permissions.txt`  | Permission issues with the folders owned/used by Defender for Endpoint <br/>(Present only when Defender for Endpoint is installed) |
| `crashes`  | Crash dumps generated by Defender for Endpoint |
| `process_information.txt`  | Process running in the machine when the tool was run |
| `proc_directory_info.txt`  | Mapping of the virtual memory of Defender for Endpoint processes <br/>(Present only when Defender for Endpoint is installed) |
| `auditd_info.txt`  | Auditd health, rules, logs |
| `auditd_log_analysis.txt`  | Summary of events processed by auditd  |
| `auditd_logs.zip`  | Auditd log files  |
| `ebpf_kernel_config.txt`  | Currently loaded Linux Kernel config  |
| `ebpf_enabled_func.txt`  | List of all the kernel functions that are currently enabled for tracing |
| `ebpf_syscalls.zip` | Information about system call tracing  |
| `ebpf_raw_syscalls.zip`  | Tracing events related to raw system calls  |
| `ebpf_maps_info.txt`  | eBPF maps' ID and size info  |
| `syslog.zip`  | The files under /var/log/syslog  |
| `messages.zip`  | The files under /var/log/messages  |
| `conflicting_processes_information.txt`  | Defender for Endpoint Conflicting Processes |
| `exclusions.txt`  | List of Antivirus exclusions |
| `definitions.txt`  | Antivirus definition info  |
| `mde_directories.txt` | List of files in the Defender for Endpoint directories |
| `disk_usage.txt`  | Disk usage details |
| `mde_user.txt` | Defender for Endpoint User Info |
| `mde_definitions_mount.txt` |  Defender for Endpoint Definitions Mount Point |
| `service_status.txt` | Defender for Endpoint Service Status |
| `service_file.txt` | Defender for Endpoint Service File |
| `hardware_info.txt` | Hardware Information |
| `mount.txt` | Mount point information |
| `uname.txt` | Kernel info |
| `memory.txt` | System memory info |
| `meminfo.txt` | Detailed information about the system's memory usage |
| `cpuinfo.txt` | CPU Information |
| `lsns_info.txt` | Linux namespace information |
| `lsof.txt` | Defender for Endpoint Open File Descriptors Information <br/>(see the note after this table)  |
| `sestatus.txt` | Defender for Endpoint Open File Descriptors Information |
| `lsmod.txt` | Status of modules in the Linux kernel |
| `dmesg.txt` | Messages from the kernel ring buffer |
| `kernel_lockdown.txt` | kernel lockdown Info |
| `rtp_statistics.txt` | Defender for Endpoint Real Time Protection(RTP) statistics <br/>(Present only when Defender for Endpoint is installed) |
| `libc_info.txt` | libc library information |
| `uptime_info.txt` | Time since last restart |
| `last_info.txt` | Listing of last logged in users |
| `locale_info.txt` | Show current locale |
| `tmp_files_owned_by_mdatp.txt` | /tmp files owned by group: mdatp <br/>(Present only when Defender for Endpoint is installed) |
| `mdatp_config.txt` | All the Defender for Endpoint configurations <br/>(Present only when Defender for Endpoint is installed) |
| `mpenginedb.db`<br/>`mpenginedb.db-wal`<br/> `mpenginedb.db-shm` | Antivirus definitions file <br/>(Present only when Defender for Endpoint is installed) |
| `iptables_rules.txt` | Linux iptables rules |
| `network_info.txt` | Network information |
| `sysctl_info.txt` | kernel settings info |
| `hostname_diagnostics.txt` | Hostname diagnostics information |
| `mde_event_statistics.txt` | Defender for Endpoint Event statistics <br/>(Present only when Defender for Endpoint is installed) |
| `mde_ebpf_statistics.txt` | Defender for Endpoint eBPF statistics <br/>(Present only when Defender for Endpoint is installed) |
| `kernel_logs.zip` | Kernel logs |
| `mdc_log.zip` | Microsoft Defender for Cloud logs |
| `netext_config.txt` |  |
| `threat_list.txt` | List of threats detected by Defender for Endpoint <br/>(Present only when Defender for Endpoint is installed) |
| `top_output.txt `| Process running in the machine when the tool was run |
| `top_summary.txt` | Memory and CPU usage analytics of the process running |

### Optional arguments for Client Analyzer
Client Analyzer provides the following optional arguments for extra data collection:

#### Collect performance info

Collect extensive machine performance tracing of Defender for Endpoint processes for analysis of a performance scenario that can be reproduced on demand.

```console
-h, --help            show this help message and exit
--frequency FREQUENCY
                      profile at this frequency
--length LENGTH       length of time to collect (in seconds)
```

Usage example: `sudo ./MDESupportTool performance --frequency 500`

Below is the file generated when using this mode:

| File  | Remarks |
| ------ | ------ |
| `perf_benchmark.tar.gz`  | Defender for Endpoint processes performance data  |

> [!NOTE]
> The files corresponding to diagnostic mode are also generated.

The tar contains files in the format `<pid of a MDE process>.data`.
The data file can be read using the command:

```console
perf report -i <pid>.data
```

#### Run connectivity test
This mode tests if the cloud resources needed by Defender for Endpoint are reachable or not.

```console

  -h, --help            show this help message and exit
  -o ONBOARDING_SCRIPT, --onboarding-script ONBOARDING_SCRIPT
                        Path to onboarding script
  -g GEO, --geo GEO     Geo string to test <US|UK|EU|AU|CH|IN>

```

Usage example: 

```console
sudo ./MDESupportTool connectivitytest -o ~/MicrosoftDefenderATPOnboardingLinuxServer.py`
```
The output printed on the screen shows if the URLs are reachable or not.


#### Collect different installation/onboarding reports

This mode collects installation related information like distro and system requirements.

```console

  -h, --help                show this help message and exit
  -d, --distro              Check for distro support
  -m, --min-requirement     Check for the system info against offical minimum requirements
  -e, --external-dep        Check for externel package dependency
  -c, --connectivity        Check for connectivity for services used by MDE
  -a, --all                 Run all checks
  -o ONBOARDING_SCRIPT, --onboarding-script ONBOARDING_SCRIPT
                            Path to onboarding script
  -g GEO, --geo GEO         Geo string to test <US|UK|EU|AU|CH|IN>

```

Usage example: 
```console
sudo ./MDESupportTool installation --all
```

A single report `installation_report.json` is generated. The keys in the file are as follows:

| Key  | Remarks |
| ------------- | ------------- |
| agent_version  | Version of Defender for Endpoint installed.  |
| onboarding_status | The onboarding and ring info |
| support_status | MDE is supported with the current system configurations. |
| distro | The distro on which the agent is installed in supported or not. |
| connectivitytest | The connectivity tests status.|
| min_requirement | The minimum requirements for CPU and Memory are met.|
| external_depedency | The external dependencies are satisfied or not. |
| mde_health | Health status of MDE Agent|
| folder_perm | The required folder permissions are met or not. |

#### Exclude mode

This mode adds exclusions for `audit-d` monitoring.

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

Usage example: 
```console
sudo ./MDESupportTool exclude -d /var/foo/bar`
```

### AuditD rate limiter

This option sets the rate limit globally for AuditD causing a drop in all the audit events. When the limiter is enabled, the auditd events are limited to 2500 events/sec. This option can be used in cases where we see high CPU usage from AuditD side.

```console

-h, --help                                  show this help message and exit
-e <true/false>, --enable <true/false>      enable/disable the rate limit with default values

```

Usage example: 
```console
sudo ./mde_support_tool.sh ratelimit -e true
```

> [!NOTE]
> This functionality should be carefully used as it limits the number of events the auditd subsystem reports as a whole. This could reduce the number of events for other subscribers as well.

### AuditD skip faulty rules

This option enables you to skip the faulty rules added in the auditd rules file while loading them. It allows the auditd subsystem to continue loading rules even if there's a faulty rule.

```console

-h, --help                                  show this help message and exit
-e <true/false>, --enable <true/false>      enable/disable the option to skip the faulty rules. In case no argumanet is passed, the option will be true by default.

```

Usage example: 
```console
sudo ./mde_support_tool.sh skipfaultyrules -e true
```

> [!NOTE]
> This functionality skips the faulty rules. Faulty rules must be further identified and fixed.


## Use live response in Defender for Endpoint to collect support logs

The XMDE Client Analyzer tool can be downloaded as a [binary](https://aka.ms/XMDEClientAnalyzerBinary) or [Python](https://aka.ms/XMDEClientAnalyzer) package that can be extracted and executed on Linux machines. Both versions of the XMDE Client Analyzer can be executed during a Live Response session.

- For installation, the `unzip` package is required.
- For execution, the `acl` package is required.

> [!IMPORTANT]
> Window uses the Carriage Return and Line Feed invisible characters to represent the end of one line and beginning of a new line in a file, but Linux systems uses only the Line Feed invisible character at the end of its file lines. When you use the following scripts, if done on Windows, this difference can result in errors and failures of the scripts to run. A potential solution to this is to utilize the Windows Subsystem for Linux and the `dos2unix` package to reformat the script so it aligns with the Unix and Linux format standard.

### Install the XMDE Client Analyzer

Download and extract the XMDE Client Analyzer. You can use either the binary or Python version, as follows:

- [Binary version of the Client Analyzer](run-analyzer-linux.md#running-the-binary-version-of-the-client-analyzer)
- [Python version of the Client Analyzer](run-analyzer-linux.md#running-the-python-based-client-analyzer)

Due to the limited commands available in live response, the steps detailed must be executed in a bash script. By splitting the installation and execution portion of these commands, it's possible to run the install script once, and run the execution script multiple times.

> [!IMPORTANT]
> The example scripts assume the machine has direct internet access and can retrieve the XMDE Client Analyzer from Microsoft. If the machine doesn't have direct internet access, then the installation scripts must be updated to fetch the XMDE Client Analyzer from a location the machines can access successfully.

#### Binary client analyzer install script

The following script performs the first six steps of the [Running the Binary version of the Client Analyzer](run-analyzer-linux.md#running-the-binary-version-of-the-client-analyzer). When complete, the XMDE Client Analyzer binary is available from the `/tmp/XMDEClientAnalyzerBinary/ClientAnalyzer` directory.

1. Create a bash file `InstallXMDEClientAnalyzer.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash 

   echo "Starting Client Analyzer Script. Running As:"
   whoami

   echo "Getting XMDEClientAnalyzerBinary"
   wget --quiet -O /tmp/XMDEClientAnalyzerBinary.zip https://aka.ms/XMDEClientAnalyzerBinary
   echo '4E96E75B16244BB25BDBF34CBB3EB596BC2E9CE368BC4E532E8AE12DF2A1E19D /tmp/XMDEClientAnalyzerBinary.zip' | sha256sum -c

   echo "Unzipping XMDEClientAnalyzerBinary.zip"
   unzip -q /tmp/XMDEClientAnalyzerBinary.zip -d /tmp/XMDEClientAnalyzerBinary

   echo "Unzipping SupportToolLinuxBinary.zip"
   unzip -q /tmp/XMDEClientAnalyzerBinary/SupportToolLinuxBinary.zip -d /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer

   echo "MDESupportTool installed at /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer"

   ```

#### Python client analyzer install script

The following script performs the first six steps of the [Running the Python version of the Client Analyzer](run-analyzer-linux.md#running-the-python-based-client-analyzer). When complete, the XMDE Client Analyzer Python scripts are available from the `/tmp/XMDEClientAnalyzer` directory.

1. Create a bash file `InstallXMDEClientAnalyzer.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "Starting Client Analyzer Install Script. Running As:"
   whoami
  
   echo "Getting XMDEClientAnalyzer.zip"
   wget --quiet -O /tmp/XMDEClientAnalyzer.zip https://aka.ms/XMDEClientAnalyzer 
   echo '07E6A7B89E28A78309D5B6F1E25E4CDFBA9CA141450E422D76441C03AD3477E7 /tmp/XMDEClientAnalyzer.zip' | sha256sum -c  

   echo "Unzipping XMDEClientAnalyzer.zip"
   unzip -q /tmp/XMDEClientAnalyzer.zip -d /tmp/XMDEClientAnalyzer  

   echo "Setting execute permissions on mde_support_tool.sh script"
   cd /tmp/XMDEClientAnalyzer 
   chmod a+x mde_support_tool.sh  

   echo "Performing final support tool setup"
   ./mde_support_tool.sh

   ```
> [!TIP]
> Watch this video to learn more about endpoint settings: [Defender for Endpoint client analyzer endpoint settings](https://www.youtube.com/watch?v=Frw2xFjzphE)
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
> The following scripts assume the XMDE Client Analyzer was installed using the same locations from the scripts mentioned earlier. If your organization chooses to install the scripts into a different location, then the scripts must be updated to align with your organization's chosen installation location.

#### Script to execute the binary client analyzer

The binary version of the client analyzer accepts command line parameters to perform different analysis tests. To provide similar capabilities during live response, the execution script takes advantage of the `$@` bash variable to pass all input parameters provided to the script to the XMDE Client Analyzer.

1. Create a bash file `MDESupportTool.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "cd /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer"
   cd /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer

   echo "Running MDESupportTool"
   ./MDESupportTool $@

   ```

#### Script to execute Python client analyzer

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
> If you have an active live response session, you can skip Step 1.

1. Initiate a [Live Response session](live-response.md#initiate-a-live-response-session-on-a-device) on the machine you want to investigate. 

2. Select **Upload file to library**.

3. Select **Choose file**.

4. Select the downloaded file named `MDESupportTool.sh`, and then select **Confirm**.

5. While still in the live response session, use the following commands to run the analyzer and collect the resulting file:

   ```
   run MDESupportTool.sh -parameters "--bypass-disclaimer -d"
   GetFile "/tmp/your_archive_file_name_here.zip"
   ```
   
## See also

- [Client analyzer overview](overview-client-analyzer.md)

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




