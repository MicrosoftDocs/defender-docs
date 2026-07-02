---
title: How to schedule scans with Microsoft Defender for Endpoint on macOS
description: Learn how to schedule an automatic scanning time for Microsoft Defender for Endpoint in macOS to better protect your organization's assets.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
ms.date: 06/17/2026
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: how-to
ms.subservice: macos
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014

ai-usage: ai-assisted
---
# Schedule scans with Microsoft Defender for Endpoint on macOS

This article explains how to configure scheduled scans in Microsoft Defender for Endpoint on macOS using the built-in scheduled scan settings, plist configuration profiles, or the mdatp command-line tool. Review the prerequisites before you begin.

<a name="schedule-a-scan-built-into-microsoft-defender-for-endpoint-on-macos"></a>
## Use the built-in scheduled scan settings in Microsoft Defender for Endpoint on macOS

While you can start a threat scan at any time with Microsoft Defender for Endpoint, your enterprise might benefit from scheduled or timed scans. For example, you can schedule a scan to run at the beginning of every workday or week. 

There are three types of scheduled scans that are configurable: hourly, daily, and weekly scans. Hourly and daily scheduled scans are always run as quick scans, weekly scans can be configured to be either quick or full scans. It's possible to have all three types of scheduled scans at the same time. See the [daily and weekly scan example](#example-1-schedule-a-daily-quick-scan-and-weekly-full-scan-using-a-plist) and the [hourly, daily, and weekly scan example](#example-2-schedule-an-hourly-quick-scan-a-daily-quick-scan-and-weekly-full-scan-using-a-plist). 

**Prerequisites**:

- Platform Update version: 101.23122.0005 or newer.

<a name="schedule-a-scan-with-microsoft-defender-for-endpoint-on-macos"></a>
## Schedule scans by deploying a plist in Microsoft Defender for Endpoint on macOS

You can create a scheduled scan for your macOS, which is built in to *Microsoft Defender for Endpoint on macOS*.

For more information on the `.plist` file format used in these examples, see the [Apple Information Property List file reference](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/AboutInformationPropertyListFiles.html), which describes the XML key-value structure used to define configuration profiles on macOS.

The daily and weekly scheduled scan plist configuration for macOS uses the parameters described in the following table.

> [!TIP] 
> Schedules are based on the local time zone of the device.

| Parameter | The acceptable values for this parameter are: |
| --- | --- |
| `scheduledScan` | `enabled` or `disabled` |
| `scanType` | `quick` or `full` |
| `ignoreExclusions` | `true` or `false` |
| lowPriorityScheduledScan | `true` or `false` |
| `dayOfWeek` | The range is between `0` and `8`. <br>- `0`: Everyday <br>- `1`: Sunday <br>- `2`: Monday <br>- `3`: Tuesday <br>- `4`: Wednesday <br>- `5`: Thursday <br>- `6`: Friday <br>- `7`: Saturday <br>- `8`: Never |
| `timeOfDay` | Specifies the time of day, as the number of `minutes after midnight`, to perform a scheduled scan. The time refers to the local time on the computer. If you don't specify a value for this parameter, a scheduled scan runs at a default time of two hours after midnight. |
| `interval` | `0` (never), `every 1` (hour) to `every 24` (hours, one scan per day) |
| `randomizeScanStartTime` | Only applicable for daily quick scans or weekly quick/full scans. Randomize the start time of the scan by up to specified number of hours. <br> For example, if a scan is scheduled for 2 p.m and `randomizeScanStartTime` is set to 2, the scan commences at a random time between 2 p.m and 4 p.m. |

Your scheduled scan runs at the date, time, and frequency you defined in your `plist`.

### Example 1: Schedule a daily quick scan and weekly full scan using a plist

In the following example, the daily quick scan configuration is set to run at 885 minutes after midnight (2:45 p.m.). The weekly configuration is set to run a full scan on Wednesday at 880 minutes after midnight (2:40 p.m.). And it's set to ignore exclusions and run a low-priority scan.

Use the plist schema shown here to configure a daily quick scan and a weekly full scan with the scheduled scan parameters described in the preceding table.

Open a text editor and use the Intune mobileconfig and JamF plist examples in this section as a guide for your own scheduled scan file.

#### For Intune

Use the following mobileconfig plist sample to deploy this scheduled scan configuration through Intune.

