---
title: Enable Network Security for Azure Storage Blob Connectors
description: Learn how to enable network security for Azure Storage connector resources. Follow step-by-step instructions to secure your storage accounts with Network Security Perimeters.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: krishsa
ms.date: 07/01/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
#customer intent: As a security engineer, I want to configure a Network Security Perimeter for storage accounts used in storage blob connectors
---

# Enable Network Security for Azure Storage blob connectors

## Overview

This article provides step-by-step instructions on how to enable network security on the storage resources integrated with your Azure Storage connector. Azure network security perimeter (NSP) is an Azure-native feature that creates a logical isolation boundary for your PaaS resources. By associating resources like storage accounts or databases with an NSP, you can centrally manage network access using a simplified rule set. For more information, see [Network security perimeter concepts](/azure/private-link/network-security-perimeter-concepts).

## Prerequisites

Before you begin, you must have the following Azure Storage connector resources already deployed and configured:

- **Azure Storage account**: The storage account integrated with your Azure Storage connector.
- **Azure Storage queue**: The queue that receives blob creation event notifications.
- **Event Grid system topic**: The system topic on the storage account that streams blob creation events to the storage queue.

If you haven't created these resources yet, see [Set up your Azure Storage Connector to stream logs to Microsoft Sentinel](setup-azure-storage-connector.md).

To complete this setup, ensure you have the following permissions:

- Subscription Owner or Contributor to create network security perimeter resources.
- Storage Account Contributor to associate the storage account with the NSP.
- Storage Account User Access Administrator or Owner to assign RBAC roles to the Event Grid managed identity.
- Event Grid Contributor to enable managed identity and manage event subscriptions.

## Enable Network Security

To enable network security on the storage resources integrated with your Azure Storage connector, create a Network Security Perimeter (NSP), associate the storage account with it, and configure the rules to allow traffic from Event Grid and other required sources while blocking unauthorized access. Use the following steps to complete the Network Security Perimeter configuration for the storage account.

### Create a Network Security Perimeter

To create a Network Security Perimeter in the Azure portal, perform the following steps:

1. In the Azure portal, search for *Network Security Perimeters*

1. Select **Create**.
1. Select a **Subscription** and **Resource group**.
1. Enter **Name**, for example `storageblob-connectors-nsp`
1. Select a **Region**. The region must be the same region as the storage account.
1. Enter a **Profile name** or accept the default. The profile defines the set of rules that are applied to associated resources. You can have multiple profiles within a single NSP to apply different rules to different resources if required.
1. Select **Review + create**, then select **Create**.

   :::image type="content" source="./media/enable-storage-network-security/create-network-security-perimeter.png" lightbox="./media/enable-storage-network-security/create-network-security-perimeter.png" alt-text="A screenshot showing the creation of a Network Security Perimeter in the Azure portal.":::

### Associate the Storage Account with the Network Security Perimeter

To associate the storage account with the Network Security Perimeter, perform the following steps:

1. Open your newly created Network Security Perimeter resource in the Azure portal.

1. Select **Profiles**, then select the profile name you used when creating the NSP resource.
1. Select **Associated resources**.
1. Select **Add**.
1. Search for and add your storage account, then select **Select**.
1. Select **Associate**.

The access mode is set to **Transition** by default, allowing you to validate the configuration before enforcing restrictions.

   :::image type="content" source="./media/enable-storage-network-security/associate-resources.png" lightbox="./media/enable-storage-network-security/associate-resources.png" alt-text="A screenshot showing how to associate a storage account with the Network Security Perimeter in the Azure portal.":::

### Enable System-Assigned Identity on Event Grid System Topic

To enable a system-assigned managed identity on the Event Grid system topic, perform the following steps:

1. From your storage account, navigate to the **Events** tab.

