---
title: Troubleshoot Microsoft Defender XDR service issues
description: Find and solve known Microsoft Defender XDR issues and use workarounds to resolve blocks while using the service.
ms.service: defender-xdr
f1.keywords:
  - NOCSH
ms.author: macapara
author: diannegali
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security-compliance
- tier3
ms.topic: conceptual
search.appverid:
  - MOE150
  - MET150
ms.date: 10/23/2024
appliesto:
  - Microsoft Defender XDR
---

# Troubleshoot Microsoft Defender XDR service issues

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

This article addresses issues that might arise as you use the Microsoft Defender XDR service. It provides solutions and workarounds to help you resolve these issues. If you encounter a problem that isn't addressed here, contact [Microsoft Support](https://support.microsoft.com/contactus).

<a name='i-dont-see-microsoft-365-defender-content'></a>

## I don't see Microsoft Defender XDR content

If you don't see capabilities on the navigation pane such as the Incidents, Action center, or Hunting in your portal, you need to verify that your tenant has the appropriate licenses.

For more information, see [Prerequisites](prerequisites.md).

<a name='microsoft-defender-for-identity-alerts-are-not-showing-up-in-the-microsoft-365-defender-incidents'></a>

## Microsoft Defender for Identity alerts are not showing up in the Microsoft Defender XDR incidents

If you have Microsoft Defender for Identity deployed in your environment but you're not seeing Defender for Identity alerts as part of Microsoft Defender XDR incidents, you need to ensure that the Microsoft Defender for Cloud Apps and Defender for Identity integration is enabled.

For more information, see [Microsoft Defender for Identity integration](/cloud-app-security/mdi-integration).

## How do I turn on Microsoft Defender XDR??

