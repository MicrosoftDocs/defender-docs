---
title: Connect ServiceNow's ITSM module to Defender for Cloud
description: Learn how to connect ServiceNow with Microsoft Defender for Cloud to protect Azure, hybrid, and multicloud machines.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 10/13/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to connect my ServiceNow account with Microsoft Defender for Cloud so that I can protect my Azure, hybrid, and multicloud machines.
---

# Connect ServiceNow ITSM to Defender for Cloud

You can connect Microsoft Defender for Cloud with [ServiceNow’s IT Service Management (ITSM)](integration-servicenow.md##it-service-management-itsm) module to improve incident management and remediation. The integration lets you create and track ServiceNow tickets that are linked to Defender for Cloud security recommendations, helping your teams respond efficiently to issues across Azure, hybrid, and multicloud environments.

This article explains how to connect your ServiceNow account to Defender for Cloud.

## Prerequisites

Before you connect ServiceNow to Defender for Cloud, make sure you: 

- Have an [application registry in ServiceNow](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector) to generate a client ID and secret for authentication.

- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- You must have one of the following Azure roles to create the integration:
  - Security Admin
  - Contributor
  - Owner

## Connect a ServiceNow account to Defender for Cloud

To connect a ServiceNow account to a Defender for Cloud account:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

   :::image type="content" border="true" source="./media/connect-servicenow/integrations.png" alt-text="Screenshot of environment settings page that shows where to select the ServiceNow option.":::

1. Select **Add integration** > **ServiceNow**.

   :::image type="content" border="true" source="./media/connect-servicenow/add-servicenow.png" alt-text="Screenshot that shows where the add integration button is and the ServiceNow option." lightbox="media/connect-servicenow/add-servicenow.png":::

1. Enter a name, select the scope, enter the instance URL, User name, Password, Client ID, and client secret that you created for the [application registry](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector) in the ServiceNow portal.

1. Select **Next**.

1. Select Incident data, Problems data, and Changes table from the drop-down menus.

   :::image type="content" border="true" source="./media/connect-servicenow/customize-fields.png" alt-text="Screenshot that shows the custom option selected and the accompanying fields you can enter information into.":::

1. Select **Save**.

A notice appears after successful creation of integration.

## Next step

> [!div class="nextstepaction"]
> [Create a ticket in Defender for Cloud](create-ticket-servicenow.md)
> [Automate ticket creation using governance rules](governance-rules.md)
