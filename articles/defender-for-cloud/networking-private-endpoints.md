---
title:       Private endpoints with Microsoft Defender
description: Learn about using private endpoints with Microsoft Defender for Cloud to ensure secure and private connectivity in your virtual network.
author:      amih90 # GitHub alias
ms.author:   amhollan # Microsoft alias
ms.service:  defender-for-cloud
ms.topic:    concept-article
ms.date:     11/16/2025
---

# Private endpoints with Microsoft Defender (Preview)

This article provides an overview of using private endpoints with Microsoft Security Private Links to ensure secure and private connectivity in your virtual network.

> [!NOTE]
> For a complete understanding of private endpoints and private links, see [What is a private endpoint?](/azure/private-link/private-endpoint-overview).

---

## Use cases

You can use private endpoints with Microsoft Security Private Link to allow workloads on a virtual network to securely access Microsoft Defender services. The private endpoint uses an IP address from the virtual network address space to access Microsoft Defender services. Network traffic between your workloads and Microsoft Defender services traverses the virtual network and a private link on the Microsoft backbone network, eliminating exposure to the public internet while enabling security protection for workloads in network-isolated environments.

Using private endpoints with Microsoft Security Private Link enables you to:

- **Enable network-isolated workloads**: Allow workloads in completely isolated networks to be protected by Microsoft Defender without requiring public internet access, meeting strict regulatory compliance requirements.
- **Securely connect from on-premises networks**: Connect on-premises networks and hybrid environments to Defender services using [VPN](/azure/vpn-gateway/vpn-gateway-about-vpngateways) or [ExpressRoute](/azure/expressroute/expressroute-locations) with private peering.

> [!IMPORTANT]
> For network-isolated workloads, Microsoft Security Private Link replaces the need for Azure Monitor Private Link Scope (AMPLS) and Azure Firewall egress rules.

:::image type="content" source="media/active-user/recommended-owner.png" alt-text="Screenshot of a conceptual diagram showing Security Private Link with customer's.":::

---

## Conceptual overview

A private endpoint is a special network interface for an Azure service in your virtual network. When you create a private endpoint for your Security Private Link, it provides secure connectivity between workloads on your virtual network and Microsoft Defender services. The private endpoint is assigned an IP address from the IP address range of your virtual network. The connection between the private endpoint and the Microsoft Defender service uses a secure private link.

Workloads in the virtual network can connect to the Microsoft Defender service over the private endpoint seamlessly. They can communicate with Defender using agents, add-ons, and extensions with the fully qualified domain name (FQDN) of Microsoft Defender services. The connection uses the same authorization.

When you create a private endpoint connection for a Security Private Link in your virtual network, a consent request is sent for approval to the Security Administrator. If the user requesting the creation of the private endpoint is also an owner of the Security Private Link, this consent request is automatically approved.

Workload owners and security administrators can manage consent requests and the private endpoints through the **Private endpoint connections** tab for the Security Private Link in the Azure portal.

---

### What is Microsoft Security Private Link?

Microsoft Security Private Link enables you to connect to Microsoft Defender services using private endpoints, ensuring secure and private connectivity from your virtual network. You can create a Security Private Link resource in your subscription and then create private endpoints in your Azure virtual networks to the Security Private Link. This ensures that all security-related traffic from your workloads, including telemetry from Defender agents, sensors, add-ons, and extensions, traverses the Microsoft backbone network without exposure to the public internet. Microsoft Security Private Link simplifies network architecture by securing connections between your applications and Microsoft Defender services, meeting strict regulatory compliance requirements for network isolation.

---

## Architecture

Security Private Link uses Azure Private Endpoints to establish secure connectivity between your virtual network and Microsoft Defender services.

**How it works:**
- A private endpoint is created in your virtual network and assigned an IP address from your VNet range.
- All traffic between your workloads and Defender services flows through the Microsoft backbone network, never traversing the public internet.
- Multiple Defender services can share a single Security Private Link resource, simplifying network architecture.

