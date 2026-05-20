---
title: What's new | Microsoft Defender for Cloud Apps
description: This article is updated frequently to let you know what's new in the latest release of Microsoft Defender for Cloud Apps.
ms.date: 05/20/2026
ms.topic: overview
---

# What's new in Microsoft Defender for Cloud Apps

> *Applies to: Microsoft Defender for Cloud Apps*

This article is updated frequently to let you know what's new in the latest release of Microsoft Defender for Cloud Apps.

For more information on what's new with other Microsoft Defender security products, see:

- [What's new in Microsoft Defender XDR](/microsoft-365/security/defender/whats-new)
- [What's new in Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint/whats-new-in-microsoft-defender-endpoint)
- [What's new in Microsoft Defender for Identity](/defender-for-identity/whats-new)

For news about earlier releases, see [Archive of past updates for Microsoft Defender for Cloud Apps](release-note-archive.md).

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

## November 2025

### AI Agent Protection (Preview)
Microsoft Defender delivers comprehensive protection for AI agents, combining proactive exposure management with advanced threat detection. It automatically discovers AI agents created in Microsoft Copilot Studio and Azure AI Foundry, collects audit logs, continuously monitors for suspicious activity, and integrates detections and alerts into the XDR Incidents and Alerts experience with a dedicated Agent entity.

- **Copilot Studio AI agents**

    Defender ingests data from Copilot Studio agents into Advanced Hunting, enabling you to create custom queries and proactively hunt for threats. It also provides real-time protection by monitoring agent runtime and blocking harmful or suspicious actions, fully integrated with XDR incidents and alerts.

  - **Azure AI Foundry AI agents**

    Defender monitors agents for misconfigurations and vulnerabilities, identifies potential attack paths, and delivers actionable security recommendations through Exposure Management to strengthen your AI security posture.

For more information, see [Protect your AI agents (Preview)](ai-agent-inventory.md).

## September 2025 

### Real time protection during agent runtime for Microsoft Copilot Studio AI agents (Preview)

Microsoft Defender offers real-time protection during runtime for AI agents built with Microsoft Copilot Studio. This capability automatically blocks the agent’s response during runtime if a suspicious behavior like a prompt injection attack is detected, and notifies security teams with a detailed alert in the Microsoft Defender portal.

For more information, see [Real-time protection during agent runtime for Microsoft Copilot Studio AI agents (Preview)](real-time-agent-protection-during-runtime.md).



## Next steps

- For a description of releases prior to those listed here, see [Archive of past updates for Microsoft Defender for Cloud Apps](release-note-archive.md)

[!INCLUDE [Open support ticket](includes/support.md)]


