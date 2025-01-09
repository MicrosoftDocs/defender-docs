---
title: Open app connector platform - Microsoft Defender for Cloud Apps
description: Learn how you can use the Microsoft Defender for Cloud Apps open app connector platform to build your own connector.
ms.date: 07/05/2023
ms.topic: overview
---

# Microsoft Defender for Cloud Apps open app connector platform (Preview)

Microsoft Defender for Cloud Apps' [app connectors](protect-connected-apps.md) are a vital bridge between your SaaS applications and Microsoft's powerful security operations. Connect the apps your organization creates to Defender for Cloud Apps to extend app security features across the customer SaaS ecosystem, safeguarding data, mitigating risks, and reinforcing overall SaaS security posture.

This article describes how SaaS app vendors can use the Defender for Cloud Apps open app connector platform to build connectors for their own apps. The codeless open app connector platform helps simplify connector development by avoiding extra coding and reducing integration time.

> [!NOTE]
> We recommend that SaaS vendors read this article thoroughly to understand the high-level app connector development process and partnership expectations.
>
> For more information, contact the team at [BuildSaaSConnector@microsoft.com](mailto:BuildSaaSConnector@microsoft.com).

## Sample scenarios

As a SaaS vendor, building a Defender for Cloud Apps connector for your app enhances your app security with Defender for Cloud Apps' SaaS security posture management and threat protections features. SaaS apps with connectors are also added to the [Microsoft Defender XDR partner catalog](/microsoft-365/security/defender-endpoint/technological-partners), providing vendors with more visibility and opportunities to expand to new customers.

For example, you might create a connector for your app in one of the following scenarios:

- **Security posture management for SaaS apps**: SaaS app configurations in customer organizations might not align with security best practices. Develop a connector so that Defender for Cloud Apps can provide customers with assessments about their SaaS app security configurations, ensuring that they're using the best configurations to prevent possible risks. For more information, see [Security posture management for SaaS apps](security-saas.md).
- **Advanced threat protection for SaaS apps**: Customers need to have a deep understand of what's happening in their SaaS app environments to detect, investigate, and remediate any risks. Develop a connector for your app so that Defender for Cloud Apps can provide customers with multiple layers of post-breach threat protection capabilities, including built-in detections to for compromised users and apps, custom detection configuration capabilities, rich investigation capabilities, and response actions to mitigate threats. For more information, see [Investigate cloud app risks and suspicious activity](investigate.md).

## Prerequisites

To integrate with Defender for Cloud Apps on the open app connector platform, your SaaS app must meet one of the following requirements:

- **Advanced threat protection**: The SaaS app must use REST APIs that facilitate Defender for Cloud Apps queries on user accounts and audit logs
- **Security posture management**: The SaaS app must have REST APIs that facilitate Defender for Cloud Apps queries on SaaS security configurations

All SaaS app REST APIs must support oAuth authentication.

## Develop your connector using the open app connector platform

As a SaaS vendor, use the steps shown in the following image to build a connector together with Microsoft, using the open app connector platform:

![A diagram of the app connector platform process.](media/connector-platform/app-connector-platform-process.png)

The following steps provide more details about the open app connector platform process (Note that: a partnership agreement is required as part of this process):

1. Email Microsoft at [buildSaaSConnector@microsoft.com](mailto:buildSaaSConnector@microsoft.com), expressing your intent for partnership. In your email, describe your SaaS app and any integration scenarios of interest, and provide any relevant links.
1. Microsoft will set up a vendor discovery call. Use this call to learn more about the open app connector platform, integration opportunities, mutual customer benefits, and how to build a connector.
1. After the discovery call, you'll get access to Microsoft's app connector manifest. The manifest is a no-code, vendor facing artifact for SaaS vendors to complete. 
1. Use the app connector manifest to provide Microsoft with any of your SaaS app's technical details that are needed to create the app connector.
1. Microsoft validates the connector manifest. After it's successfully validated, Microsoft uses the manifest to generate the app connector.
1. Work with Microsoft to run a joint validation of the new app connector in a test environment. We recommend that you nominate customers to preview the app connector before making it generally available.
1. After the app connector has been successfully validated by you and any preview customers, Microsoft publishes the app connector to the Microsoft Defender Technology Partners catalog, where new customers can access Defender for Cloud app connectors.

## Next steps

For more information, see [Protect connected apps using cloud service provider APIs](protect-connected-apps.md).





