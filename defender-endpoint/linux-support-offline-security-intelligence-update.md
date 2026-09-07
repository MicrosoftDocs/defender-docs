---
title: Configure offline security intelligence updates for Microsoft Defender for Endpoint on Linux
description: Learn how to set up offline security intelligence updates in Microsoft Defender for Endpoint on Linux.
ms.service: defender-endpoint
ms.subservice: linux
ms.author: painbar
author: paulinbar
ms.reviewer: gopkr
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: how-to
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Configure offline security intelligence updates for Microsoft Defender for Endpoint on Linux 

[!INCLUDE [Microsoft 365 Defender rebranding](../includes/microsoft-defender.md)]

This article walks you through setting up offline security intelligence updates for Microsoft Defender for Endpoint on Linux. Use this approach to keep antivirus definitions current on Linux devices that have limited or no internet connectivity, by downloading updates to a local mirror server and distributing them across your fleet. Before you begin, review the [Prerequisites](#prerequisites) to ensure your environment meets the requirements.

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

<a name="how-offline-security-intelligence-update-works"></a>
## Process overview

At a high level, the offline update process works as follows:

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

Microsoft hosts an offline security intelligence downloader script on the [microsoft/mdatp-xplat GitHub repository](https://github.com/microsoft/mdatp-xplat).

Perform the following steps to get the downloader script:

#### Option 1: Clone the repo (Preferred)

To clone the repository, perform the following steps:

1. [Install git](https://kinsta.com/knowledgebase/install-git/) on the mirror server.

1. Navigate to the directory where you want to clone the repo.

1. Run the following command: `git clone https://github.com/microsoft/mdatp-xplat.git`

#### Option 2: Download the zipped file

To use the zip package instead of cloning the repository, follow these steps:

1. [Download the zipped file](https://github.com/microsoft/mdatp-xplat/archive/refs/heads/master.zip).

1. Copy the downloaded file to the folder where you want to keep the script.

1. Extract the zipped folder.

1. Schedule a task or a [cron job](linux-update-mde-linux.md#to-set-the-cron-job) to keep the repo/downloaded zip file updated to the latest version at regular intervals.

#### Local directory structure after cloning the repo or downloading the zipped file

Use the following example directory listing to verify that your local copy contains the expected `linux/definition_downloader` structure and scripts:

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
> Go through the `README.md` file for details about how to use the offline update downloader scripts.

The `settings.json` file consists of a few variables that the user can configure to determine the output of the script execution.

| Field Name               | Value  | Description                                            |
|--------------------------|--------|--------------------------------------------------------|
| `downloadFolder`         | string | Maps to the location where the script downloads the files to. |
| `downloadLinuxUpdates`   | bool   | When set to `true`, the script downloads the Linux specific updates to the `downloadFolder`. |
| `logFilePath`            | string | Sets up the diagnostic logs at a given folder. The diagnostic log file can be shared with Microsoft for debugging if there are any issues. |
| `downloadMacUpdates`     | bool   | The script downloads the Mac-specific updates to the `downloadFolder`. |
| `downloadPreviewUpdates` | bool   | Downloads the preview version of the updates available for the specific OS. |
| `backupPreviousUpdates`  | bool   | Allows the script to copy the previous update in the `_back` folder, and new updates are downloaded to `downloadFolder`. |

### Execute the offline security intelligence downloader script

To manually execute the downloader script, configure the parameters in the `settings.json` file as per the description in the previous section, and use one of the following commands based on the OS of the mirror server:

- Bash: Run the following command to fetch the latest offline definition updates into the configured download folder:

  ```bash
  ./xplat_offline_updates_download.sh
  ```

- PowerShell: If your mirror server runs Windows, use the PowerShell downloader script to retrieve the offline definition package:

  ```powershell
  ./xplat_offline_updates_download.ps1
  ```

> [!NOTE]
> Schedule a [cron job](linux-update-mde-linux.md#to-set-the-cron-job) to execute this script to download the latest security intelligence updates in the mirror server at regular intervals.

### Host the offline security intelligence updates on the mirror server

Once the script is executed, the latest signatures get downloaded to the folder configured in the `settings.json` file (`updates.zip`).

Once the signatures zip is downloaded, the mirror server can be used to host it. The mirror server can be hosted using any of the HTTP/HTTPS/network share servers, or a local/remote mount point.

Once the updates are hosted on the mirror server, copy the absolute path of the hosted server (up to and not including the `arch_*` directory).

> [!NOTE]
> For example, if the downloader script is executed with `downloadFolder=/tmp/wdav-update`, and the HTTP server (`www.example.server.com:8000`) is hosting the `/tmp/wdav-update` path, then the corresponding URI is: `www.example.server.com:8000/linux/production/` (verify that within the directory, there are `arch_*` directories).
> 
> You can also use the absolute path of directory (local/remote mount point). For example, if the files are downloaded by the script into a directory `/tmp/wdav-update`, then the corresponding URI is:`/tmp/wdav-update/linux/production`.

Once the mirror server is set up, you need to propagate this URI to the Linux endpoints as the `offlineDefinitionUpdateUrl` in the Managed Configuration as described in [Configure the endpoints](#configure-the-endpoints).

## Configure the endpoints

You can configure the offline security intelligence updates feature in two ways:

- Via **security settings management** in the Defender/Intune portal: Allows centralised management and configuration of the settings for a group of devices.
- Via the **managed JSON file**: Allows for configuration of the settings manually or via third-party management tools like Chef, Ansible, and others.

# [Portal](#tab/portal)

To configure offline security intelligence updates in the Defender portal, follow these steps:

1. In the Defender portal, navigate to **Endpoints** > **Configuration management** > **Endpoint security policies**, and choose **Create new policy**.
1. In the policy creation wizard, select **Linux** as the platform, **Microsoft Defender Antivirus** as the template. and then select **Create policy**.
1. Provide a name and description for the policy, then select **Next**.

In the **Configuration settings** step, you can find the configuration settings for the offline security intelligence updates feature under the **Antivirus engine** and **Cloud delivered protection preferences** sections.

|Setting|Description|
|---|---|
|**Enable offline security intelligence update** |This setting enables the offline security intelligence update feature on the Linux endpoints. When you enable this setting, the following two settings become available. Make sure **Automated security intelligence updates** is also enabled.|
|**Offline security intelligence update fallback to cloud** |If set to `True`, the endpoint will attempt to get signature updates from the Microsoft cloud if it fails to get them from the mirror server.|
|**Offline security intelligence update URL or directory** |This setting specifies the URL or directory path of the mirror server that hosts the security intelligence updates. The URL should be in the format `http://<mirror_server_address>/linux/production/` (if using an HTTP/HTTPS server) or a directory path (if using a network share or local/remote mount point). See [Host the offline security intelligence updates on the mirror server](#host-the-offline-security-intelligence-updates-on-the-mirror-server) for more information.|
|**Security intelligence Update time interval** | By default, the Linux endpoints pull signature updates from the mirror server every 8 hours (28800 seconds). Use this setting if you wish to specify a different interval. Specify the interval in seconds.|

# [Managed JSON](#tab/managed-json)

The `mdatp_managed.json` file is the managed configuration file that Defender for Endpoint on Linux reads at startup to apply policy settings. Use the following sample `mdatp_managed.json`, update the parameters as per your configuration, and copy the file to the location `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`.

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
  }
}
```

| Field Name                                | Values               | Comments                                            |
|-------------------------------------------|----------------------|-----------------------------------------------------|
| `automaticDefinitionUpdateEnabled`        | `True`/`False`         | Determines the behavior of Defender for Endpoint attempting to perform updates automatically, is turned on or off respectively. |
| `definitionUpdatesInterval`               | Numeric              | Time of interval between each automatic update of signatures (in seconds). |
| `offlineDefinitionUpdateUrl`              | String               | URL value generated as part of the mirror server setup. This can be either in terms of the remote server URL or a directory (local/remote mount point). See [Host the offline security intelligence updates on the mirror server](#host-the-offline-security-intelligence-updates-on-the-mirror-server) for information about how to specify this path.|
| `offlineDefinitionUpdate`                 | `enabled`/`disabled`   | When set to `enabled`, the offline security intelligence update feature is enabled, and vice versa. |
| `offlineDefinitionUpdateFallbackToCloud`  | `True`/`False`         | Determine Defender for Endpoint security intelligence update approach when offline mirror server fails to serve the update request. If set to `true`, the update is retried via the Microsoft cloud when offline security intelligence update failed; else, vice versa. |

---

## Engine signature verification

Starting with release `101.26062.0005`, Defender for Endpoint on Linux verifies the antivirus engine's digital signature before loading it. This default-on behavior helps protect your devices against tampered or unsigned engine files.

### What you need to know

- Signature verification is enabled automatically on new installations and upgrades. No separate action is required.
- If an engine file fails signature verification, Defender for Endpoint doesn't load it.
- The `offlineDefinitionUpdateVerifySig` setting is deprecated and no longer has any effect. If your managed configuration uses this setting, no replacement action is required because engine signature verification is enabled by default.

Run the following commands to view the signature verification state:

```bash
mdatp health --details definitions
mdatp health --details features
```

The relevant fields appear in both command outputs:

```console
offline_definition_update_verify_sig : "DEPRECATED"
engine_signature_verification        : "enabled"
```

Values such as the definitions version, timestamps, and update source URI vary by device.

### Verify the configuration

To test if the settings are applied correctly on the Linux endpoints, run the following command:

```bash
mdatp health --details definitions
```

The following example output shows the fields that confirm definitions were updated successfully and the offline update configuration is applied:

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
offline_definition_update_verify_sig        : "DEPRECATED"
engine_signature_verification               : "enabled"
offline_definition_update_fallback_to_cloud : false[managed]
```

## Triggering the offline security intelligence updates

You can trigger offline security intelligence updates automatically or manually.

### Automatic update

Automatic updates occur under the following conditions:

- If the [enforcement level for the antivirus engine](linux-preferences.md#enforcement-level-for-microsoft-defender-antivirus) is set to `real_time`, and the fields `automaticDefinitionUpdateEnabled` and `offline_definition_update` in the `mdatp_managed.json` managed configuration file are set to `true`, then the offline security intelligence updates are triggered automatically at periodic intervals.
- By default, this periodic interval is **8 hours**. But it can be configured by setting the `definitionUpdatesInterval` parameter in the `mdatp_managed.json` file.

### Manual update

To trigger the offline security intelligence update manually to download the signatures from the mirror server on the Linux endpoints, run the following command to force an immediate definition update from the configured source:

  ```bash
  mdatp definitions update
  ```

### Check update status

After triggering an update, use the following checks to confirm success:

1. Verify that the update was successful by running the command: `mdatp health --details --definitions`.

1. Verify the following fields. The following sample output shows the definition health fields that indicate a successful update:

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

1. Check the status of offline security intelligence updates. Use the following command to review the current definition state and update source:

   ```bash
   mdatp health --details definitions
   ```

   Look for information in the `definitions_update_fail_reason` section.

1. Make sure that `offline_definition_update` and `engine_signature_verification` are enabled.

1. Make sure that `definitions_update_source_uri` is equal to `offline_definition_url_configured`.

   - `definitions_update_source_uri` is the source from where the signatures were downloaded.
   - `offline_definition_url_configured` is the source from where signatures should be downloaded, the one mentioned in the managed config file.

1. Run a connectivity test to confirm the endpoint can reach the mirror server and required Defender services:

   ```bash
   mdatp connectivity test
   ```

1. If connectivity succeeds, manually retry the definition update with the following command:

   ```bash
   mdatp definitions update
   ```

<a name="see-also"></a>
## Related content

- [Linux resources](linux-resources.md)
- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
- [Configure security settings and policies for Microsoft Defender for Endpoint on Linux](linux-preferences.md)
