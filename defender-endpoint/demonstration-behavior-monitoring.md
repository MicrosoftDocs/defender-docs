---
title: AV detection test for verifying device's onboarding and reporting services
description: AV detection test to verify the device's proper onboarding and reporting to the service.
ms.service: defender-endpoint
ms.author: siosulli
author: siosulli
ms.localizationpriority: normal
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
search.appverid: met150
ms.date: 01/31/2024
---

# Behavior Monitoring demonstration

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)

- [Microsoft Defender Antivirus](microsoft-defender-antivirus-windows.md)

- [Microsoft Defender for Individuals](https://www.microsoft.com/microsoft-365/microsoft-defender-for-individuals)

Scenario requirements and setup

- macOS

- Microsoft Defender Real-time protection is enabled

## Behavior Monitoring (BM) protection feature in Microsoft Defender Antivirus

Behavior Monitoring (BM) protection feature in Microsoft Defender Antivirus Monitors process behavior to detect and analyze potential threats based on the behavior of applications, services, and files. Rather than relying solely on content matching, which identifies known malware patterns), behavior monitoring focuses on observing how software behaves in real-time.

### macOS

1. Ensure that real-time protection (RTP) is enabled.

Open a Terminal window. Copy and execute the following command:


  ```bash
  mdatp health --field real_time_protection_enabled
  ```

When RTP is enabled, the result shows a value of 1.

1. Enable Behavior Monitoring for Microsoft Defender for Endpoint on macOS


   `Manually`
   
  ```bash
  sudo mdatp config behavior-monitoring --value enabled
  ```

The result should show "Configuration property updated."

_or_

              _If managed via “Settings Preferences” (aka Managed Preferences and policy):_

 

              _Via Intune:_


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

              _Via JAMF or other 3<sup>rd</sup> party MDM:_


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

3. Verify that Behavior Monitor is enabled


  ```bash
  mdatp health --details features
  ```
  
The result should show

behavior_monitoring "enabled"

4. Create a bash script

With your favorite script/text editor such as nano or Visual Studio Code (VS Code)


  ```bash
  #! /usr/bin/bash
  echo " " >> /tmp/9a74c69a-acdc-4c6d-84a2-0410df8ee480.txt 
  echo " " >>  /tmp/f918b422-751c-423e-bfe1-dbbb2ab4385a.txt 
  sleep 5
  ```

Save as BM_test.sh

5. Make the bash script executable


  ```bash
  sudo chmod u+x BM_test.sh
  ```
  
6. Run the bash script 


6. Run the bash script 


  ```bash
  sudo bash BM_test.sh
  ```

The result will show you:

zsh: killed      sudo bash BM_test.sh

1. The file has been quarantined by Defender for Endpoint on Mac. Use the following command to list all the detected threats:


```bash
mdatp threat list
```

The result will show you:

Id: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

Name: Behavior:MacOS/MacOSChangeFileTest

Type: "behavior"

Detection time: Tue May 7 20:23:41 2024

Status: "quarantined"

8. If you have Microsoft Defender for Endpoint P2/P1 or Microsoft Defender for Business, go to the Microsoft Defender XDR portal ([https://security.microsoft.com](https://security.microsoft.com)), and you will see an Alert named: "Suspicious 'MacOSChangeFileTest' behavior was blocked.

