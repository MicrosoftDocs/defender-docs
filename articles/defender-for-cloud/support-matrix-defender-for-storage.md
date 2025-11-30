---
title: Prerequisites for Microsoft Defender for Storage
description: Learn about the prerequisites and permissions required to enable Microsoft Defender for Storage and its features of malware scanning and sensitive-data threat detection.
ms.topic: reference
author: dcurwin
ms.author: dacurwin
ms.date: 11/30/2025
---

# Prerequisites for Microsoft Defender for Storage

This article lists the prerequisites and permissions required to [enable Microsoft Defender for Storage](tutorial-enable-storage-plan.md) and its features.

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- The following storage types are supported:

| Azure Blob Standard | Azure Blob Standard + Azure Files NFS | Azure Blob Premium v2 | Azure Page Blob | Azure Data Lake Storage Gen2 | Azure File Premium Provisioned v1 | Azure File Premium Provisioned v2 |
|--|--|--|--|--|--|--|--|--|
| Activity Monitoring | Supported | Not supported | Supported | Supported | Supported | Supported | Supported |
| Sensitive Data Discovery | Supported | Not supported | Supported | Supported  | Supported | Not supported | Not supported |
| On-upload Malware Scanning | Supported | Supported | Supported only for blobs | Not supported | Supported only for blobs | Not supported | Not supported |
| On-demand Malware Scanning | Supported | Supported | Supported | Not supported | Supported | Not supported | Not supported |

- Storage accounts that belong to a resource group with any of the following names are not supported: `App_Browsers`, `App_Code`, `App_Data`, `App_GlobalResources`, `App_LocalResources`, `App_Themes`, `App_WebReferences`, `Bin`.

## Permissions

Depending on the scenario, you need different levels of permissions to enable Defender for Storage and its features. You can enable and configure Defender for Storage at the subscription level or at the storage account level. You can also use built-in Azure policies to enable Defender for Storage and enforce its enablement on a desired scope.

The following table summarizes the permissions that you need for each scenario. The permissions are either built-in Azure roles or action sets that you can assign to custom roles.

| Capability | Subscription level | Storage account level |
|---------|---------|---------|
|Activity monitoring |Security Admin or Pricings/read, Pricings/write |Security Admin or Microsoft.Security/defenderforstoragesettings/read, Microsoft.Security/defenderforstoragesettings/write |
|Malware scanning |Subscription Owner or action set 1 |Action set 2 |
|Sensitive-data threat detection |Subscription Owner or action set 1 |Action set 2 |

> [!NOTE]
> Activity monitoring is always enabled when you enable Defender for Storage.

The action sets are collections of Azure resource provider operations that you can use to create custom roles. The action sets for enabling Defender for Storage and its features are as follows.

### Action set 1: Enablement and configuration at the subscription level

- Microsoft.Security/pricings/write
- Microsoft.Security/pricings/read
- Microsoft.Security/pricings/SecurityOperators/read
- Microsoft.Security/pricings/SecurityOperators/write
- Microsoft.Authorization/roleAssignments/read
- Microsoft.Authorization/roleAssignments/write
- Microsoft.Authorization/roleAssignments/delete

### Action set 2: Enablement and configuration at the storage account level

- Microsoft.Storage/storageAccounts/write
- Microsoft.Storage/storageAccounts/read
- Microsoft.Security/datascanners/read (must be granted at subscription level)
- Microsoft.Security/datascanners/write (must be granted at subscription level)
- Microsoft.Security/defenderforstoragesettings/read
- Microsoft.Security/defenderforstoragesettings/write
- Microsoft.EventGrid/eventSubscriptions/read
- Microsoft.EventGrid/eventSubscriptions/write
- Microsoft.EventGrid/eventSubscriptions/delete
- Microsoft.Authorization/roleAssignments/read
- Microsoft.Authorization/roleAssignments/write
- Microsoft.Authorization/roleAssignments/delete

## Related content

- [Common questions about Defender for Storage](faq-defender-for-storage.yml)
