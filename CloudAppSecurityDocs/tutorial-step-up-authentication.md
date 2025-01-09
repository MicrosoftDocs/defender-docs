---
title: Require step-up authentication (authentication context) upon risky action
description: This tutorial provides instructions for requiring step-up authentication (authentication context) upon risky action.
ms.date: 05/15/2024
ms.topic: tutorial
---
# Tutorial: Require step-up authentication (authentication context) upon risky action



As an IT admin today, you're stuck between a rock and hard place. You want to enable your employees to be productive. That means allowing employees to access apps so they can work at any time, from any device. However, you want to protect the company's assets including proprietary and privileged information. How can you enable employees to access your cloud apps while protecting your data?

This tutorial allows you to reevaluate Microsoft Entra Conditional Access policies when users take sensitive actions during a session.

## The threat

An employee logged in to SharePoint Online from the corporate office. During the same session, their IP address registered outside of the corporate network. Maybe they went to the coffee shop downstairs, or maybe their token was compromised or stolen by a malicious attacker.

## The solution

Protect your organization by requiring Microsoft Entra Conditional Access policies to be reassessed during sensitive session actions the Defender for Cloud Apps conditional access app control.

## Prerequisites

- A valid license for Microsoft Entra ID P1 license

- Your cloud app, in this case SharePoint Online, configured as a Microsoft Entra ID app and using SSO via SAML 2.0 or OpenID Connect

- Make sure the [app is deployed to Defender for Cloud Apps](proxy-deployment-aad.md)

## Create a policy to enforce step-up authentication

Defender for Cloud Apps session policies allow you to restrict a session based on device state. To accomplish control of a session using its device as a condition, create both a Conditional Access policy **and** a session policy.

**To create your policy**:

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Polices** -> **Policy management**.

1. In the **Policies** page, select **Create policy** followed by **Session policy**.

1. In the **Create session policy** page, give your policy a name and description. For example, **Require step-up authentication on downloads from SharePoint Online from unmanaged devices**.

1. Assign a **Policy severity** and **Category**.

1. For the **Session control type**, select **Block activities,** **Control file upload (with inspection),** **Control file download (with inspection)**.

1. Under **Activity source** in the **Activities matching all the following** section, select the filters:

    - **Device tag**: Select **Does not equal**, and then select **Intune compliant**, **Microsoft Entra hybrid joined**, or **Valid client certificate**. Your selection depends on the method used in your organization for identifying managed devices.

    - **App**: Select **Automated Azure AD onboarding** and then select **SharePoint Online** from the list.

    - **Users**: Select the users you want to monitor.

1. Under **Activity source** in the **Files matching all of the following** section, set the following filters:

    - **Sensitivity labels**: If you use sensitivity labels from Microsoft Purview Information Protection, filter the files based on a specific Microsoft Purview Information Protection sensitivity label.

    - Select **File name** or **File type** to apply restrictions based on file name or type.

1. Enable **Content inspection** to enable the internal DLP to scan your files for sensitive content.

1. Under **Actions**, select **Require step-up authentication**.

    >[!NOTE]
    >This requires [authentication context to be created in Microsoft Entra ID](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ConditionalAccessBlade/StepUpTags).

1. Set the alerts you want to receive when the policy is matched. You can set a limit so that you don't receive too many alerts. Select if to get the alerts as an email message.

1. Select **Create**.

## Validate your policy

1. To simulate this policy, sign in to the app from an unmanaged device or a non-corporate network location. Then, try to download a file.

1. You should be required to perform the action configured in the authentication context policy.

1. In the Microsoft Defender Portal, under **Cloud Apps**, go to **Polices** -> **Policy management**. Then select the policy you've created to view the policy report. A session policy match should appear shortly.

1. In the policy report, you can see which logins where redirected to Microsoft Defender for Cloud Apps for session control, and which files were downloaded or blocked from the monitored sessions.

## Next steps

[How to create an access policy](access-policy-aad.md)

[How to create a session policy](session-policy-aad.md)

If you run into any problems, we're here to help. To get assistance or support for your product issue, please [open a support ticket](support-and-ts.md).
