---
title: Connect SailPoint Identity Security Cloud to Microsoft Defender for Identity (Preview)
description: Learn how to connect your SailPoint Identity Security Cloud app to Defender for Identity using the API connector.
ms.date: 07/02/2026
ms.topic: how-to
ms.reviewer: Himanch
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Connect SailPoint Identity Security Cloud to Microsoft Defender for Identity (Preview)

This article describes how to connect SailPoint Identity Security Cloud to Microsoft Defender for Identity by using the API connector in the Microsoft Defender portal. After you set up this integration, security administrators can gain visibility into SailPoint-managed identities, investigate identity-related threats, and monitor account activity directly from Defender for Identity. Before you start, make sure you have the required SailPoint IdentityNow Admin role and the necessary Microsoft Entra or Defender XDR permissions. For full details, review the [prerequisites for connecting SailPoint](#prerequisites).

## Prerequisites 

Make sure you meet these requirements before you start:

**SailPoint Identity Security Cloud roles**

- The IdentityNow Admin role is required only to create an application.

**Microsoft Entra and Defender role-based access options**

Your account needs one of these access options to set up the connector:

- **Microsoft Entra roles:**

    - Security Operator 

    - Security Admin 

- **Defender Unified RBAC permission:**
    - Core security settings (manage)

## Connect SailPoint Identity Security Cloud to Microsoft Defender for Identity 

To set up the connection, create a personal access token in SailPoint and then configure the connector in the Defender portal.

### Create a SailPoint Identity Security Cloud Personal Access Token

Before you begin, create a dedicated SailPoint Identity Security Cloud user for this integration. Then create a personal access token for that user:

1. Sign in to SailPoint Identity Security Cloud as the dedicated user.
1. Go to **User's Preferences > Personal Access Tokens**.
1. Select **New Token**.
1. Add the following scopes to the token:
    1. idn:accounts:read 
    1. idn:entitlement:read  
    1. sp:search:read 
    1. idn:accounts-state:manage
1. Copy the **Client ID** and **Secret**. You need these values later to finish the setup.


### Connect SailPoint Identity Security Cloud to Defender for Identity 

Use the Defender portal to configure the SailPoint connector:

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

<a name="related-articles"></a>
## Related content

- [How Microsoft Defender for Identity protects your SailPoint identity accounts](sail-point-overview.md)
