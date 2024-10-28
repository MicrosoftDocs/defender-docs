---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 07/19/2022
ms.author: dacurwin
author: dcurwin
---

## Network requirements

Validate that the following endpoints are configured for outbound access so that the Defender sensor can connect to Microsoft Defender for Cloud to send security data and events.

The Defender sensor must connect to the configured Azure Monitor Log Analytics workspace. By default, AKS clusters have unrestricted outbound (egress) internet access. If event egress from the cluster requires the use of an Azure Monitor Private Link Scope (AMPLS), you must:

- Define the cluster with Container insights and a Log Analytics workspace.
- Configure the AMPLS with query access mode and ingestion access mode set to **Open**.
- Define the cluster's Log Analytics workspace as a resource in the AMPLS.
- Create in the AMPLS a virtual network private endpoint between the virtual network of the cluster and the Log Analytics resource. The virtual network private endpoint integrates with a private DNS zone.

For instructions, refer to [Create an Azure Monitor Private Link Scope](/azure/azure-monitor/logs/private-link-configure#create-an-azure-monitor-private-link-scope).
