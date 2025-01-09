---
title: Troubleshooting access and session controls for end-users | Microsoft Defender for Cloud Apps
description: This article describes how to troubleshoot common access and session control issues experienced by end-users with Microsoft Defender for Cloud Apps.
ms.date: 05/15/2024
ms.topic: troubleshooting
---

# Troubleshooting access and session controls for end-users

This article provides Microsoft Defender for Cloud Apps admins with guidance on how to investigate and resolve common access and session control issues as experienced by end-users.


## Check minimum requirements

Before you start troubleshooting, make sure your environment meets the following minimum general requirements for access and session controls.

|Requirement  |Description  |
|---------|---------|
|**Licensing**     |   Make sure you have a valid [license](https://aka.ms/M365EnterprisePlans) for Microsoft Defender for Cloud Apps.      |
|**Single Sign-On (SSO)**     |  Apps must be configured with one of the supported single sign-on (SSO) solutions: <br><br>  - Microsoft Entra ID using SAML 2.0 or OpenID Connect 2.0 <br>- Non-Microsoft IdP using SAML 2.0       |
|**Browser support**     |  Session controls are available for browser-based sessions on the latest versions of the following browsers: <br><br>- Microsoft Edge<br>- Google Chrome<br>- Mozilla Firefox<br>- Apple Safari  <br><br>In-browser protection for Microsoft Edge also has specific requirements, including the user signed in with their work profile. For more information, see [In-browser protection requirements](in-browser-protection.md#in-browser-protection-requirements).    |
|**Downtime**     |   Defender for Cloud Apps allows you to define the default behavior to apply if there's a service disruption, such as a component not functioning correctly. <br><br>For example, you might choose to harden (block) or bypass (allow) users from taking actions on potentially sensitive content when the normal policy controls can't be enforced. <br><br>To configure the default behavior during system downtime, in Microsoft Defender XDR, go to **Settings** > **Conditional Access App Control** > **Default behavior** > **Allow** or **Block** access.      |

## User monitoring page isn't appearing

When routing a user through the Defender for Cloud Apps, you can notify the user that their session is monitored. By default, the user monitoring page is enabled.

This section describes the troubleshooting steps we recommend you taking if the user monitoring page is enabled but doesn't appear as expected.

**Recommended steps**

1. In the Microsoft Defender Portal, select **Settings** > **Cloud Apps**.
1. Under **conditional access app control**, select **User monitoring**. This page shows the user monitoring options available in Defender for Cloud Apps. For example:

    ![Screenshot of the user monitoring options.](media/proxy-user-monitoring.png)
   
1. Verify that the **Notify users that their activity is being monitored** option is selected.

1. Select whether you want to use the default message or provide a custom message:

    | Message type | Details |
    | --- | --- |
    | **Default** | **Header**:<br />Access to [App Name Will Appear Here] is monitored<br />**Body**:<br />For improved security, your organization allows access to [App Name Will Appear Here] in monitor mode. Access is only available from a web browser. |
    | **Custom** | **Header**:<br />Use this box to provide a custom heading to inform users they're being monitored.<br />**Body**:<br />Use this box to add other custom information for the user, such as who to contact with questions, and supports the following inputs: plain text, rich text, hyperlinks. |

1. Select **Preview** to verify the user monitoring page that appears before accessing an app.

1. Select **Save**.

## Not able to access app from a non-Microsoft Identity Provider

If an end user receives a general failure after signing into an app from a non-Microsoft Identity Provider, validate the non-Microsoft IdP configuration.

**Recommended steps**

1. In the Microsoft Defender Portal, select **Settings** > **Cloud Apps**. 

1. Under **Connected apps**, select **Conditional Access App Control apps**.

1. In the list of apps, on the row in which the app you can't access appears, select the three dots at the end of the row, and then select **Edit app**.

1. Validate that the SAML certificate that was uploaded is correct.

    1. Verify that valid SSO URLs are provided in the app configuration.

    1. Validate that the attributes and values in the custom app are reflected in identity provider settings. 
    
    For example:
 
    ![Screenshot of the SAML information page.](media/proxy-deploy-add-idp-ext-conf.png).
   
1. If you still can't access the app, open a [support ticket](support-and-ts.md).

## Something Went Wrong page appears

Sometimes during a proxied session, the **Something Went Wrong** page might appear. This can happen when:

- A user logs in after being idle for a while
- Refreshing the browser and the page load takes longer than expected
- The non-Microsoft IdP app isn't configured correctly

**Recommended steps**

1. If the end user is trying to access an app that is configured using a non-Microsoft IdP, see [Not able to access app from a non-Microsoft IdP](#not-able-to-access-app-from-a-non-microsoft-identity-provider) and [App status: Continue Setup](troubleshooting-proxy.md#app-status-continue-setup).

1. If the end user unexpectedly reached this page, do the following:
    1. Restart your browser session.
    1. Clear history, cookies, and cache from the browser.

## Clipboard actions or file controls aren't being blocked

The ability to block clipboard actions such as cut, copy, paste, and file controls such as download, upload, and print is required to prevent data exfiltration and infiltration scenarios. 

This ability enables companies to balance security and productivity for end users. If you're experiencing problems with these features, use the following steps to investigate the issue.

**Recommended steps**

If the session is being proxied, use the following steps to verify the policy:

1. In the Microsoft Defender Portal, under **Cloud Apps**, select **Activity log**.

1. Use the advanced filter, select **Applied action** and set its value equal to **Blocked**.

1. Verify that there are blocked file activities:

    1. If there's an activity, expand the activity drawer by clicking on the activity.

    1. On the activity drawer's **General** tab, select the matched policies link, to verify the policy you enforced is present.

    1. If you don't see your policy, see [Issues when creating access and session policies](troubleshooting-proxy.md#issues-when-creating-access-and-session-policies).

    1. If you see **Access blocked/allowed due to Default Behavior**, this indicates that the system was down, and the default behavior was applied.

        1. To change the default behavior, in the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Then under **Conditional Access App Control**, select **Default Behavior**, and set the default behavior to **Allow** or **Block** access.

        1. Go to the [Microsoft 365 admin portal](https://admin.microsoft.com/AdminPortal/Home?#/servicehealth) and monitor notifications about system downtime.

1. If you still not able to see blocked activity, open a [support ticket](support-and-ts.md).

## Downloads aren't being protected

As an end user, downloading sensitive data on an unmanaged device might be necessary. In these scenarios, you can protect documents with Microsoft Purview Information Protection. 

If the end user can't successfully encrypt the document, use the following steps to investigate the issue.

**Recommended steps**

1. In the Microsoft Defender Portal, under **Cloud Apps**, select **Activity log**.

1. Use the advanced filter, select **Applied action** and set its value equal to **Protected**.

1. Verify that there are blocked file activities:

    1. If there's an activity, expand the activity drawer by clicking on the activity

    1. On the activity drawer's **General** tab, select the matched policies link, to verify the policy you enforced is present.

    1. If you don't see your policy, see [Issues when creating access and session policies](troubleshooting-proxy.md#issues-when-creating-access-and-session-policies).

    1. If you see **Access blocked/allowed due to Default Behavior**, this indicates that the system was down, and the default behavior was applied.

        1. To change the default behavior, in the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Then under **Conditional Access App Control**, select **Default Behavior**, and set the default behavior to **Allow** or **Block** access.
 
       1. Go to the [Microsoft 365 Service Health Dashboard](/microsoft-365/admin/manage/health-dashboard-overview) and monitor notifications about system downtime.

    1. If you're protecting the file with a sensitivity label or custom permissions, in the **Activity description**, make sure the file extension is one of the following supported file types:

        - **Word**: docm, docx, dotm, dotx

        - **Excel**: xlam, xlsm, xlsx, xltx

        - **PowerPoint**: potm, potx, ppsx, ppsm, pptm, pptx

        - **PDF** if Unified Labeling is enabled

    If the file type isn't supported, in the session policy, you can select **Block download of any file that in unsupported by native protection or where native protection is unsuccessful**.

1. If you still not able to see blocked activity, open a [support ticket](support-and-ts.md).

## Navigating to a particular URL of a suffixed app and landing on a generic page

In some scenarios, navigating to a link might result in the user landing on the app's home page rather than the full path of the link.

> [!TIP]
> Defender for Cloud Apps maintains a list of apps that are known to suffer from context loss. For more information, see [Context loss limitations](caac-known-issues.md#context-loss-limitations).
>

**Recommended steps**

If you're using a browser other than Microsoft Edge and a user lands on the app's home page instead of the full path of the link, resolve the issue by appending  `.mcas.ms` to the original URL.

For example, if the original URL is:

`https://www.github.com/organization/threads/threadnumber`, change it to
`https://www.github.com.mcas.ms/organization/threads/threadnumber`

Microsoft Edge users benefit from in-browser protection, aren't redirected to a reverse proxy, and shouldn't need the `.mcas.ms` suffix added. For apps experiencing context loss, open a [support ticket](support-and-ts.md).

<a name="app-additional-considerations"></a>

## Blocking downloads cause PDF previews to be blocked

Occasionally, when you preview or print PDF files, apps initiate a download of the file. This causes Defender for Cloud Apps to intervene to ensure the download is blocked and that data isn't leaked from your environment. 

For example, if you created a session policy to block downloads for Outlook Web Access (OWA), then previewing or printing PDF files might be blocked, with a message like this:

![Screenshot of a Download blocked message.](media/before-powershell.png)

To allow the preview, an Exchange administrator should perform the following steps:

1. Download the [Exchange Online PowerShell Module](https://www.powershellgallery.com/packages/ExchangeOnlineManagement/2.0.4).

1. Connect to the module. For more information, see [Connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell#connect-to-exchange-online-powershell-using-mfa-and-modern-authentication).

1. After you connected to the Exchange Online PowerShell, use the [Set-OwaMailboxPolicy](/powershell/module/exchange/set-owamailboxpolicy) cmdlet to update the parameters in the policy:

    ```powershell
    Set-OwaMailboxPolicy -Identity OwaMailboxPolicy-Default -DirectFileAccessOnPrivateComputersEnabled $false -DirectFileAccessOnPublicComputersEnabled $false
    ```

    >[!NOTE]
    >The **OwaMailboxPolicy-Default** policy is the default OWA policy name in Exchange Online. Some customers may have deployed additional or created a custom OWA policy with a different name. If you have multiple OWA policies, they may be applied to specific users. Therefore, you'll need to also update them to have complete coverage.

1. After these parameters are set, run a test on OWA with a PDF file and a session policy configured to block downloads. The **Download** option should be removed from the dropdown and you can preview the file. For example:

    ![Screenshot of a PDF preview not blocked.](media/after-powershell.png)
   
## Similar site warning appears

Malicious actors can craft URLs that are similar to other sites' URLs in order to impersonate and trick users to believe they're browsing to another site. Some browsers try to detect this behavior and warn users before accessing the URL or block access.

In some rare cases, users under session control receive a message from the browser indicating suspicious site access. The reason for this is the browser treats the suffixed domain (for example:  `.mcas.ms`) as suspicious.

This message only appears for Chrome users, as Microsoft Edge users benefit from in-browser protection, without the reverse proxy architecture. For example:

:::image type="content" source="media/chrome-similar-site-warning.png" alt-text="Screenshot of a similar site warning in Chrome." lightbox="media/chrome-similar-site-warning.png" border="false":::

If you receive a message like this, contact Microsoft’s support to address it with the relevant browser vendor.

## More considerations for troubleshooting apps

When troubleshooting apps, there are some more things to consider:

- **Session controls support for modern browsers**
  Defender for Cloud Apps session controls now includes support for the new Microsoft Edge browser based on Chromium. While we continue supporting the most recent versions of Internet Explorer and the legacy version of Microsoft Edge, the support is limited and we recommend using the new Microsoft Edge browser.

- **Session controls protect limitation**
Co-Auth labeling under **"protect"** action isn't supported by Defender for Cloud Apps session controls. For more information, see [Enable coauthoring for files encrypted with sensitivity labels](/purview/sensitivity-labels-coauthoring#if-you-need-to-disable-this-feature).

## Related content

- [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md)
- [Troubleshooting access and session controls for admin users](troubleshooting-proxy.md)
- [Troubleshooting - What is `*.mcas.ms`, `*.mcas-gov.us`, or `*.mcas-gov.ms`?](troubleshooting-proxy-url.md)
