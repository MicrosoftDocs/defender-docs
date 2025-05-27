---
title: Schedule an antivirus scan using Anacron with Microsoft Defender for Endpoint on Linux
description: Learn how to schedule an antivirus scan in Microsoft Defender for Endpoint on Linux for better protection of your organization's assets.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
ms.date: 05/15/2025
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

# Schedule an antivirus scan using Anacron with Microsoft Defender for Endpoint on Linux

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2
- Microsoft Defender Antivirus

To run a scan of Microsoft Defender Antivirus for Linux, see [Supported commands](linux-resources.md#supported-commands).

## System requirements

See the following system requirements needed to schedule Microsoft Defender Antivirus scan in Microsoft Defender Endpoint on Linux.

- Linux distributions and versions: Red Hat Enterprise Linux 7.2 or higher.
- The **FANOTIFY** option in kernel must be enabled.

Also see [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md).

## Scheduling Microsoft Defender Antivirus scan in Red Hat Linux

You can [schedule cron jobs to initiate Microsoft Defender Antivirus scans on a schedule](schedule-antivirus-scan-crontab.md). This process works well if the device is always up and running.

But if the Linux devices are shut down or offline during the cron schedule, scans don't run. In these situations, you can use **anacron** to read the timestamp and find the last executed job. If the device was shut down during the scheduled cron job, it needs to wait until the next scheduled time. By using **anacron**, the system will detect the last time the scan was run. If the device didn't run the cron job, it will automatically start it.

### Schedule Microsoft Defender Antivirus scans in Red Hat Linux

Use the following steps to schedule scans:

1. Connect to the RedHat server using PuTTY.

2. Edit the anacron file as follows:

   ```shell
   vi /etc/anacron
   ```

3. Review and edit your Anacron file, which contains the following information:

   ```shell
   # /etc/anacrontab: configuration file for anacron
   # See anacron (8) and anacrontab (5) for details.
   SHELL=/bin/sh
   PATH=/sbin:/bin:/usr/sbin:/usr/bin
   RANDOM_DELAY=45
   # Anacron jobs will start between 8pm and 11pm.
   START_HOURS_RANGE=20-23
   # delay will be 5 minutes + RANDOM_DELAY for cron.daily
   ```

   Notice the following items in the file:

   - **Shell** is referred as `/bin/sh`, and not as `/bin/bash`. Remember this when you're configuring jobs.
   - **RANDOM_DELAY** describes the maximum time in minutes for the job. This value is used to offset the jobs so there aren't too many jobs running at the same time. Using this delay is ideal for VDI solutions.
   - **START_HOURS_RANGE** describes the time range to run the job.
   - **cron.daily** describes `1` as the period of days required for the frequency of job executions. `5 is the delay in minutes that anacron waits after the device restarts.

4. Review your anacron jobs by using the following command:

   ```shell
   ls -lh /etc/cron*
   ```

   You should see information similar to what's shown in the following screenshot:

   :::image type="content" source="media/vi-etc-anacron.png" alt-text="Sample Anacron Job Linux." lightbox="media/vi-etc-anacron.png" link="media/vi-etc-anacron.png":::

   The following code example provides a more detailed view:

   ```shell
   [root@redhat7 /] # ls -lh /etc/cron*
   - rw - - - - - - -.  1   root    root    0   Nov 30 2021 /etc/cron.deny
   - rw - r - - r - -.  1   root    root    451 Dec 27 2013 /etc/crontab

   /etc/cron.d:
   total 28k
   - rw - r - - r - -.  1   root    root    128 Nov 30  2021    0hourly
   - rw - r - - r - -.  1   root    root    121 Feb 25  18:11   omilogotate
   - rw - r - - r - -.  1   root    root    118 Feb 25  18:14   omsagent
   - rw - r - - r - -.  1   root    root    79  Feb 25  18:15   OMSConsistencyInvoker
   - rw - r - - r - -.  1   root    root    108 Nov 9   2021    raid-check
   - rw - r - - r - -.  1   root    root    135 Jun 1   22:35   scxagent
   - rw - - - - - - -.  1   root    root    235 Jan 20  2020    sysstat

   /etc/cron.daily:
   total 24k
   - rwxr - xr - x. 1   root    root    127 Jun 14  16:49    avscandaily
   - rwx - - - - - -.   1   root    root    219 Aug 7   2019 logrotate
   - rwxr - xr - x. 1   root    root    618 Jul 10  2018     man-db.cron
   - rwx - - - - - -.   1   root    root    208 Nov 9   2017    mlocate
   - rwx - - - - - -.   1   root    root    558 Apr 18  19:03   rhsmd
   - rwxr - xr - x. 1   root    root    114 Apr 8   2021    rhui-update-client

   /etc/cron.hourly:
   total 8.0k
   - rwxr - xr - x. 1   root    root    392 Nov 30  2021    0anacron
   - rwxr - xr - x. 1   root    root    131 Jun 14  17:05   update

   /etc/cron.monthly:
   total 0
   - rwxr - xr - x. 1   root    root    0   Jun 14  17:47   mdatpupdate

   /etc/cron.weekly:
   total 0
   ```

   Ignore the `/etc/cron.d` directory; instead, review `/etc/cron.daily, hourly, monthly, and weekly`.

5. To schedule a weekly antivirus scan, you can create a file (Job) under the ```/etc/cron.weekly``` directory.

   ```shell
   cd /etc/cron.weekly

   vi mdavfullscan

   Press Insert
   ```

   :::image type="content" source="media/vi-mdavfullscan.png" alt-text="weekly antivirus scans":::

   ```shell
   #!/bin/sh
   set -e
   echo $(date) "Time Scan Begins" >>/logs/mdav_avacron_full_scan.log
   /usr/bin/mdatp scan full >> /logs/mdav_avacron_full_scan.log
   echo $(date) "Time Scan Finished" >>/logs/mdav_avacron_full_scan.log
   exit    0
   ~

   Press Esc

   Type: wq!
   ```

6. Change the file permissions to allow the file to be executed by using this command: 

   ```shell
   Chmod 755 mdavfullscan

   ls -la
   ```

   :::image type="content" source="media/chmod-755-mdavfullscan.png" alt-text="7. Change file permissions":::

   ```shell
   [root@redhat7 cron.weekly]# ls -la
   total    16
   drwxr - xr - x.  2   root    root    26  Jun 14  19:19   .
   drwxr - xr - x.  85  root    root    8192    Jun 14  19:01   ..
   - rw - r - - r - -.  1   root    root    128 Jun 14  19:19   mdavfullscan
   [root@redhat7 cron.weekly] # chmod 755 mdavfullscan
   [root@redhat7 cron.weekly] # ls -lh
   total 4. 0k
   - rwxr - xr - x. 1   root    root    128 Jun 14  19:19   mdavfullscan
   [root@redhat7 cron.weekly] #
   ```

7. Use the following command to test the weekly anacron job:

   ```shell
   ./mdavfullscan
   ```

8. Use the following command to verify the job ran successfully:

   ```shell
   cat /logs/mdav_avacron_full_scan.log
   ```

    :::image type="content" source="media/mdav-avacron-full-scan-log.png" alt-text="verify the job ran":::

    ```shell
    [root@redhat7 cron.weekly] # cat /logs/mdav_avacron_full_scan.log
    Tue Jun 14 20:20:44 UTC 2022 Time Scan Begins
    Scan has finished
        66547 file(s) scanned
        0 threat(s) detected
    Tue Jun 14 20:20:50 UTC 2022 Time Scan Finished
    [root@redhat7 cron.weekly] #
    ```

## See also

- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md)
- [Configure security settings and policies for Microsoft Defender for Endpoint on Linux](linux-preferences.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
