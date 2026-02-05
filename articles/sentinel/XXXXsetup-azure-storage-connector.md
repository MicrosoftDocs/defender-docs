---
title: Set up your Azure Storage connector to stream logs to Microsoft Sentinel
description: Deploy and configure the Azure Storage Blob codeless connector to ingest data from Azure Storage into Microsoft Sentinel.
author: EdB-MSFT
ms.author: edbaynash
ms.reviewer: edbaynash
ms.date: 02/05/2026
ms.topic: how-to
ms.service: microsoft-sentinel

#customer intent: As a security engineer, I want to build and deploy an Azure Storage Blob connector using the codeless connector framework so I can ingest storage data into Microsoft Sentinel.
---

# Set up your Azure Storage connector to stream logs to Microsoft Sentinel

Use this article to deploy the Azure Storage Blob connector with the codeless connector framework (CCF) to ingest data from Azure Storage. The connector uses an Event Grid system topic and a storage queue to deliver blob-created events to Microsoft Sentinel for processing.

## Prerequisites
- An Azure Data Lake Storage Gen2 account (supports blobs and queues) with at least one container for your data.
- Permission to create resources in the target subscription and resource group.
- Permission to create a service principal and grant it access to the storage account (Owner/Contributor on the subscription and Storage Account roles for blob and queue access).
- Ability to deploy an Azure Resource Manager (ARM) template for the codeless connector.

## How the connector works
- An Event Grid system topic on the storage account emits blob-created events.
- Events are delivered to a storage queue (and optional dead-letter queue) scoped by prefix/suffix filters.
- The connector polls the queue, fetches the referenced blobs, and forwards the data to your workspace via a Data Collection Rule (DCR).
- Queue messages are deleted after successful forwarding.

## Step 1: Prepare storage resources
1. Create (or identify) an Azure Storage account with hierarchical namespace enabled.
2. Create a container for the incoming data.
3. Create a storage queue for Event Grid delivery and an optional dead-letter queue.
4. Grant Storage Blob Data Reader and Storage Queue Data Contributor (or equivalent) permissions to the connector service principal.

## Step 2: Configure Event Grid to publish to the queue
1. From the storage account, select **Events** and create a **System Topic** for blob-created events.
2. Add an event subscription targeting the storage queue. Configure prefix/suffix filters to scope the blobs to ingest (for example, a folder path and file extension).
3. Save the subscription and confirm events are landing in the queue.

## Step 3: Build the CCF connector payload
Use the StorageAccountBlobContainer kind when creating the data connector. Replace placeholders with your values.

```json
{
  "name": "<dataConnectorId>",
  "kind": "StorageAccountBlobContainer",
  "etag": "",
  "properties": {
    "connectorDefinitionName": "<definitionName>",
    "auth": {
      "type": "ServicePrincipal"
    },
    "request": {
      "QueueUri": "https://<storageAccount>.queue.core.windows.net/<queueName>",
      "DlqUri": "https://<storageAccount>.queue.core.windows.net/<dlqName>"
    },
    "dcrConfig": {
      "streamName": "Custom-<streamName>",
      "dataCollectionEndpoint": "https://<dce>.ingest.monitor.azure.com",
      "dataCollectionRuleImmutableId": "<dcrImmutableId>"
    },
    "response": {
      "EventsJsonPaths": ["$"],
      "format": "json"
    }
  }
}
```

> [!NOTE]
> Leave `etag` empty for creation. For updates, supply the current `etag` value.

## Step 4: Deploy the connector
1. Use the **Data Connectors - Create or Update** API with the payload from Step 3.
2. Confirm the connector appears in Microsoft Sentinel and that the connection state is **Healthy**.
3. If deployment fails, verify the API version and required permissions on the subscription and workspace.

## Step 5: Validate ingestion
1. Upload test blobs that match your prefix/suffix filters.
2. Check the storage queue to confirm Event Grid delivered messages.
3. In Microsoft Sentinel, query the target table defined in your DCR stream to verify events are ingested.
4. If messages remain in the queue, verify the service principal permissions and the queue URIs in the connector configuration.

## Troubleshooting
- Ensure the service principal tied to the managed application exists in your tenant and has the required role assignments on the storage account and queues.
- Confirm Event Grid is delivering events by reviewing subscription metrics and dead-letter queues.
- Verify DCR details (stream name, DCE endpoint, immutable ID) match the deployed DCR.
- Use diagnostic logs on the storage account and Event Grid to investigate delivery or authorization errors.

## Next steps
- Create or refine data connector rules using the codeless connector framework. See [Create a codeless connector for Microsoft Sentinel](/azure/sentinel/create-codeless-connector#data-connection-rules).
- Review the API parameters and examples in the [Azure Storage Blob connectors API reference](/azure/sentinel/data-connection-rules-reference-gcp).
- Secure the connector resources with network perimeters by following [Enable Network Security for Azure Storage Connector](enable-storage-network-security-how-to.md).
