---
title: Troubleshoot Microsoft Defender XDR service issues
description: Find solutions and workarounds for known Microsoft Defender XDR service issues, including licensing, alerts, file submissions, and ServiceNow integration.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection: 
- m365-security-compliance
- tier3
ms.topic: how-to
ms.date: 06/18/2026
appliesto:
  - Microsoft Defender XDR
ms.custom: sfi-ga-nochange, msecd-doc-authoring-1014
ai-usage: ai-assisted

#Customer intent: As a security administrator, I want to troubleshoot known Microsoft Defender XDR service issues so that I can restore functionality and resolve errors quickly.
---

# Troubleshoot Microsoft Defender XDR service issues

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Issues might arise as you use the Microsoft Defender XDR service. The following sections provide solutions and workarounds. If you encounter a problem that isn't addressed here, contact [Microsoft Support](https://support.microsoft.com/contactus).

<a name='i-dont-see-microsoft-365-defender-content'></a>

## I don't see Microsoft Defender content

If you don't see capabilities on the navigation pane such as the Incidents, Action center, or Hunting in your portal, verify that your tenant has the appropriate licenses.

For more information, see [Prerequisites](prerequisites.md).

<a name='microsoft-defender-for-identity-alerts-are-not-showing-up-in-the-microsoft-365-defender-incidents'></a>

## Microsoft Defender for Identity alerts are not showing up in the Microsoft Defender incidents

If you deployed Microsoft Defender for Identity but don't see its alerts in Microsoft Defender incidents, check that the Defender for Cloud Apps and Defender for Identity integration is turned on.

For more information, see [Microsoft Defender for Identity integration](/cloud-app-security/mdi-integration).

## My legitimate file/URL is being detected as malicious

A false positive is a file or URL that is detected as malicious but isn't a threat. You can create indicators and define exclusions to unblock and allow certain files/URLs. See [Address false positives/negatives in Defender for Endpoint](/defender-endpoint/defender-endpoint-false-positives-negatives).

## My ServiceNow tickets are no longer available in the Microsoft Defender portal

The ServiceNow connector is no longer in the Microsoft Defender portal. To connect Microsoft Defender XDR with ServiceNow, use the Microsoft Graph Security API instead. For details, see [Security solution integrations using the Microsoft Graph Security API](/graph/security-integration).

The ServiceNow connector was offered in the portal as a preview. It let you create ServiceNow incidents from Microsoft Defender XDR incidents.

## I can't submit files

