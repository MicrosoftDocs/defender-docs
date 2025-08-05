---
title: Security alerts
description: This article provides a list of the security alerts issued by Microsoft Defender for Identity.
ms.date: 05/08/2025
ms.topic: reference
ms.reviewer: rlitinsky
---

# Security alerts in Microsoft Defender for Identity

## What are Microsoft Defender for Identity security alerts?

Microsoft Defender for Identity security alerts provide information about the suspicious activities detected by Defender for Identity, and the actors and computers involved in each threat. Alert evidence lists contain direct links to the involved users and computers, to help make your investigations easy and direct.

> [!NOTE]
> Defender for Identity isn't designed to serve as an auditing or logging solution that captures every single operation or activity on the servers where the sensor is installed. It only captures the data required for its detection and recommendation mechanisms.

The Identity alerts page gives you cross-domain signal enrichment and automated identity response capabilities. The benefit of investigating alerts with [Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-defender) is that Microsoft Defender for Identity alerts are correlated with information obtained from each of the other products in the suite. These enhanced alerts are consistent with the other Microsoft Defender XDR alert formats originating from [Microsoft Defender for Office 365](/microsoft-365/security/office-365-security) and [Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint).

Alerts originating from Defender for Identity trigger [Microsoft Defender XDR automated investigation and response (AIR)](/microsoft-365/security/defender/m365d-autoir) capabilities, including automatically remediating alerts and the mitigation of tools and processes that can contribute to the suspicious activity.

Microsoft Defender for Identity alerts currently appear in two different layouts in the Microsoft Defender XDR portal. While the alert views may show different information, all alerts are based on detections from Defender for Identity sensors. The differences in layout and information shown are part of an ongoing transition to a unified alerting experience across Microsoft Defender products.

To learn more about how to understand the structure, and common components of all Defender for Identity security alerts, see [View and manage alerts](understanding-security-alerts.md).

For information about **True positive (TP)**, **Benign true positive (B-TP)**, and **False positive (FP)**, see [security alert classifications](understanding-security-alerts.md#classify-security-alerts).

## Alerts categories
 The alerts are divided into categories based on the phases seen in a typical cyber-attack kill chain. The categories differ slightly depending on whether the alert originates from using the classic Microsoft Defender for Identity alerting, or Microsoft Defender for XDR. The differences are part of an ongoing transition to a unified alerting experience across Microsoft Defender products.

For example, there are categories for:
- Reconnaissance and discovery alerts
- Persistence and privilege escalation alerts
- Credential access alerts
- Lateral movement alerts

For detailed information about each alert see:
- [Microsoft Defender for Identity classic alerts](alerts-mdi-classic.md)
- [Microsoft Defender for Identity XDR alerts](alerts-xdr.md)


## See Also
- [View and manage security alerts](understanding-security-alerts.md)
- [Investigate security alerts](/defender-for-identity/investigate-security-alerts)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)


