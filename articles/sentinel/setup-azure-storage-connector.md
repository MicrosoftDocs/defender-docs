---
title: Set up the Azure Storage connector to stream logs to Microsoft Sentinel
description: Learn how to set up the Azure Storage Blob connector to ingest logs from Azure Storage into Microsoft Sentinel using the Codeless Connector Framework.
author: EdB-MSFT
ms.author: edbaynash
ms.reviewer: edbaynash
ms.date: 02/05/2026
ms.topic: how-to
ms.service: microsoft-sentinel

#customer intent: As a security engineer, I want to set up an Azure Storage Blob connector so that I can ingest logs from Azure Storage into Microsoft Sentinel.

---

# Set up your Azure Storage connector to stream logs to Microsoft Sentinel

The Azure Storage Blob connector simplifies the process of collecting logs from Azure Storage. This connector enables ISVs and users to build scalable connectors on top of integrations with Azure Storage through the fully managed Codeless Connector Framework (CCF) solution.

This article describes the underlying resources used to facilitate the connector and provides step-by-step instructions for creating your first Azure Storage connector.

## Prerequisites

Before you begin, ensure you have the following:

- An Azure Data Lake Storage Gen 2 account (supports blobs and queues) with a container created for the data.
- A Microsoft Sentinel workspace with the required permissions to create data connectors.
- Permissions to create and manage Event Grid system topics and subscriptions on the storage account.

## Connector resource overview

The Azure Storage Blob connector uses a queue-based blob-pointer model to subscribe to blob created events in your storage account. An Event Grid system topic subscription listens for blob creation activity and pushes events based on a configurable filtering criterion to the Azure Storage queue. This allows multiple connector instances to ingest from the same Azure Storage container while scoping the files based on separate folder directories and file patterns. This filtering can be controlled through the portal or the connector ARM template to scope the blob prefix and suffix patterns.

:::image type="content" source="./media/setup-azure-storage-connector/overview-diagram.png" lightbox="./media/setup-azure-storage-connector/overview-diagram.png" alt-text="A diagram showing the Azure Storage Blob connector architecture, including blob created events, Event Grid, storage queue, and Microsoft Sentinel ingestion flow.":::

The Microsoft Sentinel connector:

- Polls the Azure Storage queue frequently for messages, filtering to blob created events.
- Fetches the files from the Azure Storage Blob container based on the path specified in the queue message.
- On successful forwarding to the destination, deletes the queue message.

To authenticate with the Azure Storage Blob container and queue, the connector uses a service principal accessible to the connector's application. For details on the application per Azure environment, see the [Azure Storage Blob connectors API reference](data-connection-rules-reference-azure-storage.md). We strongly recommend that you use the automation in the ARM template to validate that the service principal exists and apply necessary role-based access to the storage account.

## Create an Azure Storage Blob connector

To create your first Azure Storage Blob connector, follow these steps:

1. Review and update the example template included in the [Azure Storage Blob connectors API reference](data-connection-rules-reference-azure-storage.md#build-the-azure-storage-blob-ccf-data-connector).
1. Follow the steps in [Create a codeless connector for Microsoft Sentinel](create-codeless-connector.md#data-connection-rules) to deploy the connector using the template.

## Troubleshooting

For information on troubleshooting Azure Storage Blob connector issues, see the following resources:

- Verify that the Event Grid system topic subscription is correctly configured to push blob created events to the storage queue.
- Confirm that the service principal has the required roles assigned on the storage account (blob read and queue contribute).
- Check the Data Collection Rule (DCR) configuration to ensure the stream name, data collection endpoint, and immutable ID are correct.
- Review the connector health status in Microsoft Sentinel for any ingestion errors.

## Related content

- [Azure Storage Blob connectors API reference](data-connection-rules-reference-azure-storage.md)
- [Create a codeless connector for Microsoft Sentinel](create-codeless-connector.md)
- [Enable network security on connector integrated storage resources](enable-storage-network-security-how-to.md)