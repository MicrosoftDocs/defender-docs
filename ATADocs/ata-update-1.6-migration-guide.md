---
# required metadata

title: Advanced Threat Analytics update to 1.6 migration guide
description: Procedures to update ATA to version 1.6
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: 0756ef64-3aef-4a69-8981-24fa8f285c6a

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.tgt_pltfrm:
#ms.custom:

---

# ATA update to 1.6 migration guide

The update to ATA 1.6 provides improvements in the following areas:

- New detections

- Improvements to existing detections

- The ATA Lightweight Gateway

- Automatic updates

- Improved ATA Center performance

- Lower storage requirements

- Support for IBM QRadar

## Updating ATA to version 1.6

> [!NOTE]
> If ATA is not installed in your environment, download the full version of ATA, which includes version 1.6 and follow the standard installation procedure described in [Install ATA](install-ata-step1.md).

If you already have ATA version 1.5 deployed, this procedure walks you through the steps necessary to update your deployment.

> [!NOTE]
> You cannot install ATA version 1.6 directly on top of ATA version 1.4. You must install ATA version 1.5 first. If you accidentally attempted to install ATA 1.6 without installing ATA 1.5, you get an error telling you that **A newer version is already installed on your machine.** You must uninstall the remnants of ATA 1.6 that remain on your computer - even though the installation failed - before you install ATA version 1.5.

Follow these steps to update to ATA version 1.6:

1. To avoid upgrade issues, make sure you follow steps 8 to 10 of **Migration failure when updating to ATA version 1.6** described in [What's new in ATA version 1.6](whats-new-version-1.6.md).
1. Make sure you have the necessary free space to complete the upgrade. You can perform the installation up to the readiness check to get an estimate of how much free space is needed, and then restart the upgrade after allocating the  necessary disk space.
1. [Download update 1.6](install-ata-step1.md#step-1-download-and-install-the-ata-center)<br>
In this version of, the same installation file (Microsoft ATA Center Setup.exe) is used for installing a new deployment of ATA and for upgrading existing deployments.

1. Update the ATA Center

1. Download the updated ATA Gateway package

1. Update the ATA Gateways

    > [!IMPORTANT]
    > Update all the ATA Gateways to make sure ATA functions properly.

### Step 1: Update the ATA Center

1. Back up your database: (optional)

    - If the ATA Center is running as a virtual machine and you want to take a checkpoint, shut down the virtual machine first.

    - If the ATA Center is running on a physical server, follow the recommended procedure to [back up MongoDB](https://www.mongodb.com/docs/manual/core/backups/).

1. Run the installation file, Microsoft ATA Center Setup.exe, and follow the instructions on the screen to install the update.

    1. ATA 1.6 requires .Net Framework 4.6.1 to be installed. If not already installed, ATA installation installs .Net Framework 4.6.1 as part of the installation.

        > [!NOTE]
        > The installation of .Net Framework 4.6.1 may require restarting the server. ATA installation will proceed only after the server was restarted.

    2. On the **Welcome** page, select your language and select **Next**.

    3. Read the End-User License Agreement and if you accept the terms, select **Next**.

    4. It is now possible to use Microsoft Update for ATA to remain up-to-date.  In the Microsoft Update page, select **Use Microsoft Update when I check for updates (recommended)**.
    ![Keep ATA up-to-date image.](media/ata_ms_update.png)
     This adjusts the Windows settings to enable updates for other Microsoft products (including ATA), as seen here.
    ![Windows auto-update image.](media/ata_installupdatesautomatically.png)

    5. Before installation begins, ATA performs a readiness check. Review the results of the check to make sure the prerequisites are configured successfully and that you have at least the minimum amount of disk space.
    ![ATA readiness check image.](media/ata_install_readinesschecks.png)

    6. Select **Update**. After you select **Update**, ATA is offline until the update procedure is complete.

1. After updating the ATA Center, the ATA Gateways will report that they are now outdated.

    ![Outdated gateways image.](media/ATA-center-outdated.png)

> [!IMPORTANT]
> Update all the ATA Gateways to make sure ATA functions properly.

### Step 2: Download the ATA Gateway setup package

After configuring the domain connectivity settings, you can download the ATA Gateway setup package.

To download the ATA Gateway package:

1. Delete any previous versions of the ATA Gateway package you previously downloaded.

1. On the ATA Gateway machine, open a browser and enter the IP address you configured in the ATA Center for the ATA Console. When the ATA Console opens, select the settings icon and select **Configuration**.

    ![Configuration settings icon.](media/ATA-config-icon.png)

1. In the **ATA Gateways** tab, select **Download ATA Gateway Setup**.

1. Save the package locally.

The zip file includes the following files:

- ATA Gateway installer

- Configuration setting file with the required information to connect to the ATA Center

### Step 3: Update the ATA Gateways

1. On each ATA Gateway, extract the files from the ATA Gateway package and run the file **Microsoft ATA Gateway Setup.exe**.

    > [!NOTE]
    > You can also use this ATA Gateway package to install new ATA Gateways.

1. Your previous settings are preserved, but it may take a few minutes for the service to restart.

1. Repeat this step for all other ATA Gateways deployed.

> [!NOTE]
> After successfully updating an ATA Gateway, the outdated notification for the specific ATA Gateway will be resolved.

You know that all the ATA Gateways have been successfully updated when all the ATA Gateways report that they are successfully synced and the message that an updated ATA Gateway package is available is no longer displayed.

![Updated gateways image.](media/ATA-gw-updated.png)

## See Also

- [Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
