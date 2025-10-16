---
title: Manage cloud scopes and unified role-based access control in Microsoft Defender for Cloud
description: Learn how to configure cloud scopes and unified role-based access control for granular permissions management across your cloud environments.
ms.topic: how-to
ms.date: 10/16/2025
ms.author: dlanger
author: dlanger
zone_pivot_groups: defender-portal-experience
#customer intent: As a security administrator, I want to configure cloud scopes and unified RBAC to manage access and permissions across my cloud environments.
---

::: zone pivot="Defender-portal"

# Manage cloud scopes and unified role-based access control

Cloud scopes and unified role-based access control (unified RBAC) in the Microsoft Defender portal let you segment multicloud resources (Azure, AWS, GCP and connected DevOps / registry sources) into meaningful groupings and apply least‑privilege access consistently. They provide:
- Centralized, product-wide security permissions management
- Granular scoping across heterogeneous cloud environments
- Persistent filtering across inventory, posture, vulnerabilities, and exposure management
- Clear separation from Azure (platform) RBAC

> [!IMPORTANT]
> Unified RBAC in the Defender portal is distinct from Azure RBAC. Permissions don't flow between the portals; you must configure unified RBAC separately.

## Core concepts

| Concept | Description |
| ------ | ----------- |
| Cloud scope | Logical grouping of one or more cloud/native environment primitives (for example: Azure subscriptions, AWS accounts, GCP projects, DevOps orgs, registries) aligned to business or operational structure. |
| Unified RBAC role | A Defender portal security role defining permission groups (Security operations / Security posture) plus scope-bound assignments. |
| Scope filter | Global UX filter letting users focus data views to selected cloud scopes or device groups. |
| Environments filter | Secondary filter for drilling into individual environments (optionally within a selected scope). |

## Key benefits

- Avoid broad tenant-wide access; enforce least privilege
- Align security operations to business units, geography, application domains, or ownership models
- Simplify multicloud delegation with repeatable scope patterns
- Maintain consistent contextual filtering while navigating experiences
- Separate operational security permissions from Azure management constructs

## Prerequisites

- Global Admin or Security Admin (for configuration)
- Access to the Microsoft Defender portal
- Connected cloud / DevOps / registry environments

## 1. Create cloud scopes

Navigation: **Settings > Permissions > Microsoft XDR Roles > Scopes > Cloud scopes**.

Characteristics:
- Unlimited scopes
- A scope can include multiple heterogeneous environments
- An environment can belong to multiple scopes
- Membership isn't automatic; newly connected environments must be explicitly added

### Create a scope (wizard)

1. Select **Create new cloud scope**.
   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-1.png" alt-text="Create scope action." lightbox="media/cloud-scopes-unified-rbac/create-scope-1.png":::
2. Enter name and description.  
   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-2.png" alt-text="Scope name and description." lightbox="media/cloud-scopes-unified-rbac/create-scope-2.png":::
3. Select environment primitives (individually or via filters).  
   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-3.png" alt-text="Select environment primitives." lightbox="media/cloud-scopes-unified-rbac/create-scope-3.png":::
4. Review and finish.  
   :::image type="content" source="media/cloud-scopes-unified-rbac/create-scope-4.png" alt-text="Review scope configuration." lightbox="media/cloud-scopes-unified-rbac/create-scope-4.png":::

## 2. Activate cloud scopes (one-time)

Before scopes can be used in role assignments, run the activation wizard if prompted. This:
1. Enumerates existing unified RBAC roles referencing Microsoft Defender for Cloud data sources
2. Lets you map those roles to chosen cloud scopes
3. Highlights manage / sensitive permissions (for example: response actions)
4. Finalizes activation (irreversible; future changes are through normal management)

If no device groups or unified RBAC roles exist yet, the wizard may be skipped until needed.

### Activation & bulk assignment wizard

:::image type="content" source="media/cloud-scopes-unified-rbac/activate-scope-1.png" alt-text="Activation wizard start." lightbox="media/cloud-scopes-unified-rbac/activate-scope-1.png":::
:::image type="content" source="media/cloud-scopes-unified-rbac/activate-scope-2.png" alt-text="Role-to-scope assignment." lightbox="media/cloud-scopes-unified-rbac/activate-scope-2.png":::
:::image type="content" source="media/cloud-scopes-unified-rbac/activate-scope-3.png" alt-text="Activation approval." lightbox="media/cloud-scopes-unified-rbac/activate-scope-3.png":::

Guidelines:
- Create at least one scope if none exist
- Review which roles include manage-level permissions (these extend VM-related capabilities)
- Approve to complete activation

## 3. Define unified RBAC roles and assignments

Navigation: **Settings > Permissions > Microsoft XDR Roles > Roles**.

Permission groups (select one or both):
1. **Security operations** – incidents, alerts, and cloud inventory
2. **Security posture** – recommendations, vulnerability management, security score, exposure/posture features

> [!NOTE]
> For posture access, include data source: Exposure Management (XSPM). Some Microsoft Defender for Cloud features surface within Exposure Management views.

During the role wizard:
- Choose permission groups
- Select data sources: All / MDC / Exposure Management (XSPM)
- Assign users / groups
- Select scope option:
  - All cloud scopes
  - Custom (pick specific scopes)

:::image type="content" source="media/cloud-scopes-unified-rbac/unified-rbac-permissions-1.png" alt-text="Role creation permissions step." lightbox="media/cloud-scopes-unified-rbac/unified-rbac-permissions-1.png":::
:::image type="content" source="media/cloud-scopes-unified-rbac/unified-rbac-permissions-2.png" alt-text="Data source selection." lightbox="media/cloud-scopes-unified-rbac/unified-rbac-permissions-2.png":::
:::image type="content" source="media/cloud-scopes-unified-rbac/unified-rbac-permissions-3.png" alt-text="Scope selection." lightbox="media/cloud-scopes-unified-rbac/unified-rbac-permissions-3.png":::

