---
title: Configure and validate Microsoft Defender Antivirus network connections
description: Configure and test your connection to the Microsoft Defender Antivirus cloud protection service.
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
author: paulinbar
ms.author: painbar
ms.topic: how-to
ms.custom: nextgen
ms.date: 10/20/2025
ms.reviewer: yongrhee; pahuijbr
ms.collection:
- m365-security
- tier2
- mde-ngp
search.appverid: met150
appliesto:
  - Microsoft Defender Antivirus
---

# Configure and validate Microsoft Defender Antivirus network connections

> [!IMPORTANT]
> This article contains information about configuring network connections only for Microsoft Defender Antivirus, when used without Microsoft Defender for Endpoint. If you are using **Microsoft Defender for Endpoint** (which includes Microsoft Defender Antivirus), see [Configure device proxy and Internet connectivity settings for Defender for Endpoint](configure-proxy-internet.md).

To ensure Microsoft Defender Antivirus cloud-delivered protection works properly, your security team must configure your network to allow connections between your endpoints and certain Microsoft servers. This article lists which destinations much be accessible. It also provides instructions for validating connections. Configuring connectivity properly ensures you receive the best value from Microsoft Defender Antivirus cloud-delivered protection services.

## Prerequisites

### Supported operating systems

- Windows

## Allow connections to the Microsoft Defender Antivirus cloud service

The Microsoft Defender Antivirus cloud service provides fast, strong protection for your endpoints. While it's optional to enable and use the cloud-delivered protection services provided by Microsoft Defender Antivirus, it's highly recommended because it provides important and timely protection against emerging threats on your endpoints and network. For more information, see [Enable cloud-delivered protection](enable-cloud-protection-microsoft-defender-antivirus.md), which describes how to enable the service by using Intune, Microsoft Configuration Manager, Group Policy, PowerShell cmdlets, or individual clients in the Windows Security app.

After you've enabled the service, you need to configure your network or firewall to allow connections between network and your endpoints. Computers must have access to the internet and reach the Microsoft cloud services for proper operation.

> [!NOTE]
> The Microsoft Defender Antivirus cloud service delivers updated protection to your network and endpoints. The cloud service should not be considered as protection for or against files that are stored in the cloud; instead, the cloud service uses distributed resources and machine learning to deliver protection for your endpoints at a faster rate than the traditional Security intelligence updates, and applies to file-based and file-less threats, regardless of where they originate from.

## Services and URLs

The table in this section lists services and their associated website addresses (URLs).

Make sure that there are no firewall or network filtering rules denying access to these URLs. Otherwise, you must create an allow rule specifically for those URLs. The URLs in the following table use port `443` for communication. (Port `80` is also required for some URLs, as noted in the following table.)

|Service and description|URL|
|---|---|
|Microsoft Defender Antivirus cloud-delivered protection service is referred to as Microsoft Active Protection Service (MAPS).<br/> Microsoft Defender Antivirus uses the MAPS service to provide cloud-delivered protection.|`*.wdcp.microsoft.com` <br/>`*.wdcpalt.microsoft.com`<br/>`*.wd.microsoft.com`  |
|Microsoft Update Service (MU) and Windows Update Service (WU)<br/>These services allow security intelligence and product updates.|`*.update.microsoft.com`<br/>`*.delivery.mp.microsoft.com`<br/>`*.windowsupdate.com` <br/>`ctldl.windowsupdate.com`<br/><br/>For more information, see [Connection endpoints for Windows Update](/windows/privacy/manage-windows-1709-endpoints#windows-update).|
|Security intelligence updates Alternate Download Location (ADL)<br/>This is an alternate location for Microsoft Defender Antivirus Security intelligence updates, if the installed Security intelligence is out of date (Seven or more days behind).|`*.download.microsoft.com`<br/>`*.download.windowsupdate.com` (Port 80 is required)<br/>`go.microsoft.com` (Port 80 is required)<br/>`https://www.microsoft.com/security/encyclopedia/adlpackages.aspx` <br/>`https://definitionupdates.microsoft.com/download/DefinitionUpdates/`<br/>`https://fe3cr.delivery.mp.microsoft.com/ClientWebService/client.asmx`|
|Malware submission storage<br/>This is an upload location for files submitted to Microsoft via the Submission form or automatic sample submission.|`ussus1eastprod.blob.core.windows.net`<br/>`ussus2eastprod.blob.core.windows.net`<br/>`ussus3eastprod.blob.core.windows.net`<br/>`ussus4eastprod.blob.core.windows.net`<br/>`wsus1eastprod.blob.core.windows.net`<br/>`wsus2eastprod.blob.core.windows.net`<br/>`ussus1westprod.blob.core.windows.net`<br/>`ussus2westprod.blob.core.windows.net`<br/>`ussus3westprod.blob.core.windows.net`<br/>`ussus4westprod.blob.core.windows.net`<br/>`wsus1westprod.blob.core.windows.net`<br/>`wsus2westprod.blob.core.windows.net`<br/>`usseu1northprod.blob.core.windows.net`<br/>`wseu1northprod.blob.core.windows.net`<br/>`usseu1westprod.blob.core.windows.net`<br/>`wseu1westprod.blob.core.windows.net`<br/>`ussuk1southprod.blob.core.windows.net`<br/>`wsuk1southprod.blob.core.windows.net`<br/>`ussuk1westprod.blob.core.windows.net`<br/>`wsuk1westprod.blob.core.windows.net`|
|Certificate Revocation List (CRL)<br/>Windows use this list while creating the SSL connection to MAPS for updating the CRL.|`http://www.microsoft.com/pkiops/crl/`<br/>`http://www.microsoft.com/pkiops/certs`<br/>`http://crl.microsoft.com/pki/crl/products`<br/>`http://www.microsoft.com/pki/certs`|
|Universal GDPR Client<br/>Windows use this client to send the client diagnostic data.<br/><br/>Microsoft Defender Antivirus uses General Data Protection Regulation for product quality, and monitoring purposes.|The update uses SSL (TCP Port 443) to download manifests and upload diagnostic data to Microsoft that uses the following DNS endpoints:<br/>`vortex-win.data.microsoft.com`<br/>`settings-win.data.microsoft.com`|

## Validate connections between your network and the cloud

After allowing the URLs listed, test whether you're connected to the Microsoft Defender Antivirus cloud service. Test the URLs are correctly reporting and receiving information to ensure you're fully protected.

<a name="use-the-cmdline-tool-to-validate-cloud-delivered-protection"></a>

### Use the MpCmdRun command-line tool to validate cloud-delivered protection

Do the following steps to verify that your network can communicate with the Microsoft Defender Antivirus cloud service:

1. Open an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**). For example:
   1. Open the **Start** menu, and then type **cmd**.
   2. Right-click on the **Command Prompt** result, and then select **Run as administrator**.
