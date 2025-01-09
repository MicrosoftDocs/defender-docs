---
title: Configure automatic log upload using Docker in Azure 
description: This article describes the process configuring automatic log upload for continuous reports in Defender for Cloud Apps using a Docker on Linux in Azure.
ms.date: 01/29/2023
ms.topic: how-to
---
# Configure automatic log upload using Docker in Azure

This article describes how to configure automatic log uploads for continuous reports in Defender for Cloud Apps using a Docker on Ubuntu or CentOS in Azure.

## Prerequisites

Before you start, make sure that your environment meets the following requirements:

|Requirement  |Description  |
|---------|---------|
|**OS**     |   One of the following: <br>- Ubuntu 14.04, 16.04, 18.04, and 20.04 <br>- CentOS 7.2 or higher     |
|**Disk space**     |   250 GB      |
|**CPU cores**     |    2     |
|**CPU architecture**     |     Intel 64 and AMD 64    |
|**RAM**     |     4 GB    |
| **Firewall configuration** | As defined in [Network requirements](network-requirements.md#log-collector) |

### Plan your log collectors by performance

Each log collector can successfully handle log capacity of up to 50 GB per hour comprised of up to 10 data sources. The main bottlenecks in the log collection process are:

* Network bandwidth - Your network bandwidth determines the log upload speed.

* I/O performance of the virtual machine - Determines the speed at which logs are written to the log collector's disk. The log collector has a built-in safety mechanism that monitors the rate at which logs arrive and compares it to the upload rate. In cases of congestion, the log collector starts to drop log files. If your setup typically exceeds 50 GB per hour, we recommend that you split the traffic between multiple log collectors.

If you require more than 10 data sources, we recommend that you split the data sources between multiple log collectors.

## Define your data sources

1. In the Microsoft Defender Portal, select **Settings > Cloud Apps > Cloud Discovery > Automatic log upload**.

1. On the **Data sources** tab, create a matching data source for each firewall or proxy from which you want to upload logs:

    1. Select **Add data source**.

    1. In the **Add data source** dialog, enter a name for your data source, and then select the source and receiver type.

        Before selecting a source, select **View sample of expected log file** and compare your log with the expected format. If your log file format doesn't match this sample, add your data source as **Other**.

        To work with a network appliance that isn't listed, select **Other > Customer log format** or **Other (manual only)**. For more information, see [Working with the custom log parser](custom-log-parser.md).

    >[!NOTE]
    >Integrating with secure transfer protocols (FTPS and Syslog – TLS) often requires additional settings or your firewall/proxy.

Repeat this process for each firewall and proxy whose logs can be used to detect traffic on your network.

We recommend that you set up a dedicated data source per network device, enabling you to monitor the status of each device separately for investigation purposes, and to explore Shadow IT Discovery per device if each device is used by a different user segment.

## Create a log collector

1. In the Microsoft Defender Portal, select **Settings > Cloud Apps > Cloud Discovery > Automatic log upload**.

1. On the **Log collectors** tab, select **Add log collector**.

1. In the **Create log collector** dialog, enter the following details:

    - A name for your log collector
    - The host IP address, which is the private IP address of the machine you'll use to deploy the Docker. The host IP address can also be replaced with the machine name, if there is a DNS server or equivalent to resolve the host name.

    Then select the **Data source(s)** box to select the data sources you want to connect to the collector, and select **Update** to save your changes. Each log collector can handle multiple data sources.

    The **Create log collector** dialog shows further deployment details, including a command to import the collector configuration. For example:

    :::image type="content" source="media/discovery-docker-ubuntu-azure/import-collector.png" alt-text="Screenshot of the command to copy from the Create log collector dialog.":::

1. Select the ![copy to clipboard icon.](media/copy-icon.png) **Copy** icon next to the command to copy it to your clipboard.

    The details displayed in the **Create log collector** dialog differ, depending on the selected source and receiver types. For example, if you selected Syslog, the dialog includes details about which port the syslog listener is listening on.

    Copy the contents of the screen and save them locally, as you'll need them when you configure the log collector to communicate with Defender for Cloud Apps.

1. Select **Export** to export the source configuration to a .CSV file that describes how to configure the log export in your appliances.

> [!TIP]
> For users sending log data via FTP for the first time, we recommend changing the password for the FTP user. For more information, see [Changing the FTP password](log-collector-advanced-management.md#change-the-ftp-password).

## Deploy your machine in Azure

This procedure describes how to deploy your machine with Ubuntu. The deployment steps for other platforms are slightly different.

1. Create a new Ubuntu machine in your Azure environment.
1. After the machine is up, open the ports:

    1. In the machine view, go to **Networking** select the relevant interface by double-clicking on it.
    1. Go to **Network security group** and select the relevant network security group.
    1. Go to **Inbound security rules** and click **Add**.
    1. Add the following rules (in **Advanced** mode):

        |Name|Destination port ranges|Protocol|Source|Destination|
        |----|----|----|----|----|
        |caslogcollector_ftp|21|TCP|`Your appliance's IP address's subnet`|Any|
        |caslogcollector_ftp_passive|20000-20099|TCP|`Your appliance's IP address's subnet`|Any|
        |caslogcollector_syslogs_tcp|601-700|TCP|`Your appliance's IP address's subnet`|Any|
        |caslogcollector_syslogs_udp|514-600|UDP|`Your appliance's IP address's subnet`|Any|

    For more information, see [Work with security rules](/azure/virtual-network/manage-network-security-group#work-with-security-rules).

1. Go back to the machine and click **Connect** to open a terminal on the machine.

1. Change to root privileges using `sudo -i`.

1. If you accept the [software license terms](https://go.microsoft.com/fwlink/?linkid=862492), uninstall old versions and install Docker CE by running the commands appropriate for your environment:

    #### [CentOS](#tab/centos)

    1. Remove old versions of Docker: `yum erase docker docker-engine docker.io`
    1. Install Docker engine prerequisites: `yum install -y yum-utils`
    1. Add Docker repository:

        ```bash
        yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        yum makecache
        ```

    1. Install Docker engine: `yum -y install docker-ce`
    1. Start Docker

        ```bash
        systemctl start docker
        systemctl enable docker
        ```

    1. Test Docker installation: `docker run hello-world`

    #### [Ubuntu](#tab/ubuntu)

    1. Remove old versions of Docker: `apt-get remove docker docker-engine docker.io`
    1. If you are installing on Ubuntu 14.04, install the linux-image-extra package.

        ```bash
        apt-get update -y
        apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
        ```

    1. Install Docker engine prerequisites:

        ```bash
        apt-get update -y
        (apt-get install -y apt-transport-https ca-certificates curl software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - )
        ```

    1. Verify that the apt-key fingerprint UID is docker@docker.com: `apt-key fingerprint | grep uid`
    1. Install Docker engine:

        ```bash
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        apt-get update -y
        apt-get install -y docker-ce
        ```

    1. Test Docker installation: `docker run hello-world`

    ---

1. Run the command that you'd copied earlier from the **Create log collector** dialog. For example:

    ```bash
    (echo db3a7c73eb7e91a0db53566c50bab7ed3a755607d90bb348c875825a7d1b2fce) | docker run --name MyLogCollector -p 21:21 -p 20000-20099:20000-20099 -e "PUBLICIP='192.168.1.1'" -e "PROXY=192.168.10.1:8080" -e "CONSOLE=mod244533.us.portal.cloudappsecurity.com" -e "COLLECTOR=MyLogCollector" --security-opt apparmor:unconfined --cap-add=SYS_ADMIN --restart unless-stopped -a stdin -i mcr.microsoft.com/mcas/logcollector starter
    ```

1. To verify that the log collector is running properly, run the following command: `Docker logs <collector_name>`. You should get the results: **Finished successfully!**

## Configure network appliance on-premises settings

Configure your network firewalls and proxies to periodically export logs to the dedicated Syslog port of the FTP directory according to the directions in the dialog. For example:

```bash
BlueCoat_HQ - Destination path: \<<machine_name>>\BlueCoat_HQ\
```

### Verify your deployment in Defender for Cloud Apps

Check the collector status in the **Log collector** table and make sure the status is **Connected**. If it's **Created**, it's possible the log collector connection and parsing haven't completed.

For example:

:::image type="content" source="media/collector-status-connected.png" alt-text="Screenshot of a connected collector status." lightbox="media/collector-status-connected.png":::


You can also go to the **Governance log** and verify that logs are being periodically uploaded to the portal.

Alternatively, you can check the log collector status from within the docker container using the following commands:

1. Log in to the container by using this command: `docker exec -it <Container Name> bash`
1. Verify the log collector status using this command: `collector_status -p`

If you have problems during deployment, see [Troubleshooting cloud discovery](troubleshooting-cloud-discovery.md).

## Optional - Create custom continuous reports

Verify that the logs are being uploaded to Defender for Cloud Apps and that reports are generated. After verification, create custom reports. You can create custom discovery reports based on Microsoft Entra user groups. For example, if you want to see the cloud use of your marketing department, import the marketing group using the import user group feature. Then create a custom report for this group. You can also customize a report based on IP address tag or IP address ranges.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **Cloud Discovery**, select **Continuous reports**.
1. Click the **Create report** button and fill in the fields.
1. Under the **Filters** you can filter the data by data source, by [imported user group](user-groups.md), or by [IP address tags and ranges](ip-tags.md).

    >[!NOTE]
    >When applying filters on continuous reports, the selection will be included, not excluded. For example, if you apply a filter on a certain user group, only that user group will be included in the report.

     ![Screenshot of a custom continuous report.](media/custom-continuous-report.png)

## Remove your log collector

If you have an existing log collector and want to remove it before deploying it again, or if you simply want to remove it, run the following commands:

```console
docker stop <collector_name>
docker rm <collector_name>
```

## Next steps

> [!div class="nextstepaction"]
> [Modify the log collector FTP configuration](log-collector-advanced-management.md)

[!INCLUDE [Open support ticket](includes/support.md)]
