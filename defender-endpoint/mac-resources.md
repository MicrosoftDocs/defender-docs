---
title: Resources for Microsoft Defender for Endpoint on Mac
description: Resources for Microsoft Defender for Endpoint on Mac, including how to uninstall it, how to collect diagnostic logs, CLI commands, and known issues with the product.
ms.service: defender-endpoint
author: YongRhee-MSFT
ms.author: yongrhee
manager: deniseb
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: conceptual
ms.subservice: macos
search.appverid: met150
ms.date: 09/13/2024
---

# Resources for Microsoft Defender for Endpoint on macOS

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

## Collecting diagnostic information

If you can reproduce a problem, increase the logging level, run the system for some time, and then restore the logging level to the default.

1. Increase logging level:

   ```bash
   mdatp log level set --level debug
   ```

   ```Output
   Log level configured successfully
   ```

2. Reproduce the problem.

3. Run `sudo mdatp diagnostic create` to back up the Microsoft Defender for Endpoint logs. The files are stored inside a `.zip` archive. This command also prints the file path to the backup after the operation succeeds.

   > [!TIP]
   > By default, diagnostic logs are saved to `/Library/Application Support/Microsoft/Defender/wdavdiag/`. To change the directory where diagnostic logs are saved, pass `--path [directory]` to the below command, replacing `[directory]` with the desired directory.

   ```bash
   sudo mdatp diagnostic create
   ```

   ```console
   Diagnostic file created: "/Library/Application Support/Microsoft/Defender/wdavdiag/932e68a8-8f2e-4ad0-a7f2-65eb97c0de01.zip"
   ```

4. Restore logging level.

   ```bash
   mdatp log level set --level info
   ```

   ```console
   Log level configured successfully
   ```

## Logging installation issues

If an error occurs during installation, the installer reports a general failure only. The detailed log is saved to `/Library/Logs/Microsoft/mdatp/install.log`. If you experience issues during installation, send us this file when you open your support case so we can help diagnose the cause.

For further troubleshooting installation issues, see [Troubleshoot installation issues for Microsoft Defender for Endpoint on macOS](mac-support-install.md).

## Configuring from the command line

### Supported output types

Supports table and JSON format output types. For each command, there's a default output behavior. You can modify the output in your preferred output format using the following commands:

`-output json`

`-output table`

Important tasks, such as controlling product settings and triggering on-demand scans, can be done by using the command line:

