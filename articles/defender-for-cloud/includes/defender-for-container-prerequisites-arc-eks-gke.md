---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 07/27/2022
ms.author: dacurwin
author: dcurwin
---

## Network requirements

Validate that the following endpoints for public cloud deployments are configured for outbound access. Configuring them for outbound access helps ensure that the Defender sensor can connect to Microsoft Defender for Cloud to send security data and events.

> [!NOTE]
> The Azure domains *.ods.opinsights.azure.com, *.ods.opinsights.azure.com and login.microsoftonline.com are no longer required for outbound access. For more information, see the [deprecation announcement](../release-notes.md#deprecation-notice-update-outbound-rules-for-microsoft-defender-for-containers).

| Azure domain  | Azure Government domain  | Azure operated by 21Vianet domain | Port |
| -------------------------- | -------------------------- | -------------------------- |---- |
| *.cloud.defender.microsoft.com| N/A                          | N/A                                | 443  |

You also need to validate the [Azure Arc-enabled Kubernetes network requirements](/azure/azure-arc/kubernetes/network-requirements).
