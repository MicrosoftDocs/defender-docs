---
title: Selective response actions for Tier-0 and high value assets (private preview)
description: Learn how to configure selective response actions for Tier-0 and high value assets (private preview).
ms.topic: how-to
ai-usage: ai-assisted
---

# Selective response actions for Tier-0 and high value assets (private preview)


## Contents

- Background: restricting intrusive actions on high-value assets (HVAs)
- Onboarding devices with restricted actions

- ### Step 1: Enable restriction options for security operations
- ### Step 2: Create a new onboarding package
- ### Step 3: Download the deployment tool package
- ### Step 4: Deploy the onboarding package to the target machine
- Offboarding process
- ### Step 1: Create and download an offboarding package
- ### Step 2: Extract the package on the target machine and run the offboarding script
- Troubleshooting
- FAQ

## Background: restricting intrusive actions on high-value assets (HVAs)

Deploying Microsoft Defender for Endpoint on high-value assets (HVAs), such as domain controllers,
ADFS servers, and other Tier 0 systems, introduces operational risk due to the powerful actions available to privileged users (for example, isolating devices, executing scripts, or initiating live response sessions). If these capabilities are misused, either unintentionally or due to compromised accounts, they can cause significant disruption to critical infrastructure.

In addition, organizations enforcing privileged access management often prohibit cloud-based admin privileges on Tier 0 systems.

To mitigate these risks, we are introducing controls that restrict or customize high-impact security operations on HVAs. This new capability reduces the risk of accidental or malicious disruption by limiting the intrusive actions that can be performed on Tier 0 assets.

## Onboarding devices with restricted actions

Onboarding a device with restricted response actions involves the following steps:

1. Enabling the feature.
1. Creating a new onboarding package using the Defender deployment tool (DDT). Part of creating the

    package involves choosing which security operations to allow.
1. Downloading the onboarding package.
1. Deploying the onboarding package to the target machine.

## Enable restriction options for security operations

1. In the Defender portal, go to: System > Endpoints > Advanced features
1. Select the "Allow restricted operations during onboarding" to enable the restricted security

    operations options when creating Defender deployment packages for Windows. These restrictions
    limit the actions that can be performed on onboarded devices.

### Step 2: Create a new onboarding package

1. In the Defender portal, go to: System > Endpoints > Onboarding.
1. Under Defender deployment tool (preview), select Onboard.
1. The Generate Defender deployment tool with an access key page appears.

    - Provide a name for the package. Be sure to create a name that is unique and descriptive.
    - Select the desired security operations mode:
- Full Control: Grants full access to security operations. This mode is selected by default. Itis the recommended mode for standard devices that are not considered high-value assets.

- Restricted: Limits high-impact security operations to protect sensitive or high-value
    assets. Select this mode to enforce stricter security boundaries.

> [!NOTE] Devices onboarded in restricted mode do not support the execution of Live Response scripts, even when Live Response is enabled. This restriction is enforced by design to ensure script-based actions remain blocked, maintaining a higher level of protection for sensitive assets.

The following table describes the restriction capabilities that can be enabled or disabled when
Restricted mode is selected.

| Capability | Security operations | Remarks |
|---|---|---|
| Basic response | When selected, supports the following capabilities: <br>- Run antivirus scan <br>- Collect file <br>- Collect investigation package | The **Collect file** capability refers to retrieving a file from the File page in the portal. It isn't the GetFile command available under Live Response. |
| Advanced response | When selected, supports the following capabilities: <br>- Isolate device <br>- Restrict app execution <br>- Request remediation | **Request remediation** allows security administrators to initiate remediation actions for identified vulnerabilities on a specific device. |
| Live response | When selected, allows live response sessions to the remote device. | |
| Device protection | When selected, allows automatic incident response (AIR). | |

For the purposes of this walk-through:

    - Select Restricted mode.
    - Deselect the Live response capability. This means that live response sessions won't be

         allowed on the onboarded device.
    - Set the package expiration period. In our case 7 days.
