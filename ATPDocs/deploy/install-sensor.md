---
title: Install a sensor | Microsoft Defender for Identity
description: Learn how to install Microsoft Defender for Identity sensors on your domain controllers, AD FS servers, or AD CS servers.
ms.date: 06/21/2023
ms.topic: how-to
---

# Install a Microsoft Defender for Identity sensor

This article describes how to install a Microsoft Defender for Identity sensor, including a standalone sensor. The default recommendation is to use the UI. However:

- When you're installing the sensor on Windows Server Core, or to deploy the sensor via a software deployment system, follow the steps for [silent installation](#perform-a-defender-for-identity-silent-installation) instead.

- If you're using a proxy, we recommend that you install the sensor and configure your proxy together [from the command line](#command-for-running-a-silent-installation-with-a-proxy-configuration). If you need to update your proxy settings later on, use PowerShell or the Azure CLI. For more information, see [Configure endpoint proxy and internet connectivity settings](configure-proxy.md).

## Prerequisites

Before you start, make sure that you have:

- A downloaded copy of your [Defender for Identity sensor setup package](download-sensor.md) and the access key.

- Microsoft .NET Framework 4.7 or later installed on the machine. If Microsoft .NET Framework 4.7 or later isn't installed, the Defender for Identity sensor setup package installs it. Installation from the setup package might require a restart of the server.

- Relevant server specifications and network requirements. For more information, see:

  - [Microsoft Defender for Identity prerequisites](prerequisites.md)
  - [Configure sensors for AD FS, AD CS, and Microsoft Entra Connect](active-directory-federation-services.md)
  - [Microsoft Defender for Identity standalone sensor prerequisites](prerequisites-standalone.md)

