---
title: Troubleshoot device discovery and authenticated network scans in Microsoft Defender for Endpoint
description: Learn how to troubleshoot device discovery and authenticated network scans in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.subservice: onboard
f1.keywords:
- NOCSH
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: how-to
search.appverid: met150
ms.date: 01/12/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 2

---
# Troubleshoot device discovery and authenticated network scans in Microsoft Defender for Endpoint

[Device discovery](device-discovery.md) allows you to improve your visibility into unmanaged devices, assess their security posture, and take appropriate actions to secure them.

[Authenticated network scans](device-discovery.md#authenticated-network-scans) allow you to scan specific network devices, especially in scenarios where you want to scan a specific subnet.

This article includes troubleshooting information for device discovery and authenticated network scans.

## Security tool raises alert on UnicastScanner.ps1 / PSScript_{GUID}.ps1 or port scanning activity initiated by the security tool

The active probing scripts are signed by Microsoft and are safe. You can add the following path to your exclusion list:

`C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\*.ps1`

## Scanner installation failed

Verify that the required URLs are added to the allowed domains in your firewall settings. Also, make sure proxy settings are configured as described in [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md).

## The Microsoft.com/devicelogin web page didn't show up

Verify that the required URLs are added to the allowed domains in your firewall. Also, make sure proxy settings are configured as described in [Configure device proxy and Internet connectivity settings](configure-proxy-internet.md).

## Network devices aren't shown in the device inventory after several hours

The scan results should be updated a few hours after the initial scan that took place after completing the network device authenticated scan configuration.

If devices are still not shown, verify that the service `MdatpNetworkScanService` is running on your devices being scanned, on which you installed the scanner, and perform a "Run scan" in the relevant network device authenticated scan configuration.

If you still don't get results after 5 minutes, restart the service.

## Devices last seen time is longer than 24 hours

Validate that the scanner is running properly. Then go to the scan definition and select "Run test." Check what error messages are returning from the relevant IP addresses.

## My scanner is configured but scans aren't running

As the authenticated scanner currently uses an encryption algorithm that isn't compliant with [Federal Information Processing Standards (FIPS)](/windows/security/threat-protection/security-policy-settings/system-cryptography-use-fips-compliant-algorithms-for-encryption-hashing-and-signing/), the scanner can't operate when an organization enforces the use of FIPS compliant algorithms.

To allow algorithms that aren't compliant with FIPS, set the following value in the registry for the devices where the scanner runs:

Computer`\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy` with a DWORD value named `Enabled` and value of `0x0`.

FIPS compliant algorithms are only used in relation to departments and agencies of the United States federal government.

## Required Defender Vulnerability Management user permission

Registration finished with an error: "It looks like you don't have sufficient permissions for adding a new agent. The required permission is 'Manage security settings in Defender'."

Press any key to exit.

Ask your system administrator to assign you the required permissions. Alternately, ask another relevant member to help you with the sign-in process by providing them with the sign-in code and link.

## Registration process fails using provided link in the command line in registration process

Try a different browser or copy the sign-in link and code to a different device.

## Text too small or can't copy text from command line

Change command-line settings on your device to allow copying and change text size.

## Unmanaged device health state is always "Active".

Temporarily, unmanaged device health state is "Active" during the standard retention period of the device inventory, regardless of their actual state.