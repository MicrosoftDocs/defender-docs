---
title: Defender for Office 365 dashboard
f1.keywords:
  - CSH
ms.author: chrisda
author: chrisda
manager: deniseb
audience: ITPro
ms.topic: concept-article
ms.localizationpriority: medium
search.appverid:
  - MET150
  - MOE150
ms.assetid:
ms.collection:
  - m365-security
  - tier2
description: Admins can learn about the information on the Microsoft Defender for Office 365 dashboard in the Microsoft Defender portal.
ms.custom:
ms.service: defender-office-365
ms.date: 6/17/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# The Microsoft Defender for Office 365 dashboard

The Microsoft Defender for Office 365 dashboard in the Microsoft Defender portal shows the effectiveness of Defender for Office 365. You open the dashboard in the [Defender portal](https://security.microsoft.com) at **Email & collaboration** \> **Overview**, or directly at <https://security.microsoft.com/emailandcollaborationoverviewreport>.

The reports are divided into the following areas on the page:

- [Defender for Office 365 header](#defender-for-office-365-header)
- [Optimize section](#optimize-section)
- [Risky allows section](#risky-allows-section)
- [Compare solutions section](#compare-solutions-section)
- [Insights section](#insights-section)

For the permissions required to view the dashboard and reports, see [What permissions are needed to view these reports?](reports-email-security.md#what-permissions-are-needed-to-view-these-reports).

:::image type="content" source="media/email-collab-overview.png" alt-text="Screenshot of the Email and collaboration overview report page in the Microsoft Defender portal." lightbox="media/email-collab-overview.png":::
By default, the data on the page is shown for the last 30 days. But, you can show data for the last 60 days or the last 90 days by selecting the **Last 30 days** drop down at the top of the page.

## Defender for Office 365 header

The reports available in the **Defender for Office 365** header at the top of the page are described in the following subsections.

### Efficacy report

<!--- https://go.microsoft.com/fwlink/?linkid=2324012 --->

The **Efficacy** card visually represents the protection given by Defender for Office 365 against phishing and malware in email messages:

- **Pre-delivery**: Items detected before they reach the recipient's mailbox.
- **Post-delivery**: Items removed after the item was delivered to the recipient's mailbox via [zero-hour auto purge (ZAP)](zero-hour-auto-purge.md).
- **Uncaught**: Delivered items that ZAP identified but couldn't remove. For example:
  - Admin deletions or remediations.
  - [Admin submissions](submissions-admin.md) to Microsoft identifying the message as malware or phishing.
  - User deletions.
  - Non-Microsoft security provider deletions.

The percentage value shown is the number of messages in each category divided by the total number of total malicious malware and phishing email for the review period you selected at the top of the page (30 days (default), 60 days, or 90 days).

Hover over a category in the chart to see a breakdown of the number of messages in each category for the review period.

:::image type="content" source="media/email-collab-overview-mdo-efficacy.png" alt-text="Screenshot of the Efficacy card in the Defender for Office 365 section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-mdo-efficacy.png":::

> [!TIP]
> It's important that you report false negatives (undetected malicious entities) so we can tune our filters and correctly calculate 

### Threat detections report

<!--- https://go.microsoft.com/fwlink/?linkid=2323912 --->

:::image type="content" source="media/email-collab-overview-mdo-threat-detections.png" alt-text="Screenshot of the Threat detections card in the Defender for Office 365 section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-mdo-threat-detections.png":::

## Optimize section

The reports available in the **Optimize** section are described in the following subsections.

### Priority accounts report

<!--- https://go.microsoft.com/fwlink/?linkid=2323312 --->

:::image type="content" source="media/email-collab-overview-optimize-priority-accounts.png" alt-text="Screenshot of the Priority accounts card in the Optimize section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-optimize-priority-accounts.png":::

### Posture recommendations report

<!--- https://go.microsoft.com/fwlink/?linkid=2323914 --->

:::image type="content" source="media/email-collab-overview-optimize-posture-recommendations.png" alt-text="Screenshot of the Posture recommendations card in the Optimize section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-optimize-posture-recommendations.png":::

## Risky allows section

The reports available in the **Risky allows** section are described in the following subsections.

### Messages allowed report

:::image type="content" source="media/email-collab-overview-risky-allows-messages-allowed.png" alt-text="Screenshot of the Messages allowed card in the Risky allows section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-risky-allows-messages-allowed.png":::

### Tenant allow types report

:::image type="content" source="media/email-collab-overview-risky-allows-tenant-allow-types.png" alt-text="Screenshot of the Tenant allow types card in the Risky allows section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-risky-allows-tenant-allow-types.png":::

### Exchange transport rules report

:::image type="content" source="media/email-collab-overview-risky-allows-etrs.png" alt-text="Screenshot of the Exchange transport rules card in the Risky allows section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-risky-allows-etrs.png":::

## Compare solutions section

The reports available in the **Compare solutions** section are described in the following subsections.

### Email detections report

<!--- https://go.microsoft.com/fwlink/?linkid=2323918 --->

:::image type="content" source="media/email-collab-overview-compare-solutions-email-detections.png" alt-text="Screenshot of the Email detections card in the Compare solutions section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-compare-solutions-email-detections.png":::

email-collab-overview-compare-solutions-email-detections

### Non-Microsoft detections report

<!--- https://go.microsoft.com/fwlink/?linkid=2324014 --->

:::image type="content" source="media/email-collab-overview-compare-solutions-non-microsoft.png" alt-text="Screenshot of the Non-Microsoft detections card in the Compare solutions section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-compare-solutions-non-microsoft.png":::

## Insights section

The reports available in the **Insights** section are described in the following subsections.

### Top trending attacks report

:::image type="content" source="media/email-collab-overview-insights-top-trending-attacks.png" alt-text="Screenshot of the Top trending attacks card in the Insights section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-insights-top-trending-attacks.png":::

### Emerging threats report

### Microsoft 365 Secure Email Gateway performance report

<!--- https://go.microsoft.com/fwlink/?linkid=2324014 --->

:::image type="content" source="media/email-collab-overview-insights-m365-secure-email-gateway.png" alt-text="Screenshot of the Microsoft 365 Secure Email Gateway performance card in the Insights section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-insights-m365-secure-email-gateway.png":::
