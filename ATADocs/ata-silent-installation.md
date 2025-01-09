---
# required metadata

title: Install Advanced Threat Analytics silently
description: This article describes how to silently install ATA.
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: b3cceb18-0f3c-42ac-8630-bdc6b310f1d6

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: bennyl
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA silent installation

[!INCLUDE [Banner for top of topics](includes/banner.md)]

This article provides instructions for silently installing ATA.

## Prerequisites

ATA version 1.9 requires the installation of Microsoft .NET Framework 4.6.1.

When you install or update ATA, .Net Framework 4.6.1 is automatically installed as part of the deployment of Microsoft ATA.

> [!Note]
> The installation of .Net framework 4.6.1 may require rebooting the server. When installing ATA Gateway on Domain Controllers, consider scheduling a maintenance window for these Domain Controllers. When using ATA silent installation method, the installer is configured to automatically restart the server at the end of the installation (if necessary). Because of a Windows Installer bug, the norestart flag cannot be reliably used to make sure the server does not restart, so make sure to only run silent installation during a maintenance window.

To track the progress of the deployment, monitor ATA installer logs, which are located in **%AppData%\Local\Temp**.

## Install the ATA Center

Use the following command to install the ATA Center:

**Syntax**:

```cmd
"Microsoft ATA Center Setup.exe" [/quiet] [/Help] [--LicenseAccepted] [NetFrameworkCommandLineArguments="/q"] [InstallationPath="<InstallPath>"] [DatabaseDataPath= "<DBPath>"] [CertificateThumbprint="<CertThumbprint>"]
```

**Installation options**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent installation?|Description|
> |---|---|---|---|
> |Quiet|/quiet|Yes|Runs the installer displaying no UI and no prompts.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|
> |NetFrameworkCommandLineArguments="/q"|NetFrameworkCommandLineArguments="/q"|Yes|Specifies the parameters for the .Net Framework installation. Must be set to enforce the silent installation of .Net Framework.|
> |LicenseAccepted|--LicenseAccepted|Yes|Indicates that the license was read and approved. Must be set on silent installation.|

**Installation parameters**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent installation?|Description|
> |---|---|---|---|
>|InstallationPath|InstallationPath=`<InstallPath>`|No|Sets the path for the installation of ATA binaries. Default path: C:\Program Files\Microsoft Advanced Threat Analytics\Center|
>|DatabaseDataPath|DatabaseDataPath= `<DBPath>`|No|Sets the path for the ATA Database data folder. Default path: C:\Program Files\Microsoft Advanced Threat Analytics\Center\MongoDB\bin\data|
>|CenterCertificateThumbprint|CenterCertificateThumbprint=`<CertThumbprint>`|No|Sets the certificate thumbprint for the ATA Center. This Certificate is used to secure communication for ATA Gateway to the ATA Center and to validate the identity of the ATA Console website. If not set, the installation generates a self-signed certificate.|

**Example**:

To install the ATA Center with default installation paths and user-defined certificate thumbprint:

```cmd
"Microsoft ATA Center Setup.exe" /quiet --LicenseAccepted NetFrameworkCommandLineArguments ="/q" CenterCertificateThumbprint= ‎"1E2079739F624148ABDF502BF9C799FCB8C7212F"
```

## Update the ATA Center

Use the following command to update the ATA Center:

**Syntax**:

```cmd
"Microsoft ATA Center Setup.exe" [/quiet] [/Help] [NetFrameworkCommandLineArguments="/q"]
```

**Installation options**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent installation?|Description|
> |---|---|---|---|
> |Quiet|/quiet|Yes|Runs the installer displaying no UI and no prompts.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|
> |NetFrameworkCommandLineArguments="/q"|NetFrameworkCommandLineArguments="/q"|Yes|Specifies the parameters for the .Net Framework installation. Must be set to enforce the silent installation of .Net Framework.|

When updating ATA, the installer automatically detects that ATA is already installed on the server, and no update installation option is required.

**Examples**:

To update the ATA Center silently. In large environments, the ATA Center update can take a while to complete. Monitor ATA logs to track the progress of the update.

```cmd
"Microsoft ATA Center Setup.exe" /quiet NetFrameworkCommandLineArguments="/q"
```

## Uninstall the ATA Center silently

Use the following command to perform a silent uninstall of the ATA Center:

**Syntax**:

```cmd
"Microsoft ATA Center Setup.exe" [/quiet] [/Uninstall] [/Help] [--DeleteExistingDatabaseData]
```

**Installation options**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent uninstallation?|Description|
> |---|---|---|---|
> |Quiet|/quiet|Yes|Runs the uninstaller displaying no UI and no prompts.|
> |Uninstall|/uninstall|Yes|Runs the silent uninstallation of the ATA Center from the server.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|

