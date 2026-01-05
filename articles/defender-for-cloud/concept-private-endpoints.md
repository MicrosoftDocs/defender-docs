---
title: Private endpoints with Microsoft Defender
description: Learn about using private endpoints with Microsoft Defender for Cloud to ensure secure and private connectivity in your virtual network.
author: Elazark
ms.author: elkrieger
ms.topic: article
ms.date: 12/02/2025
---

# Private endpoints with Microsoft Defender (Preview)

Microsoft Security Private Link enables you to connect to Microsoft Defender services by using private endpoints, ensuring secure and private connectivity from your virtual network. You create a Security Private Link resource in your subscription and then create private endpoints in your Azure virtual networks to connect to that resource.

With this approach, all security-related traffic from your workloads traverses the Microsoft backbone network without exposure to the public internet. This includes telemetry from Defender agents, sensors, add-ons, and extensions.

This article provides an overview of how to use private endpoints with Microsoft Security Private Link to securely connect your virtual network to Microsoft Defender services.

> [!NOTE]
> For a complete understanding of private endpoints and private links, see [What is a private endpoint?](/azure/private-link/private-endpoint-overview).

> [!NOTE]
> Microsoft Security Private Link isn't supported in sovereign cloud regions, such as Azure Government and Azure operated by 21Vianet (21Vianet).

## Supported scenarios

Use Microsoft Security Private Link to securely connect workloads in your virtual network to Microsoft Defender services. 

This is especially useful for:

- **Network-isolated environments**  
  Protect workloads in isolated or restricted networks where outbound internet access is limited or not permitted.

- **Hybrid and on-premises connectivity**  
  Securely connect on-premises or hybrid environments to Microsoft Defender services by using [VPN](/azure/vpn-gateway/vpn-gateway-about-vpngateways) or [ExpressRoute](/azure/expressroute/expressroute-locations) with private peering.

> [!IMPORTANT]
> For network-isolated workloads, Microsoft Security Private Link replaces the need for Azure Monitor Private Link Scope (AMPLS) and Azure Firewall egress rules.

## Connectivity architecture

Security Private Link uses Azure Private Endpoints to establish private connectivity between your virtual network and Microsoft Defender services. This allows workloads to connect to Defender service endpoints using their existing fully qualified domain names (FQDNs) and authorization model.

### How it works

- You create a private endpoint in your virtual network and assign it an IP address from the virtual network address space.

- All traffic between your workloads and Defender services flows through the Microsoft backbone network, never traversing the public internet.

- Multiple Defender services can share a single Security Private Link resource, simplifying network architecture.

> [!NOTE]
> Using private endpoints might incur additional Azure costs depending on the number of endpoints and the selected architecture. For more information, see [Azure Private Link pricing](https://azure.microsoft.com/pricing/details/private-link/).

:::image type="content"
source="media/concept-private-endpoints/security-private-link-diagram.png"
alt-text="Diagram showing a Defender sensor in a virtual network connecting through a private endpoint to a Security Private Link resource, which routes traffic privately to Microsoft Defender services using a private DNS zone."
lightbox="media/concept-private-endpoints/security-private-link-diagram.png"
:::

## Roles and permissions

Microsoft Security Private Link uses [Azure role-based access control (RBAC)](/azure/role-based-access-control/overview). Configuring and managing private endpoints typically involves the following roles:

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

When you create a private endpoint, a [private DNS zone](/azure/dns/private-dns-overview) is provisioned by default that corresponds to the Microsoft Defender private link subdomain `*.defender.microsoft.com`.

> [!NOTE]
> For details about how to configure DNS for private endpoints, see [Azure Private Endpoint DNS integration](/azure/private-link/private-endpoint-dns).

When workloads connect to Defender service endpoints from within the virtual network with private endpoints configured, the FQDN resolves to the private IP address of the endpoint. Connections from outside the virtual network (if public access is still enabled) resolve to the public endpoint.

Each Microsoft Defender service uses specific domain endpoints. For example:

| Service | Name | Type | Value | Port |
|---------|------|------|-------|------|
| Defender for Containers | `*.cloud.defender.microsoft.com` | CNAME | `*.privatelink.cloud.defender.microsoft.com` | 443 |
| Defender for Containers | `*.privatelink.cloud.defender.microsoft.com` | A | 10.0.0.5 | 443 |

If you're using a custom DNS server, configure delegation or A records to resolve FQDNs to the private endpoint IP address.

## Private endpoint usage comparison

| Feature | Without Private Endpoint | With Security Private Link |
|--------|--------------------------|----------------------------|
| Internet exposure | Yes | No |
| Compliance alignment | Limited | Strong |
| Multi-service integration | Manual | Simplified |

## Next steps

- [Configure private endpoints with Microsoft Security Private Link](networking-private-endpoints.md)

- Learn about [Azure Private Link](/azure/private-link) documentation.