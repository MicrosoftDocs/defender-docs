---
title: Deploy Microsoft Defender for Endpoint on Linux with Ansible
ms.reviewer: gopkr
description: Describes how to deploy Microsoft Defender for Endpoint on Linux using Ansible.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-linux
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
ms.date: 12/24/2024
---

# Deploy Microsoft Defender for Endpoint on Linux with Ansible

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to**:

- Microsoft Defender for Endpoint Server
- [Microsoft Defender for Servers](/azure/defender-for-cloud/integration-defender-for-endpoint)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630&clcid=0x409&culture=en-us&country=us)

This article describes how to deploy Defender for Endpoint on Linux using Ansible. A successful deployment requires the completion of all of the following tasks:

- [Prerequisites and system requirements](#prerequisites-and-system-requirements-applicable-to-both-the-methods)
- [Download the onboarding package](#download-the-onboarding-package-applicable-to-both-the-methods)
- [Deploy Defender for Endpoint on Linux using mde_installer.sh with Ansible](#deploy-defender-for-endpoint-using-mde_installersh-with-ansible)
- [Deploy Defender for Endpoint on Linux using Ansible by configuring repositories manually](#deploy-defender-for-endpoint-using-ansible-by-configuring-repositories-manually)

[!INCLUDE [Microsoft Defender for Endpoint third-party tool support](../includes/support.md)]

## Introduction

Deploy Microsoft Defender for Endpoint on Linux Servers using Ansible to automate the deployment process for machines at scale. Following are the two methods to automate:

- Use the installer script (recommended). This method greatly simplifies the automation process and helps to install the Defender for Endpoint agent and onboard the device to the Microsoft Defender portal using just a few steps without having to configure for different distros separately.

- Manually configure repositories for each distro. This method allows you to automate the deployment process by manually configuring repositories, installing the agent, and onboarding the device for each distro. This method gives more granular control over the deployment process.

## Prerequisites and system requirements applicable to both the methods

Before you get started, see [the main Defender for Endpoint on Linux page](microsoft-defender-endpoint-linux.md) for a description of prerequisites and system requirements.

In addition, for Ansible deployment, you need to be familiar with Ansible administration tasks, have Ansible configured, and know how to deploy playbooks and tasks. Ansible has many ways to complete the same task. These instructions assume availability of supported Ansible modules, such as *apt* and *unarchive* to help deploy the package. Your organization might use a different workflow. For more information, see [Ansible documentation](https://docs.ansible.com).

- Ansible needs to be installed on at least one computer (Ansible calls this computer the control node).

- SSH must be configured for an administrator account between the control node and all managed nodes (devices that have Defender for Endpoint installed on them), and it's recommended to be configured with public key authentication.

- The following software must be installed on all managed nodes:
  - curl
  - python-apt (if you're deploying on distributions using apt as a package manager)

- All managed nodes must be listed in the following format in the `/etc/ansible/hosts` or relevant file:

    ```bash
    [servers]
    host1 ansible_ssh_host=10.171.134.39
    host2 ansible_ssh_host=51.143.50.51
    ```

- Ping test:

    ```bash
    ansible -m ping all
    ```

## Download the onboarding package applicable to both the methods

Download the onboarding package from Microsoft Defender portal.

[!INCLUDE [Defender for Endpoint repackaging warning](../includes/repackaging-warning.md)]

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints** > **Device management** > **Onboarding**.

2. In the first drop-down menu, select **Linux Server** as the operating system. In the second drop-down menu, select **Your preferred Linux configuration management tool** as the deployment method.

3. Select **Download onboarding package**. Save the file as `WindowsDefenderATPOnboardingPackage.zip`.

   :::image type="content" source="media/portal-onboarding-linux-2.png" alt-text="The Download onboarding package option":::

4. From a command prompt, verify that you have the file. Extract the contents of the archive:

   ```bash
   unzip WindowsDefenderATPOnboardingPackage.zip
   ```

   ```console
   Archive:  WindowsDefenderATPOnboardingPackage.zip
   inflating: mdatp_onboard.json
   ```

## Deploy Defender for Endpoint using mde_installer.sh with Ansible

Before you begin, make sure to download the onboarding package and meet the prerequisites to deploy Defender for Endpoint on Linux using the installer bash script.

### Download the installer bash script

Pull the [installer bash script](https://github.com/microsoft/mdatp-xplat/tree/master/linux/installation) from Microsoft GitHub Repository or use the following command to download it.

 ```bash
   wget https://raw.githubusercontent.com/microsoft/mdatp-xplat/refs/heads/master/linux/installation/mde_installer.sh
 ```

### Create Ansible YAML files

Create installation YAML file. You can also download the file directly from [GitHub](/defender-endpoint/linux-support-events)

```bash
- name: Install and Onboard MDE
  hosts: servers
  tasks:
   - name: Create a directory if it does not exist
     ansible.builtin.file:
       path: /tmp/mde_install
       state: directory
       mode: '0755'

   - name: Copy Onboarding script
     ansible.builtin.copy:
       src: "{{ onboarding_json }}"
       dest: /tmp/mde_install/mdatp_onboard.json
   - name: Install MDE on host
     ansible.builtin.script: "{{ mde_installer_script }} --install --channel {{ channel | default('insiders-fast') }} --onboard /tmp/mde_install/mdatp_onboard.json"
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

> [!NOTE]
> The installer script also supports other parameters such as channel, realtime protection, version, etc. To select from the list of available options, check help through the following command: `./mde_installer.sh --help`

### Apply the playbook

Apply the playbook by using the following command, replacing the corresponding paths and channel per your requirements:

```bash
ansible-playbook -i  /etc/ansible/hosts /etc/ansible/playbooks/install_mdatp.yml --extra-vars "onboarding_json=<path to mdatp_onboard.json > mde_installer_script=<path to mde_installer.sh> channel=<channel to deploy for: insiders-fast / insiders-slow / prod> "
```

### Verify if the deployment is successful

1. In the [Microsoft Defender portal](https://security.microsoft.com), open the device inventory. It might take 5-20 mins for the device to show up in the portal.

2. Perform the following post-installation checks, which include checks like health, connectivity, antivirus, and EDR detection tests to ensure successful deployment and working of Defender for Endpoint.

```bash
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

### How to uninstall Microsoft Defender for Endpoint on Linux Servers

First, create an uninstallation YAML file (for example: /etc/ansible/playbooks/uninstall_mdatp.yml) which uses `mde_installer.sh`. You can also download the file directly from [GitHub](/defender-endpoint/linux-support-events)

```bash
- name: Uninstall MDE
  hosts: myhosts
  tasks:
   - name: Uninstall MDE
     ansible.builtin.script: "{{ mde_installer_script }} --remove"
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

Run the following command to uninstall Defender for Endpoint by using the playbook:

```bash
ansible-playbook -i /etc/ansible/hosts /etc/ansible/playbooks/uninstall_mdatp.yml --extra-vars "mde_installer_script=<path to mde_installer.sh>"
```

## Deploy Defender for Endpoint using Ansible by configuring repositories manually

Follow the steps in this section after downloading the onboarding package and meeting prerequisites to deploy Defender for Endpoint by manually configuring the repositories for each Linux distribution.

### Create Ansible YAML files

Create a subtask or role files that contribute to a playbook or task.

1. Create the onboarding task, `onboarding_setup.yml`:

   ```bash
   - name: Create MDATP directories
     file:
       path: /etc/opt/microsoft/mdatp/
       recurse: true
       state: directory
       mode: 0755
       owner: root
       group: root

   - name: Register mdatp_onboard.json
     stat:
       path: /etc/opt/microsoft/mdatp/mdatp_onboard.json
     register: mdatp_onboard

   - name: Extract WindowsDefenderATPOnboardingPackage.zip into /etc/opt/microsoft/mdatp
     unarchive:
       src: WindowsDefenderATPOnboardingPackage.zip
       dest: /etc/opt/microsoft/mdatp
       mode: 0600
       owner: root
       group: root
     when: not mdatp_onboard.stat.exists
   ```

2. Add the Defender for Endpoint repository and the key, `add_apt_repo.yml`. Defender for Endpoint on Linux can be deployed from one of the following channels:

   - *insiders-fast*, denoted as `[channel]`
    *insiders-slow*, denoted as `[channel]`
   - *prod*, denoted as `[channel]` using the version name (see [Linux Software Repository for Microsoft Products](/linux/packages))

   Each channel corresponds to a Linux software repository.

   The choice of the channel determines the type and frequency of updates that are offered to your device. Devices in *insiders-fast* are the first ones to receive updates and new features, followed later by *insiders-slow*, and lastly by *prod*.

   In order to preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to use either *insiders-fast* or *insiders-slow*.

   > [!WARNING]
   > Switching the channel after the initial installation requires the product to be reinstalled. To switch the product channel: uninstall the existing package, re-configure your device to use the new channel, and follow the steps in this document to install the package from the new location.

3. Note your distribution and version and identify the closest entry for it under `https://packages.microsoft.com/config/[distro]/`.

4. In the following commands, replace *[distro]* and *[version]* with the information you've identified.

   > [!NOTE]
   > In case of Oracle Linux and Amazon Linux 2, replace *[distro]* with "rhel". For Amazon Linux 2, replace *[version]* with "7". For Oracle Linux, replace *[version]* with the version of Oracle Linux.

   ```bash
   - name: Add Microsoft APT key
     apt_key:
       url: https://packages.microsoft.com/keys/microsoft.asc
       state: present
     when: ansible_os_family == "Debian"

   - name: Add Microsoft apt repository for MDATP
     apt_repository:
       repo: deb [arch=arm64,armhf,amd64] https://packages.microsoft.com/[distro]/[version]/prod [codename] main
       update_cache: yes
       state: present
       filename: microsoft-[channel]
     when: ansible_os_family == "Debian"

   - name: Add Microsoft DNF/YUM key
     rpm_key:
       state: present
       key: https://packages.microsoft.com/keys/microsoft.asc
     when: ansible_os_family == "RedHat"

   - name: Add  Microsoft yum repository for MDATP
     yum_repository:
       name: packages-microsoft-[channel]
       description: Microsoft Defender for Endpoint
       file: microsoft-[channel]
       baseurl: https://packages.microsoft.com/[distro]/[version]/[channel]/ 
       gpgcheck: yes
       enabled: Yes
     when: ansible_os_family == "RedHat"
   ```

5. Create the Ansible install and uninstall YAML files.

   - For apt-based distributions, use the following YAML file:

      ```bash
      cat install_mdatp.yml
      ```

      ```Output
      - hosts: servers
        tasks:
          - name: include onboarding tasks
            import_tasks:
              file: ../roles/onboarding_setup.yml
          - name: add apt repository
            import_tasks:
              file: ../roles/add_apt_repo.yml
          - name: Install MDATP
            apt:
              name: mdatp
              state: latest
              update_cache: yes
      ```

      ```bash
      cat uninstall_mdatp.yml
      ```

      ```Output
      - hosts: servers
        tasks:
          - name: Uninstall MDATP
            apt:
              name: mdatp
              state: absent
      ```

   - For dnf-based distributions, use the following YAML file:

      ```bash
      cat install_mdatp_dnf.yml
      ```

      ```Output
      - hosts: servers
        tasks:
          - name: include onboarding tasks
            import_tasks:
              file: ../roles/onboarding_setup.yml
          - name: add apt repository
            import_tasks:
              file: ../roles/add_yum_repo.yml
          - name: Install MDATP
            dnf:
              name: mdatp
              state: latest
              enablerepo: packages-microsoft-[channel]
      ```

      ```bash
      cat uninstall_mdatp_dnf.yml
      ```

      ```Output
      - hosts: servers
        tasks:
          - name: Uninstall MDATP
            dnf:
              name: mdatp
              state: absent
      ```

## Apply the playbook

In this step, you apply the playbook. Run the tasks files under `/etc/ansible/playbooks/` or relevant directory.

1. Installation:

   ```bash
   ansible-playbook /etc/ansible/playbooks/install_mdatp.yml -i /etc/ansible/hosts
   ```

   > [!IMPORTANT]
   > When the product starts for the first time, it downloads the latest antimalware definitions. Depending on your Internet connection, this can take up to a few minutes.

2. Validation/configuration:

   ```bash
   ansible -m shell -a 'mdatp connectivity test' all
   ```
  
   ```bash
   ansible -m shell -a 'mdatp health' all
   ```

3. Uninstallation:

   ```bash
   ansible-playbook /etc/ansible/playbooks/uninstall_mdatp.yml -i /etc/ansible/hosts
   ```

## Troubleshoot installation issues

For self-troubleshooting, follow these steps:

1. For information on how to find the log that's generated automatically when an installation error occurs, see [Log installation issues](linux-resources.md#log-installation-issues).

2. For information about common installation issues, see [Installation issues](/defender-endpoint/linux-support-install).

3. If health of the device is `false`, see [Defender for Endpoint agent health issues](/defender-endpoint/health-status).

4. For product performance issues, see [Troubleshoot performance issues](/defender-endpoint/linux-support-perf).

5. For proxy and connectivity issues, see [Troubleshoot cloud connectivity issues](/defender-endpoint/linux-support-connectivity).

6. To get support from Microsoft, open a support ticket, and provide the log files created by using the [client analyzer](/defender-endpoint/run-analyzer-macos-linux).

## How to configure policies for Microsoft Defender on Linux

You can configure antivirus or EDR settings on your endpoints using following methods:

- See [Set preferences for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-preferences).
- See [security settings management](/mem/intune/protect/mde-security-integration) to configure settings in the Microsoft Defender portal.

## Operating system upgrades

When upgrading your operating system to a new major version, you must first uninstall Defender for Endpoint on Linux, install the upgrade, and finally reconfigure Defender for Endpoint on Linux on your device.

## See also

- [Add or remove YUM repositories](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/yum_repository_module.html)
- [Manage packages with the dnf package manager](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/dnf_module.html)
- [Add and remove APT repositories](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_repository_module.html)
- [Manage apt-packages](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html)
- [Missing event issues](/defender-endpoint/linux-support-events)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