To turn on Microsoft Defender XDR, access **Settings** from the navigation pane in the Microsoft Defender portal. This navigation item is visible only if you have the [prerequisite permissions and licenses](m365d-enable.md#check-license-eligibility-and-required-permissions).

## How do I create an exception for my file/URL?

A false positive is a file or URL that is detected as malicious but isn't a threat. You can create indicators and define exclusions to unblock and allow certain files/URLs. See [Address false positives/negatives in Defender for Endpoint](/defender-endpoint/defender-endpoint-false-positives-negatives).

## How can I integrate ServiceNow tickets into the Microsoft Defender portal?

The Microsoft Defender XDR-ServiceNow connector is no longer available in the Microsoft Defender portal. However, you can still integrate Microsoft Defender XDR with ServiceNow by using the Microsoft Security Graph API. For more information, see [Security solution integrations using the Microsoft Graph Security API](/graph/security-integration).

The Microsoft Defender XDR-ServiceNow integration was previously available in the Microsoft Defender portal for preview and feedback. This integration allowed you to create ServiceNow incidents from Microsoft Defender XDR incidents.

## Why can't I submit files?

In some instances, an administrator block might cause submission issues when you try to submit a potentially infected file to the [Microsoft Security intelligence website](https://www.microsoft.com/wdsi) for analysis. The following process shows how to resolve this problem.

### Review your settings

Open your Azure [Enterprise application settings](https://portal.azure.com/#blade/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/UserSettings/menuId/). Under **Enterprise Applications** >  **Users can consent to apps accessing company data on their behalf**, check whether Yes or No is selected.

- If **No** is selected, a Microsoft Entra administrator for the customer tenant needs to provide consent for the organization. Depending on the configuration with Microsoft Entra ID, users might be able to submit a request right from the same dialog box. If there's no option to ask for admin consent,  users need to request for these permissions to be added to their Microsoft Entra admin. Go to the following section for more information.

- If **Yes** is selected, ensure the Windows Defender Security Intelligence app setting **Enabled for users to sign in?** is set to **Yes** [in Azure](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ManagedAppMenuBlade/Properties/appId/f0cf43e5-8a9b-451c-b2d5-7285c785684d/objectId/4a918a14-4069-4108-9b7d-76486212d75d). If **No** is selected, you need to request a Microsoft Entra admin enable it.

### Implement required Enterprise Application permissions

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

This process requires a Global Administrator or Application Administrator in the tenant.

1. Open [Enterprise Application settings](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ManagedAppMenuBlade/Permissions/appId/f0cf43e5-8a9b-451c-b2d5-7285c785684d/objectId/4a918a14-4069-4108-9b7d-76486212d75d).

2. Select **Grant admin consent for organization**.

3. If you're able to do so, review the API permissions required for this application, as the following image shows. Provide consent for the tenant.

    ![grant consent image.](/defender/media/security-intelligence-images/msi-grant-admin-consent.jpg)

4. If the administrator receives an error while attempting to provide consent manually, try either [Option 1](#option-1-approve-enterprise-application-permissions-by-user-request) or [Option 2](#option-2-provide-admin-consent-by-authenticating-the-application-as-an-admin) as possible workarounds.

#### Option 1: Approve enterprise application permissions by user request

Microsoft Entra Administrators need to allow for users to request admin consent to apps. Verify the setting is configured to **Yes** in [Enterprise applications](https://portal.azure.com/#blade/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/UserSettings/menuId/).

![Enterprise applications user settings.](/defender/media/security-intelligence-images/msi-enterprise-app-user-setting.jpg)

More information is available in [Configure Admin consent workflow](/azure/active-directory/manage-apps/configure-admin-consent-workflow).

Once this setting is verified, users can go through the enterprise customer sign-in at [Microsoft security intelligence](https://www.microsoft.com/wdsi/filesubmission), and submit a request for admin consent, including justification.

![Contoso sign in flow.](/defender/media/security-intelligence-images/msi-contoso-approval-required.png)

Administrators can review and approve the application permissions [Azure admin consent requests](https://portal.azure.com/#blade/Microsoft_AAD_IAM/StartboardApplicationsMenuBlade/AccessRequests/menuId/).

After providing consent, all users in the tenant will be able to use the application.

#### Option 2: Provide admin consent by authenticating the application as an admin

This process requires that Global Administrators go through the Enterprise customer sign-in flow at [Microsoft security intelligence](https://www.microsoft.com/wdsi/filesubmission).

![Consent sign in flow.](/defender/media/security-intelligence-images/msi-microsoft-permission-required.jpg)

Then, admins review the permissions and make sure to select **Consent on behalf of your organization**, and then select **Accept**.

All users in the tenant can now use this application.

#### Option 3: Delete and readd app permissions

If neither of these options resolve the issue, try the following steps (as an admin):

1. Remove previous configurations for the application. Go to [Enterprise applications](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ManagedAppMenuBlade/Properties/appId/f0cf43e5-8a9b-451c-b2d5-7285c785684d/objectId/982e94b2-fea9-4d1f-9fca-318cda92f90b)
and select **delete**.

   ![Delete app permissions.](/defender/media/security-intelligence-images/msi-properties.png)

2. Capture `TenantID` from [Properties](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/Properties).

3. Replace `{tenant-id}` with the specific tenant that needs to grant consent to this application in the URL below. Copy the following URL into browser: `https://login.microsoftonline.com/{tenant-id}/v2.0/adminconsent?client_id=f0cf43e5-8a9b-451c-b2d5-7285c785684d&state=12345&redirect_uri=https%3a%2f%2fwww.microsoft.com%2fwdsi%2ffilesubmission&scope=openid+profile+email+offline_access`

   The rest of the parameters are already completed.

   ![Permissions needed.](/defender/media/security-intelligence-images/msi-microsoft-permission-requested-your-organization.png)

4. Review the permissions required by the application, and then select **Accept**.

5. Confirm the permissions are applied in the [Azure portal](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ManagedAppMenuBlade/Permissions/appId/f0cf43e5-8a9b-451c-b2d5-7285c785684d/objectId/ce60a464-5fca-4819-8423-bcb46796b051).

   ![Review that permissions are applied.](/defender/media/security-intelligence-images/msi-permissions.jpg)

6. Sign in to [Microsoft security intelligence](https://www.microsoft.com/wdsi/filesubmission) as an enterprise user with a non-admin account to see if you have access.

 If the warning isn't resolved after following these troubleshooting steps, call Microsoft support.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
