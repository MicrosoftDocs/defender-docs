---
title: Use Defender for Cloud Apps Conditional Access app control | Microsoft Defender for Cloud Apps
description: Learn how to use Microsoft Defender for Cloud Apps Conditional Access app control to create access and session policies for real-time monitoring and control over access to cloud apps.
ms.date: 07/03/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Use Defender for Cloud Apps Conditional Access app control

Use Microsoft Defender for Cloud Apps Conditional Access app control to create access and session policies that monitor and control user access to cloud apps in real time. This guide walks through onboarding your apps, setting up a Conditional Access policy, and creating and testing your access and session policies. Before you begin, make sure you meet the [prerequisites](#prerequisites).

## Conditional Access app control usage flow (Preview)

The following image shows the high level process for configuring and implementing Conditional Access app control:

:::image type="content" source="media/conditional-access-app-control-how-to-overview/conditional-access-policy-flow.png" alt-text="Diagram of the Conditional Access app control process flow." border="false" lightbox="media/conditional-access-app-control-how-to-overview/conditional-access-policy-flow.png":::

## Which identity provider are you using?

Before you start using Conditional Access app control, understand whether your apps are managed by Microsoft Entra or another identity provider (IdP). 

- **Microsoft Entra apps** are automatically onboarded for Conditional Access app control and are immediately available for you to use in your access and session policy conditions (Preview). Microsoft Entra apps can also be manually onboarded before you select them in your access and session policy conditions.

- **Apps that use non-Microsoft IdPs** must be manually onboarded before you can select them in your access and session policy conditions.

    - If you're working with a catalog app from a non-Microsoft IdP, configure the integration between your IdP and Defender for Cloud Apps to onboard all catalog apps. For more information, see [Onboard non-Microsoft IdP catalog apps for Conditional Access app control](proxy-deployment-featured-idp.md).

    - If you're working with custom apps, you need to both configure the integration between your IdP and Defender for Cloud Apps, and also onboard each custom app. For more information, see [Onboard non-Microsoft IdP custom apps for Conditional Access app control](proxy-deployment-any-app-idp.md).

### Sample procedures

The following articles provide sample processes for configuring a non-Microsoft IdP to work with Defender for Cloud Apps:

- [PingOne as your IdP](proxy-idp-pingone.md)
- [Active Directory Federation Services (AD FS) as your IdP](proxy-idp-adfs.md)
- [Okta as your IdP](proxy-idp-okta.md)

## Prerequisites: 

Before you configure Conditional Access app control, make sure the following prerequisites are met:

1. Make sure your firewall allows traffic from all IP addresses listed in [Network requirements](network-requirements.md).
1. Check that your app has a full certificate chain. Missing parts of the chain can cause unexpected app behavior with Conditional Access app control policies.

## Create a Microsoft Entra ID Conditional Access policy

Access and session policies need a Conditional Access policy in Microsoft Entra ID. This policy controls traffic to your cloud apps.

For steps to create one, see the [access policy](access-policy-aad.md) and [session policy](session-policy-aad.md) guides.

To learn more, see [Conditional Access policies](/azure/active-directory/conditional-access/overview) and [Building a Conditional Access policy](/entra/identity/conditional-access/concept-conditional-access-policies).

## Create your access and session policies

After you've confirmed that your apps are onboarded, either automatically because they're Microsoft Entra ID apps, or manually, and you have a Microsoft Entra ID Conditional Access policy ready, you can continue with creating access and session policies for any scenario you need.

For more information, see:

- [Create a Defender for Cloud Apps access policy](access-policy-aad.md#create-a-defender-for-cloud-apps-access-policy)
- [Create a Defender for Cloud Apps session policy](session-policy-aad.md#create-a-defender-for-cloud-apps-session-policy)

## Test your policies

Make sure to test your policies and update any conditions or settings as needed. For more information, see:

- [Test your access policy](access-policy-aad.md#test-your-policy)
- [Test your session policy](session-policy-aad.md#test-your-policy)

## Related content

For more information, see [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md).
