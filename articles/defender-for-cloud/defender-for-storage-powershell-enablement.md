---
title: Enable and configure the Microsoft Defender for Storage plan at scale using REST API
description: Learn how to enable the Defender for Storage on your Azure subscription for Microsoft Defender for Cloud using REST API.
ms.topic: install-set-up-deploy
ms.date: 08/08/2023
---

# Enable and configure with PowerShell

We recommend that you enable Defender for Storage on the subscription level. Doing so ensures all storage accounts currently in the subscription will be protected. Storage accounts that are created after enabling Defender for Storage on the subscription level will be protected up to 24 hours after creation.

> [!TIP]
> You can always [configure specific storage accounts](/azure/storage/common/azure-defender-storage-configure?toc=%2Fazure%2Fdefender-for-cloud%2Ftoc.json&tabs=enable-subscription#override-defender-for-storage-subscription-level-settings) with custom configurations that differ from the settings configured at the subscription level (override subscription-level settings).

## [Enable on a subscription](#tab/enable-subscription/)

To enable Microsoft Defender for Storage at the subscription level with per-transaction pricing using PowerShell:

1. If you don't have it already, [install the Azure Az PowerShell module](/powershell/azure/install-azure-powershell).
1. Use the `Connect-AzAccount` cmdlet to sign in to your Azure account. Learn more about [signing in to Azure with Azure PowerShell](/powershell/azure/authenticate-azureps).
1. Use these commands to register your subscription to the Microsoft Defender for Cloud Resource Provider:

    ```powershell
    Set-AzContext -Subscription <subscriptionId>
    Register-AzResourceProvider -ProviderNamespace 'Microsoft.Security'
    ```

    Replace `<subscriptionId>` with your subscription ID.

1. Enable Microsoft Defender for Storage for your subscription with the `Set-AzSecurityPricing` cmdlet:

    ```powershell
    Set-AzSecurityPricing -Name "StorageAccounts" -PricingTier "Standard" -SubPlan P2
    ```

> [!TIP]
> You can use the [`GetAzSecurityPricing` (Az_Security)](/powershell/module/az.security/get-azsecuritypricing) to see all of the Defender for Cloud plans that are enabled for the subscription.

To disable the entire Defender plan, set the PricingTier property value to `Free` and remove the `SubPlan` and extensions properties.

Learn more about [using PowerShell with Microsoft Defender for Cloud](powershell-onboarding.md).

To modify the monthly threshold for malware scanning in your storage accounts, adjust the `-CapGBPerMonthPerStorageAccount` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value -1. The default limit is set at 5,000 GB.

If you want to turn off the on-upload malware scanning (`Onor Sensitive data threat detection features, you can change the isEnabled value to **False** under Sensitive data discovery.


Learn more about [updating Defender plans with PowerShell - fix this link](/rest/api/defenderforcloud/pricings/update).

## [Enable on a storage account](#tab/enable-storage-account/)

To enable and configure Microsoft Defender for Storage at the storage account level using PowerShell, use the `Update-AzSecurityDefenderForStorage`  cmdlet. Replace the `SubscriptionId`, `ResourceGroupName`, and `StorageAccountName` with your own Azure subscription ID, resource group and storage account names accordingly.

```powershell
Update-AzSecurityDefenderForStorage -ResourceId "/subscriptions/<SubscriptionId>/resourcegroups/<ResourceGroupName>/providers/Microsoft.Storage/storageAccounts/<StorageAccountName>" -IsEnabled -OnUploadIsEnabled -OnUploadCapGbPerMonth 7000 -SensitiveDataDiscoveryIsEnabled
```


To modify the monthly threshold for malware scanning in your storage accounts, adjust the `capGBPerMonth` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value -1. The default limit is set at 5,000 GB.

If you want to turn off the on-upload malware scanning or sensitive data threat detection features, you can change the `isEnabled` value to **False** under the `malwareScanning` or `sensitiveDataDiscovery` properties sections.

To disable the entire Defender plan for the storage account, set the `isEnabled` property value to **False** and remove the `malwareScanning` and `sensitiveDataDiscovery` sections from the properties.

Learn more about the [Microsoft.Security/DefenderForStorageSettings API](/rest/api/defenderforcloud/defender-for-storage/create) documentation.

---

> [!TIP]
> Malware Scanning can be configured to send scanning results to the following: <br>  **Event Grid custom topic** - for near-real time automatic response based on every scanning result. Learn more how to [configure malware scanning to send scanning events to an Event Grid custom topic](/azure/storage/common/azure-defender-storage-configure?toc=%2Fazure%2Fdefender-for-cloud%2Ftoc.json&tabs=enable-storage-account#setting-up-event-grid-for-malware-scanning). <br> **Log Analytics workspace** - for storing every scan result in a centralized log repository for compliance and audit. Learn more how to [configure malware scanning to send scanning results to a Log Analytics workspace](/azure/storage/common/azure-defender-storage-configure?toc=%2Fazure%2Fdefender-for-cloud%2Ftoc.json&tabs=enable-storage-account#setting-up-logging-for-malware-scanning).

Learn more on how to [set up response for malware scanning](defender-for-storage-configure-malware-scan.md) results.

## Next steps

- Learn how to [enable and Configure the Defender for Storage plan at scale with an Azure built-in policy](defender-for-storage-policy-enablement.md).
