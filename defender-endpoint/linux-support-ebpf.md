---
title: Use eBPF-based sensor for Microsoft Defender for Endpoint on Linux
description: eBPF-based sensor deployment in Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.author: deniseb
author: deniseb
ms.reviewer: gopkr
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
ms.date: 12/02/2024
---

# Use eBPF-based sensor for Microsoft Defender for Endpoint on Linux

[!INCLUDE [Microsoft 365 Defender rebranding](../includes/microsoft-defender.md)]

**Applies to**:

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

> [!NOTE]
> Starting with Defender for Endpoint on Linux, version `101.2408.0000`, AuditD is no longer be supported as a supplementary event provider. For more information, see the FAQs at the end of this article.

The extended Berkeley Packet Filter (eBPF) for Microsoft Defender for Endpoint on Linux provides supplementary event data for Linux operating systems. eBPF helps address several classes of issues seen with the AuditD event provider and is beneficial in the areas of performance and system stability.

Key benefits include:

- Reduced system-wide AuditD-related log noise
- Optimized system-wide event rules otherwise causing conflict between applications
- Reduced overhead for file event (file read/open) monitoring
- Improved event rate throughput and reduced memory footprint
- Optimized performance for specific configurations

## How eBPF works

With eBPF, events previously obtained from the AuditD event provider now flow from the eBPF sensor. This helps with system stability, improves CPU and memory utilization, and reduces disk usage. eBPF helps reduce the possibility of conflicts between applications as no custom rules are required. Data related to eBPF gets logged into the /var/log/microsoft/mdatp/microsoft_defender_core.log file.

In addition, the eBPF sensor uses capabilities of the Linux kernel without requiring the use of a kernel module that helps increase system stability.

## System prerequisites

The eBPF sensor for Microsoft Defender for Endpoint on Linux is supported on the following minimum distribution and kernel versions:

| Linux Distribution | Distribution version | Kernel version |
|--------------------|----------------------|----------------|
| Ubuntu             | 16.04                | 4.15.0         |
| Fedora             | 33                   | 5.8.15         |
| CentOS             | 7.6                  | 3.10.0-957.10  |
| SLES               | 15                   | 5.3.18-18.47   |
| RHEL               | 7.6                  | 3.10.0-957.10  |
| Debian             | 9.0                  | 4.19.0         |
| Oracle Linux RHCK  | 7.9                  | 3.10.0-1160    |
| Oracle Linux UEK   | 7.9                  | 5.4            |
| Amazon Linux 2     | 2                    | 5.4.261-174.360|
| Rocky Linux 8      | 8.7                  | 4.18.0-425     |
| Rocky Linux 9      | 9.2                  | 5.14.0-284     |
| Alma Linux 8       | 8.4                  | 4.18.0-305     |
| Alma Linux 9       | 9.2                  | 5.14.0-284     |

> [!NOTE]
> Oracle Linux 8.8 with kernel version 5.15.0-0.30.20.el8uek.x86_64, 5.15.0-0.30.20.1.el8uek.x86_64 will result in kernel hang when eBPF is enabled as supplementary subsystem provider. This kernel version should not be used for eBPF mode. Refer to Troubleshooting and Diagnostics section for mitigation steps.

## Use eBPF

The eBPF sensor is automatically enabled for all customers by default for agent versions `101.23082.0006` and later. Customers need to update to a supported version to experience the feature. When the eBPF sensor is enabled on an endpoint, Defender for Endpoint on Linux updates supplementary_events_subsystem to ebpf.

:::image type="content" source="/defender/media/defender-endpoint/ebpf-subsystem-linux.png" alt-text="ebpf subsystem highlight in the mdatp health command" lightbox="/defender/media/defender-endpoint/ebpf-subsystem-linux.png":::

In case you want to manually disable eBPF then you can run the following command:

```bash
sudo mdatp config ebpf-supplementary-event-provider --value [enabled/disabled]
```

You can also update the mdatp_managed.json file:

```JSON
{
    "features": {
        "ebpfSupplementaryEventProvider": "disabled"
    }
}
```

Refer to the link for detailed sample json file - [Set preferences for Microsoft Defender for Endpoint on Linux.](linux-preferences.md)

> [!IMPORTANT]
> If you disable eBPF or in the event eBPF is not supported on any specific kernel, supplementary event provider switches to Netlink. All process operations will continue to flow seamlessly, but you may miss out on specific file and socket-related events that eBPF would otherwise capture.

