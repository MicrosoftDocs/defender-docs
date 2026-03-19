---
title: Turn on network protection
description: Enable network protection with Group Policy, PowerShell, or Mobile Device Management and Configuration Manager.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 03/09/2026
ms.topic: how-to
author: paulinbar
ms.author: painbar
ms.reviewer: tdoucett
manager: bagol
ms.subservice: asr
ms.collection: 
- m365-security
- tier2
- mde-asr
search.appverid: met150
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender Antivirus
---

# Turn on network protection

[Network protection](network-protection.md) helps to prevent users from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the internet. You can [audit network protection](evaluate-network-protection.md) in a test environment to view which apps would be blocked before enabling network protection.

[Learn more about network filtering configuration options.](/intune/intune-service/protect/endpoint-protection-windows-10#network-filtering)

## Prerequisites

### Supported operating systems

- Windows
- Linux (See [Network protection for Linux](network-protection-linux.md))
- macOS (See [Network protection for macOS](network-protection-macos.md))

## Enable network protection

To enable network protection, you can use any of the methods described in this article.

### Microsoft Defender for Endpoint Security Settings Management

#### Create an endpoint security policy

> [!TIP]
> The following procedures require the **Security Administrator** role in Microsoft Entra ID.

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Endpoints** \> **Configuration management** \> **Endpoint security policies**. Or, to go directly to the **Endpoint Security Policies** page, use <https://security.microsoft.com/policy-inventory>.

2. On the **Windows policies** tab of the **Endpoint Security Policies** page, select **Create new policy**.

3. On the **Create a new policy** flyout that opens, configure the following settings:
   - **Select platform**: Select **Windows**.
   - **Select template**: Select **Microsoft Defender AntiVirus**.

   Select **Create policy**.

4. The **Create a new policy** wizard opens. On the **Basics** tab, configure the following settings:
   - **Name**: Enter a unique, descriptive name for the policy.
   - **Description**: Enter an optional description.

   Select **Next**.

5. On the **Configuration settings** tab, expand **Defender** and then select a value for **Enable network protection** based on operating system:

   - **Windows clients and Windows servers**: Available values are:
     - **Enabled (block mode)**: Block mode is needed to block IP address/URL indicators and Web Content Filtering.
     - **Enabled (audit mode)**
     - **Disabled (Default)**
     - **Not Configured**

   - **Windows Server 2016 and Windows Server 2012 R2**: You also need to configure the **Allow Network Protection Down Level** setting in the **Threat Severity Default Action** section. Available values are:
       - **Network protection will be enabled downlevel**
       - **Network Protection will be disabled downlevel. (Default)**
       - **Not configured**

   - Optional Network Protection settings for Windows clients and Windows servers:
     - **Allow Datagram Processing On Win Server**: Available values are:
       - **Datagram processing on Windows Server is enabled**
       - **Datagram processing on Windows Server is disabled (Default)**: We strongly recommend this value for any server roles that generate high volumes of UDP traffic. For example:
         - Domain Controllers
         - Windows DNS servers
         - Windows File Servers
         - Microsoft SQL servers
         - Microsoft Exchange servers

         Disabling datagram processing on these servers helps keep the network stable and ensures better use of system resources in high-demand environments. Enabling datagram processing on these servers can reduce network performance and reliability.

       - **Not configured**
     - **Disable DNS over TCP parsing**
       - **DNS over TCP parsing is disabled**
       - **DNS over TCP parsing is enabled (Default)**
       - **Not configured**
     - **Disable HTTP parsing**
       - **HTTP parsing is disabled**
       - **HTTP parsing is enabled (Default)**
       - **Not configured**
     - **Disable SSH parsing**
       - **SSH parsing is disabled**
       - **SSH parsing is enabled (Default)**
       - **Not configured**
     - **Disable TLS parsing**
       - **TLS parsing is disabled**
       - **TLS parsing is enabled (Default)**
       - **Not configured**
     - **\[Deprecated\] Enable DNS Sinkhole**
       - **DNS Sinkhole is disabled**
       - **DNS Sinkhole is enabled. (Default)**
       - **Not configured**

   When you're finished on the **Configuration settings** tab, select **Next**.

6. On the **Assignments** tab, click in the search box or start typing a group name, and then select it from the results.

   You can select **All users** or **All devices**.

   When you select a custom group, you can use that group to include or exclude the group members.

   When you're finished on the **Assignments** tab, select **Next**.

7. On the **Review + create** tab, review your settings, and then select **Save**.

### Microsoft Intune

#### Microsoft Defender for Endpoint Baseline method

> [!IMPORTANT]
> Security baselines apply a broad set of Microsoft-recommended settings to your devices — network protection is one setting among many. If your devices aren't already baseline-managed, deploying a baseline solely to enable network protection will enforce all other baseline settings too, which may conflict with your existing configurations. To configure only network protection, use the [Antivirus policy method](#antivirus-policy-method) or [Device configuration profile method](#device-configuration-profile-method) instead.

To configure network protection as part of a security baseline in Microsoft Intune, see <a href="/intune/intune-service/protect/security-baselines-configure#create-a-profile-for-a-security-baseline" target="_blank">Create a profile for a security baseline</a> (opens in a new tab in the Intune documentation). When creating the profile, use these settings:

- **Baseline**: Microsoft Defender for Endpoint Security Baseline
- **Configuration settings**: Expand **Defender** and set **Enable Network Protection** to **Enabled (block mode)** or **Enabled (audit mode)**

For more information about security baselines in Microsoft Intune, see [Learn about Intune security baselines for Windows devices](/intune/intune-service/protect/security-baselines).

After your profile is created and assigned, return to this article to continue with [verification](#check-if-network-protection-is-enabled).

#### Antivirus policy method

To configure network protection using a Microsoft Intune Endpoint Security **Antivirus** policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows
- **Profile**: Microsoft Defender Antivirus
- **Configuration settings**: Set **Enable network protection** to **Enabled (block mode)** for enforcement, or **Enabled (audit mode)** to assess impact before enforcement

For more information about Microsoft Defender Antivirus profiles in Microsoft Intune, see [Antivirus policy for endpoint security](/intune/intune-service/protect/endpoint-security-antivirus-policy).

After your policy is created and assigned, return to this article to continue with [verification](#check-if-network-protection-is-enabled).

#### Device configuration profile method

To configure network protection using a Microsoft Intune **Device configuration** profile, see <a href="/intune/intune-service/protect/endpoint-protection-configure#create-a-device-profile-containing-endpoint-protection-settings" target="_blank">Add Endpoint protection settings in Intune</a> (opens in a new tab in the Intune documentation). When creating the profile, use these settings:

- **Platform**: Windows 10 and later
- **Profile type**: Templates > Endpoint protection
- **Configuration settings**: Expand **Microsoft Defender Exploit Guard** > **Network filtering** and set **Network protection** to **Enable** or **Audit**

For more information about the Network protection setting and available values, see [Network filtering settings for endpoint protection](/intune/intune-service/protect/endpoint-protection-windows-10#network-filtering).

After your profile is created and assigned, return to this article to continue with [verification](#check-if-network-protection-is-enabled) and alternative deployment methods.

### Mobile device management (MDM)

1. Use the [EnableNetworkProtection](/windows/client-management/mdm/policy-csp-defender#enablenetworkprotection) configuration service provider (CSP) to turn network protection on or off, or to enable audit mode.

2. [Update Microsoft Defender anti-malware platform to the latest version](https://support.microsoft.com/topic/update-for-microsoft-defender-antimalware-platform-92e21611-8cf1-8e0e-56d6-561a07d144cc) before you turn network protection on or off.

### Group Policy

Use the following procedure to enable network protection on domain-joined computers or on a standalone computer.

1. On a standalone computer, go to **Start** and then type and select **Edit group policy**.

    *-Or-*

    On a domain-joined Group Policy management computer, open the [Group Policy Management Console (GPMC)](/windows-server/identity/ad-ds/manage/group-policy/group-policy-management-console). Right-click the Group Policy Object you want to configure and select **Edit**.

2. In the **Group Policy Management Editor**, go to **Computer configuration** and select **Administrative templates**.

3. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Microsoft Defender Exploit Guard** \> **Network protection**.

   On older versions of Windows, the Group Policy path might have *Windows Defender Antivirus* instead of *Microsoft Defender Antivirus*.

4. Double-click the **Prevent users and apps from accessing dangerous websites** setting and set the option to **Enabled**. In the options section, you must specify one of the following options:

    - **Block**: Users can't access malicious IP addresses and domains.
    - **Disable (Default)**: The Network protection feature doesn't work. Users aren't blocked from accessing malicious domains.
    - **Audit Mode**: If a user visits a malicious IP address or domain, an event is recorded in the Windows event log. However, the user isn't blocked from visiting the address.

   > [!IMPORTANT]
   > To fully enable network protection, you must set the Group Policy option to **Enabled** and also select **Block** in the options drop-down menu.

5. (This step is optional.) Follow the steps in [Check if network protection is enabled](#check-if-network-protection-is-enabled) to verify that your Group Policy settings are correct.

### Microsoft Configuration Manager

1. Open the Configuration Manager console.

1. Go to **Assets and Compliance** > **Endpoint Protection** > **Windows Defender Exploit Guard**.

1. Select **Create Exploit Guard Policy** from the ribbon to create a new policy.
1. To edit an existing policy, select the policy, then select **Properties** from either the ribbon or the right-click menu. Edit the **Configure network protection** option from the **Network Protection** tab.  

1. On the **General** page, specify a name for the new policy and verify the **Network protection** option is enabled.

1. On the **Network protection** page, select one of the following settings for the **Configure network protection** option:

   - **Block**
   - **Audit**
   - **Disabled**

1. Complete the rest of the steps, and save the policy.

1. From the ribbon, select **Deploy** to deploy the policy to a collection.

### PowerShell

1. On your Windows device, select **Start**, type `powershell`, right-click **Windows PowerShell**, and then select **Run as administrator**.

1. Run the following cmdlet:

   ```PowerShell
   Set-MpPreference -EnableNetworkProtection Enabled
   ```

1. For Windows Server, use the extra commands listed in the following table:

   |Windows Server version|Commands|
   |---|---|
   |Windows Server 2019 and later|`Set-MpPreference -AllowNetworkProtectionOnWinServer $true`|
   |Windows Server 2016 <br/> Windows Server 2012 R2 with the [unified agent for Microsoft Defender for Endpoint](/defender-endpoint/enable-network-protection)|`Set-MpPreference -AllowNetworkProtectionDownLevel $true` <br/> `Set-MpPreference -AllowNetworkProtectionOnWinServer $true`|

  > [!IMPORTANT]
  > Disable the "AllowDatagramProcessingOnWinServer" setting. Disabling this setting is important for any roles that generate high volumes of UDP traffic such as Domain Controllers, Windows DNS servers, Windows File Servers, Microsoft SQL servers, Microsoft Exchange servers, and others. Enabling datagram processing in these cases can reduce network performance and reliability. Disabling it helps keep the network stable and ensures better use of system resources in high-demand environments.

1. (This step is optional.) To set network protection to audit mode, use the following cmdlet:

   ```PowerShell
   Set-MpPreference -EnableNetworkProtection AuditMode
   ```

   To turn off network protection, use the `Disabled` parameter instead of `AuditMode` or `Enabled`.

## Check if network protection is enabled

You can use Registry Editor to check the status of network protection.

1. Open Registry Editor (for example, run `regedit.exe`).

2. Navigate to the following path: **HKEY_LOCAL_MACHINE** \> **SOFTWARE** \> **Policies** \> **Microsoft** \> **Windows Defender** \> **Policy Manager**

   If that path doesn't exist, navigate to **HKEY_LOCAL_MACHINE** \> **SOFTWARE** \> **Microsoft** \> **Windows Defender** \> **Windows Defender Exploit Guard** \> **Network Protection**.

3. Select **EnableNetworkProtection** to see the current state of network protection on the device:
   - **0** is **Off**
   - **1** is **On**
   - **2** is **Audit** mode

   :::image type="content" source="/defender/media/95341270-b738b280-08d3-11eb-84a0-16abb140c9fd.png" alt-text="Screenshot of the Network Protection registry key in Registry Editor." lightbox="/defender/media/95341270-b738b280-08d3-11eb-84a0-16abb140c9fd.png":::

### Important information about removing Exploit Guard settings from a device

When you deploy an Exploit Guard policy using Configuration Manager, the settings remain on the client even if you later remove the deployment. If the deployment is removed, the client logs `Delete` not supported in the `ExploitGuardHandler.log` file.

<!--CMADO8538577-->

To correctly remove Exploit Guard settings, use the following PowerShell script in the `SYSTEM` context:
<!--CMADO9907132-->

```powershell
$defenderObject = Get-WmiObject -Namespace "root/cimv2/mdm/dmmap" -Class "MDM_Policy_Config01_Defender02" -Filter "InstanceID='Defender' and ParentID='./Vendor/MSFT/Policy/Config'"

$defenderObject.AttackSurfaceReductionRules = $null

$defenderObject.AttackSurfaceReductionOnlyExclusions = $null

$defenderObject.EnableControlledFolderAccess = $null

$defenderObject.ControlledFolderAccessAllowedApplications = $null

$defenderObject.ControlledFolderAccessProtectedFolders = $null

$defenderObject.EnableNetworkProtection = $null

$defenderObject.Put()

$exploitGuardObject = Get-WmiObject -Namespace "root/cimv2/mdm/dmmap" -Class "MDM_Policy_Config01_ExploitGuard02" -Filter "InstanceID='ExploitGuard' and ParentID='./Vendor/MSFT/Policy/Config'"

$exploitGuardObject.ExploitProtectionSettings = $null

$exploitGuardObject.Put()
```  

## See also

- [Network protection](network-protection.md)
- [Network protection for Linux](network-protection-linux.md)
- [Network protection for macOS](network-protection-macos.md)
- [Network protection and the TCP three-way handshake](network-protection.md#network-protection-and-the-tcp-three-way-handshake)
- [Evaluate network protection](evaluate-network-protection.md)
- [Troubleshoot network protection](troubleshoot-np.md)


