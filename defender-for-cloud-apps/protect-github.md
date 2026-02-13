---
title: Protect your GitHub Enterprise environment | Microsoft Defender for Cloud Apps
description: Learn how about connecting your GitHub Enterprise app to Defender for Cloud Apps using the API connector.
ms.date: 01/07/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
---

# How Defender for Cloud Apps helps protect your GitHub Enterprise environment

GitHub Enterprise Cloud is a service that helps organizations store and manage their code, as well as track and control changes to their code. Along with the benefits of building and scaling code repositories in the cloud, your organization's most critical assets might be exposed to threats. Exposed assets include repositories with potentially sensitive information, collaboration and partnership details, and more. Preventing exposure of this data requires continuous monitoring to prevent any malicious actors or security-unaware insiders from exfiltrating sensitive information.

Connecting GitHub Enterprise Cloud to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection for anomalous behavior.

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]


## Main threats

- Compromised accounts and insider threats
- Data leakage
- Insufficient security awareness
- Unmanaged bring your own device (BYOD)

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## SaaS security posture management

To see security posture recommendations for GitHub in Microsoft Secure Score, create an API connector via the **Connectors** tab, with *Owner* and *Enterprise* permissions. In Secure Score, select **Recommended actions** and filter by **Product** = **GitHub**.

For example, recommendations for GitHub include:

- *Enable multifactor authentication (MFA)*
- *Enable single sign-on (SSO)*
- *Disable 'Allow members to change repository visibilities for this organization'*
- *Disable 'members with admin permissions for repositories can delete or transfer repositories'*

If a connector already exists and you don't see GitHub recommendations yet, refresh the connection by disconnecting the API connector, and then reconnecting it with the *Owner* and *Enterprise* permissions.

For more information, see:

- [Security posture management for SaaS apps](security-saas.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

## Protect GitHub in real time

Review our best practices for [securing and collaborating with guests](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls).

## Connect GitHub Enterprise Cloud to Microsoft Defender for Cloud Apps

This section provides instructions for connecting Microsoft Defender for Cloud Apps to your existing GitHub Enterprise Cloud organization using the App Connector APIs. This connection gives you visibility into and control over your organization's GitHub Enterprise Cloud use. For more information about how Defender for Cloud Apps protects GitHub Enterprise Cloud, see [Protect GitHub Enterprise](protect-github.md).

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]

### Prerequisites

- Your organization must have a **GitHub Enterprise Cloud** license.
- The GitHub account used for connecting to Defender for Cloud Apps must have Owner permissions for your organization.
- For SSPM capabilities, the provided account must be the owner of the enterprise account.
- To verify owners of your organization, browse to your organization's page, select **People**, and then filter by *Owner*.

### Verify your GitHub domains

Verifying your domains is optional. We recommend that you do verify your domains so that Defender for Cloud Apps can match the domain emails of your GitHub organization's members to their corresponding Azure Active Directory user.

These steps are independent of the [Configure GitHub Enterprise Cloud](#configure-github-enterprise-cloud) steps and can be skipped if your domains are already verified.

1. Upgrade your organization to the [Corporate Terms of Service](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/upgrading-to-the-corporate-terms-of-service).
1. Verify [your organization's domains](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/verifying-your-organizations-domain).

    > [!NOTE]
    > Make sure to verify each of the managed domains listed in your Defender for Cloud Apps settings. Managed domains are listed in the Microsoft Defender Portal under **Settings** > **Cloud Apps** > **System** > **Organizational details** > **Managed domains**.

### Configure GitHub Enterprise Cloud

1. Copy your organization's sign-in name. You'll need it later.

    > [!NOTE]
    > The page will have a URL like `https://github.com/<your-organization>`. For example, if your organization's page is `https://github.com/sample-organization`, the organization's sign-in name is *sample-organization*.


1. Create an OAuth App for Defender for Cloud Apps to connect your GitHub organization.

1. Fill out the **Register a new OAuth app** details and then select **Register application**. 
    - In the **Application name** box, enter a name for the app.
    - In the **Homepage URL** box, enter the URL for the app's homepage.
    - In the **Authorization callback URL** box, enter the following value: `https://portal.cloudappsecurity.com/api/oauth/connect`.

    > [!NOTE]
    >
    > - For US Government GCC customers, enter the following value: `https://portal.cloudappsecuritygov.com/api/oauth/connect`
    > - For US Government GCC High customers, enter the following value: `https://portal.cloudappsecurity.us/api/oauth/connect`
    > 
    > - Apps owned by an organization have access to the organization's apps. For more information, see [About OAuth App access restrictions](https://help.github.com/en/github/setting-up-and-managing-organizations-and-teams/about-oauth-app-access-restrictions).

1. Select the OAuth App you created, and copy the **Client ID** and **Client Secret**.


### Configure Defender for Cloud Apps

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+Connect an app**, followed by **GitHub**.

1. In the next window, give the connector a descriptive name, and then select **Next**.

1. In the **Enter details** window, fill out the **Client ID**, **Client Secret**, and **Organization Login Name** that you made a note of earlier.

   :::image type="content" source="media/connect-github-connect-app.png" alt-text="Connect GitHub.":::

   The **Enterprise slug**, also known as the enterprise name, is needed for supporting SSPM capabilities. To find the **Enterprise slug**:
   
   1. Select the **GitHub Profile picture** -> **your enterprises**.
   1. Select **your enterprise account** and choose the account you want to connect to Microsoft Defender for Cloud Apps.
   1. Confirm that the URL contains the enterprise slug. For instance, `https://github.com/enterprises/testEnterprise` 
   1. Enter only the enterprise slug, not the entire URL. In this example, *testEnterprise* is the enterprise slug.

1. Select **Connect GitHub**.

    If necessary, enter your GitHub administrator credentials to allow Defender for Cloud Apps access to your team's GitHub Enterprise Cloud instance.

1. Request organization access and authorize the app to give Defender for Cloud Apps access to your GitHub organization. Defender for Cloud Apps requires the following OAuth scopes:

    - **admin:org** - required for synchronizing your organization's audit log
    - **read:user** and **user:email** - required for synchronizing your organization's members
    - **repo:status** - required for synchronizing repository-related events in the audit log
    - **read:enterprise** - required for SSPM capabilities. The provided user must be the owner of the enterprise account.

    For more information about OAuth scopes, see [Understanding scopes for OAuth Apps](https://docs.github.com/developers/apps/building-oauth-apps/scopes-for-oauth-apps).

    Back in the Defender for Cloud Apps console, you should receive a message that GitHub was successfully connected.

1. Work with your GitHub organization owner to grant organization access to the OAuth app created under the GitHub **Third-party access** settings. For more information, see [GitHub documentation](https://docs.github.com/en/organizations/managing-oauth-access-to-your-organizations-data/enabling-oauth-app-access-restrictions-for-your-organization).

   The organization owner will find the request from the OAuth app only after connecting GitHub to Defender for Cloud Apps.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

After connecting GitHub Enterprise Cloud, you'll receive events for 7 days prior to connection.

## Next steps

- If you have any problems connecting the app, see [Troubleshooting App Connectors](troubleshooting-api-connectors-using-error-messages.md).

- [Control cloud apps with policies](control-cloud-apps-with-policies.md)

