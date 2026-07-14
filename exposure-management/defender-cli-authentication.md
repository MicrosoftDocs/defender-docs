---
title: Defender CLI setup for agentic code security
description: Set up Defender CLI authentication to run agentic code scans locally or in CI/CD pipelines.
ms.topic: how-to
ms.date: 07/08/2026
ai-usage: ai-assisted
---

# Defender CLI setup for agentic code security (preview)

Use Defender CLI authentication to run agentic code scans locally or in CI/CD pipelines.

## Authentication options

Agentic code security supports two Defender CLI authentication methods:

- **App-based authentication**: Use this option for CI/CD pipelines and other non-interactive automation.
- **Interactive authentication**: Use this option for local terminal scans by signed-in users.

## Required permissions

The permissions you need depend on your authentication method. For information about assigning Defender unified RBAC permissions, see [Assign permissions to users using Defender RBAC](ai-code-security-onboarding.md#assign-permissions-to-users-using-defender-rbac).

| Authentication method | Required permissions |
|---|---|
| App-based authentication | **Application Administrator** role in Microsoft Entra ID to register the app and add API permissions. **Global Administrator** role to grant admin consent. The app registration requires the **AIScan.enabled** permission to run AI scans and **AIScan.Upload** to upload scan results. |
| Interactive authentication | **Security Administrator** role in Microsoft Entra ID. In Microsoft Defender unified RBAC, assign the permissions required to run scans, upload scan results, and view or manage scan results. |

## Install the Microsoft Defender Code enterprise application if required

This step is needed for both authentication methods. The script installs the Microsoft Defender Code first-party app on your tenant and grants admin consent for users running the CLI locally.

> [!NOTE]
> For customers with an E5 license, the Microsoft Defender Code app is automatically provisioned during MDASH onboarding. Running this script isn't required. If your tenant doesn't have an E5 license, complete the following steps.

1. Install Azure CLI if it isn't already installed.

   ```powershell
   winget install -e --id Microsoft.AzureCLI
   ```

1. Copy the admin consent script and save it as `Grant-DefenderAdminConsent.ps1`. For more information, see [Microsoft Defender Code admin consent script](microsoft-defender-code-admin-consent-script.md).

1. Run the saved script with your tenant ID.

   ```powershell
   ./Grant-DefenderAdminConsent.ps1 -TenantId <tenant-id>
   ```

1. Complete the Azure sign-in flow. Copy the code shown in Azure CLI and sign in with the redirected URL.

1. Verify that the application was installed:
   1. In Microsoft Entra ID, go to **Overview**.
   1. Search your tenant for **Microsoft Defender Code**.
   1. Confirm that the application appears under **Enterprise applications**.
    
## Use app-based authentication

Use app-based authentication to run Defender CLI scans in CI/CD pipelines.

### Prerequisites

- **Application Administrator** role in Microsoft Entra ID.
- **Global Administrator** role available to approve the required permissions.
- Permission to view the app registration's tenant ID and client ID, and to create or retrieve a client secret.
- Azure CLI installed.

### Create a Microsoft Entra app

1. Sign in to the Azure portal.
1. Search for and select **App registrations**.
1. Select **New registration**.
1. Enter a name for your application, and then select **Register**.

### Add API permissions

1. In the new app registration, expand **Manage** in the left navigation pane.
1. Select **API permissions** > **Add a permission**.
1. Select **APIs my organization uses**.
1. Search for and select **Microsoft Defender Code**.
1. Select **Application permissions**.
1. Add the permissions you need:
   - To allow users to run AI scans, select **AIScan.enabled**.
   - To allow users to upload AI scan results to Defender, select **AIScan.Upload**.
1. Select **Add permissions**.

> [!NOTE]
> The **AIScan.View** role currently doesn't affect permissions.

### Grant admin consent

A Global Administrator must grant consent for the permissions. If the **Grant admin consent** button isn't available, you don't have the Global Administrator role.

1. On the **API permissions** page, select **Grant admin consent**.
1. Confirm when prompted.

### Add a client secret

1. In your app registration, select **Certificates & secrets** > **New client secret**.
1. Enter a description and expiration date, and then select **Add**.
1. Store the secret value in a secure location. You can't view it again after you leave the page.
1. Record the **Application (client) ID** and **Directory (tenant) ID** from the app registration **Overview** page.

### Configure credentials for CI/CD

To configure Defender CLI in a pipeline, add the following values as encrypted secrets in your CI/CD platform, then expose them as environment variables in the workflow or pipeline job that runs the scan:

```bash
DEFENDER_ASPM_TENANT_ID
DEFENDER_ASPM_CLIENT_ID
DEFENDER_ASPM_CLIENT_SECRET
```

To find `DEFENDER_ASPM_TENANT_ID` and `DEFENDER_ASPM_CLIENT_ID`, open the app registration in Microsoft Entra ID and copy the **Directory (tenant) ID** and **Application (client) ID** values from the **Overview** page.

To get `DEFENDER_ASPM_CLIENT_SECRET`, create a new client secret in the same app registration, copy the secret value immediately after it's created, and store it securely in your pipeline secret store.

> [!IMPORTANT]
> Don't commit this secret to source control or include it in workflow logs. Rotate secrets regularly and replace them before they expire to avoid pipeline failures.

## Use interactive authentication

Use this approach to let users authenticate with their Defender credentials for local Defender CLI scans. You can also use app-based authentication instead.

### Prerequisites

- At least **Security Administrator** role in Microsoft Entra ID.
- Required permissions assigned in Microsoft Defender unified RBAC. For more information, see [Assign permissions to users using Defender RBAC](ai-code-security-onboarding.md#assign-permissions-to-users-using-defender-rbac).

### Set the tenant environment variable

Set the tenant ID used for Defender interactive authentication in your shell as an environment variable before you sign in. This ensures Azure CLI requests the device login against the correct Microsoft Entra tenant.

```bash
DEFENDER_DFD_TENANT_ID=<tenant-id>
```

### Sign in with Azure CLI

Run the following command to start a device code sign-in flow for Defender interactive authentication. The scope value requests the Defender interactive login permission, and the command allows sign-in even when no Azure subscription is associated with the account.

```bash
az login \
  --tenant <DEFENDER_DFD_TENANT_ID> \
  --scope b1a78a13-a596-4366-b37d-406048fa4a23/Defender.InteractiveLogin \
  --allow-no-subscriptions \
  --use-device-code
```

### Complete the device code sign-in

1. Copy the device code shown in the console, then open the device login page in your browser.
1. Sign in with an account that has access to the specified tenant.
1. Paste the device code when prompted and complete the authentication flow.
1. Return to the console and wait for the Azure CLI session to complete.

## Next steps

- [Install and run Defender CLI](defender-cli.md)
- [CI/CD example for Defender CLI](defender-cli-cicd.md)
- [Set up agentic code security](ai-code-security-onboarding.md)