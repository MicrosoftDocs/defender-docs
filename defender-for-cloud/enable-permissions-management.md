---
title: Enable cloud infrastructure entitlement management (CIEM)
description: Enable CIEM to enforce least privilege access and manage user entitlements across Azure, AWS, and GCP as part of Defender for Cloud's CNAPP solution.
ms.topic: how-to
ms.date: 06/02/2026
#customer intent: As a cloud administrator, I want to learn how to enable permissions (CIEM) in order to effectively manage user access and entitlements in my cloud infrastructure.
---

# Enable cloud infrastructure entitlement management (CIEM)

Microsoft Defender for Cloud provides a cloud infrastructure entitlement management (CIEM) security model. It helps organizations manage and control user access and entitlements in cloud infrastructure. CIEM is a core part of the Cloud Native Application Protection Platform (CNAPP) solution. It shows who or what has access to resources and helps enforce least-privilege access. With CIEM, users and workload identities get only the access they need to do their tasks. CIEM also helps you monitor and manage permissions across Azure, Amazon Web Services (AWS), and Google Cloud Platform (GCP).

## Before you start

Before you enable CIEM, make sure you meet the following prerequisites:

1. Make sure you have the right roles and permissions for each cloud environment to enable the Permissions Management (CIEM) extension in Defender cloud security posture management (Defender CSPM):

    - For AWS and GCP, you need the [Security Admin role](/azure/role-based-access-control/built-in-roles/security#security-admin) at the account or organization level.
    - For Azure, you need the [Security Admin role](/azure/role-based-access-control/built-in-roles/security#security-admin) at the subscription level.

1. Onboard your AWS or GCP environment to Defender for Cloud:

    - For AWS, [connect your AWS account to Defender for Cloud](quickstart-onboard-aws.md).
    - For GCP, [connect your GCP project to Defender for Cloud](quickstart-onboard-gcp.md).

1. [Enable Defender CSPM](tutorial-enable-cspm-plan.md) on your Azure subscription, AWS account, or GCP project.

## Enable CIEM for Azure

When you enable the Defender cloud security posture management (Defender CSPM) plan on your Azure account, the **Azure CSPM** [regulatory compliance standard](concept-regulatory-compliance-standards.md) is automatically assigned to your subscription. The Azure CSPM standard provides cloud infrastructure entitlement management (CIEM) recommendations.

When CIEM is disabled, the CIEM recommendations within the Azure CSPM standard aren't calculated.

To enable CIEM for Azure, complete the following steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Environment settings**.

1. Select the relevant subscription.

1. Locate the Defender CSPM plan and select **Settings**.

1. Enable **Permissions Management (CIEM)**.

    :::image type="content" source="media/enable-permissions-management/permissions-management-on.png" alt-text="Screenshot that shows you where the toggle is for the permissions management is located." lightbox="media/enable-permissions-management/permissions-management-on.png":::

1. Select **Continue**.

1. Select **Save**.

The applicable CIEM recommendations appear on your subscription within a few hours.

List of Azure recommendations:

- Azure overprovisioned identities should have only the necessary permissions

- Permissions of inactive identities in your Azure subscription should be revoked

## Enable CIEM for AWS

When you enable the Defender CSPM plan on your AWS account, the **AWS CSPM** [regulatory compliance standard](concept-regulatory-compliance-standards.md) is automatically assigned to your subscription. The AWS CSPM standard provides CIEM recommendations.
When Permissions Management is disabled, the CIEM recommendations in the AWS CSPM standard aren't calculated.

To enable CIEM for AWS, complete the following steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Environment settings**.

1. Select the relevant AWS account.

1. Locate the Defender CSPM plan and select **Settings**.

    :::image type="content" source="media/enable-permissions-management/settings.png" alt-text="Screenshot that shows an AWS account and the Defender CSPM plan enabled and where the settings button is located." lightbox="media/enable-permissions-management/settings.png":::

1. Enable **Permissions Management (CIEM)**.

1. [Ingest AWS CloudTrail logs](/azure/defender-for-cloud/integrate-cloud-trail) to get more accurate CIEM recommendations and insights.

1. Select **Configure access**.

1. Select a deployment method.

1. Run the CloudFormation deployment script on your AWS environment by using the onscreen instructions.

1. Check the **CloudFormation template has been updated on AWS environment (Stack)** checkbox.

    :::image type="content" source="media/enable-permissions-management/checkbox.png" alt-text="Screenshot that shows where the checkbox is located on the screen.":::

1. Select **Review and generate**.

1. Select **Update**.

The applicable CIEM recommendations appear on your subscription within a few hours.

List of AWS recommendations:

- AWS overprovisioned identities should have only the necessary permissions

- Permissions of inactive identities in your AWS account should be revoked

## Enable CIEM for GCP

When you enable the Defender CSPM plan on your GCP project, the **GCP CSPM** [regulatory compliance standard](concept-regulatory-compliance-standards.md) is automatically assigned to your subscription. The GCP CSPM standard provides CIEM recommendations.

When Permissions Management (CIEM) is disabled, the CIEM recommendations within the GCP CSPM standard aren't calculated.

To enable CIEM for GCP, complete the following steps:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Environment settings**.

1. Select the relevant GCP project.

1. Locate the Defender CSPM plan and select **Settings**.

    :::image type="content" source="media/enable-permissions-management/settings-google.png" alt-text="Screenshot that shows where to select settings for the Defender CSPM plan for your GCP project." lightbox="media/enable-permissions-management/settings-google.png":::

1. Toggle Permissions Management (CIEM) to **On**.

1. [Ingest GCP cloud logging](/azure/defender-for-cloud/enable-permissions-management) to ensure your GCP identities are evaluated for permission risks.

1. Select **Save**.

1. Select **Next: Configure access**.

1. Select the relevant permissions type.

1. Select a deployment method.

1. Run the Cloud Shell or Terraform deployment script on your GCP environment by using the onscreen instructions.

1. Add a check to the **I ran the deployment template for the changes to take effect** checkbox.

    :::image type="content" source="media/enable-permissions-management/gcp-checkbox.png" alt-text="Screenshot that shows the checkbox that needs to be selected." lightbox="media/enable-permissions-management/gcp-checkbox.png":::

1. Select **Review and generate**.

1. Select **Update**.

The applicable CIEM recommendations appear on your subscription within a few hours.

List of GCP recommendations:

- GCP overprovisioned identities should have only necessary permissions

- Permissions of inactive identities in your GCP project should be revoked

## Limitations

Be aware of the following CIEM limitations:

- Serverless and compute identities for AWS are no longer included in CIEM inactivity logic, which can change recommendation counts.
- The Permissions Creep Index (PCI) metric is being deprecated and will no longer appear in Defender for Cloud recommendations.

## Next step

> [!div class="nextstepaction"]
> [Review Defender CSPM plan settings](tutorial-enable-cspm-plan.md)

