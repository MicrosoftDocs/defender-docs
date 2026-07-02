---
title: Protect your Azure environment
description: Learn how to connect your Azure environment to Microsoft Defender for Cloud Apps using the API connector to monitor activities and detect threats.
ms.date: 06/16/2026
ms.topic: how-to
ms.reviewer: AmitMishaeli
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# How Defender for Cloud Apps helps protect your Azure environment

Azure is a cloud provider that lets your organization host and manage its workloads. Cloud hosting has many benefits, but it can also expose critical assets to threats. These assets include storage with sensitive data, compute resources that run key apps, ports, and virtual private networks.

When you connect Azure to Defender for Cloud Apps, you can secure your assets and spot threats. The service monitors admin and sign-in activity. It alerts you to brute force attacks, misuse of privileged accounts, and unusual VM deletions.

## Main threats

The main threats to your Azure environment include:

- Abuse of cloud resources
- Compromised accounts and insider threats
- Data leakage
- Resource misconfiguration and insufficient access control

## How Defender for Cloud Apps helps to protect your environment

Use the following best practices to protect your Azure environment with Defender for Cloud Apps:

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)
- [Limit exposure of shared data and enforce collaboration policies](best-practices.md#limit-exposure-of-shared-data-and-enforce-collaboration-policies)
- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)

## Control Azure with built-in policies and policy templates

You can use the following built-in policy templates to detect and notify you about potential threats:

| Type | Name |
| ---- | ---- |
| Built-in anomaly detection policy |[Activity from anonymous IP addresses](anomaly-detection-policy.md#activity-from-anonymous-ip-addresses)<br />[Activity from infrequent country](anomaly-detection-policy.md#activity-from-infrequent-country)<br />[Activity from suspicious IP addresses](anomaly-detection-policy.md#activity-from-suspicious-ip-addresses)<br />[Activity performed by terminated user](anomaly-detection-policy.md#activity-performed-by-terminated-user) (requires Microsoft Entra ID as IdP)<br />[Multiple failed login attempts](anomaly-detection-policy.md#multiple-failed-login-attempts)<br />[Unusual administrative activities](anomaly-detection-policy.md#unusual-activities-by-user)|

For more information about creating policies, see [Create a policy](control-cloud-apps-with-policies.md#create-a-policy).

## Automate governance controls

You can also automate Azure governance actions to fix detected threats. The following table lists the available actions:

| Type | Action |
| ---- | ---- |
| User governance |- Notify user on alert (via Microsoft Entra ID)<br />- Require user to sign in again (via Microsoft Entra ID)<br />- Suspend user (via Microsoft Entra ID) |

For more information about remediating threats from apps, see [Governing connected apps](governance-actions.md).

## Protect Azure in real time

Review our best practices for [securing and collaborating with guests](best-practices.md#secure-collaboration-with-external-users-by-enforcing-real-time-session-controls) and [blocking and protecting the download of sensitive data to unmanaged or risky devices](best-practices.md#block-and-protect-download-of-sensitive-data-to-unmanaged-or-risky-devices).

## Connect Azure to Microsoft Defender for Cloud Apps

Use the app connector API to connect your Azure account to Defender for Cloud Apps. This connection gives you visibility into and control over Azure use. To learn how Defender for Cloud Apps protects Azure, see [Protect Azure](protect-azure.md).

### Prerequisites

Before you connect Azure to Microsoft Defender for Cloud Apps, make sure that the user connecting Azure has the **Security administrator** role in Azure Active Directory.

- The user connecting Azure must have a **Security administrator** role in Azure Active Directory.

### Scope and limitations

When you connect Azure to Defender for Cloud Apps, keep in mind the following scope and limitations:

> - Defender for Cloud Apps displays activities from **all** subscriptions.
> - User account information is populated in Defender for Cloud Apps as users perform activities in Azure.
> - Defender for Cloud Apps monitors ARM activities only.

### Connect Azure to Defender for Cloud Apps

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+Connect an app**, followed by **Microsoft Azure**.

    :::image type="content" source="media/connect-azure-menu.png" alt-text="Screenshot that shows the Azure connector in the Defender portal.":::


1. In the **Connect Microsoft Azure** page, select **Connect Microsoft Azure**.

    :::image type="content" source="media/connect-azure.png" alt-text="Screenshot that shows the Connect Microsoft Azure page in the Defender portal.":::

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

> [!NOTE]
> After the Azure connection is established, Defender for Cloud Apps pulls data from that point forward.


## Next steps

- If you have any problems connecting the app, see [Troubleshooting App Connectors](troubleshooting-api-connectors-using-error-messages.md).

- To learn how to create and manage policies for connected apps, see [Control cloud apps with policies](control-cloud-apps-with-policies.md).

