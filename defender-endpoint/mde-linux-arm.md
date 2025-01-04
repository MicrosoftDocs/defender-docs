---
title: Microsoft Defender for Endpoint on Linux for ARM64-based devices (preview)
description: Defender for Endpoint on Linux now supports ARM devices. Learn how it works and how to deploy it.            
author: denisebmsft
ms.author: deniseb
manager: deniseb 
ms.date: 12/09/2024
ms.topic: how-to
ms.service: defender-endpoint
ms.subservice: linux
ms.localizationpriority: medium 
ms.collection: 
- m365-security
- tier3
- mde-linux
ms.custom: 
- partner-contribution
ms.reviewer: meghapriya
search.appverid: MET150
f1.keywords: NOCSH 
audience: ITPro
ai-usage: human-only
---

# Microsoft Defender for Endpoint on Linux for ARM64-based devices (preview)

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

## Overview of Defender for Endpoint on Linux for ARM64-based devices

As you might already know, [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md) is a unified endpoint security solution that helps you protect your server devices from advanced threats. Defender for Endpoint on Linux is now extending support for ARM64-based Linux servers in preview. Similar to x64-based Linux servers (including Intel and AMD 64-bit platform), the following capabilities are included: 

- Microsoft Defender Antivirus
- Endpoint detection and response (EDR)
- Live response
- Device isolation
- Advanced hunting
- Vulnerability management
- Centralized policy configuration using security settings management

Initially, the following Linux distributions are supported in preview:

- Ubuntu 20.04 ARM64
- Ubuntu 22.04 ARM64
- Amazon Linux 2 ARM64
- Amazon Linux 2023 ARM64

> [!NOTE]
> Support for more Linux distributions is planned as part of this preview program.

