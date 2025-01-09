---  
title: Automatically onboard Microsoft Entra ID apps 
description:  Learn how to automatically onboard Microsoft Entra ID apps to Microsoft Defender for Cloud Apps conditional access app control
author:  Adipkmic
ms.author: adipavekatz  
manager:  raynew
ms.date: 10/10/2024  
ms.topic:  concept-article
ms.service: defender-for-cloud-apps
ms.custom: QuickDraft, ai-usage
ms.reviewer: adipavekatz  
search.appverid: MET150  
---  

# Automatically onboard Microsoft Entra ID apps to conditional access app control

All SaaS applications that exist in the Microsoft Entra ID catalog will be available automatically in the policy app filter. The following image shows the high-level process for configuring and implementing Conditional Access app control:

:::image type="content" source="media/caac-app-onboarding/process.png" alt-text="Diagram of the process for configuring and implementing conditional access app control.":::

## Prerequisites

- Your organization must have the following licenses to use Conditional Access App Control:
  - Microsoft Defender for Cloud Apps
- Apps must be configured with single sign-on in Microsoft Entra ID

Fully performing and testing the procedures in this article requires that you have a session or access policy configured. For more information, see:

- [Create Microsoft Defender for Cloud Apps access policies](https://example.com)
- [Create Microsoft Defender for Cloud Apps session policies](https://example.com)

## Supported Apps

All SaaS apps listed in the Microsoft Entra ID catalog will be available for filtering within the Microsoft Defender for Cloud Apps session and access policies. Each app chosen in the filter will automatically be onboarded into the system and will be controlled.

:::image type="content" source="media/caac-app-onboarding/filter.png" alt-text="Screenshot of the filter showing automatically onboarded apps.":::

If an application isn't listed, you have the option to manually onboard it as outlined in the provided instructions.

**Note:** Dependency on Microsoft Entra ID Conditional Access policy:

All apps listed in the Microsoft Entra ID catalog will be available for filtering within Microsoft Defender for Cloud Apps session and access policies. However, only those applications that are included in Microsoft Entra ID's conditional policy with Microsoft Defender for Cloud Apps permissions will be actively managed within access or session policies.

When creating a policy, if the relevant Microsoft Entra ID's conditional policy is missing, an alert will appear, both during the policy creation process and upon saving the policy.

**Note:** To ensure that this policy runs as expected, we recommend checking the Microsoft Entra Conditional Access policies created in Microsoft Entra ID. You can see the full Microsoft Entra Conditional Access policies list in a banner on the create policy page.

:::image type="content" source="media/caac-app-onboarding/recommendation.png" alt-text="Screenshot of the recommendation shown in the portal.":::

## Conditional Access App Control Configuration Page

Admins will be able to control app configurations such as:

- **Status:** App status - Disable or Enable
- **Policies:** Does at least one inline policy connect
- **IDP:** Onboarded app via IDP via Microsoft Entra or Non-MS IDP
- **Edit app:** Edit app configuration such as adding domains or disabling the app.

All apps that automatically onboarded will be set to "enabled" by default. Following the initial sign-in by a user, administrators will have the ability to view the application under **Settings** \> **Connected apps** \> **Conditional Access App Control apps**.


## Common App Misconfigurations

- [Second sign-in (also known as 'second sign-in')](troubleshooting-proxy.md#second-sign-in-also-known-as-second-login)
- [Missing domains](troubleshooting-proxy.md#add-domains-for-your-app)
