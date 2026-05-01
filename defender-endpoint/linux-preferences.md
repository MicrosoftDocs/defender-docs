---
title: Configure security settings in Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, ardeshmukh
description: Describes how to configure Microsoft Defender for Endpoint on Linux in enterprises.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.date: 03/17/2026
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: how-to
ms.subservice: linux
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# Configure security settings in Microsoft Defender for Endpoint on Linux

Microsoft Defender for Endpoint on Linux includes antivirus, anti-malware protection, endpoint detection, and response capabilities. This article summarizes important security settings to configure and includes links to other resources.

|Settings|Description|
|---|---|
|1. Configure static proxy discovery.|Configuring a static proxy helps ensure telemetry is submitted and helps avoid network timeouts. Perform this task during and after your Defender for Endpoint installation. <br/><br/> For more information, see [Configure Microsoft Defender for Endpoint on Linux for static proxy discovery](linux-static-proxy-configuration.md).|
|2. Configure your antivirus scans.|You can use the Microsoft Defender portal (Defender for Endpoint Security Settings Management) or by using either Anacron or Crontab. <br/><br/> For more information, see the following articles: <ul><li>[Defender for Endpoint Security Settings Management](#defender-for-endpoint-security-settings-management)<ul><li>[Use Anacron to schedule an antivirus scan in Microsoft Defender for Endpoint on Linux](schedule-antivirus-scan-anacron.md)</li><li>[Use Crontab to schedule an antivirus scan in Microsoft Defender for Endpoint on Linux](schedule-antivirus-scan-crontab.md)</li></ul>|
|3. Configure your security settings and policies.|You can use the Microsoft Defender portal (Defender for Endpoint Security Settings Management) or a configuration profile (`.json` file) to configure Defender for Endpoint on Linux. Or, you can use command line to configure certain settings. <br/><br/> For more information, see the following articles: <ul><li>[Defender for Endpoint Security Settings Management](#defender-for-endpoint-security-settings-management)</li><li> [Configuration profile](#configuration-profile)</li><li>[Command line](linux-resources.md#configure-from-the-command-line)</li></ul>|
|4. Configure and validate exclusions (as appropriate)|You can exclude certain files, folders, processes, and process-opened files from Defender for Endpoint on Linux. Global exclusions apply to real-time protection (RTP), behavior monitoring (BM), and endpoint detection and response (EDR), thus stopping all associated antivirus detections, EDR alerts, and visibility for the excluded item. <br/><br/> For more information, see [Configure and validate exclusions for Microsoft Defender for Endpoint on Linux](linux-exclusions.md).|
|5. Configure the eBPF-based sensor.|The extended Berkeley Packet Filter (eBPF) for Microsoft Defender for Endpoint on Linux is automatically enabled for all customers by default for agent versions `101.23082.0006` and later. It provides supplementary event data for Linux operating systems and helps reduce the possibility of conflicts between applications. <br/><br/> For more information, see [Use eBPF-based sensor for Microsoft Defender for Endpoint on Linux](linux-support-ebpf.md).|
|6. Configure Offline Security Intelligence Update (as appropriate)|Offline Security Intelligence Update enables you to configure security intelligence updates for Linux servers with limited or no exposure to the internet. You can set up a local hosting server ("mirror server") that can connect to the Microsoft cloud to download the signatures. Other Linux endpoints can pull the updates from your mirror server at a predefined interval. <br/><br/> For more information, see [Configure offline security intelligence update for Microsoft Defender for Endpoint on Linux](linux-support-offline-security-intelligence-update.md).|
|7. Deploy updates.|Microsoft regularly publishes software updates to improve performance, security, and to deliver new features. <br/><br/> For more information, see [Deploy updates for Microsoft Defender for Endpoint on Linux](linux-updates.md).|
|8. Configure network protection (Preview)|Network protection helps prevent users from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the internet. <br/><br/> For more information, see [Network protection for Linux](network-protection-linux.md).|

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

## Options for configuring security settings

To configure your security settings in Defender for Endpoint on Linux, you have two main options:

- Use the Microsoft Defender portal (Defender for Endpoint Security Settings Management)

  or

- Use a configuration profile

You can use the command line to configure specific settings, gather diagnostics, run scans, and more. For more information, see [Linux resources: Configure using command line](linux-resources.md#configure-from-the-command-line).

### Defender for Endpoint Security Settings Management

You can configure Defender for Endpoint on Linux in the Microsoft Defender portal at ([https://security.microsoft.com](https://security.microsoft.com)) using Defender for Endpoint Security Settings Management. For more information, including how to create, edit, and verify security policies, see <a href="/intune/intune-service/protect/mde-security-integration" target="_blank" rel="noopener noreferrer">Use Microsoft Defender for Endpoint Security Settings Management to manage Microsoft Defender Antivirus</a>.

### Configuration profile

You can configure settings in Defender for Endpoint on Linux through a configuration profile that uses a `.json` file. After you set up your profile, you can deploy it by using your management tool of choice. Preferences managed by the enterprise take precedence over preferences set locally on the device.

In other words, users in your enterprise aren't able to change preferences that are set through this configuration profile. If exclusions were added through the managed configuration profile, they can only be removed through the managed configuration profile. The command line works for exclusions added locally.

This article describes the structure of this profile (including a recommended profile you can use to get started) and instructions on how to deploy the profile.

#### Configuration profile structure

The configuration profile is a `.json` file that consists of entries identified by a key (which denotes the name of the preference), followed by a value, which depends on the nature of the preference. Values can be simple (for example, a numerical value) or complex (for example, a nested list of preferences).

Typically, you use a configuration management tool to push a file named `mdatp_managed.json` to the location `/etc/opt/microsoft/mdatp/managed/`.

The top level of the configuration profile includes product-wide preferences and entries for subareas of the product, which are explained in more detail in the next sections.

#### Recommended configuration profile

This section includes two configuration profile examples:

- **Sample profile** to help you get started with recommended settings.
- **Full configuration profile example** for organizations who want more granular control over security settings.

To get started, we recommend using the first sample profile for your organization. For more granular control, you can use the [full configuration profile example](#full-configuration-profile-example) instead.

##### Sample profile

The following configuration profile helps you take advantage of important protection features in Defender for Endpoint on Linux. The profile includes the following configuration:

- Enable real-time protection (RTP).
- Specify how the following threat types are handled:
  - Potentially unwanted applications (PUA) are blocked.
  - Archive bombs (file with a high compression rate) are audited to the product logs.
- Enable automatic security intelligence updates.
- Enable cloud-delivered protection.
- Enable automatic sample submission at `safe` level.

```json
{
   "antivirusEngine":{
      "enforcementLevel":"real_time",
      "threatTypeSettings":[
         {
            "key":"potentially_unwanted_application",
            "value":"block"
         },
         {
            "key":"archive_bomb",
            "value":"audit"
         }
      ]
   },
   "cloudService":{
      "automaticDefinitionUpdateEnabled":true,
      "automaticSampleSubmissionConsent":"safe",
      "enabled":true,
      "proxy": "<EXAMPLE DO NOT USE> http://proxy.server:port/"
   }
}
```

##### Full configuration profile example

The following configuration profile contains entries for all settings described in this article and can be used for more advanced scenarios where you want more control.

```json
{
"antivirusEngine":{
      "enforcementLevel":"passive",
      "behaviorMonitoring": "disabled",
      "scanAfterDefinitionUpdate":true,
      "scanArchives":true,
      "scanHistoryMaximumItems": 10000,
      "scanResultsRetentionDays": 90,
      "maximumOnDemandScanThreads":2,
      "exclusionsMergePolicy":"merge",
      "allowedThreats":[
         "<EXAMPLE DO NOT USE>EICAR-Test-File (not a virus)"
      ],
      "disallowedThreatActions":[
         "allow",
         "restore"
      ],
      "nonExecMountPolicy":"unmute",
      "unmonitoredFilesystems": ["nfs,fuse"],
      "enableFileHashComputation": false,
      "threatTypeSettingsMergePolicy":"merge",
      "threatTypeSettings":[
         {
            "key":"potentially_unwanted_application",
            "value":"block"
         },
         {
            "key":"archive_bomb",
            "value":"audit"
         }
      ],
      "scanFileModifyPermissions":true,
      "scanFileModifyOwnership":false,
      "scanNetworkSocketEvent":false,
      "offlineDefinitionUpdateUrl": "http://172.22.199.67:8000/linux/production/<EXAMPLE DO NOT USE>",
      "offlineDefinitionUpdateFallbackToCloud":false,
      "offlineDefinitionUpdate":"disabled"
   },
   "cloudService":{
      "enabled":true,
      "diagnosticLevel":"optional",
      "automaticSampleSubmissionConsent":"safe",
      "automaticDefinitionUpdateEnabled":true,
      "proxy": "<EXAMPLE DO NOT USE> http://proxy.server:port/",
      "definitionUpdatesInterval":28800
   },
   "features":{
      "moduleLoad":"disabled",
      "supplementarySensorConfigurations":{
        "enableFilePermissionEvents":"disabled",
        "enableFileOwnershipEvents":"disabled",
        "enableRawSocketEvent":"disabled",
        "enableBootLoaderCalls":"disabled",
        "enableProcessCalls":"disabled",
        "enablePseudofsCalls":"disabled",
        "enableEbpfModuleLoadEvents":"disabled",
        "sendLowfiEvents":"disabled"
      },
      "ebpfSupplementaryEventProvider":"enabled",
      "offlineDefinitionUpdateVerifySig": "disabled"
   },
   "networkProtection":{
      "enforcementLevel":"disabled",
      "disableIcmpInspection":true
   },
   "edr":{
      "groupIds":"GroupIdExample",
      "tags": [
         {
         "key": "GROUP",
         "value": "Tag"
         }
       ]
   },
"exclusionSettings":{
  "exclusions":[
     {
        "$type":"excludedPath",
        "isDirectory":true,
        "path":"/home/*/git<EXAMPLE DO NOT USE>",
        "scopes": [
              "epp"
        ]
     },
     {
        "$type":"excludedPath",
        "isDirectory":true,
        "path":"/run<EXAMPLE DO NOT USE>",
        "scopes": [
              "global"
        ]
     },
     {
        "$type":"excludedPath",
        "isDirectory":false,
        "path":"/var/log/system.log<EXAMPLE DO NOT USE><EXCLUDED IN ALL SCENARIOS>",
        "scopes": [
              "epp", "global"
        ]
     },
     {
        "$type":"excludedFileExtension",
        "extension":".pdf<EXAMPLE DO NOT USE>",
        "scopes": [
              "epp"
        ]
     },
     {
        "$type":"excludedFileName",
        "name":"/bin/cat<EXAMPLE DO NOT USE><NO SCOPE PROVIDED - GLOBAL CONSIDERED>"
     }
  ],
  "mergePolicy":"admin_only"
}
}
```

## Antivirus, antimalware, and EDR settings in Defender for Endpoint on Linux

Whether you use a configuration profile (.json file) or the Microsoft Defender portal (Security Settings Management), you can configure your antivirus, antimalware, and EDR settings in Defender for Endpoint on Linux. The following sections describe where and how to configure your settings.

### Antivirus engine preferences

The *antivirusEngine* section of the configuration profile manages the preferences of the antivirus component of the product.

|Description|JSON Value|Defender portal value|
|---|---|---|
|**Key**|`antivirusEngine`|Antivirus Engine|
|**Data type**|Dictionary (nested preference)|Collapsed Section|

See the following subsections for a description of the dictionary contents and policy properties.

#### Enforcement level for Microsoft Defender Antivirus

Specifies the enforcement preference of antivirus engine. There are three values for setting enforcement level:

- **Real-time** (`real_time`): Real-time protection (scan files as they're modified) is enabled.

- **On-demand** (`on_demand`): Files are scanned only on demand:
  - Real-time protection is off.
  - Definition updates occur only when a scan starts, even if `automaticDefinitionUpdateEnabled` is set to `true` in on-demand mode.

- **Passive** (`passive`): Runs the antivirus engine in passive mode:
  - Real-time protection is off. Microsoft Defender Antivirus doesn't remediate threats.
  - On-demand scanning is on. Scan capabilities are still available on the device.
  - Automatic threat remediation is off. No files are moved and your security administrator is expected to take required action.
  - Security intelligence updates are on. Alerts are available in the security administrator's organization.
  - Definition updates occur only when a scan starts, even if `automaticDefinitionUpdateEnabled` is set to `true`.
  - [Endpoint detection and response (EDR)](overview-endpoint-detection-response.md) is on. The output of the `mdatp health` command on the device shows `engine not loaded` for the `engine_load_version` property. The engine is related to antivirus, not EDR.

> [!NOTE]
>
> - Available in Defender for Endpoint version `101.10.72` or later.
> - In version `101.23062.0001` or later, the default value is `passive`. In previous versions, the default was `real_time`.
> - We also recommended using [scheduled scans](schedule-antivirus-scan-crontab.md) as per requirement.

#### Enable or disable behavior monitoring (if RTP is enabled)

> [!IMPORTANT]
> This feature works only when the enforcement level is `real-time`.

Specifies whether behavior monitoring and blocking capability is enabled or disabled on the device.

|Description|JSON Value|Defender portal value|
|---|---|---|
|**Key**|behaviorMonitoring|Enable behavior monitoring|
|**Data type**|String|Drop down|
|**Possible values**|`disabled` (default) <br/> `enabled`|Not configured<br/>Disabled (Default)<br/>Enabled|

> [!NOTE]
> Available in Defender for Endpoint version `101.45.00` or later.

#### Run a scan after definitions are updated

> [!IMPORTANT]
> This feature works only when the enforcement level is set to `real-time`.

Specifies whether to start a process scan after new security intelligence updates are downloaded on the device. Enabling this setting triggers an antivirus scan on the running processes of the device.

|Description|JSON Value|Defender portal value|
|---|---|---|
|**Key**|`scanAfterDefinitionUpdate`|Enable Scanning after definition update|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <br/> `false`|`Not configured`<br/>`Disabled`<br/>`Enabled` (Default)|

> [!NOTE]
> Available in Defender for Endpoint version `101.45.00` or later.

#### Scan archives (on-demand antivirus scans only)

Specifies whether to scan archives during **on-demand antivirus scans**.

|Description|JSON Value|Defender portal value|
|---|---|---|
|**Key**|`scanArchives`|Enable scanning of archives|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <br/>`false`|Not configured<br/>Disabled<br/>Enabled (Default)|

> [!NOTE]
>
> - Available in Microsoft Defender for Endpoint version `101.45.00` or later.
> - Archive files are never scanned during RTP. Files in the archive are scanned after you extract them. The *scanArchives* option forces archive scanning during on-demand scans only.

#### Degree of parallelism for on-demand scans

Specifies the degree of parallelism for on-demand scans. This setting corresponds to the number of processor threads used by the scan. This setting affects CPU usage and the duration of on-demand scans.

|Description|JSON Value|Defender portal value|
|---|---|---|
|**Key**|`maximumOnDemandScanThreads`|maximum on demand scan threads|
|**Data type**|Integer|Toggle Switch & Integer|
|**Possible values**|`2` (default). Allowed values are integers between `1` and `64`.|`Not Configured` (Default toggle off defaults to `2`)<br/>`Configured` (toggle on) and integer between `1` and `64`.|

> [!NOTE]
> Available in Microsoft Defender for Endpoint version `101.45.00` or later.

#### Exclusion merge policy

> [!NOTE]
> We recommend configuring exclusions and the merge policy in [exclusionSettings](#exclusion-setting-preferences). This approach allows you to configure `epp` and `global` scope exclusions with a single `mergePolicy`. The settings in this section apply only to `epp` exclusions **unless** the merge policy in `exclusionSettings` is `admin_only`.

Specifies whether to use user-defined exclusions on the device. Valid values are:

- `admin_only`: Use only admin-defined exclusions configured by Defender for Endpoint policy. Use this value to prevent users from defining their own exclusions.
- `merge`: Use a combination of admin-defined and user-defined exclusions.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`exclusionsMergePolicy`|Exclusions merge|
|**Data type**|String|Drop down|
|**Possible values**|`merge` (default)<br/>`admin_only`|`Not configured`<br/>`merge` (Default)<br/>`admin_only`|

> [!NOTE]
> Available in Defender for Endpoint version `100.83.73` or later.

### Scan exclusions

Entities excluded from scans. You specify exclusions as an array of items. Admins can specify as many elements as necessary, in any order. You specify exclusions using full paths, extensions, or file names.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`exclusions`|Scan exclusions|
|**Data type**|Dictionary (nested preference)|Dynamic Properties List|

See the following subsections for a description of the dictionary contents.

#### Type of exclusion

Specifies the type of content excluded from scans.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`$type`|Type|
|**Data type**|String|Drop Down|
|**Possible values**|`excludedPath` <br/>`excludedFileExtension` <br/>`excludedFileName`|Path<br/>File extension<br/>Process name|

#### Path to excluded content

Exclude content from the scan by full file path.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|path|Path|
|**Data type**|String|String|
|**Possible values**|valid paths|valid paths|
|**Comments**|Applicable only if `$type` is `excludedPath`|Accessed in *Edit instance* popup|

#### Path type (file / directory)

Specifies whether the *path* property refers to a file or a directory.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`isDirectory`|Is directory|
|**Data type**|Boolean|Drop down|
|**Possible values**|`false` (default) <br/>`true`|`Enabled`<br/>`Disabled`|
|**Comments**|Applicable only if `$type` is `excludedPath`|Accessed in *Edit instance* popup|

#### File extension excluded from the scan

Exclude content from the scan by file extension.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|extension|File extension|
|**Data type**|String|String|
|**Possible values**|valid file extensions|valid file extensions|
|**Comments**|Applicable only if `$type` is `excludedFileExtension`|Accessed in *Configure instance* popup|

#### Process excluded from the scan

Specifies a process for which all file activity is excluded from scanning. You can specify the process by name (for example, `cat`) or full path (for example, `/bin/cat`).

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|name|File name|
|**Data type**|String|String|
|**Possible values**|any string|any string|
|**Comments**|Applicable only if `$type` is `excludedFileName`|Accessed in *Configure instance* popup|

### Muting nonexec mounts

Specifies the behavior of RTP on mount points marked as `noexec`. Valid values are:

- **Unmuted** (`unmute`): All mount points are scanned as part of RTP. This value is the default.
- **Muted** (`mute`): Mount points marked as `noexec` aren't scanned as part of RTP.
  - Database servers can keep database file.
  - File servers can keep data file mount points.
  - Backup can keep data file mount points.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`nonExecMountPolicy`|`non execute mount mute`|
|**Data type**|String|Drop down|
|**Possible values**|`unmute` (default) <br/>`mute`|`Not configured` <br/>`unmute` (Default) <br/>`mute`|

> [!NOTE]
> Available in Defender for Endpoint version `101.85.27` or later.

### Unmonitor filesystems

Specifies the filesystems that aren't monitored by (are excluded from) RTP. The specified filesystems are still scanned by Quick, Full, and custom scans in Microsoft Defender Antivirus.

When you add or remove a filesystem from the unmonitored list, Microsoft validates the eligibility of the filesystem for monitoring by RTP (removed from the list) or no monitoring by RTP (added to the list).

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`unmonitoredFilesystems`|Unmonitored Filesystems|
|**Data type**|Array of strings|Dynamic String List|

- By default, the following filesystems are monitored by RTP:
  - `btrfs`
  - `ecryptfs`
  - `ext2`
  - `ext3`
  - `ext4`
  - `fuseblk`
  - `jfs`
  - `overlay`
  - `ramfs`
  - `reiserfs`
  - `tmpfs`
  - `vfat`
  - `xfs`
- By default, the following filesystems are unmonitored by RTP:
  - `cifs`<sup>\*</sup>
  - `fuse`
  - `nfs`
  - `nfs4`<sup>\*</sup>
  - `smb`<sup>\*</sup>

  These filesystems are also unmonitored by Quick and Full scans, but are scannable by custom scans.

  <sup>\*</sup> Currently, RTP monitoring of this filesystem is in Preview.

For example, to remove `nfs` and `nfs4` from the list of unmonitored filesystems (which means `nfs` and `nfs4` are monitored by RTP after validation), update the managed config file with the following entry:

```json
{
   "antivirusEngine":{
      "unmonitoredFilesystems": ["cifs","fuse","smb"]
  }
}
```

To remove all entries from the list of unmonitored filesystems, use the following entry:

```json
{
   "antivirusEngine":{
      "unmonitoredFilesystems": []
  }
}
```

### Configure file hash computation feature

Enables or disables file hash computation for files scanned by Defender for Endpoint. Enabling this feature might affect device performance. For more information, see [Create indicators for files](indicator-file.md).

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableFileHashComputation`|Enable file hash computation|
|**Data type**|Boolean|Drop down|
|**Possible values**|`false` (default) <br/>`true`|`Not configured`<br/>`Disabled` (default)<br/>`Enabled`|

> [!NOTE]
> Available in Defender for Endpoint version `101.85.27` or later.

### Allowed threats

Specifies the names of threats that aren't blocked by Defender for Endpoint. Instead, these threats are allowed to run.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`allowedThreats`|Allowed threats|
|**Data type**|Array of strings|Dynamic String List|

### Disallowed threat actions

Restricts the allowed actions by the device user when threats are detected. The actions included in this list aren't displayed in the user interface.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`disallowedThreatActions`|Disallowed threat actions|
|**Data type**|Array of strings|Dynamic String List|
|**Possible values**|`allow` (restricts users from allowing threats) <br/>`restore` (restricts users from restoring threats from the quarantine)|`allow` (restricts users from allowing threats) <br/>`restore` (restricts users from restoring threats from the quarantine)|

> [!NOTE]
> Available in Defender for Endpoint version `100.83.73` or later.

### Threat type settings

Control how certain threat types are handled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`threatTypeSettings`|Threat type settings|
|**Data type**|Dictionary (nested preference)|Dynamic Properties List|

See the following subsections for a description of the dictionary contents.

#### Threat type

Specifies the type of threat.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|key|Threat type|
|**Data type**|String|Drop down|
|**Possible values**|`potentially_unwanted_application` <br/>`archive_bomb`|potentially_unwanted_application <br/>archive_bomb|

#### Action to take

Specifies the action when the previously specified threats types are detected. Valid values are:

- **Audit**: The device isn't protected against this type of threat, but an entry about the threat is logged. This value is the Default.
- **Block**: The device is protected against this type of threat and you're notified in the Microsoft Defender portal.
- **Off**: The device isn't protected against this type of threat and nothing is logged.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|value|Action to take|
|**Data type**|String|Drop down|
|**Possible values**|`audit` (default) <br/>`block` <br/>`off`|`audit` <br/>`block` <br/>off|

### Threat type settings merge policy

Specifies whether to use user-defined threat type settings on the device. Valid values are:

- `admin_only`: Use only admin-defined threat type settings. Use this value to prevent users from defining their own threat type settings.
- `merge`: Use a combination of admin-defined and user-defined threat type settings.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`threatTypeSettingsMergePolicy`|Threat type settings merge|
|**Data type**|String|Drop down|
|**Possible values**|`merge` (default) <br/>`admin_only`|`Not configured`<br/>`merge` (Default)<br/>`admin_only`|

> [!NOTE]
> Available in Defender for Endpoint version `100.83.73` or later.

### Antivirus scan history retention (in days)

Specify the number of days that results are retained in the scan history on the device. Old scan results are removed from the history. Old quarantined files are also removed from the disk.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`scanResultsRetentionDays`|Scan results retention|
|**Data type**|String|Toggle switch and Integer|
|**Possible values**|`90` (default). Valid values are 1 to 180 days.|`Not configured` (toggle off; 90-day default) <br/><br/> `Configured` (toggle on) and allowed value 1 to 180 days.|

> [!NOTE]
> Available in Defender for Endpoint version `101.04.76` or later.

### Maximum number of items in the antivirus scan history

Specify the maximum number of entries to keep in the scan history. Entries include all on-demand scans and all antivirus detections.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`scanHistoryMaximumItems`|Scan history size|
|**Data type**|String|Toggle and Integer|
|**Possible values**|`10000` (default). Allowed values are from `5000` items to `15000` items.|Not configured (toggle off - 10000 default)<br/>`Configured` (toggle on) and allowed value from 5000 to 15000 items.|

> [!NOTE]
> Available in Defender for Endpoint version `101.04.76` or later.

### Exclusion setting preferences

> [!NOTE]
> Global exclusions are available in Defender for Endpoint version `101.24092.0001` or later.

The `exclusionSettings` section of the configuration profile configures various exclusions for Microsoft Defender for Endpoint for Linux.

|Description|JSON Value|
|---|---|
|**Key**|`exclusionSettings`|
|**Data type**|Dictionary (nested preference)|

See the following sections for a description of the dictionary contents.|

> [!NOTE]
>
> - Previously configured antivirus exclusions in the [antivirusEngine](#antivirus-engine-preferences) section in managed JSON continue to function.
> - You can specify antivirus exclusions in this section or in the `antivirusEngine`) section. You should add all other exclusion type in this section, because the `exclusionSettings` section is designed to centrally host all exclusion types.

### Merge policy

### Exclusion merge policy

Specifies whether to use user-defined exclusions on the device. Valid values are:

- `admin_only`: Use only admin-defined exclusions configured by Defender for Endpoint policy. Use this value to prevent users from defining their own exclusions.
- `merge`: Use a combination of admin-defined and user-defined exclusions.

This setting applies to exclusions of all scopes.

|Description|JSON Value|
|---|---|
|**Key**|`mergePolicy`|
|**Data type**|String|
|**Possible values**|`merge` (default) <br/> `admin_only`|

> [!NOTE]
> Available in Defender for Endpoint version Sept 2023 or later.

### Exclusions

Entities excluded from scans. You specify exclusions as an array of items. Admins can specify as many elements as necessary, in any order. You specify exclusions using full paths, extensions, or file names. For each exclusion, you can specify a scope. The default scope is *global*.

|Description|JSON Value|
|---|---|
|**Key**|`exclusions`|
|**Data type**|Dictionary (nested preference)|

See the following subsections for a description of the dictionary contents.

#### Type of exclusion

Specifies the type of content excluded from scans.

|Description|JSON Value|
|---|---|
|**Key**|`$type`|
|**Data type**|String|
|**Possible values**|`excludedPath`<br/> `excludedFileExtension` <br/>`excludedFileName`|

#### Scope of exclusion (optional)

Specifies the exclusion scope of excluded content. Valid values are:

- `epp`
- `global`

If you don't specify an exclusion scope in managed configuration, the value `global` is used.

> [!NOTE]
> Previously configured antivirus exclusions under `antivirusEngine` in managed JSON continue to function with the scope `epp` because they were in the `antivirusEngine` section.

|Description|JSON Value|
|---|---|
|**Key**|scopes|
|**Data type**|Set of strings|
|**Possible values**|`epp` <br/>`global`|

> [!NOTE]
> Previously applied exclusions using (`mdatp_managed.json`) or by CLI are unaffected. The scope for these exclusions is `epp` because they were in the `antivirusEngine` section.

#### Path to excluded content

Exclude content from scans by full file path.

|Description|JSON Value|
|---|---|
|**Key**|path|
|**Data type**|String|
|**Possible values**|valid paths|
|**Comments**|Applicable only if *$type* is *excludedPath*.<br/> *Wildcards aren't supported if the exclusion has a global scope.*|

#### Path type (file / directory)

Specifies whether the *path* property refers to a file or a directory.

> [!NOTE]
> The File path must already exist if you add a file exclusion with `global` scope.

|Description|JSON Value|
|---|---|
|**Key**|`isDirectory`|
|**Data type**|Boolean|
|**Possible values**|`false` (default) <br/> `true`|
|**Comments**|Applicable only if *$type* is *excludedPath*.<br/> *Wildcards aren't supported if the exclusion has a global scope.*|

#### File extension excluded from the scan

Exclude content from scans by file extension.

|Description|JSON Value|
|---|---|
|**Key**|extension|
|**Data type**|String|
|**Possible values**|valid file extensions|
|**Comments**|Applicable only if *$type* is *excludedFileExtension*.<br/> *Not supported if the exclusion has a global scope.*|

#### Process excluded from the scan

Exclude all file activity by a process from scans. Valid values are:

- Process name. For example, `cat`.
- Full path. For example, `/bin/cat`.

|Description|JSON Value|
|---|---|
|**Key**|name|
|**Data type**|String|
|**Possible values**|any string|
|**Comments**|Applicable only if *$type* is *excludedFileName*. <br/> *Wildcards and process names aren't supported if the exclusion has a global scope. <br/> You need to provide the full path.*|

### Advanced scan options

You can configure the following settings to enable certain advanced scanning features.

> [!IMPORTANT]
> Enabling these features might affect device performance. We recommended the default values unless recommended otherwise by Microsoft Support.

#### Configure scanning of file modify permissions events

Specifies whether Defender for Endpoint scans files when their permissions changed to set the executed bits.

> [!NOTE]
> This setting is meaningful only when `enableFilePermissionEvents` is enabled. For more information, see the [Advanced optional features](#configure-monitoring-of-file-modify-permissions-events) section later in this article.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`scanFileModifyPermissions`|Not available|
|**Data type**|Boolean|n/a|
|**Possible values**|`false` (default) <br/> `true`|n/a|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.

#### Configure scanning of file modify ownership events

Specifies whether Defender for Endpoint scans files with changed ownership.

> [!NOTE]
> This setting is meaningful only when `enableFileOwnershipEvents` is enabled. For more information, see the [Advanced optional features](#configure-monitoring-of-file-modify-ownership-events) section later in this article.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`scanFileModifyOwnership`|Not available|
|**Data type**|Boolean|n/a|
|**Possible values**|`false` (default) <br/> `true`|n/a|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.

#### Configure scanning of raw socket events

Specifies whether Defender for Endpoint scans network socket events. For example:

- Creating raw sockets / packet sockets.
- Setting socket options.

> [!NOTE]
>
> - This setting is meaningful only when Behavior Monitoring is enabled.
> - This setting is meaningful only when `enableRawSocketEvent` is enabled. For more information, see the [Advanced optional features](#configure-monitoring-of-raw-socket-events) section later in this article.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`scanNetworkSocketEvent`|Not available|
|**Data type**|Boolean|n/a|
|**Possible values**|`false` (default) <br/> `true`|n/a|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.

### Cloud-delivered protection preferences

The *cloudService* entry in the configuration profile configures the cloud-driven protection feature.

> [!NOTE]
> Cloud-delivered protection is applicable with any Enforcement level settings (`real_time`, `on_demand`, or `passive`).

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`cloudService`|Cloud delivered protection preferences|
|**Data type**|Dictionary (nested preference)|Collapsed section|

See the following subsections for a description of the dictionary contents and policy settings.

### Enable or disable cloud delivered protection

Specify whether cloud-delivered protection is enabled on the device. To improve the security, we recommend keeping this feature turned on.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enabled`|Enable cloud delivered protection|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <br/>`false`|Not configured<br/>Disabled<br/>Enabled (Default)|

### Diagnostic collection level

Specify the level of diagnostic information sent to Microsoft. For more information, see [Privacy for Microsoft Defender for Endpoint on Linux](linux-privacy.md).

Diagnostic data is used to keep Defender for Endpoint secure and up to date, detect, diagnose and fix problems, and also make product improvements.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`diagnosticLevel`|Diagnostic data collection level|
|**Data type**|String|Drop down|
|**Possible values**|`optional` <br/>`required` (default)|`Not configured`<br/>`optional` (Default)<br/>`required`|

### Configure cloud block level

Specify the aggressiveness of Defender for Endpoint in blocking and scanning suspicious files. Valid values are:

- **Normal** (`normal`): The value is the default.
- **Moderate** (`moderate`): Deliver verdicts only for high confidence detections.
- **High** (`high`): Aggressively block unknown files while optimizing for performance. This value has greater chance of blocking unharmful files.
- **High Plus** (`high_plus`): Aggressively block unknown files and apply extra protection measures. This value might affect client device performance.
- **Zero Tolerance** (`zero_tolerance`): Block all unknown programs.

If this setting is on, Defender for Endpoint is more aggressive when identifying suspicious files to block and scan. Otherwise, it's less aggressive and therefore blocks and scans with less frequency.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`cloudBlockLevel`|Configure cloud block level|
|**Data type**|String|Drop down|
|**Possible values**|`normal` (default) <br/>`moderate` <br/>`high` <br/>`high_plus` <br/>`zero_tolerance`|`Not configured`<br/>`Normal` (default) <br/>`Moderate` <br/>`High` <br/>`High_Plus` <br/>`Zero_Tolerance`|

> [!NOTE]
> Available in Defender for Endpoint version `101.56.62` or later.

### Enable or disable automatic sample submissions

Specifies whether suspicious samples (likely to contain threats) are sent to Microsoft. Valid values are:

- **None**: No suspicious samples are submitted to Microsoft.
- **Safe**: Only suspicious samples that don't contain personal information are automatically submitted. This value is the default.
- **All**: All suspicious samples are submitted to Microsoft.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`automaticSampleSubmissionConsent`|Enable automatic sample submissions|
|**Data type**|String|Drop down|
|**Possible values**|`none` <br/>`safe` (default) <br/>`all`|`Not configured`<br/>`None`<br/>`Safe` (Default)<br/>`All`|

### Enable or disable automatic security intelligence updates

Specifies whether security intelligence updates are installed automatically.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`automaticDefinitionUpdateEnabled`|Automatic security intelligence updates|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <br/>`false`|`Not configured`<br/>`Disabled`<br/>`Enabled` (Default)|

Depending on the enforcement level, the automatic security intelligence updates are installed differently. In RTP mode, updates are installed periodically. In Passive or On-Demand mode, updates are installed before every scan.

### Advanced optional features

Use the following settings to enable certain advanced optional features.

> [!IMPORTANT]
> Enabling these features might affect device performance. We recommend the default values unless recommended otherwise by Microsoft Support.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|features|*Not available*|
|**Data type**|Dictionary (nested preference)|*n/a*|

See the following subsections for a description of the dictionary contents.

### Module load feature

Specifies whether module load events (file open events on shared libraries) are monitored.

> [!NOTE]
> This setting is meaningful only when Behavior Monitoring is enabled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`moduleLoad`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.68.80` or later.

#### Remediate Infected File feature

Specifies whether infected processes that open or load infected files get remediated in RTP mode.

> [!NOTE]
> These processes don't appear in the threat list because they aren't malicious. THe processes are terminated only because they loaded the threat file in memory.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|remediateInfectedFile|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <br/> enabled|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.24122.0001` or later.

### Supplementary sensor configurations

Use the following settings to configure certain advanced supplementary sensor features.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`supplementarySensorConfigurations`|*Not available*|
|**Data type**|Dictionary (nested preference)|*n/a*|

See the following sections for a description of the dictionary contents.

#### Configure monitoring of file modify permissions events

Specifies whether file modify permissions events (`chmod`) are monitored.

> [!NOTE]
> When this feature is enabled, Defender for Endpoint monitors changes to the executed bits of files, but doesn't scan these events. For more information, see the [Advanced scanning features](#configure-scanning-of-file-modify-permissions-events) section.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableFilePermissionEvents`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.

#### Configure monitoring of file modify ownership events

Specifies whether file modify ownership events (`chown`) are monitored.

> [!NOTE]
> When this feature is enabled, Defender for Endpoint monitors changes to the ownership of files, but doesn't scan these events. For more information, see the [Advanced scanning features](#configure-scanning-of-file-modify-ownership-events).

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableFileOwnershipEvents`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.

#### Configure monitoring of raw socket events

Specifies whether network socket events involving creation of raw sockets / packet sockets, or setting socket option, are monitored.

> [!NOTE]
>
> - This feature is applicable only when Behavior Monitoring is enabled.
> - When this feature is enabled, Defender for Endpoint monitors these network socket events, but doesn't scan these events. For more information, see [Advanced scanning features](#configure-scanning-of-raw-socket-events) section.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableRawSocketEvent`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.|

#### Configure monitoring of boot loader events

Specifies whether boot loader events are monitored and scanned.

> [!NOTE]
> This setting is meaningful only when Behavior Monitoring is enabled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableBootLoaderCalls`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.68.80` or later.

#### Configure monitoring of ptrace events

Specifies whether ptrace events are monitored and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableProcessCalls`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.68.80` or later.

#### Configure monitoring of pseudofs events

Specifies whether pseudofs events are monitored and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enablePseudofsCalls`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.68.80` or later.

#### Configure monitoring of module load events using eBPF

Specifies whether module load events are monitored by eBPF and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableEbpfModuleLoadEvents`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.68.80` or later.

#### Configure monitoring of open events from specific filesystems using eBPF

Specifies whether open events from procfs are monitored by eBPF.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableOtherFsOpenEvents`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.24072.0001` or later.

#### Configure source enrichment of events using eBPF

Specifies whether events are enriched with metadata at source in eBPF.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableEbpfSourceEnrichment`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.24072.0001` or later.

#### Enable Antivirus Engine Cache

Specifies whether metadata of events scanned by the antivirus engine are cached.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enableAntivirusEngineCache`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.24072.0001` or later.

#### Report suspicious antivirus events to EDR

Specifies whether suspicious events from Antivirus are reported to EDR.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`sendLowfiEvents`|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|`disabled` (default) <br/> `enabled`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.

### Network protection configurations

> [!NOTE]
>
> - Currently, this feature is in Preview.
> - These settings are meaningful only when Network Protection is on. For more information, see [Turn on network protection for Linux](network-protection-linux.md).

Use the following settings to configure advanced Network Protection inspection features that control traffic inspected by Network Protection.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`networkProtection`|Network protection|
|**Data type**|Dictionary (nested preference)|Collapsed section|

See the following subsections for a description of the dictionary contents.

#### Enforcement Level

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`enforcementLevel`|Enforcement Level|
|**Data type**|String|Drop down|
|**Possible values**|`disabled` (default) <br/>`audit` <br/>`block`|`Not configured`<br/>`disabled` (default)<br/>`audit`<br/>`block`|

#### Configure ICMP inspection

Specifies whether ICMP events are monitored and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Microsoft Defender portal value|
|---|---|---|
|**Key**|`disableIcmpInspection`|*Not available*|
|**Data type**|Boolean|*n/a*|
|**Possible values**|`true` (default) <br/>`false`|*n/a*|

> [!NOTE]
> Available in Defender for Endpoint version `101.23062.0010` or later.

## Add tag or group ID to the configuration profile

When you first run the `mdatp health` command, the tag and group ID values are blank. To add a tag or group ID to the `mdatp_managed.json` file, follow these steps:

1. Open the configuration profile from the path `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`.

1. In the `cloudService` block at the bottom of the file, add the required tag or group ID at the end of the closing curly bracket for the `cloudService` block as shown in the following example.

   ```json
   },
   "cloudService": {
    "enabled": true,
    "diagnosticLevel": "optional",
    "automaticSampleSubmissionConsent": "safe",
    "automaticDefinitionUpdateEnabled": true,
    "proxy": "http://proxy.server:port/"
   },
   "edr": {
   "groupIds":"GroupIdExample",
   "tags": [
            {
            "key": "GROUP",
            "value": "Tag"
            }
          ]
      }
   }
   ```

   > [!NOTE]
   >
   > - Add a comma after the closing curly bracket at the end of the `cloudService` block.
   > - Verify there are two closing curly brackets after you add `tags` or `groupIds` blocks as shown in the example.
   > - Currently, the only supported key name for tags is `GROUP`.

## Configuration profile validation

The configuration profile must be a valid JSON-formatted file. Many tools are available for you to verify the configuration profile. For example, run the following command if you have `python` installed on your device:

```bash
python -m json.tool mdatp_managed.json
```

If the file is formatted correctly, the command returns the exit code `0`. Otherwise, errors are displayed and the command returns the exit code `1`.

## Verifying that the mdatp_managed.json file is working as expected

To verify that your `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json` is working properly, you should see `[managed]` next to these settings:

- `cloud_enabled`
- `cloud_automatic_sample_submission_consent`
- `passive_mode_enabled`
- `real_time_protection_enabled`
- `automatic_definition_update_enabled`

> [!TIP]
> For most configurations in `mdatp_managed.json`, you don't need to restart the mdatp daemon. The following configurations require a daemon restart to take effect:
>
> - `cloud-diagnostic`
> - `log-rotation-parameters`

## Configuration profile deployment

After you create the configuration profile for your organization, you can deploy it using your current management tools. Defender for Endpoint on Linux reads the managed configuration from `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`.
