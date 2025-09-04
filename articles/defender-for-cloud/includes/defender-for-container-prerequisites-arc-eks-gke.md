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

| Azure domain  | Azure Government domain  | Azure operated by 21Vianet domain | Port |
| -------------------------- | -------------------------- | -------------------------- |---- |
| *.ods.opinsights.azure.com | *.ods.opinsights.azure.us | *.ods.opinsights.azure.cn  | 443  |
| *.oms.opinsights.azure.com | *.oms.opinsights.azure.us | *.oms.opinsights.azure.cn | 443 |
| login.microsoftonline.com  | login.microsoftonline.us | login.chinacloudapi.cn  | 443  |

### Other requirements

Arc-enabled Kubernetes clusters have their own network requirements. For the complete list of endpoints needed for Arc connectivity, see [Azure Arc-enabled Kubernetes network requirements](/azure/azure-arc/kubernetes/network-requirements).