**Installation parameters**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent uninstallation?|Description|
> |---|---|---|---|
> |DeleteExistingDatabaseData|DeleteExistingDatabaseData|No|Deletes all the files in the existing database.|

**Examples**:

To silently uninstall the ATA Center from the server, removing all existing database data:

```cmd
"Microsoft ATA Center Setup.exe" /quiet /uninstall --DeleteExistingDatabaseData
```

## ATA Gateway silent installation

When silently deploying the ATA Lightweight Gateway via System Center Configuration Manager or other software deployment system, we recommend that you create two deployment packages:

- Net Framework 4.6.1 including rebooting the domain controller
- ATA Gateway.

Make the ATA Gateway package dependent on the deployment of the .Net Framework package deployment. Get the [.Net Framework 4.6.1 offline deployment package](https://www.microsoft.com/download/details.aspx?id=49982).

> [!NOTE]
> We recommend that you work on a domain-joined computer and sign in using a secure authentication flow, in which case, you don't need to specify credentials as part of the installation.

Use the following command to silently install the ATA Gateway:

**Syntax**:

```cmd
"Microsoft ATA Gateway Setup.exe" [/quiet] [/Help] [NetFrameworkCommandLineArguments="/q"] [ConsoleAccountName="<AccountName>"]
```


**Installation options**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent installation?|Description|
> |---|---|---|---|
> |Quiet|/quiet|Yes|Runs the installer displaying no UI and no prompts.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|
> |NetFrameworkCommandLineArguments="/q"|NetFrameworkCommandLineArguments="/q"|Yes|Specifies the parameters for the .Net Framework installation. Must be set to enforce the silent installation of .Net Framework.|

**Installation parameters**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent installation?|Description|
> |---|---|---|---|
>|InstallationPath|InstallationPath=`<InstallPath>`|No|Sets the path for the installation of ATA binaries. Default path: C:\Program Files\Microsoft Advanced Threat Analytics\Center
>|ConsoleAccountName|ConsoleAccountName=`<AccountName>`|Yes|Sets the name of the user account (user@domain.com) that is used to register the ATA Gateway with the ATA Center.|
>|ConsoleAccountPassword|ConsoleAccountPassword=`<AccountPassword>`|Yes|Used only if you aren't already signed in to the computer as an ATA Admin. Sets the password for the user account (user@domain.com) that is used to register the ATA Gateway with the ATA Center.|

**Examples**:

To silently install the ATA Gateway, log into the domain joined computer with your ATA admin credentials so that you do not need to specify credentials as part of the installation, and then run:

```cmd
"Microsoft ATA Gateway Setup.exe" /quiet NetFrameworkCommandLineArguments="/q" 
```

## Update the ATA Gateway

Use the following command to silently update the ATA Gateway:

**Syntax**:

```cmd
"Microsoft ATA Gateway Setup.exe" [/quiet] [/Help] [NetFrameworkCommandLineArguments="/q"]
```

**Installation options**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent installation?|Description|
> |---|---|---|---|
> |Quiet|/quiet|Yes|Runs the installer displaying no UI and no prompts.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|
> |NetFrameworkCommandLineArguments="/q"|NetFrameworkCommandLineArguments="/q"|Yes|Specifies the parameters for the .Net Framework installation. Must be set to enforce the silent installation of .Net Framework.|

**Examples**:

To update the ATA Gateway silently:

```cmd
"Microsoft ATA Gateway Setup.exe" /quiet NetFrameworkCommandLineArguments="/q"
```

## Uninstall the ATA Gateway silently

Use the following command to perform a silent uninstall of the ATA Gateway:

**Syntax**:

```cmd
"Microsoft ATA Gateway Setup.exe" [/quiet] [/Uninstall] [/Help]
```

**Installation options**:

> [!div class="mx-tableFixed"]
>
> |Name|Syntax|Mandatory for silent uninstallation?|Description|
> |---|---|---|---|
> |Quiet|/quiet|Yes|Runs the uninstaller displaying no UI and no prompts.|
> |Uninstall|/uninstall|Yes|Runs the silent uninstallation of the ATA Gateway from the server.|
> |Help|/help|No|Provides help and quick reference. Displays the correct use of the setup command including a list of all options and behaviors.|

**Examples**:

To silently uninstall the ATA Gateway from the server:

```cmd
"Microsoft ATA Gateway Setup.exe" /quiet /uninstall
```

## See Also

- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
- [Configure event collection](configure-event-collection.md)
- [ATA prerequisites](ata-prerequisites.md)
