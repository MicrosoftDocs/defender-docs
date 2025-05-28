---
title: Microsoft Defender for Identity Okta integration | 
description: Learn how about connecting your Okta app to Defender for Identity using the API connector.
ms.date: 05/19/2025
ms.topic: how-to
ms. reviewer: izauer-bit 
---

# Integrate Okta with Microsoft Defender for Identity

Okta manages how users and customers sign in and get access to key systems. Since it plays a central role in identity and access management, any compromise—whether accidental or intentional—can lead to serious security risks. By integrating Microsoft Defender for Identity with Okta, you gain stronger identity protection. Defender for Identity monitors sign-in activity, detects unusual behavior, and highlights threats related to compromised or misused identities. It also identifies risks like suspicious role assignments or unused high-privilege accounts, using Okta data to deliver clear, actionable insights that help keep your organization secure.

## Prerequisites

Before connecting your Okta account to Microsoft Defender for Identity, make sure the following prerequisites are met:

Your Okta environment must have one of the following licenses:

- Developer

- Enterprise

- An Okta user with the Super Admin role must complete the onboarding steps.

### Connect Okta to Microsoft Defender for Identity

This section provides instructions for connecting Microsoft Defender for Identity to your existing Okta account using the connector APIs. This connection gives you visibility into and control over Okta use.

**To connect Okta to Defender for Identity** 

1. Create a dedicated Okta account that is used only for Microsoft Defender for Identity.
1. Verify your Okta account
1. Store the account credentials for later use.

### Create an API token

> [!NOTE]
> To generate the API token, a Super Administrator role is required. After the API token creation, the Super Administrator role is no longer required.

1. In the Okta console, select **Admin**.

    :::image type="content" source="media/okta-integration/okta-admin.png" alt-text="Screenshot showing the Okta admin button":::

1. Select **Security** > **API**

   :::image type="content" source="media/okta-integration/okta-side-menu-security-api.png" alt-text="Screenshot showing the Okta sidemenu":::

1. Select **Tokens**
1. Select **Create Token**.

     :::image type="content" source="media/okta-integration/create-an-okta-token.png" alt-text="Screenshot showing where to create a token":::

1. In the Create token pop-up:
    1. Enter a name for your Defender for Identity token
    2. Select Any IP
    3. Select Create token.

    :::image type="content" source="media/okta-integration/enter-okta-token-details.png" alt-text="Screenshot showing where to enter the Okta token name":::

1. In the **Token created successfully** pop-up, copy the **Token value** and store it securely. This token is used to connect Okta to Defender for Identity.

    :::image type="content" source="media/okta-integration/okta-token-created-successfully.png" alt-text="Screenshot of the token created successfully pop up message":::

### Create a custom Okta role

1. Navigate to **Security > Administrator**
1. Select the **Roles** tab
1. Select **Create new role**
1. Set the role name to **Microsoft Defender for Identity**
1. Select the permissions you want to assign to this role. Include the following permissions:
    - **Suspend users**
    - **Unsuspend users**
    - **Clear users’ session**
    - **View roles, resources, and admin assignments**
1. Select **Save role**

:::image type="content" source="media/okta-integration/okta-permissions.png" alt-text="Assign Okta permissions":::

### Create a resource set

1. Select the **Resources** tab
1. Select **Create new resource set**
1. Name the resource set **Microsoft Defender for Identity**
1. Add the following resources:
    - **All users**
    - **All Identity and Access Management resources**

    :::image type="content" source="media/okta-integration/resource-set-information.png" alt-text="Enter the all users and all identitity and access management resources":::
1. Select **Save selection**
1. Assign the Read-Only Administrator role to the Microsoft Defender for Identity custom role in the resource set.

### Connect Okta to Defender for Identity

1.  Navigate to the Microsoft Defender Portal
1. Select **Settings** > **Identities** > **Okta integration**

    :::image type="content" source="media/okta-integration/select-settings-okta-integration.png" alt-text="Screenshot showing how to connect your Okta instance":::

1. Select **+Connect Okta instance**.
1. Enter your Okta domain (for example, acme.okta.com)
1. Paste the API token you copied from your Okta account.
1. Select **Save**

    :::image type="content" source="media/okta-integration/connect-okta-instance.png" alt-text="Screenshot showing the connect okta instance pop up page":::
1. Verify that your Okta environment appears in the table as enabled.

    :::image type="content" source="media/okta-integration/new-okta-domain.png" alt-text="Verify that your Okta environment appears in the table as enabled":::
1. Navigate back to your Okta admin console.
1. Select **Directory > Profile Editor**
1. Select **User (default)**
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
    |         |         |

1. Select Save.
1. Verify that the three custom attributes you added are displayed correctly.

     :::image type="content" source="media/okta-integration/okta-custom-attributes.png" alt-text="Verify that all three custom attributes are displayed correctly":::

## Related articles

- [Defender for Identity VPN integration in Microsoft Defender XDR](vpn-integration.md)
