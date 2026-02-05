# Enable network security on  connector integrated storage resources

This article provides step-by-step instructions on how to enable network security on the storage resources integrated with your Azure Storage connector.

## Prerequisites

To complete this setup, ensure you have the following permissions:

- Subscription-level Owner or Contributor  to create Security Perimeter resources.
-  Storage Account Contributor  to associate the storage account with the NSP.
-  Storage Account User Access Administrator or Owner to assign RBAC roles to the Event Grid managed identity.
-  EventGrid Contributor to enable managed identity and manage event subscriptions.

## Enable Network Security

To enable network security on the storage resources integrated with your Azure Storage connector, you need to create a Network Security Perimeter (NSP) and associate the storage account with it. Then, you will configure the necessary rules to allow traffic from Event Grid and other relevant sources while blocking unauthorized access. Follow the steps below to complete this configuration:

### Create a Network Security Perimeter
1. In the Azure Portal, search for *Network Security Perimeters*.
1. Select **Create**.
1. Configure the following fields:
   - **Subscription** and **Resource group**
   - **Name**, for example `storageblob-connectors-nsp`
   - **Region**. This must be the same region as the storage account.
<<<<< Profile- you need a profile to associate resources with the NSP. Create one in the next step.>>>>>
### Create a Network Security Profile
1. Open the **Network Security Perimeter**.
1. Select **Profiles**.
1. Create a new profile with a **Name**, for example `connectors profile`

### Associate the Storage Account (Transition Mode)
1. In the **Connectors Profile**, open **Associated resources**.
1. Add the **Storage Account(s)**.
1. Set **Association mode** to **Transition**.
   - Transition mode allows traffic to continue while rules are validated and telemetry is streamed to diagnostic logs.
   - Recommended before enforcing restrictions.

### Enable System-Assigned Identity on Event Grid System Topic
1. Open the **Event Grid System Topic**.
2. Go to **Identity**.
3. Enable **System-assigned**.
4. Save the configuration.

### Grant RBAC Permissions on the Storage Queue
1. Open the **Storage Account(s)**.
2. Go to **Access Control (IAM)**.
3. Add a role assignment:
   - **Role**: Storage Queue Data Message Sender
   - **Principal**: Event Grid system topic managed identity

### Enable Managed Identity on the Event Subscription
1. Open the **Event Grid System Topic**.
2. Select the event subscription targeting the queue.
3. Edit destination settings:
   - Set **Authentication type** to **System-assigned managed identity**.
4. Save changes.
5. Review the event grid subscriptions metrics to validate messages are still successfully published to the storage queue after this update.

### Configure Inbound Access Rules on the Network Security Perimeter Profile

The following rules are required to allow Event Grid to deliver messages to the storage account while blocking unauthorized access. Depending on the system sending data to the storage account or accessing the storage resources, you may need to add additional inbound rules. Review your scenario and traffic patterns to safely apply the necessary rules.

#### Rule 1: Allow the Subscription (Event Grid Delivery)

Event Grid delivery does not originate from fixed public IPs. NSP validates delivery using subscription identity.

1. Create an inbound rule.
2. Configure the following settings:
   - **Source type**: Subscription
   - **Subscription ID**: The subscription containing the storage account and Event Grid system topic
   - **Name**: Allow-Subscription


#### Rule 2: Allow Scuba Service IP Ranges

1. Create a new inbound rule.
2. Configure the following settings:
   - **Source type**: IP address ranges
   - **IP ranges**: Access the [service tag download](/azure/virtual-network/service-tags-overview#discover-service-tags-by-using-downloadable-json-files) and collect the IP ranges from the Scuba service tag.
   - **Name**: Allow-Scuba


### 8: Validate and Enforce

After configuring the rules, monitor the diagnostic logs for the Network Security Perimeter to validate that legitimate traffic is allowed and there are no disruptions. Once you have confirmed that the rules are correctly allowing necessary traffic, you can switch from Transition mode to Enforced mode to block unauthorized access.

#### Transition Mode

Enable **Network Security Perimeters diagnostic logs** to review collected telemetry and validate communication patterns before enforcement. Refer to [diagnostic logs documentation](https://learn.microsoft.com/en-us/azure/private-link/network-security-perimeter-diagnostic-logs).

#### Enforcement Mode

Once validation is successful, 
1. Return to **Associated resources**.
1. Change the storage account from **Transition** to **Enforced**.

Following enforcement, monitor the environment closely for any blocked traffic that may indicate misconfigurations or necessary rule adjustments. Use the diagnostic logs to investigate and resolve any issues that arise. Review the metrics on the storage account and event grid to validate for any errors.

Roll back to **Transition Mode** if you experience any disruption and repeat investigation using the diagnostic logs.

### Set Secured by Perimeter on the Storage Account(s)

Setting the storage account to **Secured by Perimeter** ensures that all traffic to the storage account is evaluated against the Network Security Perimeter rules. This adds an additional layer of security by enforcing that all access to the storage account goes through the perimeter.

1. Open the **Storage Account(s)**.
2. Go to **Networking**.
3. Set **Secured by Perimeter**.
4. Save changes.

## Next Steps
In this article, you learned how to enable network security on the storage resources integrated with your Azure Storage connector. For further details, refer to the [Network Security Perimeter documentation](https://learn.microsoft.com/en-us/azure/private-link/network-security-perimeter-concepts).