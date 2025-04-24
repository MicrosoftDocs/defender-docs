---
title: Connect Mend.io to Defender for Cloud
description: Learn how to connect Mend.io with Microsoft Defender for Cloud to enhance vulnerability analysis and gain visibility of critical vulnerabilities.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 04/24/2025
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to connect my ServiceNow account with Microsoft Defender for Cloud so that I can enhance the existing vulnerability analysis security capabilities that are provided by Defender for Cloud for comprehensive code to runtime visibility of critical vulnerabilities.
---

# Connect Mend.io to Defender for Cloud

Microsoft Defender for Cloud integrates with Mend.io to enhance software application security by identifying and mitigating vulnerabilities in partner dependencies. The integration streamlines discovery and remediation processes, improving overall security.

This article explains the benefits and procedures to connect Mend.io to Defender for Cloud. Following the steps, security teams gain enhanced visibility and control over potential threats, from code development to runtime.

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/free-trial/).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- You must [enable Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- Connect your DevOps environments to Defender for Cloud:
  - [Azure DevOps organizations](quickstart-onboard-devops.md)
  - [GitHub organizations](quickstart-onboard-github.md)
  - [GitLab groups](quickstart-onboard-devops.md)

- Have an account with [Mend.io](https://www.mend.io/).

- Obtain an API key from Mend.io with read-only permissions and an expiration date set to 180 days.

- You must have the appropriate role to:

    | Task | Role |
    |--|--|
    | Create DevOps connectors | Security Admin or Contributor assigned at the subscription level through Azure role-based-access control |
    | Create the Mend.io connector | Security Administrator or Global Administrator assigned at the tenant level through Microsoft Entra. Permissions can be granted through Privileged Identity Management |
    | View reachability analysis findings | Security Admin or Security Reader assigned at the subscription level through Azure role-based-access control on the subscription that hosts the DevOps connector |

- Connect only one Mend.io connector per tenant.

- Connect the corresponding repository to Defender for Cloud. Findings won't appear if you don't connect the corresponding repository to Defender for Cloud.

## Connect Mend.io

To connect your Mend.io account to Defender for Cloud:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

   :::image type="content" border="true" source="./media/connect-mend-io/integrations.png" alt-text="Screenshot of environment settings page that shows where to select the ServiceNow option.":::

1. Select **Add integration** > **Mend.io**.

   :::image type="content" border="true" source="./media/connect-mend-io/add-mend-io.png" alt-text="Screenshot that shows where the Add Integration button is and the ServiceNow option." lightbox="media/connect-mend-io/add-mend-io.png":::

    > [!NOTE] 
    > The option to add the Mend.io integration isn't available if you don't have the appropriate permissions, or if you already have an existing connector to Mend.io.

1. Enter a Mend.io namespace, API key ID, and API secret.

1. Select **Create**.

After the integration is successfully created, a notice appears. Defender for Cloud scans repositories connected to Mend.io and populates results after six hours.

## Related content

Learn more about [partner integrations](partner-integrations.md).
