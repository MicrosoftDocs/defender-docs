---
title: Connect SailPoint Identity Security Cloud to Microsoft Defender for Identity (Preview)
description: Learn how to connect your SailPoint Identity Security Cloud app to Defender for Identity using the API connector.
ms.date: 02/15/2026
ms.topic: how-to
ms.reviewer: Himanch
---

# Connect SailPoint Identity Security Cloud to Microsoft Defender for Identity (Preview)

This section provides instructions for connecting Microsoft Defender for Identity to your existing SailPoint Identity Security Cloud account using the connector APIs. This connection gives you visibility into and control over SailPoint identities.  

## Prerequisites 

Before connecting your SailPoint Identity Security Cloud to Microsoft Defender for Identity, make sure the following prerequisites are met:

**SailPoint Identity Security Cloud roles**

- The IdentityNow Admin role is required only to create an application.

**Microsoft Entra and Defender XDR role-based access options**

To configure the SailPoint Identity Security Cloud connector in Microsoft Defender for Identity, your account must have either of the following access configurations assigned:

- **Microsoft Entra roles:**

    - Security Operator 

    - Security Admin 

- **Defender XDR Unified RBAC permission:** 
    - Core security settings (manage)

## Connect SailPoint Identity Security Cloud to Microsoft Defender for Identity 

This section provides instructions for connecting Microsoft Defender for Identity to your dedicated SailPoint Identity Security Cloud account using the connector APIs. This connection gives you visibility into and control over SailPoint Identity Security Cloud use.

### Create a SailPoint Identity Security Cloud Personal Access Token

1. Sign in to SailPoint Identity Security Cloud.
1. Go to **User's Preferences > Personal Access Tokens**.
1. Select **New Token**.
1. Add the following scopes to the token:
    1. idn:accounts:read 
    1. idn:entitlement:read  
    1. sp:search:read 
    1. idn:accounts-state:manage
1. Copy the **Client ID** and **Secret**. You'll need these values to connect SailPoint Identity Security Cloud to Microsoft Defender for Identity.


### Connect SailPoint Identity Security Cloud to Defender for Identity 

1. Sign in to the [Microsoft Defender Portal](https://security.microsoft.com).
1. Go to **System > Data Management > Data Connectors**.
1. Select **Catalog > SailPoint Identity Security Cloud**.
1. Select **Connect a connector**  
    1. Enter a name for your connector.
    1. Enter your SailPoint Identity Security Cloud API Endpoint URL. Use the value after `https://` and make sure 'api' is included in the URL. For example, `contoso.api.identitynow.com`.
    1. Enter your **Client ID** and **Client Secret**.

    :::image type="content" source="media/connect-sail-point/name-and-connection-details.png" alt-text="Screenshot that shows where to enter the client ID and Client Secret in the Defender portal." lightbox="media/connect-sail-point/name-and-connection-details.png":::

1. Select **Next**.
1. Select **Protection Types > Identity**, and then select **Next**.

    :::image type="content" source="media/connect-sail-point/select-product-microsoft-defender-for-identity.png" alt-text="Screenshot that shows the selection of protection types in the Defender portal." lightbox="media/connect-sail-point/select-product-microsoft-defender-for-identity.png":::

1. Review the information and select **Connect**.
1. Verify that the SailPoint Identity connector appears in the **My Connector** table as **Connection Status: Ok**.

## Related articles

- [How Microsoft Defender for Identity protects your SailPoint identity accounts](sail-point-overview.md)
