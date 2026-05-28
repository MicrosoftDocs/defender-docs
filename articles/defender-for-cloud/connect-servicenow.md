---
title: Connect ServiceNow's ITSM module to Defender for Cloud
description: Learn how to connect ServiceNow with Microsoft Defender for Cloud to protect Azure, hybrid, and multicloud machines.
author: Elazark
ms.author: elkrieger
ms.topic: how-to
ms.date: 05/24/2026
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to connect my ServiceNow account with Microsoft Defender for Cloud so that I can protect my Azure, hybrid, and multicloud machines.
---

# Connect ServiceNow ITSM to Defender for Cloud

Microsoft Defender for Cloud integrates with ServiceNow IT Service Management (ITSM). This integration lets you connect your Defender for Cloud account to ServiceNow. You can use ServiceNow workflows to manage recommendations and prioritize remediation work. You can also create and view ServiceNow tickets for recommendations directly from Defender for Cloud.

## Prerequisites

- Have an application registry configured in ServiceNow. For setup steps, see [How to create a ServiceNow API key and secret](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector).

- Enable Defender Cloud Security Posture Management (CSPM) on your Azure subscription. For setup steps, see [Enable Defender CSPM](tutorial-enable-cspm-plan.md).

- To create the integration, you must have one of these roles: Security Admin, Contributor, or Owner.

- To create ServiceNow tickets for recommendations on Amazon Web Services (AWS) or Google Cloud Platform (GCP) resources, configure the ServiceNow integration at the connector level. An integration that is scoped only to an Azure subscription doesn't apply to non-Azure resources.

## Connect a ServiceNow account to Defender for Cloud

To connect a ServiceNow account to a Defender for Cloud account:

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

   :::image type="content" border="true" source="./media/connect-servicenow/integrations.png" alt-text="Screenshot of environment settings page that shows where to select the ServiceNow option.":::

1. Select **Add integration** > **ServiceNow**.

   :::image type="content" border="true" source="./media/connect-servicenow/add-servicenow.png" alt-text="Screenshot that shows where the add integration button is and the ServiceNow option." lightbox="media/connect-servicenow/add-servicenow.png":::

1. Enter a name and select the scope.
1. Enter the instance URL, User name, Password, Client ID, and client secret from the application registry that you created in the ServiceNow portal.

1. Select **Next**.

1. Select Incident data, Problems data, and Changes table from the drop-down menus.

   :::image type="content" border="true" source="./media/connect-servicenow/customize-fields.png" alt-text="Screenshot that shows the custom option selected and the accompanying fields you can enter information into.":::

1. Select **Save**.

After you save the integration, a success notice appears.

## Next step

> [!div class="nextstepaction"]
> [Create a ticket in Defender for Cloud](create-ticket-servicenow.md)

