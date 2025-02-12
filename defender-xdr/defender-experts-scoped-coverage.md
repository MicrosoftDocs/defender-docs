---
title: Scoped coverage in Microsoft Defender Experts for XDR
ms.reviewer:
description: Defender Experts scoped coverage covers a specific section of the organization where SOC support is limited.
ms.service: defender-experts
ms.subservice: dex-xdr
ms.author: vpattnaik
author: vpattnai
ms.localizationpriority: medium
manager: dansimp
audience: ITPro
ms.collection:
  - m365-security
  - tier1
ms.topic: conceptual
ms.custom: 
- cx-ti
- cx-dex
search.appverid: met150
ms.date: 12/24/2024
---

# Scoped coverage in Microsoft Defender Experts for XDR

**Applies to:**

- [Microsoft Defender XDR](microsoft-365-defender.md)

Microsoft Defender Experts for XDR offers scoped coverage for customers who wish to have Defender Experts cover only a section of their organization (for example, specific geography, subsidiary, or function) that requires security operations center (SOC) support or where their security support is limited.

You can define a specific set of devices and/or users for which Defender Experts will offer support. Any incident that impacts any of the defined set of devices and users will be considered in scope, and our experts will provide the necessary response actions to mitigate the threat.

Devices and users that are out of scope won't be supported by Defender Experts. If they're part of an incident where at least one device or user in scope is impacted, we'll keep you informed about the out-of-scope assets but won't take any response actions or offer guidance.

## Using Defender Experts scoped coverage

You can create a predefined Microsoft Defender for Endpoint device group or a Microsoft Entra ID user group in the Microsoft Defender portal to which you can add devices and users, respectively. The name assigned to the created device or user group should be the following:

- **Defender_Experts_Scoped_Coverage_Devices**
- **Defender_Experts_Scoped_Coverage_Users**

:::image type="content" source="media/defender_scoped_devices.png" alt-text="Screenshot of Defender Experts Scoped devices." lightbox="media/defender_scoped_devices.png":::

:::image type="content" source="media/defender-experts-scoped-users.png" alt-text="Screenshot of Defender Experts Scoped users." lightbox="media/defender-experts-scoped-users.png":::

The devices and users you add to these groups are then considered as the set of assets that are in scope for this service.

> [!NOTE]
> You need **Security admin** permissions to create the device and user groups. [Learn more about granting permissions to our experts](get-started-xdr.md#grant-permissions-to-our-experts).

> [!TIP]
> The device group should be in the highest order of priority for the devices under it, to be considered in scope. This is a known product limitation.

Currently, the service doesn't offer support to rename these predefined groups, so we recommend that you don't rename the created device or user group. It also doesn't support nested groups. The devices and users would have to be added individually to the groups created.

The following section lists down questions that you or your SOC team might have regarding scoped coverage:

1. **What aspects of the XDR service remain consistent with Defender Experts scoped coverage?**
   - This service doesn't change our pricing structure. You still pay for Defender Experts service based on [E5](before-you-begin-xdr.md#eligibility-and-licensing) and Microsoft Defender for Endpoint for Servers for your desired user base.
   - This service doesn't scope according to individual Microsoft Defender products and services (such as Microsoft Defender for Endpoint, Microsoft Defender for Office 365, or Microsoft Defender for Cloud). That is, the minimum baseline for scoped coverage is still the E5 license.
   - There's no change in permissions for analysts in Defender Experts for XDR. Defender Experts analysts will still have access to your entire tenant and not just the scoped assets.

2. **Can I change the scoped assets later?**

   You're allowed to change the scoped assets based on your needs. Keep in mind that the changes you make might take some time to take effect in our service. We recommend that you take into account your organization's rhythm of business for incidents before and after the changes are made.

3. **What type of response actions does this service provide?**

   There are no changes to existing response actions that are in scope. Read our [FAQs related to Microsoft Defender Experts for XDR Managed response](../defender-xdr/frequently-asked-questions.md) to learn more.

### See also

- [Get started with Microsoft Defender Experts for XDR service](managed-detection-and-response-xdr.md)
- [Understanding and managing Defender Experts for XDR incident updates](faq-incident-notifications-xdr.md)