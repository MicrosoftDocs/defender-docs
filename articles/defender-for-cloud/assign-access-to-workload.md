---
title: Assign access to workload owners
description: Learn how to assign access to a workload owner of an Amazon Web Service or Google Cloud Platform connector.
ms.author: elkrieger
author: ElazarK
ms.topic: how-to
ms.date: 05/25/2026
ms.custom: sfi-image-nochange
#customer intent: As a workload owner, I want to learn how to assign access to my AWS or GCP connector so that I can view the suggested recommendations provided by Defender for Cloud.
---

# Assign access to workload owners

When you onboard your Amazon Web Service (AWS) or Google Cloud Platform (GCP) environments, Defender for Cloud automatically creates a security connector as an Azure resource in the connected subscription and resource group. Defender for Cloud also creates the identity provider as an Identity and Access Management (IAM) role required during onboarding.

To assign permissions on a specific connector under the parent connector, first decide which AWS accounts or GCP projects users need to access. Then identify the security connectors that map to those accounts or projects.

## Prerequisites

- An Azure account. If you don't already have an Azure account, you can [create your Azure free account today](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- At least one security connector for [Connect Azure subscriptions](connect-azure-subscription.md), [Onboard AWS accounts](quickstart-onboard-aws.md), or [Onboard GCP projects](quickstart-onboard-gcp.md).

## Configure permissions on the security connector

Permissions for security connectors are managed through Azure role-based access control (RBAC).

You can assign roles to users, groups, and applications at the subscription, resource group, or resource level.

To configure connector permissions:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.

1. Locate the relevant AWS or GCP connector.

1. Assign permissions to workload owners by using **All resources** or **Azure Resource Graph** in the Azure portal.

    ### [All resources](#tab/all-resources)

    1. Search for and select **All resources**.

        :::image type="content" source="media/assign-access-to-workload/all-resources.png" alt-text="Screenshot that shows you how to search for and select all resources." lightbox="media/assign-access-to-workload/all-resources.png":::

    1. Select **Manage view** > **Show hidden types**.

        :::image type="content" source="media/assign-access-to-workload/show-hidden-types.png" alt-text="Screenshot that shows you where on the screen to find the show hidden types option." lightbox="media/assign-access-to-workload/show-hidden-types.png":::

    1. Select the **Types equals all** filter.

    1. Enter `securityconnector` in the value field and add a check to the `microsoft.security/securityconnectors`.

        :::image type="content" source="media/assign-access-to-workload/security-connector.png" alt-text="Screenshot that shows where the field is located and where to enter the value on the screen." lightbox="media/assign-access-to-workload/security-connector.png":::

    1. Select **Apply**.

    1. Select the relevant resource connector.

    ### [Azure Resource Graph](#tab/azure-resource-graph)

    1. Search for and select **Resource Graph Explorer**.

        :::image type="content" source="media/assign-access-to-workload/resource-graph-explorer.png" alt-text="Screenshot that shows you how to search for and select resource graph explorer." lightbox="media/assign-access-to-workload/resource-graph-explorer.png":::

    1. Copy and paste the following query to locate the security connector:

        ### [AWS](#tab/aws)

        ```bash
        resources 
        | where type == "microsoft.security/securityconnectors" 
        | extend source = tostring(properties.environmentName)  
        | where source == "AWS" 
        | project name, subscriptionId, resourceGroup, accountId = properties.hierarchyIdentifier, cloud = properties.environmentName  
        ```

        ### [GCP](#tab/gcp)

        ```bash
        resources 
        | where type == "microsoft.security/securityconnectors" 
        | extend source = tostring(properties.environmentName)  
        | where source == "GCP" 
        | project name, subscriptionId, resourceGroup, projectId = properties.hierarchyIdentifier, cloud = properties.environmentName  
        ```

        ---

    1. Select **Run query**.

    1. Toggle formatted results to **On**.

        :::image type="content" source="media/assign-access-to-workload/formatted-results.png" alt-text="Screenshot that shows where the formatted results toggle is located on the screen." lightbox="media/assign-access-to-workload/formatted-results.png":::

    1. Select the relevant subscription and resource group to locate the relevant security connector.

    ---

1. Select **Access control (IAM)**.

    :::image type="content" source="media/assign-access-to-workload/control-i-am.png" alt-text="Screenshot of a security connector resource page with Access control (IAM) highlighted in the left navigation." lightbox="media/assign-access-to-workload/control-i-am.png":::

1. Select **+Add** > **Add role assignment**.

1. Select the desired role.

1. Select **Next**.

1. Select **+ Select members**.

    :::image type="content" source="media/assign-access-to-workload/select-members.png" alt-text="Screenshot that shows where the button is on the screen to select the + select members button.":::

1. Search for and select the relevant user or group.

1. Select the **Select** button.

1. Select **Next**.

1. Select **Review + assign**.

1. Review the information.

1. Select **Review + assign**.

After you set permissions on the security connector, workload owners can view Defender for Cloud recommendations for associated AWS and GCP resources.

## Next step

> [!div class="nextstepaction"]
> [RBAC permissions](permissions.md)

