---
title: Block download of sensitive information with conditional access app control
description: This tutorial describes the scenario for protecting your organization against downloads of sensitive data by unmanaged devices using Microsoft Entra ID Conditional Access app control.
ms.date: 05/15/2024
ms.topic: tutorial
---
# Tutorial: Block download of sensitive information with conditional access app control



Today's IT admin is stuck between a rock and hard place. You want to enable your employees to be productive. That means allowing employees to access apps so they can work at any time, from any device. However, you want to protect the company's assets including proprietary and privileged information. How can you enable employees to access your cloud apps while protecting your data? **This tutorial allows you to block downloads by users who have access to your sensitive data in enterprise cloud apps from either unmanaged devices or off-corporate network locations.**

In this tutorial, you'll learn how to:

> [!div class="checklist"]
>
> - [Create a block download policy for unmanaged devices](#create-a-block-download-policy-for-unmanaged-devices)
> - [Validate your policy](#validate-your-policy)

## The threat

An account manager in your organization wants to check something in Salesforce from home over the weekend, on their personal laptop. The Salesforce data might include client credit card information or personal information. The home PC is unmanaged. If they download documents from Salesforce onto the PC, it might be infected with malware. Should the device be lost or stolen, it may not be password protected and anyone who finds it has access to sensitive information.

In this case, your users sign into Salesforce using their corporate credentials, through Microsoft Entra ID.

## The solution

Protect your organization by monitoring and controlling cloud app use with Defender for Cloud Apps Conditional Access app control.

## Prerequisites

- A valid license for Microsoft Entra ID P1 license, or the license required by your identity provider (IdP) solution
- A Microsoft Entra Conditional Access policy for Salesforce
- Salesforce configured as a Microsoft Entra ID app

## Create a block download policy for unmanaged devices

This procedure describes how to create a Defender for Cloud Apps session policy only, which allows you to restrict a session based on a device's state.

To control a session using a device as a *condition*, you must also create a Defender for Cloud Apps access policy. For more information, see [Create Microsoft Defender for Cloud Apps access policies](access-policy-aad.md).

**To create your session policy**

1. In the [Microsoft Defender Portal](https://security.microsoft.com), under **Cloud Apps**, select **Policies** > **Policy management**.

1. In the **Policies** page, select **Create policy** > **Session policy**.

1. In the **Create session policy** page, give your policy a name and description. For example, **Block downloads from Salesforce for unmanaged devices**.

1. Assign a **Policy severity** and **Category**.

1. For the **Session control type**, select **Control file download (with inspection)**. This setting gives you the ability to monitor everything your users do within a Salesforce session and gives you control to block and protect downloads in real time.

1. Under **Activity source** in the **Activities matching all of the following** section, select the filters:

    - **Device tag**: Select **Does not equal**. and then select **Intune compliant**, **Hybrid Azure AD joined**, or **Valid client certificate**. Your selection depends on the method used in your organization for identifying managed devices.

    - **App**: Select **Automated Azure AD onboarding** > **Equals** > **Salesforce**.

1. Alternatively, you can block the downloads for locations that aren't part of your corporate network. Under **Activity source** in the **Activities matching all of the following** section, set the following filters:

    - **IP address** or **Location**: Use either of these two parameters to identify non-corporate or unknown locations, from which a user might be trying to access sensitive data.

     > [!NOTE]
     > If you want to block downloads from BOTH unmanaged devices and non-corporate locations, you have to create two session policies. One policy sets the **Activity source** using the location. The other policy sets the **Activity source** to unmanaged devices.

    - **App**: Select **Automated Azure AD onboarding** > **Equals** > **Salesforce**.

1. Under **Activity source** in the **Files matching all of the following** section, set the following filters:

    - **Sensitivity labels**: If you use sensitivity labels from Microsoft Purview Information Protection, filter the files based on a specific Microsoft Purview Information Protection sensitivity label.

    - Select **File name** or **File type** to apply restrictions based on file name or type.

1. Enable **Content inspection** to enable the internal DLP to scan your files for sensitive content.

1. Under **Actions**, select **block**. Customize the blocking message that your users get when they're unable to download files.

1. Configure the alerts you want to receive when the policy is matched, such as a limit so that you don't receive too many alerts, and whether you want to get the alerts as an email.

1. Select **Create**.

## Validate your policy

1. To simulate the blocked file download, from an unmanaged device or a non-corporate network location, sign in to the app. Then, try to download a file.

1. The file should be blocked and you should receive the message you defined earlier, under **Customize block messages**.

1. In the [Microsoft Defender Portal](https://security.microsoft.com), under **Cloud Apps**, go to **Policies**, then select **Policy management**. Then select the policy you've created to view the policy report. A session policy match should appear shortly.

1. In the policy report, you can see which sign-ins were redirected to Microsoft Defender for Cloud Apps for session control, and which files were downloaded or blocked from the monitored sessions.

## Next steps

> [!div class="nextstepaction"]
> [How to create an access policy](access-policy-aad.md)

> [!div class="nextstepaction"]
> [How to create a session policy](session-policy-aad.md)

[!INCLUDE [Open support ticket](includes/support.md)]