The following image shows an example of a package configuration for the purposes of this walk-through.

1. When you've configured the package, select Generate.

### Step 3: Download the deployment tool package

When the package is ready, you see a page that has the package key and a download button, as the following image:

1. Copy the key and save it, as it will be needed with the deployment tool. Note: It is important to
    copy the key at this point because you will not be able to access it again.

1. After you've copied the key and saved it, select Download deployment tool.

### Step 4: Deploy the onboarding package to the target machine

1. Copy the deployment tool executable to the machine you want to onboard with the restricted
    security operation.

1. Run the deployment tool executable. The following window will open and click Continue.

1. Enter the Defender deployment tool key that is associated with the package and click Continue.

1. You can also use the command line to run the deployment tool with parameters

      <the_name_of_the_package_you_created>.exe -key:"<the_key_you_copied>"
      E.g.
      C:\packages>Disable_Live_Response.exe -key:fGGRtby2rlQrmyfU_XPMT_PpjBXIJ0asneHHLXaRIsE

    More information about Defender Deployment Tool deployments for non-interactive use and for
    large scale deployment available at Deploy Microsoft Defender endpoint security to Windows
    devices using the Defender deployment tool (preview) - Microsoft Defender for Endpoint |
    Microsoft Learn
1. Wait until installation is complete, and then select OK. No device reboot is required.

1. Check the portal and see that the onboarded machine has restricted security operations as per
    the settings.
    On the Device Inventory page, you'll now see a new property called Security operations. This
    field indicates the onboarding mode of each device:
    - If the device is onboarded with full functionality, the value will show as Full.
    - If the device is onboarded with restricted capabilities, the value will show as Restricted,
         indicating to the admin that this device has a limited set of remote security operations
         available.
This visibility helps security teams quickly understand the operational scope for each device and take appropriate actions when needed.

The Device page now includes a Security operations status to reflect the level of remote security capabilities configured for the device:
- Full: Indicates the device is onboarded with the complete set of Microsoft Defender for

    Endpoint capabilities. All remote response actions are available.
- Restricted: Indicates the device is onboarded with a limited set of capabilities, typically for

    Tier 0 or high-value assets, to reduce operational risk.
When the device is in Restricted mode, a tag labeled Restricted security operations is automatically added to the device to help security teams quickly identify assets with limited functionality. To access a detailed list of all security controls and their current status (enabled or disabled) on the device, select View security operations information.

Advanced Hunting: A new property, RestrictedDeviceSecurityOperations, has been added to the DeviceInfo table to indicate which security operations are restricted on the device. The values represent the specific security operation categories that are limited.
For example, if the value of RestrictedDeviceSecurityOperations is LiveResponse, it means that only the Live Response capability is restricted on the device, while all other operations remain enabled.

## Offboarding process

Once a device is onboarded with restricted settings, its security operations configuration can't be changed or modified, neither from the Microsoft Defender portal nor locally on the device. To update the device's response capabilities, you must first offboard the device and then re-onboard it using a new installation package that includes the desired settings. This section describes how to offboard the device.
Offboarding the device involves the following steps:
1. Creating and downloading an offboarding package.
1. Transferring the offboarding package to the target machine and extracting the package there.
1. Running the offboarding script using the defender deployment tool.

### Step 1: Create and download an offboarding package

To begin the offboarding process:
1. From the Defender portal, navigate to: Settings > Endpoints > Offboarding.
1. Under Select operating system to start offboarding process, select Windows (Preview).
1. Under Defender deployment tool (preview), select Download package to retrieve the

    offboarding script.

### Step 2: Extract the package on the target machine and run the offboarding script

After downloading the offboarding package to your local machine:
1. Locate the package:

    - Find the .zip file you downloaded to your local machine from the Defender portal.
