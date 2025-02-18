---
title: Manage tenants in other Microsoft cloud environments
description: Overview of cross-cloud management for other Microsoft clouds in multitenant management in Microsoft Defender XDR.
ms.service: defender-xdr
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- highpri
- tier1
ms.topic: conceptual
ms.date: 03/01/2025
appliesto: 
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
---

# Manage tenants in other Microsoft cloud environments

[!INCLUDE[Prerelease information](../includes/prerelease.md)]

Multitenant management in Microsoft Defender supports government cloud environments to view their tenants in other cloud environments through cross-cloud visibility. Security operations teams operating in government cloud environments can now manage their entire security operations, including tenants in other cloud environments, in a single pane of glass.

Cross-cloud visibility allows GCC High and DoD multitenant customers to view and manage tenants in Microsoft GCC and Commercial cloud environments.

## Prerequisites

Cross-cloud visibility is available to government customers who have the applicable [licensing requirements](/un/usgov#licensing-requirements).

In addition, ensure that the trust multi-factor authentication (MFA) from Microsoft Entra tenants is properly configured to successfully access tenants in Microsoft Commercial cloud environments. To configure MFA, see [Change inbound trust settings for MFA and device claims](/entra/external-id/cross-tenant-access-settings-b2b-collaboration#to-change-inbound-trust-settings-for-mfa-and-device-claims).

Microsoft Entra tenants must also select the **Microsoft Azure Commercial** checkbox in the **cross-tenant settings for external identities** to ensure B2B collaboration. Learn more about B2B settings in [Manage external access with inbound and outbound settings](/entra/external-id/cross-tenant-access-overview#manage-external-access-with-inbound-and-outbound-settings).

## Cross-cloud tenant management

To manage tenants from other Microsoft cloud environments:

1. Go to the [Settings page](https://mto.security.microsoft.com/settings) in Microsoft Defender multitenant management.
2. Select the dropdown beside **Add tenants**, then select **add from another cloud**.

    :::image type="content" source="/unified-secops-platform/media/mto-cross-cloud/mto-add-from-cloud-small.png" alt-text="Screenshot of the Settings page with the Add tenant option highlighted." lightbox="/unified-secops-platform/media/mto-cross-cloud/mto-add-from-cloud.png":::

3. In the next pane, type the tenant ID or domain where the tenant is to add a tenant, then select **Verify tenant**. The verification process looks at the added tenant’s information and permissions.
    
    :::image type="content" source="/unified-secops-platform/media/mto-cross-cloud/mto-verify-tenant-small.png" alt-text="Screenshot of the add tenants pane with the verification highlighted." lightbox="/unified-secops-platform/media/mto-cross-cloud/mto-verify-tenant.png":::

4. Once verified, select **Add tenant** to complete the process.

The tenants list now includes the tenants from the other cloud environment. You can now manage these tenants as you would any other tenant in Microsoft Defender.

If you get an error during the verification process, you can:

- Check the tenant ID or domain you entered.
- Ensure you have the correct permissions to access the tenant.

To remove tenants from the list, select the tenant, then select **Remove tenants**.

After successfully adding tenants from other clouds, you can view these tenants in other multitenant pages like the incidents and device inventory pages.

## Next steps

- [View and manage incidents and alerts in multitenant management](mto-incidents-alerts.md)
- [Device inventory in multitenant management](mto-tenant-devices.md#device-inventory)