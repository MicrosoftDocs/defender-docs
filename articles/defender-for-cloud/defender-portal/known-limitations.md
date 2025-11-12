---
title: Known limitations in the Defender portal
description: Understand current limitations and known issues when using Microsoft Defender for Cloud in the Defender portal during the preview phase.
author: dlanger
ms.author: dlanger
ms.topic: reference
ms.date: 11/10/2025
ms.service: defender-for-cloud
---

# Known limitations in the Defender portal

These are the known limitations during the preview release of Defender for Cloud in the Defender portal.

> [!NOTE]
> Enabling the Defender portal experience will not impact your experience in the Azure portal.

## General

- Over time data available from the moment the the tenant was selected to public preview enablement.
- Deleted resources may still appear in the Azure portal because it currently reflects the last known state. We're actively working to align the Azure portal with the Defender portal and a fix is in progress to ensure deleted resources are no longer displayed.
- Resources tied to subscriptions with Foundational CSPM (free tier) are currently not displayed.
- Some resources sourced from Azure Policy may not appear in the new portal (including Defenders, Advanced Hunting, and XSPM) because they don't have Defender for Cloud security context. During the preview period, we only surface resources that contribute to the security insights.
- Some navigation paths may differ slightly from Azure Portal equivalents.
- Event timeline widget is no longer in the navigation bar accessible via dashboard widgets.

## Cloud secure score and recommendations

Cloud Secure Score history may show less than 6 months if tenant was recently onboarded.

## Cloud Inventory


## Cloud Scopes

Unified RBAC operates in the Defender portal and uses a different RBAC model from Azure. Permissions are not transferred between portals; instead, security administrators must create separate Unified RBAC permissions for their teams, independent of their Azure permissions.

Cloud scopes management and role assignment on cloud scopes are both available in the portal; API support is coming soon.

To begin using cloud scopes, you must activate them through a one-time wizard. This release does not affect access permissions to VMs, but it will influence future changes related to unifying server primitives.

Currently, cloud scopes primitive's configuration is not dynamic and cannot be selected based on conditions; however, support for this feature will be available in the future.

The following list shows the currently supported native environment primitives; support will be expanded to include other primitives like management groups and container resources:

- AWS Accounts
- AWS Master Accounts
- AzureDevOps Organizations
- Azure Subscriptions
- Docker Hub Organizations
- GCP Projects
- GitHub Organizations
- GitLab Groups
- JFrog Artifactory

With respect to XDR (incidents and alerts), the scope filter is currently not available. However, there is table-level filtering for cloud scopes, which inherits selections from the global filter when navigating from other MDC pages to XDR views (alerts & incidents). Device groups appear as table filer only in incidents view. We do intend to introduce scoping filtering to XDR and additional experiences in the future. This enhancement will ensure consistent filtering across all platforms.

Filtering cross experiences: The scope filter applies to all widgets, tables, and data in cloud and exposure management views. Some data, such as exposure score or Microsoft Secure Score, may not be available for cloud scopes. For asset-rich experiences like maps or attack paths, all cloud scope data is fully displayed, but related asset information is limited due to permission restrictions.

Access to resources is managed by uRBAC with assigned cloud scopes. Certain assets, referred to as floating or unscoped assets, exist outside the cloud environment hierarchy and are therefore classified as non-scopeable cloud assets. These assets are visible to all users who can access the portal, in all MSEM and cloud experiences regardless of their assigned cloud scope. Integrated into the graph (EKG), these assets include various node types that do not support fine-grained scoping through RBAC (Role-Based Access Control). These assets appear in cloud inventory, attack paths, map, and other related views. The list of floating assets is:

- AAD users and groups
- GCP users and groups
- Service Principals
- Container images
- IP addresses
- Certificates
- SSH private keys
- Secrets and Managed Identities (some can be scoped depending on resource ID availability)

## Next steps

- [Overview of Defender for Cloud in Defender portal](defender-for-cloud-defender-portal.md)
- [Enable preview features](enable-preview-features.md)
- [Azure portal vs Defender portal feature comparison](../azure-portal-vs-defender-portal-comparison.md)
- [Integration FAQ](integration-faq.md)
