---
title: Connect Endor Labs to Defender for Cloud
description: Learn how to connect Endor Labs with Microsoft Defender for Cloud to enhance vulnerability analysis and gain visibility of critical vulnerabilities.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 05/24/2026
ai-usage: ai-assisted
ms.custom: sfi-image-nochange
#customer intent: As a user, I want to learn how to connect my Endor Labs account with Microsoft Defender for Cloud so that I can enhance vulnerability analysis and gain visibility from code to runtime.
---

# Connect Endor Labs to Defender for Cloud

Microsoft Defender for Cloud integrates with Endor Labs to help identify and mitigate vulnerabilities in partner dependencies. This integration helps streamline discovery and remediation.

This article explains the benefits and steps to connect Endor Labs to Defender for Cloud. After setup, security teams get better visibility and control over threats from code to runtime.

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- You must [enable Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- You must [enable Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- Connect your DevOps environments to Defender for Cloud:
  - [Azure DevOps organizations](quickstart-onboard-devops.md)
  - [GitHub organizations](quickstart-onboard-github.md)
  - [GitLab groups](quickstart-onboard-devops.md)

- Have an Endor Labs account. For more information, see [Endor Labs](https://www.endorlabs.com/).

- Have an Endor Labs Application Programming Interface (API) key with read-only permissions. For setup instructions, see [Creating API keys in Endor Labs](https://docs.endorlabs.com/administration/api-keys/). We recommend an expiration date of 180 days.

- You must have the appropriate role to:
  - **Create DevOps connectors**: Security Admin or Contributor assigned at the **subscription level** through Azure role-based-access control (RBAC).
  - **Create the Endor Labs connector**: Security Administrator (or higher) assigned at the **tenant level** through Microsoft Entra. Permissions can be granted through Privileged Identity Management (PIM). For details, see [Configure PIM](/entra/id-governance/privileged-identity-management/pim-configure).
  - **View reachability analysis findings**: Security Admin or Security Reader assigned at the **subscription level** through Azure role-based-access control (RBAC) on the subscription that hosts the DevOps connector.

- You can only have one connector to Endor Labs per tenant.

- Findings from Endor Labs are only shown if the corresponding repository is also connected to Defender for Cloud.

## Connect Endor Labs

To connect your Endor Labs account to Defender for Cloud:

1. Sign in to the Azure portal at [portal.azure.com](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Integrations**.

  :::image type="content" border="true" source="./media/connect-endor-labs/integrations.png" alt-text="Microsoft Defender for Cloud Environment settings page with Integrations selected.":::

1. Select **Add integration** > **Endor Labs**.

    :::image type="content" border="true" source="./media/connect-endor-labs/add-endor-labs.png" alt-text="Add integration menu showing Endor Labs as a selectable integration." lightbox="media/connect-endor-labs/add-endor-labs.png":::

    > [!NOTE]
    > The option to add the Endor Labs integration isn't available if you don't have the appropriate permissions, or if you already have an existing connector to Endor Labs.

1. Enter the Endor Labs **Namespace**, **API key ID**, and **API secret**.

    :::image type="content" source="media/connect-endor-labs/enter-information.png" alt-text="Endor Labs integration form with Namespace, API key ID, and API secret fields.":::

1. Select **Create**.

A notice appears after the integration is successfully created. Defender for Cloud scans repositories that are connected to Endor Labs and populates security findings with results after six hours.

## Related content

- [FAQ about the Endor Labs integration](faq-endor-labs.yml)

