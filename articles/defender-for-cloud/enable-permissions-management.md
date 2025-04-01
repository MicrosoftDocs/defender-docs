---
title: Enable Permissions Management (CIEM)
author: Elazark
ms.author: elkrieger
description: Learn how to enable Permissions Management for better access control and security in your cloud infrastructure.
ms.topic: how-to
ms.date: 06/09/2024
#customer intent: As a cloud administrator, I want to learn how to enable permissions (CIEM) in order to effectively manage user access and entitlements in my cloud infrastructure.
---

# Enable Permissions Management (CIEM)

> [!NOTE]
> Effective April 1, 2025, Microsoft Entra Permissions Management will no longer be available for purchase.
>
> On October 1, 2025, Microsoft will retire and discontinue support for this product. Learn more about the **[Microsoft Entra Permissions Management retirement](https://aka.ms/MEPMretire"https://aka.ms/mepmretire")**.
>
> The deprecation of Microsoft Entra Permissions Management doesn't affect any existing CIEM capabilities in Microsoft Defender for Cloud. Learn more about **[the deprecation of Microsoft Entra Permissions Management](https://aka.ms/MDC-CIEM"https://aka.ms/mdc-ciem")**.

Microsoft Defender for Cloud's integration with Microsoft Entra Permissions Management (Permissions Management) provides a Cloud Infrastructure Entitlement Management (CIEM) security model that helps organizations manage and control user access and entitlements in their cloud infrastructure. CIEM is a critical component of the Cloud Native Application Protection Platform (CNAPP) solution that provides visibility into who or what has access to specific resources. It ensures that access rights adhere to the principle of least privilege (PoLP), where users or workload identities, such as apps and services, receive only the minimum levels of access necessary to perform their tasks. CIEM also helps organizations to monitor and manage permissions across multiple cloud environments, including Azure, AWS, and GCP.

## Before you start

- You must [enable Defender CSPM](tutorial-enable-cspm-plan.md) on your Azure subscription, AWS account, or GCP project.

- You must have the following Azure roles and permissions, depending on the cloud environment, to enable the **Permissions Management (CIEM)** extension of Defender CSPM:
  - **AWS and GCP**: [Security Admin role](/azure/role-based-access-control/built-in-roles/security#security-admin) and [Application.ReadWrite.All permission](/graph/permissions-reference#applicationreadwriteall) for your tenant.
  - **Azure**: [Security Admin role](/azure/role-based-access-control/built-in-roles/security#security-admin) and [Microsoft.Authorization/roleAssignments/write permission](/azure/role-based-access-control/permissions/management-and-governance#microsoftauthorization) for the subscription.

- **AWS Only**: [Connect your AWS account to Defender for Cloud](quickstart-onboard-aws.md).

- **GCP only**: [Connect your GCP project to Defender for Cloud](quickstart-onboard-gcp.md).

## Enable Permissions Management (CIEM) for Azure

When you enabled the Defender CSPM plan on your Azure account, the **Azure CSPM** [standard is automatically assigned to your subscription](concept-regulatory-compliance-standards.md). The Azure CSPM standard provides Cloud Infrastructure Entitlement Management (CIEM) recommendations.

When Permissions Management (CIEM) is disabled, the CIEM recommendations within the Azure CSPM standard aren't calculated.

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Search for and select  **Microsoft Defender for Cloud**.

3. Navigate to **Environment settings**.

4. Select relevant subscription.

5. Locate the Defender CSPM plan and select **Settings**.

6. Enable **Permissions Management (CIEM)**.

    :::image type="content" source="media/enable-permissions-management/permissions-management-on.png" alt-text="Screenshot that shows you where the toggle is for the permissions management is located." lightbox="media/enable-permissions-management/permissions-management-on.png":::

7. Select **Continue**.

8. Select **Save**.

The applicable Permissions Management (CIEM) recommendations appear on your subscription within a few hours.

List of Azure recommendations:

- Azure overprovisioned identities should have only the necessary permissions

- Permissions of inactive identities in your Azure subscription should be revoked

## Enable Permissions Management (CIEM) for AWS

When you enabled the Defender CSPM plan on your AWS account, the **AWS CSPM** [standard is automatically assigned to your subscription](concept-regulatory-compliance-standards.md). The AWS CSPM standard provides Cloud Infrastructure Entitlement Management (CIEM) recommendations.
When Permission Management is disabled, the CIEM recommendations within the AWS CSPM standard aren't calculated.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select  **Microsoft Defender for Cloud**.

1. Navigate to **Environment settings**.

1. Select relevant AWS account.

1. Locate the Defender CSPM plan and select **Settings**.

    :::image type="content" source="media/enable-permissions-management/settings.png" alt-text="Screenshot that shows an AWS account and the Defender CSPM plan enabled and where the settings button is located." lightbox="media/enable-permissions-management/settings.png":::

1. Enable **Permissions Management (CIEM)**.

1. Select **Configure access**.

1. Select a deployment method.

1. Run the updated script on your AWS environment using the onscreen instructions.

1. Check the **CloudFormation template has been updated on AWS environment (Stack)** checkbox.

    :::image type="content" source="media/enable-permissions-management/checkbox.png" alt-text="Screenshot that shows where the checkbox is located on the screen.":::

1. Select **Review and generate**.

1. Select **Update**.

The applicable Permissions Management (CIEM) recommendations appear on your subscription within a few hours.

List of AWS recommendations:

- AWS overprovisioned identities should have only the necessary permissions

- Permissions of inactive identities in your AWS account should be revoked

## Enable Permissions Management (CIEM) for GCP

When you enabled the Defender CSPM plan on your GCP project, the **GCP CSPM** [standard is automatically assigned to your subscription](concept-regulatory-compliance-standards.md). The GCP CSPM standard provides Cloud Infrastructure Entitlement Management (CIEM) recommendations.

When Permissions Management (CIEM) is disabled, the CIEM recommendations within the GCP CSPM standard aren't calculated.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **Microsoft Defender for Cloud**.

1. Navigate to **Environment settings**.

1. Select relevant GCP project.

1. Locate the Defender CSPM plan and select **Settings**.

    :::image type="content" source="media/enable-permissions-management/settings-google.png" alt-text="Screenshot that shows where to select settings for the Defender CSPM plan for your GCP project." lightbox="media/enable-permissions-management/settings-google.png":::

1. Toggle Permissions Management (CIEM) to **On**.

1. Select **Save**.

1. Select **Next: Configure access**.

1. Select the relevant permissions type.

1. Select a deployment method.

1. Run the updated Cloud shell or Terraform script on your GCP environment using the on screen instructions.

1. Add a check to the **I ran the deployment template for the changes to take effect** checkbox.

    :::image type="content" source="media/enable-permissions-management/gcp-checkbox.png" alt-text="Screenshot that shows the checkbox that needs to be selected." lightbox="media/enable-permissions-management/gcp-checkbox.png":::

1. Select **Review and generate**.

1. Select **Update**.

The applicable Permissions Management (CIEM) recommendations appear on your subscription within a few hours.

List of GCP recommendations:

- GCP overprovisioned identities should have only necessary permissions

- Permissions of inactive identities in your GCP project should be revoked

## Next step

> [!div class="nextstepaction"]
> [Microsoft Entra Permissions Management](/entra/permissions-management/).
