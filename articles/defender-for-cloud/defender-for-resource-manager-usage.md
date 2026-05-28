---
title: Respond to Defender for Resource Manager alerts
description: Investigate and remediate security alerts from Defender for Resource Manager. Covers connected Azure resources, subscriptions, and user activity.
ms.date: 05/25/2026
ms.topic: how-to
ms.author: elkrieger
author: ElazarK
#customer intent: As a security administrator, I want to respond to alerts so that I can mitigate threats effectively.
---

# Respond to Defender for Resource Manager alerts

Use this article to investigate and mitigate security alerts from Microsoft Defender for Resource Manager. It helps you validate suspicious activity and take immediate containment steps for affected accounts, subscriptions, and virtual machines.

## Investigate and respond to alerts

Investigate and respond to alerts from Microsoft Defender for Resource Manager by using the guidance in this document. Defender for Resource Manager protects all connected resources. Verify the situation around every alert, even if you're familiar with the application or user that triggered it.

## Respond to an alert

Contact the resource owner to determine whether the behavior was expected or intentional. Dismiss the alert if the activity is expected. If the activity is unexpected, treat related user accounts, subscriptions, and virtual machines as compromised. Investigate and mitigate the threat by using the remediation steps below.

## Investigate alerts from Microsoft Defender for Resource Manager

Security alerts from Defender for Resource Manager are based on threats detected by monitoring Azure Resource Manager operations. Defender for Cloud uses internal log sources and Azure Activity log. Azure Activity log is an Azure platform log that provides insight into subscription-level events.

Defender for Resource Manager provides visibility into activities from non-Microsoft service providers that delegate access as part of Resource Manager alerts. For example, `Azure Resource Manager operation from suspicious proxy IP address - delegated access`.

`Delegated access` refers to access granted through Azure Lighthouse or Delegated administration privileges. For details, see [Azure Lighthouse](/azure/lighthouse/overview) and [Delegated administration privileges](/partner-center/dap-faq).

Alerts that show `Delegated access` also include a customized description and remediation steps.

Azure Activity log provides subscription-level events for investigations. For details, see [Azure Activity log documentation](/azure/azure-monitor/essentials/activity-log).

To investigate security alerts from Defender for Resource Manager:

1. Open Azure Activity log.

    :::image type="content" source="media/defender-for-resource-manager-introduction/opening-azure-activity-log.png" alt-text="How to open Azure Activity log":::

1. Filter the events to:
    - The subscription mentioned in the alert
    - The time frame of the detected activity
    - The related user account (if relevant)

1. Look for suspicious activities.

> [!TIP]
> For a richer investigation experience, stream your Azure Activity logs to Microsoft Sentinel. For setup steps, see [Connect data from Azure Activity log](/azure/sentinel/data-connectors/azure-activity).

## Mitigate immediately

To contain the threat and prevent further damage, perform these steps immediately:

1. Remediate compromised user accounts:
    - Delete accounts that you don't recognize because a threat actor might have created them.
    - For accounts you recognize, change their authentication credentials.
    - Review all user activities in Azure Activity logs and identify suspicious actions.

1. Remediate compromised subscriptions:
    - Remove unfamiliar runbooks from any compromised automation accounts.
    - Review IAM permissions for the subscription and remove permissions for unfamiliar user accounts.
    - Review all Azure resources in the subscription and delete any unfamiliar resources.
    - Review and investigate security alerts for the subscription in Microsoft Defender for Cloud.
    - Use Azure Activity logs to review all activities in the subscription and identify suspicious actions.

1. Remediate compromised virtual machines:
    - Change passwords for all users.
    - Run a full antimalware scan on each machine.
    - Reimage machines from a verified malware-free source.

## Next step

> [!div class="nextstepaction"]
> [Overview of Microsoft Defender for Resource Manager](defender-for-resource-manager-introduction.md)

