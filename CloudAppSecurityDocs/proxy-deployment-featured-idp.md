---
title: Onboard non-Microsoft IdP catalog apps for Conditional Access app control | Microsoft Defender for Cloud Apps
description: Learn how to deploy Conditional Access app control with Microsoft Defender for Cloud Apps, for catalog apps with a non-Microsoft IdP.
ms.date: 05/15/2024
ms.topic: how-to
---

# Onboard non-Microsoft IdP catalog apps for Conditional Access app control



Access and session controls in Microsoft Defender for Cloud apps work with both catalog and custom apps. While Microsoft Entra ID apps are automatically onboarded to use Conditional Access app control, if you're working with a non-Microsoft IdP, you'll need to onboard your app manually.

This article describes how to configure your IdP to work with Defender for Cloud Apps. Integrating your IdP with Defender for Cloud Apps automatically onboards all catalog apps from your IdP for Conditional Access app control.

## Prerequisites

- Your organization must have the following licenses to use conditional access app control:

  - The license required by your identity provider (IdP) solution
  - Microsoft Defender for Cloud Apps

- Apps must be configured with single sign-on
- Apps must be configured with the SAML 2.0 authentication protocol.

Fully performing and testing the procedures in this article requires that you have a session or access policy configured. For more information, see:

- [Create Microsoft Defender for Cloud Apps access policies](access-policy-aad.md)
- [Create Microsoft Defender for Cloud Apps session policies](session-policy-aad.md)

## Configure your IdP to work with Defender for Cloud Apps

This procedure describes how to route app sessions from other IdP solutions to Defender for Cloud Apps.

> [!TIP]
> The following articles provide detailed examples of this procedure:
> 
> - [Configure your PingOne IdP](proxy-idp-pingone.md)
> - [Configure your AD FS IdP](proxy-idp-adfs.md)
> - [Configure your Okta IdP](proxy-idp-okta.md)

**To configure your IdP to work with Defender for Cloud Apps**:

1. In Microsoft Defender XDR, select **Settings > Cloud Apps > Connected Apps > Conditional Access App Control apps**.

1. In the **Conditional Access App Control apps** page, select **+ Add**.

1. In the **Add a SAML application with your identity provider** dialog, select the **Search for an app** drop down and then select the app you want to deploy. With your app selected, select **Start wizard**.

1. On the wizard's **APP INFORMATION** page, either upload a metadata file from your app or enter app data manually.

    Make sure to provide the following information:

    - The **Assertion consumer service URL**. This is the URL that your app uses to receive SAML assertions from your IdP.
    - A SAML certificate, if your app provides one. In such cases, select the **Use ... SAML certificate** option, and then upload the certificate file.

    When you're finished, select **Next** to continue.

1. On the wizard's **IDENTITY PROVIDER** page, follow the instructions to set up a new custom app in your IdP's portal.

    > [!NOTE]
    > The steps required may differ, depending on your IdP. We recommend that you perform the external configuration as described for the following reasons:
    >
    > - Some identity providers do not allow you to change the SAML attributes or URL properties of a gallery / catalog app.
    > - When you configure a custom app, you can test the app with Defender for Cloud Apps access and session controls, without changing your organization's existing configured behavior.

    Copy your app's single sign-on configuration information for use later in this procedure. When you're finished, select **Next** to continue.

1. Continuing on the **IDENTITY PROVIDER** page of the wizard, either upload a metadata file from your IdP or enter app data manually.

    Make sure to provide the following information:

    - The **Single sign-on service URL**. This is the URL that your IdP uses to receive single sign-on requests.
    -  A SAML certificate, if your IdP provides one. In such cases, select the **Use identity provider's SAML certificate** option, and then upload the certificate file.

1. Continuing on the **IDENTITY PROVIDER** page of the wizard, copy both the single sign-on URL and all attributes and values for use later in this procedure.

    When you're done, select **Next** to continue.

1. Browse to your IdP's portal and enter the values you'd copied to your IdP configuration. Typically, these settings are found in your IdP's custom app settings area.

    1. Enter your app's single sign-on URL that you'd copied from the previous step. Some providers may refer to the single sign-on URL as the *Reply URL*.

    1. Add the attributes and values you'd copied from the previous step to the app's properties. Some providers may refer to them as *User attributes* or *Claims*.

        If your attributes are limited to 1024 characters for new apps, first create the app without the relevant attributes, and add them in afterwards by editing the app.

    1. Verify that your name identifier is in the format of an email address.

    1. Make sure to save your settings when you're done.

1. Back in Defender for Cloud Apps, on the wizard's **APP CHANGES** page, copy the SAML single sign-on URL and download the Microsoft Defender for Cloud Apps SAML certificate. The SAML single sign-on URL is a customized URL for your app when used with Defender for Cloud Apps Conditional Access app control.

1. Browse to your app's portal and configure your single-sign on settings as follows:

    1. (Recommended) Create a back up of your current settings.
    1. Replace the identity provider sign-in URL field value with the Defender for Cloud Apps SAML single sign-on URL you copied from the previous step. The specific name for this field may differ, depending on your app.
    1. Upload the Defender for Cloud Apps SAML certificate you downloaded in the previous step.
    1. Make sure to save your changes.

1. In the wizard, select **Finish** to complete the configuration.

After saving your app's single-sign on settings with the values customized by Defender for Cloud Apps, all associated sign-in requests to the app are routed though Defender for Cloud Apps and Conditional Access app control.

> [!NOTE]
> The Defender for Cloud Apps SAML certificate is valid for 1 year. After it expires, you'll need to generate and upload a new one.

## Sign in to your app using a user scoped to the policy<a name="sign-in-scoped"></a>

After you've created your access or session policy, sign in to each app configured in the policy. Make sure that you've first signed out of all existing sessions, and that you sign in with a user configured in the policy.

Defender for Cloud Apps will sync your policy details to its servers for each new app you sign in to. This may take up to one minute.

For more information, see:

- [Create Microsoft Defender for Cloud Apps access policies](access-policy-aad.md)
- [Create Microsoft Defender for Cloud Apps session policies](session-policy-aad.md)


## Verify that apps are configured to use access and session controls<a name="portal"></a>

[!INCLUDE [verify-apps-for-access-session-controls](includes/verify-apps-for-access-session-controls.md)]

## Related content

- [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md)
- [Deploy Conditional Access app control for custom apps with non-Microsoft identity providers](proxy-deployment-any-app-idp.md)
- [Troubleshooting access and session controls](troubleshooting-proxy.md)

[!INCLUDE [Open support ticket](includes/support.md)]
