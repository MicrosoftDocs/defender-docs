---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 07/27/2022
ms.author: dacurwin
author: dcurwin
ai-usage: ai-assisted
---

## Network requirements

The Defender sensor must connect to Microsoft Defender for Cloud to send security data and events. Configure the following endpoints for outbound access based on your cloud environment:

### Required endpoints

> [!NOTE]
> The Azure domains `*.ods.opinsights.azure.com` and `*.oms.opinsights.azure.com` no longer required for outbound access. For more information, see the [deprecation announcement](../release-notes.md#deprecation-notice-update-outbound-rules-for-microsoft-defender-for-containers).

| Azure domain  | Azure Government domain  | Azure operated by 21Vianet domain | Port |
| -------------------------- | -------------------------- | -------------------------- |---- |
| *.cloud.defender.microsoft.com| N/A                          | N/A                                | 443  |

### Other requirements

Arc-enabled Kubernetes clusters have their own network requirements. For the complete list of endpoints needed for Arc connectivity, see [Azure Arc-enabled Kubernetes network requirements](/azure/azure-arc/kubernetes/network-requirements).
