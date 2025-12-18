---
title: Private endpoints with Microsoft Defender
description: Learn about using private endpoints with Microsoft Defender for Cloud to ensure secure and private connectivity in your virtual network.
author: Elazark
ms.author: elkrieger
ms.topic: article
ms.date: 12/02/2025
---

# Private endpoints with Microsoft Defender (Preview)

This article provides an overview of using private endpoints with Microsoft Security Private Links to ensure secure and private connectivity in your virtual network.

> [!NOTE]
> For a complete understanding of private endpoints and private links, see [What is a private endpoint?](/azure/private-link/private-endpoint-overview).

## What is Microsoft Security Private Link?

Microsoft Security Private Link enables you to connect to Microsoft Defender services by using private endpoints, ensuring secure and private connectivity from your virtual network. You can create a Security Private Link resource in your subscription and then create private endpoints in your Azure virtual networks to the Security Private Link. This approach ensures that all security-related traffic from your workloads, including telemetry from Defender agents, sensors, add-ons, and extensions, traverses the Microsoft backbone network without exposure to the public internet. Microsoft Security Private Link simplifies network architecture by securing connections between your applications and Microsoft Defender services, meeting strict regulatory compliance requirements for network isolation.

## Benefits and scenarios

Use private endpoints with Microsoft Security Private Link to allow workloads on a virtual network to securely access Microsoft Defender services. The private endpoint uses an IP address from the virtual network address space to access Microsoft Defender services. Network traffic between your workloads and Microsoft Defender services traverses the virtual network and a private link on the Microsoft backbone network. This setup eliminates exposure to the public internet while enabling security protection for workloads in network-isolated environments.

When you use private endpoints with Microsoft Security Private Link, you can:

- **Enable network-isolated workloads**: Allow workloads in completely isolated networks to be protected by Microsoft Defender without requiring public internet access, meeting strict regulatory compliance requirements.
- **Securely connect from on-premises networks**: Connect on-premises networks and hybrid environments to Defender services by using [VPN](/azure/vpn-gateway/vpn-gateway-about-vpngateways) or [ExpressRoute](/azure/expressroute/expressroute-locations) with private peering.

> [!IMPORTANT]
> For network-isolated workloads, Microsoft Security Private Link replaces the need for Azure Monitor Private Link Scope (AMPLS) and Azure Firewall egress rules.
:::image type="content" source="media/active-user/recommended-owner.png" alt-text="Screenshot of a conceptual diagram showing Security Private Link with customer's.":::

## Prerequisites

- Azure subscription with Defender services enabled.
- Required roles: Security Administrator, Network Administrator.
- Supported regions: [Insert list or link].

## Architecture

Security Private Link uses Azure Private Endpoints to establish secure connectivity between your virtual network and Microsoft Defender services.

Using private endpoints may incur additional Azure costs depending on the number of endpoints and the selected architecture. For more information, see [Azure Private Link pricing](https://azure.microsoft.com/pricing/details/private-link/).

**How it works:**

- You create a private endpoint in your virtual network and assign it an IP address from your VNet range.
- All traffic between your workloads and Defender services flows through the Microsoft backbone network, never traversing the public internet.
- Multiple Defender services can share a single Security Private Link resource, simplifying network architecture.

**Benefits:**

- Eliminates public exposure for Defender telemetry and management traffic.
- Supports hybrid scenarios with VPN or ExpressRoute private peering.

**Diagram Placeholder:**  
`PLACEHOLDER`

## Overview

A private endpoint is a special network interface for an Azure service in your virtual network. When you create a private endpoint for your Security Private Link, it provides secure connectivity between workloads on your virtual network and Microsoft Defender services. The private endpoint is assigned an IP address from the IP address range of your virtual network. The connection between the private endpoint and the Microsoft Defender service uses a secure private link.

Workloads in the virtual network can connect to the Microsoft Defender service over the private endpoint seamlessly. They can communicate with Defender using agents, add-ons, and extensions with the fully qualified domain name (FQDN) of Microsoft Defender services. The connection uses the same authorization.

When you create a private endpoint connection for a Security Private Link in your virtual network, the process sends a consent request for approval to the Security Administrator. If the user requesting the creation of the private endpoint is also an owner of the Security Private Link, this consent request is automatically approved.

Workload owners and security administrators can manage consent requests and the private endpoints through the **Private endpoint connections** tab for the Security Private Link in the Azure portal.

## Roles and permissions

Access to Microsoft Security Private Link resources and private endpoint connections is governed by Azure role-based access control (RBAC) and follows the standard Azure Private Link approval workflow.

To create a private endpoint for Microsoft Defender services, you must have sufficient permissions on the virtual network where the private endpoint is created, such as the **Network Contributor** role or higher.

Approving a private endpoint connection requires **Owner** or **Contributor** permissions on the Microsoft Security Private Link resource. The **Security Administrator** role provides access to Microsoft Defender for Cloud settings but does not, by itself, grant permissions to approve private endpoint connections.

## Approval workflow

Private endpoint connections to Microsoft Security Private Link resources follow the standard Azure Private Link approval workflow.

When a private endpoint is created, a connection request is sent to the owner of the Microsoft Security Private Link resource. The resource owner can approve or reject the request from the **Private endpoint connections** tab in the Azure portal.

If the user creating the private endpoint also has sufficient permissions on the Private Link resource (such as **Owner** or **Contributor**), the connection request is automatically approved.

Approved and pending connections can be managed at any time through the Private Link resource in the Azure portal.

## DNS configuration

> [!NOTE]
> For details about how to configure your DNS settings for private endpoints, see [Azure Private Endpoint DNS integration](/azure/private-link/private-endpoint-dns).
When you create a private endpoint, a [private DNS zone](/azure/dns/private-dns-overview) is provisioned by default that corresponds to the Microsoft Defender private link subdomain `*.defender.microsoft.com`.

When your workloads connect to Defender service endpoints from within the virtual network with private endpoints configured, the FQDN resolves to the private IP address of the endpoint. Connections from outside the virtual network (if public access is still enabled) resolve to the public endpoint.

Security Private Link enables your workload to communicate with different Microsoft Defender services. Each service requires specific domain endpoints to be configured. For example:

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

## Screenshots and visuals

- **Azure Portal – Private Endpoint creation:**  
`PLACEHOLDER`
- **Connection approval status:**  
`PLACEHOLDER`
- **Security Private Link resource properties:**  
`PLACEHOLDER`

## Next steps
- Configure private endpoints with Microsoft Security Private Link
- For more information about Private Link, see the [Azure Private Link](/azure/private-link) documentation.