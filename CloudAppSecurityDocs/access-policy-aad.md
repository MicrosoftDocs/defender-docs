---
title: Create access policies | Microsoft Defender for Cloud Apps
description: Learn how to configure Microsoft Defender for Cloud Apps access policies with Conditional Access app control to control access to cloud apps.
ms.date: 05/15/2024
ms.topic: how-to
---
# Create Microsoft Defender for Cloud Apps access policies



Microsoft Defender for Cloud Apps access policies use Conditional Access app control to provide real-time monitoring and control over access to cloud apps. Access policies control access based on user, location, device, and app, and are supported for any device.

Policies created for a host app are not connected to any related resource apps. For example, access policies that you create for Teams, Exchange, or Gmail are not connected to SharePoint, OneDrive, or Google Drive. If you need a policy for the resource app in addition to the host app, create a separate policy.

> [!TIP]
> If you'd prefer to generally allow access while monitoring sessions or limit specific session activities, create session policies instead. For more information, see [Session policies](session-policy-aad.md).

## Prerequisites

Before you start, make sure that you have the following prerequisites:

- A Defender for Cloud Apps license, either as a stand-alone license or as part of another license.

- A license for Microsoft Entra ID P1, either as stand-alone license or as part of another license.

- If you're using a non-Microsoft IdP, the license required by your identity provider (IdP) solution.

- The relevant apps onboarded to Conditional Access app control. Microsoft Entra ID apps are automatically onboarded, while non-Microsoft IdP apps must be onboarded manually.

    If you're working with a non-Microsoft IdP, make sure that you've also configured your IdP to work with Microsoft Defender for Cloud Apps. For more information, see:

    - [Onboard non-Microsoft IdP catalog apps for Conditional Access app control](proxy-deployment-featured-idp.md)
    - [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md)

In order for your access policy to work, you must also have a Microsoft Entra ID Conditional Access policy, which creates the permissions to control traffic.

[!INCLUDE [entra-conditional-access-policy](includes/entra-conditional-access-policy.md)]


## Create a Defender for Cloud Apps access policy

This procedure describes how to create a new access policy in Defender for Cloud Apps.

1. In Microsoft Defender XDR, select the **Cloud Apps > Policies > Policy management > Conditional Access** tab.

1. Select **Create policy** > **Access policy**. For example:

    ![Create a Conditional Access policy.](media/create-policy-from-conditional-access-tab.png)

1. On the **Create access policy** page, enter the following basic information:

    |Name  |Description  |
    |---------|---------|
    |**Policy name**     |     A meaningful name for your policy, such as *Block access from unmanaged devices*    |
    |**Policy severity**     |  Select the severity you want to apply to your policy.        |
    |**Category**     |  Keep the default value of **Access control**       |
    | **Description** | Enter an optional, meaningful description for your policy to help your team understand its purpose. |

1. In the **Activities matching all of the following** area, select additional activity filters to apply to the policy. Filters include the following options: 

    |Name  |Description  |
    |---------|---------|
    | **App** | Filters for a specific app to include in the policy. Select apps by first selecting whether they use **Automated Azure AD onboarding**, for Microsoft Entra ID apps, or **Manual onboarding**, for non-Microsoft IdP apps. Then, select the app you want to include in your filter from the list. <br><br>If your non-Microsoft IdP app is missing from the list, make sure that you've onboarded it fully. For more information, see: <br>- [Onboard non-Microsoft IdP catalog apps for Conditional Access app control](proxy-deployment-featured-idp.md)<br>- [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md) <br><br>If you choose not to use the **App** filter, the policy applies to all applications that are marked as **Enabled** on the **Settings > Cloud Apps > Connected apps > Conditional Access App Control apps** page.<br><br>**Note**: You may see some overlap between apps that are onboarded and apps that need manual onboarding. In case of a conflict in your filter between the apps, manually onboarded apps take precedence.|
    | **Client app** | Filter for browser or mobile/desktop apps. |
    | **Device** | Filter for device tags, such as for a specific device management method, or device types, such as PC, mobile, or tablet.|
    |**IP address**     |  Filter per IP address or use previously assigned IP address tags.       |
    |**Location**     |   Filter by geographic location. The absence of a clearly defined location may identify risky activities. |
    | **Registered ISP** |Filter for activities coming from a specific ISP.|
    | **User** | Filter for a specific user or group of users. |
    | **User agent string** |    Filter for a specific user agent string.|
    |**User agent tag**     | Filter for user agent tags, such as for outdated browsers or operating systems.  |

    For example:

    :::image type="content" source="media/access-policy-aad/onboarded-apps-filter.png" alt-text="Screenshot of a sample filter when creating an access policy.":::

    Select **Edit and preview results** to get a preview of the types of activities that would be returned with your current selection.

1. In the **Actions** area, select one of the following options:

    - **Audit**: Set this action to allow access according to the policy filters you set explicitly.

    - **Block**: Set this action to block access according to the policy filters you set explicitly.

1. In the **Alerts** area, configure any of the following actions as needed:

    - **Create an alert for each matching event with the policy's severity**
    - **Send an alert as email**
    - **Daily alert limit per policy**
    - **Send alerts to Power Automate**

1. When you're done, select **Create**.

## Test your policy

After you've created your access policy, test it by re-authenticating to each app configured in the policy. Verify that your app experience is as expected, and then check your activity logs.

We recommend that you:

- Create a policy for a user you've created specifically for testing.
- Sign out of all existing sessions before re-authenticating to your apps.
- Sign into mobile and desktop apps from both managed and unmanaged devices to ensure that activities are fully captured in the activity log.

Make sure to sign in with a user that matches your policy.

**To test your policy in your app**:

- Visit all pages within the app that are part of a user's work process and verify that the pages render correctly.
- Verify that the behavior and functionality of the app isn't adversely affected by performing common actions such as downloading and uploading files.
- If you're working with custom, non-Microsoft IdP apps, check each of the domains that you've [manually added for your app](troubleshooting-proxy.md#add-domains-for-your-app).

**To check activity logs**:

1. In Microsoft Defender XDR, select **Cloud apps > Activity log**, and check for the sign-in activities captured for each step. You may want to filter by selecting **Advanced filters** and filtering for **Source equals Access control**.

   **Single sign-on log on** activities are Conditional Access app control events.

1. Select an activity to expand for more details. Check to see that the **User agent** tag properly reflects whether the device is a built-in client, either a mobile or desktop app, or the device is a managed device that's compliant and domain-joined.

If you encounter errors or issues, use the **Admin View toolbar** to gather resources such as `.Har` files and recorded sessions, and then file a support ticket.

## Create access policies for identity-managed devices

Use client certificates to control access for devices that aren't Microsoft Entra-hybrid joined and aren't managed by Microsoft Intune. Roll out new certificates to managed devices, or use existing certificates, such as third-party MDM certificates. For example, you may want to deploy client certificate to managed devices and then block access from devices without a certificate.

For more information, see [Identity managed devices with Conditional Access app control](conditional-access-app-control-identity.md).

## Related content

For more information, see:

- [Troubleshooting access and session controls](troubleshooting-proxy.md)
- [Tutorial: Block download of sensitive information with conditional access app control](use-case-proxy-block-session-aad.md)
- [Blocking downloads on unmanaged devices using session controls](use-case-proxy-block-session-aad.md)
- [Conditional access app control webinar](webinars.md#on-demand-webinars)

[!INCLUDE [Open support ticket](includes/support.md)]
