---
title: Defender for Office 365 Overview dashboard
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
description: Admins can learn about the information on the Microsoft Defender for Office 365 Overview dashboard in the Microsoft Defender portal.
ms.custom:
ms.service: defender-office-365
ms.date: 08/01/2025
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
---

# The Microsoft Defender for Office 365 Overview dashboard

The Microsoft Defender for Office 365 Overview dashboard in the Microsoft Defender portal shows the effectiveness of Defender for Office 365. You open the dashboard in the [Defender portal](https://security.microsoft.com) at **Email & collaboration** \> **Overview**, or directly at <https://security.microsoft.com/emailandcollaborationoverviewreport>.

The information on the **Overview** page is organized into the following areas:

- [Defender for Office 365 summary](#defender-for-office-365-summary)
- [Optimize section](#optimize-section)
- [Risky allows section](#risky-allows-section)
- [Insights section](#insights-section)

For the permissions required to view the dashboard and reports, see [What permissions are needed to view these reports?](reports-email-security.md#what-permissions-are-needed-to-view-these-reports).

By default, the data on the page is shown for the last 30 days.

:::image type="content" source="media/email-collab-overview.png" alt-text="Screenshot of the Email and collaboration overview report page in the Microsoft Defender portal." lightbox="media/email-collab-overview.png":::

## Defender for Office 365 summary

The information in the **Defender for Office 365** summary at the top of the page is described in the following subsections.

<a name='efficacy-card'></a>

### Phish / Malware Efficacy card

<!--- https://go.microsoft.com/fwlink/?linkid=2324012 --->

The graph on the **Phish / Malware Efficacy** card visually represents the protection given by Defender for Office 365 against phishing and malware in email messages:

- **Pre-delivery**: Items detected before they reach the recipient's mailbox.
- **Post-delivery**: Items removed after the item was delivered to the recipient's mailbox via [zero-hour auto purge (ZAP)](zero-hour-auto-purge.md).
- **Uncaught**: Delivered items that ZAP identified but failed to remove. For example:
  - Admin deletions or remediations.
  - ZAP being disabled for the specific mailboxes.
  - [Admin submissions](submissions-admin.md) to Microsoft identifying the message as malware or phishing.
  - User deletions.
  - Non-Microsoft security provider deletions.

The percentage value is the number of messages in each category divided by the total number of malicious malware and phishing email during the review period selected.

Hover over a category in the chart to see the number of messages in each category for the review period. Hover over the percentage to see the total number of messages

:::image type="content" source="media/email-collab-overview-mdo-efficacy.png" alt-text="Screenshot of the Phish / Malware Efficacy card in the Defender for Office 365 section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-mdo-efficacy.png":::

> [!TIP]
>
> - It's important to submit false positives and false negatives to Microsoft so we can tune our filters and correctly calculate the efficacy values:
>   - False negatives undetected by Microsoft aren't included in the efficacy calculations. Submitting undetected entities enables us to include those counts in the **Uncaught** calculations.
>   - False positives detected by Microsoft are removed from the efficacy calculations.
>
> Based on customer feedback, we determined the **Pre-delivery**, **Post-delivery**, and **Uncaught** components most accurately reflect an organization's protection state. To create a different efficacy report, see [Build custom email security reports and dashboards with workbooks in Microsoft Sentinel](https://techcommunity.microsoft.com/blog/microsoftdefenderforoffice365blog/build-custom-email-security-reports-and-dashboards-with-workbooks-in-microsoft-s/4352242) or the advanced hunting query in the [Appendix](#appendix-advanced-hunting-efficacy-query-in-defender-for-office-365-plan-2) section.

### Threat detections card

<!--- https://go.microsoft.com/fwlink/?linkid=2323912 --->

The graph on the **Threat detections** card shows the number of messages detected by the following technologies during the review period selected.

- **Malware**: The breakdown of detection technologies is available in the **Threat protection status** report under [View data by Email \> Malware and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--malware-and-chart-breakdown-by-detection-technology).

- **Phish**: The breakdown of detection technologies is available in the **Threat protection status** report under [View data by Email \> Phish and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--phish-and-chart-breakdown-by-detection-technology).

- **Spam**:  The breakdown of detection technologies is available in the **Threat protection status** report under [View data by Email \> Spam and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--spam-and-chart-breakdown-by-detection-technology).

- **Impersonation**: Email detected as one of the following threats:
  - **Impersonation brand**
  - **Impersonation user**
  - **Impersonation domain**
  - **Mailbox intelligence impersonation**

   The breakdown of detections is available in the **Threat protection status** report user [View data by Email \> Phish and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--phish-and-chart-breakdown-by-detection-technology).

- **Detonation**: Messages detected by opening files and URLs in a virtual environment (_detonation_) by [Safe Links](safe-links-about.md) and [Safe Attachments](safe-attachments-about.md) in Defender for Office 365. The breakdown of detection technologies is available in the **Threat protection status** report under:
  - [View data by Email \> Malware and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--malware-and-chart-breakdown-by-detection-technology)
  - [View data by Email \> Phish and Chart breakdown by Detection Technology](reports-email-security.md#view-data-by-email--phish-and-chart-breakdown-by-detection-technology).
- **Zap**: Harmful email messages detected and removed after delivery by [zero-hour auto purge (ZAP)](zero-hour-auto-purge.md). More information is available in the [Post-delivery activities](reports-email-security.md#post-delivery-activities-report) report.

- **Non-Microsoft Solutions**: Detections by non-Microsoft solutions.

Hover over a category in the chart to see the number of messages in each category for the review period.

:::image type="content" source="media/email-collab-overview-mdo-threat-detections.png" alt-text="Screenshot of the Threat detections card in the Defender for Office 365 section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-mdo-threat-detections.png":::

## Optimize section

The information in the **Optimize** section is described in the following subsections.

### Priority accounts card

<!--- https://go.microsoft.com/fwlink/?linkid=2323312 --->

The graph on the **Priority accounts** card shows how many message senders you designated as priority accounts to receive tailored protection. For more information about priority accounts, see [Manage and monitor priority accounts](/microsoft-365/admin/setup/priority-accounts).

To designate more accounts, select **Add employees** to go to the **Priority accounts** page in the Microsoft 365 admin center at <https://admin.cloud.microsoft/?#/priorityaccounts>.

<!---https://go.microsoft.com/fwlink/?linkid=2324017> --->

Hover over a category in the chart to see the number of **Onboarded** priority accounts and **Open slots**. The maximum number of priority accounts is 250.

:::image type="content" source="media/email-collab-overview-optimize-priority-accounts.png" alt-text="Screenshot of the Priority accounts card in the Optimize section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-optimize-priority-accounts.png":::

### Posture recommendations card

<!--- https://go.microsoft.com/fwlink/?linkid=2323914 --->

The graph on the **Policy recommendations** card shows the number of users directly protected by [Safe Links](safe-links-about.md) and [Safe Attachments](safe-attachments-about.md) policies as a percentage of the total number of users (the value 100% means everyone is protected). The numbers are taken from whether the following recommended actions in [Microsoft Secure Score](/defender-xdr/microsoft-secure-score) have the **Status** value `Completed`:

- <u>Safe Links</u>: **Create Safe Links policies for email messages**
- <u>Safe Attachments</u>: **Ensure Safe Attachments policy is enabled**

Hover over a category in the chart to see the number of **Impacted users** (the total number of users in the organization) and **Protected users** (users protected by Safe Links or Safe Attachment policies as defined by the recommended actions in Microsoft Secure Score).

**Notes**:

- The [Built-in protection](preset-security-policies.md) preset security policy gives a basic level of Safe Links and Safe Attachments protection to all users by default (and you can [exclude recipients](preset-security-policies.md#use-the-microsoft-defender-portal-to-add-exclusions-to-the-built-in-protection-preset-security-policy)).
- Users get a higher level of Safe Links and Safe Attachments protection from either of the following settings:
  - [Turn on the Standard or Strict preset security policies](preset-security-policies.md#use-the-microsoft-defender-portal-to-assign-standard-and-strict-preset-security-policies-to-users), and make sure the users are included in **Defender for Office 365 protection**.
  - Create custom [Safe Links policies](safe-links-policies-configure.md#use-the-microsoft-defender-portal-to-create-safe-links-policies) or [Safe Attachment policies](safe-attachments-policies-configure.md#use-the-microsoft-defender-portal-to-create-safe-attachments-policies) with the users as members.

:::image type="content" source="media/email-collab-overview-optimize-posture-recommendations.png" alt-text="Screenshot of the Posture recommendations card in the Optimize section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-optimize-posture-recommendations.png":::

## Risky allows section

The information in the **Risky allows** section is described in the following subsections.

### Messages allowed card

The **Messages allowed** card shows the count of messages allowed by user or organization [allow entries](create-safe-sender-lists-in-office-365.md) that bypass protection:

- The total number of messages allowed.
- **Phish** messages allowed.
- **Spam** messages allowed.
- **Good** messages allowed.

:::image type="content" source="media/email-collab-overview-risky-allows-messages-allowed.png" alt-text="Screenshot of the Messages allowed card in the Risky allows section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-risky-allows-messages-allowed.png":::

### Tenant allow types card

The **Tenant allow types** card shows a table with the types of allow entries in the Tenant Allow/Block List that let bad mail get delivered to user mailboxes:

- **Allow type** column:
  - [URL](tenant-allow-block-list-urls-configure.md#create-allow-entries-for-urls)
  - [File hash](tenant-allow-block-list-files-configure.md#create-allow-entries-for-files)
  - [Sender](tenant-allow-block-list-email-spoof-configure.md#create-allow-entries-for-domains-and-email-addresses)
  - [IP allow](tenant-allow-block-list-ip-addresses-configure.md#create-allow-entries-for-ipv6-addresses)
- **Messages allowed** column: The number of messages allowed for the review period selected.

:::image type="content" source="media/email-collab-overview-risky-allows-tenant-allow-types.png" alt-text="Screenshot of the Tenant allow types card in the Risky allows section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-risky-allows-tenant-allow-types.png":::

### Exchange transport rules card

<!--- https://go.microsoft.com/fwlink/?linkid=2324013 --->

The **Exchange transport rules** card shows the mail flow rules (also known as transport rules) that allowed messages that would otherwise be blocked:

- **Rule ID**
- **Messages allowed**: The number of messages allowed during the review period selected.

Select **Review rules** to go to the **Rules** page in the Exchange admin center (EAC) at <https://admin.cloud.microsoft/exchange#/transportrules>.

:::image type="content" source="media/email-collab-overview-risky-allows-etrs.png" alt-text="Screenshot of the Exchange transport rules card in the Risky allows section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-risky-allows-etrs.png":::

## Insights section

The information in the **Insights** section is described in the following subsections.

### Top trending attacks card

The graph on the **Top trending attacks** card shows the most encountered phishing attack types by volume for the review period selected.

Threat classification in Defender for Office 365 uses advanced technologies such as large language models (LLMs), small language models (SLMs), and machine learning (ML) models to automatically detect and classify email-based threats.

The breakdown of phishing attack types is also available in the **Threat protection status** report under [View data by Email \> Phish and Chart breakdown by Threat classification](reports-email-security.md#view-data-by-email--phish-and-chart-breakdown-by-threat-classification-defender-for-office-365).

:::image type="content" source="media/email-collab-overview-insights-top-trending-attacks.png" alt-text="Screenshot of the Top trending attacks card in the Insights section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-insights-top-trending-attacks.png":::

### Emerging threats card

The **Emerging threats** card shows any notable campaigns observed by Microsoft security researchers.

### Microsoft 365 Secure Email Gateway performance card

<!--- https://go.microsoft.com/fwlink/?linkid=2324014 --->

The graph on the **Microsoft 365 Secure Email Gateway performance** card compares the effectiveness of Defender for Office 365 against other secure email gateways. To ensure fairness, the number of missed phish and malware messages is normalized per 1,000 active users.

:::image type="content" source="media/email-collab-overview-insights-m365-secure-email-gateway.png" alt-text="Screenshot of the Microsoft 365 Secure Email Gateway performance card in the Insights section of the Email & collaboration overview report page." lightbox="media/email-collab-overview-insights-m365-secure-email-gateway.png":::

## Appendix: Advanced hunting efficacy query in Defender for Office 365 Plan 2

Organizations with Defender for Office 365 Plan 2 can use the following query in [advanced hunting](/defender-xdr/advanced-hunting-overview) to generate the same data on the [**Phish / Malware Efficacy** card](#phish--malware-efficacy-card).

> [!NOTE]
> The numbers might differ slightly due to the different refresh and expiry rates for advanced hunting vs. reporting data.

```kusto
let _startTime = ago(30d); 
let _endTime = now(); 
let PreDelivery = toscalar(
    EmailEvents 
    | where Timestamp between (_startTime .. _endTime) 
        and EmailDirection == "Inbound" 
        and (ThreatTypes contains "Phish" or ThreatTypes contains "Malware")
    | where not(DeliveryAction == "Blocked" and DeliveryLocation in ("Dropped","Failed"))
    | extend MDO_detection = parse_json(DetectionMethods) 
    | extend FirstDetection = iif(isempty(MDO_detection), "Clean", tostring(bag_keys(MDO_detection)[0])) 
    | extend FirstSubcategory = iif(FirstDetection != "Clean" and array_length(MDO_detection[FirstDetection]) > 0, strcat(FirstDetection, ": ", tostring(MDO_detection[FirstDetection][0])), "No Detection (clean)") 
    | summarize PreDelivery = count()
); 
let PostDelivery = toscalar(
    EmailPostDeliveryEvents 
    | where Timestamp between (_startTime .. _endTime)
        and ActionType in ("Malware ZAP","Phish ZAP") 
        and ActionResult in ("Success","UserTriaged")
    | summarize PostDelivery = count()
); 
let Uncaught = toscalar(
    EmailPostDeliveryEvents 
    | where Timestamp between (_startTime .. _endTime)
        and ActionType in ("Malware ZAP","Phish ZAP") 
        and ActionResult !in ("Success", "UserTriaged")
    | summarize Uncaught = count()
); 
let PreDeliveryReal = toreal(PreDelivery);
let PostDeliveryReal = toreal(PostDelivery);
let UncaughtReal = toreal(Uncaught);
let Effectiveness = round(
    iif(
        (PreDeliveryReal + PostDeliveryReal + UncaughtReal) == 0, 
        0.0, 
        ((PreDeliveryReal + PostDeliveryReal) / (PreDeliveryReal + PostDeliveryReal + UncaughtReal)) * 100.0
    ), 2
);
union 
    (print StatisticName = "Pre-Delivery Catch", Value = PreDeliveryReal),
    (print StatisticName = "Post-Delivery Catch", Value = PostDeliveryReal),
    (print StatisticName = "Failed ZAP / Miss or Uncaught", Value = UncaughtReal),
    (print StatisticName = "Phish / Malware Efficacy", Value = Effectiveness)
| project StatisticName, Value
```