## 4. Use scope and environment filters

### Scope filter (global)

The scopes filter (cloud scopes + device groups) persists across:
- Recommendations (Cloud tab / Devices tab context)
- Initiatives
- Vulnerability management
- Cloud inventory
- Cloud overview & initiatives dashboards
- Attack paths
- Map view

Behavior:
- Users see only values they are authorized for
- Device group filtering applies where device-centric data is relevant
- Mixed experiences apply scope category contextually (for example: Recommendations: device groups affect Devices tab; cloud scopes affect Cloud tab)

:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-1.png" alt-text="Scope filter UI." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-1.png":::
:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-2.png" alt-text="Contextual filtering behavior." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-2.png":::
:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-3.png" alt-text="Authorized scope list." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-3.png":::

### Environments filter

Purpose: deep investigation, mitigation, remediation focus.

Characteristics:
- Available in cloud initiatives, overview dashboards, cloud inventory, cloud recommendations
- Shows only permitted environments
- With no scope selected: lists all accessible environments
- With a scope selected: constrained to that scope’s members
- Orders of application:
  - Scope first, then environment (subset refine)
  - Environment first, then scope (scope selection overrides previous set)

:::image type="content" source="media/cloud-scopes-unified-rbac/scope-filtering-4.png" alt-text="Environments filter." lightbox="media/cloud-scopes-unified-rbac/scope-filtering-4.png":::

## 5. Ongoing management

After creation and activation you can:
- Add / remove environments from scopes
- Adjust role assignments
- Audit usage (who has which scope access)
- Review manage-level permissions periodically
- Remove obsolete scopes to reduce complexity

## Best practices

| Practice | Rationale |
| -------- | --------- |
| Align scopes to stable business or operational boundaries | Reduces churn and redesign |
| Use clear, descriptive names (BU-App-Region) | Eases auditing and delegation |
| Enforce least privilege | Limits blast radius |
| Schedule periodic access reviews | Detects permission drift |
| Document scope purpose & owner | Supports lifecycle governance |
| Avoid excessive overlapping scopes | Minimizes complexity & evaluation effort |

## Supported environment primitives (current)

- AWS Accounts
- AWS Master Accounts
- Azure Subscriptions
- GCP Projects
- Azure DevOps Organizations
- GitHub Organizations
- GitLab Groups
- Docker Hub Organizations
- JFrog Artifactory

(Additional primitives like management groups and container resources planned.)

## Floating (unscoped) assets

Certain asset types remain globally visible (not scope-bound) due to graph model or missing hierarchical anchors:
- Microsoft Entra ID users and groups
- GCP users and groups
- Service principals
- Container images
- IP addresses
- Certificates
- SSH private keys
- Secrets and Managed Identities (some may become scopable when resource IDs are available)

These appear in inventory, attack paths, maps, and related exposure experiences for all authorized portal users.

## Known issues & limitations

| Area | Limitation / Status |
| ---- | ------------------- |
| RBAC model separation | Unified RBAC is independent of Azure RBAC (must be configured separately). |
| API support | Portal only today for scope CRUD & assignments; API coming soon. |
| Dynamic selection | Conditional/dynamic inclusion rules not yet supported. |
| Filtering in XDR (incidents/alerts) | Global scopes filter not fully integrated; partial table-level inheritance only. |
| Cross-experience coverage | Some aggregated scores (for example: exposure score, Secure Score variants) may not fully scope-filter. |
| Visualization constraints | Asset-rich views honor scoping but may limit related asset detail due to permission boundaries. |
| Future primitives | Management groups, additional container/resource primitives planned. |

## FAQ (deduplicated)

**How do scopes differ from Azure constructs?**  
Scopes are Defender portal logical groupings across multicloud primitives; they don't change Azure resource hierarchy or Azure RBAC.

**When should I use multiple scopes vs one large scope?**  
Create multiple scopes when distinct teams, compliance domains, or ownership boundaries require isolated visibility or permissions.

**What happens if a user is assigned roles in overlapping scopes?**  
Effective permissions aggregate across all assigned scopes. Review overlaps periodically to avoid unintended broad access.

**Why can’t I assign scopes yet?**  
Run (or complete) the activation wizard; assignments are blocked until activation finalizes.

**Can environments auto-join scopes?**  
Not currently. New environments must be manually added to existing scopes.

**Does removing an environment from a scope revoke access immediately?**  
Yes—once removed and saved, users relying solely on that scope lose access to its data for that environment.

**How should I decide scope granularity?**  
Start with major business or operational domains. Refine only where least‑privilege or compliance requirements justify increased segmentation.

## Next steps

- [Configure email notifications with cloud scopes](configure-email-notifications.md)
- [Use scope filtering in asset inventory](asset-inventory.md)
- [Apply scopes to attack path analysis](concept-attack-path.md)
- [Manage cloud infrastructure with scoped access](defender-for-cloud-introduction.md)

::: zone-end

::: zone pivot="azure-portal"

## Cloud scopes and unified RBAC (Azure portal view)

Full lifecycle management (creation, membership, advanced filtering, multicloud assignments) is performed in the Microsoft Defender portal. In the Azure portal you can still:
- View Azure RBAC assignments at subscription / resource group levels
- Manage classic Azure access for platform resources

For end-to-end cloud scopes and unified RBAC administration, use the Defender portal.

::: zone-end
