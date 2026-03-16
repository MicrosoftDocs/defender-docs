---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 03/16/2026
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

For instructions, see [Microsoft Security Private Link for Microsoft Defender for Cloud](../concept-private-links.md).
