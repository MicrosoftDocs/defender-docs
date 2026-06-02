---
title: Understand policy order in Microsoft Defender for Business
description: Learn about order of priority with device policies in Defender for Business.
author: chrisda
ms.author: chrisda
ms.topic: overview
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 09/23/2025
ms.reviewer: nehabha
ms.collection:
- SMB
- m365-security
- tier1
ms.custom: sfi-image-nochange
---

# Understand policy order in Microsoft Defender for Business

Defender for Business includes [predefined policies](mdb-view-edit-create-policies.md#default-policies-in-defender-for-business) to help ensure user devices are protected. Your security team can [add new policies](mdb-view-edit-create-policies.md#create-a-new-policy) as well.

For example, suppose that your security team wants to apply different settings to different groups of devices. They can accomplish this goal by adding more next-generation protection policies or firewall policies. As you add policies, policy order comes into play.

## Policy order in Defender for Business

When you add policies, a priority order is assigned to all policies in the group, as shown in the following screenshot:

:::image type="content" source="media/mdb-deviceconfig-multpolicies.png" alt-text="Screenshot showing multiple policies and policy order column." lightbox="media/mdb-deviceconfig-multpolicies.png":::

The **Order** column lists the priority for each policy. Predefined policies move down in priority order when you add new policies. You can edit the order of priority for policies you create (select a policy, and then choose **Change order**). You can't change the priority of default policies (they're always last).

For example, suppose you have three next-generation protection policies that apply to Windows client devices. The default policy is priority 3 (last) and you can't change it. You can change the priority of policies 1 and 2 (switch places).

**When multiple policies apply to a device, the device receives the policy with the highest priority only**. After the settings of the highest priority policy are applied, policy processing for that type of policy stops. In the previous example, the affected Windows client devices get the next-generation policy with priority 1. The devices never receive policies 2 and 3.

## Key points to remember about policy order

- Policies are automatically assigned a priority.
- You can change the priority for custom policies, but not for default policies.
- Default policies always get the lowest priority as new policies are added.
- Devices receive the first applied policy only, even if the devices are included in multiple policies.

## See also

- [Set up, review, and edit your security policies and settings](mdb-configure-security-settings.md)
- [View or edit policies](mdb-view-edit-create-policies.md)
- [Onboard devices](mdb-onboard-devices.md)
