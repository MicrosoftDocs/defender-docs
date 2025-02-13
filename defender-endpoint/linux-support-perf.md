---
title: Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux
description: Troubleshoot performance issues in Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: deniseb
author: deniseb
ms.reviewer: gopkr
ms.localizationpriority: medium
ms.date: 02/04/2025
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
---

# Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to**:

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

This article describes how to narrow down performance issues related to Defender for Endpoint on Linux. Diagnostic tools are available to help you understand and mitigate existing resource shortages and processes that are affecting performance. These diagnostic tools can be utilized to enhance visibility within the Microsoft Defender portal as well. Bottlenecks in one or more hardware subsystems mainly cause performance problems, depending on the profile of resource utilization on the system. Sometimes applications are sensitive to disk I/O resources and may need more CPU capacity, and sometimes some configurations aren't sustainable, and may trigger too many new processes, and open too many file descriptors.

Depending on the applications that you're running and your device characteristics, you may experience suboptimal performance when running Defender for Endpoint on Linux. In particular, applications or system processes that access many resources such as CPU, Disk, and Memory over a short timespan can lead to performance issues in Defender for Endpoint on Linux.

> [!WARNING]
> Before starting, **make sure that other security products are not currently running on the device**. Multiple security products may conflict and impact the host performance.

There are three distinct ways to troubleshoot noisy processes and directories using the Diagnostic tools from Microsoft Defender for Endpoint on Linux:

- Using Real-time Protection Statistics
- Using Hot Event Sources
- Using eBPF Statistics

## Troubleshoot performance issues using Real-time Protection Statistics

**Applies to:**
- Only performance issues related to antivirus

Real-time protection (RTP) is a feature of Defender for Endpoint on Linux that continuously monitors and protects your device against threats. It consists of file and process monitoring and other heuristics.

The following steps can be used to troubleshoot and mitigate these issues:

