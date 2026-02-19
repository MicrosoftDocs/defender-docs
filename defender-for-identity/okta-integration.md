---
title: Connect Okta to Microsoft Defender for Identity (Preview)
description: Learn how to connect your Okta app to Defender for Identity using the API connector.
ms.date: 08/07/2025
ms.topic: how-to
ms. reviewer: Himanch
---

# Connect Okta to Microsoft Defender for Identity (Preview)

This page explains how to connect Microsoft Defender for Identity to your Okta account. This connection provides visibility into Okta activity and enables shared data collection across Microsoft security products. The connector allows Defender for Identity to collect Okta system logs once and share them with other supported Microsoft security products, such as Microsoft Sentinel. This reduces API usage, avoids duplicate data collection, and simplifies connector management.

> [!NOTE]
> If your Okta environment is already integrated with [Microsoft Defender for Cloud Apps](/defender-cloud-apps/protect-okta), connecting it to Microsoft Defender for Identity can cause duplicate Okta data, such as user activity, to appear in the Defender portal.

## Prerequisites

Before connecting your Okta account to Microsoft Defender for Identity, make sure the following prerequisites are met:

### Okta licenses

Your Okta environment must have one of the following licenses:

- Developer

- Enterprise

### Okta roles 

The Super Admin role is required only to create the API token. After you create the token, remove the role and assign the Read-Only Administrator and Defender for Identity custom roles for ongoing API access.


### Microsoft Entra and Defender XDR role-based access options
To configure the Okta connector in Microsoft Defender for Identity, your account must have either of the following access configurations assigned:

- **Microsoft Entra roles:**

    - Security Operator
    - Security Admin

- **Defender XDR Unified RBAC permission:**

    - Core security settings (manage)

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

> [!NOTE]
> To support ongoing API access, you must assign both the **Read-Only Administrator role** and the **custom Microsoft Defender for Identity role.** These roles are mandatory to successfully configure the Okta connector. Configuration fails if either role is missing.


After you assign both roles, you can remove the **Super Admin role**. This approach ensures that only relevant permissions are assigned to your Okta account at all times.

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

### Connect Okta to Microsoft Defender for Identity

1. Navigate to the Microsoft Defender Portal.
1. Select **System** > **Data management** > **Data connectors** > **Catalog**

    :::image type="content" source="media/okta-integration/system-data-connector-catalog.png" alt-text="Screenshot showing where to find the Okta connector in the Defender portal." lightbox="media/okta-integration/system-data-connector-catalog.png":::

1. Select **Okta Single Sign-On** > **Connect a connector**.

    :::image type="content" source="media/okta-integration/select-okta-single-sign-on.png" alt-text="Screenshot that shows the connector option for Okta single sign-on." lightbox="media/okta-integration/select-okta-single-sign-on.png":::
1. Enter a name for your connector.
1. Enter your Okta domain (for example, my.project.okta.com).
1. Paste the API token you copied from your Okta account.
1. Select **Next**.

    :::image type="content" source="media/okta-integration/connect-new-okta-single-sign-on-connector.png" alt-text="Screenshot that shows where to add the connector name, domain, and API key.":::

1. **Select products > Microsoft Defender for Identity**
1. Select **Next**

    :::image type="content" source="media/okta-integration/select-product-defender-for-identity.png" alt-text="Screenshot that shows the product page for connecting Okta to Microsoft Defender for Identity." lightbox="media/okta-integration/select-product-defender-for-identity.png":::

1. Review Okta details, and select **Connect**.

    :::image type="content" source="media/okta-integration/review-okta-details.png" alt-text="Screenshot that shows the Okta connector details." lightbox="media/okta-integration/review-okta-details.png":::
1. Verify that your Okta environment appears in the table as enabled.

    :::image type="content" source="media/okta-integration/okta-connected.png" alt-text="Screenshot that shows the Okta single sign-on connector was successfully connected.":::


> [!NOTE]
> Connecting the Okta connector can take up to 15 minutes.

## Related articles

- [How Defender for Identity helps protect your Okta environment](okta-defender-for-identity-overview.md).
