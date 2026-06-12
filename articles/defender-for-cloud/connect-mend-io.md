---
title: Connect Mend.io to Defender for Cloud (Preview)
description: Learn how to connect Mend.io with Microsoft Defender for Cloud to enhance vulnerability analysis and gain visibility of critical vulnerabilities.
ms.topic: how-to
ms.date: 05/24/2026
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to connect my Mend.io account with Microsoft Defender for Cloud so that I can enhance vulnerability analysis and gain visibility from code to runtime.
---

# Connect Mend.io to Defender for Cloud (Preview)

Microsoft Defender for Cloud integrates with Mend.io to help identify and mitigate vulnerabilities in partner dependencies. The integration streamlines discovery and remediation.

This article explains the benefits and steps to connect Mend.io to Defender for Cloud. After setup, security teams get improved visibility and control over threats from code development to runtime.

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- You must [enable Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- Connect your DevOps environments to Defender for Cloud:
  - [Azure DevOps organizations](quickstart-onboard-devops.md)
  - [GitHub organizations](quickstart-onboard-github.md)
  - [GitLab groups](quickstart-onboard-devops.md)

- Have an account with [Mend.io](https://www.mend.io/).

- Obtain an activation key from Mend.io. For instructions, see [Mend.io integration activation token Application Programming Interface (API)](https://api-docs.mend.io/1.4/issue-tracker-api#getintegrationactivationtoken).

- You must have the appropriate role to:

    | Task | Role |
    |--|--|
    | Create DevOps connectors | Security Admin or Contributor assigned at the subscription level through Azure role-based-access control. |
    | Create the Mend.io connector | Security Administrator or Global Administrator assigned at the tenant level through Microsoft Entra. Permissions can be granted through [Privileged Identity Management](/entra/id-governance/privileged-identity-management/pim-configure). |
    | View reachability analysis findings | Security Admin or Security Reader assigned at the subscription level through Azure role-based-access control on the subscription that hosts the DevOps connector. |

- Connect only one Mend.io connector per tenant.

- Ensure repositories monitored by Mend.io are also connected to Defender for Cloud. Findings won't appear if those repositories aren't connected.

## Connect Mend.io

To connect your Mend.io account to Defender for Cloud:

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

    :::image type="content" border="true" source="./media/connect-mend-io/integrations.png" alt-text="Microsoft Defender for Cloud Environment settings page with Integrations selected.":::

1. Select **Add integration** > **Mend.io**.

    :::image type="content" border="true" source="./media/connect-mend-io/add-mend-io.png" alt-text="Add integration menu showing Mend.io as a selectable integration." lightbox="media/connect-mend-io/add-mend-io.png":::

    > [!NOTE] 
    > The option to add the Mend.io integration isn't available if you don't have the appropriate permissions, or if you already have an existing connector to Mend.io.

1. Enter a Mend.io activation key.

    :::image type="content" source="media/connect-mend-io/activation-key.png" alt-text="Mend.io integration form with the activation key field highlighted." lightbox="media/connect-mend-io/activation-key.png":::

1. Select **Create**.

After the integration is successfully created, a notice appears. Defender for Cloud scans repositories connected to Mend.io and populates results after six hours.

## Related content

For information about partner integrations, see [Partner integrations](partner-integrations.md).