1. Select the **System Topic** used to stream blob creation events to the storage queue.

   :::image type="content" source="./media/enable-storage-network-security/select-event-system-topic.png" lightbox="./media/enable-storage-network-security/select-event-system-topic.png" alt-text="A screenshot showing the Event tab for Storage Accounts in the Azure portal.":::

1. Select **Identity**.
1. On the **System assigned** tab, set the **Status** to **On**.
1. Select **Save**, then copy the managed identity's **Object ID**. You need this Object ID when assigning the **Storage Queue Data Message Sender** role in the next section.

   :::image type="content" source="./media/enable-storage-network-security/create-system-assigned-identity.png" lightbox="./media/enable-storage-network-security/create-system-assigned-identity.png" alt-text="A screenshot showing the creation of a managed identity for an Event Grid System Topic in the Azure portal.":::

### Grant RBAC permissions on the Storage Queue

To grant the Event Grid system topic managed identity permission to send messages to the storage queue, perform the following steps:

1. Navigate to your **Storage Account**.
1. Select **Access Control (IAM)**.
1. Select **Add**.
1. Search for and select the **Storage Queue Data Message Sender** role (scope: the storage account).
1. Select the **Members** tab and then **Select members**.
1. In the **Select members** pane, paste the Object ID of the system-assigned managed identity for the Event Grid system topic.
1. Select the managed identity and then select **Select**.
1. Select **Review + assign** to complete the role assignment.
   :::image type="content" source="./media/enable-storage-network-security/add-role-assignment.png" lightbox="./media/enable-storage-network-security/add-role-assignment.png" alt-text="A screenshot showing the assignment of the Storage Queue Data Message Sender role to a managed identity in the Azure portal.":::

### Enable Managed Identity on the event subscription

To enable managed identity on the event subscription, perform the following steps:

1. Open the **Event Grid System Topic**.
1. Select the event subscription that targets the queue.
1. Select the **Additional settings** tab.
1. Set **Managed identity type** to **System-assigned**.
1. Select **Save**.
1. Review the Event Grid subscription metrics to validate messages are successfully published to the storage queue after this update.

:::image type="content" source="./media/enable-storage-network-security/set-additional-features.png" lightbox="./media/enable-storage-network-security/set-additional-features.png" alt-text="A screenshot showing the enabling of managed identity for an Event Grid subscription in the Azure portal.":::

### Configure Inbound Access rules on the Network Security Perimeter profile

The following rules are required to allow Event Grid to deliver messages to the storage account while blocking unauthorized access. Depending on the system sending data to the storage account or accessing the storage resources, you may need to add additional inbound rules. Review your scenario and traffic patterns to determine whether you need only the required Event Grid rules or additional inbound NSP rules, and allow time for rule propagation.

#### Rule 1: Allow the Subscription (Event Grid Delivery)

Event Grid delivery doesn't originate from fixed public IPs. The NSP validates delivery using subscription identity.

1. Navigate to Network Security Perimeter and select your NSP.
1. Select **Profiles** and then select the profile associated with your storage account.
1. Select **Inbound access rules** and then select **Add**.

   :::image type="content" source="./media/enable-storage-network-security/inbound-access-rules.png" lightbox="./media/enable-storage-network-security/inbound-access-rules.png" alt-text="A screenshot showing the Inbound access rules page in the Azure portal.":::

1. Enter a **Rule name**; for example, `Allow-Subscription`.

1. Select *Subscription* from the **Source type** drop-down.
1. Select your subscription from the **Allowed Sources** drop-down.
1. Select **Add** to create the rule.

   :::image type="content" source="./media/enable-storage-network-security/add-inbound-rule.png" lightbox="./media/enable-storage-network-security/add-inbound-rule.png" alt-text="A screenshot showing the creation of an inbound access rule to allow a subscription in the Azure portal.":::

> [!NOTE]
> Rules can take a few minutes to appear in the list after creation.

#### Rule 2: Allow Scuba service IP ranges

Create an inbound rule that allows the Scuba service IP ranges required for this scenario.

