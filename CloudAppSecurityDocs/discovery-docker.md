---
title: Configure automatic log upload for continuous reports
description: This article describes the process configuring automatic log upload for continuous reports in Defender for Cloud Apps.
ms.date: 02/20/2023
ms.topic: how-to
---

# Configure automatic log upload for continuous reports

Log collectors enable you to easily automate log upload from your network. The log collector runs on your network and receives logs over Syslog or FTP. Each log is automatically processed, compressed, and transmitted to the portal. FTP logs are uploaded to Microsoft Defender for Cloud Apps after the file finished the FTP transfer to the Log Collector. For Syslog, the Log Collector writes the received logs to the disk. Then the collector uploads the file to Defender for Cloud Apps when the file size is larger than 40 KB.

After a log is uploaded to Defender for Cloud Apps, it's moved to a backup directory. The backup directory stores the last 20 logs. When new logs arrive, the old ones are deleted. Whenever the log collector disk space is full, the log collector drops new logs until it has more free disk space (this shouldn't happen if prerequisites are properly met). You'll receive a warning on the **Log collectors** tab of the **Upload logs automatically** settings when this happens.

Before setting up automatic log file collection, verify your log matches the expected log type. You want to make sure Defender for Cloud Apps can parse your specific file. For more information, see [Using traffic logs for cloud discovery](create-snapshot-cloud-discovery-reports.md#log-format).

> [!NOTE]
>
> - Defender for Cloud Apps provides support for forwarding logs from your SIEM server to the Log Collector assuming the logs are being forwarded in their original format. However, it is highly recommended that you integrate the log collector directly with your firewall and/or proxy.
> - The log collector compresses data before it is uploaded. The outbound traffic on the log collector will be 10% of the size of the traffic logs it receives.
> - If the log collector encounters issues, you will receive an alert after data wasn't received for 48 hours.

## Prerequisites

- Disk space 250 GB
- CPU cores: 2
- CPU Architecture: Intel® 64 and AMD 64
- RAM: 4 GB
- Set your firewall as described in [Network requirements](/defender-cloud-apps/network-requirements)

> [!NOTE]
> If you have an existing log collector and want to remove it before deploying it again, or if you simply want to remove it, run the following commands:
>
> `docker stop <collector_name>`
>
> `docker rm <collector_name>`


> [!Note]
> To install a new log collector version, you'll need to stop your log collector, remove the current image, and install the new one.

## Log collector performance

The Log collector can successfully handle log capacity of up to 50 GB per hour. The main bottlenecks in the log collection process are:

- Network bandwidth - Your network bandwidth determines the log upload speed.
- I/O performance of the virtual machine - Determines the speed at which logs are written to the log collector's disk. The log collector has a built-in safety mechanism that monitors the rate at which logs arrive and compares it to the upload rate. In cases of congestion, the log collector starts to drop log files. If your setup typically exceeds 50 GB per hour, it's recommended that you split the traffic between multiple log collectors.

## Related content

The Log Collector supports the **Container** deployment mode. For more information, see:

- [Configure automatic log upload using on-premises Docker on Windows](discovery-docker-windows.md)
- [Configure automatic log upload using Podman](discovery-linux-podman.md)
- [Configure automatic log upload using Docker in Azure](discovery-docker-ubuntu-azure.md)
- [Configure automatic log upload using Docker in Azure Kubernetes Service (AKS)](discovery-kubernetes.md)

## Next steps

> [!div class="nextstepaction"]
> [Working with cloud discovery data](working-with-cloud-discovery-data.md)

