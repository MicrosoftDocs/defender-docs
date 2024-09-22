---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 07/19/2022
ms.author: dacurwin
author: dcurwin
---

## Network requirements

Validate the following endpoints are configured for outbound access so that the Defender sensor can connect to Microsoft Defender for Cloud to send security data and events:

See the [required FQDN/application rules for Microsoft Defender for Containers](/azure/aks/outbound-rules-control-egress#microsoft-defender-for-containers).

By default, AKS clusters have unrestricted outbound (egress) internet access.

Defender sensor must connect to the configured Azure Monitor Log Analytics workspace. In the event egress from the cluster requires the use of Azure Monitor Private Link Scope (AMPLS), you must:

-    Define the cluster with Container Insights and a Log Analytics workspace
-    Configure the AMPLS with Query access mode and Ingestion access mode set to "Open"
-    Define the cluster Log Analytics workspace as a resource in the AMPLS
-    Create in the AMPLS a virtual network private endpoint between the virtual network (VNet) of the cluster and the Log Analytics resource. The virtual network private endpoint integrates with a private DNS zone.

Refer to [Create an Azure Monitor Private Link](/azure/azure-monitor/logs/private-link-configure#create-an-azure-monitor-private-link-scope) for instructions.
