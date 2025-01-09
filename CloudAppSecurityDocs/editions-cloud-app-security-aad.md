---
title: Discovery capability differences for Defender for Cloud Apps and Cloud App Discovery
description: This article describes the differences between discovery capabilities in Defender for Cloud Apps and Cloud App Discovery (part of Microsoft Entra ID).
ms.date: 02/15/2023
ms.topic: overview
---

# Compare discovery capabilities for Defender for Cloud Apps and Cloud App Discovery?

This article describes the differences between discovery capabilities in Defender for Cloud Apps and Cloud App Discovery.

For information about licensing, see the [Microsoft 365 licensing datasheet](https://aka.ms/M365EnterprisePlans).

## Microsoft Defender for Cloud Apps

Microsoft Defender for Cloud Apps is a comprehensive cross-SaaS solution bringing deep visibility, strong data controls, and enhanced threat protection to your cloud apps. Cloud discovery is one of the features of Defender for Cloud Apps, which enables you to gain visibility into Shadow IT by discovering cloud apps in use.

## Cloud app discovery

Cloud app discovery comes at no additional cost as part of:

1. Microsoft Entra ID P1.
1. Enterprise Mobility + Security E3 (EMS E3).
1. Microsoft 365 E3.
    
This is a subset of Microsoft Defender for Cloud Apps. It includes cloud discovery capabilities that provide deeper visibility into cloud app usage in your organizations.

[Upgrade to Microsoft Defender for Cloud Apps](https://www.microsoft.com/security/business/cloud-apps-defender) to receive the full suite of Cloud Access Security Broker (CASB) capabilities offered by Microsoft Defender for Cloud Apps.

### Feature comparison

The following table is a comparison of the discovery capabilities in Defender for Cloud Apps and Cloud App Discovery.

|Capability|Feature|Microsoft Defender for Cloud Apps| Cloud App Discovery |
|----|----|----|----|
|Cloud discovery|Discovered apps|31,000 + cloud apps|31,000 + cloud apps|
||Deployment for discovery analysis|<li> Manual upload <br> <li> Automated upload - Log collector and API <br> <li> Native Defender for Endpoint integration |Manual and automatic log upload. [Learn more about setting up cloud discovery](set-up-cloud-discovery.md)|
||Log anonymization for user privacy|Yes|Yes|
||Access to full cloud app catalog|Yes|Yes|
||Cloud app risk assessment|Yes|Yes|
||Cloud usage analytics per app, user, IP address|Yes|Yes|
||Ongoing analytics & reporting|Yes|Yes|
||Custom policy creation |Yes|Yes|
||Anomaly detection for discovered apps|Yes||
|Information Protection|Data Loss Prevention (DLP) support|Cross-SaaS DLP and data sharing control||
||App permissions and ability to revoke access (OAuth apps)|Yes||
||Policy setting and enforcement|Yes||
||Integration with Microsoft Purview|Yes||
||Integration with third-party DLP solutions|Yes||
|Threat Detection|Anomaly detection and behavioral analytics|For Cross-SaaS apps||
||Manual and automatic alert remediation|Yes||
||SIEM connector|Yes. Alerts and activity logs for cross-SaaS apps.||
||Integration to Microsoft Intelligent Security Graph|Yes||
||Activity policies|Yes||

## Next steps

- Read about the basics in [Getting started with Defender for Cloud Apps](./get-started.md).

[!INCLUDE [Open support ticket](includes/support.md)]
