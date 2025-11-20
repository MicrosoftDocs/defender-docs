---
title: Assign regulatory compliance standards in Microsoft Defender for Cloud
description: Learn how to assign regulatory compliance standards in Microsoft Defender for Cloud.
ms.date: 10/19/2025
ms.author: elkrieger
author: Elazark
ms.topic: how-to
ms.custom:
---

# Assign security standards

Defender for Cloud's regulatory standards and benchmarks are represented as [security standards](security-policy-concept.md). Each standard is defined as an initiative in Azure Policy.

In Defender for Cloud, assign security standards to specific scopes such as Azure subscriptions, Amazon Web Services (AWS) accounts, and Google Cloud Platform (GCP) projects with Defender for Cloud enabled.

Defender for Cloud continually assesses the scoped environment against the standards. Based on assessments, it shows whether in-scope resources are compliant or noncompliant with the standard and provides remediation recommendations.

This article explains how to add regulatory compliance standards as security standards in an Azure subscription, AWS account, or GCP project.

## Prerequisites

-   To access compliance standards in Defender for Cloud, onboard any Defender for Cloud plan, except Defender for Servers Plan 1 or Defender for API Plan 1.
-   You need `Owner` or `Policy Contributor` permissions to add a standard.

## Assign a standard

If you assign a regulatory standard but don't have any relevant assessed resources in that standard, the standard doesn't appear on your regulatory compliance dashboard.

1.  Sign in to the [Azure portal](https://portal.azure.com/).
1.  Navigate to **Microsoft Defender for Cloud** > **Regulatory compliance**. For each standard, you can see the applied subscription.
1.  Select **Manage compliance policies**.

    :::image type="content" source="media/update-regulatory-compliance-packages/manage-compliance.png" alt-text="Screenshot of the regulatory compliance page that shows you where to select the manage compliance policy button." lightbox="media/update-regulatory-compliance-packages/manage-compliance.png":::

1.  Select an account or management account (Azure subscription or management group, AWS account or management account, GCP project or organization) to assign the security standard.

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