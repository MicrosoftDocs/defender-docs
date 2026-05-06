---
title: Detection exclusions in Microsoft Defender XDR
description: Learn how to configure Microsoft Defender for Identity detection exclusions in Microsoft Defender XDR.
ms.date: 04/05/2026
ms.topic: how-to
ms.reviewer: LiorShapiraa
---

# Configure Defender for Identity detection exclusions in Microsoft Defender XDR

This article explains how to configure [Microsoft Defender for Identity](/defender-for-identity) detection exclusions in [Microsoft Defender XDR](/microsoft-365/security/defender/overview-security-center).

Microsoft Defender for Identity enables the exclusion of specific IP addresses, computers, domains, or users from a number of detections.

For example, a **DNS Reconnaissance** alert could be triggered by a security scanner that uses DNS as a scanning mechanism. Creating an exclusion helps Microsoft Defender for Identity ignore such scanners and reduce false positives.

> [!NOTE]
> - We recommend you to [Tune an alert](/microsoft-365/security/defender/investigate-alerts#tune-an-alert) instead of using exclusions. Alert tuning rules allow more granular conditions than exclusions, and allow you to review the alerts, which were tuned.
> 
>- Among the most common domains with [Suspicious communication over DNS](other-alerts.md#suspicious-communication-over-dns-external-id-2031) alerts, we observed the domains that were most frequently excluded from the alert. These domains are added to the exclusions list by default, but you have the option to remove them.

## How to add detection exclusions

> [NOTE!]
> When replacing an existing exclusion with an alert tuning rule, identify the detection associated with the excluded entity and map it to the corresponding detector in alert tuning. After creating the tuning rule, verify that the detector appears under Alert tuning in the Microsoft Defender portal to ensure that the intended alert scope is preserved.


1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/)
1.  Go to **System** > **Settings** and then **Identities**.

    :::image type="content" source="media/detect-exclusions/settings-identities.png" alt-text="Screenshot that shows the identities settings page in the Microsoft Defender portal.":::
   
1. Select **Excluded entities**. You can set exclusions using two methods: **Exclusions by detection rule** and **Global excluded entities**.

    :::image type="content" source="media/detect-exclusions/excluded-entities.png" alt-text="Screenshot of the excluded entities list.":::


## Exclusions by detection rule

1. Select **Exclusions by detection rule**. 

    :::image type="content" source="media/detect-exclusions/exclusions-by-detection-rule.png" alt-text="Screenshot of the exclusions by detection rule option.":::
   
1. For each detection you want to configure, do the following steps:

   1. Select a detection rule from the list. 
   1. View the detection rule details.

       :::image type="content" source="media/detect-exclusions/detection-rule-details.png" alt-text="Screenshot of the detection rule details.":::
   
    1. To add an exclusion, select the **Excluded entities** button.
    1. Choose the exclusion type. Different excluded entities are available for each rule. They include users, devices, domains, and IP addresses. In this example, the choices are **Exclude devices** and **Exclude IP addresses**.

        :::image type="content" source="media//detect-exclusions/exclude-devices-or-ip-addresses.png" alt-text="Screenshot showing the options to exclude devices or IP addresses.":::

    1. After choosing the exclusion type, select the **+** button to add the exclusion.

        :::image type="content" source="media/detect-exclusions/add-exclusion.png" alt-text="Screenshot of the add exclusion button.":::

    1. Select **+ Add** to add the excluded entity to the list.

        :::image type="content" source="media/detect-exclusions/add-excluded-entity.png" alt-text="Screenshot showing how to add an entity to be excluded.":::

    1. Select **Exclude IP addresses** (in this example) to complete the exclusion.

        :::image type="content" source="media//detect-exclusions/exclude-ip-addresses.png" alt-text="Screenshot showing the exclusion of IP addresses.":::

    1. Once you've added exclusions, you can export the list or remove the exclusions by returning to the **Excluded entities** button. In this example, we've returned to **Exclude devices**. To export the list, select the down arrow button.

        :::image type="content" source="media//detect-exclusions/return-to-exclude-devices.png" alt-text="Screenshot showing how to return to exclude devices.":::

    1. To delete an exclusion, select the exclusion and select the trash icon.

        :::image type="content" source="media//detect-exclusions/delete-exclusion.png" alt-text="Screenshot showing how to delete an exclusion.":::

## Global excluded entities

You can now also configure exclusions by **Global excluded entities**. Global exclusions allow you to define certain entities (IP addresses, subnets, devices, or domains) to be excluded across all of the detections Microsoft Defender for Identity has. So for example, if you exclude a device, it will only apply to those detections that have device identification as part of the detection.

1. Select **Global excluded entities** to see the categories of entities that you can exclude.

    :::image type="content" source="media//detect-exclusions/global-excluded-entities.png" alt-text="Screenshot showing the global excluded entities.":::
   
1. Choose an exclusion type. In this example, we selected **Exclude domains**.

    :::image type="content" source="media//detect-exclusions/exclude-domains.png" alt-text="Screenshot showing the option to exclude domains.":::
   
1. A pane opens where you can add a domain to be excluded. Add the domain you want to exclude.

    :::image type="content" source="media//detect-exclusions/add-excluded-domain.png" alt-text="Screenshot showing how to add a domain to be excluded.":::
   
1. The domain is added to the list. Select **Exclude domains** to complete the exclusion.

    :::image type="content" source="media//detect-exclusions/select-exclude-domains.png" alt-text="Screenshot showing how to exclude domains.":::
   
1. You'll then see the domain in the list of entities to be excluded from all detection rules. You can export the list, or remove the entities by choosing them and selecting the **Remove** button.

    :::image type="content" source="media//detect-exclusions/global-excluded-entries-list.png" alt-text="Screenshot showing the list of global excluded entries.":::
   
## Next steps

- [Configure event collection](deploy/configure-event-collection.md)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
