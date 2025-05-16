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
ms.topic: how-to
ms.date: 04/02/2025
appliesto: 
  - Microsoft Defender XDR
  - Microsoft Sentinel in the Microsoft Defender portal
#customer intent: As a security administrator, I want to learn how to manage tenants in other Microsoft cloud environments.
---

# Manage tenants in other Microsoft cloud environments

[!INCLUDE[Prerelease information](../includes/prerelease.md)]

Multitenant management in Microsoft Defender supports government cloud environments to view their tenants in other cloud environments through cross-cloud visibility. Security operations teams operating in government cloud environments can now manage their entire security operations, including tenants in other cloud environments, in a single pane of glass.

Cross-cloud visibility allows GCC High and DoD multitenant customers to view and manage tenants in Microsoft GCC and Commercial cloud environments.

## Prerequisites

Cross-cloud visibility is available to government customers who have the applicable [licensing requirements](/defender-xdr/usgov#licensing-requirements).

In addition, ensure that the trust multi-factor authentication (MFA) from Microsoft Entra tenants is properly configured to successfully access tenants in Microsoft Commercial cloud environments. To configure MFA, see [Change inbound trust settings for MFA and device claims](/entra/external-id/cross-tenant-access-settings-b2b-collaboration#to-change-inbound-trust-settings-for-mfa-and-device-claims).

### B2B collaboration settings

Follow these steps to configure B2B collaboration settings.

#### Home tenant settings

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com).
2. Navigate to **Identity > External identities > Cross-tenant access settings**, then select **Cross-tenant access settings**.
3. Select **Add organization**. Enter the tenant ID of the organization you want to add, then select **Add**.

> [!NOTE]
> By default, a B2B inherits the default settings of your tenant.

Configure your tenant settings to the following:

1. For the organization you added, select **Inbound access**.
2. Set B2B collaboration to **Block** for Access and Users.
3. On the Application tab, set access to **Block** and Applies to **All applications**, then select **Save**.
4. Select **B2B direct connect**, set access status to **Block** and Applies to **all users**.
5. On the Application tab, set access to **Block** and Applies to **All applications**, then select **Save**.

No other MFA Trust settings are required for the home tenant.

You then need to configure outbound access settings for the home tenant by following these steps:

1. In the **Cross-tenant access settings** pane, select **Outbound access**.
2. Configure B2B collaboration by setting access status to **Allow**.
3. In the Applies to, select any depending on your requirements.
4. Select **External applications** and set access status to **Allow**.
5. Set the Applies to to **All external applications**. Select **Save**.
6. Select **B2B direct connect** and set access status to **Block**.
7. In the Applies to, select **All users**. 
8. Select **External applications** and set access status to **Block**.
9. Set the Applies to to **All external applications**. Select **Save**.

#### Target tenant settings

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com).
2. Navigate to **Identity > External identities > Cross-tenant access settings**, then select **Cross-tenant access settings**.
3. Select **Add organization**. Enter the tenant ID of the organization you want to add, then select **Add**.

Configure the target tenant settings to the following:

1. For the organization you added, select **Inbound access**.
2. Set B2B collaboration to **Allow** for Access and Users.
3. On the Application tab, set access to **Allow** and Applies to **All applications**, then select **Save**.
4. Select **B2B direct connect**, set access status to **Block** and Applies to **All users**.
5. On the Application tab, set access to **Block** and Applies to **All applications**, then select **Save**.
6. Select **Trust settings**, then select **Trust multi-factor authentication from Microsoft Entra tenants**.

You then need to configure outbound access settings from the home tenant by following these steps:

1. In the **Cross-tenant access settings** pane, select **Outbound access**.
2. Configure B2B collaboration by setting access status to **Block**.
3. In the Applies to, select **All users**.
4. Select **External applications** and set access status to **Block**.
5. Set the Applies to to **All external applications**. Select **Save**.
6. Select **B2B direct connect** and set access status to **Block**.
7. In the Applies to, select **All users**. 
8. Select **External applications** and set access status to **Block**.
9. Set the Applies to to **All external applications**. Select **Save**.

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

> [!NOTE]
> When a cross-cloud tenant is added to a tenant group and subsequently removed from cross-cloud visibility, the tenant's name is removed from the tenant list and won’t be available for content management. This is a recognized limitation of cross-cloud visibility and is currently under review. See [Troubleshooting issues](mto-troubleshoot.md#content-assignment-failure-in-cross-cloud-tenant-management) for more information.

## Next steps

- [View and manage incidents and alerts in multitenant management](mto-incidents-alerts.md)
- [Device inventory in multitenant management](mto-tenant-devices.md#device-inventory)