``` XML
<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> 
<plist version="1.0"> 
<dict> 
    <key>PayloadUUID</key>
    <string>C4E6A782-0C8D-44AB-A025-EB893987A295</string>
    <key>PayloadType</key>
    <string>Configuration</string>
    <key>PayloadOrganization</key>
    <string>Microsoft</string>
    <key>PayloadIdentifier</key>
    <string>C4E6A782-0C8D-44AB-A025-EB893987A295</string>
    <key>PayloadDisplayName</key>
    <string>Microsoft Defender for Endpoint settings</string>
    <key>PayloadDescription</key>
    <string>Microsoft Defender for Endpoint configuration settings</string>
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
            <string>99DBC2BC-3B3A-46A2-A413-C8F9BB9A7295</string>
            <key>PayloadType</key>
            <string>com.microsoft.wdav</string>
            <key>PayloadOrganization</key>
            <string>Microsoft</string>
            <key>PayloadIdentifier</key>
            <string>99DBC2BC-3B3A-46A2-A413-C8F9BB9A7295</string>
            <key>PayloadDisplayName</key>
            <string>Microsoft Defender for Endpoint configuration settings</string>
            <key>PayloadDescription</key>
            <string/>
            <key>PayloadVersion</key>
            <integer>1</integer>
            <key>PayloadEnabled</key>
            <true/>
            <key>features</key> 
            <dict>
                <key>scheduledScan</key> 
                <string>enabled</string> 
            </dict> 
            <key>scheduledScan</key> 
            <dict> 
                <key>ignoreExclusions</key> 
                <true/> 
                <key>lowPriorityScheduledScan</key> 
                <true/> 
                <key>dailyConfiguration</key> 
                <dict> 
                    <key>timeOfDay</key> 
                    <integer>880</integer> 
                </dict> 
                <key>weeklyConfiguration</key> 
                <dict> 
                    <key>dayOfWeek</key> 
                    <integer>4</integer> 
                    <key>timeOfDay</key> 
                    <integer>885</integer> 
                    <key>scanType</key> 
                    <string>full</string>
                </dict>
            </dict> 
        </dict>
    </array>
</dict> 
</plist>
```

- Save the file as `com.microsoft.wdav.mobileconfig`.

#### For JamF and other third-party MDMs

Use the following plist sample for JamF and other third-party MDM solutions.

``` XML
<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> 
<plist version="1.0"> 
<dict> 
    <key>features</key> 
    <dict> 
        <key>scheduledScan</key> 
        <string>enabled</string> 
    </dict> 
    <key>scheduledScan</key> 
    <dict> 
        <key>ignoreExclusions</key> 
        <true/> 
        <key>lowPriorityScheduledScan</key> 
        <true/> 
        <key>dailyConfiguration</key> 
        <dict> 
            <key>timeOfDay</key> 
            <integer>885</integer> 
        </dict> 
        <key>weeklyConfiguration</key> 
        <dict> 
            <key>dayOfWeek</key> 
            <integer>4</integer> 
            <key>timeOfDay</key> 
            <integer>880</integer> 
            <key>scanType</key> 
            <string>full</string> 
        </dict> 
    </dict> 
</dict> 
</plist> 
```

1. Save the file as `com.microsoft.wdav.plist`.

1. Check that the scheduled scan is configured via a "Set Preference"
     
     ```
     mdatp health --details scheduled_scan
     ```

In the results, you should be able to see [managed].

### Example 2: Schedule an hourly quick scan, a daily quick scan, and weekly full scan using a plist

In this hourly, daily, and weekly scheduled scan example, an hourly quick scan runs every 6 hours, a daily quick scan is set to run at 885 minutes after midnight (2:45 p.m.), and a weekly full scan runs on Wednesdays at 880 minutes after midnight (2:40 p.m.).

Open a text editor and use the Intune mobileconfig and JamF plist examples in this section as a guide for your own scheduled scan file.

#### For Intune:

Use the following mobileconfig plist sample to deploy this scheduled scan configuration through Intune.

```XML
<?xml version="1.0" encoding="UTF-8"?> 
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"> 
<plist version="1.0"> 
<dict> 
     <key>PayloadUUID</key>
     <string>C4E6A782-0C8D-44AB-A025-EB893987A295</string>
     <key>PayloadType</key>
     <string>Configuration</string>
     <key>PayloadOrganization</key>
     <string>Microsoft</string>
     <key>PayloadIdentifier</key>
     <string>C4E6A782-0C8D-44AB-A025-EB893987A295</string>
     <key>PayloadDisplayName</key>
     <string>Microsoft Defender for Endpoint settings</string>
     <key>PayloadDescription</key>
     <string>Microsoft Defender for Endpoint configuration settings</string>
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
           <string>99DBC2BC-3B3A-46A2-A413-C8F9BB9A7295</string>
           <key>PayloadType</key>
           <string>com.microsoft.wdav</string>
           <key>PayloadOrganization</key>
           <string>Microsoft</string>
           <key>PayloadIdentifier</key>
           <string>99DBC2BC-3B3A-46A2-A413-C8F9BB9A7295</string>
           <key>PayloadDisplayName</key>
           <string>Microsoft Defender for Endpoint configuration settings</string>
           <key>PayloadDescription</key>
           <string/>
           <key>PayloadVersion</key>
           <integer>1</integer>
           <key>PayloadEnabled</key>
           <true/>
    <key>features</key> 
    <dict> 
        <key>scheduledScan</key> 
        <string>enabled</string> 
    </dict> 
<key>scheduledScan</key> 
<dict> 
    <key>ignoreExclusions</key> 
    <true/> 
    <key>lowPriorityScheduledScan</key> 
    <true/> 
    <key>dailyConfiguration</key> 
    <dict> 
        <key>timeOfDay</key> 
        <integer>885</integer> 
        <key>interval</key> 
        <string>1</string> 
    </dict> 
    <key>weeklyConfiguration</key> 
    <dict> 
        <key>dayOfWeek</key> 
        <integer>4</integer> 
        <key>timeOfDay</key> 
        <integer>880</integer> 
        <key>scanType</key> 
        <string>full</string> 
        </dict> 
        </dict> 
    </dict> 
</array>
</dict>
</plist> 
```

