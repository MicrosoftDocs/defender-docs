---
title: Troubleshoot access and session controls for admins | Microsoft Defender for Cloud Apps
description: This article describes how to troubleshoot common access and session control issues experienced by admins with Microsoft Defender for Cloud Apps.
ms.date: 06/18/2024
ms.topic: troubleshooting
---

# Troubleshooting access and session controls for admin users



This article provides Microsoft Defender for Cloud Apps admins with guidance on how to investigate and resolve common access and session control issues as experienced by admins.

> [!NOTE]
> Any troubleshooting related to proxy functionality is only relevant for sessions that are not configured for [in-browser protection with Microsoft Edge](in-browser-protection.md).
>

## Check minimum requirements

Before you start troubleshooting, make sure your environment meets the following minimum general requirements for access and session controls.

|Requirement  |Description  |
|---------|---------|
|**Licensing**     |   Make sure you have a valid [license](https://aka.ms/M365EnterprisePlans) for Microsoft Defender for Cloud Apps.      |
|**Single Sign-On (SSO)**     |  Apps must be configured with one of the supported SSO solutions: <br><br>  - Microsoft Entra ID using SAML 2.0 or OpenID Connect 2.0 <br>- Non-Microsoft IdP using SAML 2.0       |
|**Browser support** | Session controls are available for browser-based sessions on the latest versions of the following browsers: <br><br>- Microsoft Edge<br>- Google Chrome<br>- Mozilla Firefox<br>- Apple Safari <br><br>In-browser protection for Microsoft Edge also has specific requirements, including the user signed in with their work profile. For more information, see [In-browser protection requirements](in-browser-protection.md#in-browser-protection-requirements). |
|**Downtime**     |   Defender for Cloud Apps allows you to define the default behavior to apply if there's a service disruption, such as a component not functioning correctly. <br><br>For example, when the normal policy controls can't be enforced, you might choose to harden (block) or bypass (allow) users from taking actions on potentially sensitive content. <br><br>To configure the default behavior during system downtime, in Microsoft Defender XDR, go to **Settings** > **Conditional Access App Control** > **Default behavior** > **Allow** or **Block** access.      |

### In-browser protection requirements

If you're using [in-browser protection with Microsoft Edge](in-browser-protection.md) and are still being served by a reverse proxy, make sure you meet the following additional requirements:

- **The feature is turned on in your Defender XDR settings**. For more information, see [Configure in-browser protection settings](in-browser-protection.md#configure-in-browser-protection-settings).

- **All policies that the user is covered by are supported for Microsoft Edge for Business**. If a user is served by another policy that's *not* supported by Microsoft Edge for Business, they're always served by the reverse proxy. For more information, see [In-browser protection requirements](in-browser-protection.md#in-browser-protection-requirements).

- **You're using a supported platform**, including a supported operating system, identity platform, and Edge version. For more information, see [In-browser protection requirements](in-browser-protection.md#in-browser-protection-requirements).

## Reference of troubleshooting issues for admins

Use the following table to find the issue you're trying to troubleshoot:

|Issue type  |Issues  |
|---------|---------|
|[Network condition issues](#network-condition-issues)     |  [Network errors when navigating to a browser page](#network-errors-when-navigating-to-a-browser-page) <br><br>[Slow sign-ins](#slow-sign-ins) <br><br> [More considerations for network conditions](#more-considerations-for-network-conditions)       |
|[Device identification issues](#device-identification-issues)    | [Misidentified Intune Compliant or Microsoft Entra hybrid joined devices](#misidentified-intune-compliant-or-hybrid-azure-ad-joined-devices) <br><br>[Client certificates aren't prompting when expected](#client-certificates-arent-prompting-when-expected)  <br><br> [Client certificates aren't prompting when expected](#client-certificates-arent-prompting-when-expected) <br> [Client certificates are prompting at every sign-in](#client-certificates-are-prompting-at-every-sign-in) <br><br>[More considerations for device identification](#more-considerations-for-device-identification)      |
|[Issues when onboarding an app](#issues-when-onboarding-an-app)     |  [App doesn't appear on the conditional access app control apps page](#app-doesnt-appear-on-the-conditional-access-app-control-apps-page) <br><br> [App status: Continue Setup](#app-status-continue-setup)   [Can't configure controls for native apps](#cant-configure-controls-for-built-in-apps) <br><br> [Request session control option appears](#request-session-control-option-appears)    |
|[Issues when creating access and session policies](#issues-when-creating-access-and-session-policies)     | [In Conditional Access policies, you can't see the conditional access app control option](#in-conditional-access-policies-you-cant-see-the-conditional-access-app-control-option) <br><br> [Error message when creating a policy: You don't have any apps deployed with conditional access app control](#error-message-when-creating-a-policy-you-dont-have-any-apps-deployed-with-conditional-access-app-control) <br><br> [Can't create session policies for an app](#cant-create-session-policies-for-an-app) <br><br>[Can't choose Inspection Method: Data Classification Service](#cant-choose-inspection-method-data-classification-service) <br><br> [Can't choose Action: Protect](#cant-choose-action-protect) <br><br> [More considerations for onboarding apps](#more-considerations-for-onboarding-apps)        |
| [Diagnose and troubleshoot with the Admin View toolbar](#diagnose-and-troubleshoot-with-the-admin-view-toolbar) | [Bypass proxy session](#bypass-proxy-session) <br><br> [Record a session](#record-a-session)  <br><br> [Add domains for your app](#add-domains-for-your-app)|

## Network condition issues

Common network condition issues you might encounter include:

- [Network errors when navigating to a browser page](#network-errors-when-navigating-to-a-browser-page)
- [Slow sign-in](#slow-sign-ins)
- [Extra considerations](#network-conditions-additional-considerations)

### Network errors when navigating to a browser page

When you're first setting up Defender for Cloud Apps access and session controls for an app, common network errors that might arise include: *This site isn't secure* and *There's no internet connection*. These messages can indicate a general network configuration error.

**Recommended steps**

1. Configure your firewall to work with Defender for Cloud Apps using the Azure IP addresses and DNS names relevant to your environment.
    1. Add **outbound port 443** for the following IP addresses and DNS names for your [Defender for Cloud Apps data center](network-requirements.md#access-and-session-controls).
    1. Restart your device and your browser session
    1. Verify that the sign-in is working as expected

1. Enable TLS 1.2 in your browser's internet options. For example:

    | Browser | Steps |
    |---|---|
    | **Microsoft Internet Explorer** | 1. Open Internet Explorer<br />2. Select **Tools** > **Internet Options** > **Advance** tab<br />3. Under **Security**, select **TLS 1.2**<br />4. Select **Apply**, and then select **OK**<br />5. Restart your browser and verify that you can access the app |
    | **Microsoft Edge / Edge Chromium** | 1. Open search from the taskbar and search for "Internet Options"<br />2. Select **Internet Options**<br />3. Under **Security**, select **TLS 1.2**<br />4. Select **Apply**, and then select **OK**<br />5. Restart your browser and verify that you can access the app |
    | **Google Chrome** | 1. Open Google Chrome<br />2. At the top-right, select **More** (3 vertical dots) > **Settings**<br />3. At the bottom, select **Advanced**<br />4. Under **System**, select **Open proxy settings**<br />5. On the **Advanced** tab, under **Security**, select **TLS 1.2**<br />6. Select **OK**<br />7. Restart your browser and verify that you're able to access the app |
    | **Mozilla Firefox** | 1. Open Mozilla Firefox<br />2. In the address bar and search for "about:config"<br />3. In the Search box, search for "TLS"<br />4. Double-click the entry for **security.tls.version.min**<br />5. Set the integer value to 3 to force TLS 1.2 as the minimum required version<br />6. Select **Save** (check mark to the right of the value box)<br />7. Restart your browser and verify that you're able to access the app |
    | **Safari** | If you're using Safari version 7 or greater, TLS 1.2 is automatically enabled |

Defender for Cloud Apps uses Transport Layer Security (TLS) protocols 1.2+ to provide best-in-class encryption:

- Native client apps and browsers that don't support TLS 1.2+ aren't accessible when configured with session control.
- SaaS apps that use TLS 1.1 or lower appear in the browser as using TLS 1.2+ when configured with Defender for Cloud Apps.

> [!TIP]
> While session controls are built to work with any browser on any major platform on any operating system, we support the latest versions of Microsoft Edge, Google Chrome, Mozilla Firefox, or Apple Safari. You might want to block or allow access specifically to mobile or desktop apps.
>


### Slow sign-ins

Proxy chaining and nonce-handling are some of the common issues that could result in slow sign-in performance.

**Recommended steps**

Configure your environment to remove any factors that might be causing slowness during sign-in. For example, you might have firewalls or forward proxy chaining configured, which connects two or more proxy servers to navigate to the intended page. You might also have other external factors affecting the slowness.

1. Identify whether proxy chaining is occurring in your environment.
1. Remove any forward proxies where possible.

Some apps use a nonce hash during authentication to prevent replay attacks. By default, Defender for Cloud Apps assumes that an app uses a nonce. If the app you're working with doesn't use nonce, disable nonce-handling for this app in Defender for Cloud Apps:

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps**. 
1. Under **Connected apps**, select **Conditional Access App Control apps**.
1. In the list of apps, on the row in which the app you're configuring appears, select the three dots at the end of the row, and then select **Edit** for your app.
1. Select **Nonce-handling** to expand the section and then clear **Enable nonce handling**.
1. Sign out of the app and close out all browser sessions.
1. Restart your browser and sign-in to the app again. Verify that the sign-in is working as expected.

<a name="network-conditions-additional-considerations"></a>

### More considerations for network conditions

While troubleshooting network conditions, also consider the following notes about the Defender for Cloud Apps proxy:

- **Verify whether your session is being routed to another data center**: Defender for Cloud Apps uses Azure Data Centers around the world to optimize performance through geolocation. 

    This means that a user's session might be hosted outside of a region, depending on traffic patterns and their location. However, to protect your privacy, no session data is stored in these data centers.

- **Proxy performance**: Deriving a performance baseline depends on many factors outside of the Defender for Cloud Apps proxy, such as:

  - What other proxies or gateways sit in series with this proxy
  - Where the user is coming from
  - Where the targeted resource resides
  - Specific requests on the page

  In general, any proxy adds latency. The advantages of the Defender for Cloud Apps proxy are:

  - Using the global availability of Azure domain controllers to geolocate users to the nearest node and reduce their round-trip distance. Azure domain controllers can geolocate on a scale that few services around the world have.

  - Using the integration with Microsoft Entra Conditional Access to only route the sessions you want to proxy to our service, instead of all users in all situations.

## Device identification issues

Defender for Cloud Apps provides the following options for identifying a device's management state.

- Microsoft Intune compliance
- Hybrid Microsoft Entra Domain joined
- Client certificates

For more information, see [Identity-managed devices with Conditional Access app control](conditional-access-app-control-identity.md).

Common device identification issues you might encounter include:

- [Misidentified Intune Compliant or Microsoft Entra hybrid joined devices](#misidentified-intune-compliant-or-hybrid-azure-ad-joined-devices)
- [Client certificates aren't prompting when expected](#client-certificates-arent-prompting-when-expected)
- [Client certificates are prompting at every sign-in](#client-certificates-are-prompting-at-every-sign-in)
- [Extra considerations](#device-identification-additional-considerations)

<a name='misidentified-intune-compliant-or-hybrid-azure-ad-joined-devices'></a>

### Misidentified Intune Compliant or Microsoft Entra hybrid joined devices

Microsoft Entra Conditional Access enables Intune-compliant and Microsoft Entra hybrid joined device information to be passed directly to Defender for Cloud Apps. In Defender for Cloud Apps, use the device state as a filter for access or session policies. 

For more information, see [Introduction to device management in Microsoft Entra ID](/azure/active-directory/devices/overview).

**Recommended steps**

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps**.
1. Under **Conditional Access App Control**, select **Device identification**. This page shows the device identification options available in Defender for Cloud Apps.
1. For **Intune compliant device identification** and **Microsoft Entra hybrid joined identification** respectively, select **View configuration** and verify that the services are set up. Services are automatically synced from Microsoft Entra ID and Intune respectively.

1. Create an access or session policy with the **Device Tag** filter equal to **Hybrid Azure AD joined**, **Intune compliant**, or both.
1. In a browser, sign in to a device that is Microsoft Entra hybrid joined or Intune compliant based on your policy filter.
1. Verify that activities from these devices are populating the log. In Defender for Cloud Apps, on the **Activity log** page, [filter](activity-filters.md) on **Device Tag** equal to **Hybrid Azure AD joined**, **Intune compliant**, or both based on your policy filters.
1. If activities aren't populating in the Defender for Cloud Apps activity log, go to Microsoft Entra ID and do the following steps:
    1. Under **Monitoring** > **Sign-ins**, verify that there are sign-in activities in logs.
    1. Select the relevant log entry for the device you logged into.
    1. In the **Details** pane, on the **Device info** tab, verify that the device is **Managed** (Hybrid Azure AD joined) or **Compliant** (Intune compliant). 

        If you can't verify either state, try another log entry or ensure that your device data is configured correctly in Microsoft Entra ID.
    1. For Conditional Access, some browsers may require extra configuration such as installing an extension. For more information, see [Conditional Access browser support](/azure/active-directory/conditional-access/concept-conditional-access-conditions#supported-browsers).
    1. If you still don't see the device information in the **Sign-ins** page, open a support ticket for Microsoft Entra ID.


### Client certificates aren't prompting when expected

The device identification mechanism can request authentication from relevant devices using client certificates. You can upload an X.509 root or intermediate certificate authority (CA) certificate, formatted in the PEM certificate format.

Certificates must contain the CA's public key, which is then used to sign the client certificates presented during a session. For more information, see [Check for device management without Microsoft Entra](conditional-access-app-control-identity.md#check-for-device-management-without-microsoft-entra).

**Recommended steps**

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps**.

1. Under **Conditional Access App Control**, select **Device identification**. This page shows the device identification options available with Defender for Cloud Apps.

1. Verify that you uploaded an X.509 root or intermediate CA certificate. You must upload the CA certificate that's used to sign for your certificate authority.

1. Create an access or session policy with the **Device Tag** filter equal to **Valid client certificate**.

1. Make sure that your client certificate is:
    - Deployed using the PKCS #12 file format, typically a *.p12* or *.pfx* file extension
    - Installed in the user store, not the device store, of the device you're using for testing

1. Restart your browser session.

1. When logging in to the protected app:
    - Verify that you're redirected to the following URL syntax: `<https://*.managed.access-control.cas.ms/aad_login>`
    - If you're using iOS, make sure you're using the Safari browser.
    - If you're using Firefox, you must also [add the certificate to Firefox's own certificate store](https://www.jscape.com/blog/firefox-client-certificate). All other browsers use the same default certificate store.

1. Validate that the client certificate is prompted in your browser.

    If it doesn't appear, try a different browser. Most major browsers support performing a client certificate check. However, mobile and desktop apps often use built-in browsers that might not support this check and therefore affect authentication for these apps.

1. Verify that activities from these devices are populating the log. In Defender for Cloud Apps, on the **Activity log** page, add a [filter](activity-filters.md) on **Device Tag** equal to **Valid client certificate**.

1. If you still don't see the prompt, open a [support ticket](support-and-ts.md) and include the following information:

    - The details of the browser or native app where you experienced the problem
    - The operating system version, such as iOS/Android/Windows 10
    - Mention if the prompt is working on Microsoft Edge Chromium

### Client certificates are prompting at every sign-in

If you're experiencing the client certificate popping up after opening a new tab, this might be due to settings hidden within **Internet Options**. Verify your settings in your browser. For example:

**In Microsoft Internet Explorer**:

1. Open Internet Explorer and select **Tools** > **Internet Options** > **Advanced** tab.
1. Under **Security**, select **Don't prompt for Client Certificate selection when only one certificate exists** > Select **Apply** > **OK**. 
1. Restart your browser and verify that you can access the app without the extra prompts.

**In Microsoft Edge / Edge Chromium**:

1. Open search from the taskbar and search for *Internet Options*.
1. Select **Internet Options** > **Security** > **Local intranet** > **Custom level**.
1. Under **Miscellaneous** > **Don't prompt for Client Certificate selection when only one certificate exists**, select **Disable**.
1. Select **OK** > **Apply** > **OK**.
1. Restart your browser and verify that you can access the app without the extra prompts.

<a name="device-identification-additional-considerations"></a>

### More considerations for device identification

While troubleshooting device identification, you can require certificate revocation for Client Certificates.

Certificates that are revoked by the CA are no longer trusted. Selecting this option requires all certificates to pass the CRL protocol. If your client certificate doesn't contain a CRL endpoint, you can't connect from the managed device.

## Issues when onboarding an app

Microsoft Entra ID apps are automatically onboarded to Defender for Cloud Apps for Conditional Access and session controls. You must manually onboard non-Microsoft IdP apps, including both catalog and custom apps.

For more information, see:

- [Deploy Conditional Access app control for catalog apps with non-Microsoft IdPs](proxy-deployment-featured-idp.md)
- [Deploy Conditional Access app control for custom apps with non-Microsoft IdPs](proxy-deployment-any-app-idp.md)

Common scenarios you might encounter while onboarding an app include:

- [App doesn't appear on the **Conditional Access App Control apps** page](#app-doesnt-appear-on-the-conditional-access-app-control-apps-page)
- [App status: Continue Setup](#app-status-continue-setup)
- [Can't configure controls for built-in apps](#cant-configure-controls-for-built-in-apps)
- [**Request session control** option appears](#request-session-control-option-appears)

### App doesn't appear on the conditional access app control apps page

When onboarding an non-Microsoft IdP app to conditional access app control, the final deployment step is to have the end user navigate to the app. Do the steps in this section if the app isn't appearing on the **Settings > Cloud apps > Connected apps > Conditional Access App Control apps** page expected.

**Recommended steps**

1. Make sure your app meets the following Conditional Access app control prerequisites:

    - Make sure you have a valid Defender for Cloud Apps license.
    - Create a duplicate app.
    - Make sure that the app uses the SAML protocol.
    - Validate that you have fully onboarded the app and the status of the app is **Connected**.

1. Make sure to navigate to the app in a new browser session by using a new incognito mode or by signing in again.

> [!NOTE]
> Entra ID apps only appear on the **Conditional Access App Control apps** page after they're configured in at least one policy, or if you have a policy without any app specification and a user has signed into the app.
>

### App status: Continue Setup

An app's status can vary, and can include **Continue Setup**, **Connected**, or **No Activities**.

For apps connected via non-Microsoft identity providers (IdP), if the setup isn't complete, when accessing the app you see a page with the status of **Continue Setup**. Use the following steps to complete the setup.

**Recommended steps**

1. Select **Continue Setup**.

1. Review the following articles and verify that you've completed all the steps required:

    - [Deploy Conditional Access app control for catalog apps with non-Microsoft IdPs](proxy-deployment-featured-idp.md)
    - [Deploy Conditional Access app control for custom apps with non-Microsoft IdPs](proxy-deployment-any-app-idp.md)

    Pay special attention to the following steps:

    1. Make sure you create a new custom SAML app. You need this app to change the URLs and SAML attributes that might not be available in gallery apps.
    1. If your identity provider doesn't allow the reuse of the same identifier, also known as *Entity ID* or *Audience*, change the identifier of the original app.

### Can't configure controls for built-in apps

Built-in apps can be detected heuristically and you can use access policies to monitor or block them. Use the following steps to configure controls for native apps.

**Recommended steps**

1. In an [access policy](access-policy-aad.md), add a **Client app** filter, and set it equal to **Mobile and desktop**.

1. Under **Actions**, select **Block**.

1. Optionally, customize the blocking message that your users get when they're unable to download files. For example, customize this message to *You must use a web browser to access this app*.

1. Test and validate that the control is working as expected.

### *App isn't recognized* page appears

Defender for Cloud Apps can recognize over 31,000 apps through the cloud app catalog.

If you're using a custom app that is configured through Microsoft Entra SSO, and isn't one of the supported apps, you come across an **App is not recognized** page. To resolve the issue, you must configure the app with Conditional Access app control.

**Recommended steps**

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps**. Under **Connected apps**, select **Conditional Access App Control apps**.

1. In the banner, select **View new apps**.

1. In the list of new apps, locate the app that you're onboarding, select the **+** sign, and then select **Add**.

    1. Select whether the app is a **custom** or **standard** app.
    1. Continue through the wizard, make sure that specified **User-defined domains** are correct for the app you're configuring.

1. Verify that the app appears in the **Conditional Access App Control apps** page.

### Request session control option appears

After onboarding a non-Microsoft IdP app, you may see the **Request session control** option. This occurs because only catalog apps have out-of-the-box session controls. For any other app, you must go through a self-onboarding process.

Follow the instructions at [Deploy Conditional Access app control for custom apps with non-Microsoft IdPs](proxy-deployment-any-app-idp.md).

**Recommended steps**

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps**.

1. Under **Conditional Access App Control**, select **App onboarding/maintenance**.

1. Enter the principal name or email for the user who will be onboarding the app, and then select **Save**.

1. Go to the app that you're deploying. The page you see depends on whether the app is recognized. Do one of the following, depending on the page you see:

    - **Not recognized**. You see an *App not recognized* page that prompts you to configure your app. Do the following steps:

        1. Onboard the app for Conditional Access app control.
        1. Add the domains for the app.
        1. Install the app's certificates.

    - **Recognized**. If your app is recognized, you see an onboarding page prompting you to continue the app configuration process.

        Make sure the app is configured with all domains required for the app to function correctly, and then return to the app page.

### More considerations for onboarding apps

While troubleshooting for onboarding apps, there are some extra things to consider.

- **Understand the difference between the Microsoft Entra Conditional Access policy settings: "Monitor only", "Block downloads", and "Use custom policy"**

    In Microsoft Entra Conditional Access policies, you can configure the following built-in Defender for Cloud Apps controls: **Monitor only** and **Block downloads**. These settings apply and enforce the Defender for Cloud Apps proxy feature for cloud apps and conditions configured in Microsoft Entra ID. 

    For more complex policies, select **Use custom policy**, which allows you to configure access and session policies in Defender for Cloud Apps.

- **Understand the "Mobile and desktop" client app filter option in access policies**

    In Defender for Cloud Apps access policies, unless the **Client app** filter is set to **Mobile and desktop**, the resulting access policy applies to browser sessions. 

    The reason for this is to prevent inadvertently proxying user sessions, which might be a byproduct of using this filter.

## Issues when creating access and session policies

Defender for Cloud Apps provides the following configurable policies:

- [Access policies](access-policy-aad.md): Used to monitor or block access to browser, mobile, and/or desktop apps.
- [Session policies](session-policy-aad.md). Used to monitor, block, and perform specific actions to prevent data infiltration and exfiltration scenarios in the browser.

To use these policies in Defender for Cloud Apps, you must first configure a policy in Microsoft Entra Conditional Access to extend session controls:

1. In the Microsoft Entra policy, under **Access controls**, select **Session** > **Use Conditional Access App Control**.

1. Select a built-in policy (**Monitor only** or **Block downloads**) or **Use custom policy** to set an advanced policy in Defender for Cloud Apps.

1. Select **Select** to continue.

Common scenarios you might encounter while configuring these policies include:

- [In Conditional Access policies, you can't see the conditional access app control option](#in-conditional-access-policies-you-cant-see-the-conditional-access-app-control-option)
- [Error message when creating a policy: You don't have any apps deployed with conditional access app control](#error-message-when-creating-a-policy-you-dont-have-any-apps-deployed-with-conditional-access-app-control)
- [Can't create session policies for an app](#cant-create-session-policies-for-an-app)
- [Can't choose **Inspection Method**: **Data Classification Service**](#cant-choose-inspection-method-data-classification-service)
- [Can't choose **Action**: **Protect**](#cant-choose-action-protect)

### In Conditional Access policies, you can't see the conditional access app control option

To route sessions to Defender for Cloud Apps, Microsoft Entra Conditional Access policies must be configured to include conditional access app control session controls.

**Recommended steps**

If you don't see the **Conditional Access App Control** option in your Conditional Access policy, make sure that you have a valid license for Microsoft Entra ID P1 and a valid Defender for Cloud Apps license.

### Error message when creating a policy: You don't have any apps deployed with conditional access app control

When creating an access or session policy, you might see the following error message: *You don't have any apps deployed with conditional access app control*. This error indicates that the app is a non-Microsoft IdP app that hasn't been onboarded for Conditional Access app control.

**Recommended steps**

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps**. Under **Connected apps**, select **Conditional Access App Control apps**.

1. If you see the message **No apps connected**, use the following guides to deploy apps:

    - [Onboard non-Microsoft IdP catalog apps for Conditional Access app control](proxy-deployment-featured-idp.md)
    - [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md)

If you run into any issues while deploying the app, see [Issues when onboarding an app](#issues-when-onboarding-an-app).

### Can't create session policies for an app

After onboarding a non-Microsoft IdP app for Conditional Access app control, in the **Conditional Access App Control apps** page, you may see the option: **Request session control**.

> [!NOTE]
> [Catalog apps](proxy-deployment-featured-idp.md) have out-of-the-box session controls. For any other non-Microsoft IdP apps, you must go through a self-onboarding process.
**Recommended steps**

1. Deploy your app to session control. For more information, see [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md).

1. Create a session policy and select the **App** filter.

1. Make sure that your app is now listed in the dropdown list.

### Can't choose Inspection Method: Data Classification Service

In session policies, when using the **Control file download (with inspection)** session control type, you can use the **Data Classification Service** inspection method to scan your files in real time and detect sensitive content that matches any of the criteria you have configured. 

If the **Data Classification Service** inspection method isn't available, use the following steps to investigate the issue.

**Recommended steps**

1. Verify that the **Session control type** is set to **Control file download (with inspection)**.

   > [!NOTE]
   > The **Data Classification Service** inspection method is only available for the **Control file download (with inspection)** option.

1. Determine whether the **Data Classification Service** feature is available in your [region](dcs-inspection.md):

    - If the feature isn't available in your region, use the **Built-in DLP** inspection method.
    - If the feature is available in your region but you still can't see the **Data Classification Service** inspection method, open a [support ticket](support-and-ts.md).

### Can't choose Action: Protect

In session policies, when using the **Control file download (with inspection)** session control type, in addition to the **Monitor** and **Block** actions, you can specify the **Protect** action. This action enables you to permit file downloads with the option to encrypt or apply permissions to the file based on conditions, content inspection, or both. 

If the **Protect** action isn't available, use the following steps to investigate the issue.

**Recommended steps**

1. If the **Protect** action isn't available or is greyed out, verify that you have a Microsoft Purview license. For more information, see [Microsoft Purview Information Protection integration](azip-integration.md).

1. If the **Protect** action is available, but aren't seeing the appropriate labels.

    1. In Defender for Cloud Apps, in the menu bar, select the settings icon > **Microsoft Information Protection**, and verify that the integration is enabled.

    1. For Office labels, in the Microsoft Purview portal, make sure **Unified Labeling** is selected.

## Diagnose and troubleshoot with the Admin View toolbar

The **Admin View** toolbar sits at the bottom of your screen and provides tools for admin users to diagnose and troubleshoot issues with conditional access app control.

To view the **Admin View** toolbar, you must make sure to add specific admin user accounts to the **App onboarding / maintenance** list in the Microsoft Defender XDR settings. 

**To add a user to the App onboarding / maintenance list**:

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps**.

1. Scroll down, and under **Conditional Access App Control**, select **App onboarding/maintenance**.

1. Enter the principal name or email address for the admin user you want to add.

1. Select the **Enable these users to bypass Conditional Access App Control from inside a proxied session** option, and then select **Save**.

    For example:

    :::image type="content" source="media/app-onboarding-maintenance.png" alt-text="Screenshot of the App onboarding / maintenance settings." lightbox="media/app-onboarding-maintenance.png":::

The next time that one of the listed users starts a new session in a supported app where they're an admin, the **Admin View** toolbar is shown at the bottom of the browser. 

For example, the following image shows the **Admin View** toolbar showing at the bottom of a browser window, when using OneNote in the browser:

:::image type="content" source="media/troubleshooting-proxy/admin-view.png" alt-text="Screenshot of the Admin View toolbar." lightbox="media/troubleshooting-proxy/admin-view.png":::

The following sections describe how to use the **Admin View** toolbar to test and troubleshoot.

### Test mode

As an admin user, you might want to test upcoming proxy bug fixes before the latest release is fully rolled out to all tenants. Provide your feedback about the bug fix to the Microsoft support team to help speed up release cycles.

When in test mode, only the admin users are exposed to any changes provided in the bug fixes. There is no effect on other users.

- To turn on test mode, in the **Admin View** toolbar, select **Test Mode**.
- When you've finished your testing, select **End Test Mode** to return to the regular functionality.

### Bypass proxy session

If you're using a non-Edge browser and have difficulty accessing or loading your application, you may want to verify whether the issue is with the Conditional Access proxy by running the application without the proxy.

To bypass the proxy, in the **Admin View** toolbar, select **Bypass experience**. Confirm that the session is bypassed by noting that the URL isn't suffixed.

The Conditional Access proxy is used again in your next session.

For more information, see [Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md) and [In-browser protection with Microsoft Edge for Business (Preview)](in-browser-protection.md).

### Second sign-in (also known as 'second login')

Some applications have more than one deep link to sign in. Unless you define the sign-in links in the app settings, users might be redirected to an unrecognized page when they sign in, blocking their access.

The integration between IdPs such as Microsoft Entra ID is based on intercepting an app sign-in and redirecting it. This means that browser sign-ins can't be controlled directly without triggering a second sign-in. To trigger a second sign-in, we need to employ a second sign-in URL specifically for that purpose.

If the app uses a nonce, the second sign-in might be transparent to users, or they are prompted to sign-in again.

If it isn't transparent to the end user, add the second sign-in URL to the app settings:

Go to **Settings > Cloud apps > Connected apps > Conditional Access App Control Apps**

Select the relevant app and then select the three dots.

Select **Edit app\Advanced login configuration**.

Add the second sign-in URL as mentioned in the error page.

If you're confident the app doesn't use a nonce, you can disable this by editing the apps settings as described in [Slow sign-ins](/defender-cloud-apps/troubleshooting-proxy).

### Record a session

You may want to help the root cause analysis of a problem by sending a session recording to Microsoft support engineers. Use the **Admin View** toolbar to record your session.

> [!NOTE]
> All personal data is removed from the recordings.

**To record a session**:

1. In the **Admin View** toolbar, select **Record session**. When prompted, select **Continue** to accept the terms. For example:

    :::image type="content" source="media/accept-continue.png" alt-text="Screenshot of the session recording privacy statement dialog." lightbox="media/accept-continue.png":::
    
1. Sign into your app if needed to begin simulating the session.

1. When you finish recording the scenario, make sure to select **Stop recording** in the **Admin View** toolbar.

**To view your recorded sessions**: 

After you've finished recording, view the recorded sessions by selecting **Session recordings** from the **Admin View** toolbar. A list of recorded sessions from the previous 48 hours appear. For example:

:::image type="content" source="media/troubleshooting-proxy/recording-list.png" alt-text="Screenshot of session recordings." lightbox="media/troubleshooting-proxy/recording-list.png":::

To manage your recordings, select a file and then select **Delete** or **Download** as needed. For example:

:::image type="content" source="media/download-delete-recording.png" alt-text="Screenshot of downloading or deleting a recording." lightbox="media/download-delete-recording.png":::

### Add domains for your app

Associating the correct domains to an app allows Defender for Cloud Apps to enforce policies and audit activities.

For example, if you've configured a policy that blocks downloading files for an associated domain, file downloads by the app from that domain will be blocked. However, file downloads by the app from domains not associated with the app won't be blocked and the action won't be audited in the activity log.

If an admin browses in a proxied app to an unrecognized domain, that Defender for Cloud Apps doesn't consider to a part of the same app or any other app, the **Unrecognized domain** message appears, prompting the admin to add the domain so that it's protected next time. In such cases, if the admin doesn't want to add the domain, no action is needed.

> [!NOTE]
> Defender for Cloud Apps still adds a suffix to domains not associated with the app to ensure a seamless user experience.

**To add domains for your app**:

1. Open your app in a browser, with the Defender for Cloud Apps **Admin View toolbar** visible on your screen. 

1. In the **Admin View toolbar**, select **Discovered domains**. 

1. In the **Discovered domains** pane, make a note of the domain names listed, or export the list as a .csv file.

    The **Discovered domains** pane shows a list of all domains that are not associated with the app. The domain names are fully qualified.

1. In Microsoft Defender XDR, select **Settings** > **Cloud Apps** > **Connected apps** > **Conditional Access App Control apps**.

1. Locate your app in the table. Select the options menu on the right and then select **Edit app**.

1. In the **User-defined domains** field, enter the domains you want to associate with this app. 

    - To view the list of domains already configured in the app, select the **View app domains** link.

    - When adding domains, consider whether you want to add specific domains, or use an asterisk (*****as a wildcard to use multiple domains at once.

        For example, `sub1.contoso.com`,`sub2.contoso.com` are examples of specific domains. To add both of these domains at once, as well as other sibling domains, use `*.contoso.com`.

For more information, see [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md).

## Related content

- [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md)
- [Troubleshooting access and session controls for end-users](troubleshooting-proxy-end-users.md)
- [Troubleshooting - What is `*.mcas.ms`, `*.mcas-gov.us`, or `*.mcas-gov.ms`?](troubleshooting-proxy-url.md)
