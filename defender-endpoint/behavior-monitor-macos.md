---
title: Behavior Monitoring in Microsoft Defender Antivirus on macOS
description: Behavior Monitoring in Microsoft Defender Antivirus on macOS
author: emmwalshh
ms.author: ewalsh
manager: deniseb
ms.service: defender-endpoint
ms.topic: overview
ms.date: 06/27/2025
ms.subservice: ngp
audience: ITPro
ms.collection:
- m365-security
- tier2
- mde-asr
ms.custom:
- partner-contribution
ms.reviewer: yongrhee
search.appverid: MET150
f1.keywords: NOCSH
---

# Behavior monitoring in Microsoft Defender Antivirus on macOS

**Applies to:**

- [Microsoft Defender for XDR](/defender-xdr/microsoft-365-defender)
- [Microsoft Defender for Endpoint Plan 2](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender for Endpoint Plan 1](/defender-endpoint/microsoft-defender-endpoint)
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)
- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals?msockid=0f1c3b9963366db31ba02e78621b6c1e#Overview)
- Microsoft Defender Antivirus
- Supported [versions of macOS](/defender-endpoint/microsoft-defender-endpoint-mac)

## Overview of behavior monitoring

Behavior monitoring monitors process behavior to detect and analyze potential threats based on the behavior of the applications, daemons, and files within the system. As behavior monitoring observes how the software behaves in real-time, it can adapt quickly to new and evolving threats and block them.

## Prerequisites

