---
title: Turn on network protection
description: Enable network protection with Group Policy, PowerShell, or Mobile Device Management and Configuration Manager.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 05/19/2025
ms.topic: how-to
author: emmwalshh
ms.author: ewalsh
ms.reviewer: tdoucett
manager: deniseb
ms.subservice: asr
ms.collection: 
- m365-security
- tier2
- mde-asr
search.appverid: met150
---

# Turn on network protection

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- Microsoft Defender for Servers
- Microsoft Defender Antivirus

**Platforms**

- Windows
- Linux (See [Network protection for Linux](network-protection-linux.md))
- macOS (See [Network protection for macOS](network-protection-macos.md))

> [!TIP]
> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[Network protection](network-protection.md) helps to prevent employees from using any application to access dangerous domains that might host phishing scams, exploits, and other malicious content on the internet. You can [audit network protection](evaluate-network-protection.md) in a test environment to view which apps would be blocked before enabling network protection.

[Learn more about network filtering configuration options.](/mem/intune/protect/endpoint-protection-windows-10#network-filtering)

## Enable network protection

To enable network protection, you can use any of the methods described in this article.

### Microsoft Defender for Endpoint Security Settings Management

#### Create an endpoint security policy

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/) using at least a Security Administrator role assigned.

2. Go to **Endpoints** > **Configuration management** > **Endpoint security policies**, and then select **Create new policy**.

3. Under **Select Platform**, select **Windows 10, Windows 11, and Windows Server**.

4. Under **Select Template**, select **Microsoft Defender Antivirus**, then select **Create policy**.

5. On the **Basics** page, enter a name and description for the profile, then choose **Next**.

1. On the **Settings** page, expand each group of settings, and configure the settings you want to manage with this profile.

   - Network Protection on Windows clients:

      | Description| Setting|
      | -------- | -------- |
      | Enable Network Protection|Options:<br>- Enabled (block mode) Block mode is needed to block IP address/URL indicators and Web Content Filtering.<br>- Enabled (audit mode) <br>- Disabled (Default) <br>- Not Configured|

   - Network Protection on Windows Server 2012 R2 and Windows Server 2016, use the additional policy listed in the following table:
   
      | Description|Setting|
      | -------- | -------- |
      |Allow Network Protection Down Level|Options:<br>- Network protection will be enabled downlevel. <br>- Network Protection will be disabled downlevel. (Default) <br>- Not Configured|

   - Optional Network Protection settings for Windows and Windows Server:
   
     > [!WARNING]
     > Disable the `Allow Datagram Processing On WinServer` setting. This is important for any roles that generate high volumes of UDP traffic such as Domain Controllers, Windows DNS servers, Windows File Servers, Microsoft SQL servers, Microsoft Exchange servers, and others. Enabling datagram processing in these cases can reduce network performance and reliability. Disabling it helps keep the network stable and ensures better use of system resources in high-demand environments.
     
     
     |Description| Setting|
| -------- | -------- |
|Allow Datagram Processing On Win Server|- Datagram processing on Windows Server is enabled. <br>- Datagram processing on Windows Server is disabled (Default, recommended). <br>- Not configured|
|Disable DNS over TCP parsing|- DNS over TCP parsing is disabled. <br>- DNS over TCP parsing is enabled (Default). <br>- Not configured|
|Disable HTTP parsing|- HTTP parsing is disabled. <br>- HTTP parsing is enabled (Default). <br>- Not configured|
|Disable SSH parsing|- SSH parsing is disabled. <br>- SSH parsing is enabled (Default). <br>- Not configured|
|Disable TLS parsing |- TLS parsing is disabled. <br>- TLS parsing is enabled (Default). <br>- Not configured|
|[Deprecated]Enable DNS Sinkhole|- DNS Sinkhole is disabled. <br>- DNS Sinkhole is enabled. (Default) <br>- Not configured|

7. When you're done configuring settings, select **Next**.

8. On the **Assignments** page, select the groups that will receive this profile. Then select **Next**.

