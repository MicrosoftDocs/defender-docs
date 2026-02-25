---
title: Set up authenticated network scans in Microsoft Defender for Endpoint
description: Set up authenticated network scans to discover network devices in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
search.appverid: met150
ms.date: 01/12/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Vulnerability Management

---
# Set up authenticated network scans in Microsoft Defender for Endpoint

Authenticated network scans provide an agentless way to discover and assess network infrastructure devices, such as switches, routers, WLAN controllers, firewalls, and VPN gateways.

For more information, see [Authenticated network scans](device-discovery.md#authenticated-network-scans).

> [!NOTE]
> The Windows authenticated scan is deprecated from December 18,2025. For more information, see [Windows authenticated scan deprecation FAQs](/defender-vulnerability-management/defender-vulnerability-management-faq#windows-authenticated-scan-deprecation-faqs).

## Prerequisites

To configure scan jobs, you need the **Manage security settings in Defender** permission. For more information, see [Create and manage roles for role-based access control](user-roles.md). 

### Supported operating systems

- Cisco IOS, IOS-XE, NX-OS
- Fortinet FortiOS
- Juniper JUNOS
- HPE Aruba Networking ArubaOS, AOS-CX
- HPE ArubaOS, Procurve Switch Software
- Palo Alto Networks PAN-OS

We recommend that you configure all your network devices, even if they're not specified in this list.

#### Supported Windows versions for the scanner

The scanner is supported on Windows 10, version 1903 and Windows Server, version 1903 and later. For more information, see [Windows 10, version 1903 and Windows Server, version 1903](https://support.microsoft.com/topic/windows-10-update-history-e6058e7c-4116-38f1-b984-4fcacfba5e5d)

> [!NOTE]
> You can install up to 40 scanners per tenant.

## Select scanner device

To select a device that performs the authenticated network scans:

- Decide on a Defender for Endpoint onboarded device (client or server) that has a network connection to the management port for the network devices you plan on scanning.

- Allow SNMP traffic between the Defender for Endpoint scanning device and the targeted network devices (for example, by the firewall).

- Decide which network devices are assessed for vulnerabilities (for example, a Cisco switch or a Palo Alto Networks firewall).

- Make sure SNMP read-only is enabled on all configured network devices to allow the Defender for Endpoint scanning device to query the configured network devices. `SNMP write` isn't needed for the proper functionality of this feature.

- Obtain the IP addresses of the network devices to be scanned (or the subnets where these devices are deployed).

- Obtain the SNMP credentials of the network devices (for example, Community String, noAuthNoPriv, authNoPriv, authPriv). You need to provide the credentials when configuring a new scan job.

- Proxy client configuration: No extra configuration is required other than the Defender for Endpoint device proxy requirements.

- To allow the scanner to be authenticated and work properly, add the following domains/URLs:

    - `*.security.microsoft.com`
    - `login.microsoftonline.com`
    - `*.blob.core.windows.net/networkscannerstable/*`

    > [!NOTE]
    > Not all URLs are specified in the Defender for Endpoint documented list of allowed data collection.

## Install the scanner

1. In the Microsoft Defender Portal, select **Settings** \> **Device discovery** \> **Authenticated scans**.

1. Download the scanner and install it on the designated Defender for Endpoint scanning device.

   :::image type="content" source="/defender/media/defender-endpoint/network-authenticated-scan-new.png" alt-text="Screenshot of the add new authenticated scan screen." lightbox="/defender/media/defender-endpoint/network-authenticated-scan-new.png":::

## Register the scanner

You can complete the registration on the designated scanning device or any other device (for example, your personal client device).

The account the user signs in with and the device used to complete the sign in process, must be in the same tenant where the device is onboarded to Microsoft Defender for Endpoint.

To complete the scanner registration process:

1. Copy and follow the URL that appears on the command line and use the provided installation code to complete the registration process. You might need to change command prompt settings to copy the URL.

1. Type the code and sign in using a Microsoft account that has the **Manage security settings in Defender** permission.

When finished, you should see a message confirming you've signed in.

> [!NOTE]
> A scheduled task that searches for updates runs regularly. When the task runs, it compares the version of the scanner on the client device to the version of the agent on the update location. The update location is where Windows looks for updates, such as on a network share or from the internet.
>
> If there's a difference between the two versions, the update process determines which files are different and need to be updated on the local computer. Once the required updates are determined, the downloading of the updates start.

## Configure a new authenticated network scan

1. In the Microsoft Defender Portal, select **Settings** \> **Device discovery** \> **Authenticated scans**.

1. Select **Add new scan** and choose **Network device authenticated scan** and select **Next**.

   :::image type="content" source="/defender/media/defender-endpoint/network-authenticated-scan.png" alt-text="Screenshot of the add new network device authenticated scan screen." lightbox="/defender/media/defender-endpoint/network-authenticated-scan.png":::

1. Select whether to **Activate scan**.

1. Type a **Scan name**.

1. Select the **Scanning device:** The onboarded device you use to scan the network devices.

1. Type the **Target (range):** The IP address ranges or hostnames you want to scan. You can either enter the addresses or import a CSV file. Importing a file overrides any manually added addresses.

1. Select the **Scan interval:** By default, the scan runs every four hours. You can change the scan interval or have it only run once, by selecting **Don't repeat**.

1. Select your **Authentication method**.

   You can select to **Use azure KeyVault for providing credentials:** If you manage your credentials in Azure KeyVault, you can type the Azure KeyVault URL and Azure KeyVault secret name to be accessed by the scanning device to provide credentials. The secret value is dependent on the method you choose, as described in the following table:

   |Authentication Method|Azure KeyVault secret value|
   |:----|:----:|
   |`AuthPriv`|Username;AuthPassword;PrivPassword|
   |`AuthNoPriv`|Username;AuthPassword|
   |`CommunityString` |CommunityString|

1. Select **Next** to run or skip the test scan.

1. Select **Next** to review the settings and the select **Submit** to create your new network device authenticated scan.

> [!NOTE]
> To prevent device duplication in the network device inventory, make sure each IP address is configured only once across multiple scanning devices.

### Scan and add network devices

During the setup process, you can perform a one time test scan to verify that:

- There's connectivity between the Defender for Endpoint scanning device and the configured target network devices.
- The configured SNMP credentials are correct.

Each scanning device can support up to 1,500 successful IP addresses scan. For example, if you scan 10 different subnets where only 100 IP addresses return successful results, you can scan 1,400 IP more addresses from other subnets on the same scanning device.

If there are multiple IP address ranges/subnets to scan, the test scan results take several minutes to show up. A test scan is available for up to 1,024 addresses.

When the results are displayed, you can choose which devices to include in the periodic scan. If you skip viewing the scan results, all configured IP addresses are added to the network device authenticated scan (regardless of the device's response). The scan results can also be exported.

## View network devices in the device inventory

Newly discovered devices are displayed under the device inventory in the new **Network devices** tab. It might take up to two hours after adding a scanning job until the devices are updated.

:::image type="content" source="/defender/media/defender-endpoint/network-devices-inventory.png" alt-text="Screenshot of the network device tab in the device inventory." lightbox="/defender/media/defender-endpoint/network-devices-inventory.png":::

## Troubleshoot

If you encounter issues when setting up authenticated network scans, see [Troubleshoot device discovery and authenticated network scans](troubleshoot-device-discovery-network-scans.md).

### Scanner installation failed

Verify that the required URLs are added to the allowed domains in your firewall settings. Also, make sure proxy settings are configured as described in [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md).

### The Microsoft.com/devicelogin web page didn't show up

Verify that the required URLs are added to the allowed domains in your firewall. Also, make sure proxy settings are configured as described in [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md).

### Network devices aren't shown in the device inventory after several hours

The scan results should be updated a few hours after the initial scan that took place after completing the network device authenticated scan configuration.

If devices are still not shown, verify that the service `MdatpNetworkScanService` is running on your devices being scanned, on which you installed the scanner, and perform a "Run scan" in the relevant network device authenticated scan configuration.

If you still don't get results after 5 minutes, restart the service.

### Devices last seen time is longer than 24 hours

Validate that the scanner is running properly. Then go to the scan definition and select "Run test." Check what error messages are returning from the relevant IP addresses.

### My scanner is configured but scans aren't running

As the authenticated scanner currently uses an encryption algorithm that isn't compliant with [Federal Information Processing Standards (FIPS)](/windows/security/threat-protection/security-policy-settings/system-cryptography-use-fips-compliant-algorithms-for-encryption-hashing-and-signing/), the scanner can't operate when an organization enforces the use of FIPS compliant algorithms.

To allow algorithms that aren't compliant with FIPS, set the following value in the registry for the devices where the scanner runs:

Computer`\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy` with a DWORD value named `Enabled` and value of `0x0`.

FIPS compliant algorithms are only used in relation to departments and agencies of the United States federal government.

### Required Defender Vulnerability Management user permission

Registration finished with an error: "It looks like you don't have sufficient permissions for adding a new agent. The required permission is 'Manage security settings in Defender'."

Press any key to exit.

Ask your system administrator to assign you the required permissions. Alternately, ask another relevant member to help you with the sign-in process by providing them with the sign-in code and link.

### Registration process fails using provided link in the command line in registration process

Try a different browser or copy the sign-in link and code to a different device.

### Text too small or can't copy text from command line

Change command-line settings on your device to allow copying and change text size.

## Related articles

- [Device inventory](machines-view-overview.md)