- Save the file as `com.microsoft.wdav.mobileconfig`.

#### For JamF and other third-party MDMs

Use the following plist sample for JamF and other third-party MDM solutions.

```XML
    <?xml version="1.0" encoding="UTF-8"?> 
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.  dtd"> 
    <plist version="1.0"> 
    <dict> 
        <key>features</key> 
        <dict> 
            <key>scheduledScan</key> 
            <string>enabled</string> 
        </dict> 
    <key>scheduledScan</key> 
    <dict> 
        <key>ignoreExclusions</key> 
        <true/> 
        <key>lowPriorityScheduledScan</key> 
        <true/> 
        <key>dailyConfiguration</key> 
        <dict> 
            <key>timeOfDay</key> 
            <integer>885</integer> 
            <key>interval</key> 
            <string>1</string> 
        </dict> 
        <key>weeklyConfiguration</key> 
        <dict> 
            <key>dayOfWeek</key> 
            <integer>4</integer> 
            <key>timeOfDay</key> 
            <integer>880</integer> 
            <key>scanType</key> 
            <string>full</string> 
            </dict> 
            </dict> 
        </dict> 
    </plist> 
```

1. Save the file as `com.microsoft.wdav.plist`.

### Upload the plist file to Jamf Pro

To upload the scheduled scan plist configuration to Jamf Pro, complete the following steps:

1. Go to **Computers > Configuration Profiles.**

1. Create a new profile.

1. Add **Application & Custom Settings.**

1. Set the **Preference Domain** to `com.microsoft.wdav`.

1. Paste the contents of the `.plist` file into the configuration field.

1. Check that the scheduled scan is configured via a "Set Preference"
     
    ```
    mdatp health --details scheduled_scan
    ```

     In the results, you should be able to see [managed].

<a name="option-3-configure-scheduled-scans-through-cli-tool"></a>
### Configure scheduled scans using the mdatp CLI

To enable scheduled scan feature:

|Version|Command|
|---|---|
| Version 101.23122.x or later | `sudo mdatp config scheduled-scan settings feature --value enabled` |

To schedule hourly quick scans:

|Version|Command|
|---|---|
| Version 101.23122.x or later | `sudo mdatp config scheduled-scan quick-scan hourly-interval --value \<arg\>` |

:::image type="content" source="media/schedule-scans-mac/schedule-scan-pic1.png" alt-text="Screenshot of schedule hourly scan.":::

To schedule daily quick scans:

|Version|Command|
|---|---|
| Version 101.23122.x or later | `sudo mdatp config scheduled-scan quick-scan time-of-day --value \<arg\>` |

:::image type="content" source="media/schedule-scans-mac/schedule-scan-pic2.png" alt-text="Screenshot of schedule daily quick scan.":::

To schedule weekly scans:

|Version|Command|
|---|---|
| Version 101.23122.x or later | `sudo mdatp config scheduled-scan weekly-scan --day-of-week \<arg\> --time-of-day \<arg\>--scan-type \<arg\>` |

:::image type="content" source="media/schedule-scans-mac/schedule-scan-pic3.png" alt-text="Screenshot of schedule weekly scan.":::

For other configuration options:

- To check for definitions update before scheduled scans:

  `sudo mdatp config scheduled-scan settings check-for-definitions --value true`

- To use low priority threads for scheduled scanning:

  `sudo mdatp config scheduled-scan settings low-priority --value true`

### Check that the scheduled scan ran

Use the following command:

`mdatp scan list`

:::image type="content" source="media/schedule-scans-mac/schedule-scan-pic4.png" alt-text="Screenshot of schedule ran.":::`\<snip\>`

:::image type="content" source="media/schedule-scans-mac/schedule-scan-pic5.png" alt-text="Screenshot of schedule ran successfully.":::  

> [!IMPORTANT]
> Scheduled scans don't run at the scheduled time while the device is asleep. Instead, scheduled scans run when the device resumes from sleep mode.
> If the device is turned off, the scan runs at the next scheduled scan time.
