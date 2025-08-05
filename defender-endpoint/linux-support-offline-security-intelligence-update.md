---
title: Configure offline security intelligence updates for Microsoft Defender for Endpoint on Linux
description: Learn how to set up offline security intelligence updates in Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.subservice: linux
ms.author: ewalsh
author: emmwalshh
ms.reviewer: gopkr
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: how-to
search.appverid: met150
ms.date: 03/31/2025
---

# Configure offline security intelligence updates for Microsoft Defender for Endpoint on Linux 

[!INCLUDE [Microsoft 365 Defender rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

## How offline security intelligence updates work

This article describes how to configure offline security intelligence updates in Defender for Endpoint on Linux. This capability enables you to update security intelligence (also referred to as *definitions* or *signatures*) on Linux devices that have limited or no exposure to the internet. With this configuration, you use a local hosting server, called a *mirror server*, that connects to the Microsoft cloud to download security intelligence updates. Other Linux devices pull these updates from your mirror server at predefined intervals.

## Benefits of using offline security intelligence updates

Key benefits include:

- Your security team can control and manage the frequency of signature downloads on the local server and the frequency at which endpoints pull signatures from the local server.
- You have an extra layer of protection and control as the downloaded signatures can be tested on a test device before they're propagated to the entire fleet.
- You need less network bandwidth, because only one local server gets the latest updates from the Microsoft cloud on behalf of your entire fleet.
- Your mirror server can run Windows, Mac, or Linux, and you don't have to install Defender for Endpoint on that server.
- You get the most up-to-date antivirus protection, because signatures are always downloaded along with the latest compatible antivirus engine.
- Older versions of signatures (`n-1`) are moved to a backup folder on your mirror server in each iteration. If there's an issue with the latest updates, you can pull the `n-1` signature version from the backup folder to your devices.
- In the rare event an offline update fails, you can configure a fallback option to get online updates from the Microsoft cloud.

## How offline security intelligence update works

- You set up a mirror server, which is a local Web or NFS server that's reachable by the Microsoft cloud.
- Signatures are downloaded from Microsoft cloud on this mirror server by executing a script using cron job or task scheduler on the local server.
- Linux endpoints running Defender for Endpoint pull the downloaded signatures from the mirror server at a predefined time interval.
- Signatures pulled onto Linux devices from the local server are first verified before they're loaded into the antivirus engine.
- To start and configure the update process, you can update the managed configuration json file on your Linux devices.
- You can view the status of updates in the mdatp CLI.

:::image type="content" source="./media/offline-update-diag-1.png" alt-text="Process flow diagram on the Mirror Server for downloading the security intelligence updates" lightbox="./media/offline-update-diag-1.png":::

Fig. 1: Process flow diagram on the mirror server for downloading the security intelligence updates

:::image type="content" source="./media/offline-update-diag-2.png" alt-text="Process flow diagram on the Linux endpoint for security intelligence updates" lightbox="./media/offline-update-diag-2.png":::

Fig. 2: Process flow diagram on the Linux endpoint for security intelligence updates

The mirror server can run any of the following operating systems:

- Linux (any flavor)
- Windows (any version)
- Mac (any version)

## Prerequisites

- Defender for Endpoint version `101.24022.0001` or later must be installed on the Linux endpoints.
- The Linux endpoints need to have connectivity to the mirror server.
- The Linux endpoint must be running any of the Defender for Endpoint-supported distributions. (see [Supported Linux distributions](mde-linux-prerequisites.md#supported-linux-distributions).)
- The mirror server can be either an HTTP/HTTPS server or a network share server, such as an NFS Server.
- The mirror server needs to have access to the following URLs:
  - `https://github.com/microsoft/mdatp-xplat.git`
  - `https://go.microsoft.com/fwlink/?linkid=2144709`
- The mirror server should support bash or PowerShell.
- The following minimum system specifications are required for the mirror server:

  | CPU Core| RAM | Free disk  | Swap |
  |--|--|--|--|
  | 2 cores (Preferred 4 Core) | 1 GB Min (Preferred 4 GB)  | 2 GB  | System Dependent|
  
  > [!NOTE]
  > This configuration might vary depending on the number of requests that are served and the load each server must process.

## Configuring the mirror server

> [!NOTE]
> - The management and ownership of the Mirror Server lies solely with the customer as it resides in the customer's private environment.
> - The Mirror Server doesn't need to have Defender for Endpoint installed.

### Get the offline security intelligence downloader script

Microsoft hosts an offline security intelligence downloader script on [this GitHub repo](https://github.com/microsoft/mdatp-xplat).

Perform the following steps to get the downloader script:

#### Option 1: Clone the repo (Preferred)

1. [Install git](https://kinsta.com/knowledgebase/install-git/) on the mirror server.

2. Navigate to the directory where you want to clone the repo.

3. Run the following command: `git clone https://github.com/microsoft/mdatp-xplat.git`

#### Option 2: Download the zipped file

1. [Download the zipped file](https://github.com/microsoft/mdatp-xplat/archive/refs/heads/master.zip).

2. Copy the downloaded file to the folder where you want to keep the script.

3. Extract the zipped folder.

4. Schedule a task or a [cron job](linux-update-mde-linux.md#to-set-the-cron-job) to keep the repo/downloaded zip file updated to the latest version at regular intervals.

#### Local directory structure after cloning the repo or downloading the zipped file

After cloning the repo or downloading the zipped file, the local directory structure should be as follows:

```console
user@vm:~/mdatp-xplat$ tree linux/definition_downloader/
linux/definition_downloader/
├── README.md
├── settings.json
├── settings.ps1
├── xplat_offline_updates_download.ps1
└── xplat_offline_updates_download.sh

0 directories, 5 files
```

> [!NOTE]
> Go through the `README.md` file to understand in detail about how to use the script.

The `settings.json` file consists of a few variables that the user can configure to determine the output of the script execution.

| Field Name               | Value  | Description                                            |
|--------------------------|--------|--------------------------------------------------------|
| `downloadFolder`         | string | Maps to the location where the script downloads the files to. |
| `downloadLinuxUpdates`   | bool   | When set to `true`, the script downloads the Linux specific updates to the `downloadFolder`. |
| `logFilePath`            | string | Sets up the diagnostic logs at a given folder. This file can be shared with Microsoft for debugging the script if there are any issues. |
| `downloadMacUpdates`     | bool   | The script downloads the Mac-specific updates to the `downloadFolder`. |
| `downloadPreviewUpdates` | bool   | Downloads the preview version of the updates available for the specific OS. |
| `backupPreviousUpdates`  | bool   | Allows the script to copy the previous update in the `_back` folder, and new updates are downloaded to `downloadFolder`. |

### Execute the offline security intelligence downloader script

To manually execute the downloader script, configure the parameters in the `settings.json` file as per the description in the previous section, and use one of the following commands based on the OS of the mirror server:

- Bash:

  ```bash
  ./xplat_offline_updates_download.sh
  ```

- PowerShell:

  ```powershell
  ./xplat_offline_updates_download.ps1
  ```

> [!NOTE]
> Schedule a [cron job](linux-update-mde-linux.md#to-set-the-cron-job) to execute this script to download the latest security intelligence updates in the mirror server at regular intervals.

### Host the offline security intelligence updates on the mirror server

Once the script is executed, the latest signatures get downloaded to the folder configured in the `settings.json` file (`updates.zip`).

Once the signatures zip is downloaded, the mirror server can be used to host it. The mirror server can be hosted using any of the HTTP/HTTPS/network share servers, or a local/remote mount point.

Once hosted, copy the absolute path of the hosted server (up to and not including the `arch_*` directory).

> [!NOTE]
> For example, if the downloader script is executed with `downloadFolder=/tmp/wdav-update`, and the HTTP server (`www.example.server.com:8000`) is hosting the `/tmp/wdav-update` path, then the corresponding URI is: `www.example.server.com:8000/linux/production/` (verify that within the directory, there are `arch_*` directories).
> 
> You can also use the absolute path of directory (local/remote mount point). For example, if the files are downloaded by the script into a directory `/tmp/wdav-update`, then the corresponding URI is:`/tmp/wdav-update/linux/production`.

Once the mirror server is set up, you need to propagate this URI to the Linux endpoints as the `offlineDefinitionUpdateUrl` in the Managed Configuration as described in the next section.

## Configure the endpoints

Use the following sample `mdatp_managed.json` and update the parameters as per the configuration and copy the file to the location `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`.

```json
{
  "cloudService": {
    "automaticDefinitionUpdateEnabled": true,
    "definitionUpdatesInterval": 1202
  },
  "antivirusEngine": {
    "offlineDefinitionUpdateUrl": "http://172.22.199.67:8000/linux/production/",
    "offlineDefinitionUpdateFallbackToCloud":false,
    "offlineDefinitionUpdate": "enabled"
  },
  "features": {
    "offlineDefinitionUpdateVerifySig": "enabled"
  }
}
```

| Field Name                                | Values               | Comments                                            |
|-------------------------------------------|----------------------|-----------------------------------------------------|
| `automaticDefinitionUpdateEnabled`        | `True`/`False`         | Determines the behavior of Defender for Endpoint attempting to perform updates automatically, is turned on or off respectively. |
| `definitionUpdatesInterval`               | Numeric              | Time of interval between each automatic update of signatures (in seconds). |
| `offlineDefinitionUpdateUrl`              | String               | URL value generated as part of the mirror server setup. This can be either in terms of the remote server URL or a directory (local/remote mount point). See the previous section for information about how to specify this path.|
| `offlineDefinitionUpdate`                 | `enabled`/`disabled`   | When set to `enabled`, the offline security intelligence update feature is enabled, and vice versa. |
| `offlineDefinitionUpdateFallbackToCloud`  | `True`/`False`         | Determine Defender for Endpoint security intelligence update approach when offline mirror server fails to serve the update request. If set to `true`, the update is retried via the Microsoft cloud when offline security intelligence update failed; else, vice versa. |
| `offlineDefinitionUpdateVerifySig`        | `enabled`/`disabled`     | When set to `enabled`, downloaded definitions are verified on the endpoints; else, vice versa. |

> [!NOTE]
> Currently, offline security intelligence updates can be configured on Linux endpoints via managed json only. Integration with Defender for Endpoint security settings management in the Microsoft Defender portal is on the roadmap, but isn't available yet.

### Verify the configuration

To test if the settings are applied correctly on the Linux endpoints, run the following command:

```bash
mdatp health --details definitions
```

A sample output would look like the following code snippet:

```console
user@vm:~$ mdatp health --details definitions
automatic_definition_update_enabled         : true [managed]
definitions_updated                         : Mar 14, 2024 at 12:13:17 PM
definitions_updated_minutes_ago             : 2
definitions_version                         : "1.407.417.0"
definitions_status                          : "up_to_date"
definitions_update_source_uri               : "https://go.microsoft.com/fwlink/?linkid=2144709"
definitions_update_fail_reason              : ""
offline_definition_url_configured           : "http://172.XX.XXX.XX:8000/linux/production/" [managed]
offline_definition_update                   : "enabled" [managed]
offline_definition_update_verify_sig        : "enabled"
offline_definition_update_fallback_to_cloud : false[managed]
```

## Triggering the offline security intelligence updates

### Automatic update

- If the [enforcement level for the antivirus engine](/defender-endpoint/linux-preferences#enforcement-level-for-antivirus-engine) is set to `real_time`, and the fields `automaticDefinitionUpdateEnabled` and `offline_definition_update` in the managed json are set to `true`, then the offline security intelligence updates are triggered automatically at periodic intervals.
- By default, this periodic interval is **8 hours**. But it can be configured by setting the `definitionUpdatesInterval` parameter in the managed json.

### Manual update

- To trigger the offline security intelligence update manually to download the signatures from the mirror server on the Linux endpoints, run the following command:

  ```bash
  mdatp definitions update
  ```

### Check update status

- After triggering offline security intelligence updates by using either the automatic or manual method, verify that the update was successful by running the command: `mdatp health --details --definitions`.

- Verify the following fields:

  ```console
  user@vm:~$ mdatp health --details definitions
  ...
  definitions_status                          : "up_to_date"
  ...
  definitions_update_fail_reason              : ""
  ...
  ```

## Troubleshooting and diagnostics

If updates fail, are stuck, or don't start, follow these steps to troubleshoot:

1. Check the status of offline security intelligence updates by using the following command:

   ```bash
   mdatp health --details definitions
   ```

   Look for information in the `definitions_update_fail_reason` section.

2. Make sure that `offline_definition_update` and `offline_definition_update_verify_sig` are enabled.

3. Make sure that `definitions_update_source_uri` is equal to `offline_definition_url_configured`.

   - `definitions_update_source_uri` is the source from where the signatures were downloaded.
   - `offline_definition_url_configured` is the source from where signatures should be downloaded, the one mentioned in the managed config file.

4. Try performing the connectivity test to check if mirror server is reachable from the host:

   ```bash
   mdatp connectivity test
   ```

5. Try to initiate a manual update using the following command:

   ```bash
   mdatp definitions update
   ```

## See also

- [Linux resources](linux-resources.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure security settings and policies for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
