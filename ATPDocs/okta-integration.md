---
title: Connect Okta to Microsoft Defender for Identity (Preview)
description: Learn how to connect your Okta app to Defender for Identity using the API connector.
ms.date: 08/07/2025
ms.topic: how-to
ms. reviewer: izauer-bit 
---

# Connect Okta to Microsoft Defender for Identity (Preview)

This article explains how to connect Microsoft Defender for Identity to your existing Okta account. This connection gives you visibility into and control over Okta use. For information about how Defender for Identity protects Okta, see: [How Defender for Identity helps protect your Okta environment](okta-defender-for-identity-overview.md).

## Prerequisites

Before connecting your Okta account to Microsoft Defender for Identity, make sure the following prerequisites are met:

Your Okta environment must have one of the following licenses:

- Developer

- Enterprise

> [!NOTE]
> The Super Admin role is required only to create the API token. After you create the token, remove the role and assign the Read-Only Administrator and Defender for Identity custom roles for ongoing API access.


> [!NOTE]
> If your Okta environment is already integrated with [Microsoft Defender for Cloud Apps](/defender-cloud-apps/protect-okta), connecting it to Microsoft Defender for Identity can cause duplicate Okta data, such as user activity, to appear in the Defender portal.


### Connect Okta to Microsoft Defender for Identity

This section provides instructions for connecting Microsoft Defender for Identity to your dedicated Okta account using the connector APIs. This connection gives you visibility into and control over Okta use.

### Create a dedicated Okta account

1. Create a dedicated Okta account for Microsoft Defender for Identity use only.
1. Assign your Okta account as a Super Admin role.
1. Verify your Okta account.
1. Store the account credentials for later use.
1. Sign in to your dedicated Okta account created in step 1 to create an API token. 

### Create an API token

1. In the Okta console, select **Admin**.

    :::image type="content" source="media/okta-integration/okta-admin.png" alt-text="Screenshot that shows how to access the Admin button in the Okta console.":::

1. Select **Security** > **API**.

   :::image type="content" source="media/okta-integration/okta-side-menu-security-api.png" alt-text="Screenshot of the Okta admin console navigation menu with Security and API options highlighted in the left pane.":::

1. Select **Tokens**
1. Select **Create Token**.

     :::image type="content" source="media/okta-integration/create-an-okta-token.png" alt-text="Screenshot of the Okta API Tokens tab with the Create token button highlighted.":::

1. In the Create token pop-up:
    1. Enter a name for your Defender for Identity token.
    2. Select **Any IP**.
    3. Select **Create token**.

    :::image type="content" source="media/okta-integration/enter-okta-token-details.png" alt-text="Screenshot of the Okta Create token form with fields for token name and IP restriction, and the Create token button highlighted.":::

1. In the **Token created successfully** pop-up, copy the **Token value** and store it securely. This token is used to connect Okta to Defender for Identity.

    :::image type="content" source="media/okta-integration/okta-token-created-successfully.png" alt-text="Screenshot of the Okta token creation success message.":::

### Add Custom user attributes

1. Select **Directory > Profile Editor**.
1. Select **User (default)**.
1. Select **Add Attributes**.
    1. Set Data type to String.
    1. Enter the Display name.
    1. Enter the Variable name.
    1. Set User permission to Read Only.
1. Enter the following attributes:

    |Display Name |Variable Name |
    |---------|---------|
    |ObjectSid     | ObjectSid        |
    |ObjectGuid     | ObjectGuid        |
    |DistinguishedName    | DistinguishedName    |

1. Select Save.
1. Verify that the three custom attributes you added are displayed correctly.

     :::image type="content" source="media/okta-integration/okta-custom-attributes.png" alt-text="Screenshot of the Okta Attributes page. Three attributes are shown: ObjectGuid, DistinguishedName, and ObjectSid.":::


### Create a custom Okta role

To support ongoing API access, you need the Read-Only Administrator role and the custom Defender for Identity role.

After you assign both roles, you can remove the Super Admin role. This approach ensures that only relevant permissions are assigned to your Okta account at all times.

1. Navigate to **Security > Administrator**.
1. Select the **Roles** tab.
1. Select **Create new role**.
1. Set the role name to **Microsoft Defender for Identity**.
1. Select the permissions you want to assign to this role. Include the following permissions:
    - **Edit user's lifecycle states**
    - **Edit user's authenticator operations**
    - **View roles, resources, and admin assignments**
1. Select **Save role**.

:::image type="content" source="media/okta-integration/okta-permissions.png" alt-text="Screenshot showing a list of Okta permissions that need to be assigned when adding a custom role.":::

### Create a resource set

1. Select the **Resources** tab.
1. Select **Create new resource set**.
1. Name the resource set **Microsoft Defender for Identity**.
1. Add the following resources:
    - **All users**
    - **All Identity and Access Management resources**

    :::image type="content" source="media/okta-integration/resource-set-information.png" alt-text="Screenshot that shows the resource set name is Microsoft Defender for Identity.":::


1. Select **Save selection**.

### Assign the custom role and resource set
To complete the configuration in Okta, assign the custom role and resource set to the dedicated account.

1. Assign the following roles to the dedicated Okta account:

    - Read-Only Administrator.

    - The custom Microsoft Defender for Identity role

1. Assign the Microsoft Defender for Identity resource set to the dedicated Okta account.

1. When you're done, remove the Super Admin role from the account.

### Connect Okta to Defender for Identity

1.  Navigate to the Microsoft Defender Portal.
1. Select **Settings** > **Identities** > **Okta integration**

    :::image type="content" source="media/okta-integration/select-settings-okta-integration.png" alt-text="Screenshot showing the Microsoft Defender for Identity settings page with the Okta Integration option highlighted.":::

1. Select **+Connect Okta instance**.
1. Enter your Okta domain (for example, acme.okta.com).
1. Paste the API token you copied from your Okta account.
1. Select **Save**.

    :::image type="content" source="media/okta-integration/connect-okta-instance.png" alt-text="Screenshot that shows how to connect your Okta instance.":::

1. Verify that your Okta environment appears in the table as enabled.

    :::image type="content" source="media/okta-integration/new-okta-domain.png" alt-text="Screenshot that shows the Okta environment was added and is enabled.":::

## Related articles

- [How Defender for Identity helps protect your Okta environment](okta-defender-for-identity-overview.md)
