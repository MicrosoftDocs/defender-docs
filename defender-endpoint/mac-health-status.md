---
title: Troubleshoot agent health issues with Defender for Endpoint on macOS 
description: Investigate macOS Defender agent health issues
author: emmwalshh
ms.author: ewalsh
ms.reviewer: lianx; joshbregman
manager: deniseb
ms.localizationpriority: medium
audience: ITPro
ms.service: defender-endpoint
ms.subservice: macos
ms.topic: troubleshooting-general
ms.date: 06/06/2025
ms.collection: 
- m365-security
- tier3
- mde-macos
search.appverid: met150
---

# Troubleshoot agent health issues

## Defender for Endpoint health status

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
|`data_loss_prevention_status`|Status of data loss prevention. Can have one of the following values: <br/>- **unknown**<br/>- **unsupported_os**<br/>- **unsupported_os_version**<br/>- **disabled**<br/>- **unhealthy**<br/>- **dormant**<br/>- **ready**<br/>- **active**|
|`definitions_status`|Status of antivirus definitions. Can have one of the following values: <br/>- **up_to_date**<br/>- **updating**<br/>- **unavailable**|
|`definitions_updated`|Date and time of last antivirus definition update.|
|`definitions_updated_minutes_ago`|Number of minutes since last antivirus definition update.|
|`definitions_version`|Antivirus definition version.|
|`edr_client_version`|Version of the EDR client running on the device.|
|`device_control_enforcement_level`| Device control activation statue. |
|`edr_configuration_version`|EDR configuration version.|
|`edr_device_tags`|List of tags associated with the device.|
|`edr_early_preview_enabled`|Setting of EDR early preview. Can have one of the following values: <br/>- **disabled** <br/>- **enabled**|
|`edr_group_ids`|Group ID that the device is associated with.|
|`edr_machine_id`|Device identifier used in the Microsoft Defender portal.|
|`engine_load_status`|Status of antivirus engine to determine whether it's running. <br/><br/>Can have one of the following values: <br/>- **Engine not loaded** - antivirus engine process is down<br/>- **Engine load succeeded** - antivirus engine process is up and running|
|`engine_version`|Version of the antivirus engine.|
|`healthy`|`True` if the product is healthy; otherwise, `false`.|
|`health_issues`|Lists health issues if any.|
|`licensed`|`True` if the device is onboarded to a tenant; otherwise, `false`.|
|`log_level`|Current log level for the product. <br/><br/>Can have one of the following values: <br/>- **info** <br/>- **debug**|
|`machine_guid`|Unique machine identifier used by the antivirus component.|
|`network_protection_enforcement_level`|Mode of network protection. <br/><br/>Can have one of the following values: <br/>- **disabled** - all components associated with network protection are disabled<br/>- **block** - network protection prevents connection to malicious websites<br/>- **audit** - Check how blocks occur|
|`network_protection_status`|Status of the network protection component (macOS only).<br/><br/> Can have one of the following values: <br/>- **starting** - Network protection is starting<br/>- **failed_to_start** - Network protection couldn't be started due to an error<br/>- **started** - Network protection is running on the device<br/>- **restarting** - Network protection is restarting<br/>- **stopping** - Network protection is stopping<br/>- **stopped** - Network protection isn't running|
|`org_id`|Organization that the device is onboarded to. If the device isn't yet onboarded to any organization, it shows as `unavailable`. For more information on onboarding, see [Onboard to Microsoft Defender for Endpoint](onboarding.md).|
|`passive_mode_enabled`|`True` if the antivirus component is set to run in passive mode; otherwise, `false`.|
|`product_expiration`|Date and time when the current product version reaches end of support.|
|`real_time_protection_available`|`True` if the real-time protection component is healthy; otherwise, `false`.|
|`real_time_protection_enabled`|`True` if real-time antivirus protection is enabled; otherwise, `false`. |
|`real_time_protection_subsystem`|Subsystem used to serve real-time protection. If real-time protection isn't operating as expected, it shows as `unavailable`.|
|`release_ring`|Release ring. For more information, see [Deployment rings](onboarding.md).|
|`tamper_protection`| Status of tamper protection feature. <br/><br/>Can have one of the following values: <br/>- **disabled** - tamper protection is off.<br/>- **audit** - tamper protection is on but doesn't block any event.<br/>- **block** - tamper protection is monitoring events and block them as needed. |
|`troubleshooting_mode`| `True` if Defender for Endpoint is in troubleshooting mode; otherwise, `false`. see [Troubleshooting mode](mac-troubleshoot-mode.md).|

## Component specific health

You can get more detailed health information for different features in Defender for Endpoint by using the command, `mdatp health --details <feature>`. Here are some examples:

```bash

mdatp health --details permissions

mdatp health --details system_extensions

mdatp health --details edr

mdatp health --details definitions

mdatp health --details features

mdatp health --details help

```

You can run `mdatp health --help` on recent versions to list all supported features.

## See also

- [What's new in Microsoft Defender for Endpoint on macOS](mac-whatsnew.md)
- [Microsoft Defender for Endpoint on macOS](microsoft-defender-endpoint-mac.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]


