---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 07/19/2022
ms.author: elkrieger
author: Elazark
---

### Network requirements

The Defender sensor must connect to Microsoft Defender for Cloud to send security data and events. Make sure that the required endpoints are configured for outbound access.

#### Connection requirements

The Defender sensor needs connectivity to:

- Microsoft Defender for Cloud (for sending security data and events)

By default, AKS clusters have unrestricted outbound (egress) internet access.

For clusters with restricted egress, you must allow specific FQDNs for Microsoft Defender for Containers to function properly. See [Microsoft Defender for Containers - Required FQDN/application rules](/azure/aks/outbound-rules-control-egress#microsoft-defender-for-containers) in the AKS outbound network documentation for the required endpoints.

#### Private link configuration

If event egress from the cluster requires the use of an Azure Monitor Private Link Scope (AMPLS), you must:

1. Define the cluster with Container insights and a Log Analytics workspace
1. Define the cluster's Log Analytics workspace as a resource in the AMPLS
1. Create a virtual network private endpoint in the AMPLS between:
   - The virtual network of the cluster
   - The Log Analytics resource

   The virtual network private endpoint integrates with a private DNS zone.

For instructions, see [Create an Azure Monitor Private Link Scope](/azure/azure-monitor/logs/private-link-configure#create-an-azure-monitor-private-link-scope).
