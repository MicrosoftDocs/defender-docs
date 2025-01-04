---
title: "What's new in the Microsoft's unified SecOps platform"
description: Lists the new features and functionality in the Microsoft unified security operations platform
search.appverid: met150
ms.service: unified-secops-platform
ms.author: cwatson
author: cwatson-cat
ms.localizationpriority: medium
ms.date: 12/10/2024
manager: dansimp
audience: ITPro
ms.collection:
- M365-security-compliance
- tier1
- usx-security
ms.topic: concept-article
---

# What's new in Microsoft's unified security operations platform

This article lists recent features added into Microsoft's unified SecOps platform within the Microsoft Defender portal, and new features in related services that provide an enhanced user experience in the platform.

## December 2024

- [New SOC optimization recommendations based on similar organizations (Preview)](#new-soc-optimization-recommendations-based-on-similar-organizations-preview)
- [Microsoft Sentinel workbooks now available to view directly in the Microsoft Defender portal](#microsoft-sentinel-workbooks-now-available-to-view-directly-in-the-microsoft-defender-portal)

### New SOC optimization recommendations based on similar organizations (Preview)

SOC optimizations now include new recommendations for adding data sources to your workspace based on the security posture of other organizations in similar industries and sectors as you, and with similar data ingestion patterns.
	
For more information, see [SOC optimization reference of recommendations](/azure/sentinel/soc-optimization/soc-optimization-reference).

### Microsoft Sentinel workbooks now available to view directly in the Microsoft Defender portal

Microsoft Sentinel workbooks are now available for viewing directly in the Microsoft Defender portal with Microsoft's unified security operations (SecOps) platform. Now, in the Defender portal, when you select **Microsoft Sentinel > Threat management > Workbooks**, you remain in the Defender portal instead of a new tab being opened for workbooks in the Azure portal. Continue tabbing out to the Azure portal only when you need to edit your workbooks.

Microsoft Sentinel workbooks are based on Azure Monitor workbooks, and help you visualize and monitor the data ingested to Microsoft Sentinel. Workbooks add tables and charts with analytics for your logs and queries to the tools already available.

For more information, see [Visualize and monitor your data by using workbooks in Microsoft Sentinel](/azure/sentinel/monitor-your-data) and [Connect Microsoft Sentinel to Microsoft Defender XDR](/defender-xdr/microsoft-sentinel-onboard).

## November 2024

- [Microsoft Sentinel availability in Microsoft Defender portal](#microsoft-sentinel-availability-in-microsoft-defender-portal)
- [Feature availability for Government clouds](#feature-availability-for-government-clouds)

### Microsoft Sentinel availability in Microsoft Defender portal

We previously announced Microsoft Sentinel is generally available within Microsoft's unified security operations platform in the Microsoft Defender portal. For preview, Microsoft Sentinel is now available in the Defender portal without Microsoft Defender XDR or an E5 license. For more information, see:

 - [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal)
 - [Connect Microsoft Sentinel to the Microsoft Defender portal](/defender-xdr/microsoft-sentinel-onboard)

### Feature availability for Government clouds

In the Defender portal, all Microsoft Sentinel features for unified SecOps that are in general availability are now available in both commercial and GCC High and DoD clouds. Features still in preview are available only in the commercial cloud.

For more information, see [Microsoft Sentinel feature support for Azure commercial/other clouds](/azure/sentinel/feature-availability#experience-in-the-defender-portal) and [Microsoft Defender XDR for US Government customers](/defender-xdr/usgov).

## Related content

For more information on what's new with other Microsoft Defender security products and Microsoft Sentinel, see:

- [What's new in Microsoft Sentinel](/azure/sentinel/whats-new)
- [What's new in Microsoft Defender XDR](/defender-xdr/whats-new)
- [What's new in Microsoft Defender for Office 365](/defender-office-365/defender-for-office-365-whats-new)
- [What's new in Microsoft Defender for Endpoint](/defender-endpoint/whats-new-in-microsoft-defender-endpoint)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)
- [What's new in Microsoft Defender for Cloud Apps](/cloud-app-security/release-notes)

You can also get product updates and important notifications through the [message center](https://admin.microsoft.com/Adminportal/Home#/MessageCenter).
