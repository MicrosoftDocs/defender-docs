---
title: Deploy updates for Microsoft Defender for Endpoint on macOS
description: Control updates for Microsoft Defender for Endpoint on macOS in enterprise environments.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: install-set-up-deploy
ms.subservice: macos
search.appverid: met150
ms.date: 11/04/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Deploy updates for Microsoft Defender for Endpoint on macOS


Microsoft regularly publishes software updates to improve performance, security, and to deliver new features.

> [!WARNING]
> Each version of Defender for Endpoint on macOS is set to expire automatically after six months. While expired versions continue to receive security intelligence updates, we recommend that you install the latest version to get all available improvements and enhancements. <br>
> To check the expiration date, run the following command:
> ```bash
> mdatp health --field product_expiration
> ```

To update Microsoft Defender for Endpoint on macOS, Microsoft AutoUpdate (MAU) is used. MAU checks updates periodically, and automatically downloads and installs them.

You can deploy preferences to configure how and when MAU checks for updates for the macOS devices in your organization.

## Use msupdate

MAU includes a command-line tool, called *msupdate*, that is designed for IT administrators so that they have more precise control over when updates are applied. Instructions for how to use this tool can be found in [Update Office for Mac by using msupdate](/deployoffice/mac/update-office-for-mac-using-msupdate).

In MAU, the application identifier for Microsoft Defender for Endpoint on macOS is *WDAV00*. To download and install the latest updates for Microsoft Defender for Endpoint on macOS, execute the following command from a Terminal window:

```dos
cd /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS
./msupdate --install --apps wdav00
```

## Set preferences for Microsoft AutoUpdate

This section describes the most common preferences that can be used to configure MAU. These settings can be deployed as a configuration profile through the management console that your enterprise is using. An example of a configuration profile is shown in the following sections.

### Set the channel name

