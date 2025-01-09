---
title: Microsoft Defender for Identity security alerts in Microsoft Defender XDR
description: Learn how to manage and review security alerts issued by Microsoft Defender for Identity in Microsoft Defender XDR
ms.date: 04/16/2023
ms.topic: how-to
---

# Investigate Defender for Identity security alerts in Microsoft Defender XDR

> [!NOTE]
> Defender for Identity is not designed to serve as an auditing or logging solution that captures every single operation or activity on the servers where the sensor is installed. It only captures the data required for its detection and recommendation mechanisms.

This article explains the basics of how to work with Microsoft Defender for Identity security alerts in [Microsoft Defender XDR](/microsoft-365/security/defender/overview-security-center).

Defender for Identity alerts are natively integrated into Microsoft Defender XDR with a dedicated Identity alert page format.

The Identity alert page gives Microsoft Defender for Identity customers better cross-domain signal enrichment and new automated identity response capabilities. It ensures that you stay secure and helps improve the efficiency of your security operations.

One of the benefits of investigating alerts through [Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-defender) is that Microsoft Defender for Identity alerts are further correlated with information obtained from each of the other products in the suite. These enhanced alerts are consistent with the other Microsoft Defender XDR alert formats originating from [Microsoft Defender for Office 365](/microsoft-365/security/office-365-security) and [Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint). The new page effectively eliminates the need to navigate to another product portal to investigate alerts associated with identity.

Alerts originating from Defender for Identity can now trigger the [Microsoft Defender XDR automated investigation and response (AIR)](/microsoft-365/security/defender/m365d-autoir) capabilities, including automatically remediating alerts and the mitigation of tools and processes that can contribute to the suspicious activity.

> [!IMPORTANT]
> As part of the convergence with Microsoft Defender XDR, some options and details have changed from their location in the Defender for Identity portal. Please read the details below to discover where to find both the familiar and new features.

## Review security alerts

Alerts can be accessed from multiple locations, including the **Alerts** page, the **Incidents** page, the pages of individual **Devices**, and from the **Advanced hunting** page. In this example, we'll review the **Alerts page**.

In [Microsoft Defender XDR](https://security.microsoft.com), go to **Incidents & alerts** and then to **Alerts**.

:::image type="content" source="media/incidents-alerts.png" alt-text="The Alerts menu item" lightbox="media/incidents-alerts.png":::

To see alerts from Defender for Identity, on the top-right select **Filter**, and then under **Service sources** select **Microsoft Defender for Identity**, and select **Apply**:

:::image type="content" source="media/filter-defender-for-identity.png" alt-text="The filter for the Defender for Identity events" lightbox="media/filter-defender-for-identity.png":::

The alerts are displayed with information in the following columns: **Alert name**, **Tags**, **Severity**, **Investigation state**, **Status**, **Category**, **Detection source**, **Impacted assets**, **First activity**, and **Last activity**.

:::image type="content" source="media/filtered-alerts.png" alt-text="The Defender for Identity events" lightbox="media/filtered-alerts.png":::

### Security alert categories

Defender for Identity security alerts are divided into the following categories or phases, like the phases seen in a typical cyber-attack kill chain.

- [Reconnaissance alerts](reconnaissance-alerts.md)
- [Compromised credential alerts](compromised-credentials-alerts.md)
- [Lateral movement alerts](lateral-movement-alerts.md)
- [Domain dominance alerts](domain-dominance-alerts.md)
- [Exfiltration alerts](exfiltration-alerts.md)

## Manage alerts

If you select the **Alert name** for one of the alerts, you'll go to the page with details about the alert. In the left pane, you'll see a summary of **What happened**:

:::image type="content" source="media/what-happened.png" alt-text="The What happened pane" lightbox="media/what-happened.png":::

Above the **What happened** box are buttons for the **Accounts**, **Destination Host** and **Source Host** of the alert. For other alerts, you might see buttons for details about additional hosts, accounts, IP addresses, domains, and security groups. Select any of them to get more details about the entities involved.

On the right pane, you'll see the **Alert details**. Here you can see more details and perform several tasks:

- **Classify this alert** - Here you can designate this alert as a **True alert** or **False alert**

    :::image type="content" source="media/classify-alert.png" alt-text="The page on which you can classify an alert" lightbox="media/classify-alert.png":::

- **Alert state** - In **Set Classification**, you can classify the alert as **True** or **False**. In **Assigned to**, you can assign the alert to yourself or unassign it.

    :::image type="content" source="media/alert-state.png" alt-text="The Alert state pane" lightbox="media/alert-state.png":::

- **Alert details** - Under **Alert details**, you can find more information about the specific alert, follow a link to documentation about the type of alert, see which incident the alert is associated with, review any automated investigations linked to this alert type, and see the impacted devices and users.

   :::image type="content" source="media/alert-details.png" alt-text="The Alert details page" lightbox="media/alert-details.png":::

- **Comments & history** - Here you can add your comments to the alert, and see the history of all actions associated with the alert.

    :::image type="content" source="media/comments-history.png" alt-text="The Comments & history page" lightbox="media/comments-history.png":::

- **Manage alert** - If you select **Manage alert**, you'll go to a pane that will allow you to edit the:
  - **Status** - You can choose **New**, **Resolved** or **In progress**.
  - **Classification** - You can choose **True alert** or **False alert**.
  - **Comment** - You can add a comment about the alert.

  - If you select the three dots next to **Manage alert**, you can **Link alert to another incident**, **Create suppression rule** (available for preview customers only), or **Ask Defender Experts**.

    :::image type="content" source="media/manage-alert.png" alt-text="The Manage alert option" lightbox="media/manage-alert.png":::

    You can also export the alert to an Excel file. To do this, select **Export.**

    > [!NOTE]
    > In the Excel file, you now have two links available: **View in Microsoft Defender for Identity** and **View in Microsoft Defender XDR**. Each link will bring you to the relevant portal, and provide information about the alert there.

## Tuning alerts

Tune your alerts to adjust and optimize them, reducing false positives. Alert tuning allows your SOC teams to focus on high-priority alerts and improve threat detection coverage across your system. In Microsoft Defender XDR, create rule conditions based on evidence types, and then apply your rule on any rule type that matches your conditions. 

For more information, see [Tune an alert](/microsoft-365/security/defender/investigate-alerts#tune-an-alert).

## See also

- [Microsoft Defender for Identity Security Alerts](alerts-overview.md)

## Learn more

- Try our interactive guide: [Detect suspicious activities and potential attacks with Microsoft Defender for Identity](https://mslearn.cloudguides.com/guides/Detect%20suspicious%20activities%20and%20potential%20attacks%20with%20Microsoft%20Defender%20for%20Identity)