9. On the **Review + create** page, review the information, and then select **Save**. 

   The new profile is displayed in the list when you select the policy type for the profile you created.

### Microsoft Intune

#### Microsoft Defender for Endpoint Baseline method

1. Sign into the [Microsoft Intune admin center](https://intune.microsoft.com).

2. Go to **Endpoint security** > **Security baselines** > **Microsoft Defender for Endpoint Baseline**.

3. Select **Create a profile**, then provide a name for your profile, and then select **Next**.

4. In the **Configuration settings** section, go to **Attack Surface Reduction Rules** > set **Block**, **Enable**, or **Audit** for **Enable network protection**. Select **Next**.

5. Select the appropriate **Scope tags** and **Assignments** as required by your organization.

7. Review all the information, and then select **Create**.

#### Antivirus policy method

1. Sign into the [Microsoft Intune admin center](https://intune.microsoft.com).

2. Go to **Endpoint security** > **Antivirus**.

3. Select **Create a policy**.

4. In the **Create a policy** flyout, choose **Windows 10, Windows 11, and Windows Server** from the **Platform** list.

5. Choose **Microsoft Defender Antivirus** from the **Profile** list then choose **Create**.

6. Provide a name for your profile, and then select **Next**.

7. In the **Configuration settings** section, select **Disabled**, **Enabled (block mode)** or **Enabled (audit mode)** for **Enable Network Protection**, then select **Next**.

8. Select the appropriate **Assignments** and **Scope tags** as required by your organization.

9. Review all the information, and then select **Create**.

#### Configuration profile method

1. Sign into the Microsoft Intune admin center (https://intune.microsoft.com).

2. Go to **Devices** > **Configuration profiles** > **Create profile**.

3. In the **Create a profile** flyout, select **Platform** and choose the **Profile Type** as **Templates**.

4. In the **Template name**, Choose **Endpoint protection** from the list of templates, and then select **Create**.

5. Go to **Endpoint protection** > **Basics**, provide a name for your profile, and then select **Next**.

6. In the **Configuration settings** section, go to **Microsoft Defender Exploit Guard** > **Network filtering** > **Network protection** > **Enable** or **Audit**. Select **Next**.

7. Select the appropriate **Scope tags**, **Assignments**, and **Applicability rules** as required by your organization. Admins can set more requirements.

8. Review all the information, and then select **Create**.

### Mobile device management (MDM)

1. Use the [EnableNetworkProtection](/windows/client-management/mdm/policy-csp-defender#enablenetworkprotection) configuration service provider (CSP) to turn network protection on or off, or to enable audit mode.

2. [Update Microsoft Defender anti-malware platform to the latest version](https://support.microsoft.com/topic/update-for-microsoft-defender-antimalware-platform-92e21611-8cf1-8e0e-56d6-561a07d144cc) before you turn network protection on or off.

### Group Policy

Use the following procedure to enable network protection on domain-joined computers or on a standalone computer.

1. On a standalone computer, go to **Start** and then type and select **Edit group policy**.

    *-Or-*

    On a domain-joined Group Policy management computer, open the [Group Policy Management Console](https://technet.microsoft.com/library/cc731212.aspx). Right-click the Group Policy Object you want to configure and select **Edit**.

2. In the **Group Policy Management Editor**, go to **Computer configuration** and select **Administrative templates**.

3. Expand the tree to **Windows components** \> **Microsoft Defender Antivirus** \> **Microsoft Defender Exploit Guard** \> **Network protection**.

   On older versions of Windows, the Group Policy path might have *Windows Defender Antivirus* instead of *Microsoft Defender Antivirus*.

4. Double-click the **Prevent users and apps from accessing dangerous websites** setting and set the option to **Enabled**. In the options section, you must specify one of the following options:

    - **Block** - Users can't access malicious IP addresses and domains.
    - **Disable (Default)** - The Network protection feature won't work. Users aren't blocked from accessing malicious domains.
    - **Audit Mode** - If a user visits a malicious IP address or domain, an event is recorded in the Windows event log. However, the user won't be blocked from visiting the address.

   > [!IMPORTANT]
   > To fully enable network protection, you must set the Group Policy option to **Enabled** and also select **Block** in the options drop-down menu.

5. (This step is optional.) Follow the steps in [Check if network protection is enabled](#check-if-network-protection-is-enabled) to verify that your Group Policy settings are correct.

### Microsoft Configuration Manager

1. Open the Configuration Manager console.

2. Go to **Assets and Compliance** > **Endpoint Protection** > **Windows Defender Exploit Guard**.

3. Select **Create Exploit Guard Policy** from the ribbon to create a new policy.
   - To edit an existing policy, select the policy, then select **Properties** from either the ribbon or the right-click menu. Edit the **Configure network protection** option from the **Network Protection** tab.  

4. On the **General** page, specify a name for the new policy and verify the **Network protection** option is enabled.

5. On the **Network protection** page, select one of the following settings for the **Configure network protection** option:

   - **Block**
   - **Audit**
   - **Disabled**

6. Complete the rest of the steps, and save the policy.

7. From the ribbon, select **Deploy** to deploy the policy to a collection.

### PowerShell

1. On your Windows device, click **Start**, type `powershell`, right-click **Windows PowerShell**, and then select **Run as administrator**.

1. Run the following cmdlet:

   ```PowerShell
   Set-MpPreference -EnableNetworkProtection Enabled
   ```

1. For Windows Server, use the additional commands listed in the following table:

   | Windows Server version | Commands |
   |---|---|
   |Windows Server 2019 and later | `set-mpPreference -AllowNetworkProtectionOnWinServer $true` <br/>|
   |Windows Server 2016 <br/>Windows Server 2012 R2 with the [unified agent for Microsoft Defender for Endpoint](/defender-endpoint/enable-network-protection) | `set-MpPreference -AllowNetworkProtectionDownLevel $true` <br/> `set-MpPreference -AllowNetworkProtectionOnWinServer $true` <br/>|

> [!IMPORTANT]
> Disable the "AllowDatagramProcessingOnWinServer" setting. This is important for any roles that generate high volumes of UDP traffic such as Domain Controllers, Windows DNS servers, Windows File Servers, Microsoft SQL servers, Microsoft Exchange servers, and others. Enabling datagram processing in these cases can reduce network performance and reliability. Disabling it helps keep the network stable and ensures better use of system resources in high-demand environments.

1. (This step is optional.) To set network protection to audit mode, use the following cmdlet:

   ```PowerShell
   Set-MpPreference -EnableNetworkProtection AuditMode
   ```

   To turn off network protection, use the `Disabled` parameter instead of `AuditMode` or `Enabled`.


## Check if network protection is enabled

You can use Registry Editor to check the status of network protection.

1. Select the **Start** button in the task bar and type `regedit`. In the list of results, select Registry editor to open it.

2. Choose **HKEY_LOCAL_MACHINE** from the side menu.

3. Navigate through the nested menus to **SOFTWARE** \> **Policies** \> **Microsoft** \> **Windows Defender** \> **Policy Manager**.

   If the key is missing, navigate to **SOFTWARE** \> **Microsoft** \> **Windows Defender** \> **Windows Defender Exploit Guard** \> **Network Protection**.

4. Select **EnableNetworkProtection** to see the current state of network protection on the device:

   - **0**, or **Off**
   - **1**, or **On**
   - **2**, or **Audit** mode

   :::image type="content" source="/defender/media/95341270-b738b280-08d3-11eb-84a0-16abb140c9fd.png" alt-text="Network Protection registry key" lightbox="/defender/media/95341270-b738b280-08d3-11eb-84a0-16abb140c9fd.png":::

#### Important information about removing Exploit Guard settings from a device

When you deploy an Exploit Guard policy using Configuration Manager, the settings remain on the client even if you later remove the deployment. If the deployment is removed, the client logs `Delete` not supported in the `ExploitGuardHandler.log` file.

<!--CMADO8538577-->

Use the following PowerShell script in the `SYSTEM` context to remove Exploit Guard settings correctly:
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

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
