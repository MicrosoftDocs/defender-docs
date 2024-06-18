---
title: Behavior Monitoring in Microsoft Defender Antivirus on macOS
description: Behavior Monitoring in Microsoft Defender Antivirus on macOS
author: YongRhee-MSFT
ms.author: yongrhee
manager: deniseb
ms.service: defender-endpoint
ms.topic: overview
ms.date: 05/29/2024
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
- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)
- Microsoft Defender Antivirus
- Supported [versions of macOS](/defender-endpoint/microsoft-defender-endpoint-mac)

> [!IMPORTANT]
> Some information relates to pre-released product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

## Prerequisites

- Device is onboarded to Microsoft Defender for Endpoint.
- [Preview features](/defender-endpoint/preview) is enabled in the Microsoft XDR portal ([https://security.microsoft.com](https://security.microsoft.com)).
- Device must be in the [Beta channel](/defender-endpoint/mac-updates) (formerly InsiderFast).
- Minimal Microsoft Defender for Endpoint version number must be Beta (Insiders-Fast): 101.24042.0002 or newer. Version number refers to the **app_version** (also known as **Platform update**).
- Ensure that Real-Time Protection (RTP) is enabled.
- Ensure [cloud-delivered protection](/defender-endpoint/mac-preferences) is enabled.
- Device must be explicitly enrolled into the preview.

## Overview

Behavior monitoring monitors process behavior to detect and analyze potential threats based on the behavior of the applications, daemons, and files within the system. As behavior monitoring observes how the software behaves in real-time, it can adapt quickly to new and evolving threats and block them.

## Deployment instructions

To deploy behavior monitoring in Microsoft Defender for Endpoint on macOS, you must change the behavior monitoring policy using one of the following methods:

- [Intune](#intune-deployment)
- [JamF or other 3<sup>rd</sup> party MDM](#via-jamf-deployment)
- [Manually](#manual-deployment)

The following sections describe each of these methods in detail.

### Intune deployment

1. Copy the following XML to create a _.plist_ file and save it as **BehaviorMonitoring_for_MDE_on_macOS.mobileconfig**

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
           </array>
       </dict>
   </plist>
   ```

2. Open **Devices** > **Configuration profiles**.

3. Select **Create profile** and select **New Policy**.

4. Give the profile a name. Change **Platform=macOS** to **Profile type=Templates** and choose **Custom** in the template name section. Select **Configure**.

5. Go to the plist file you saved earlier and save it as `com.microsoft.wdav.xml`.

6. Enter `com.microsoft.wdav` as the **custom configuration profile name**.

7. Open the configuration profile and upload the `com.microsoft.wdav.xml` file and select **OK**.

8. Select **Manage** > **Assignments**. In the **Include** tab, select **Assign to All Users & All devices or to a Device Group or User Group.**

#### Via JamF deployment

1. Copy the following XML to create a _.plist_ file and save it as **Save as BehaviorMonitoring_for_MDE_on_macOS.plist**

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

2. In **Computers** > **Configuration Profiles**, select **Options** > **Applications & Custom Settings**,
3. Select **Upload File** (_.plist_ file).
4. Set preference domain to *com.microsoft.wdav*
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

### To test behavior monitoring (prevention/block) detection

See [Behavior Monitoring demonstration](demonstration-behavior-monitoring.md).

### Verifying Behavior Monitoring detection

The existing Microsoft Defender for Endpoint on macOS command line interface can be used to review behavior monitoring details and artifacts.

```bash
sudo mdatp threat list
```

### Frequently Asked Questions (FAQ)

#### What if I see an increase in cpu utilization or memory utilization?

Disable Behavior Monitoring and see if the issue goes away.

- If the issue doesn't go away, it is not related to Behavior Monitoring.
- If the issue goes away, take an aka.ms/xMDEClientAnalyzer and contact Microsoft support.
