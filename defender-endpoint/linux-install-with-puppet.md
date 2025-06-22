---
title: Deploy Microsoft Defender for Endpoint on Linux with Puppet
ms.reviewer: gopkr
description: Describes how to deploy Microsoft Defender for Endpoint on Linux using Puppet.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-linux
ms.topic: install-set-up-deploy
ms.subservice: linux
search.appverid: met150
ms.date: 04/10/2025
---

# Deploy Microsoft Defender for Endpoint on Linux with Puppet

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- Microsoft Defender for Endpoint for servers
- Microsoft Defender for Servers Plan 1 or Plan 2

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

You can deploy [Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) by using a variety of tools and methods. This article describes how to deploy Defender for Endpoint on Linux using Puppet. To use another method, refer to the [See also](#see-also) section. 

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

[!INCLUDE [Microsoft Defender for Endpoint third-party tool support](../includes/support.md)]

## Prerequisites and system requirements

Before you get started, see [Prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md) for a description of prerequisites and system requirements.

In addition, for Puppet deployment, you need to be familiar with Puppet administration tasks, have Puppet configured, and know how to deploy packages. Puppet has many ways to complete the same task. These instructions assume availability of supported Puppet modules, such as *apt* to help deploy the package. Your organization might use a different workflow. For more information, see [Puppet documentation](https://puppet.com/docs).

## Download the onboarding package

Download the onboarding package from Microsoft Defender portal.

[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

2. In the first drop-down menu, select **Linux Server** as the operating system. In the second drop-down menu, select **Your preferred Linux configuration management tool** as the deployment method.

3. Select **Download onboarding package**. Save the file as `WindowsDefenderATPOnboardingPackage.zip`.

   :::image type="content" source="media/portal-onboarding-linux-2.png" alt-text="The option to download the onboarded package.":::

4. Extract the contents of the archive.

   ```bash
   unzip WindowsDefenderATPOnboardingPackage.zip
   ```

   ```console
   Archive:  WindowsDefenderATPOnboardingPackage.zip
   inflating: mdatp_onboard.json
   ```

## Create a directory structure

You need to create a directory structure for deploying Defender for Endpoint on Linux to devices managed by a Puppet server. This example makes use of the `apt` and `yumrepo` modules available from `puppetlabs`, and assumes that the modules are installed on your Puppet server.

1. Under the **modules** folder if your Puppet installation, create the folders `install_mdatp/files` and `install_mdatp/manifests`. The **modules** folder is typically located at `/etc/puppetlabs/code/environments/production/modules` on your Puppet server. 

2. Copy the `mdatp_onboard.json` file created earlier to the `install_mdatp/files` folder. 

3. Create an `init.pp` file that contains the deployment instructions:

   ```bash
   pwd
   ```
   
   ```console
   /etc/puppetlabs/code/environments/production/modules
   ```
   
   ```bash
   tree install_mdatp
   ```
   
   ```console
   install_mdatp
   ├── files
   │   └── mdatp_onboard.json
   └── manifests
       └── init.pp
   ```

## Create a Puppet manifest

There are two ways to create a manifest file:

- Use an installer script; or
- Configure your repositories manually.

#### Create a manifest to deploy Defender for Endpoint using an installer script

1. Download the installer bash script. Pull the [installer bash script](https://github.com/microsoft/mdatp-xplat/blob/master/linux/installation/mde_installer.sh) from Microsoft GitHub Repository or use the following command to download it.


  ```bash
  wget https://raw.githubusercontent.com/microsoft/mdatp-xplat/refs/heads/master/linux/installation/mde_installer.sh /etc/puppetlabs/code/environments/production/modules/install_mdatp/files/
  ```

2. Add the following content to the `install_mdatp/manifests/init.pp` file. You can also download the file directly from [GitHub](https://github.com/microsoft/mdatp-xplat/blob/master/linux/installation/third_party_installation_playbooks/puppet.install_mdatp_simplified.init.pp)

  ```bash

  # Puppet manifest to install Microsoft Defender for Endpoint on Linux.
  # @param channel The release channel based on your environment, insider-fast or prod.

  class install_mdatp (
    $channel = 'prod',
  ) {
    # Ensure that the directory /tmp/mde_install exists
    file { '/tmp/mde_install':
      ensure => directory,
      mode   => '0755',
    }

    # Copy the installation script to the destination
    file { '/tmp/mde_install/mde_installer.sh':
      ensure => file,
      source => 'puppet:///modules/install_mdatp/mde_installer.sh',
      mode   => '0777',
    }

    # Copy the onboarding script to the destination
    file { '/tmp/mde_install/mdatp_onboard.json':
      ensure => file,
      source => 'puppet:///modules/install_mdatp/mdatp_onboard.json',
      mode   => '0777',
    }

    # Install MDE on the host using an external script
    exec { 'install_mde':
      command     => "/tmp/mde_install/mde_installer.sh --install --channel ${channel} --onboard /tmp/mde_install/mdatp_onboard.json",
      path        => '/bin:/usr/bin',
      user        => 'root',
      logoutput   => true,
      require     => File['/tmp/mde_install/mde_installer.sh', '/tmp/mde_install/mdatp_onboard.json'], # Ensure the script is copied before running the installer
    }

  }
  ```
> [!NOTE]
> The installer script also supports other parameters such as channel, realtime protection, version, etc. To select from the list of available options, check help.
>`./mde_installer.sh --help`

#### Create a manifest to deploy Defender for Endpoint by configuring repositories manually

Add the following content to the `install_mdatp/manifests/init.pp` file. You can also download it from [GitHub](https://github.com/microsoft/mdatp-xplat/blob/master/linux/installation/third_party_installation_playbooks/puppet.install_mdatp_manual.init.pp). 

```bash
# Puppet manifest to install Microsoft Defender for Endpoint on Linux.
# @param channel The release channel based on your environment, insider-fast or prod.

class install_mdatp::configure_debian_repo (
  String $channel,
  String $distro,
  String $version ) {
  # Configure the APT repository for Debian-based systems

  $release = $channel ? {
    'prod'  => $facts['os']['distro']['codename'],
    default => $channel
    }
  
  apt::source { 'microsoftpackages':
    location => "https://packages.microsoft.com/${distro}/${version}/prod",
    release  => $release,
    repos    => 'main',
    key      => {
      'id'     => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
      'server' => 'keyserver.ubuntu.com',
    },
  }
}

class install_mdatp::configure_redhat_repo (
  String $channel,
  String $distro,
  String $version) {
  # Configure the Yum repository for RedHat-based systems
  
  yumrepo { 'microsoftpackages':
    baseurl  => "https://packages.microsoft.com/rhel/${version}/prod",
    descr    => 'packages-microsoft-com-prod',
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'https://packages.microsoft.com/keys/microsoft.asc',
  }
}

class install_mdatp::install {
  # Common configurations for both Debian and RedHat
  
  file { ['/etc/opt', '/etc/opt/microsoft', '/etc/opt/microsoft/mdatp']:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  file { '/etc/opt/microsoft/mdatp/mdatp_onboard.json':
    source  => 'puppet:///modules/install_mdatp/mdatp_onboard.json',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => File['/etc/opt/microsoft/mdatp'],
  }

  # Install mdatp package
  package { 'mdatp':
    ensure  => installed,
    require => [
      File['/etc/opt/microsoft/mdatp/mdatp_onboard.json'],
    ],
  }
}


class install_mdatp (
  $channel = 'prod'
) {
  # Include the appropriate class based on the OS family
  
  $distro = downcase($facts['os']['name'])
  $version = $facts['os']['release']['major']
  
  case $facts['os']['family'] {
    'Debian': {
      class { 'install_mdatp::configure_debian_repo':
        channel => 'prod',
        distro => $distro,
        version => $version
        } -> class { 'install_mdatp::install': }
    }
    'RedHat': {
      class { 'install_mdatp::configure_redhat_repo':
        channel => 'prod',
        distro => $distro,
        version => $version,
        } -> class { 'install_mdatp::install': }
    }
    default: { fail("${facts['os']['family']} is currently not supported.")}
  }
}

```

> [!NOTE]
> Defender for Endpoint on Linux can be deployed from one of the following channels: **insiders-fast, insiders-slow, prod**. Each channel corresponds to a Linux software repository. The choice of the channel determines the type and frequency of the updates that are offered to your device. Devices in `insiders-fast` are the first ones to receive updates and new features in preview, followed by `insiders-slow`, and lastly by `prod`.
> Note your distribution and version and identify the closest entry for it under `https://packages.microsoft.com/config/[distro]/[version]`.

> [!WARNING]
> Switching the channel after the initial installation requires the product to be reinstalled. To switch the product channel: uninstall the existing package, re-configure your device to use the new channel, and follow the steps in this document to install the package from the new location.

## Include the manifest inside the site.pp file

Include the manifest described earlier in this article in your `site.pp` file:

```bash
cat /etc/puppetlabs/code/environments/production/manifests/site.pp
```

```console
node "default" {
    include install_mdatp
}
```

Enrolled agent devices periodically poll the Puppet Server and install new configuration profiles and policies as soon as they're detected.

## Monitor your Puppet deployment

On the agent device, you can also check the deployment status by running the following command:

```bash
mdatp health
```

```console
...
healthy                                 : true
health_issues                           : []
licensed                                : true
org_id                                  : "[your organization identifier]"
...
```

- `healthy`: Confirm that Defender for Endpoint is successfully deployed and operational.
- `health_issues`: States the issues which caused the healthy status to become false.
- `licensed`: Confirms that the device is tied to your organization.
- `orgId`: Your Defender for Endpoint organization identifier.

## Troubleshoot installation issues

If you experience any installation issues, for self-troubleshooting, follow these steps:

1. For information on how to find the log that's generated automatically when an installation error occurs, see [Log installation issues](linux-resources.md#log-installation-issues).

2. For information about common installation issues, see [Installation issues](/defender-endpoint/linux-support-install).

3. If health of the device is `false`, see [Defender for Endpoint agent health issues](/defender-endpoint/health-status).

4. For product performance issues, see [Troubleshoot performance issues](/defender-endpoint/linux-support-perf).

5. For proxy and connectivity issues, see [Troubleshoot cloud connectivity issues](/defender-endpoint/linux-support-connectivity).

To get support from Microsoft, open a support ticket, and provide the log files created by using the [client analyzer](/defender-endpoint/overview-client-analyzer).

## How to configure policies for Microsoft Defender on Linux

To configure antivirus and EDR settings, see the following articles:

- [Defender for Endpoint security settings management](/mem/intune/protect/mde-security-integration) describes how to configure settings in the Microsoft Defender portal. (*This method is recommended*.)
- [Set preferences for Defender for Endpoint on Linux](/defender-endpoint/linux-preferences) describes settings you can configure.

## Operating system upgrades

When upgrading your operating system to a new major version, you must first uninstall Defender for Endpoint on Linux, install the upgrade, and then reconfigure Defender for Endpoint on Linux on your device.

## Uninstallation

Create a module `remove_mdatp` similar to `install_mdatp` with the following contents in `init.pp` file:

```bash
class remove_mdatp {
    package { 'mdatp':
        ensure => 'purged',
    }
}
```

## See also

- [Prerequisites for Microsoft Defender for Endpoint on Linux](mde-linux-prerequisites.md)
- [Use installer script based deployment to deploy Defender for Endpoint on Linux](linux-installer-script.md) 
- [Deploy Defender for Endpoint on Linux with Ansible](linux-install-with-ansible.md)
- [Deploy Defender for Endpoint on Linux with Chef](linux-deploy-defender-for-endpoint-with-chef.md)
- [Deploy Defender for Endpoint on Linux with Saltstack](linux-install-with-saltack.md)
- [Deploy Defender for Endpoint on Linux manually](linux-install-manually.md)
- [Connect your non-Azure machines to Microsoft Defender for Cloud with Defender for Endpoint](/azure/defender-for-cloud/onboard-machines-with-defender-for-endpoint) (direct onboarding using Defender for Cloud)
- [Deployment guidance for Defender for Endpoint on Linux for SAP](mde-linux-deployment-on-sap.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
