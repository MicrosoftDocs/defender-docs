---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title:       # Add a title for the browser tab
description: # Add a meaningful description for search results
author:      liam-x # GitHub alias
ms.author:   lianx # Microsoft alias
ms.service:  # Add the ms.service or ms.prod value
# ms.prod:   # To use ms.prod, uncomment it and delete ms.service
ms.topic:    # Add the ms.topic value
ms.date:     03/04/2025
---

# Troubleshoot agent health issues

The following table provides information about the values that are returned when you run the `mdatp health` command and their corresponding descriptions.

| Value | Description |
|---|---|
|`app_version` | Displays Microsoft Defender application version.|
|`automatic_definition_update_enabled`|`True` if automatic antivirus definition updates are enabled; otherwise, `false`.|
|`cloud_automatic_sample_submission_consent`|Current sample submission level. <br/><br/>Can have one of the following values: <br/>- **None**: No suspicious samples are submitted to Microsoft.<br/>- **safe**: Only suspicious samples that don't contain personal data are submitted automatically. This value is the default value for this setting.<br/>- **All**: All suspicious samples are submitted to Microsoft.|
|`cloud_diagnostic_enabled`|`True` if optional diagnostic data collection is enabled; otherwise, `false`. <br/><br/>For more information related to Defender for Endpoint and other products and services like Microsoft Defender Antivirus and Windows, see [Microsoft Privacy Statement](https://go.microsoft.com/fwlink/?linkid=827576).|
|`cloud_enabled`|`True` if cloud-delivered protection is enabled; otherwise, `false`.|
|`cloud_pin_certificate_thumbs`| pinned cloud certificate's thumbprints. |
|`conflicting_applications`|List of applications that are possibly conflicting with Microsoft Defender for Endpoint. This list includes, but isn't limited to, other security products and other applications known to cause compatibility issues.|
|`data_loss_prevention_status`|Status of data loss prevention. Can have one of the following values: <br/>- **unknown**<br/>- **unsupported_os**<br/>- **unsupported_os_version**<br/>- **disabled**<br/>- **unhealty**<br/>- **dormant**<br/>- **ready**<br/>- **active**|
|`definitions_status`|Status of antivirus definitions. Can have one of the following values: <br/>- **up_to_date**<br/>- **updating**<br/>- **unavailable**|
|`definitions_updated`|Date and time of last antivirus definition update.|
|`definitions_updated_minutes_ago`|Number of minutes since last antivirus definition update.|
|`definitions_version`|Antivirus definition version.|
|`edr_client_version`|Version of the EDR client running on the device.|
|`device_control_enforcement_level`| Device control activation statue. |
|`edr_configuration_version`|EDR configuration version.|
|`edr_device_tags`|List of tags associated with the device.|
|`edr_early_preview_enabled`|Setting of edr early preview. Can have one of the following values: <br/>- **disabled** <br/>- **enabled**|
|`edr_group_ids`|Group ID that the device is associated with.|
|`edr_machine_id`|Device identifier used in the Microsoft Defender portal.|
|`engine_load_status`|Status of antivirus engine to determine whether it's running. <br/><br/>Can have one of the following values: <br/>- **Engine not loaded** - antivirus engine process is down<br/>- **Engine load succeeded** - antivirus engine process is up and running|
|`engine_version`|Version of the antivirus engine.|
|`healthy`|`True` if the product is healthy; otherwise, `false`.|
|`health_issues`|Lists health issues if any.|
|`licensed`|`True` if the device is onboarded to a tenant; otherwise, `false`.|
|`log_level`|Current log level for the product. <br/><br/>Can have one of the following values: <br/>- **info** <br/>- **debug**|
|`machine_guid`|Unique machine identifier used by the antivirus component.|
|`network_protection_enforcement_level`|Mode of network protection. <br/><br/>Can have one of the following: <br/>- **disabled** - all components associated with network protection are disabled<br/>- **block** - network protection prevents connection to malicious websites<br/>- **audit** - Check how blocks occur|
|`network_protection_status`|Status of the network protection component (macOS only).<br/><br/> Can have one of the following values: <br/>- **starting** - Network protection is starting<br/>- **failed_to_start** - Network protection couldn't be started due to an error<br/>- **started** - Network protection is running on the device<br/>- **restarting** - Network protection is restarting<br/>- **stopping** - Network protection is stopping<br/>- **stopped** - Network protection isn't running|
|`org_id`|Organization that the device is onboarded to. If the device isn't yet onboarded to any organization, it shows as `unavailable`. For more information on onboarding, see [Onboard to Microsoft Defender for Endpoint](onboarding.md).|
|`passive_mode_enabled`|`True` if the antivirus component is set to run in passive mode; otherwise, `false`.|
|`product_expiration`|Date and time when the current product version reaches end of support.|
|`real_time_protection_available`|`True` if the real-time protection component is healthy; otherwise, `false`.|
|`real_time_protection_enabled`|`True` if real-time antivirus protection is enabled; otherwise, `false`.defender is in|
|`real_time_protection_subsystem`|Subsystem used to serve real-time protection. If real-time protection isn't operating as expected, it shows as `unavailable`.|
|`release_ring`|Release ring. For more information, see [Deployment rings](onboarding.md).|
|`tamper_protection`| Status of tamper protection feature. <br/><br/>Can have one of the following values: <br/>- **disabled** - tamper protection is off<br/>- **audit** - tamper protection is monitoring event but does not block them.<br/>- **block** - tamper protection is monitoring events and block them as needed. |
|`troubleshooting_mode`| `True` if defender is in the troubleshooting mode; otherwise, `false`. see [Troubleshooting mode](mac-troubleshoot-mode.md).|


## Component specific health

You can get more detailed health information for different Defender's features with `mdatp health --details <feature>`. For example:

```bash

mdatp health --details permissions

mdatp health --details edr

mdatp health --details definitions

mdatp health --details help

```

You can run `mdatp health --help` on recent versions to list all supported features.


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]


