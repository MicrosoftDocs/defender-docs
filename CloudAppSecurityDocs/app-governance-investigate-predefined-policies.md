---
title: Investigate predefined app governance policy alerts | Microsoft Defender for Cloud Apps 
ms.date: 05/28/2023
ms.topic: conceptual
description: Learn how to investigate predefined app policy alerts from app governance in Microsoft Defender XDR with Microsoft Defender for Cloud Apps.
---

# Investigate predefined app policy alerts

App governance provides predefined app policy alerts for anomalous activities. The purpose of this guide is to provide you with general and practical information on each alert, to help with your investigation and remediation tasks. 

Included in this guide is general information about the conditions for triggering alerts. Because predefined policies are nondeterministic by nature, they're only triggered when there's behavior that deviates from the norm. 

> [!TIP]
> Some alerts may be in preview, so regularly review the updated alert statuses.
>

## Security alert classifications

Following proper investigation, all app governance alerts can be classified into one of the following activity types:

- **True positive (TP)**: An alert on a confirmed malicious activity.
- **Benign true positive (B-TP)**: An alert on suspicious but not malicious activity, such as a penetration test or other authorized suspicious action.
- **False positive (FP)**: An alert on a nonmalicious activity.

## General investigation steps

Use the following general guidelines when investigating any type of alert to gain a clearer understanding of the potential threat before applying the recommended action.

1. Review the app severity level and compare with the rest of the apps in your tenant. This review helps you identify which apps in your tenant pose greater risk.

1. If you identify a TP, review all the app activities to gain an understanding of the impact. For example, review the following app information:
   - Scopes granted access
   - Unusual behavior  
   - IP address and location

## Predefined app policy alerts

This section provides information on each predefined policy alert, along with steps for investigation and remediation.

### Increase in data usage by an overprivileged or highly privileged app

**Severity**: Medium

Find apps with powerful or unused permissions that exhibit sudden increases in data usage through Graph API. Unusual changes in data usage might indicate compromise.

**TP or FP?**

To determine if the alert is a true positive (TP) or a false positive (FP), review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that the increase in data usage by an overprivileged or highly privileged app is irregular or potentially malicious.

  **Recommended action**: Contact users about the app activities that have caused the increase in data usage. Temporarily disable the app, reset the password, and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is intended and has a legitimate business use in the organization.

  **Recommended action**: Dismiss the alert.

### Unusual activity from an app with priority account consent

**Severity**: Medium

Find unusual increases in either data usage or Graph API access errors exhibited by apps that have been given consent by a priority account.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that the increase in data usage or API access errors by an app with consent from a priority account is highly irregular or potentially malicious.

  **Recommended action**: Contact priority account users about the app activities that have caused the increase in data usage or API access errors. Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is intended and has a legitimate business use in the organization.

  **Recommended action**: Dismiss the alert.

### New app with low consent rate

**Severity**: Medium

Consent requests from a newly created app have been rejected frequently by users. Users typically reject consent requests from apps that have exhibited unexpected behavior or arrived from an untrusted source. Apps that have low consent rates are more likely to be risky or malicious.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that the app is from an unknown source and its activities have been highly irregular or potentially malicious.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is legitimate.

  **Recommended action**: Dismiss the alert.

### Spike in Graph API calls made to OneDrive

**Severity**: Medium

A cloud app showed a significant increase in Graph API calls to OneDrive. This app might be involved in data exfiltration or other attempts to access and retrieve sensitive data.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that highly irregular, potentially malicious activities have resulted in the detected increase in OneDrive usage.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is legitimate.

  **Recommended action**: Dismiss the alert.

### Spike in Graph API calls made to SharePoint

**Severity**: Medium

A cloud app showed a significant increase in Graph API calls to SharePoint. This app might be involved in data exfiltration or other attempts to access and retrieve sensitive data.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that highly irregular, potentially malicious activities have resulted in the detected increase in SharePoint usage.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is legitimate.

  **Recommended action**: Dismiss the alert.

### Spike in Graph API calls made to Exchange

**Severity**: Medium

A cloud app showed a significant increase in Graph API calls to Exchange. This app might be involved in data exfiltration or other attempts to access and retrieve sensitive data.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that highly irregular, potentially malicious activities have resulted in the detected increase in Exchange usage.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is legitimate.

  **Recommended action**: Dismiss the alert.

### Suspicious app with access to multiple Microsoft 365 services

**Severity**: Medium

Find apps with OAuth access to multiple Microsoft 365 services that have exhibited statistically anomalous Graph API activity following a certificate or secret update. By identifying these apps and checking them for compromise, you can prevent lateral movement, data exfiltration, and other malicious activities that traverse cloud folders, emails, and other services.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that the updates to app certificates or secrets and other app activities have been highly irregular or potentially malicious.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is legitimate.

  **Recommended action**: Dismiss the alert.

### High volume of inbox rule creation activity by an app

**Severity**: Medium

An app made a large number of Graph API calls to create Exchange inbox rules. This app might be involved in data collection and exfiltration or other attempts to access and retrieve sensitive information.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that the creation of inbox rules and other activities have been highly irregular or potentially malicious.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: Apply this recommended action if you have confirmed that the detected app activity is legitimate.

  **Recommended action**: Dismiss the alert.

### High volume of email search activity by an app

**Severity**: Medium

An app made a large number of Graph API calls to search Exchange email content. This app might be involved in data collection or other attempts to access and retrieve sensitive information.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that the content searches on Exchange and other activities have been highly irregular or potentially malicious.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: If you can confirm that no unusual mail search activities were performed by the app or that the app is intended to make unusual mail search activities through Graph API.

  **Recommended action**: Dismiss the alert.

### High volume of email sending activity by an app

**Severity**: Medium

An app made a large number of Graph API calls to send email messages using Exchange Online. This app might be involved in data collection and exfiltration or other attempts to access and retrieve sensitive information.

**TP or FP?**

Review all activities performed by the app, scopes granted to the app and user activity associated with the app.

- **TP**: Apply this recommended action if you have confirmed that the sending of email messages and other activities have been highly irregular or potentially malicious.

  **Recommended action**: Temporarily disable the app, reset the password and then re-enable the app.

- **FP**: If you can confirm that no unusual mail send activities were performed by the app or that the app is intended to make unusual mail send activities through Graph API.

  **Recommended action**: Dismiss the alert.

### Access to sensitive data

**Severity**: Medium

Find apps that access sensitive data identified by specific sensitively labels.

**TP or FP?**

To determine if the alert is a true positive (TP) or a false positive (FP), review resources accessed by the app.

- **TP**: Apply this recommended action if you have confirmed that the app or the detected activity is irregular or potentially malicious.

  **Recommended action**: Prevent the app from accessing any resources by deactivating it from Microsoft Entra ID.

- **FP**: Apply this recommended action if you have confirmed that the app has legitimate business use in the organization and the detected activity was expected.

  **Recommended action**: Dismiss the alert.

## Next steps

[Learn about app threat detection and remediation](app-governance-detect-remediate-overview.md)
