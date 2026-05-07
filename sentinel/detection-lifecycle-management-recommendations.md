---
title: Detection lifecycle management recommendations for Microsoft Sentinel
description: Learn how to choose the right capability for managing detections and other content types in Microsoft Sentinel.
author: mberdugo
ms.author: monaberdugo
ms.topic: concept-article
ms.date: 05/07/2026
ai-usage: ai-assisted
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security


#Customer intent: As a security operations analyst, I want to understand the recommended capabilities for managing detections and content in Microsoft Sentinel so that I can choose the right approach for my organization.

---

# Detection lifecycle management recommendations

This article provides recommendations for managing detections and other content types in Microsoft Sentinel. Use these recommendations to identiy the right approach, depending on your organization's scale, complexity, and tooling preferences.

## Choose your capability

The following table summarizes the recommended capability based on your customer type and needs.

| Customer type | Scalable, structured change management | Simple UI, low complexity | Custom/external tooling or high automation |
|---|---|---|---|
| Single tenant | Content as code (Repos) | Portal | APIs / Terraform |
| Multitenant | Content as code (Repos; best for scale) | Content distribution (via portal) | APIs / Terraform |

### Content as code with repositories

For most Microsoft Sentinel customers, content as code with repositories is the recommended approach. Repositories provide versioning, approvals, workflows, and rollbacks for managing detections. For multitenant customers, repositories provide a scalable way to manage your setup across multiple tenants.

For more information, see [Deploy content as code from your repository](ci-cd.md).

> [!NOTE]
> Repositories are available only to Microsoft Sentinel customers.

### Portal and content distribution

If content as code is too complex for your needs, the portal and content distribution are helpful alternatives. The portal lets you create and manage detections directly. For multitenant customers, content distribution can help manage content across multiple workspaces or tenants. Content distribution is also a good alternative for XDR-only customers who don't use Microsoft Sentinel.

### APIs and Terraform

If your setup depends on custom or external tools that require scale, APIs are the recommended solution. APIs are especially helpful for customers who don't use the portal at all and need more flexibility. For customers who use infrastructure as code, Terraform provides similar benefits with declarative configuration.

## Capabilities feature coverage

The following table shows the feature coverage for each capability.

| Feature | Portal | Content distribution | Repositories | Content Hub | APIs | Terraform |
|---|---|---|---|---|---|---|
| Create/edit | Yes | Yes | Yes | Yes | Yes | Yes |
| Delete | Yes | Yes | Yes | Yes | Yes | Yes |
| List/inventory | Yes | Yes | No | Yes | Yes | No |
| Change history | Yes | No | Yes | Yes | No | Yes |
| Rollbacks | No | No | Yes | No | No | Yes |
| Approvals | No | No | Yes | No | No | Yes |
| Automatic sync | No | No | Yes | No | No | Yes |
| Drift prevention | No | No | No | No | No | No |
| Drift visibility | No | No | No | Yes | No | No |

## Capabilities content coverage

The following table shows the content types supported by each capability.

| Content type | Portal | Content distribution | Repositories | Content Hub | APIs | Terraform |
|---|---|---|---|---|---|---|
| Custom detection rules | Yes | Yes | Yes | No | Yes | No |
| Analytics rules | Yes | Yes | Yes | Yes | Yes | Yes |
| Playbooks | Yes | Yes | Yes | Yes | Yes | Yes |
| Workbooks | Yes | Yes | Yes | Yes | Yes | Yes |
| Automation rules | Yes | Yes | Yes | Yes | Yes | Yes |
| Parsers | Yes | No | Yes | Yes | Yes | Yes |
| Connectors | Yes | No | No | Yes | Yes | Yes |
| Hunting queries | Yes | No | Yes | Yes | Yes | Yes |
| Watchlists | Yes | No | No | Yes | Yes | Yes |
| Summary rules | Yes | No | No | Yes | Yes | Yes |
| Notebooks | Yes | No | No | No | Yes | No |
| Endpoint security policies | Yes | Yes | No | No | No | No |
| Defender settings | Yes | No | No | No | No | No |
| URBAC roles | Yes | Yes | No | No | Yes | No |
| Agents | Yes | No | No | No | No | No |
| Unified connectors | Yes | No | No | No | No | No |

## Related content

- [Deploy content as code from your repository](ci-cd.md)
- [Microsoft Sentinel repositories: The future of content as code — best practices](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/microsoft-sentinel-repositories-the-future-of-content-as-code--best-practices%E2%80%8B/4422936)
- [Bicep support in Microsoft Sentinel repositories](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/whats-new-bicep-support-in-microsoft-sentinel-repositories/4422936)
- [CI/CD implementation for Microsoft Sentinel using Terraform](https://techcommunity.microsoft.com/blog/azureinfrastructureblog/cicd-implementation-for-azure-sentinel-using-terraform/4413220)
