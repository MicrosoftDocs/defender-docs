---
title: include file
description: include file
ms.collection: M365-security-compliance
ms.service: defender-for-cloud-apps
author: batamig
ms.topic: include
ms.date: 12/31/2023
ms.author: bagol
ms.custom: include file
---

### Sample: Create Microsoft Entra ID Conditional Access policies for use with Defender for Cloud Apps

This procedure provides a high-level example of how to create a Conditional Access policy for use with Defender for Cloud Apps.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com) as at least a [Conditional Access Administrator](/entra/identity/role-based-access-control/permissions-reference#conditional-access-administrator).
1. Browse to **Entra ID** > **Conditional Access** > **Policies**.
1. Select **New policy**.
1. Give your policy a name. We recommend that organizations create a meaningful standard for the names of their policies.
1. Under **Assignments**, select **Users or workload identities**.
   1. Under **Include**, select **All users**
   1. Under **Exclude**, select **Users and groups** and choose your organization's emergency access or break-glass accounts.
1. Under **Target resources** > **Resources (formerly cloud apps)**, select the following options:
   1. Under **Include**, choose **Select resources**.
   1. Select the client apps that you want to include in your policy.
1. Under **Conditions**, select any conditions that you want to include in your policy.
1. Under **Access controls** > **Session**, select **Use Conditional Access App Control**, then select **Select**.
1. Confirm your settings and set **Enable policy** to **Report-only**.
1. Select **Create** to create to enable your policy.

After confirming your settings using [policy impact or report-only mode](/entra/identity/conditional-access/concept-conditional-access-report-only#reviewing-results), move the **Enable policy** toggle from **Report-only** to **On**.

For more information, see [Conditional Access policies](/azure/active-directory/conditional-access/overview) and [Building a Conditional Access policy](/entra/identity/conditional-access/concept-conditional-access-policies).

> [!NOTE]
> Microsoft Defender for Cloud Apps utilizes the application **Microsoft Defender for Cloud Apps - Session Controls** as part of the Conditional Access App Control service for user sign-in. This application is located within the 'Enterprise Applications' section of Entra ID. 
To protect your SaaS applications with Session Controls, you must allow access to this application.
> 
>If you have any Conditional Access policies that have **“Block Access”** selected in the **“Grant Access”** Control under a Microsoft Entra ID Conditional Access policy scoped to this app, end users will not be able to access the protected applications under session controls. <br><br>
>It's important to ensure that this application isn't unintentionally restricted by any Conditional Access policies. For policies that restrict all or certain applications, please ensure this application is listed as an exception in the **Target resources** or confirm that the blocking policy is deliberate.<br>  
>
>To ensure your location-based conditional access policies function correctly, include the **Microsoft Defender for Cloud Apps – Session Controls** application in those policies.
