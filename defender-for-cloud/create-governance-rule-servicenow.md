---
title: Create automatic tickets with governance rules
description: Create Defender for Cloud governance rules that automatically open ServiceNow ITSM tickets for selected recommendations or severity levels.
ms.topic: how-to
ms.date: 07/03/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1013
#customer intent: As a user, I want to learn how to create automatic tickets using governance rules in Defender for Cloud that automatically assigns an owner to specific recommendation or a recommendation with a severity level in Defender for Cloud to my ServiceNow account.
---

# Create automatic tickets with governance rules

The integration of ServiceNow's IT Service Management (ITSM) module and Defender for Cloud allow you to create governance rules that automatically open tickets in ServiceNow for specific recommendations or severity levels. ServiceNow tickets can be created, viewed, and linked to recommendations directly from Defender for Cloud, enabling seamless collaboration between the two platforms and facilitating efficient incident management.

## Prerequisites

Before you create governance rules, make sure you meet the following requirements:

- Have an [application registry in ServiceNow](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector).

- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- Admin permissions to ServiceNow to create an assignment.

## Assign an owner with a governance rule

You can create a governance rule to automatically assign an owner to a recommendation in Defender for Cloud. The rule can be based on either the recommendation's severity or a specific recommendation.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Governance rules**.

   :::image type="content" border="true" source="./media/integration-servicenow/governance-rules.png" alt-text="Screenshot of the environment settings page that shows where the governance rules button is located.":::

1. Select **Create governance rule**.

1. Enter a rule name and select a scope.

1. Select **ServiceNow** In the Type field.

1. Enter a priority.

1. Select and integration instance.

1. Select a ServiceNow ticket type.

1. Select **Next**.

1. Select either:
    - **By Severity** and the severity level.
    - **By recommendation** and the recommendation.

1. Select an owner.

1. Select a remediation timeframe.

1. (Optional) Toggle the switch to apply a grace period.

1. (Optional) Set email notifications.

1. Select **Create**.

<a name="next-step"></a>
## Next steps

Learn more about cloud security posture management:

> [!div class="nextstepaction"]
> [Common questions about cloud security posture management (CSPM)](faq-cspm.yml).
