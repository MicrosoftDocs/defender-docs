---
title: Configure automatic log upload using Azure Kubernetes Service | Microsoft Defender for Cloud Apps 
description: This article describes the process configuring automatic log upload for continuous reports in Defender for Cloud Apps using Azure Kubernetes Service.
ms.date: 06/02/2024
ms.topic: how-to
---

# Configure automatic log upload using Docker on Azure Kubernetes Service (AKS)

This article describes how to configure automatic log upload for continuous reports in Defender for Cloud Apps using a Docker container on Azure Kubernetes Service (AKS).

[!INCLUDE [Banner for top of topics](includes/banner.md)]

## Setup and configuration

1. Sign into Microsoft Defender XDR and select **Settings > Cloud Apps > Cloud Discovery > Automatic log upload**.

1. Make sure that you have a data source defined on the **Data sources** tab. If you don't, select **Add a data source** to add one. 

1. Select the **Log collectors** tab, which lists all the log collectors deployed on your tenant.

1. Select the **Add log collector** link. Then, in the **Create log collector** dialog enter:

    |Field  |Description  |
    |---------|---------|
    |**Name**     |    Enter a meaningful name, based on key information that the log collector uses, such as your internal naming standard or a site location.     |
    |**Host IP address or FQDN**     |  Enter your log collector's host machine or virtual machine (VM) IP address. Make sure that your syslog service or firewall can access the IP address / FQDN you enter. |
    |**Data source(s)**     |  Select the data source you want to use.  If you're using multiple data sources, the selected source is applied to a separate port so that the log collector can continue to send data consistently.  <br><br>For example, the following list shows examples of data source and port combinations: <br>- Palo Alto: 601 <br>- CheckPoint: 602 <br>- ZScaler: 603 |

1. Select **Create** to show further instructions on the screen for your specific situation.

1. Go to your AKS cluster configuration and run:

    ```AzureCLI
    kubectl config use-context <name of AKS cluster>
    ```

1. Run the helm command using the following syntax:

    ```AzureCLI
    helm install <release-name> oci://agentspublic.azurecr.io/logcollector-chart --version 1.0.0 --set inputString="<generated id> ",env.PUBLICIP="<public ip>",env.SYSLOG="true",env.COLLECTOR="<collector-name>",env.CONSOLE="<Console-id>",env.INCLUDE_TLS="on" --set-file ca=<absolute path of ca.pem file> --set-file serverkey=<absolute path of server-key.pem file> --set-file servercert=<absolute path of server-cert.pem file> --set replicas=<no of replicas> --set image.tag=0.272.0
    ```

    Find the values for the helm command using the docker command used when the collector is configured. For example:

    ```azurecli
    (echo <Generated ID>) | docker run --name SyslogTLStest
    ```

When successful, the logs show pulling an image from mcr.microsoft.com and continuing to create blobs for the container.

## Related content

For more information, see [Configure automatic log upload for continuous reports](discovery-docker.md). 
