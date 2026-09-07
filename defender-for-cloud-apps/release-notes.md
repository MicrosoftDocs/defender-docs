---
title: What's new | Microsoft Defender for Cloud Apps
description: This article is updated frequently to let you know what's new in the latest release of Microsoft Defender for Cloud Apps.
ms.date: 06/14/2026
ms.topic: overview
ms.custom:
  - sfi-ga-nochange
  - sfi-image-nochange
---

# What's new in Microsoft Defender for Cloud Apps

> *Applies to: Microsoft Defender for Cloud Apps*

This article is updated frequently to let you know what's new in the latest release of Microsoft Defender for Cloud Apps.

For more information on what's new with other Microsoft Defender security products, see:

- [What's new in Microsoft Defender XDR](/microsoft-365/security/defender/whats-new)
- [What's new in Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint/whats-new-in-microsoft-defender-endpoint)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)

For news about earlier releases, see [Archive of past updates for Microsoft Defender for Cloud Apps](release-note-archive.md).

## August 2026

### Unified RBAC is enabled by default for new Defender for Cloud Apps customers

Starting in August 2026, Microsoft Defender unified role-based access control (RBAC) is automatically enabled for **new** Defender for Cloud Apps customers. No manual workload activation is required.

Unified RBAC provides a centralized experience for managing roles and permissions across Microsoft Defender products. For more information, see [Microsoft Defender unified role-based access control](/defender-xdr/manage-rbac) and [Configure admin access in Defender for Cloud Apps](manage-admins.md).

## June 2026

### File policies retiring January 6, 2027

File-based data protection is moving from Defender for Cloud Apps to Microsoft Purview. File policies retire on **January 6, 2027**. Review your existing file policies and recreate them as Microsoft Purview DLP or auto-labeling policies before the retirement date. For detailed guidance, including parity gaps and governance action mapping, see [Migrate file policies to Microsoft Purview](migrate-file-policies-to-purview.md).

### Salesforce connector enhancements (Preview)

Modern Salesforce attacks increasingly abuse OAuth tokens, connected apps, sessions, and APIs, often bypassing MFA and traditional controls. The Salesforce connector for Microsoft Defender for Cloud Apps is now better equipped to detect these attacks. The connector ingests Salesforce Real-Time Event Monitoring data for near real-time detection of identity and OAuth threats with richer investigation context, and adds OAuth app governance for Salesforce Connected Apps and External Client Apps (ECAs).

We recommend that Salesforce administrators enable Real-Time Event Monitoring in the Salesforce console for the best detection coverage. Enabling it gives you better latency and more robust detections.

- **Real-time event monitoring**: When a Salesforce administrator enables **Storing data** for the relevant events in Salesforce Event Manager, the Salesforce connector ingests Salesforce Real-Time Event Monitoring data within minutes. This improves detection coverage for OAuth abuse, session hijacking, credential stuffing, and anomalous API activity, and the OAuth apps inventory includes Salesforce Connected Apps and External Client Apps (ECAs). For more information, see [Enable Salesforce real-time event monitoring](protect-salesforce.md#enable-salesforce-real-time-event-monitoring-preview).
- **Highly privileged and Unused app insights for Salesforce OAuth apps**: The OAuth apps tab on the [Application inventory](applications-inventory.md) now includes **Highly privileged apps** and **Unused apps** as actionable insights for Salesforce. These insights also contribute to the **Highly privileged** and **Unused** statistics on the **Non-human identities** tab of the [Identity inventory](/defender-for-identity/identity-inventory).
- **Permissions visible for Salesforce OAuth apps**: The **Permissions** list on the **App governance** page now includes Salesforce Connected Apps and External Client Apps (ECAs), so you can review the permissions granted to each Salesforce OAuth app. For more information, see [View your app details with app governance](app-governance-visibility-insights-view-apps.md).

## May 2026

### Disable informational alerts for unsanctioned app access (Preview)

You can now disable informational alerts generated when users access unsanctioned apps. A new **Generate alert for blocked app access** toggle in the Microsoft Defender for Endpoint settings lets you suppress these alerts while keeping blocking enforcement active. For more information, see [Disable informational alerts for unsanctioned app access](mde-govern.md#disable-informational-alerts-for-unsanctioned-app-access-preview).

## March 2026

### Updates to Secure Score category calculations for increased accuracy

To improve accuracy and better protect organizational identities, some security recommendations categorized as **Cloud apps** recommendations are now considered identity‑related and grouped under the **Identity** category. While the total Secure Score remains unchanged, individual identity and app scores may change.

## January 2026

### Workday connector updated to least-privilege permission model

The Workday connector now requires only “View” permissions to function. We have removed the “Modify” permission requirement to better align with the principle of least privilege. 
While existing configurations will continue to work, admins are encouraged to update the Workday account settings to remove these unnecessary rights as a security best practice. 

For more information see: [How Defender for Cloud Apps helps protect your Workday environment](protect-workday.md)

## December 2025

### Microsoft Defender for Cloud Apps permissions are now integrated with Microsoft Defender unified RBAC

[Integration of Microsoft Defender for Cloud Apps permissions with Microsoft Defender unified RBAC](/defender-xdr/whats-new-in-microsoft-defender-urbac#microsoft-defender-for-cloud-apps-permissions-are-now-integrated-with-microsoft-defender-xdr-unified-rbac) is now available worldwide.
For more information, see [Map Microsoft Defender for Cloud Apps permissions to the Microsoft Defender unified RBAC permissions](/defender-xdr/compare-rbac-roles#map-microsoft-defender-xdr-unified-rbac-permissions-to-existing-rbac-permissions). To activate the Defender for Cloud Apps workload, see [Activate Microsoft Defender unified RBAC](/defender-xdr/activate-defender-rbac).

### Increased availability of App governance unused app insights feature (Preview)

The Microsoft Defender for Cloud Apps app governance unused app insights feature helps administrators identify and manage unused Microsoft 365-connected OAuth apps, enforce policy-based governance, and use advanced hunting queries for better security. This feature is now available for most commercial cloud customers. For more information, see [Secure apps with app hygiene features](app-governance-secure-apps-app-hygiene-features.md).

## Next steps

- For a description of releases prior to those listed here, see [Archive of past updates for Microsoft Defender for Cloud Apps](release-note-archive.md)

[!INCLUDE [Open support ticket](includes/support.md)]


