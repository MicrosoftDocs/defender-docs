---
title: Microsoft Security Private Link for Microsoft Defender for Cloud
description: Learn how Microsoft Security Private Link provides secure, private connectivity between your virtual network and Microsoft Defender for Cloud.
ms.topic: concept-article
author: ElazarK
ms.author: elkrieger
ms.date: 06/14/2026
---

# Microsoft Security Private Link for Microsoft Defender for Cloud

Microsoft Security Private Link allows workloads in your virtual network to connect to Microsoft Defender for Cloud. You enable this connection by creating a Security Private Link resource in your subscription and private endpoints in your Azure virtual networks that connect to it.

With private endpoints, all security-related traffic from your workloads traverses the Microsoft backbone network without exposure to the public internet. This includes telemetry from Defender agents, sensors, add-ons, and extensions.

> [!IMPORTANT]
> Microsoft Security Private Link currently supports only Defender for Containers scenarios and isn't supported in sovereign cloud regions, including Azure Government and Azure operated by 21Vianet.

## Supported scenarios

Microsoft Security Private Link supports the following scenarios:

- **Network-isolated environments**  
  Protect workloads in isolated or restricted networks where outbound internet access is limited or not permitted.

- **Hybrid and on-premises connectivity**  
  Securely connect on-premises or hybrid environments to Microsoft Defender for Cloud by using [virtual private network (VPN)](/azure/vpn-gateway/vpn-gateway-about-vpngateways) or [ExpressRoute](/azure/expressroute/expressroute-locations) with private peering.

> [!IMPORTANT]
> For network-isolated workloads, Microsoft Security Private Link replaces the need for Azure Monitor Private Link Scope (AMPLS) and Azure Firewall egress rules.

## Connectivity architecture

Microsoft Security Private Link uses Azure Private Endpoints to establish private connectivity between your virtual network and Defender for Cloud. This allows workloads to connect to Defender for Cloud endpoints using their existing fully qualified domain names (FQDNs) and authorization model.

How it works:

- You create a private endpoint in your virtual network and assign it an IP address from the virtual network address space.

- All traffic between your workloads and Defender services flows through the Microsoft backbone network, never traversing the public internet.

- Multiple Defender services can share a single Security Private Link resource, simplifying network architecture.

> [!NOTE]
> Using private endpoints might incur additional Azure costs depending on the number of endpoints and the selected architecture. For more information, see [Azure Private Link pricing](https://azure.microsoft.com/pricing/details/private-link/).

:::image type="content" source="media/concept-private-links/security-private-link-diagram.png" alt-text="Diagram showing how Microsoft Defender for Cloud connects to protected resources through private endpoints." lightbox="media/concept-private-links/security-private-link-diagram.png":::

## Roles and permissions

Microsoft Security Private Link uses [Azure role-based access control (RBAC)](/azure/role-based-access-control/overview) to manage access to the Security Private Link resource and private endpoint connections. The following roles are typically involved:

- **Private Link resource owner**  
  Owns the Microsoft Security Private Link resource and can approve, reject, or delete private endpoint connection requests.

- **Network Contributor**  
  Can create private endpoints within a virtual network.

- **Security Admin**  
  Can approve, reject, or delete private endpoint connections but can't create private endpoints in a virtual network unless extra network permissions are granted.

These roles can be assigned to different users or teams to separate network management from security governance responsibilities.

## Approval workflow

Private endpoint connections to Microsoft Security Private Link resources follow the standard [Azure Private Link approval workflow](/azure/private-link/private-endpoint-overview#access-to-a-private-link-resource-using-approval-workflow).

When a private endpoint is created, a connection request is sent to the owner of the Microsoft Security Private Link resource. The resource owner can approve or reject the request from the **Private endpoint connections** tab in the Azure portal.

If the user requesting the private endpoint is also an owner of the Security Private Link, the request is automatically approved.

Approved and pending connections can be managed at any time through the Private Link resource in the Azure portal.

## DNS configuration

When you create a private endpoint, a [private DNS zone](/azure/dns/private-dns-overview) is provisioned by default that corresponds to the Defender for Cloud private link subdomain `*.defender.microsoft.com`.

> [!NOTE]
> For details about how to configure DNS for private endpoints, see [Azure Private Endpoint DNS integration](/azure/private-link/private-endpoint-dns).

When workloads connect to Microsoft Defender for Cloud service endpoints from within the virtual network with private endpoints configured, the FQDN resolves to the private IP address of the endpoint. Connections from outside the virtual network (if public access is still enabled) resolve to the public endpoint.

Each Microsoft Defender for Cloud service uses specific domain endpoints. For example:

- Defender for Containers CNAME record: `*.cloud.defender.microsoft.com` points to `*.privatelink.cloud.defender.microsoft.com` on port 443.
- Defender for Containers A record: `*.privatelink.cloud.defender.microsoft.com` points to `10.0.0.5` on port 443.

If you're using a custom DNS server, configure delegation or A records to resolve FQDNs to the private endpoint IP address.

## Connectivity comparison with Microsoft Security Private Link

- Internet exposure: without a private endpoint, yes; with Security Private Link, no.
- Compliance alignment: without a private endpoint, limited; with Security Private Link, strong.
- Multi-service integration: without a private endpoint, manual; with Security Private Link, simplified.

## Related content

- [Configure private endpoints with Microsoft Security Private Link](configure-private-endpoints.md)
- Learn more about [Azure Private Link](/azure/private-link).