**Benefits:**
- Eliminates public exposure for Defender telemetry and management traffic.
- Supports hybrid scenarios with VPN or ExpressRoute private peering.

**Diagram Placeholder:**  
`PLACEHOLDER`

---

## Personas & Approval Workflow

Setting up Security Private Link involves multiple roles to ensure secure connectivity and proper governance:

- **Security Administrator**  
  Initiates the creation of private endpoints for Defender services and manages security policies.
  
- **Network Administrator**  
  Approves private endpoint connections, configures DNS zones, and validates firewall rules.
  
- **Subscription Owner**  
  Provides cross-subscription permissions when resources span multiple subscriptions.

**Approval Process:**
- When a private endpoint is created, a consent request is sent to the Security Private Link resource owner.
- If the requester is also the resource owner, the request is auto-approved.
- All pending and approved connections can be managed in the **Private endpoint connections** tab in the Azure portal.

---

## DNS changes for private endpoints

> [!NOTE]
> For details about how to configure your DNS settings for private endpoints, see [Azure Private Endpoint DNS integration](/azure/private-link/private-endpoint-dns).

When you create a private endpoint, by default, a [private DNS zone](/azure/dns/private-dns-overview) is provisioned that corresponds to the Microsoft Defender private link subdomain `*.defender.microsoft.com`.

When your workloads make connections to Defender service endpoints from within the virtual network with private endpoints configured, the FQDN is resolved to the private IP address of the endpoint. Connections from outside the virtual network (if public access is still enabled) resolve to the public endpoint.

Security Private Link enables your workload to communicate with different Microsoft Defender services. Each service requires specific domain endpoints to be configured. For example:

| Service | Name | Type | Value | Port |
|---------|------|------|-------|------|
| Defender for Containers | `*.cloud.defender.microsoft.com` | CNAME | `*.privatelink.cloud.defender.microsoft.com` | 443 |
| Defender for Containers | `*.privatelink.cloud.defender.microsoft.com` | A | 10.0.0.5 | 443 |

If you're using a custom DNS server, configure delegation or A records to resolve FQDNs to the private endpoint IP address.

---

## Comparison Table

| Feature                     | Without Private Endpoint | With Security Private Link |
|----------------------------|---------------------------|-----------------------------|
| Internet Exposure          | Yes                      | No                          |
| Compliance Alignment       | Limited                  | Strong                      |
| Multi-Service Integration  | Manual                   | Simplified                 |

---

## Prerequisites
- Azure subscription with Defender services enabled.
- Required roles: Security Administrator, Network Administrator.
- Supported regions: [Insert list or link].

---

## Limitations
- Azure-only support (AWS/GCP not supported).
- Service-specific constraints.

---

## Future Roadmap

Microsoft Security Private Link is evolving to support broader scenarios:

- **Expanded Service Coverage**  
  Upcoming support for additional Defender services beyond Defender for Containers.
  
- **Multi-Cloud Integration**  
  Planned enhancements for hybrid and multi-cloud environments to extend private connectivity beyond Azure.
  
- **Improved Management Experience**  
  Streamlined approval workflows and enhanced monitoring capabilities in the Azure portal.

Stay tuned for updates in the [Azure Security Blog](https://azure.microsoft.com/blog/topics/security/) and official documentation.

---

## FAQ
**Q: Can I use Security Private Link in AWS or GCP?**  
A: No, currently Azure-only.

**Q: What happens if I have multiple subscriptions?**  
A: Approval workflow requires cross-subscription permissions.

---

## Screenshots & Visuals
- **Azure Portal – Private Endpoint creation:**  
`PLACEHOLDER`
- **Connection approval status:**  
`PLACEHOLDER`
- **Security Private Link resource properties:**  
`PLACEHOLDER`

---

## Next steps
- [Configure private endpoints with Microsoft Security Private Link](networking-private-endpoints.md)
- To learn more about Private Link, see the [Azure Private Link](/azure/private-link) documentation.
