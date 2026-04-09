---
title: Connect CyberArk Identity to Microsoft Defender for Identity (Preview)
description: Learn how to connect your CyberArk Identity app to Defender for Identity using the API connector.
ms.date: 02/15/2026
ms.topic: how-to
ms. reviewer: Himanch
---

# Connect CyberArk Identity to Microsoft Defender for Identity (Preview)

This section provides instructions for connecting Microsoft Defender for Identity to your existing CyberArk Identity account using the connector APIs. This connection gives you visibility into and control over CyberArk identities.  

## Prerequisites 

Before connecting your CyberArk Identity to Microsoft Defender for Identity, make sure the following prerequisites are met:

**CyberArk Identity roles**

- The System Admin role is required to create an application.

**Microsoft Entra and Defender XDR role-based access options**

To configure the CyberArk Identity connector in Microsoft Defender for Identity, your account must have either of the following access configurations assigned:

- **Microsoft Entra roles:**

    - Security Operator 

    - Security Admin 

- **Defender XDR Unified RBAC permission:** 
    - Core security settings (manage)

## Connect CyberArk Identity to Microsoft Defender for Identity 

This section provides instructions for connecting Microsoft Defender for Identity to your dedicated CyberArk Identity account using the connector APIs. This connection gives you visibility into and control over CyberArk Identity use.

### Create a custom CyberArk Identity role

1. Sign in to CyberArk Identity console as a system administrator.
1. Navigate to **Identity Administration > Core Services > Roles**
1. Select **Add Role**.
1. Add an appropriate name for the custom role.
1. Select **Save**.
1. Select **Administrative Rights** and add rights for **User Management**.
1. Select **Save**.

### Create a CyberArk OAuth Confidential Client

To support ongoing API access, create a new user and assign the custom role.

1. Sign in to CyberArk Identity console as a system administrator.
1. Navigate to **Identity Administration > Core Services > Users**.
1. Select **Add User**.
1. Enter the **Login Name** and **Display Name**.
1. Under **Status**, select **Is OAuth confidential client**.
1. Copy the username and password. You'll need these credentials later. 
1. Select **Create User**.
1. Navigate to the previously created custom role 
1. Select **Members** and add the user as a member. 
1. Select **Save**.
1. Add the user to the **Privileged Cloud Auditors** role. This role is required to tag identities in the Microsoft Defender portal as privileged accounts.

### Connect CyberArk Identity to Defender for Identity 

1. Sign in to the [Microsoft Defender Portal](https://security.microsoft.com).
1. Go to **System > Data Management > Data Connectors**.

    :::image type="content" source="media/connect-cyber-ark/data-connector-cyber-ark.png" alt-text="Screenshot that shows where to find the data connector for CyberArk in the Microsoft Defender portal." lightbox="media/connect-cyber-ark/data-connector-cyber-ark.png":::

1. Select **Catalog > CyberArk Identity**.
1. Select on **Connect a connector**  
1. Enter a name for your connector. 
1. To determine the CyberArk Identity endpoint URL:
    1. In CyberArk Identity, select the signed-in user.
    1. Select **About**.
    1. Copy the **Identity ID** value.
    1. Add `.id.cyberark.cloud` to the Identity ID. For example, `contoso.id.cyberark.cloud`.
1. Enter your CyberArk Identity Privilege Cloud service endpoint.
    1. In the CyberArk Identity Admin console, go to **Identity Administration > Settings > Integration** and locate the **PVWA URL**. Use the value after `https://`. For example,`contoso.privilegecloud.cyberark.cloud`
1. Enter the username and password for the Oauth user. Include the complete username and the CyberArk domain. 

    :::image type="content" source="media/connect-cyber-ark/cyber-ark-connector-details.png" alt-text="Screenshot that shows where to enter your CyberArk connector details in the Defender portal." lightbox="media/connect-cyber-ark/cyber-ark-connector-details.png":::

1. Select **Next**. 
1. Select **Protection Types > Identity**, and select **Next**. 
1. Review the information and select **Connect**.
1. Verify that the CyberArk Identity connector appears in the **My Connector** table as **Connection Status: Ok**.

    :::image type="content" source="media/connect-cyber-ark/my-connectors-status.png" alt-text="Screenshot that shows your CyberARk connector status in the Defender portal." lightbox="media/connect-cyber-ark/my-connectors-status.png":::

1. To setup **Actions**, go to **Microsoft Sentinel > Configuration > Automation**. 
1. Select **Integration profile** and create one for CyberArk with the same credentials.

    :::image type="content" source="media/connect-cyber-ark/add-integration-profile.png" alt-text="Screenshot that shows how to add an integration profile in the Defender portal." lightbox="media/connect-cyber-ark/add-integration-profile.png":::

## Related articles

- [How Microsoft Defender for Identity protects your CyberArk identity accounts](defender-for-identity-cyber-ark-overview.md)