1. Disable real-time protection using one of the following methods and observe whether the performance improves. This approach helps narrow down whether Defender for Endpoint on Linux is contributing to the performance issues. If your device isn't managed by your organization, real-time protection can be disabled from the command line:

   ```bash
   mdatp config real-time-protection --value disabled
   ```

   ```console
   Configuration property updated
   ```

   If your organization manages your device, your administrator can disable real-time protection using the instructions in [Set preferences for Defender for Endpoint on Linux](linux-preferences.md).

   > [!NOTE]
   > If the performance problem persists while real-time protection is off, the origin of the problem could be the endpoint detection and response (EDR) component as well. In this case, you need to add global exclusions from Antivirus and EDR. In this case, follow the steps in the section, [Troubleshoot performance issues using Hot Event Sources](#troubleshoot-performance-issues-using-hot-event-sources).

2. To find the applications that are triggering the most scans, you can use real-time statistics gathered by Defender for Endpoint on Linux.

   > [!NOTE]
   > This feature is available in version 100.90.70 or newer.

   This feature is enabled by default on the `Dogfood` and `InsiderFast` channels. If you're using a different update channel, this feature can be enabled from the command line:

   ```bash
   mdatp config real-time-protection-statistics --value enabled
   ```

   This feature requires real-time protection to be enabled. To check the status of real-time protection, run the following command:

   ```bash
   mdatp health --field real_time_protection_enabled
   ```

   Verify that the `real_time_protection_enabled` entry is `true`. Otherwise, run the following command to enable it:

   ```bash
   mdatp config real-time-protection --value enabled
   ```

   ```console
   Configuration property updated
   ```

   To collect current statistics, run:

   ```bash
   mdatp diagnostic real-time-protection-statistics --output json
   ```

   > [!NOTE]
   > Using `--output json` (note the double dash) ensures that the output format is ready for parsing.

   The output of this command shows all processes and their associated scan activity.

3. Type the following commands:

   ```bash
   mdatp diagnostic real-time-protection-statistics --sort --top 4
   ```
   The output is a list of the top four contributors to performance issues. For example, the output of the command is something like the following:

   ```console
   =====================================
   Process id: 560
   Name: NetworkManager
   Path: "/usr/sbin/NetworkManager"
   Total files scanned: 261
   Scan time (ns): "3070788919"
   Status: Active
   =====================================
   Process id: 1709561
   Name: snapd
   Path: "/snap/snapd/23545/usr/lib/snapd/snapd"
   Total files scanned: 247
   Scan time (ns): "19926516003"
   Status: Active
   =====================================
   Process id: 596
   Name: systemd-logind
   Path: "/usr/lib/systemd/systemd-logind"
   Total files scanned: 29
   Scan time (ns): "716836547"
   Status: Active
   =====================================
   Process id: 1977683
   Name: cupsd
   Path: "/usr/sbin/cupsd"
   Total files scanned: 20
   Scan time (ns): "985110892"
   Status: Active
   =====================================
   ```

   To improve the performance of Defender for Endpoint on Linux, locate the one with the highest number under the `Total files scanned` row and add an antivirus exclusion for it (carefully evaluate if it's safe to exclude). For more information, see [Configure and validate exclusions for Defender for Endpoint on Linux](linux-exclusions.md).

   > [!NOTE]
   > The application stores statistics in memory and only keeps track of file activity since it was started and real-time protection was enabled. Processes that were launched before or during periods when real time protection was off aren't counted. Additionally, only events which triggered scans are counted.

## Troubleshoot performance issues using Hot Event Sources

**Applies to:**
-  Performance issues in files and executables which are consuming most CPU cycles in the entire filesystem.

Hot event sources is a feature that allows customers to identify which process or directory is responsible for high resource consumption. To investigate which process/executable is generating the most noise, follow these steps.

> [!NOTE]
> These commands require you to have root permissions. Ensure that sudo can be used.

First, check the log level on your machine.

   ```bash
   mdatp health --field log_level
   ```
If it's not on "debug" you need to change it for a detailed report regarding hot files / executables.

   ```bash
   sudo mdatp log level set --level debug
   ```
   ```console
   Log level configured successfully
   ```

To collect current statistics (for files), 

   ```bash
   sudo mdatp diagnostic hot-event-sources files
   ```
The output looks similar to the following on the console (this is just a snippet of the entire output). Here, the first row shows the count (frequency of occurrence) and the second shows the file path.
   ```console
   Total Events: 11179 Time: 12s. Throughput: 75.3333 events/sec. 
   =========== Top 684 Hot Event Sources ===========
   count   file path
   2832    /mnt/RamDisk/postgres_data/pg_wal/0000000100000014000000A5
   632     /mnt/RamDisk/postgres_data/base/635594/2601
   619     /mnt/RamDisk/postgres_data/base/635597/2601
   618     /mnt/RamDisk/postgres_data/base/635596/2601
   618     /mnt/RamDisk/postgres_data/base/635595/2601
   616     /mnt/RamDisk/postgres_data/base/635597/635610
   615     /mnt/RamDisk/postgres_data/base/635596/635602
   614     /mnt/RamDisk/postgres_data/base/635595/635606
   514     /mnt/RamDisk/postgres_data/base/635594/635598_fsm
   496     /mnt/RamDisk/postgres_data/base/635597/635610_fsm
   ```
   This command generates a Hot event source report which is saved in your local folder that can further investigated.
   The output looks like follows on the json file;

   ```console
   {
       "startTime": "1729535104539160",
       "endTime": "1729535117570766",
       "totalEvent": "11373",
       "eventSource": [
           {
               "authCount": "2832",
               "csId": "",
               "notifyCount": "0",
               "path": "/mnt/RamDisk/postgres_data/pg_wal/0000000100000014000000A5",
               "pidCount": "1",
               "teamId": ""
           },
           {
               "authCount": "632",
               "csId": "",
               "notifyCount": "0",
               "path": "/mnt/RamDisk/postgres_data/base/635594/2601",
               "pidCount": "1",
               "teamId": ""
           }
       ]
   }
   ```

In the example, we can see that the file /mnt/RamDisk/postgres_data/pg_wal/0000000100000014000000A5 generates the most activity.
Also, similarly for the executables, 

```bash
sudo mdatp diagnostic hot-event-sources executables
```

The output looks similar to the following on the console.

   ```console
   Total Events: 47382 Time: 18s. Throughput: 157 events/sec.
   =========== Top 23 Hot Event Sources ===========
   count    executable path
   8216    /usr/lib/postgresql/12/bin/psql
   5721    /usr/lib/postgresql/12/bin/postgres (deleted)
   3557    /usr/bin/bash
   378     /usr/bin/clamscan
   88      /usr/bin/sudo
   70      /usr/bin/dash
   30      /usr/sbin/zabbix_agent2
   10      /usr/bin/grep
   8       /usr/bin/gawk
   6       /opt/microsoft/mdatp/sbin/wdavdaemonclient
   4       /usr/bin/sleep
   ```
This is the output saved in the hot event source report in json;

   ```console
   {
       "startTime": "1729534260988396",
       "endTime": "1729534280026883",
       "totalEvent": "48165",
       "eventSource": [
           {
               "authCount": "8126",
               "csId": "",
               "notifyCount": "0",
               "path": "/usr/lib/postgresql/12/bin/psql",
               "pidCount": "2487",
               "teamId": ""
           },
           {
               "authCount": "5127",
               "csId": "",
               "notifyCount": "0",
               "path": "/usr/lib/postgresql/12/bin/postgres",
               "pidCount": "2144",
               "teamId": ""
           }
       ]
   }
   ```
In this example, after 18s the command shows that the executables; /usr/lib/postgresql/12/bin/psql and /usr/lib/postgresql/12/bin/postgres generate the most activity.

Once you've finished the investigation, you can change the log level back to "info".

   ```bash
   sudo mdatp log level set --level info
   ```
   ```console
   Log level configured successfully
   ```

To improve the performance of Defender for Endpoint on Linux, locate the path with the highest number in the count row and add a global process exclusion (if it's an executable) or a global file/folder exclusion (if it's a file) for it (carefully evaluate if it's safe to exclude). For more information, see [Configure and validate exclusions for Defender for Endpoint on Linux](linux-exclusions.md).

## Troubleshoot performance issues using eBPF Statistics

**Applies to:**
- All file/ process events, including system call based performance issues.

eBPF (extended Berkeley Packet Filter) statistics command gives insights into the top event/process that's generating the most file events, along with their syscall IDs. When system calls are being made from the system, there's a high amount of workload generated on your system. eBPF statistics can be used to identify such issues.

To collect current statistics using eBPF statistics, run:

   ```bash
   mdatp diagnostic ebpf-statistics
   ```

   The output is directly shown on the console and would look similar to the following (this is only a snippet of the entire output):

   ```console
   Top initiator paths:
   /usr/lib/postgresql/12/bin/psql : 902
   /usr/bin/clamscan : 349
   /usr/sbin/zabbix_agent2 : 27
   /usr/lib/postgresql/12/bin/postgres : 10
   
   Top syscall ids:
   80 : 9034
   57 : 8932
   60 : 8929
   59 : 4942
   112 : 4898
   90 : 179
   87 : 170
   119 : 32
   288 : 19
   41 : 15
   ```
   
This command monitors the system for 20 seconds and shows the results. Here the top initiator path (postgresql/12/bin/psql) shows the path of the process that generated the most system calls.

To improve the performance of Defender for Endpoint on Linux, locate the one with the highest `count` in the `Top initiator path` row and add a global process exclusion for it (carefully evaluate if it's safe to exclude). For more information, see [Configure and validate exclusions for Defender for Endpoint on Linux](linux-exclusions.md).

## Configure Global Exclusions for better performance

Configure Microsoft Defender for Endpoint on Linux with exclusions for the processes or disk locations that contribute to the performance issues. For more information, see [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md). IF you still have performance issues, contact support for further instructions and mitigation.

## See also

- [Investigate agent health issues](health-status.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