In some instances, an administrator block might cause submission issues when you try to submit a potentially infected file to the [Microsoft Security intelligence website](https://www.microsoft.com/wdsi) for analysis. The following process shows how to resolve this problem.

### Review your settings

Open your Azure [Enterprise application settings](https://portal.azure.com/#view/Microsoft_AAD_IAM/ConsentPoliciesMenuBlade/~/UserSettings). Under **Consent and permissions** > **User consent settings**, check which option is selected under **User consent for applications**.

- If **Do not allow user consent** is selected, a Microsoft Entra administrator for the customer tenant needs to provide consent for the organization. Depending on the configuration with Microsoft Entra ID, users might be able to submit a request right from the same dialog box. If there's no option to ask for admin consent, users need to request for these permissions to be added to their Microsoft Entra admin. Go to the following section for more information.

- If **Allow user consent for apps from verified publishers, for selected permissions** or **Let Microsoft manage your consent settings** is selected, verify that the Windows Defender Security Intelligence enterprise application is enabled for sign-in. This setting is on the app **Properties** page, not under **User consent settings**.

   - To verify: In the [Azure portal](https://portal.azure.com/), go to **Microsoft Entra ID** > **Manage** > **Enterprise applications** > **All applications**, search for and open **Windows Defender Security Intelligence**. Under **Manage**, open **Properties**. Confirm that **Enabled for users to sign in?** is set to **Yes**. If it's set to **No**, request that a Microsoft Entra administrator enable it.

### Implement required Enterprise Application permissions

This process requires an Application Administrator or higher in the tenant.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Entra ID** > **Manage** > **Enterprise applications** > **All applications**.

1. Search for and select **Windows Defender Security Intelligence**.

1. In the navigation menu, go to **Security** > **Permissions**.

1. Select **Grant admin consent for \<your organization\>**, and confirm. If you're able to do so, review the API permissions required for this application, as the following image shows. Provide consent for the tenant.

   :::image type="content" source="media/troubleshoot/msi-grant-admin-consent.jpg" alt-text="Screenshot of the admin consent dialog showing API permissions for Windows Defender Security Intelligence." lightbox="media/troubleshoot/msi-grant-admin-consent.jpg":::

1. If the administrator receives an error while attempting to provide consent manually, try either [Option 1](#option-1-approve-enterprise-application-permissions-by-user-request) or [Option 2](#option-2-provide-admin-consent-by-authenticating-the-application-as-an-admin) as possible workarounds.

#### Option 1: Approve enterprise application permissions by user request

Microsoft Entra administrators need to allow users to request admin consent to apps. 

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Entra ID** > **Enterprise applications** > **Security** > **Consent and permissions** > **Admin consent settings**.

1. Under **Admin consent requests**, verify that **Users can request admin consent to apps they are unable to consent to** is set to **Yes**.

If you're redirected to **Enterprise applications** > **User settings** and see a message that settings moved, open **Consent and permissions** and then select **Admin consent settings**.

More information is available in [Configure Admin consent workflow](/entra/identity/enterprise-apps/configure-admin-consent-workflow).

Once this setting is verified, users can go through the enterprise customer sign-in at [Microsoft security intelligence](https://www.microsoft.com/wdsi/filesubmission), and submit a request for admin consent, including justification.

:::image type="content" source="media/troubleshoot/msi-contoso-approval-required.png" alt-text="Screenshot of the approval request dialog during enterprise sign-in." lightbox="media/troubleshoot/msi-contoso-approval-required.png":::

Administrators can review and approve the application permissions [Azure admin consent requests](https://portal.azure.com/#blade/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/AccessRequests/menuId/).

After providing consent, all users in the tenant will be able to use the application.

#### Option 2: Provide admin consent by authenticating the application as an admin

This process requires that a Global Administrator go through the Enterprise customer sign-in flow at [Microsoft security intelligence](https://www.microsoft.com/wdsi/filesubmission).

:::image type="content" source="media/troubleshoot/msi-microsoft-permission-required.jpg" alt-text="Screenshot of the Microsoft permissions request dialog for organization consent." lightbox="media/troubleshoot/msi-microsoft-permission-required.jpg":::

Then, admins review the permissions and make sure to select **Consent on behalf of your organization**, and then select **Accept**.

All users in the tenant can now use this application.

#### Option 3: Delete and read app permissions

If neither Option 1 (user request) nor Option 2 (admin authentication) resolves the issue, try the following steps (as an admin):

1. Remove previous configurations for the application. Go to [Enterprise applications](https://portal.azure.com/#view/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/~/AppAppsPreview).

1. Search for and select **Windows Defender Security Intelligence**.

1. In the navigation menu, go to **Manage** > **Properties**.

1. Select **delete**.

   :::image type="content" source="media/troubleshoot/msi-properties.png" alt-text="Screenshot of the enterprise application properties page with the delete option." lightbox="media/troubleshoot/msi-properties.png":::

1. Capture `TenantID` from [Properties](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Properties).

1. Replace `{tenant-id}` with the specific tenant that needs to grant consent to this application in the URL below. Copy the following URL into browser: `https://login.microsoftonline.com/{tenant-id}/v2.0/adminconsent?client_id=f0cf43e5-8a9b-451c-b2d5-7285c785684d&state=12345&redirect_uri=https%3a%2f%2fwww.microsoft.com%2fwdsi%2ffilesubmission&scope=openid+profile+email+offline_access`

   The rest of the parameters are already completed.

   :::image type="content" source="media/troubleshoot/msi-microsoft-permission-requested-your-organization.png" alt-text="Screenshot of the permissions requested dialog for the organization." lightbox="media/troubleshoot/msi-microsoft-permission-requested-your-organization.png":::

1. Review the permissions required by the application, and then select **Accept**.

1. Confirm the permissions are applied in the [Azure portal](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ManagedAppMenuBlade/Permissions/appId/f0cf43e5-8a9b-451c-b2d5-7285c785684d/objectId/ce60a464-5fca-4819-8423-bcb46796b051).

   :::image type="content" source="media/troubleshoot/msi-permissions.jpg" alt-text="Screenshot of the permissions page confirming granted permissions." lightbox="media/troubleshoot/msi-permissions.jpg":::

1. Sign in to [Microsoft security intelligence](https://www.microsoft.com/wdsi/filesubmission) as an enterprise user with a non-admin account to see if you have access.

If the warning isn't resolved after following these troubleshooting steps, call Microsoft support.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
