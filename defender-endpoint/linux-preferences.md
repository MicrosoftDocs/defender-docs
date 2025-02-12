---
title: Set preferences for Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, ardeshmukh
description: Describes how to configure Microsoft Defender for Endpoint on Linux in enterprises.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
ms.date: 01/13/2025
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

# Set preferences for Microsoft Defender for Endpoint on Linux

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to**:

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

> [!IMPORTANT]
> This article contains instructions for how to set preferences for Defender for Endpoint on Linux in enterprise environments. If you are interested in configuring the product on a device from the command-line, see [Resources](linux-resources.md#configure-from-the-command-line).

In enterprise environments, Defender for Endpoint on Linux can be managed through a configuration profile. This profile is deployed from the management tool of your choice. Preferences managed by the enterprise take precedence over the ones set locally on the device. In other words, users in your enterprise aren't able to change preferences that are set through this configuration profile. If exclusions were added through the managed configuration profile, they can only be removed through the managed configuration profile. The command line works for exclusions that were added locally.

This article describes the structure of this profile (including a recommended profile that you can use to get started) and instructions on how to deploy the profile.

## Configuration profile structure

The configuration profile is a `.json` file that consists of entries identified by a key (which denotes the name of the preference), followed by a value, which depends on the nature of the preference. Values can be simple, such as a numerical value, or complex, such as a nested list of preferences.

Typically, you would use a configuration management tool to push a file with the name `mdatp_managed.json` at the location `/etc/opt/microsoft/mdatp/managed/`.

The top level of the configuration profile includes product-wide preferences and entries for subareas of the product, which are explained in more detail in the next sections.

### Antivirus engine preferences

The *antivirusEngine* section of the configuration profile is used to manage the preferences of the antivirus component of the product.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|antivirusEngine|Antivirus Engine|
|**Data type**|Dictionary (nested preference)|Collapsed Section|
|**Comments**|See the following sections for a description of the dictionary contents.|See the following sections for a description of the policy properties.|

#### Enforcement level for antivirus engine

Specifies the enforcement preference of antivirus engine. There are three values for setting enforcement level:

- Real-time (`real_time`): Real-time protection (scan files as they're modified) is enabled.
- On-demand (`on_demand`): Files are scanned only on demand. In this:
  - Real-time protection is turned off.
  - Definition updates occur only when a scan starts, even if `automaticDefinitionUpdateEnabled` is set to `true` in on-demand mode.
- Passive (`passive`): Runs the antivirus engine in passive mode. In this case, all of the following apply:
  - Real-time protection is turned off: Threats are not remediated by Microsoft Defender Antivirus.
  - On-demand scanning is turned on: Still use the scan capabilities on the endpoint.
  - Automatic threat remediation is turned off: No files are moved and your security administrator is expected to take required action.
  - Security intelligence updates are turned on: Alerts are available in the security administrator's tenant.
  - Definition updates occur only when a scan starts, even if `automaticDefinitionUpdateEnabled` is set to `true` in passive mode.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enforcementLevel|Enforcement Level|
|**Data type**|String|Drop down|
|**Possible values**|`real_time`<br>`on_demand`<br>`passive` (default)|Not configured<br>Realtime<br>OnDemand<br>Passive (Default)|

> [!NOTE]
> Available in Defender for Endpoint version `101.10.72` or later. Default is changed from `real_time` to `passive` in Defender for Endpoint version `101.23062.0001` or later.
> It is recommended to also use [scheduled scans](/defender-endpoint/linux-schedule-scan-mde) as per requirement.

#### Enable/disable behavior monitoring [only if RTP is enabled]

> [!IMPORTANT]
> This feature only works when the enforcement level is set to `real-time`.

Determines whether behavior monitoring and blocking capability is enabled on the device or not. 

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|behaviorMonitoring|Enable behavior monitoring|
|**Data type**|String|Drop down|
|**Possible values**|`disabled` (default) <p> `enabled`|Not configured<br>Disabled (Default)<br>Enabled|

> [!NOTE]
> Available in Defender for Endpoint version `101.45.00` or later.


#### Run a scan after definitions are updated

> [!IMPORTANT]
> This feature only works when the enforcement level is set to `real-time`.

Specifies whether to start a process scan after new security intelligence updates are downloaded on the device. Enabling this setting triggers an antivirus scan on the running processes of the device.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|scanAfterDefinitionUpdate|Enable Scanning after definition update|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <p> `false`|Not configured<br>Disabled<br>Enabled (Default)|

> [!NOTE]
> Available in Defender for Endpoint version `101.45.00` or later.

#### Scan archives (on-demand antivirus scans only)

Specifies whether to scan archives during on-demand antivirus scans.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|scanArchives|Enable scanning of archives|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <p>`false`|Not configured<br>Disabled<br>Enabled (Default)|

> [!NOTE]
> Available in Microsoft Defender for Endpoint version `101.45.00` or later.
> Archive files are never scanned during real-time protection. When the files in an archive are extracted, they are scanned. The *scanArchives* option can be used to force the scan of archives only during on-demand scan.

#### Degree of parallelism for on-demand scans

Specifies the degree of parallelism for on-demand scans. This corresponds to the number of threads used to perform the scan and impacts the CPU usage, and the duration of the on-demand scan.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|maximumOnDemandScanThreads|maximum on demand scan threads|
|**Data type**|Integer|Toggle Switch & Integer|
|**Possible values**|2 (default). Allowed values are integers between 1 and 64.|Not Configured (Default toggle off defaults to 2)<br>Configured (toggle on) and integer between 1 and 64.|

> [!NOTE]
> Available in Microsoft Defender for Endpoint version `101.45.00` or later.

#### Exclusion merge policy

Specifies the merge policy for exclusions. It can be a combination of administrator-defined and user-defined exclusions (`merge`) or only administrator-defined exclusions (`admin_only`). Administrator-defined (admin_only) are exclusions that are configured by Defender for Endpoint policy. This setting can be used to restrict local users from defining their own exclusions.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|exclusionsMergePolicy|Exclusions merge|
|**Data type**|String|Drop down|
|**Possible values**|`merge` (default) <p>`admin_only`|Not configured<br>merge (Default)<br>admin_only|

> [!NOTE]
> Available in Defender for Endpoint version `100.83.73` or later.
> Can also configure exclusions under [exclusionSettings](#exclusion-setting-preferences)

#### Scan exclusions

Entities that have been excluded from the scan. Exclusions can be specified by full paths, extensions, or file names.
(Exclusions are specified as an array of items, administrator can specify as many elements as necessary, in any order.)

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|exclusions|Scan exclusions|
|**Data type**|Dictionary (nested preference)|Dynamic Properties List|
|**Comments**|See the following sections for a description of the dictionary contents.|

##### Type of exclusion

Specifies the type of content excluded from the scan.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|$type|Type|
|**Data type**|String|Drop Down|
|**Possible values**|`excludedPath` <p>`excludedFileExtension` <p>`excludedFileName`|Path<br>File extension<br>Process name|

##### Path to excluded content

Used to exclude content from the scan by full file path.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|path|Path|
|**Data type**|String|String|
|**Possible values**|valid paths|valid paths|
|**Comments**|Applicable only if *$type* is *excludedPath*|Accessed in *Edit instance* popup|

##### Path type (file / directory)

Indicates if the *path* property refers to a file or directory.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|isDirectory|Is directory|
|**Data type**|Boolean|Drop down|
|**Possible values**|`false` (default) <p>`true`|Enabled<br>Disabled|
|**Comments**|Applicable only if *$type* is *excludedPath*|Accessed in *Edit instance* popup|

##### File extension excluded from the scan

Used to exclude content from the scan by file extension.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|extension|File extension|
|**Data type**|String|String|
|**Possible values**|valid file extensions|valid file extensions|
|**Comments**|Applicable only if *$type* is *excludedFileExtension*|Accessed in *Configure instance* popup|

##### Process excluded from the scan*

Specifies a process for which all file activity is excluded from scanning. The process can be specified either by its name (for example, `cat`) or full path (for example, `/bin/cat`).

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|name|File name|
|**Data type**|String|String|
|**Possible values**|any string|any string|
|**Comments**|Applicable only if *$type* is *excludedFileName*|Accessed in *Configure instance* popup|

#### Muting non-exec mounts 
 
Specifies the behavior of RTP on mount point marked as noexec. There are two values for setting are:

- Unmuted (`unmute`): The default value, all mount points are scanned as part of RTP.
- Muted (`mute`): Mount points marked as noexec aren't scanned as part of RTP, these mount point can be created for:
  - Database files on Database servers for keeping database files.
  - File server can keep data files mountpoints with noexec option.
  - Backup can keep data files mountpoints with noexec option.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|nonExecMountPolicy|non execute mount mute|
|**Data type**|String|Drop down|
|**Possible values**|`unmute` (default) <p>`mute`|Not configured <br>unmute (Default) <br>mute|

> [!NOTE] 
> Available in Defender for Endpoint version `101.85.27` or later.

#### Unmonitor filesystems

Configure filesystems to be unmonitored/excluded from real-time protection (RTP). The filesystems configured are validated against Microsoft Defender's list of permitted filesystems. Filesystems can only be monitored after successful validation. These configured unmonitored filesystems are still scanned by Quick, Full, and custom scans in Microsoft Defender Antivirus.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|unmonitoredFilesystems|Unmonitored Filesystems|
|**Data type**|Array of strings|Dynamic String List|

> [!NOTE] 
> Configured filesystem will be unmonitored only if it is present in Microsoft's list of permitted unmonitored filesystems.

By default, NFS and Fuse are unmonitored from RTP, Quick, and Full scans. However, they can still be scanned by a custom scan. For example, to remove NFS from the list of unmonitored filesystems list, update the managed config file as shown below. This will automatically add NFS to the list of monitored filesystems for RTP.

```JSON
{
   "antivirusEngine":{
      "unmonitoredFilesystems": ["Fuse"]
  }
}
```
To remove both NFS and Fuse from unmonitored list of filesystems, do the following

```JSON
{
   "antivirusEngine":{
      "unmonitoredFilesystems": []
  }
}
```

> [!NOTE]
> Here's the default list of monitored filesystems for RTP: `btrfs`, `ecryptfs`, `ext2`, `ext3`, `ext4`, `fuseblk`, `jfs`, `overlay`, `ramfs`, `reiserfs`, `tmpfs`, `vfat`, `xfs`.
>
> If any monitored filesystem needs to be added to the list of unmonitored filesystems, then it needs to be evaluated and enabled by Microsoft via cloud config. Following which customers can update managed_mdatp.json to unmonitor that filesystem.



#### Configure file hash computation feature

Enables or disables file hash computation feature. When this feature is enabled, Defender for Endpoint computes hashes for files it scans. Note that enabling this feature might impact device performance. For more details, please refer to: [Create indicators for files](indicator-file.md).

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableFileHashComputation|Enable file hash computation|
|**Data type**|Boolean|Drop down|
|**Possible values**|`false` (default) <p>`true`|Not configured<br>Disabled (default)<br>Enabled|

> [!NOTE] 
> Available in Defender for Endpoint version `101.85.27` or later.

#### Allowed threats

List of threats (identified by their name) that aren't blocked by the product and are instead allowed to run.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|allowedThreats|Allowed threats|
|**Data type**|Array of strings|Dynamic String List|

#### Disallowed threat actions

Restricts the actions that the local user of a device can take when threats are detected. The actions included in this list aren't displayed in the user interface.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|disallowedThreatActions|Disallowed threat actions|
|**Data type**|Array of strings|Dynamic String List|
|**Possible values**|`allow` (restricts users from allowing threats) <p>`restore` (restricts users from restoring threats from the quarantine)|allow (restricts users from allowing threats) <p>restore (restricts users from restoring threats from the quarantine)|

> [!NOTE] 
> Available in Defender for Endpoint version `100.83.73` or later.

#### Threat type settings

The *threatTypeSettings* preference in the antivirus engine is used to control how certain threat types are handled by the product.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|threatTypeSettings|Threat type settings|
|**Data type**|Dictionary (nested preference)|Dynamic Properties List|
|**Comments**|See the following sections for a description of the dictionary contents.|See the following sections for a description of the dynamic properties.

##### Threat type

Type of threat for which the behavior is configured.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|key|Threat type|
|**Data type**|String|Drop down|
|**Possible values**|`potentially_unwanted_application` <p>`archive_bomb`|potentially_unwanted_application <p>archive_bomb|

##### Action to take

Action to take when coming across a threat of the type specified in the preceding section. Can be:

- **Audit**: The device isn't protected against this type of threat, but an entry about the threat is logged. (Default)
- **Block**: The device is protected against this type of threat and you're notified in the security console.
- **Off**: The device isn't protected against this type of threat and nothing is logged.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|value|Action to take|
|**Data type**|String|Drop down|
|**Possible values**|`audit` (default) <p>`block` <p>`off`|audit <p>block <p>off|

#### Threat type settings merge policy

Specifies the merge policy for threat type settings. This can be a combination of administrator-defined and user-defined settings (`merge`) or only administrator-defined settings (`admin_only`). Administrator-defined (admin_only) are threat type settings that are configured by Defender for Endpoint policy. This setting can be used to restrict local users from defining their own settings for different threat types.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|threatTypeSettingsMergePolicy|Threat type settings merge|
|**Data type**|String|Drop down|
|**Possible values**|merge (default) <p> admin_only|Not configured<br>merge (Default)<br>admin_only|

> [!NOTE] 
> Available in Defender for Endpoint version `100.83.73` or later.

#### Antivirus scan history retention (in days)

Specify the number of days that results are retained in the scan history on the device. Old scan results are removed from the history. Old quarantined files that are also removed from the disk.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|scanResultsRetentionDays|Scan results retention|
|**Data type**|String|Toggle switch and Integer|
|**Possible values**|90 (default). Allowed values are from 1 day to 180 days.|Not configured (toggle off - 90-day default)<br>Configured (toggle on) and allowed value 1 to 180 days.|

> [!NOTE] 
> Available in Defender for Endpoint version `101.04.76` or later.

#### Maximum number of items in the antivirus scan history

Specify the maximum number of entries to keep in the scan history. Entries include all on-demand scans performed in the past and all antivirus detections.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|scanHistoryMaximumItems|Scan history size|
|**Data type**|String|Toggle and Integer|
|**Possible values**|10000 (default). Allowed values are from 5000 items to 15000 items.|Not configured (toggle off - 10000 default)<br>Configured (toggle on) and allowed value from 5000 to 15000 items.|

> [!NOTE] 
> Available in Defender for Endpoint version `101.04.76` or later.

### Exclusion setting preferences

**Exclusion setting preferences are currently in preview**.

> [!NOTE] 
> Global exclusions are currently in public preview, and are available in Defender for Endpoint beginning with version `101.23092.0012` or later in the Insiders Slow and Production rings.

The `exclusionSettings` section of the configuration profile is used to configure various exclusions for Microsoft Defender for Endpoint for Linux.

|Description|JSON Value|
|---|---|
|**Key**|exclusionSettings|
|**Data type**|Dictionary (nested preference)|
|**Comments**|See the following sections for a description of the dictionary contents.|

> [!NOTE] 
> Already configured antivirus exclusions under (`antivirusEngine`) in managed JSON will continue to function as is with no impact. All new [exclusions](linux-exclusions.md) including antivirus exclusions can be added under this completely new section (`exclusionSettings`). This section is outside the (`antivirusEngine`) tag as its dedicated solely for configuring all types of exclusions that will come in future. You can also continue to use (`antivirusEngine`) for configuring antivirus exclusions.

#### Merge policy

Specifies the merge policy for exclusions. It specifies if it can be a combination of administrator-defined and user-defined exclusions (`merge`) or only administrator-defined exclusions (`admin_only`). This setting can be used to restrict local users from defining their own exclusions. It is applicable for exclusions of all scopes.

|Description|JSON Value|
|---|---|
|**Key**|mergePolicy|
|**Data type**|String|
|**Possible values**|merge (default) <p> admin_only|
|**Comments**|Available in Defender for Endpoint version Sept 2023 or higher.|

#### Exclusions

Entities that need to be excluded can be specified by full paths, extensions, or file names. Each exclusion entity, i.e., either full path, extension or file name has an optional scope that can be specified. If not specified, the default value of scope in this section is *global*. (Exclusions are specified as an array of items, administrator can specify as many elements as necessary, in any order.)

|Description|JSON Value|
|---|---|
|**Key**|exclusions|
|**Data type**|Dictionary (nested preference)|
|**Comments**|See the following sections for a description of the dictionary contents.|

##### Type of exclusion

Specifies the type of content excluded from the scan.

|Description|JSON Value|
|---|---|
|**Key**|$type|
|**Data type**|String|
|**Possible values**|excludedPath <p> excludedFileExtension <p> excludedFileName|

##### Scopes of exclusion (optional)

Specifies the set of exclusion scopes of content excluded. Currently supported scopes are `epp` and `global`.

If nothing is specified in for an exclusion under *exclusionSettings* in managed configuration, then `global` is considered as scope.

> [!NOTE] 
> Previously configured antivirus exclusions under (`antivirusEngine`) in managed JSON will continue to function and their scope is considered (`epp`) since they were added as antivirus exclusions. 

|Description|JSON Value|
|---|---|
|**Key**|scopes|
|**Data type**|Set of strings|
|**Possible values**|epp <p> global|

> [!NOTE]
> Previously applied exclusions using (`mdatp_managed.json`) or by CLI will remain unaffected. The scope for those exclusions will be (`epp`) since they were added under (`antivirusEngine`).

##### Path to excluded content

Used to exclude content from the scan by full file path.

|Description|JSON Value|
|---|---|
|**Key**|path|
|**Data type**|String|
|**Possible values**|valid paths|
|**Comments**|Applicable only if *$type* is *excludedPath*.<br> *Wildcard not supported if exclusion has global as a scope.*|

##### Path type (file / directory)

Indicates if the *path* property refers to a file or directory. 

> [!NOTE]
> File path must already exist if adding file exclusion with global scope.

|Description|JSON Value|
|---|---|
|**Key**|isDirectory|
|**Data type**|Boolean|
|**Possible values**|false (default) <p> true|
|**Comments**|Applicable only if *$type* is *excludedPath*.<br> *Wildcard not supported if exclusion has global as a scope.*|

##### File extension excluded from the scan

Used to exclude content from the scan by file extension.

|Description|JSON Value|
|---|---|
|**Key**|extension|
|**Data type**|String|
|**Possible values**|valid file extensions|
|**Comments**|Applicable only if *$type* is *excludedFileExtension*.<br> *Not supported if exclusion has global as a scope.*|

##### Process excluded from the scan*

Specifies a process for which all file activity is excluded from scanning. The process can be specified either by its name (for example, `cat`) or full path (for example, `/bin/cat`).

|Description|JSON Value|
|---|---|
|**Key**|name|
|**Data type**|String|
|**Possible values**|any string|
|**Comments**|Applicable only if *$type* is *excludedFileName*. <br> *Wildcard and process name not supported if exclusion has global as a scope, need to provide full path.*|

#### Advanced scan options

The following settings can be configured to enable certain advanced scanning features. 

> [!IMPORTANT]
> Enabling these features might impact device performance. As such, it is recommended to keep the defaults unless recommended otherwise by Microsoft Support.

##### Configure scanning of file modify permissions events

When this feature is enabled, Defender for Endpoint will scan files when their permissions have been changed to set the execute bit(s).

> [!NOTE]
> This feature is applicable only when the `enableFilePermissionEvents` feature is enabled. For more information, see [Advanced optional features](linux-preferences.md#configure-monitoring-of-file-modify-permissions-events) section below for details.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|scanFileModifyPermissions|Not available|
|**Data type**|Boolean|n/a|
|**Possible values**|false (default) <p> true|n/a|
> [!NOTE] 
> Available in Defender for Endpoint version `101.23062.0010` or later.

##### Configure scanning of file modify ownership events

When this feature is enabled, Defender for Endpoint will scan files for which ownership has changed. 

> [!NOTE]
> This feature is applicable only when the `enableFileOwnershipEvents` feature is enabled. For more information, see [Advanced optional features](linux-preferences.md#configure-monitoring-of-file-modify-ownership-events) section below for details.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|scanFileModifyOwnership|Not available|
|**Data type**|Boolean|n/a|
|**Possible values**|false (default) <p> true|n/a|

> [!NOTE] 
> Available in Defender for Endpoint version `101.23062.0010` or later.

##### Configure scanning of raw socket events

When this feature is enabled, Defender for Endpoint will scan network socket events such as creation of raw sockets / packet sockets, or setting socket option. 

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.
> This feature is applicable only when the `enableRawSocketEvent` feature is enabled. For more information, see [Advanced optional features](linux-preferences.md#configure-monitoring-of-raw-socket-events) section below for details.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|scanNetworkSocketEvent|Not available|
|**Data type**|Boolean|n/a|
|**Possible values**|false (default) <p> true|n/a|

> [!NOTE] 
> Available in Defender for Endpoint version `101.23062.0010` or later.


### Cloud-delivered protection preferences

The *cloudService* entry in the configuration profile is used to configure the cloud-driven protection feature of the product. 

> [!NOTE]
> Cloud-delivered protection is applicable with any Enforcement level settings (real_time, on_demand, passive).

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|cloudService|Cloud delivered protection preferences|
|**Data type**|Dictionary (nested preference)|Collapsed section|
|**Comments**|See the following sections for a description of the dictionary contents.|See the following sections for a description of the policy's settings.|

#### Enable / disable cloud delivered protection

Determines whether cloud-delivered protection is enabled on the device or not. To improve the security of your services, we recommend keeping this feature turned on.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enabled|Enable cloud delivered protection|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <p>`false`|Not configured<br>Disabled<br>Enabled (Default)|

#### Diagnostic collection level

Diagnostic data is used to keep Defender for Endpoint secure and up to date, detect, diagnose and fix problems, and also make product improvements. This setting determines the level of diagnostics sent by the product to Microsoft. For more details, see [Privacy for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-privacy).

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|diagnosticLevel|Diagnostic data collection level|
|**Data type**|String|Drop down|
|**Possible values**|`optional` <p>`required` (default)|Not configured<br>optional (Default)<br>required|

#### Configure cloud block level

This setting determines how aggressive Defender for Endpoint is in blocking and scanning suspicious files. If this setting is on, Defender for Endpoint is more aggressive when identifying suspicious files to block and scan; otherwise, it is less aggressive and therefore blocks and scans with less frequency. 

There are five values for setting cloud block level:

- Normal (`normal`): The default blocking level.
- Moderate (`moderate`): Delivers verdict only for high confidence detections.
- High (`high`): Aggressively blocks unknown files while optimizing for performance (greater chance of blocking non-harmful files).
- High Plus (`high_plus`): Aggressively blocks unknown files and applies additional protection measures (might impact client device performance).
- Zero Tolerance (`zero_tolerance`): Blocks all unknown programs.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|cloudBlockLevel|Configure cloud block level|
|**Data type**|String|Drop down|
|**Possible values**|`normal` (default) <p>`moderate` <p>`high` <p>`high_plus` <p>`zero_tolerance`|Not configured<br>Normal (default) <br>Moderate <br>High <br>High_Plus <br>Zero_Tolerance|

> [!NOTE] 
> Available in Defender for Endpoint version `101.56.62` or later.

#### Enable / disable automatic sample submissions

Determines whether suspicious samples (that are likely to contain threats) are sent to Microsoft. There are three levels for controlling sample submission:

- **None**: no suspicious samples are submitted to Microsoft.
- **Safe**: only suspicious samples that don't contain personally identifiable information (PII) are submitted automatically. This is the default value for this setting.
- **All**: all suspicious samples are submitted to Microsoft.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|automaticSampleSubmissionConsent|Enable automatic sample submissions|
|**Data type**|String|Drop down|
|**Possible values**|`none` <p>`safe` (default) <p>`all`|Not configured<br>None<br>Safe (Default)<br>All|

#### Enable / disable automatic security intelligence updates

Determines whether security intelligence updates are installed automatically:

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|automaticDefinitionUpdateEnabled|Automatic security intelligence updates|
|**Data type**|Boolean|Drop down|
|**Possible values**|`true` (default) <p>`false`|Not configured<br>Disabled<br>Enabled (Default)|

Depending on the enforcement level, the automatic security intelligence updates are installed differently. In RTP mode, updates are installed periodically. In Passive/ On-Demand mode updates are installed before every scan.

### Advanced optional features

The following settings can be configured to enable certain advanced features.

>[!IMPORTANT]
>Enabling these features might impact device performance. It is recommended to keep the defaults unless recommended otherwise by Microsoft Support.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|features|*Not available*|
|**Data type**|Dictionary (nested preference)|*n/a*|
|**Comments**|See the following sections for a description of the dictionary contents.|

#### Module load feature

Determines whether module load events (file open events on shared libraries) are monitored.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|moduleLoad|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.68.80` or later.||

#### Supplementary sensor configurations

The following settings can be used to configure certain advanced supplementary sensor features.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|supplementarySensorConfigurations|*Not available*|
|**Data type**|Dictionary (nested preference)|*n/a*|
|**Comments**|See the following sections for a description of the dictionary contents.|

##### Configure monitoring of file modify permissions events

Determines whether file modify permissions events (`chmod`) are monitored. 

> [!NOTE]
> When this feature is enabled, Defender for Endpoint will monitor changes to the execute bits of files, but not scan these events. For more information, see [Advanced scanning features](linux-preferences.md#configure-scanning-of-file-modify-permissions-events) section for more details.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableFilePermissionEvents|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.23062.0010` or later.|

##### Configure monitoring of file modify ownership events

Determines whether file modify ownership events (`chown`) are monitored.

> [!NOTE]
> When this feature is enabled, Defender for Endpoint will monitor changes to the ownership of files, but not scan these events. For more information, see [Advanced scanning features](linux-preferences.md#configure-scanning-of-file-modify-ownership-events) section for more details.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableFileOwnershipEvents|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.23062.0010` or later.|

##### Configure monitoring of raw socket events

Determines whether network socket events involving creation of raw sockets / packet sockets, or setting socket option, are monitored.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.
> When this feature is enabled, Defender for Endpoint will monitor these network socket events, but not scan these events. For more information, see [Advanced scanning features](linux-preferences.md#configure-scanning-of-raw-socket-events) section above for more details.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableRawSocketEvent|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.23062.0010` or later.|

##### Configure monitoring of boot loader events

Determines whether boot loader events are monitored and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableBootLoaderCalls|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.68.80` or later.|

##### Configure monitoring of ptrace events

Determines whether ptrace events are monitored and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableProcessCalls|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.68.80` or later.|

##### Configure monitoring of pseudofs events

Determines whether pseudofs events are monitored and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enablePseudofsCalls|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.68.80` or later.|

##### Configure monitoring of module load events using eBPF

Determines whether module load events are monitored using eBPF and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableEbpfModuleLoadEvents|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.68.80` or later.|

##### Configure monitoring of open events from specific filesystems using eBPF

Determines whether open events from procfs are monitored by eBPF.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableOtherFsOpenEvents|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.24072.0001` or later.|

##### Configure source enrichment of events using eBPF

Determines whether events are enriched with metadata at source in eBPF.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableEbpfSourceEnrichment|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.24072.0001` or later.|

#### Enable Antivirus Engine Cache

Determines whether metadata of events being scanned by the antivirus engine are cached or not.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enableAntivirusEngineCache|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.24072.0001` or later.|

#### Report AV Suspicious Events to EDR

Determines whether suspicious events from Antivirus are reported to EDR.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|sendLowfiEvents|*Not available*|
|**Data type**|String|*n/a*|
|**Possible values**|disabled (default) <p> enabled|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.23062.0010` or later.|

### Network protection configurations

> [!NOTE]
> This is a preview feature.
> For these to be effective, Network Protection has to be turned on. For more information, see [Turn on network protection for Linux](network-protection-linux.md).

The following settings can be used to configure advanced Network Protection inspection features to control what traffic gets inspected by Network Protection.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|networkProtection|Network protection|
|**Data type**|Dictionary (nested preference)|Collapsed section|
|**Comments**|See the following sections for a description of the dictionary contents.|See the following sections for a description of the policy settings.|

#### Enforcement Level

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|enforcementLevel|Enforcement Level|
|**Data type**|String|Drop down|
|**Possible values**|`disabled` (default) <br>`audit` <br>`block`|Not configured<br>disabled (default)<br>audit<br>block|

#### Configure ICMP inspection

Determines whether ICMP events are monitored and scanned.

> [!NOTE]
> This feature is applicable only when Behavior Monitoring is enabled.

|Description|JSON Value|Defender Portal Value|
|---|---|---|
|**Key**|disableIcmpInspection|*Not available*|
|**Data type**|Boolean|*n/a*|
|**Possible values**|`true` (default) <p>`false`|*n/a*|
|**Comments**|Available in Defender for Endpoint version `101.23062.0010` or later.||

## Recommended configuration profile

To get started, we recommend the following configuration profile for your enterprise to take advantage of all protection features that Defender for Endpoint provides.

The following configuration profile:

- Enables real-time protection (RTP)
- Specifies how the following threat types are handled:
  - **Potentially unwanted applications (PUA)** are blocked
  - **Archive bombs** (file with a high compression rate) are audited to the product logs
- Enables automatic security intelligence updates
- Enables cloud-delivered protection
- Enables automatic sample submission at `safe` level

### Sample profile

```JSON
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

## Full configuration profile example

The following configuration profile contains entries for all settings described in this document and can be used for more advanced scenarios where you want more control over the product.
  
> [!NOTE]
> It is not possible to control all Microsoft Defender for Endpoint communication with only a proxy setting in this JSON.

### Full profile

```JSON
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
      "scanFileModifyPermissions":false,
      "scanFileModifyOwnership":false,
      "scanNetworkSocketEvent":false,
      "offlineDefinitionUpdateUrl": "http://172.22.199.67:8000/linux/production/<EXAMPLE DO NOT USE>",
      "offlineDefintionUpdateFallbackToCloud":false,
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
        "enablePseudofsCalls":"diabled",
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

## Add tag or group ID to the configuration profile

When you run the `mdatp health` command for the first time, the value for the tag and group ID will be blank. To add tag or group ID to the `mdatp_managed.json` file, follow the below steps:
  
1. Open the configuration profile from the path `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`.

2. Go down to the bottom of the file, where the `cloudService` block is located.

3. Add the required tag or group ID as following example at the end of the closing curly bracket for the `cloudService`.

   ```JSON
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
   > Add the comma after the closing curly bracket at the end of the `cloudService` block. Also, make sure that there are two closing curly brackets after adding Tag or Group ID block (please see the above example). At the moment, the only supported key name for tags is `GROUP`.

## Configuration profile validation

The configuration profile must be a valid JSON-formatted file. There are many tools that can be used to verify this. For example, if you have `python` installed on your device:

```bash
python -m json.tool mdatp_managed.json
```

If the JSON is well-formed, the above command outputs it back to the Terminal and returns an exit code of `0`. Otherwise, an error that describes the issue is displayed and the command returns an exit code of `1`.

## Verifying that the mdatp_managed.json file is working as expected

To verify that your `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json` is working properly, you should see "[managed]" next to these settings:

- `cloud_enabled`
- `cloud_automatic_sample_submission_consent`
- `passive_mode_enabled`
- `real_time_protection_enabled`
- `automatic_definition_update_enabled`

> [!NOTE]
> No restart of mdatp daemon is required for changes to _most_ configurations in `mdatp_managed.json` to take effect.
  **Exception:** The following configurations require a daemon restart to take effect:
>
> - `cloud-diagnostic`
> - `log-rotation-parameters`

## Configuration profile deployment

Once you've built the configuration profile for your enterprise, you can deploy it through the management tool that your enterprise is using. Defender for Endpoint on Linux reads the managed configuration from `/etc/opt/microsoft/mdatp/managed/mdatp_managed.json`.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
