---
title: View Defender for Identity workspace details on the About page in Microsoft Defender XDR
description: Learn how to collect important details about your Defender for Identity workspace in Microsoft Defender XDR.
ms.date: 07/02/2026
ms.topic: how-to
ms.reviewer: rlitinsky
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# View information on the Defender for Identity About page

This article explains how to use the About page to collect important details about your Defender for Identity workspace in Microsoft Defender. Before you begin, make sure you meet the [Defender for Identity prerequisites](prerequisites.md).

<a name="details-on-about-page"></a>
## Information shown on the Defender for Identity About page

To access the About page, in  [Microsoft Defender XDR](https://security.microsoft.com), go to **Settings** and then **Identities**. Under **General**, select **About**.

:::image type="content" source="media/settings-about-page.png" alt-text="About page.":::

The About page provides the following details:

- Sensor version: The latest software version available for sensor updates.
- Geolocation: The geographic location of the workspace where your data is stored.
- Workspace ID: The identifier of your workspace.
- Workspace name: The name of your workspace.
- Total licenses: The total number of Microsoft Denfender for Identity licenses assigned to the tenant.
- Active identities during the past 28 days: The total number of on-premises identities that had activity detected by Defender for Identity.

This information can help you troubleshoot issues and open support tickets. You can also find your workspace name here. You need the workspace name to configure your [proxy or firewall](configure-proxy.md#enable-access-to-defender-for-identity-service-urls-in-the-proxy-server).

<a name="see-also"></a>
## Related content

- [Defender for Identity prerequisites](prerequisites.md)
- [Microsoft Defender for Identity community forum](<https://aka.ms/MDIcommunity>)

