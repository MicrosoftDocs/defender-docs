---
title: Move an "iotsecuritysolutions" resource to another region by using the Azure portal
description: Move an "iotsecuritysolutions" resource from one Azure region to another by using the Azure portal.
ms.topic: how-to
ms.custom: subject-moving-resources, msecd-doc-authoring-1014
ms.date: 06/12/2026
ai-usage: ai-assisted
---

# Move an "iotsecuritysolutions" resource to another region by using the Azure portal

There are various scenarios for moving an existing resource from one region to another. For example, you might want to take advantage of features, and services that are only available in specific regions, to meet internal policy and governance requirements, or in response to capacity planning requirements.

You can move a Microsoft Defender for IoT "iotsecuritysolutions" resource to a different Azure region. The "iotsecuritysolutions" resource is a hidden resource that is connected to a specific IoT hub resource that is used to enable security on the hub. Learn how to [configure, and create](/azure/templates/microsoft.security/iotsecuritysolutions?tabs=bicep) the "iotsecuritysolutions" resource.

## Resource prerequisites

Before you begin the move, make sure the following prerequisites are met:

- Make sure that the resource is in the Azure region that you want to move from.

- An existing "iotsecuritysolutions" resource.  

- Make sure that your Azure subscription allows you to create "iotsecuritysolutions" resources in the target region.

- Make sure that your subscription has enough resources to support the addition of resources for this process. For more information, see [Azure subscription and service limits, quotas, and constraints](/azure/azure-resource-manager/management/azure-subscription-service-limits#azure-networking-limits)

<a name="alert-preparation"></a>
## Prepare alerts before moving the resource

Prepare the "iotsecuritysolutions" resource for the region move by locating it and confirming its current region.

Before transitioning the resource to the new region, we recommend that you create a [Log Analytics workspace](/azure/azure-monitor/logs/quick-create-workspace) to preserve your existing alerts and raw events. A Log Analytics workspace provides a central location to retain this data so that it remains available after the move.

**To find the resource you want to move**:

1. Sign in to the [Azure portal](https://portal.azure.com), and then select **All Resources**.

1. Select **Show hidden types**.

    :::image type="content" source="media/region-move/hidden-resources.png" alt-text="Screenshot showing where the Show hidden resources checkbox is located.":::

1. Select the **Type** filter, and enter `iotsecuritysolutions` in the search field.

    :::image type="content" source="media/region-move/filter-type.png" alt-text="Screenshot showing you how to filter by type.":::

1. Select **Apply**.

1. Select your hub from the list.

1. Ensure that you've selected the correct hub, and that it is in the region you want to move it from.

    :::image type="content" source="media/region-move/location.png" alt-text="Screenshot showing you the region your hub is located in.":::

<a name="moving-iot-hub"></a>
## Move the IoT Hub to another region

The hidden "iotsecuritysolutions" resource is tied to its associated IoT Hub, so moving the resource to another region requires cloning the IoT Hub to the target region. To clone the IoT Hub and its linked "iotsecuritysolutions" resource, follow the instructions in [Clone and migrate an IoT Hub to another region](/azure/iot-hub/iot-hub-how-to-clone).

After the IoT Hub move is complete and Defender for IoT is re-enabled on the destination hub, you can reconnect it to the Log Analytics workspace that you configured before the move.

<a name="resource-verification"></a>
## Verify the moved resource in the target region

After the move, verify that the "iotsecuritysolutions" resource is in the target region, that the Defender for IoT connection to the IoT Hub is enabled, and that recommendations are working correctly.

**To verify the resource is in the correct region**:

1. Sign in to the [Azure portal](https://portal.azure.com), and then select **All Resources**.

1. Select **Show hidden types**.

    :::image type="content" source="media/region-move/hidden-resources.png" alt-text="Screenshot showing where the Show hidden resources checkbox is located.":::

1. Select the **Type** filter, and enter `iotsecuritysolutions` in the search field.

1. Select **Apply**.

1. Select your hub from the list.

1. Ensure that the region has been changed.

    :::image type="content" source="media/region-move/location-changed.png" alt-text="Screenshot that shows you the region your hub is located in.":::

**To ensure everything is working correctly**:

1. Navigate to **IoT Hub** > **`Your hub`** > **Defender for IoT**, and select Recommendations.

    :::image type="content" source="media/region-move/recommendations.png" alt-text="Screenshot showing you where to go to see recommendations.":::

The recommendations should have transferred and everything should be working correctly.

## Clean up source resources

Don’t clean up until you have finished verifying that the resource has moved, and the recommendations have transferred. When you're ready, clean up the old resources by performing these steps:

- Deleting the old hub removes all active devices from the hub. If you haven't already, delete the old hub.

- If you have routing resources that you moved to the new location, you can delete the old routing resources.

## Next steps

In this tutorial, you moved an Azure resource from one region to another and cleaned up the source resource.

- Learn more about [Moving your resources to a new resource group or subscription.](/azure/azure-resource-manager/management/move-resource-group-and-subscription).

- Learn how to [move VMs to another Azure region](/azure/site-recovery/azure-to-azure-tutorial-migrate).
