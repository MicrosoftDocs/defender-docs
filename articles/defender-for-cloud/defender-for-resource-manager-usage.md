---
title: How to respond to Microsoft Defender for Resource Manager alerts
description: Learn about the steps necessary for responding to alerts from Microsoft Defender for Resource Manager
ms.date: 03/30/2025
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
---

# Respond to Defender for Resource Manager alerts

When you receive an alert from Microsoft Defender for Resource Manager, investigate and respond to the alert as described in this article. Defender for Resource Manager protects all connected resources, so even if you're familiar with the application or user that triggered the alert, verify the situation surrounding every alert.

## Respond to an alert

To respond to an alert from Microsoft Defender for Resource Manager, first contact the resource owner to determine whether the behavior was expected or intentional. If the activity is expected, dismiss the alert. If the activity is unexpected, treat the related user accounts, subscriptions, and virtual machines as compromised and perform an investigation and mitigate the threat as described on this page.

## Investigate alerts from Microsoft Defender for Resource Manager

Security alerts from Defender for Resource Manager are based on threats detected by monitoring Azure Resource Manager operations. Defender for Cloud uses internal log sources of Azure Resource Manager and Azure Activity log, an Azure platform log that provides insight into subscription-level events.

Defender for Resource Manager provides visibility into activities from non-Microsoft service providers that delegate access as part of Resource Manager alerts. For example, `Azure Resource Manager operation from suspicious proxy IP address - delegated access`.

`Delegated access` refers to access with [Azure Lighthouse](/azure/lighthouse/overview) or with [Delegated administration privileges](/partner-center/dap-faq).

Alerts that show `Delegated access` also include a customized description and remediation steps.

Learn more about [Azure Activity log](/azure/azure-monitor/essentials/activity-log).

To investigate security alerts from Defender for Resource Manager:

1. Open Azure Activity log.

    :::image type="content" source="media/defender-for-resource-manager-introduction/opening-azure-activity-log.png" alt-text="How to open Azure Activity log.":::

1. Filter the events to:
    - The subscription mentioned in the alert
    - The time frame of the detected activity
    - The related user account (if relevant)

1. Look for suspicious activities.

> [!TIP]
> For a better, richer investigation experience, stream your Azure activity logs to Microsoft Sentinel as described in [Connect data from Azure Activity log](/azure/sentinel/data-connectors/azure-activity).

## Mitigate immediately

1. Remediate compromised user accounts:
    - Delete them if you don't recognize them because a threat actor created them.
    - If you recognize them, change their authentication credentials.
    - Review all user activities in Azure Activity Logs and identify any suspicious ones.


1. Remediate compromised subscriptions:
    - Remove any unfamiliar Runbooks from the compromised automation account.
    - Review IAM permissions for the subscription and remove permissions for any unfamiliar user account.
    - Review all Azure resources in the subscription and delete any that are unfamiliar.
    - Review and investigate any security alerts for the subscription in Microsoft Defender for Cloud.
    - Use Azure Activity Logs to review all activities performed in the subscription and identify any that are suspicious.

1. Remediate the compromised virtual machines
    - Change the passwords for all users.
    - Run a full anti-malware scan on the machine.
    - Reimage the machines from a malware-free.

## Next steps

This page explained the process of responding to an alert from Defender for Resource Manager. For related information, see the following pages:

- [Overview of Microsoft Defender for Resource Manager](defender-for-resource-manager-introduction.md)
- [Suppress security alerts](alerts-suppression-rules.md)
- [Continuously export Defender for Cloud data](continuous-export.md)