You can also check the status of eBPF (enabled/disabled) on your linux endpoints using advanced hunting in the Microsoft Defender Portal. Steps are as follows:

1. Go to the [Microsoft Defender portal](https://security.microsoft.com) and sign in.

2. In the navigation pane, go to **Hunting** > **Advanced hunting**.

3. Under **Advanced hunting**, go to **Defender Vulnerability Management**.

4. Run the following query: `DeviceTvmInfoGathering`.

5. In the output, in the **Additional fields** column, select **Show more**, and then look for **EBPF STATUS: true**.

## Immutable mode of AuditD

For customers using AuditD in immutable mode, a reboot is required post enablement of eBPF in order to clear the audit rules added by Microsoft Defender for Endpoint. This requirement is a limitation in immutable mode of AuditD, which freezes the rules file and prohibits editing/overwriting. This issue is resolved with the reboot.

Post reboot, run the following command to check if audit rules were cleared:

```bash
% sudo auditctl -l
```

The output of previous command should show no rules or any user added rules. In case where the rules weren't removed, do the following steps to clear the audit rules file:

1. Switch to ebpf mode.

2. Remove the file `/etc/audit/rules.d/mdatp.rules`.

3. Reboot the machine.

### Troubleshooting and Diagnostics

You can check the agent health status by running the `mdatp` health command. Make sure that the eBPF sensor for Defender for Endpoint on Linux is supported by checking the current kernel version by using the following command line:

```bash
uname -a
```

#### Known Issues

1. Enabling eBPF on RHEL 8.1 version with SAP might result in kernel panic. To mitigate this issue, you can take one of the following steps:

   - Use a distro version higher than RHEL 8.1.
   - Switch to AuditD mode if you need to use RHEL 8.1 version.

2. Using Oracle Linux 8.8 with kernel version **5.15.0-0.30.20.el8uek.x86_64, 5.15.0-0.30.20.1.el8uek.x86_64** might result in kernel panic. To mitigate this issue, you can take one of the following steps:

   - Use a kernel version higher or lower than **5.15.0-0.30.20.el8uek.x86_64, 5.15.0-0.30.20.1.el8uek.x86_64** on Oracle Linux 8.8 if you want to use eBPF as supplementary subsystem provider. The minimum kernel version for Oracle Linux is RHCK 3.10.0 and Oracle Linux UEK is 5.4.
   - Switch to AuditD mode if you need to use the same kernel version

      ```bash
      sudo mdatp config  ebpf-supplementary-event-provider  --value disabled
      ```

   - The following two sets of data help analyze potential issues and determine the most effective resolution options.

      1. Collect a diagnostic package from the client analyzer tool by using the following instructions: [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md).

      2. Collect a debug diagnostic package when Defender for Endpoint is utilizing high resources by using the following instructions: [Microsoft Defender for Endpoint on Linux resources](linux-resources.md#collect-diagnostic-information).

3. System hangs on Oracle Linux 7.9 running Defender for Linux when ksplice is used for live kernel patching. 

    - Auto-install patching of ksplice simply adds a cron job to the endpoint.
    - To mitigate the hang issue, you can create a cron job which will first stop the mdatp service, apply ksplice based patching, then start the service.  
    - As kernel patching is few seconds activity so this will not have major exposure in terms of security.  

#### Troubleshooting performance issues

If you see increased resource consumption by Microsoft Defender on your endpoints, it's important to identify the process/mount-point/files that are causing most of the CPU/Memory utilization. You can then apply the necessary exclusions. After applying possible antivirus exclusions, if `wdavdaemon` (parent process) is still consuming the resources, use the ebpf-statistics command to get the top system call count:

```bash
sudo mdatp diagnostic  ebpf-statistics
```

```console
Output
Monitor 20 seconds
Top file paths:
/var/log/microsoft/mdatp/microsoft_defender.log : 10
/var/log/microsoft/mdatp/rotated/microsoft_defender.log00001 : 2
/var/log/microsoft/mdatp/rotated/microsoft_defender.log : 1
/home/gargank/tmp-stress-ng-rename-13550-31/stress-ng-rename-13550-31-374993 : 1
/home/gargank/tmp-stress-ng-rename-13550-31/stress-ng-rename-13550-31-374991 : 1
/home/gargank/tmp-stress-ng-rename-13550-31/stress-ng-rename-13550-31-374989 : 1
/home/gargank/tmp-stress-ng-rename-13550-31/stress-ng-rename-13550-31-374987 : 1
/home/gargank/tmp-stress-ng-rename-13550-31/stress-ng-rename-13550-31-374985 : 1
/home/gargank/tmp-stress-ng-rename-13550-31/stress-ng-rename-13550-31-374983 : 1
/home/gargank/tmp-stress-ng-rename-13550-31/stress-ng-rename-13550-31-374981 : 1

Top initiator paths:
/usr/bin/stress-ng : 50000
/opt/microsoft/mdatp/sbin/wdavdaemon : 13

Top syscall ids:
82 : 1699333
90 : 10
87 : 3
```

In the previous output, you can see that stress-ng is the top process generating large number of events and might result into performance issues. Most likely stress-ng is generating the system call with ID 82. You can create a ticket with Microsoft to get this process excluded. In future as part of upcoming enhancements, you have more control to apply such exclusions at your end.

Exclusions applied to AuditD can't be migrated or copied to eBPF. Common concerns such as noisy logs, kernel panic, noisy syscalls are already taken care of by eBPF internally. In case you want to add any further exclusions, then reach out to Microsoft to get the necessary exclusions applied.

## FAQs - Transition to eBPF 

**1. Why should you consider moving to eBPF?**
    
The extended Berkeley Packet Filter (eBPF) for Microsoft Defender for Endpoint on Linux serves as an efficient alternative to AuditD and addresses various challenges associated with the AuditD event provider while providing significant advantages in terms of performance and system stability. Some of the key benefits include -

- Performance: eBPF significantly improves performance by reducing the overhead on system resources compared to AuditD. 

- Resource Efficiency: eBPF uses fewer resources, which helps maintain system stability even under heavy load conditions.

- Scalability: eBPF's architecture is more scalable, making it a better choice for environments with growing or complex workloads.

- Modern Technology: eBPF represents a modern, forward-looking technology that aligns with future Linux kernel developments, ensuring better long-term support.

**2. How Can I Continue to Use AuditD?**

If you prefer to continue using AuditD:

- Supported Versions: You can remain on Defender for Endpoint on Linux version 101.24072.0000, which will support AuditD during validity of the build, which is approximately nine months. This provides a sufficient transition period to plan your move to eBPF. Expiry date can be checked by running the command `mdatp health` on the Linux server.

- Long-Term Plan: While staying on the `101.24072.0000` build is an option, we recommend planning your transition to eBPF within this timeframe to ensure you benefit from the latest security and performance improvements and also get continued support.

That said, our recommendation would be to plan a move to using eBPF as the primary event provider.

**3. What Happens If eBPF Is Not Supported in Some Scenarios?**

In cases where eBPF isn't supported:

- Netlink Fallback: The system falls back to using the Netlink event provider. While Netlink continues to capture process events (for example, `exec`, `exit`, `fork`, `gid`, or `tid`), it doesn't support file system-related events (for example, `rename`, `unlink`) or socket events.

- Impact: Your workloads won't be disrupted, but you could miss specific file and socket-related events that eBPF would otherwise capture.

**4. How Can I Manage Exclusions with the Updated Versions?**

Following are some common reasons for placing exclusions for AuditD:

- Performance as some syscall or process is generating lot of noise

- Kernel Panic, there are times where lot of syscalls specifically network/filesystem calls resulted in kernel panic.
 
- Noisy logs, where audit logs are using up the disk space. Customer placed the exclusions for the noisy processes in order to reduce the log size.

**While with eBPF, the first two use cases are the candidates for the migration. Logs are no longer an issue with eBPF. For the first two uses case, you can chose from the following options:**

- Contact support: Reach out to Microsoft to apply the exclusions from the backend.

- Global Exclusions: In the updated versions of Defender for Endpoint on Linux, exclusions can be managed with global exclusions. Global exclusions apply to both antivirus and EDR and can be configured through the managed json currently. For more information, see [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-exclusions).

**5. What Should I Do in Case There Are Issues?**

- Contact Support: If you encounter any issues during or after your transition to eBPF, contact technical support for assistance. We're committed to ensuring a smooth transition and are available to help resolve any challenges you may face.

- Support Channels: You can contact support via the Microsoft Defender portal. Additionally, our knowledge base and community forums are valuable resources for troubleshooting common issues.


## See also

- [Troubleshoot performance issues for Microsoft Defender for Endpoint on Linux](linux-support-perf.md)
- [Microsoft Defender for Endpoint on Linux resources](linux-resources.md#collect-diagnostic-information)
