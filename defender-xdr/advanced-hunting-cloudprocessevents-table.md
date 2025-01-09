---
title: CloudProcessEvents table in the advanced hunting schema
description: Learn about the CloudProcessEvents table in the advanced hunting schema, which contains information about process events in multicloud hosted environments.
search.appverid: met150
ms.service: defender-xdr
ms.subservice: adv-hunting
f1.keywords:
  - NOCSH
ms.author: maccruz
author: schmurky
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.custom: 
- cx-ti
- cx-ah
ms.topic: reference
ms.date: 11/11/2024
---

# CloudProcessEvents (Preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- Microsoft Defender XDR

The `CloudProcessEvents` table in the [advanced hunting](advanced-hunting-overview.md) schema contains information about process events in multicloud hosted environments such as Azure Kubernetes Service, Amazon Elastic Kubernetes Service, and Google Kubernetes Engine as protected by the organization's [Microsoft Defender for Cloud](/azure/defender-for-cloud/concept-integration-365#advanced-hunting-in-xdr). Use this reference to construct queries that return information from this table.

> [!IMPORTANT]
> Some information relates to prereleased product which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.

For information on other tables in the advanced hunting schema, see the [advanced hunting reference](advanced-hunting-schema-tables.md).

| Column name | Data type | Description |
|-------------|-----------|-------------|
| `Timestamp` | `datetime` | Date and time when the event was recorded |
| `AzureResourceId` | `string` | 	Unique identifier of the Azure resource associated with the process |
| `AwsResourceName` | `string` | Unique identifier specific to Amazon Web Services devices, containing the Amazon resource name|
| `GcpFullResourceName` | `string` | Unique identifier specific to Google Cloud Platform devices, containing a combination of zone and ID for GCP |
| `ContainerImageName` | `string` | The container image name or ID, if it exists |
| `KubernetesNamespace` | `string` | The Kubernetes namespace name |
| `KubernetesPodName` | `string` | The Kubernetes pod name | 	
| `KubernetesResource` | `string` | Identifier value that includes namespace, resource type and name | 	 
| `ContainerName` | `string` | Name of the container in Kubernetes or another runtime environment | 	 
| `ContainerId`	 | `string` | The container identifier in Kubernetes or another runtime environment|  	 
| `ActionType` | `string` | Type of activity that triggered the event. See the in-portal schema reference for details.| 	 
| `FileName` | `string` | Name of the file that the recorded action was applied to | 	 
| `FolderPath` | `string` | Folder containing the file that the recorded action was applied to| 	 
| `ProcessId` | `long` | Process ID (PID) of the newly created process | 	 
| `ProcessName` | `string` | The name of the process  | 	 
| `ParentProcessName` | `string` | The name of the parent process | 	 
| `ParentProcessId` | `string` | The process ID (PID) of the parent process| 	 
| `ProcessCommandLine` | `string` | Command line used to create the new process| 	 
| `ProcessCreationTime` | `datetime` | Date and time the process was created | 	 
| `ProcessCurrentWorkingDirectory` | `string` | Current working directory of the running process | 	 
| `AccountName` | `string` | User name of the account | 	 
| `LogonId` | `long` | Identifier for a logon session. This identifier is unique on the same pod or container between restarts.	| 	 
| `InitiatingProcessId` | `string` | Process ID (PID) of the process that initiated the event | 	 
| `AdditionalFields` | `string` | Additional information about the event in JSON array format | 	 


## Sample queries

You can use this table to get detailed information on processes invoked in a cloud environment. The information is useful in hunting scenarios and can discover threats that can be observed through process details, like malicious processes or command-line signatures. 

You can also investigate security alerts provided by Defender for Cloud that make use of the cloud process events data in advanced hunting to understand details in the process tree for processes that include a security alert.

### Process events by command-line arguments
To hunt for process events including a given term (represented by "x" in the query below) in the command-line arguments:

```kusto
CloudProcessEvents | where ProcessCommandLine has "x"
```

### Rare process events for a pod in a Kubernetes cluster
To investigate unusual process events invoked as part of a pod in a Kubernetes cluster: 

```kusto
CloudProcessEvents | where AzureResourceId = "x" and KubernetesNamespace = "y" and KubernetesPodName = "z" | summarize count() by ProcessName | top 10 by count_ asc
```

## Related topics

- [Advanced hunting overview](advanced-hunting-overview.md)
- [Learn the query language](advanced-hunting-query-language.md)
- [Use shared queries](advanced-hunting-shared-queries.md)
- [Hunt across devices, emails, apps, and identities](advanced-hunting-query-emails-devices.md)
- [Understand the schema](advanced-hunting-schema-tables.md)
- [Apply query best practices](advanced-hunting-best-practices.md)

