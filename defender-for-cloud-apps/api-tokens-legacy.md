---
title: Managing internal tokens (legacy)
description: This article provides information about the internal legacy method of generating and managing API tokens for Defender for Cloud Apps.
ms.date: 01/29/2023
ms.topic: reference
---
# Managing internal tokens (legacy)



In order to access the Defender for Cloud Apps API, you have to create an API token and use it in your software to connect to the API. This token is included in the header when Defender for Cloud Apps makes API requests.

The API tokens tab enables you to help you manage all the API tokens of your tenant.

## Generate a token

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **System**, select **API tokens**.

1. Select **Add token** and provide a name to identify the token in the future, and select **Generate**.

    ![Defender for Cloud Apps generates API token.](media/api-token-gen.png)

1. Copy the token value and save it somewhere for recovery - if you lose it you need to regenerate the token. The token has the privileges of the user who issued it. For example, a security reader can't issue a token that can alter data.

1. You can filter the tokens by status: Active, Inactive, or Generated.

    - **Generated:** Tokens that have never been used.
    - **Active:** Tokens that were generated and were used within the past seven days.
    - **Inactive:** Tokens that were used, but there was no activity in the last seven days.

1. After you generate a new token, you'll be provided with a new URL to use to access Defender for Cloud Apps.

    ![Defender for Cloud Apps API token.](media/generate-api-token.png)

    The generic portal URL continues to work but is considerably slower than the custom URL provided with your token. If you forget the URL at any time, you can view it by going to the **?** icon in the menu and selecting **About**.

## API token management

The API token page includes a table of all the API tokens that were generated.

Full admins see all tokens generated for this tenant. Other users only see the tokens that they generated themselves.

The table provides details about when the token was generated and when it was last used and allows you to revoke the token.

After a token is revoked, it's removed from the table, and the software that was using it fails to make API calls until a new token is provided.

> [!NOTE]
>
> - SIEM connectors and log collectors also use API tokens. These tokens should be managed from the log collectors and SIEM agent sections and don't appear in this table.
> - Deprovisioned users API tokens are retained in Defender for Cloud Apps but can't be used. Any attempt to use them will result in a permission denied response. However, we recommend that such tokens are revoked on the **API tokens** page.

[!INCLUDE [Open support ticket](includes/support.md)]
