---
title: CloudPolicyEnforcementEvents table in the advanced hunting schema
description: Learn about the CloudPolicyEnforcementEvents table in the advanced hunting schema, which contains policy enforcement evaluation decisions and metadata of security gating events.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords:
  - NOCSH
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
appliesto:
    - Microsoft Defender XDR
    - Microsoft Sentinel in the Microsoft Defender portal
ms.topic: reference
ms.date: 03/30/2026
---

# CloudPolicyEnforcementEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The `CloudPolicyEnforcementEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains policy enforcement evaluation decisions and metadata of security gating events for various cloud platforms protected by the organization's [Microsoft Defender for Cloud](/azure/defender-for-cloud/concept-integration-365#advanced-hunting-in-xdr). Use this reference to construct queries that return information from this table.

> [!IMPORTANT]
> Some information relates to prereleased product, which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

Defender for Cloud populates this advanced hunting table with records. If your organization doesn't have Microsoft Defender for Cloud, queries that use the table won't work or return any results. For more information about prerequisites in integrating Defender for Cloud with Defender XDR, see [Microsoft Defender XDR integration](/azure/defender-for-cloud/concept-integration-365).


For information on other tables in the advanced hunting schema, see the [advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the record was generated |
| `ReportId` | `string` | Unique identifier for the event |
| `DataSource` | `string` | Data source of the cloud events; possible values: Google Kubernetes Engine, Elastic Kubernetes Service, or Azure Kubernetes Service |
| `SubscriptionId` | `string` | Unique identifier assigned to the Azure subscription |
| `ActionType` | `string` | Type of activity that resulted from the policy enforcement operation; possible values: Audit, Deny, or Allow |
| `AzureResourceId` | `string` | Unique identifier of the Azure resource associated with the event |
| `AwsResourceName` | `string` | Unique identifier specific to Amazon Web Services devices, containing the Amazon resource name | 	
| `GcpFullResourceName` | `string` | Unique identifier specific to Google Cloud Platform devices, containing a combination of zone and ID for GCP | 	 
| `Region` | `string` | The region associated with the Kubernetes cluster | 	 
| `ResourceKind` | `string` | Type or kind of Kubernetes resource created or managed (for example, pod or deployment) |  	 
| `ResourceName` | `string` | Name of the Kubernetes resource | 	 
| `KubernetesNamespace` | `string` | The Kubernetes namespace name | 	 
| `Reason` | `string` | Information explaining the action result | 	 
| `AdditionalFields` | `string` | Additional information about the entity or event | 



## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

