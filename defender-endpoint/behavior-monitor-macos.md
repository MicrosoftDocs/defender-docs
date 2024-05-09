---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: Behavior Monitoring in Microsoft Defender Antivirus on macOS
description: Behavior Monitoring in Microsoft Defender Antivirus on macOS
author:      YongRhee-MSFT # GitHub alias
ms.author:   yongrhee # Microsoft alias
ms.service: defender-endpoint
ms.topic: overview
ms.date:     05/08/2024
ms.subservice: ngp
---

# Behavior monitoring in Microsoft Defender Antivirus on macOS

**Applies to:**

- [Microsoft Defender for XDR](../defender-xdr/microsoft-365-defender.md)
- [Microsoft Defender for Endpoint Plan 2](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender for Endpoint Plan 1](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)
- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)
- Microsoft Defender Antivirus
- Supported [versions of macOS](/defender-endpoint/microsoft-defender-endpoint-mac)

> [!IMPORTANT]
> Some information relates to pre-released product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

## Pre-requisites

- Device is onboarded to Microsoft Defender for Endpoint
- [preview features](/defender-endpoint/preview) is enabled in the Microsoft XDR portal ([https://security.microsoft.com](https://security.microsoft.com))
- Device must be in the [Beta channel](/defender-endpoint/mac-updates) _Note: Beta channel was formerly InsiderFast._ 
- Minimal Microsoft Defender for Endpoint version number must be (Beta (Insiders-Fast)): 101.24042.0002 or newer. Version number refers to the **app_version**, also referred to as **Platform update**.
- Ensure that Real-Time Protection (RTP) is enabled
- Ensure [cloud-delivered protection](/defender-endpoint/mac-preferences) is enabled
- Device must be explicitly enrolled into the preview.

## Overview

The new preventive antivirus functionality complements our existing strong content-based capabilities with behavior monitoring. This enhancement brings immediate ability to closely monitor processes, file system activities, and process interactions within the system. The enhanced ability to correlate events and behaviors across multiple processes allows us to more generically detect and block malware based on their behavioral classification. These behavior-based signals will act as additional runtime signals for behavioral cloud-powered machine learning models and for effective runtime protection.

  

### Deployment instructions

__Change the behavior monitoring policy__

You can deploy behavior monitoring in Microsoft Defender for Endpoint on macOS feature in one of the following ways: 



|__Management tool__|
| -------- |
|Intune|
|JamF or other 3<sup>rd</sup> party MDM|
|Manually|

The following sections describe each of these methods in detail.

#### Manual deployment

You can enable Behavior Monitoring on Microsoft Defender for Endpoint on macOS by running the following command from the Terminal: 


```bash
sudo mdatp config behavior-monitoring --value enabled
```

To disable:


```bash
sudo mdatp config behavior-monitoring --value disabled
```

 

Reference: [Resources for Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-resources)

or

_If managed via “Settings Preferences” (policy):_

#### Intune deployment


```xml
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
              <key>antivirusEngine</key>
              <dict>
                            <key>behaviorMonitoring</key>
                           <string>enabled</string>
              </dict>
              <key>features</key>
              <dict>
                            <key>behaviorMonitoring</key>
                           <string>enabled</string>
              <key>behaviorMonitoringConfigurations</key>
                           <dict>
                                 <key>blockExecution</key>
                                 <string>enabled</string>
                                 <key>notifyForks</key>
                                 <string>enabled</string>
                                 <key>forwardRtpToBm</key>
                                 <string>enabled</string>
                                 <key>avoidOpenCache</key>
                                 <string>enabled</string>
                           </dict>
              </dict>
</dict>
</plist>
</array>
</dict>
```

Save as BehaviorMonitoring_for_MDE_on_macOS.mobileconfig

1. Open **Devices** > **Configuration** profiles. Select **Create** profile. Select **New Policy**

1. Choose a name for the profile. Change **Platform=macOS** to **Profile type=Templates** and choose **Custom** in the template name section. Select **Configure**.

1. Save the .plist produced earlier as `com.microsoft.wdav.xml`.

1. Enter `com.microsoft.wdav` as the **custom configuration profile name**.

1. Open the configuration profile and upload the `com.microsoft.wdav.xml` file. (This file was created in step 3.)

1. Select **OK**.

1. Select **Manage** > **Assignments**. In the **Include** tab, select **Assign to All Users & All devices or to a Device Group or User Group.**

#### Via JamF Intune deployment


```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
              <key>antivirusEngine</key>
              <dict>
                            <key>behaviorMonitoring</key>
                           <string>enabled</string>
              </dict>
              <key>features</key>
              <dict>
                            <key>behaviorMonitoring</key>
                           <string>enabled</string>
              <key>behaviorMonitoringConfigurations</key>
                           <dict>
                                 <key>blockExecution</key>
                                         <string>enabled</string>
                                 <key>notifyForks</key>
                                         <string>enabled</string>
                                 <key>forwardRtpToBm</key>
                                         <string>enabled</string>
                                 <key>avoidOpenCache</key>
                                         <string>enabled</string>
                           </dict>
              </dict>
</dict>
</plist>
```

Reference: [Set preferences for Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-preferences)

Save as BehaviorMonitoring_for_MDE_on_macOS.plist

1. In **Computers** > **Configuration Profiles**, select **Options** > **Applications & Custom Settings**

1. Select **Upload File** (PLIST file)

1. Set preference domain to *com.microsoft.wdav*

1. Upload the following plist file

### Verifying Behavior Monitoring detection

See the following article to test for a behavior monitoring (prevention/block) detection: [Behavior Monitoring demonstration](/defender-endpoint/demonstration-behavior-monitoring)

Microsoft Defender for Endpoint on macOS antivirus behavior monitoring seamlessly integrates into the existing preventive experiences. Behavior monitoring details and artifacts can be explored locally using the existing Microsoft Defender for Endpoint on macOS command line interface.


```bash
sudo mdatp threat list
```

### Next steps during Preview

- Keep an eye on [performance](/defender-endpoint/mac-support-perf-overview) such as cpu utilization, and memory utilization.  Please share your feedback and observations to help us improve.

- Do the BM protection alerts show up in the “Device timeline” and/or “Advanced Hunting”?  Not during “Preview”.  Once we go to GA, they will.

- Continue running MacOS clients enrolled into evaluation as you normally would.

### Feedback? 

We welcome your feedback! You can submit feedback through the Microsoft Defender XDR portal ([https://security.microsoft.com](https://security.microsoft.com)).

 

### When will it be available in General Availability (GA)?

Monitor the [What's new in Microsoft Defender for Endpoint on macOS page](/defender-endpoint/mac-whatsnew) for upcoming announcements which also includes GA of macOS antivirus behavior monitoring and blocking.

Stay tuned to our [blog](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/bg-p/MicrosoftDefenderATPBlog) and [Twitter channel](https://twitter.com/MSThreatProtect) to stay up to date on additional Microsoft Defender for Endpoint advancements.

