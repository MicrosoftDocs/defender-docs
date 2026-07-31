---
title: Create an app to access Microsoft Defender for Endpoint without a user
description: Learn how to grant a web app access to Microsoft Defender for Endpoint without a user.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.date: 07/28/2026
ms.topic: how-to
ms.subservice: reference
ms.appliesTo: Microsoft Defender for Business and Microsoft Defender for Endpoint Plans 1 and 2
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Create an app to access Microsoft Defender for Endpoint without a user

When [using Microsoft Defender for Endpoint APIs](apis-intro.md), you might need access to Microsoft Defender for Endpoint without a user. For example, you might want to create a service that runs in the background and interacts with Defender for Endpoint on behalf of your organization. If you need background service access without a signed-in user, create an application that can access Defender for Endpoint without a user.

This article shows how to register an application in Microsoft Entra ID, grant it app-only permissions, and obtain an access token for Defender for Endpoint API access. API access requires [OAuth 2.0 client credentials flow](/azure/active-directory/develop/active-directory-v2-protocols-oauth-code).

## Prerequisites

To create an app registration in Azure, you need a [Microsoft Entra role with app registration permissions](/entra/identity/role-based-access-control/manage-roles-portal?tabs=admin-center) that allows app creation, such as *Application Administrator*.

## Step 1: Create an app in Azure

Perform the following steps to register an app and grant it API permissions in Azure:

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Search for **App registrations** and navigate to *App registrations*.

3. Select **New registration**.

4. Choose a name for your application, and then select **Register**.

5. In your application page, go to *Manage > Api Permissions > Add permission > APIs my organization uses*.

6. In the *Request API permissions* page, search for **WindowsDefenderATP** and select it.

7. Select the type of permissions you require, and then select **Add permissions**.

   * **Delegated permissions** - Sign in with your app as if you were a user.

   * **Application permissions** - Access the API as a service.

8. Select the appropriate permissions for your app. To determine which permission you need, look at the *Permissions* section in the API you're calling. Here are two examples:

   * To [run advanced queries](run-advanced-query-api.md), select *Run advanced queries*.

   * To [isolate a device](isolate-machine.md), select *Isolate machine*.
9. Select **Add permission**.

## Step 2: Add a secret to your app

The following steps describe how to authenticate your app using an app secret. To authenticate your app using a certificate, see [Create a self-signed public certificate to authenticate your application](/entra/identity-platform/howto-create-self-signed-certificate).

1. From the application page, select *Certificates & secrets* > *New client secret*.

2. In the *Add a client secret* pane, add a description and expiration date.

3. Select **Add**.

4. Copy the **Value** of the secret you created. You won't be able to retrieve this value after you leave the page.

5. From your app's *overview* page, copy the **Application (client) ID** and **Directory (tenant) ID**. You need this ID to authenticate your app.

7. Write down your application ID and your tenant ID. On your application page, go to **Overview** and copy the following.

## Multitenant apps

Microsoft Defender for Endpoint partners need to set their apps to be multi-tenanted. Set your app to be a multitenant app if you're planning to create an app that will run in multiple customers' tenants.

1. In your Azure app page, go to **Manage > Authentication**.

2. **Add a platform**.

3. From the *Configure platforms* pane, select **Web**.

4. Add `https://portal.azure.com` to **Redirect URIs** and select **Configure**.

3. From the *Supported account types* options, select **Accounts in any organizational directory** and select **Save**.

Once you run your app, you need it to be approved in each tenant where you intend to use it. This is because your application interacts with Defender for Endpoint on behalf of your customer. You or your customer, will need to select the consent link and approve your app. Give consent with a user who has admin privileges.

Here's how to form the consent link. When a tenant admin visits this URL, the Microsoft identity platform consent flow opens so the customer tenant can authorize the app. Replace `00000000-0000-0000-0000-000000000000` with your app ID.

