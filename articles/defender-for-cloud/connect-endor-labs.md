---
title: Connect Endor Labs to Defender for Cloud
description: Learn how to connect Endor Labs with Microsoft Defender for Cloud to enhance vulnerability analysis and gain comprehensive visibility of critical vulnerabilities.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 10/28/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to connect my ServiceNow account with Microsoft Defender for Cloud so that I can enhance the existing vulnerability analysis security capabilities that are provided by Defender for Cloud for comprehensive code to runtime visibility of critical vulnerabilities.
---

# Connect Endor Labs to Defender for Cloud

Microsoft Defender for Cloud's integration with Endor Labs enhances the security of software applications by identifying and mitigating vulnerabilities in partner dependencies. This integration streamlines the discovery and remediation processes, improving overall security. 

This article provides a detailed explanation of the benefits and procedures needed to connect Endor Labs to Defender for Cloud. By following the steps outlined, security teams are able to gain enhanced visibility and control over potential threats, from the initial stages of code development all the way through to runtime.

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- You must [enable Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- Connect your DevOps environments to Defender for Cloud: 
    - [Azure DevOps organizations](quickstart-onboard-devops.md)
    - [GitHub organizations](quickstart-onboard-github.md)
    - [GitLab groups](quickstart-onboard-devops.md)

- Have an account with [Endor Labs](https://www.endorlabs.com/).

- Have an [API key from Endor Labs](https://docs.endorlabs.com/administration/api-keys/) with read-only permissions. We recommend setting the expiration date to be 180 days. 

- You must have the appropriate role to:
    - **Create the connector**: Security Administrator or Global Administrator assigned at the tenant level through Microsoft Entra.
    - **View reachability analysis findings**: Security Admin or Security Reader assigned through Azure role-based-access control (RBAC).

## Connect Endor Labs

To connect your Endor Labs account to Defender for Cloud:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

   :::image type="content" border="true" source="./media/connect-endor-labs/integrations.png" alt-text="Screenshot of environment settings page that shows where to select the ServiceNow option.":::

1. Select **Add integration** > **Endor Labs**.

   :::image type="content" border="true" source="./media/connect-endor-labs/add-endor-labs.png" alt-text="Screenshot that shows where the Add Integration button is and the ServiceNow option." lightbox="media/connect-endor-labs/add-endor-labs.png":::

1. Enter an Endor Labs namespace, API key ID, API secret.

    :::image type="content" source="media/connect-endor-labs/enter-information.png" alt-text="Screenshot that shows where the button is located to add your Endor Labs connection.":::

1. Select **Create**.

A notice appears after successful creation of integration.

## Related content

- FAQ about the Endor Labs integration
