---
title: macOS Device control policies frequently asked questions (FAQ)
description: Get answers to common questions about device control policies using JAMF or Intune.
ms.service: defender-endpoint
author: YongRhee-MSFT
ms.author: yongrhee
manager: deniseb
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: conceptual
ms.subservice: macos
search.appverid: met150
ms.date: 04/30/2024
---

# macOS Device Control policies frequently asked questions (FAQ)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- [Microsoft Defender for Business](/defender-business)


This article provides answers to frequently asked questions about Device Control capabilities in Microsoft Defender for Endpoint.

## Questions | Answers

### How do I know whether the machine is Device Control enabled, and what is the Default Enforcement?

Answer: Run _mdatp device-control policy preferences list_ to see all the iOS policies on this machine:

:::image type="content" source="media/macos-device-control-faq-enabled-default-enforcement.png" alt-text="Shows how to run mdatp device-control policy preferences list to see if a device is Device Control enabled. " lightbox="media/macos-device-control-faq-enabled-default-enforcement.png":::

### How do I know whether the policy has been delivered to the client machine?

Answer: Run _mdatp device-control policy rules list_ to see all the iOS policies on this machine:

:::image type="content" source="media/macos-device-control-faq-policy-is-on-client.png" alt-text="Shows how to run mdatp device-control policy rules list to determine whether a policy has been configured on the endpoint." lightbox="media/macos-device-control-faq-policy-is-on-client.png":::

Answer 2: Run _mdatp device-control policy groups list_ to see all the iOS groups on this machine:

:::image type="content" source="media/macos-device-control-faq-policy-is-on-client-ios-groups.png" alt-text="Shows how to see all of the iOS groups on the device." lightbox="media/macos-device-control-faq-policy-is-on-client-ios-groups.png":::

## See also

- [Device Control for macOS](mac-device-control-overview.md)
- [Deploy and manage Device Control using Intune](mac-device-control-intune.md)
- [Deploy and manage Device Control using jamf](mac-device-control-jamf.md)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