- Trusted root certificates on your machine. If your trusted root CA-signed certificates are missing, [you might receive a connection error](../troubleshooting-known-issues.md#proxy-authentication-problem-presents-as-a-connection-error).

## Install the sensor by using the UI

Perform the following steps on the domain controller, Active Directory Federation Services (AD FS) server, or Active Directory Certificate Services (AD CS) server.

1. Verify that the machine has connectivity to the relevant [Defender for Identity cloud service endpoints](configure-proxy.md#enable-access-to-defender-for-identity-service-urls-in-the-proxy-server).

1. Extract the installation files from the .zip file. Installing directly from the .zip file fails.

1. Run **Azure ATP sensor setup.exe** with elevated privileges (**Run as administrator**) and follow the setup wizard.

1. On the **Welcome** page, select your language and then select **Next**.

    ![Screenshot that shows selection of the Defender for Identity standalone sensor installation language.](../media/sensor-install-language.png)

    The installation wizard automatically checks if the server is a domain controller, an AD FS server, an AD CS server, or a dedicated server. The server type determines the sensor type:

    - If the server is a domain controller, AD FS server, or AD CS server, the Defender for Identity sensor is installed.
    - If the server is dedicated, the Defender for Identity standalone sensor is installed.

    For example, the wizard displays the following page to indicate that a Defender for Identity sensor is installed on domain controllers.

    ![Screenshot of the page that identifies the sensor deployment type.](../media/sensor-install-deployment-type.png)

1. Select **Next**.

    The wizard issues a warning if the domain controller, AD FS server, AD CS server, or dedicated server doesn't meet the minimum hardware requirements for the installation.

    The warning doesn't prevent you from selecting **Next** and proceeding with the installation, which might still be the right option. For example, you need less room for data storage when you're installing a small lab test environment.

    For production environments, we highly recommend working with the [Defender for Identity sizing tool](capacity-planning.md) to make sure your domain controllers or dedicated servers meet the capacity requirements.

1. On the **Configure the sensor** page, enter the following information for the setup package:

    - **Installation path**: The location where the Defender for Identity sensor is installed. By default, the path is `%programfiles%\Azure Advanced Threat Protection sensor`. Leave the default value.
    - **Access key**: Retrieved from the Microsoft Defender portal in a [previous step](download-sensor.md).

    ![Screenshot of the wizard page for Defender for Identity sensor configuration.](../media/sensor-install-config.png)

1. Select **Install**. The following components are installed and configured during the installation of the Defender for Identity sensor:

    - **Defender for Identity sensor service** and **Defender for Identity sensor updater service**

    - **Npcap OEM version 1.0**

      > [!IMPORTANT]
      > Npcap OEM version 1.0 is automatically installed if no other version of Npcap is present. If you already have Npcap installed due to other software requirements or for any other reason, ensure that it's version 1.0 or later and that it has the [required settings for Defender for Identity](../technical-faq.yml#how-do-i-download-and-install-or-upgrade-the-npcap-driver).

### Viewing sensor versions

Beginning with sensor version 2.176, when you're installing the sensor from a new package, the version under **Add/Remove Programs** appears with the full number, such as **2.176.x.y**. Previously, the version appeared as the static **2.0.0.0**.

The installed version continues to appear even after the Defender for Identity cloud services run automatic updates.

View the sensor's real version on the Microsoft Defender XDR [sensor settings page](https://security.microsoft.com/settings/identities?tabid=sensor), in the executable path or in the file version.

## Perform a Defender for Identity silent installation

The Defender for Identity silent installation for sensors is configured to automatically restart the server at the end of the installation, if necessary.

Schedule a silent installation only during a maintenance window. Because of a Windows Installer bug, you can't reliably use the `norestart` flag to make sure the server doesn't restart.

To track your deployment progress, monitor the Defender for Identity installer logs in `%localappdata%\Temp`.

### Silent installation via a deployment system

When you're silently deploying a Defender for Identity sensor via System Center Configuration Manager or another software deployment system, we recommend that you create two deployment packages:

- .NET Framework 4.7 or later, which might include restarting the domain controller
- The Defender for Identity sensor

Make the Defender for Identity sensor package dependent on the deployment of the .NET Framework package deployment. If necessary, get the [.NET Framework 4.7 offline deployment package](https://support.microsoft.com/topic/the-net-framework-4-7-offline-installer-for-windows-f32bcb33-5f94-57ce-6120-62c9526a91f2).

### Commands for running a silent installation

Use the following commands to perform a fully silent installation of the Defender for Identity sensor, by using the access key that you copied in a [previous step](download-sensor.md).

#### cmd.exe syntax

```cmd
"Azure ATP sensor Setup.exe" /quiet NetFrameworkCommandLineArguments="/q" AccessKey="<Access Key>"
```

#### PowerShell syntax

```powershell
.\"Azure ATP sensor Setup.exe" /quiet NetFrameworkCommandLineArguments="/q" AccessKey="<Access Key>"
```

> [!NOTE]
> When you're using the PowerShell syntax, omitting the `.\` preface results in an error that prevents silent installation.

#### Installation options

|Name|Syntax|Mandatory for silent installation?|Description|
|-------------|----------|---------|---------|
|`Quiet`|`/quiet`|Yes|Runs the installer without displaying UI or prompts.|
|`Help`|`/help`|No|Provides help and quick reference. Displays the correct use of the setup command, including a list of all options and behaviors.|
|`NetFrameworkCommandLineArguments="/q"`|`NetFrameworkCommandLineArguments="/q"`|Yes|Specifies the parameters for the .NET Framework installation. Must be set to enforce the silent installation of .NET Framework.|

#### Installation parameters

|Name|Syntax|Mandatory for silent installation?|Description|
|-------------|----------|---------|---------|
|`InstallationPath`|`InstallationPath=""`|No|Sets the path for the installation of Defender for Identity sensor binaries. Default path: `%programfiles%\Azure Advanced Threat Protection Sensor`. |
|`AccessKey`|`AccessKey="\*\*"`|Yes|Sets the access key that's used to register the Defender for Identity sensor with the Defender for Identity workspace.|
|`AccessKeyFile`|`AccessKeyFile=""`|No|Sets the workspace access key from the provided text file path.|
|`DelayedUpdate`|`DelayedUpdate=true`|No|Sets the sensor's update mechanism to delay the update for 72 hours from the official release of each service update. For more information, see [Delayed sensor update](../sensor-settings.md#delayed-sensor-update).|
|`LogsPath`|`LogsPath=""`|No|Sets the path for the Defender for Identity sensor logs. Default path: `%programfiles%\Azure Advanced Threat Protection Sensor`.|

#### Examples

Use the following commands to silently install the Defender for Identity sensor:

```cmd
"Azure ATP sensor Setup.exe" /quiet NetFrameworkCommandLineArguments="/q" AccessKey="<access key value>"
```

```cmd
"Azure ATP sensor Setup.exe" /quiet NetFrameworkCommandLineArguments="/q" AccessKeyFile="C:\Path\myAccessKeyFile.txt"
```

### Command for running a silent installation with a proxy configuration

Use the following command to configure your proxy together with a silent installation:

```cmd
"Azure ATP sensor Setup.exe" [/quiet] [/Help] [ProxyUrl="http://proxy.internal.com"] [ProxyUserName="domain\proxyuser"] [ProxyUserPassword="ProxyPassword"]`
```

> [!NOTE]
> If you previously configured your proxy by using legacy options, including WinINet or a registry key update, you need to make any changes with the same method that you used originally. For more information, see [Change proxy configuration using legacy methods](configure-proxy.md#change-proxy-configuration-using-legacy-methods).

#### Installation parameters

|Name|Syntax|Mandatory for silent installation?|Description|
|-------------|----------|---------|---------|
|`ProxyUrl`|`ProxyUrl="http://proxy.contoso.com:8080"`|No|Specifies the proxy URL and port number for the Defender for Identity sensor.|
|`ProxyUserName`|`ProxyUserName="Contoso\ProxyUser"`|No|If your proxy service requires authentication, define a username in the `DOMAIN\user` format.|
|`ProxyUserPassword`|`ProxyUserPassword="P@ssw0rd"`|No|Specifies the password for your proxy username. <br><br>The Defender for Identity sensor encrypts credentials and stores them locally.|

> [!TIP]
> If you need to update your proxy settings later on, use PowerShell or the Azure CLI. For more information, see [Configure endpoint proxy and internet connectivity settings](configure-proxy.md). We recommend that you create and use a custom DNS A record for the proxy server. You can then use that record to change the proxy server's address when necessary and use the *hosts* file for testing.

## Related content

After you install a sensor, you can follow extra steps:

- If you installed the sensor on an AD FS or AD CS server, see [Post-installation steps (optional)](active-directory-federation-services.md#post-installation-steps-optional).

- If you installed a standalone sensor, see:
  - [Listen for SIEM events on your Defender for Identity standalone sensor](configure-event-collection.md)
  - [Configure port mirroring](configure-port-mirroring.md)
  - [Configure Windows event forwarding to your Defender for Identity standalone sensor](configure-event-forwarding.md)

## Next step

> [!div class="step-by-step"]
> [Configure Microsoft Defender for Identity sensor settings](configure-sensor-settings.md)
