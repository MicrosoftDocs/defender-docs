---
title: Differences between Defender for Cloud Apps and Office 365 Cloud App Security
description: This article describes the differences between Defender for Cloud Apps and Office 365 Cloud App Security.
ms.date: 11/18/2024
ms.topic: overview
---
# Compare Microsoft Defender for Cloud Apps and Office 365 Cloud App Security

This article describes the differences between Defender for Cloud Apps and Office 365 Cloud App Security.

Both Microsoft Defender for Cloud Apps and Office 365 Cloud App Security are accessed through the Microsoft Defender portal. Depending on your license, you'll either have access to Office 365 Cloud App Security only or the entire Defender for Cloud Apps solution.

For more information, see the [Office 365 licensing datasheet](https://aka.ms/M365EnterprisePlans).

## Microsoft Defender for Cloud Apps

Microsoft Defender for Cloud Apps is a comprehensive cross-SaaS solution bringing deep visibility, strong data controls, and enhanced threat protection to your cloud apps. With this service, you can gain visibility into Shadow IT by discovering cloud apps in use. You can control and protect data in the apps once you sanction them to the service.

## Office 365 Cloud App Security

Office 365 Cloud App Security is a subset of Microsoft Defender for Cloud Apps that provides enhanced visibility and control for Office 365. 

Office 365 Cloud App Security includes threat detection based on user activity logs, discovery of Shadow IT for apps that have similar functionality to Office 365 offerings, control app permissions to Office 365, and apply access and session controls. Office 365 Cloud App Security has access to all of the features of Microsoft Defender for Cloud Apps, but supports only the Office 365 app connector.

### Feature support

|Capability|Feature|Microsoft Defender for Cloud Apps|Office 365 Cloud App Security|
|----|----|----|----|
|Cloud discovery|Discovered apps |31,000 + cloud apps  |750+ cloud apps with similar functionality to Office 365|
||Deployment for discovery analysis|<li> Manual upload <br> <li> Automated upload - Log collector and API <br> <li> Native Defender for Endpoint integration |Manual log upload|
||Log anonymization for user privacy|Yes||
||Access to full cloud app catalog|Yes||
||Cloud app risk assessment|Yes||
||Cloud usage analytics per app, user, IP address|Yes||
||Ongoing analytics & reporting|Yes||
||Anomaly detection for discovered apps|Yes||
|Information Protection|Data Loss Prevention (DLP) support|Cross-SaaS DLP and data sharing control|Uses existing Office DLP (available in Office E3 and above)|
||App permissions and ability to revoke access|Yes|Yes|
||Policy setting and enforcement|Yes||
||Integration with Microsoft Purview |Yes||
||Integration with third-party DLP solutions|Yes||
|Threat Detection|Anomaly detection and behavioral analytics|For Cross-SaaS apps including Office 365|For Office 365 apps |
||Manual and automatic alert remediation|Yes|Yes|
||SIEM connector|Yes. Alerts and activity logs for cross-SaaS apps.|For Office 365 alerts only|
||Integration to Microsoft Intelligent Security Graph|Yes|Yes|
||Activity policies|Yes|Yes|
|Conditional access app control|Real-time session monitoring and control|Any cloud and on-premises app|For Office 365 apps|
|Cloud Platform Security|Security configurations|For Azure, AWS, and GCP|For Azure|

## Next steps

Read about the basics in [Getting started with Defender for Cloud Apps](./get-started.md).

[!INCLUDE [Open support ticket](includes/support.md)]