The installation procedures in this article install the agent version `101.24102.0002` from the insiders-slow channel on the ARM64-based device. (See [What's new in Microsoft Defender for Endpoint on Linux](linux-whatsnew.md).) 

## Deploy Defender for Endpoint on Linux for ARM64-based devices

You can choose from several methods to deploy Defender for Endpoint on Linux to your ARM64-based device:

- [Installer script](#deploy-using-the-installer-script)
- [Ansible](#deploy-using-the-installer-script-with-ansible)
- [Puppet](#deploy-using-the-installer-script-with-puppet)
- [Microsoft Defender for Cloud](#deploy-defender-for-endpoint-on-linux-using-microsoft-defender-for-cloud)

### Before you begin

- Make sure the [prerequisites](microsoft-defender-endpoint-linux.md#prerequisites) are met for Defender for Endpoint on Linux

- To onboard servers to Defender for Endpoint, [server licenses](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-defender-for-endpoint) are required. You can choose from these options:

   - Microsoft Defender for Servers Plan 1 or Plan 2 (as part of the [Defender for Cloud](/azure/defender-for-cloud/defender-for-cloud-introduction)) offering; or
   - Microsoft Defender for Endpoint Server

### Deploy using the installer script

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

2. In the onboarding screen, select the following options:

   :::image type="content" source="media/mde-linux-arm-installerscript.png" alt-text="Screenshot showing MDE onboarding using installer script.":::

   1. In the **Select operating system to start onboarding process** list, select **Linux Server**.

   2. In the **Connectivity type** list, select **Streamlined**. Or, if necessary, you can select **Standard**. (For more information, see [Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint](configure-device-connectivity.md).)

   3. In the **Deployment method** list, select **Local Script (Python)**.

   4. Select **Download onboarding package**.

3. In a new browser window, download the [Defender for Endpoint installer bash script](https://github.com/microsoft/mdatp-xplat/blob/master/linux/installation/mde_installer.sh).

4. Use the following command to grant the necessary permissions for the script:

   `$chmod +x /mde_installer.sh`

5. Run the following command to execute the installer script:

   `$sudo ~/mde_installer.sh --install --channel insiders-slow --onboard ~/MicrosoftDefenderATPOnboardingLinuxServer.py`

6. Validate the deployment by following these steps:

   1. On the device, run the following command to check the health status. A return value of `true` denotes that the product is functioning as expected:

      `$ mdatp health --field healthy`

   2. In the [Microsoft Defender portal](https://security.microsoft.com), under **Assets** > **Devices**, look for the Linux device you just onboarded. It can take approximately 20 minutes for the device to show up in the portal.

7. If you run into an issue, see [Troubleshoot deployment issues](#troubleshoot-deployment-issues) (in this article).
 
### Deploy using the installer script with Ansible

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

2. In the onboarding screen, select the following options:

   :::image type="content" source="media/mde-linux-arm-ansible.png" alt-text="Screenshot showing MDE onboarding screen to use Ansible.":::

   1. In the **Select operating system to start onboarding process** list, select **Linux Server**.

   2. In the **Connectivity type** list, select **Streamlined**. Or, if necessary, you can select **Standard**. (For more information, see [Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint](configure-device-connectivity.md).)

   3. In the **Deployment method** list, select **Your preferred Linux configuration management tool**.

   4. Select **Download onboarding package**.

3. In a new browser window, download the [Defender for Endpoint installer bash script](https://github.com/microsoft/mdatp-xplat/blob/master/linux/installation/mde_installer.sh).

4. Create an installation YAML file on your Ansible server. For example, `/etc/ansible/playbooks/install_mdatp.yml`, using the `mde_installer.sh` you downloaded in step 3.

   ```yml
   
   name: Install and Onboard MDE
   hosts: servers
   tasks:
   - name: Create a directory if it does not exist
     ansible.builtin.file:
       path: /tmp/mde_install
       state: directory
       mode: '0755'

   - name: Copy Onboarding script
     ansible.builtin.copy:
       src: "{{ onboarding_script }}"
       dest: /tmp/mde_install/mdatp_onboard.json
   - name: Install MDE on host
     ansible.builtin.script: "{{ mde_installer_script }} --install --channel {{ channel | default('insiders-slow') }} --onboard /tmp/mde_install/mdatp_onboard.json"
     register: script_output
     args:
       executable: sudo

   - name: Display the installation output
     debug:
       msg: "Return code [{{ script_output.rc }}] {{ script_output.stdout }}"

   - name: Display any installation errors
     debug:
       msg: "{{ script_output.stderr }}"

   ```
   
5. Deploy Defender for Endpoint on Linux by using the following command. Edit the corresponding paths and channel, as appropriate.

   ```bash
   
   ansible-playbook -i  /etc/ansible/hosts /etc/ansible/playbooks/install_mdatp.yml --extra-vars "onboarding_script=<path to mdatp_onboard.json > mde_installer_script=<path to mde_installer.sh> channel=<channel to deploy for: insiders-slow > "

   ```

6. Validate your deployment by following these steps:

   1. On the device, run the following commands to check for device health, connectivity, antivirus, and EDR detections:

      ```YAML

      - name: Run post-installation basic MDE test
        hosts: myhosts
        tasks:
    
         - name: Check health
           ansible.builtin.command: mdatp health --field healthy
           register: health_status

         - name: MDE health test failed
           fail: msg="MDE is not healthy. health status => \n{{ health_status.stdout       }}\nMDE deployment not complete"
           when: health_status.stdout != "true"

         - name: Run connectivity test
           ansible.builtin.command: mdatp connectivity test
           register: connectivity_status

         - name: Connectivity failed
           fail: msg="Connectivity failed. Connectivity result => \n{{ connectivity_status.stdout }}\n MDE deployment not complete"
           when: connectivity_status.rc != 0

         - name: Check RTP status
           ansible.builtin.command: mdatp health --field real_time_protection_enabled
           register: rtp_status

         - name: Enable RTP
           ansible.builtin.command: mdatp config real-time-protection --value enabled
           become: yes
           become_user: root
           when: rtp_status.stdout != "true"

         - name: Pause for 5 second to enable RTP
           ansible.builtin.pause:
           seconds: 5

         - name: Download EICAR
           ansible.builtin.get_url:
           url: https://secure.eicar.org/eicar.com.txt
           dest: /tmp/eicar.com.txt

         - name: Pause for 5 second to detect eicar 
           ansible.builtin.pause:
           seconds: 5

         - name: Check for EICAR file
           stat: path=/tmp/eicar.com.txt
           register: eicar_test

         - name: EICAR test failed
           fail: msg="EICAR file not deleted. MDE deployment not complete"
           when: eicar_test.stat.exists

         - name: MDE Deployed
           debug:
           msg: "MDE succesfully deployed"

      ```

   2. In the [Microsoft Defender portal](https://security.microsoft.com), under **Assets** > **Devices**, look for the Linux device you just onboarded. It can take approximately 20 minutes for the device to show up in the portal.

7. If you run into an issue, see [Troubleshoot deployment issues](#troubleshoot-deployment-issues) (in this article).

### Deploy using the installer script with Puppet

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

2. In the onboarding screen, select the following options:

   :::image type="content" source="media/mde-linux-arm-puppet.png" alt-text="Screenshot showing the onboarding screen in MDE for Puppet.":::

   1. In the **Select operating system to start onboarding process** list, select **Linux Server**.

   2. In the **Connectivity type** list, select **Streamlined**. Or, if necessary, you can select **Standard**. (For more information, see [Onboarding devices using streamlined connectivity for Microsoft Defender for Endpoint](configure-device-connectivity.md).)

   3. In the **Deployment method** list, select **Your preferred Linux configuration management tool**.

   4. Select **Download onboarding package**. Save the file as `WindowsDefenderATPOnboardingPackage.zip`.

3. Extract the contents of the onboarding package by using the following command:

   `unzip WindowsDefenderATPOnboardingPackage.zip`

   You should see the following output:

   ```
   Archive:  WindowsDefenderATPOnboardingPackage.zip
   inflating: mdatp_onboard.json
   ```

4. In a new browser window, download the [Defender for Endpoint installer bash script](https://github.com/microsoft/mdatp-xplat/blob/master/linux/installation/mde_installer.sh) (this script is called `mde_installer.sh`).

5. Create a Puppet manifest by using the following procedure, which uses the `mde_installer.sh` script from step 4.

   1. In the **modules** folder of your Puppet installation, create the following folders:

      - `install_mdatp/files` 
      - `install_mdatp/manifests`
      
      The **modules** folder is typically located at `/etc/puppetlabs/code/environments/production/modules` on your Puppet server.

   2. Copy the `mdatp_onboard.json` file created earlier to the `install_mdatp/files` folder.

   3. Copy `mde_installer.sh` to `install_mdatp/files folder`.

   4. Create an `init.pp` file inside `install_mdatp/manifests` that contains the following deployment instructions:

      ```bash
      tree install_mdatp
      Output: 
      install_mdatp
      ├── files
      │   ├── mdatp_onboard.sh
      │   └── mde_installer.sh
      └── manifests
          └── init.pp
      ```

6. Use the Puppet manifest to install Defender for Endpoint on Linux on your device.

   ```bash
   
   # Puppet manifest to install Microsoft Defender for Endpoint on Linux.
   # @param channel The release channel based on your environment, insider-fast or prod.

   class install_mdatp (
     $channel = 'insiders-slow',
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

   #Install MDE on the host using an external script
   exec { 'install_mde':
    command     => "/tmp/mde_install/mde_installer.sh --install --channel ${channel} --onboard /tmp/mde_install/mdatp_onboard.json",
    path        => '/bin:/usr/bin',
    user        => 'root',
    logoutput   => true,
    require     => File['/tmp/mde_install/mde_installer.sh', '/tmp/mde_install/mdatp_onboard.json'], # Ensure the script is copied before running the installer
   }
   }
   ```

7. Validate your deployment. In the [Microsoft Defender portal](https://security.microsoft.com), under **Assets** > **Devices**, look for the Linux device you just onboarded. It can take approximately 20 minutes for the device to show up in the portal.

### Deploy Defender for Endpoint on Linux using Microsoft Defender for Cloud

If your organization is using Defender for Cloud, you can use it to deploy Defender for Endpoint on Linux.

1. We recommend enabling automatic deployment on your ARM64-based Linux devices. After VM provisioning, define a variable under the file `/etc/mde.arm.d/mde.conf` on your device as follows:

   `OPT_FOR_MDE_ARM_PREVIEW=1`

2. Wait for 1-6 hours for onboarding to complete.

3. In the [Microsoft Defender portal](https://security.microsoft.com), under **Assets** > **Devices**, look for the Linux devices you just onboarded.

**Need help with Defender for Cloud?**

See these articles:

- [Enable the Defender for Endpoint integration: Linux](/azure/defender-for-cloud/enable-defender-for-endpoint#linux)
- [Connect your non-Azure machines to Microsoft Defender for Cloud: Onboard your Linux server](/azure/defender-for-cloud/quickstart-onboard-machines#onboard-your-linux-server)


## Troubleshoot deployment issues

If you run into any issues deploying Defender for Endpoint on Linux to your ARM64-based devices, help is available. First, review our list of common issues and how to resolve them. If the problem persists, contact us.

### Common issues and how to resolve them

The following table summarizes common issues and how to resolve them.

| Error message or issue | What to do |
|--|--|
| `mdatp not found` | The repository might not be configured correctly. Check to see if the channel is set to `insiders-slow` in the installer script |
| `mdatp health` indicates a missing license | Make sure you're passing the correct onboarding script or json file to your automation script or tool |
| Exclusions aren't working as expected | If you had exclusions working on other devices, but they're not working on your ARM64-based Linux servers, contact us at `mdearmsupport@microsoft.com`. You need your client analyzer logs. |
| You want help with tuning mdatp. | Contact us at `mdearmsupport@microsoft.com`. |

### Contact us if you need help

When you contact us at `mdearmsupport@microsoft.com`, make sure to describe the issue in detail. Include screenshots if possible, and your client analyzer logs.

### XMDE Client Analyzer ARM Preview

1. Using Bash, download the [XMDE Client Analyzer ARM Preview](https://go.microsoft.com/fwlink/?linkid=2299668). 

   ```bash
   wget --quiet -O XMDEClientAnalyzerARMPreview.zip https://go.microsoft.com/fwlink/?linkid=2299668
   ```
2. Run the support tool.

   ```bash
   sudo ./MDESupportTool -d --mdatp-log debug
   ```
3. Follow the on-screen instructions and then follow up with at the end of the log collection. The logs are located in the `/tmp` directory.

   The log set is owned by the root user, so you might need root privileges to remove the log set.

## See also

- [Microsoft Defender for Endpoint on Linux](microsoft-defender-endpoint-linux.md)

- [Supported Microsoft Defender for Endpoint capabilities by platform](supported-capabilities-by-platform.md)