1. Transfer the package to the target machine and extract it:

    a. Copy the .zip file to the target device you want to offboard.
    b. Extract the .zip file to make the .offboarding file available.
1. Run the offboarding command:
    a. Open Command Prompt as Administrator.
    b. Navigate to the folder where the package was extracted.
    c. Run the following command using the defender deployment tool using the following syntax:
         <PackageExecutable>.exe -offboard -file:<PathToOffboardingFile>
         Example:

            C:\Packages>Disable_Live_Response.exe -offboard -file:WindowsDefenderATP_valid_until_2025-11-
            12.offboarding

    d. When prompted "Are you sure you want to offboard? Yes(Y)/No(N)", type y to proceed.
    The offboarding process will conclude with the following message: Microsoft Defender
    deployment tool completed, exit code: 0 [Success]

## Troubleshooting

You can reference the Defender deployment tool log to understand if there were any issues during installation and onboarding. The deployment tool log is located at:
C:\ProgramData\Microsoft\DefenderDeploymentTool\DefenderDeploymentTool-
<COMPUTERNAME>.log
Events will also be written to the following Windows event logs:

    - Onboarding: Windows Logs > Application > Source: WDATPOnboarding
    - Offboarding: Windows Logs > Application > Source: WDATPOffboarding
For more information, see /defender-endpoint/defender-deployment-tool-windows#troubleshooting

## Frequently asked questions (FAQ)

**Question 1: Which operating systems are supported for onboarding devices in restricted mode?**

Answer: Restricted mode is supported on Windows client workstations and Windows Server

operating systems running Sense version 10.8798 or later

OS                                 KB
Windows Server 2025, all editions  KB5063878
Windows Server 2022                KB5063880
Windows Server 2019                KB5063877
Windows 10 22H2                    KB5062649
Windows 11 23H2                    KB5062663
Windows 11 24H2                    KB5062660
Windows 11 25H2                    All

**Question 2: How long does it take until an onboarded device appears in the Defender portal?**
Answer: In most cases, an onboarded device appears in the Defender portal within a few minutes.
Full data population and telemetry visibility can take up to 1 hour.

**Question 3: Can I change a device from restricted mode to full capabilities after onboarding, or edit the restriction settings?**
Answer: After a device is onboarded in restricted mode, changing the restriction settings or switching to Full mode requires offboarding the device and re-onboarding it using a new deployment package.
The device ID remains the same, and all historical data are preserved.

**Question 4: Is using a "Limited" package with all response actions allowed the same as "Full" mode?**
Answer: No. Even if all response actions are allowed, onboarding a device using a "Limited" (restricted) package is not the same as Full mode.
In restricted mode, running scripts is disabled by design. Full mode provides unrestricted access to all supported response actions and capabilities.

**Question 5: Does restricted mode affect alert generation or detection capabilities?**
Answer: No. Restricted mode does not reduce detection, alerting, or sensor coverage. All alerts, timelines, and threat detections continue to function normally.

**Question 6: How can I verify whether a device is onboarded in restricted mode?**
Answer: You can verify a device's onboarding mode directly in the Defender portal on the device page under the "Security operations" section. Devices onboarded in restricted mode are automatically tagged with "Restricted security operations".
In addition, a new property, RestrictedDeviceSecurityOperations, is available in the DeviceInfo table in Advanced Hunting, allowing you to programmatically identify devices onboarded in restricted mode.
**Question 7: Is there a relationship between restricted mode and devices classified as High Value?**
Answer: No. Devices classified as High Value use an organization-defined tag to identify critical assets such as Domain Controllers, internet-facing machines, or executive devices.
Restricted mode is independent of High Value classification and can be applied to High Value devices,
Tier-0 assets, or any other devices where you want to restrict remote response security operations.

**Question 8: I have a device that is already onboarded to MDE. How can I restrict remote response security operations?**
Answer: You must first offboard the device and then re-onboard it using an onboarding package configured with restricted settings. The device ID remains the same, and all historical data are preserved.