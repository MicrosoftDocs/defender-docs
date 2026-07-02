---
title: Predefined app policies
ms.date: 06/16/2026
ms.topic: how-to
description: Learn how predefined app governance policies detect anomalous app behavior by default and how to review or deactivate them.
ms.reviewer: anandd512
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
ai-usage: ai-assisted
---

# Use predefined app policies in app governance

App governance contains a set of out of the box policies to detect anomalous app behaviors. These policies are activated by default, but you can deactivate these policies if you choose to.<br>
<br>

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=22872b35-18aa-424d-bec7-3f77869a5e47]

## Working with predefined policies

You can view, manage, and configure predefined policies in App governance by using the following options:

- To view available predefined policies, go to **Microsoft Defender XDR** > **App governance** > **Overview** and select **View predefined policies** in the **Predefined policies** section.  

    ![Screenshot showing the View predefined policies option in the Predefined policies section.](media/app-governance/predefined-policies.png)

- Alternatively, to view available predefined policies, go to **Microsoft Defender XDR** > **App governance** > **Policies**  and filter for **Source: Predefined** to see the list of available predefined policies.

    ![Screenshot showing the Source: Predefined filter applied to the Policies page.](media/app-governance/source-predefined.png)

- To view the description of the policy, select the policy to see the policy summary and description in the detailed policy window.
- To change the status of a policy (deactivate / activate), select the policy and select **Deactivate** in the detailed policy window.
- By default, predefined policies trigger alerts when their configured conditions are met. You can choose to automatically disable the app when the policy triggers. Use caution when applying these actions because a policy may affect users and legitimate app use. To disable the app, mark the **Disable app** box under **Policy action** in the summary section and select **Save**.
- Alerts generated from predefined policies are listed as app governance policy alerts in the Microsoft Defender XDR alerts queue.

<a name="next-steps"></a>
## Related content

- [Create an app policy](app-governance-app-policies-create.md)