|Group|Scenario|Command|
|---|---|---|
|Configuration|Turn on/off antivirus in passive mode|`mdatp config passive-mode --value [enabled/disabled]`|
|Configuration|Turn on/off real-time protection|`mdatp config real-time-protection --value [enabled/disabled]`|
|Configuration|Turn on/off behavior monitoring|`mdatp config behavior-monitoring --value [enabled/disabled]`|
|Configuration|Turn on/off cloud protection|`mdatp config cloud --value [enabled/disabled]`|
|Configuration|Turn on/off product diagnostics|`mdatp config cloud-diagnostic --value [enabled/disabled]`|
|Configuration|Turn on/off automatic sample submission|`mdatp config cloud-automatic-sample-submission --value [enabled/disabled]`|
|Configuration|Turn on/audit/off PUA protection|`mdatp threat policy set --type potentially_unwanted_application -- action [block/audit/off`|
|Configuration|Add/remove an antivirus exclusion for a process|`mdatp exclusion process [add/remove] --path [path-to-process]`or `mdatp exclusion process [add\|remove] --name [process-name]`|
|Configuration|Add/remove an antivirus exclusion for a file|`mdatp exclusion file [add/remove] --path [path-to-file]`|
|Configuration|Add/remove an antivirus exclusion for a directory|`mdatp exclusion folder [add/remove] --path [path-to-directory]`|
|Configuration|Add/remove an antivirus exclusion for a file extension|`mdatp exclusion extension [add/remove] --name [extension]`|
|Configuration|List all antivirus exclusions|`mdatp exclusion list`|
|Configuration|Configure degree of parallelism for on-demand scans|`mdatp config maximum-on-demand-scan-threads --value [numerical-value-between-1-and-64]`|
|Configuration|Turn on/off scans after security intelligence updates|`mdatp config scan-after-definition-update --value [enabled/disabled]`|
|Configuration|Turn on/off archive scanning (on-demand scans only)|`mdatp config scan-archives --value [enabled/disabled]`|
|Configuration|Turn on/off file hash computation|`mdatp config enable-file-hash-computation --value [enabled/disabled]`|
|Protection|Scan a path|`mdatp scan custom --path [path] [--ignore-exclusions]`|
|Protection|Do a quick scan|`mdatp scan quick`|
|Protection|Do a full scan|`mdatp scan full`|
|Protection|Cancel an ongoing on-demand scan|`mdatp scan cancel`|
|Protection|Request a security intelligence update|`mdatp definitions update`|
|Configuration|Add a threat name to the allowed list|`mdatp threat allowed add --name [threat-name]`|
|Configuration|Remove a threat name from the allowed list|`mdatp threat allowed remove --name [threat-name]`|
|Configuration|List all allowed threat names|`mdatp threat allowed list`|
|Protection history|Print the full protection history|`mdatp threat list`|
|Protection history|Get threat details|`mdatp threat get --id [threat-id]`|
|Quarantine management|List all quarantined files|`mdatp threat quarantine list`|
|Quarantine management|Remove all files from the quarantine|`mdatp threat quarantine remove-all`|
|Quarantine management|Add a file detected as a threat to the quarantine|`mdatp threat quarantine add --id [threat-id]`|
|Quarantine management|Remove a file detected as a threat from the quarantine|`mdatp threat quarantine remove --id [threat-id]`|
|Quarantine management|Restore a file from the quarantine. Available in Defender for Endpoint version before [101.23092.0012](mac-whatsnew.md#nov-2023-build-101230920007--release-version-2012309270).|`mdatp threat quarantine restore --id [threat-id] --path [destination-folder]`|
|Quarantine management|Restore a file from the quarantine with Threat ID. Available in Defender for Endpoint version [101.23092.0012](mac-whatsnew.md#nov-2023-build-101230920007--release-version-2012309270) or later.|`mdatp threat restore threat-id --id [threat-id] --destination-path [destination-folder]`|
|Quarantine management|Restore a file from the quarantine with Threat Original Path. Available in Defender for Endpoint version [101.23092.0012](mac-whatsnew.md#nov-2023-build-101230920007--release-version-2012309270) or later.|`mdatp threat restore threat-path --path [threat-original-path] --destination-path [destination-folder]`|
|Network Protection Configuration|Configure the Network Protection enforcement level|`mdatp config network-protection enforcement-level --value [Block/Audit/Disabled]`|
|Network Protection management|Check Network protection was started successfully|`mdatp health --field network_protection_status`|
|Device Control management|Is Device Control enabled, and what is the Default Enforcement?|`mdatp device-control policy preferences list`|
|Device Control management|What Device Control policy is enabled?|`mdatp device-control policy rules list`|
|Device Control management|What Device Control policy groups are enabled?|`mdatp device-control policy groups list`|
|Configuration|Turn on/off data loss prevention|`mdatp config data_loss_prevention --value [enabled/disabled]`|
|Diagnostics|Change the log level|`mdatp log level set --level [error/warning/info/verbose]`|
|Diagnostics|Generate diagnostic logs|`mdatp diagnostic create --path [directory]`|
|Health|Check the product's health|`mdatp health`|
|Health|Check for a specific product attribute|`mdatp health --field [attribute: healthy/licensed/engine_version...]`|
|EDR|EDR list exclusions (root)| `mdatp edr exclusion list [processes|paths|extensions|all]` |
|EDR|Set/Remove tag, only GROUP supported|`mdatp edr tag set --name GROUP --value [name]`|
|EDR|Remove group tag from device|`mdatp edr tag remove --tag-name [name]`|
|EDR|Add Group ID|`mdatp edr group-ids --group-id [group]`|

### How to enable autocompletion

To enable autocompletion in bash, run the following command and restart the Terminal session:

```bash
echo "source /Applications/Microsoft\ Defender.app/Contents/Resources/Tools/mdatp_completion.bash" >> ~/.bash_profile
```

To enable autocompletion in zsh:

- Check whether autocompletion is enabled on your device:

   ```zsh
   cat ~/.zshrc | grep autoload
   ```

- If the preceding command doesn't produce any output, you can enable autocompletion using the following command:

   ```zsh
   echo "autoload -Uz compinit && compinit" >> ~/.zshrc
   ```

- Run the following commands to enable autocompletion for Microsoft Defender for Endpoint on macOS and restart the Terminal session:

   ```zsh
   sudo mkdir -p /usr/local/share/zsh/site-functions

   sudo ln -svf "/Applications/Microsoft Defender.app/Contents/Resources/Tools/mdatp_completion.zsh" /usr/local/share/zsh/site-functions/_mdatp
   ```

## Client Microsoft Defender for Endpoint quarantine directory

`/Library/Application Support/Microsoft/Defender/quarantine/` contains the files quarantined by `mdatp`. The files are named after the threat trackingId. The current trackingIds are shown with `mdatp threat list`.

## Uninstalling

There are several ways to uninstall Microsoft Defender for Endpoint on macOS. Although centrally managed uninstallation is available on JAMF, it's not yet available for Microsoft Intune.

All of the uninstall of Microsoft Defender for Endpoint on macOS require the following:

1. Create a [device tag](/defender-endpoint/machine-tags), and name the tag *decommissioned* and assign it to the macOS where Microsoft Defender for macOS is being uninstalled.

1. Create a [Device group](/defender-endpoint/machine-groups) and name it (e.g. *Decommissioned macOS*) and assign a user *group* that should be able to see them.

   Note: Steps 1 and 2 are optional if you do not want to see these devices that are retired in the "Device inventory" for 180 days.
   
1. Remove the "Set Preferences" policies that contain [Tamper Protection](/defender-endpoint/tamperprotection-macos) or through the manual configuration.

1. Offboard each device per [Offboard non-Windows devices](configure-endpoints-non-windows.md).

1. Uninstall the Microsoft Defender for Endpoint for macOS apps

1. Remove the device from the *group* for *system extension* policies if an MDM was used to set them.

### Interactive uninstallation

- Open **Finder > Applications**. Right click on **Microsoft Defender for Endpoint**, and then select **Move to Trash**.

### From the command line

- `sudo '/Library/Application Support/Microsoft/Defender/uninstall/uninstall'`

### Using JAMF Pro

To uninstall Microsoft Defender for Endpoint on macOS using JAMF Pro upload the offboarding profile. 

The offboarding profile should be uploaded without any modifications, and with Preference Domain name set to `com.microsoft.wdav.atp.offboarding`, as shown in the following image:

   :::image type="content" source="/defender/media/defender-endpoint/jamf-pro-offboarding.png" alt-text="Screenshot of the JAMF offboarding screen" lightbox="/defender/media/defender-endpoint/jamf-pro-offboarding.png":::


> [!NOTE]
> If you have trouble uninstalling Defender for Endpoint on Mac, and you see in your reports an item for *Microsoft Defender Endpoint Security Extension*, follow these steps:
> 1. Reinstall the Microsoft Defender app.
> 2. Drag **Microsoft Defender.app** to **Trash**.
> 3. Run this command: `sudo /Library/Application Support/Microsoft/Defender/uninstall/install_helper execute --path '/Library/Application Support/Microsoft/Defender/uninstall/uninstall' --args --post-uninstall-hook`.
> 4. Restart the device.

## The Microsoft Defender portal

When threats are detected, your security team can view detections and if necessary, take response actions on a device in the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)). The Microsoft Defender combines protection, detection, investigation, and response to threats in a central location. For more information, see the following resources:

- [Overview of endpoint detection and response](/defender-endpoint/overview-endpoint-detection-response)
- [Tech Community blog: EDR capabilities for macOS have now arrived](https://techcommunity.microsoft.com/t5/microsoft-defender-atp/edr-capabilities-for-macos-have-now-arrived/ba-p/1047801)
- [Microsoft Defender portal overview](/defender-xdr/microsoft-365-defender-portal)


[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
