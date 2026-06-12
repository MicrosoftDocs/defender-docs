---
title: Assign regulatory compliance standards in Microsoft Defender for Cloud
description: Learn how to assign regulatory compliance standards in Microsoft Defender for Cloud.
ms.date: 05/25/2026
ms.topic: how-to
#customer intent: As a security administrator, I want to assign regulatory compliance standards in Microsoft Defender for Cloud so that I can evaluate compliance across selected scopes.
---

# Assign regulatory compliance standards in Microsoft Defender for Cloud

In Microsoft Defender for Cloud, regulatory compliance standards use Azure Policy initiatives. Defender for Cloud evaluates these standards in the Regulatory compliance dashboard.

You can assign regulatory compliance standards to specific scopes such as Azure subscriptions, Amazon Web Services (AWS) accounts, and Google Cloud Platform (GCP) projects.

Defender for Cloud continually assesses the selected scope against each standard. It then shows whether resources are compliant or noncompliant and provides remediation recommendations.

## Prerequisites

-   To access compliance standards in Defender for Cloud, onboard any Defender for Cloud plan, except Defender for Servers Plan 1 or Defender for API Plan 1.
-   You need `Owner` or `Policy Contributor` permissions to add a standard.

## Assign a standard

If you assign a regulatory standard but have no relevant assessed resources, the standard doesn't appear on your regulatory compliance dashboard.

1.  Sign in to the [Azure portal](https://portal.azure.com/).
1.  Navigate to **Microsoft Defender for Cloud** > **Regulatory compliance**. For each standard, you can see the applied subscription.
1.  Select **Manage compliance policies**.

    :::image type="content" source="media/update-regulatory-compliance-packages/manage-compliance.png" alt-text="Screenshot of the regulatory compliance page that shows you where to select the manage compliance policy button." lightbox="media/update-regulatory-compliance-packages/manage-compliance.png":::

1.  Select an account or management account (Azure subscription or management group, AWS account or management account, GCP project or organization) to assign the regulatory compliance standard.

    > [!NOTE]
    > We recommend selecting the highest scope applicable to the standard so that compliance data is aggregated and tracked for all nested resources.

1.  Select **Security policies**.
1.  Locate the standard you want to enable and toggle the status to **On**.

    :::image type="content" source="media/update-regulatory-compliance-packages/turn-standard-on.png" alt-text="Screenshot showing regulatory compliance dashboard options." lightbox="media/update-regulatory-compliance-packages/turn-standard-on.png":::

    If any information is needed to enable the standard, the **Set parameters** page appears for you to type in the information.

    The selected standard appears in the **Regulatory compliance** dashboard as enabled for the subscription it was enabled on.

## Related content

-   [Create custom standards for Azure.](custom-security-policies.md)
-   [Create custom standards for Amazon Web Services (AWS) accounts, and Google Cloud Platform (GCP) projects.](create-custom-recommendations.md)
-   [Improve regulatory compliance.](regulatory-compliance-dashboard.md)
-   [Regulatory compliance in Defender for Cloud.](concept-regulatory-compliance.md)

