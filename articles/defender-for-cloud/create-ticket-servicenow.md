---
title: Create a ticket in Defender for Cloud
description: Learn how to create a ticket in Defender for Cloud that connects and synchronizes with your ServiceNow account.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 05/26/2026
ai-usage: ai-assisted
#customer intent: As a security administrator, I want to create ServiceNow tickets from Defender for Cloud recommendations so that owners can track and remediate issues efficiently.
---

# Create a ticket in Defender for Cloud

The integration between Defender for Cloud and ServiceNow's IT Service Management (ITSM) module lets you create tickets in Defender for Cloud that connect to a ServiceNow account. ServiceNow tickets are linked directly to recommendations in Defender for Cloud to support efficient incident management and resolution.

## Prerequisites

- Have an [application registry in ServiceNow](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector).

- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- The following roles are required:
  - To create an assignment:  Admin permissions to ServiceNow.

## Create a new ticket based on a recommendation to ServiceNow

Security admins can create and assign tickets directly from the Defender for Cloud portal.

1. Sign in to [the Azure portal](https://aka.ms/integrations).

1. Navigate to **Microsoft Defender for Cloud** > **Recommendations**.

1. Select the recommendation that you want to create a ServiceNow ticket for, and assign an owner.

1. Select **View recommendation for all resources**.

1. Expand the **Affected resources** section.

1. In **Unhealthy resources**, select the relevant resource, and then select **Assign owner**.

   :::image type="content" border="true" source="./media/create-ticket-servicenow/create-assignment.png" alt-text="Screenshot of how to create an assignment." lightbox="media/create-ticket-servicenow/create-assignment.png":::

1. In the Type field, select **ServiceNow**

    :::image type="content" source="media/create-ticket-servicenow/type-servicenow.png" alt-text="Screenshot that shows the create assignment window and the type field where you select ServiceNow.":::

1. Select the integration instance.

1. Select the ticket type.

   > [!NOTE]
   > In ServiceNow, there are several types of tickets that can be used to manage and track different types of incidents, requests, and tasks. Only incident, change request, and problem are supported with this integration.

   :::image type="content" border="true" source="./media/create-ticket-servicenow/assignment-type.png" alt-text="Screenshot of how to complete the assignment type.":::

1. Expand the assignment details section.

1. Complete the following fields:

   - **Assigned to**: Choose the owner whom you would like to assign the affected recommendation to.
   - **Caller**: Represents the user defining the assignment.
   - **Description and Short Description**: Enter a description, and short description.
   - **Remediation timeframe**: Select the remediation timeframe.
   - **Apply Grace Period**: (Optional) apply a grace period.
   - **Set Email Notifications**: (Optional) You can send a reminder to the owners or the owner’s direct manager.

      :::image type="content" border="true" source="./media/create-ticket-servicenow/assignment-details.png" alt-text="Screenshot of how to complete the assignment details.":::

1. Select **Create**.

After the assignment is created, the ticket ID appears next to the resource in the recommendation. This ID represents the ticket in ServiceNow. Select the ticket ID to open the newly created incident in the ServiceNow portal.

> [!NOTE]
> When the integration is deleted, all assignments are deleted. Deletion can take up to 24 hours.

## Next step

> [!div class="nextstepaction"]
> [Assign an owner to a recommendation or severity level](create-governance-rule-servicenow.md)

