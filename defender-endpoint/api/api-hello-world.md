---
title: Hello World for Microsoft Defender for Endpoint API
ms.reviewer:
description: Create a practice 'Hello world'-style API call to the Microsoft Defender for Endpoint API.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom:
  - api
  - sfi-image-nochange
ms.date: 01/08/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
---

# Microsoft Defender for Endpoint API - Hello World

[!INCLUDE [Microsoft Defender XDR rebranding](../../includes/microsoft-defender.md)]

[!INCLUDE [Microsoft Defender for Endpoint API URIs for US Government](../../includes/microsoft-defender-api-usgov.md)]

[!INCLUDE [Improve request performance](../../includes/improve-request-performance.md)]

## Get Alerts using a simple PowerShell script

### How long it takes to go through this example?

It only takes 5 minutes done in two steps:

- Application registration
- Use examples: only requires copy/paste of a short PowerShell script

### Do I need a permission to connect?

For the Application registration stage, you must have an appropriate role assigned in your Microsoft Entra tenant. For more details about roles, see [Permission options](../user-roles.md#permission-options).

<a name='step-1---create-an-app-in-azure-active-directory'></a>

### Step 1 - Create an App in Microsoft Entra ID

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Navigate to **Microsoft Entra ID** \> **App registrations** \> **New registration**.

   :::image type="content" source="../media/atp-azure-new-app2.png" alt-text="The App registrations option under the Manage pane in the Microsoft Entra admin center"  lightbox="../media/atp-azure-new-app2.png":::

3. In the registration form, choose a name for your application and then select **Register**.

4. Allow your Application to access Defender for Endpoint and assign it **'Read all alerts'** permission:

   - On your application page, select **API Permissions** \> **Add permission** \> **APIs my organization uses** > type **WindowsDefenderATP** and select **WindowsDefenderATP**.

     > [!NOTE]
     > WindowsDefenderATP does not appear in the original list. You need to start writing its name in the text box to see it appear.

     :::image type="content" source="../media/add-permission.png" alt-text="The API permissions option under the Manage pane in the Microsoft Entra admin center" lightbox="../media/add-permission.png":::

   - Choose **Application permissions** \> **Alert.Read.All**, and then select **Add permissions**.

     :::image type="content" source="../media/application-permissions.png" alt-text="The permission type and settings panes in the Request API permissions page" lightbox="../media/application-permissions.png":::

     > [!IMPORTANT]
     > You need to select the relevant permissions. **Read All Alerts** is only an example.

     For example:

     - To [run advanced queries](run-advanced-query-api.md), select 'Run advanced queries' permission.
     - To [isolate a machine](isolate-machine.md), select 'Isolate machine' permission.
     - To determine which permission you need, see the **Permissions** section in the API you're interested to call.

5. Select **Grant consent**.

   > [!NOTE]
   > Every time you add permission, you must click on **Grant consent** for the new permission to take effect.

   :::image type="content" source="../media/grant-consent.png" alt-text="The grant permission consent option in the Microsoft Entra admin center" lightbox="../media/grant-consent.png":::

6. Add a secret to the application.

    Select **Certificates & secrets**, add description to the secret and select **Add**.

    > [!IMPORTANT]
    > After click Add, **copy the generated secret value**. You won't be able to retrieve after you leave!

    :::image type="content" source="../media/webapp-create-key2.png" alt-text="The Certificates & secrets menu item in the Manage pane in the Microsoft Entra admin center" lightbox="../media/webapp-create-key2.png":::

7. Write down your application ID and your tenant ID.

   On your application page, go to **Overview** and copy the following:

   :::image type="content" source="../media/app-and-tenant-ids.png" alt-text="The application details pane under the Overview menu item in the Microsoft Entra admin center" lightbox="../media/app-and-tenant-ids.png":::

Done! You've successfully registered an application!

### Step 2 - Get a token using the App and use this token to access the API

> [!TIP]
> Some Microsoft Defender for Endpoint APIs continue to require access tokens issued for the legacy resource `https://api.securitycenter.microsoft.com`. If the token audience doesn't match the resource expected by the API, requests fail with `403 Forbidden`, even if the API endpoint uses `https://api.security.microsoft.com`. Use `https://api.securitycenter.microsoft.com` as the resource or scope when acquiring tokens.

Copy the following script to PowerShell ISE or to a text editor, and save it as `Get-Token.ps1`. Running this script generates a token and saves it in the working folder under the name `Latest-token.txt`.

```powershell
# This code gets the application context token and saves it to a file named "Latest-token.txt" in the current directory.

$tenantId = '' ### Paste your tenant ID here
$appId = '' ### Paste your Application (client) ID here
$appSecret = '' ### Paste your Application secret (App key) here to test, and then store it in a safe place!

$resourceAppIdUri = 'https://api.securitycenter.microsoft.com/'
$oAuthUri = "https://login.microsoftonline.com/$TenantId/oauth2/token"
$authBody = [Ordered] @{
  resource = "$resourceAppIdUri"
  client_id = "$appId"
  client_secret = "$appSecret"
  grant_type = 'client_credentials'
}
$authResponse = Invoke-RestMethod -Method Post -Uri $oAuthUri -Body $authBody -ErrorAction Stop
$token = $authResponse.access_token
Out-File -FilePath "./Latest-token.txt" -InputObject $token
return $token
```

#### Validate the token

1. Run the script to generate the `Latest-token.txt` file.
2. In a web browser, open <https://jwt.ms/>, and then copy the token (the contents of the `Latest-token.txt`) in the **Enter token below** box.
3. On the **Decoded token** tab, find the **roles** section, and verify it contains **Alert.Read.All** permissions as shown in the following image:

:::image type="content" source="../media/api-jwt-ms.png" alt-text="Screenshot of jwt.ms showing a copied token and the decoded token with the Roles section and the Alert.Read.All permission highlighted." lightbox="../media/api-jwt-ms.png":::

### Let's get the Alerts!

- The following script uses `Get-Token.ps1` to access the API and gets alerts for the past 48 hours.
- Save this script in the same folder you saved the previous script `Get-Token.ps1`.
- The script creates two files (json and csv) with the data in the same folder as the scripts.

```powershell
# Returns Alerts created in the past 48 hours.

$token = ./Get-Token.ps1       #run the script Get-Token.ps1  - make sure you are running this script from the same folder of Get-Token.ps1

# Get Alert from the last 48 hours. Make sure you have alerts in that time frame.
$dateTime = (Get-Date).ToUniversalTime().AddHours(-48).ToString("o")

# The URL contains the type of query and the time filter we created previously.
# Learn more about other query options and filters: https://learn.microsoft.com/defender-endpoint/api/get-alerts.
$url = "https://api.security.microsoft.com/api/alerts?`$filter=alertCreationTime ge $dateTime"

# Set the WebRequest headers
$headers = @{
  'Content-Type' = 'application/json'
  Accept = 'application/json'
  Authorization = "Bearer $token"
}

# Send the web request and get the results.
$response = Invoke-WebRequest -Method Get -Uri $url -Headers $headers -ErrorAction Stop

# Extract the alerts from the results.
$alerts =  ($response | ConvertFrom-Json).value | ConvertTo-Json

# Get string with the execution time. We concatenate that string to the output file to avoid overwrite the file.
$dateTimeForFileName = Get-Date -Format o | foreach {$_ -replace ":", "."}

# Save the result as json and as csv.
$outputJsonPath = "./Latest Alerts $dateTimeForFileName.json"
$outputCsvPath = "./Latest Alerts $dateTimeForFileName.csv"

Out-File -FilePath $outputJsonPath -InputObject $alerts
($alerts | ConvertFrom-Json) | Export-CSV $outputCsvPath -NoTypeInformation
```

You're all done! You successfully:

- Created and registered and application.
- Granted permission for that application to read alerts.
- Connected the API.
- Used a PowerShell script to return alerts created in the past 48 hours.

## Related articles

- [Microsoft Defender for Endpoint APIs](exposed-apis-list.md)
- [Access Microsoft Defender for Endpoint with application context](exposed-apis-create-app-webapp.md)
- [Access Microsoft Defender for Endpoint with user context](exposed-apis-create-app-nativeapp.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../../includes/defender-mde-techcommunity.md)]