1. Create a second **Inbound access rules**.
1. Enter a **Rule name**; for example, `Allow-Scuba`.
1. Select **IP address ranges** from the **Source type** drop-down.
1. Open the [Download Azure service tags JSON files](/azure/virtual-network/service-tags-overview#discover-service-tags-by-using-downloadable-json-files) page.
1. Select your cloud; for example, **Azure Public**.
1. Select the **Download** button and open the downloaded file to get the list of IP ranges.
1. Find the `Scuba` service tag and copy the associated IPv4 ranges.

   > [!IMPORTANT]
   > Remove the quotes from the IP ranges and ensure that there's no trailing comma on the last entry before pasting them into the **Allowed Sources** field. Service tag ranges update over time; refresh regularly to keep rules current.

1. Paste the IPv4 ranges into the **Allowed Sources** field after removing any quotes and trailing commas.
1. Select **Add** to create the rule.

   :::image type="content" source="./media/enable-storage-network-security/scuba-ipv4-addresses.png" lightbox="./media/enable-storage-network-security/scuba-ipv4-addresses.png" alt-text="A screenshot showing a part of the ServiceTags_Public.json file with the Scuba service tag and IPv4 ranges highlighted.":::

### Validate and enforce

After configuring the rules, monitor the diagnostic logs for the Network Security Perimeter to validate that legitimate traffic is allowed and there are no disruptions. Once you have confirmed that the rules are correctly allowing necessary traffic, you can switch from Transition mode to Enforced mode to block unauthorized access.

#### Transition mode

Enable Network Security Perimeter diagnostic logs and review collected telemetry to validate communication patterns before enforcement. For more information, see [Diagnostic logs for Network Security Perimeter](/azure/private-link/network-security-perimeter-diagnostic-logs).

#### Apply Enforcement mode

Once validation is successful, set the access mode to **Enforced** as follows:

1. From the Network Security Perimeter page, under **Settings**, select **Associated resources**.
1. Select the storage account.
1. Select **Change access mode**.
1. Select **Enforced** and then **Save**.

   :::image type="content" source="./media/enable-storage-network-security/change-access-mode.png" lightbox="./media/enable-storage-network-security/change-access-mode.png" alt-text="A screenshot showing how to change the access mode of a storage account associated with a Network Security Perimeter in the Azure portal.":::

### Post-enforcement validation

After you set the NSP access mode to **Enforced**, monitor the environment closely for any blocked traffic that may indicate misconfigurations. Validate the Event Grid configuration isn't impacted by reviewing the Event Grid system topic subscription metrics.

Use the diagnostic logs to investigate and resolve any issues that arise. Review the metrics on the storage account (queue ingress and errors) and Event Grid (delivery success) to validate for any errors. Roll back to Transition Mode if you experience any disruption and repeat investigation using the diagnostic logs.

#### Set Secured by Perimeter on the Storage Account (Optional)

Setting the storage account to **Secured by Perimeter** ensures that all traffic to the storage account is evaluated against the Network Security Perimeter rules and blocks public network access.

1. Navigate to your **Storage Account**.
1. Under **Security + networking**, select **Networking**.
1. Under **Public network access**, select **Manage**.
1. Set **Secured by Perimeter (Most restricted)**.
1. Select **Save**.

:::image type="content" source="./media/enable-storage-network-security/set-storage-networking.png" lightbox="./media/enable-storage-network-security/set-storage-networking.png" alt-text="A screenshot showing how to set a storage account to 'Secured by Perimeter' in the Azure portal.":::

## Related content

- [What is a network security perimeter?](/azure/private-link/network-security-perimeter-concepts)
- [Azure Storage Blob data connector reference for the Codeless Connector Framework](data-connection-rules-reference-azure-storage.md)
- [Troubleshoot Azure Storage Blob connector issues](azure-storage-blob-connector-troubleshoot.md)