```https
https://login.microsoftonline.com/common/oauth2/authorize?prompt=consent&client_id=00000000-0000-0000-0000-000000000000&response_type=code&sso_reload=true
```

## Get an access token

The following methods show how to get your app's [access token](/entra/identity-platform/v2-oauth2-client-creds-grant-flow#get-a-token).

> [!TIP]
> Some Microsoft Defender for Endpoint APIs continue to require access tokens issued for the legacy resource `https://api.securitycenter.microsoft.com`. If the token audience doesn't match the resource expected by the API, requests fail with `403 Forbidden`, even if the API endpoint uses `https://api.security.microsoft.com`. Use `https://api.securitycenter.microsoft.com` as the resource or scope when acquiring tokens.

# [PowerShell](#tab/PowerShell)

```powershell
# This script acquires the App Context Token and stores it in the variable $token for later use.
# Paste your Tenant ID, App ID, and App Secret (App key) into the quotes below.

$tenantId = '' ### Paste your tenant ID here
$appId = '' ### Paste your Application ID here
$appSecret = '' ### Paste your Application key here

$sourceAppIdUri = 'https://api.securitycenter.microsoft.com/.default'
$oAuthUri = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"
$authBody = [Ordered] @{
    scope = "$sourceAppIdUri"
    client_id = "$appId"
    client_secret = "$appSecret"
    grant_type = 'client_credentials'
}
$authResponse = Invoke-RestMethod -Method Post -Uri $oAuthUri -Body $authBody -ErrorAction Stop
$token = $authResponse.access_token
$token
```

# [Python](#tab/Python)

[Get token using Python](run-advanced-query-sample-python.md#get-token).

# [Curl](#tab/Curl)

The following procedure assumes that Curl for Windows is already installed on your computer.

1. Open a command prompt, and set `CLIENT_ID` to your Azure application ID.

2. Set `CLIENT_SECRET` to your Azure application secret.

3. Set `TENANT_ID` to the Azure tenant ID of the customer that wants to use your app to access Defender for Endpoint.

4. Run the following command to request an app-only access token from the Microsoft identity platform and return it for use in subsequent API calls:

   ```console
   curl -i -X POST -H "Content-Type:application/x-www-form-urlencoded" -d "grant_type=client_credentials" -d "client_id=%CLIENT_ID%" -d "scope=https://api.securitycenter.microsoft.com/.default" -d "client_secret=%CLIENT_SECRET%" "https://login.microsoftonline.com/%TENANT_ID%/oauth2/v2.0/token" -k
   ```

   A successful response returns a JSON object that contains the bearer token type, expiration time (in seconds), and the `access_token` value you use for API calls. The response resembles the following example:

   ```console
    {"token_type":"Bearer","expires_in":3599,"ext_expires_in":0,"access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIn <truncated> aWReH7P0s0tjTBX8wGWqJUdDA"}
   ```

## Validate the token

Follow the token-validation steps below to ensure that you got the correct token. You can send more than one request with the same token. The token expires in an hour.

1. Copy and paste [the access token you obtained in the previous step](#get-an-access-token) into [JWT decoder (jwt.ms)](https://jwt.ms) to decode it.

2. Validate that you get a roles claim with the desired permissions.

## Use the token to access Microsoft Defender for Endpoint API

After you obtain a valid token, use it in your API requests as follows:

1. Choose the [supported Defender for Endpoint API](exposed-apis-list.md) you want to use.

2. Set the authorization header in the `http` request you send to `Bearer {token}`. *Bearer* is the authorization scheme.

### Example

The following C# snippet sends an authenticated GET request to the Defender for Endpoint alerts endpoint, using the bearer token obtained earlier, and retrieves the list of alerts.

```csharp
var httpClient = new HttpClient();
var request = new HttpRequestMessage(HttpMethod.Get, "https://api.security.microsoft.com/api/alerts");
request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
var response = httpClient.SendAsync(request).GetAwaiter().GetResult();
```