- The device must be onboarded to Microsoft Defender for Endpoint.
- For the best experience, Microsoft Defender should be up-to-date with the latest version.
- The minimum Microsoft Defender for Endpoint version number must be [101.25032.0006](/defender-endpoint/mac-whatsnew#apr-2025-build-101250320006---release-version-2012503260) or newer. The version number refers to the `app_version` (also known as **Platform update**).
- Real-time protection (RTP) must be enabled.
- [Cloud-delivered protection](/defender-endpoint/mac-preferences) must be enabled.

## Deployment instructions for behavior monitoring

Behavior Monitoring will soon be on by default. You can confirm your device’s enrollment status by checking the output of ***mdatp health --details features*** in your terminal. If not already enabled, you must configure it.

To deploy behavior monitoring in Microsoft Defender for Endpoint on macOS, you must change the behavior monitoring policy using one of the following methods:

- [Intune](#intune-deployment)
- [JamF or other non-Microsoft MDM](#jamf-deployment)
- [Manually](#manual-deployment)

The following sections describe each of these methods in detail.

### Intune deployment

1. Copy the following XML to create a _.plist_ file and save it as `BehaviorMonitoring_for_MDE_on_macOS.mobileconfig`.

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
                   </dict>
               </dict>
           </array>
       </dict>
   </plist>
   ```

2. Open **Devices** > **Configuration profiles**.

3. Select **Create profile** and select **New Policy**.

4. Give the profile a name. Change **Platform=macOS** to **Profile type=Templates** and choose **Custom** in the template name section. Select **Configure**.

5. Go to the plist file you saved earlier and save it as `com.microsoft.wdav.xml`.

6. Specify `com.microsoft.wdav` as the **custom configuration profile name**.

7. Open the configuration profile and upload the `com.microsoft.wdav.xml` file and select **OK**.

8. Select **Manage** > **Assignments**. In the **Include** tab, select **Assign to All Users & All devices or to a Device Group or User Group.**

#### JamF deployment

1. Copy the following XML to create a _.plist_ file and save it as `Save as BehaviorMonitoring_for_MDE_on_macOS.plist`:

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
               </dict>
       </dict>
   </plist>
   ```

2. In **Computers** > **Configuration Profiles**, select **Options** > **Applications & Custom Settings**,

3. Select **Upload File** (_.plist_ file).

4. Set preference domain to `com.microsoft.wdav`.

5. Upload the plist file saved earlier.

For more information, see: [Set preferences for Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-preferences).

#### Manual deployment

You can enable Behavior Monitoring on Microsoft Defender for Endpoint on macOS by running the following command from the Terminal:

```bash
sudo mdatp config behavior-monitoring --value enabled
```

To disable:

```bash
sudo mdatp config behavior-monitoring --value disabled
```

For more information, see: [Resources for Microsoft Defender for Endpoint on macOS](/defender-endpoint/mac-resources).

### Verifying behavior monitoring is enabled

To verify behavior monitoring is enabled, open Terminal, copy and run the following command:

```bash
mdatp health --details features
```

When behavior monitoring is enabled, the result displays the value of `behavior_monitoring` as enabled.

### To test behavior monitoring (prevention/block) detection

See [Behavior Monitoring demonstration](demonstration-behavior-monitoring.md).

### Verifying behavior monitoring detections

The existing Microsoft Defender for Endpoint on macOS command line interface can be used to review behavior monitoring details and artifacts.

```bash
sudo mdatp threat list
```

### Frequently asked questions (FAQ)

#### What if I see an increase in CPU utilization or memory utilization?

Disable behavior monitoring and see if the issue goes away. If the issue doesn't go away, it isn't related to behavior monitoring.

If the issue goes away, re-enable behavior monitoring and use behavior monitoring statistics to identify and exclude processes generating excessive events:

```bash
sudo mdatp config behavior-monitoring-statistics --value enabled
```

Repro the issue and then execute:

```bash
sudo mdatp diagnostic behavior-monitoring-statistics --sort
```

This command lists processes running on the machine which are reporting behavior monitoring events to the engine process. The more events, the more CPU/memory impact that process has.

Exclude identified processes using:

```bash
sudo mdatp exclusion process add --path <path to process with lots of events>
```

> [!IMPORTANT]
> Verify the reliability of the processes being excluded. Excluding these processes will prevent all events from being sent to behavior monitoring and from undergoing content scanning. However, EDR will continue to receive events from these processes. It is important to note that this mitigation is unlikely to reduce CPU usage of the `wdavdaemon` or `wdavdaemon_enterprise` processes, but may affect `wdavdaemon_unprivileged`. If the other two processes are also experiencing high CPU usage, behavior monitoring may not be the sole cause, and contacting Microsoft support is recommended.

Once done, disable behavior monitoring statistics:

```bash
sudo mdatp config behavior-monitoring-statistics --value disabled
```

If the issue persists, especially after a reboot, download the [XMDE Client Analyzer](https://aka.ms/XMDEClientAnalyzer), and then contact Microsoft support.

## Network real-time inspection for macOS

> [!IMPORTANT]
> Some information relates to pre-released product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

The network real-time inspection (NRI) for macOS feature enhances real-time protection (RTP) by using [behavior monitoring](behavior-monitor-macos.md) in concert with file, process, and other events to detect suspicious activity. Behavior monitoring triggers both telemetry and sample submissions on suspicious files for Microsoft to analyze from the cloud protection backend, and is delivered to the client device, resulting in a removal of the threat.

### Is there an impact on performance?

NRI should have a low impact on network performance. Instead of holding the connection and blocking, NRI makes a copy of the packet as it crosses the network, and NRI performs an asynchronous inspection.

> [!NOTE]
> When network real-time inspection (NRI) for macOS is enabled, you might see a slight increase in memory utilization. 

### Requirements for NRI for macOS

- The device must be onboarded to Microsoft Defender for Endpoint.
- Preview features must be turned on in the [Microsoft Defender portal](https://security.microsoft.com).
- The device must be in the Beta channel (formerly `InsiderFast`).
- The minimum version number for Defender for Endpoint version number must be Beta (Insiders-Fast): [101.24092.0004](/defender-endpoint/mac-whatsnew#oct-2024-build-101240920004---release-version-2012409240) or newer. The version number refers to the `app version` (also known as Platform update).
- Real-time protection must be enabled.
- Behavior monitoring must be enabled.
- Cloud-delivered protection must be enabled.
- The device must be explicitly enrolled into the preview.

### Deployment instructions for NRI for macOS

1. E-mail us at `NRIonMacOS@microsoft.com` with information about your Microsoft Defender for Endpoint OrgID where you would like to have network real-time inspection (NRI) for macOS enabled. 

   > [!IMPORTANT]
   > In order to evaluate NRI for macOS, send email to `NRIonMacOS@microsoft.com`. Include your Defender for Endpoint Org ID. We're enabling this feature on a per-request basis for each tenant.
 
2. Enable behavior monitoring if it's not already enabled:

   ```Bash
   sudo mdatp config behavior-monitoring --value enabled   
   ```
 
1. Enable network protection in block mode:

   ```Bash
   sudo mdatp config network-protection enforcement-level --value block
   ```
   
1. Enable network real-time inspection (NRI):

   ```Bash
   sudo mdatp network-protection remote-settings-override set --value "{\"enableNriMpengineMetadata\" : true}"
   ```
   
   > [!NOTE]
   > While this feature is in preview, and because the setting is set by using command line, network real-time inspection (NRI) doesn't persist following reboots. You must re-enable it.
   
