---
title:  Run the client analyzer on macOS or Linux
description: Learn how to run the Microsoft Defender for Endpoint Client Analyzer on macOS or Linux
ms.service: defender-endpoint
f1.keywords:
- NOCSH
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
ms.date: 10/21/2024
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier2
- mde-ngp
ms.topic: conceptual
ms.subservice: ngp
search.appverid: met150
---

# Run the client analyzer on macOS and Linux

The XMDEClientAnalyzer is used for diagnosing Microsoft Defender for Endpoint health or reliability issues on onboarded devices running either Linux, or macOS.

There are two ways to run the client analyzer tool:

1. Using a binary version (no external Python dependency)
2. Using a Python-based solution

## Running the binary version of the client analyzer

1. Download the [XMDE Client Analyzer Binary](https://go.microsoft.com/fwlink/?linkid=2297517) tool to the macOS or Linux machine you need to investigate.\
If you're using a terminal, download the tool by entering the following command:

    ```bash
    wget --quiet -O XMDEClientAnalyzerBinary.zip https://go.microsoft.com/fwlink/?linkid=2297517
    ```

1. Verify the download.

   - Linux

    ```bash
    echo '2A9BF0A6183831BE43C7BCB7917A40D772D226301B4CDA8EE4F258D00B6E4E97 XMDEClientAnalyzerBinary.zip' | sha256sum -c
    ```

   - macOS

    ```bash
    echo '2A9BF0A6183831BE43C7BCB7917A40D772D226301B4CDA8EE4F258D00B6E4E97  XMDEClientAnalyzerBinary.zip' | shasum -a 256 -c
    ```


2. Extract the contents of _XMDEClientAnalyzerBinary.zip_ on the machine.

    If you're using a terminal, extract the files by entering the following command:

    ```bash
    unzip -q XMDEClientAnalyzerBinary.zip -d XMDEClientAnalyzerBinary
    ```

3. Change to the tool's directory by entering the following command:

    ```bash
    cd XMDEClientAnalyzerBinary
    ```

4. Two new zip files are produced:

   - **SupportToolLinuxBinary.zip** : For all Linux devices
   - **SupportToolMacOSBinary.zip** : For Mac devices

5. Unzip one of the above 2 zip files based on the machine you need to investigate.

   When using a terminal, unzip the file by entering one of the following commands based on OS type:

   - Linux

     ```bash
     unzip -q SupportToolLinuxBinary.zip
     ```

   - Mac

     ```bash
     unzip -q SupportToolMacOSBinary.zip
     ```

6. Run the tool as _root_ to generate diagnostic package:

   ```bash
   sudo ./MDESupportTool -d
   ```

## Running the Python-based client analyzer

> [!NOTE]
> - The analyzer depends on few extra PIP packages (`decorator`, `sh`, `distro`, `lxml`, and `psutil`) which are installed in the operating system when in root to produce the result output. If not installed, the analyzer attempts to fetch it from the [official repository for Python packages](https://pypi.org/search/?q=lxml).
> - In addition, the tool currently requires Python version 3 or later to be installed on your device.
> - If your device is behind a proxy, then you can simply pass the proxy server as an environment variable to the `mde_support_tool.sh` script. For example: `https_proxy=https://myproxy.contoso.com:8080 ./mde_support_tool.sh"`.

> [!WARNING]
> Running the Python-based client analyzer requires the installation of PIP packages which may cause some issues in your environment. To avoid issues from occurring, it is recommended that you install the packages into a user PIP environment.

1. Download the [XMDE Client Analyzer](https://aka.ms/XMDEClientAnalyzer) tool to the macOS or Linux machine you need to investigate.

    If you're using a terminal, download the tool by running the following command:

    ```bash
    wget --quiet -O XMDEClientAnalyzer.zip https://aka.ms/XMDEClientAnalyzer
    ```

2. Verify the download

   - Linux

    ```bash
    echo '84C9718FF3D29DA0EEE650FB2FC0625549A05CD1228AC253DBB92C8B1D9F1D11 XMDEClientAnalyzer.zip' | sha256sum -c
    ```

   - macOS

    ```bash
    echo '84C9718FF3D29DA0EEE650FB2FC0625549A05CD1228AC253DBB92C8B1D9F1D11  XMDEClientAnalyzer.zip' | shasum -a 256 -c
    ```

3. Extract the contents of XMDEClientAnalyzer.zip on the machine.
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

6. Run as a non-root user to install required dependencies:

    ```bash
    ./mde_support_tool.sh
    ```

7. To collect actual diagnostic package and generate the result archive file, run again as root:

    ```bash
    sudo ./mde_support_tool.sh -d
    ```

## Command line options

### All command line options

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
    exclude             Exclude specific process(es) from audit-d monitoring.
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

This is used to collected etensive set of machine information, such as memory, disk, MDATP logs, etc.
These set of files give us primary set of information required to debug any issue related to MDE.

The options supported for this is:
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

NOTE: The log level auto-reset feature only available in 2405 or newer client version.

The files generated when using this mode:
| File  | Remarks |
| ------------- | ------------- |
| mde_diagnostic.zip  | MDE logs and configs  |
| health.txt  | The health status of MDE [^1]  |
| health_details_features.txt  | The health status of additional MDE features [^1]   |
| permissions.txt  | Permission issues with the folders owned/used by MDE [^1]   |
| crashes  | Crash dumps generated by MDE |
| process_information.txt  | Process running in the machine when the tool was run |
| proc_directory_info.txt  | Mapping of the virtual memory of MDE processes [^1]   |
| auditd_info.txt  | Auditd health, rules, logs |
| auditd_log_analysis.txt  | Summary of events processed by auditd  |
| auditd_logs.zip  | Auditd log files  |
| ebpf_kernel_config.txt  | Currently loaded Linux Kernel config  |
| ebpf_enabled_func.txt  | List of ---------  |
| ebpf_syscalls.zip | Information about system call tracing  |
| ebpf_raw_syscalls.zip  | Tracing events related to raw system calls  |
| ebpf_maps_info.txt  | eBPF maps' id and size info  |
| syslog.zip  | The files usder /var/log/syslog  |
| messages.zip  | The files under /var/log/messages  |
| conflicting_processes_information.txt  | MDE Conflicting Processes |
| exclusions.txt  | List of AV exclusions |
| definitions.txt  | AV defintion info  |
| mde_directories.txt | List of files in the MDE directories |
| disk_usage.txt  | Disk usage details |
| mde_user.txt | MDE User Info |
|  mde_definitions_mount.txt |  MDE Definitions Mount Point |
| service_status.txt | MDE Service Status |
| service_file.txt | MDE Service File |
| hardware_info.txt | Hardware Information |
| mount.txt | Mount point information |
| uname.txt | Kernel info |
| memory.txt | System memory info |
| meminfo.txt | Detailed information about the system's memory usage |
| cpuinfo.txt | CPU Information |
| lsns_info.txt | Linux namespace information |
| lsof.txt | MDE Open File Descriptors Information [^1]  |
| sestatus.txt | MDE Open File Descriptors Information |
| lsmod.txt | Status of modules in the Linux kernel |
| dmesg.txt | Messages from the kernel ring buffer |
| kernel_lockdown.txt | kernel lockdown Info |
| rtp_statistics.txt | MDE Real Time Protection(RTP) statistics [^1]   |
| libc_info.txt | libc library information |
| uptime_info.txt | Time since last restart |
| last_info.txt | Listing of last logged in users |
| locale_info.txt | Show current locale |
| tmp_files_owned_by_mdatp.txt | /tmp files owned by group:mdatp [^1]  |
| mdatp_config.txt | All the MDE configurations [^1]  |
| mpenginedb.db, mpenginedb.db-wal, mpenginedb.db-shm | AV definations file [^1]  |
| iptables_rules.txt | Linux iptables rules |
| network_info.txt | Network information |
| sysctl_info.txt | kernel settings info |
| hostname_diagnostics.txt | Hostname diagnostics information |
| mde_event_statistics.txt | MDE Event statistics [^1]  |
| mde_ebpf_statistics.txt | MDE eBPF statistics [^1]  |
| kernel_logs.zip | Kernel logs |
| mdc_log.zip | Microsoft Defender for Cloud logs |
| netext_config.txt |  |
| threat_list.txt | List of threats detected by MDE [^1]  |
| top_output.txt | Process running in the machine when the tool was run |
| top_summary.txt | Memeory and CPU usage analytics of the process running |
[^1]: Only when MDE is installed.

### Positional arguments

#### Collect performance info

Collect extensive machine performance tracing of MDE processes for analysis of a performance scenario that can be reproduced on demand.

```console
-h, --help            show this help message and exit
--frequency FREQUENCY
                      profile at this frequency
--length LENGTH       length of time to collect (in seconds)
```

Usage example: `sudo ./MDESupportTool performance --frequency 500`

The files generated when using this mode:
| File  | Remarks |
| ------------- | ------------- |
| perf_benchmark.tar.gz  | MDE processes performance data  |
> [!NOTE]
> The files corresponding to diagnostic mode will also be generated.

The tar files contains files on the format `<pid of a MDE process>.data`.
The data file can be read using the command:

`perf report -i <pid>.data`

#### Run connectivity test
This modes test if the cloud resources needed by MDE is reachable or not.

```console
  -h, --help            show this help message and exit
  -o ONBOARDING_SCRIPT, --onboarding-script ONBOARDING_SCRIPT
                        Path to onboarding script
  -g GEO, --geo GEO     Geo string to test <US|UK|EU|AU|CH|IN>
```
Usage example: `sudo ./MDESupportTool connectivitytest -o ~/MicrosoftDefenderATPOnboardingLinuxServer.py`

The result will be printed in the screen.


#### Collect different installation/onboarding reports
This mode collects installation related info like disto info, system requirements, etc.

```console
  -h, --help    show this help message and exit
  -d, --distro  Check for distro support
  -a, --all     Run all checks
```

Usage example: `sudo ./MDESupportTool installation --all`

A single report `installation_report.json` will be generated. The keys in the file are as:
| Key  | Remarks |
| ------------- | ------------- |
| agent_version  | Version of MDE installed  |
| onboarding_status | The onboarding and ring info |


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

Follow this to approve profile installation: [Apple Support Guide](https://support.apple.com/guide/mac-help/configuration-profiles-standardize-settings-mh35561/mac#:~:text=Install%20a%20configuration%20profile%20you%E2%80%99ve%20received).

Usage example `./mde_support_tool.sh trace --length 5`

#### Exclude mode

Add exclusions for audit-d monitoring.

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

### AuditD Rate Limiter

Syntax that can be used to limit the number of events being reported by the auditD plugin. This option sets the rate limit globally for AuditD causing a drop in all the audit events. When the limiter is enabled the number of auditd events are limited to 2500 events/sec. This option can be used in cases where we see high CPU usage from AuditD side.

> [!NOTE]
> This functionality exists for Linux only.

```console
-h, --help                                  show this help message and exit
-e <true/false>, --enable <true/false>      enable/disable the rate limit with default values
```

Usage example: `sudo ./mde_support_tool.sh ratelimit -e true`

> [!NOTE]
> This functionality should be carefully used as limits the number of events being reported by the auditd subsystem as a whole. This could reduces the number of events for other subscribers as well.

### AuditD Skip Faulty Rules

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

## Result package contents on macOS and Linux

- report.html

  Description: The main HTML output file that contains the findings and guidance from running the client analyzer tool on the device. This file is only generated when running the Python-based version of the client analyzer tool.
  
- mde_diagnostic.zip

  Description: Same diagnostic output that gets generated when running *mdatp diagnostic create* on either [macOS](mac-resources.md#collecting-diagnostic-information) or [Linux](linux-resources.md#collect-diagnostic-information).
  
- mde.xml

  Description: XML output that is generated while running and is used to build the html report file.
  
- Processes_information.txt

  Description: contains the details of the running Microsoft Defender for Endpoint related processes on the system.
  
- Log.txt

  Description: contains the same log messages written on screen during the data collection.
  
- Health.txt

  Description: The same basic health output that is shown when running *mdatp health* command.
  
- Events.xml

  Description: Additional XML file used by the analyzer when building the HTML report.
  
- Audited_info.txt

  Description: details on audited service and related components for [Linux](linux-resources.md) OS.
  
- perf_benchmark.tar.gz

  Description: The performance test reports. You'll see this only if you're using the performance parameter.
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
