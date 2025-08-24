---
title: Visualize security impact with the unified security summary
description: Learn how to use the unified security summary in the Microsoft Defender portal to visualize your security impact and achievements.
ms.service: defender-xdr
ms.localizationpriority: medium
audience: ITPro
author: diannegali
ms.author: diannegali
ms.date: 05/07/2025
manager: deniseb
ms.topic: how-to
ms.collection:
- m365-security
- tier2
search.appverid: met150
appliesto:
- Microsoft Defender XDR
#customer intent: As a SOC analyst, I want to know how to showcase security achievements and impact using data from the Microsoft Defender portal.
---
# Highlight security impact and achievements with the unified security summary

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Security operations center (SOC) teams can easily showcase their security achievements and the impact of Microsoft Defender using the unified security summary. Having the summary readily available in the Microsoft Defender portal streamlines the process for SOC teams to generate security reports, saving time usually spent on collecting data from various sources and creating reports tailored to their audiences. SOC teams can readily communicate performance and achievements to their stakeholders with the summary.

The unified security summary highlights the following information:

- **Posture**: Your organization’s posture includes data from [Microsoft Secure Score](microsoft-secure-score.md), threat protection information related to ransomware and phishing prevention, [exposure score](/defender-vulnerability-management/tvm-exposure-score) based on Microsoft Defender Vulnerability Management, and the number of onboarded devices to Microsoft Defender for Endpoint
  :::image type="content" source="/defender/media/security-summary/summary-posture-small.png" alt-text="Screenshot of the Posture section in the security summary report" lightbox="/defender/media/security-summary/summary-posture.png":::
- **Detection**: This section contains the number of [alerts and incidents](incidents-overview.md), including how many alerts were consolidated into incidents, the number of alerts grouped into incidents, and information on active detection rules and the corresponding response actions produced by those rules
  :::image type="content" source="/defender/media/security-summary/summary-detection-small.png" alt-text="Screenshot of the Detection section in the security summary report" lightbox="/defender/media/security-summary/summary-detection.png":::
- **Protection**: Cards under this section include data from Microsoft’s automatic investigation and response features like the total number of [attacks disrupted](automatic-attack-disruption.md), a list of the disruption incidents, the number of malicious activities blocked by Microsoft Defender Antivirus, and the number of malicious emails and URLs blocked
  :::image type="content" source="/defender/media/security-summary/summary-protection-small.png" alt-text="Screenshot of the Protection section in the security summary report" lightbox="/defender/media/security-summary/summary-protection.png":::
- **Investigation and response**: This section contains the number of active and resolved alerts and incidents, top 10 critical incidents with each incident’s status and affected number of assets, the number of [automated investigation and response actions](m365d-autoir.md) taken on impacted assets, and the number of email messages where malicious files were automatically identified and extracted through [Microsoft Defender for Office 365 Zero-hour auto purge (ZAP)](/defender-office-365/zero-hour-auto-purge)
  :::image type="content" source="/defender/media/security-summary/summary-investigation-small.png" alt-text="Screenshot of the Investigation and Response section in the security summary report" lightbox="/defender/media/security-summary/summary-investigation.png":::
- **Copilot-powered investigation and response**: This section contains the number of [analyzed files](copilot-in-defender-file-analysis.md) and [scripts](security-copilot-m365d-script-analysis.md) where Microsoft Copilot in Defender was used.
  :::image type="content" source="/defender/media/security-summary/summary-copilot-small.png" alt-text="Screenshot of the Copilot section in the security summary report" lightbox="/defender/media/security-summary/summary-copilot.png":::

SOC teams can use the unified security summary to highlight the impact of their day-to-day operations. They can also emphasize how Microsoft’s automated actions impact the efficient protection of their organization with features like automatic attack disruption stopping attacks before it becomes widespread.

## Prerequisites

> [!IMPORTANT]
> Data for the unified security summary is based on the Microsoft security products and services present in the organization. Data is limited only to the Microsoft products which the user has provisioned access to. For example, if the organization has Microsoft Defender for Endpoint and Microsoft Defender for Office 365, the summary will only show data from these two products.

Users must have the following permissions to view the unified security summary:

- Security data basics (read)
- Vulnerability management (read)

Additionally, users must have permissions to view all devices in the organization.

## View the unified security summary

To access and share the unified security summary, follow these steps:

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com).
2. In the navigation, select **Reports**. Under General, select **Unified security summary**.
3. The report page automatically generates data from the last 90 days by default. You can adjust the data to show the last 30 days if needed.
   :::image type="content" source="/defender/media/security-summary/duration-picker.png" alt-text="Screenshot highlighting the report data duration options in the security summary report":::
4. Once the summary is generated, you can check the details of each card under each section.
   > [!TIP]
   > Select a card's title to know more about each card. Selecting the title opens the related Microsoft documentation page.
5. You can export the summary as a PDF or CSV file. To export, select the dropdown menu on the upper right corner of the page and choose the format.
   :::image type="content" source="/defender/media/security-summary/export-picker.png" alt-text="Screenshot highlighting the export options in the security summary report":::
6. If you choose to export the summary as a PDF, an option to customize by adding a logo of your choice is available. Select **Upload** logo to do this. Otherwise, you can select **Generate PDF** to proceed exporting the summary to a PDF file.
   :::image type="content" source="/defender/media/security-summary/pdf-dialog.png" alt-text="Screenshot of the export to PDF dialog box":::
7. When exporting the summary as a CSV file, the file is automatically saved to your device as *Unified security summary_{date and time exported}.csv*. The file contains three columns for the card name, the field name in the card, and the value of the field. Here’s an example.
   :::image type="content" source="/defender/media/security-summary/csv-sample-values.png" alt-text="Screenshot of the CSV output of the security summary report":::

## Related content

- [Microsoft Defender Antivirus overview](/defender-endpoint/microsoft-defender-antivirus-windows)
- [Microsoft Copilot in Microsoft Defender](security-copilot-in-microsoft-365-defender.md)