For the latest information on this setting, see [ChannelName](/deployoffice/mac/mau-preferences#channelname).

The channel determines the type and frequency of updates that are offered through MAU. Devices in `Beta` can try out new features before devices in `Preview` and `Current`. 

The `Current` channel contains the most stable version of the product. If this entry is not included or if the entry provided in ChannelName is invalid, MAU reverts to the default "Current" channel.

> [!IMPORTANT]
> Prior to Microsoft AutoUpdate version 4.29, channels had different names:
>
> - `Beta Channel` was named `InsiderFast` (Insider Fast)
> - `Current Channel` (Preview) was named `External` (Insider Slow)
> - `Current Channel` was named `Production`

> [!TIP]
> In order to preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to `Beta` or `Preview`.

|Section|Value|
|---|---|
|**Domain**|`com.microsoft.autoupdate2`|
|**Key**|ChannelName|
|**Data type**|String|
|**Possible values**|Beta <p> Preview <p> Current|
|**Notes on channels**| Beta - Absolute latest in development. Only to be used for testing and error reporting purposes.<p> Preview - This channel provides a preview of official releases. <p> Current - This channel distributes all official releases and is the default setting.|

> [!WARNING]
> This setting changes the channel for all applications that are updated through Microsoft AutoUpdate. To change the channel only for Microsoft Defender for Endpoint on macOS, execute the following command after replacing `[channel-name]` with the desired channel:
> 
> ```bash
> defaults write com.microsoft.autoupdate2 Applications -dict-add "/Applications/Microsoft Defender.app" " { 'Application ID' = 'WDAV00' ; 'App Domain' = 'com.microsoft.wdav' ; LCID = 1033 ; ChannelName = '[channel-name]' ; }"
> ```
> Admins can also control this per app setting via the example configuration provided at the bottom of this page. 

### Change whether the "Check for Updates" button is enabled

For the latest information on this setting, see [EnableCheckForUpdatesButton](/deployoffice/mac/mau-preferences#enablecheckforupdatesbutton).

Change whether local users are able to select the "Check for Updates" option in the Microsoft AutoUpdate user interface. 

|Section|Value|
|---|---|
|**Domain**|`com.microsoft.autoupdate2`|
|**Key**|EnableCheckForUpdatesButton|
|**Data type**|Boolean|
|**Possible values**|True (default) <p> False|
|||

### Disable Insider checkbox

For the latest information on this setting, see [DisableInsiderCheckbox](/deployoffice/mac/mau-preferences#disableinsidercheckbox).

Set to true to make the "Join the Office Insider Program..." checkbox unavailable / greyed out to users.

|Section|Value|
|---|---|
|**Domain**|`com.microsoft.autoupdate2`|
|**Key**|DisableInsiderCheckbox|
|**Data type**|Boolean|
|**Possible values**|False (default) <p> True|
|||

## Example configuration profile

The following configuration profile is used to:

- Place the device in the Current channel
- Automatically download and install updates
- Enable the "Check for updates" button in the user interface
- Allow users on the device to enroll into the Insider channels

> [!WARNING]
> The following configuration is an example configuration and shouldn't be used in production without proper review of settings and tailor of configurations.

### Jamf Pro

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>ChannelName</key>
    <string>Current</string>
    <key>HowToCheck</key>
    <string>AutomaticDownload</string>
    <key>EnableCheckForUpdatesButton</key>
    <true/>
    <key>DisableInsiderCheckbox</key>
    <false/>
</dict>
</plist>
```

### Intune

```XML
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1">
    <dict>
        <key>PayloadUUID</key>
        <string>B762FF60-6ACB-4A72-9E72-459D00C936F3</string>
        <key>PayloadType</key>
        <string>Configuration</string>
        <key>PayloadOrganization</key>
        <string>Microsoft</string>
        <key>PayloadIdentifier</key>
        <string>com.microsoft.autoupdate2</string>
        <key>PayloadDisplayName</key>
        <string>Microsoft AutoUpdate settings</string>
        <key>PayloadDescription</key>
        <string>Microsoft AutoUpdate configuration settings</string>
        <key>PayloadVersion</key>
        <integer>1</integer>
        <key>PayloadEnabled</key>
        <true/>
        <key>PayloadRemovalDisallowed</key>
        <true/>
        <key>PayloadScope</key>
        <string>System</string>
        <key>PayloadContent</key>
        <array>
            <dict>
            <key>PayloadUUID</key>
            <string>5A6F350A-CC2C-440B-A074-68E3F34EBAE9</string>
            <key>PayloadType</key>
            <string>com.microsoft.autoupdate2</string>
            <key>PayloadOrganization</key>
            <string>Microsoft</string>
            <key>PayloadIdentifier</key>
            <string>com.microsoft.autoupdate2</string>
            <key>PayloadDisplayName</key>
            <string>Microsoft AutoUpdate configuration settings</string>
            <key>PayloadDescription</key>
            <string/>
            <key>PayloadVersion</key>
            <integer>1</integer>
            <key>PayloadEnabled</key>
            <true/>
            <key>ChannelName</key>
            <string>Current</string>
            <key>HowToCheck</key>
            <string>AutomaticDownload</string>
            <key>EnableCheckForUpdatesButton</key>
            <true/>
            <key>DisableInsiderCheckbox</key>
            <false/>
            </dict>
        </array>
    </dict>
</plist>
```

### Intune - Defender specific channel name

```XML
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1">
    <dict>
        <key>PayloadUUID</key>
        <string>B762FF60-6ACB-4A72-9E72-459D00C936F3</string>
        <key>PayloadType</key>
        <string>Configuration</string>
        <key>PayloadOrganization</key>
        <string>Microsoft</string>
        <key>PayloadIdentifier</key>
        <string>com.microsoft.autoupdate2</string>
        <key>PayloadDisplayName</key>
        <string>Microsoft AutoUpdate settings</string>
        <key>PayloadDescription</key>
        <string>Microsoft AutoUpdate configuration settings</string>
        <key>PayloadVersion</key>
        <integer>1</integer>
        <key>PayloadEnabled</key>
        <true/>
        <key>PayloadRemovalDisallowed</key>
        <true/>
        <key>PayloadScope</key>
        <string>System</string>
        <key>PayloadContent</key>
        <array>
            <dict>
            <key>PayloadUUID</key>
            <string>5A6F350A-CC2C-440B-A074-68E3F34EBAE9</string>
            <key>PayloadType</key>
            <string>com.microsoft.autoupdate2</string>
            <key>PayloadOrganization</key>
            <string>Microsoft</string>
            <key>PayloadIdentifier</key>
            <string>com.microsoft.autoupdate2</string>
            <key>PayloadDisplayName</key>
            <string>Microsoft AutoUpdate configuration settings</string>
            <key>PayloadDescription</key>
            <string/>
            <key>PayloadVersion</key>
            <integer>1</integer>
            <key>PayloadEnabled</key>
            <true/>
			<key>Applications</key>
			<dict>  
				<key>/Applications/Microsoft Defender.app</key>
				<dict>  
					<key>App Domain</key>
					<string>com.microsoft.wdav</string>
					<key>Application ID</key>
					<string>WDAV00</string>
					<key>ChannelName</key>
					<string>Current</string>
				</dict> 
			</dict>
            </dict>
        </array>
    </dict>
</plist>
```

To configure MAU, you can deploy this configuration profile from the management tool that your enterprise is using:

- From Jamf Pro, upload this configuration profile and set the Preference Domain to *com.microsoft.autoupdate2*.
- From Intune, upload this configuration profile and set the custom configuration profile name to *com.microsoft.autoupdate2*.

- You can specify a ChannelName for Defender by adding a ChannelName key and value under the Applications key. The value of the per app ChannelName key is the same as the global setting - Beta, Preview, and Current. 

For more information, see: [Configuring Preferences for Microsoft AutoUpdate (MAU) in Microsoft 365 Enterprise](/deployoffice/mac/mau-preferences#howtocheck)

## Resources

- [msupdate reference](/deployoffice/mac/update-office-for-mac-using-msupdate)


