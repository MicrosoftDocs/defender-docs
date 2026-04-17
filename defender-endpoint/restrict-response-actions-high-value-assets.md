---
title: Restrict response actions on high-value assets (preview)
description: Learn how to onboard Tier-0 and high-value assets with restricted security operations in Microsoft Defender for Endpoint to reduce operational risk.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: amibarayev
ms.localizationpriority: medium
ms.date: 04/15/2026
ms.topic: how-to
# customer intent: As a security admin, I want to restrict response actions on high-value assets I'm onboarding to reduce operational risk.
---

# Restrict response actions on high-value assets (preview)

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](https://go.microsoft.com/fwlink/?linkid=2154037)
- [Microsoft Defender XDR](https://go.microsoft.com/fwlink/?linkid=2118804)

## Overview

Deploying Microsoft Defender for Endpoint on high-value assets (HVAs), such as domain controllers, ADFS servers, and other Tier-0 systems, introduces operational risk due to the powerful actions available to privileged users. Capabilities such as isolating devices, executing scripts, or initiating live response sessions can cause significant disruption to critical infrastructure if misused—either unintentionally or due to compromised accounts.

In addition, organizations enforcing privileged access management often prohibit cloud-based admin privileges on Tier-0 systems.

To mitigate these risks, you can restrict or customize high-impact security operations on HVAs. This capability reduces the risk of accidental or malicious disruption by limiting the intrusive actions that can be performed on Tier-0 assets.

## Prerequisites

- Windows devices running Sense version **10.8798 or later**
- One of the following supported operating systems:

  | Operating system | Required KB |
  |---|---|
  | Windows Server 2025 (all editions) | KB5063878 |
  | Windows Server 2022 | KB5063880 |
  | Windows Server 2019 | KB5063877 |
  | Windows 10 22H2 | KB5062649 |
  | Windows 11 23H2 | KB5062663 |
  | Windows 11 24H2 | KB5062660 |
  | Windows 11 25H2 | All |

## Onboard devices with restricted response actions

Onboarding a device with restricted response actions involves the following steps:

1. Enable the restricted operations option in the Defender portal.
2. Create a new onboarding package using the Defender deployment tool (DDT) and choose which security operations to allow.
3. Download the deployment tool package.
4. Deploy the onboarding package to the target machine.

### Step 1: Enable restriction options for security operations

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Advanced features**.
2. Turn on **Allow restricted operations during onboarding**. This makes the restricted security operations options available when creating Defender deployment packages for Windows. These restrictions limit the actions that can be performed on onboarded devices.

### Step 2: Create a new onboarding package

1. In the Defender portal, go to **Settings** > **Endpoints** > **Onboarding**.
2. Under **Defender deployment tool (preview)**, select **Onboard**.
3. On the **Generate Defender deployment tool with an access key** page, configure the following settings:

   - **Name**: Provide a unique and descriptive name for the package.
   - **Security operations mode**: Select one of the following modes:

     | Mode | Description |
     |---|---|
     | **Full Control** | Grants full access to security operations. This mode is selected by default and is the recommended mode for standard devices that aren't considered high-value assets. |
     | **Restricted** | Limits high-impact security operations to protect sensitive or high-value assets. Select this mode to enforce stricter security boundaries. |

   > [!NOTE]
   > Devices onboarded in Restricted mode don't support the execution of Live Response scripts, even when Live Response is enabled. This restriction is enforced by design to ensure script-based actions remain blocked, maintaining a higher level of protection for sensitive assets.

4. When **Restricted** mode is selected, configure the following restriction capabilities:

   | Capability | Security operations | Remarks |
   |---|---|---|
   | **Basic response** | Run antivirus scan, Collect file, Collect investigation package | The *Collect file* capability refers to retrieving a file from the **File** page in the portal. It isn't the `GetFile` command available under Live Response. |
   | **Advanced response** | Isolate device, Restrict app execution, Request remediation | *Request remediation* allows security administrators to initiate remediation actions for identified vulnerabilities on a specific device. |
   | **Live response** | Allows live response sessions to the remote device | — |
   | **Device protection** | Allows automatic incident response (AIR) | — |

5. Set the **package expiration period** as needed.
6. Select **Generate**.

### Step 3: Download the deployment tool package

When the package is ready, a page appears displaying the package key and a download button.

1. Copy the key and save it. You need this key when running the deployment tool.

   > [!IMPORTANT]
   > Copy the key at this point. You won't be able to access it again after navigating away from this page.

2. Select **Download deployment tool**.

### Step 4: Deploy the onboarding package to the target machine

1. Copy the deployment tool executable to the machine you want to onboard.
2. Run the deployment tool executable. In the window that opens, select **Continue**.
3. Enter the Defender deployment tool key associated with the package and select **Continue**.

   Alternatively, you can use the command line to run the deployment tool with parameters:

   ```cmd
   <PackageName>.exe -key:"<YourKey>"
   ```

   For example:

   ```cmd
   C:\packages>Disable_Live_Response.exe -key:fGGRtby2rlQrmyfU_XPMT_PpjBXIJ0asneHHLXaRIsE
   ```

   > [!TIP]
   > For non-interactive and large-scale deployments, see [Deploy Microsoft Defender endpoint security to Windows devices using the Defender deployment tool (preview)](/defender-endpoint/defender-deployment-tool-windows).

4. Wait until installation is complete, then select **OK**. No device reboot is required.

### Verify the onboarding mode

After the device is onboarded, you can verify the security operations mode in several ways:

- **Device Inventory page**: A **Security operations** column shows **Full** or **Restricted** for each device.
- **Device page**: A **Security operations status** section reflects the configured level of remote security capabilities. Devices in Restricted mode are automatically tagged with **Restricted security operations**. Select **View security operations information** to see a detailed list of all security controls and their current status.
- **Advanced Hunting**: A new property, `RestrictedDeviceSecurityOperations`, is available in the `DeviceInfo` table to identify which security operations are restricted on the device. For example, if the value is `LiveResponse`, only the Live Response capability is restricted while all other operations remain enabled.

## Changing a device's security operations configuration

Once a device is onboarded with restricted settings, its security operations configuration can't be changed or modified—neither from the Defender portal nor locally on the device. To update the device's response capabilities, you must first offboard the device and then re-onboard it using a new installation package with the desired settings.

> [!NOTE]
> The device ID remains the same after offboarding and re-onboarding, and all historical data is preserved.

For information about how to offboard a device, see 

### Step 1: Create and download an offboarding package

1. In the Defender portal, go to **Settings** > **Endpoints** > **Offboarding**.
2. Under **Select operating system to start offboarding process**, select **Windows (Preview)**.
3. Under **Defender deployment tool (preview)**, select **Download package** to retrieve the offboarding script.

### Step 2: Deploy and run the offboarding script

1. Transfer the downloaded `.zip` file to the target device.
2. Extract the `.zip` file to make the `.offboarding` file available.
3. Open **Command Prompt** as Administrator.
4. Navigate to the folder where the package was extracted.
5. Run the following command:

   ```cmd
   <PackageExecutable>.exe -offboard -file:<PathToOffboardingFile>
   ```

   For example:

   ```cmd
   C:\Packages>Disable_Live_Response.exe -offboard -file:WindowsDefenderATP_valid_until_2025-11-12.offboarding
   ```

6. When prompted **Are you sure you want to offboard? Yes(Y)/No(N)**, type `Y` to proceed.

   The offboarding process concludes with the message: `Microsoft Defender deployment tool completed, exit code: 0 [Success]`.

## Troubleshooting

You can reference the Defender deployment tool log to identify issues during installation and onboarding. The log is located at:

```
C:\ProgramData\Microsoft\DefenderDeploymentTool\DefenderDeploymentTool-<COMPUTERNAME>.log
```

Events are also written to the following Windows event logs:

| Event type | Location |
|---|---|
| Onboarding | **Windows Logs** > **Application** > Source: `WDATPOnboarding` |
| Offboarding | **Windows Logs** > **Application** > Source: `WDATPOffboarding` |

For more information, see [Troubleshoot Defender deployment tool issues](/defender-endpoint/defender-deployment-tool-windows#troubleshooting).

## Frequently asked questions

### How long does it take for an onboarded device to appear in the portal?

In most cases, an onboarded device appears in the Defender portal within a few minutes. Full data population and telemetry visibility can take up to 1 hour.

### Can I change a device from restricted mode to full capabilities after onboarding?

No. After a device is onboarded in restricted mode, changing the restriction settings or switching to Full mode requires offboarding the device and re-onboarding it using a new deployment package. The device ID remains the same, and all historical data is preserved.

### Is using a Restricted package with all response actions enabled the same as Full mode?

No. Even if all response actions are allowed, onboarding a device using a Restricted package isn't the same as Full mode. In restricted mode, running scripts is disabled by design. Full mode provides unrestricted access to all supported response actions and capabilities.

### Does restricted mode affect alert generation or detection capabilities?

No. Restricted mode doesn't reduce detection, alerting, or sensor coverage. All alerts, timelines, and threat detections continue to function normally.

### How can I verify whether a device is onboarded in restricted mode?

You can verify a device's onboarding mode directly in the Defender portal on the device page under the **Security operations** section. Devices onboarded in restricted mode are automatically tagged with **Restricted security operations**. Additionally, the `RestrictedDeviceSecurityOperations` property in the `DeviceInfo` table in Advanced Hunting allows you to programmatically identify devices onboarded in restricted mode.

### Is there a relationship between restricted mode and devices classified as High Value?

No. Devices classified as *High Value* use an organization-defined tag to identify critical assets such as domain controllers, internet-facing machines, or executive devices. Restricted mode is independent of High Value classification and can be applied to any devices where you want to restrict remote response security operations.

### How do I restrict response actions on a device that's already onboarded?

You must first offboard the device and then re-onboard it using an onboarding package configured with restricted settings. The device ID remains the same, and all historical data is preserved.

## Related content

- [Deploy Microsoft Defender endpoint security using the Defender deployment tool (preview)](/defender-endpoint/defender-deployment-tool-windows)
- [Onboard devices to Microsoft Defender for Endpoint](/defender-endpoint/onboard-configure)
- [Take response actions on a device](/defender-endpoint/respond-machine-alerts)