2. In the elevated Command Prompt, run the following commands:

   > [!TIP]
   > The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Microsoft Defender`.

   ```dos
   (set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

   MpCmdRun.exe -ValidateMapsConnection
   ```

For more information about MpCmdRun, see [Configure and manage Microsoft Defender Antivirus with the MpCmdRun command-line tool](command-line-arguments-microsoft-defender-antivirus.md).

#### Error messages

Here are some error messages you might see:

```console
Start Time: <Day_of_the_week> MM DD YYYY HH:MM:SS
MpEnsureProcessMitigationPolicy: hr = 0x1
ValidateMapsConnection
```

```console
ValidateMapsConnection failed to establish a connection to MAPS (hr=0x80070006 httpcore=451)
MpCmdRun.exe: hr = 0x80070006
```

```console
ValidateMapsConnection failed to establish a connection to MAPS (hr=0x80072F8F httpcore=451)
MpCmdRun.exe: hr = 0x80072F8F
```

```output
ValidateMapsConnection failed to establish a connection to MAPS (hr=0x80072EFE httpcore=451)
MpCmdRun.exe: hr = 0x80072EFE
```

#### Root causes

The root cause of these error messages is that the device doesn't have its system-wide `WinHttp` proxy configured. If you don't set this proxy, then the operating system isn't aware of the proxy and can't fetch the CRL (the operating system does this, not Defender for Endpoint), which means that TLS connections to URLs like `http://cp.wd.microsoft.com/` don't succeed. You see successful (response 200) connections to the endpoints, but the MAPS connections would still fail.

#### Solutions

- **Preferred solution**: Configure the system-wide WinHttp proxy that allows the CRL check.

- **Alternate solution**: Configuring the following `SSLOption` registry key and value to Disable the CRL check for SpyNet only. This registry key doesn't affect other services. This solution isn't a best practice since you're no longer checking for revoked certificates or certificate pinning.

  ```text
  Windows Registry Editor Version 5.00

  [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet]
  "SSLOptions"=dword:00000002
  ```

  The available values are:

  - **0**: Disable pinning and revocation checks.
  - **1**: Disable pinning.
  - **2**: Disable revocation checks only.
  - **3** (default): Enable revocation checks and pinning.

## Attempt to download a fake malware file from Microsoft

You can download a [sample file](defender-endpoint-demonstration-cloud-delivered-protection.md) that Microsoft Defender Antivirus will detect and block if you're properly connected to the cloud.

> [!NOTE]
> The downloaded file is not exactly malware. It's a fake file designed to test if you're properly connected to the cloud.

If you're properly connected, you'll see a warning Microsoft Defender Antivirus notification.

If you're using Microsoft Edge, you'll also see a notification message:

:::image type="content" source="/defender/media/wdav-bafs-edge.png" alt-text="The notification that malware was found in Edge" lightbox="/defender/media/wdav-bafs-edge.png":::

A similar message occurs if you're using Internet Explorer:

:::image type="content" source="/defender/media/wdav-bafs-ie.png" alt-text="The Microsoft Defender Antivirus notification that malware was found" lightbox="/defender/media/wdav-bafs-ie.png":::

### View the fake malware detection in your Windows Security app

1. On your task bar, select the Shield icon, open the **Windows Security** app. Or, search the **Start** for *Security*.

1. Select **Virus & threat protection**, and then select **Protection history**.

1. Under the **Quarantined threats** section, select **See full history** to see the detected fake malware.

   > [!NOTE]
   > Versions of Windows 10 before version 1703 have a different user interface. See [Microsoft Defender Antivirus in the Windows Security app](microsoft-defender-security-center-antivirus.md).

   The Windows event log will also show [Windows Defender client event ID 1116](troubleshoot-microsoft-defender-antivirus.yml).

> [!TIP]
> If you're looking for Antivirus related information for other platforms, see:
>
> - [Microsoft Defender for Endpoint on Mac](microsoft-defender-endpoint-mac.md)
> - [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)
> - [Configure Defender for Endpoint on Android features](android-configure.md)
> - [Configure Microsoft Defender for Endpoint on iOS features](ios-configure-features.md)

## See also

- [Configure device proxy and Internet connectivity settings for Microsoft Defender for Endpoint](configure-proxy-internet.md)
- [Use Group Policy settings to configure and manage Microsoft Defender Antivirus](use-group-policy-microsoft-defender-antivirus.md)
- [Important changes to Microsoft Active Protection Services endpoint](https://techcommunity.microsoft.com/t5/Configuration-Manager-Archive/Important-changes-to-Microsoft-Active-Protection-Service-MAPS/ba-p/274006)
