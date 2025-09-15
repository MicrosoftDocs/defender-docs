---
title: Enable Microsoft Defender for Storage with Azure PowerShell
description: Learn how to enable Microsoft Defender for Storage on your Azure subscription for Microsoft Defender for Cloud by using Azure PowerShell.
ms.topic: install-set-up-deploy
ms.date: 06/30/2025
---

# Enable and configure Microsoft Defender for Storage with Azure PowerShell

We recommend that you enable Microsoft Defender for Storage on the subscription level. Doing so helps ensure that all storage accounts currently in the subscription are protected. Protection for storage accounts that you create after enabling Defender for Storage on the subscription level starts up to 24 hours after creation.

> [!TIP]
> You can always [configure specific storage accounts](advanced-configurations-for-malware-scanning.md#override-defender-for-storage-subscription-level-settings) with custom settings that differ from the settings configured at the subscription level. That is, you can override subscription-level settings.

## Set up Azure PowerShell

Before you work with Azure PowerShell, perform the following steps:

1. If you don't have it already, [install the Az PowerShell module](/powershell/azure/install-azure-powershell).

1. Use the `Connect-AzAccount` cmdlet to sign in to your Azure account. [Learn more about signing in to Azure by using Azure PowerShell](/powershell/azure/authenticate-azureps).

1. Use the following commands to register your subscription to the Microsoft Defender for Cloud resource provider. Replace `<subscriptionId>` with your subscription ID.

    ```powershell
    Set-AzContext -Subscription <subscriptionId>
    Register-AzResourceProvider -ProviderNamespace 'Microsoft.Security'
    ```

## Enable and configure Defender for Storage

### [Enable on a subscription](#tab/enable-subscription/)

Enable Defender for Storage at the subscription level with per-transaction pricing by using the `Set-AzSecurityPricing` cmdlet:

```powershell
Set-AzSecurityPricing -Name "StorageAccounts" -PricingTier "Standard" -SubPlan "DefenderForStorageV2" -Extension '[
    {
        "name": "OnUploadMalwareScanning",
            "isEnabled": "True",
        "additionalExtensionProperties": {
            "CapGBPerMonthPerStorageAccount": "10000"
        }
    },
    {
        "name": "SensitiveDataDiscovery",
        "isEnabled": "True"
    }]'
```

If you don't provide extension properties for the cmdlet, both malware scanning and sensitive data discovery are enabled by default.

By customizing this code, you can:

- **Modify the monthly threshold for on-upload malware scanning**: Adjust the `CapGBPerMonthPerStorageAccount` property to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Change the `isEnabled` value to `False` on the `OnUploadMalwareScanning` and `SensitiveDataDiscovery` extension properties.
- **Disable the entire Defender for Storage plan**: Set the `-PricingTier` property value to `Free`, and remove the `-SubPlan` and `-Extension` properties.

> [!TIP]
> You can use the [GetAzSecurityPricing](/powershell/module/az.security/get-azsecuritypricing) cmdlet to see all of the Defender for Cloud plans that are enabled for the subscription.

For more information about the `Set-AzSecurityPricing` cmdlet, see the [Azure PowerShell reference](/powershell/module/az.security/set-azsecuritypricing).

### [Enable on a storage account](#tab/enable-storage-account/)

Enable and configure Defender for Storage at the storage account level by using the `Update-AzSecurityDefenderForStorage` cmdlet. In the following example, replace the `<SubscriptionId>`, `<ResourceGroupName>`, and `<StorageAccountName>` values with your own Azure subscription ID, resource group, and storage account name.

```powershell
Update-AzSecurityDefenderForStorage -ResourceId "/subscriptions/<SubscriptionId>/resourcegroups/<ResourceGroupName>/providers/Microsoft.Storage/storageAccounts/<StorageAccountName>" -IsEnabled -OverrideSubscriptionLevelSetting -OnUploadIsEnabled -OnUploadCapGbPerMonth 7000 -SensitiveDataDiscoveryIsEnabled
```

With Defender for Storage enabled at the subscription level, the `-OverrideSubscriptionLevelSetting` parameter is necessary to override the settings at the subscription level. If you don't use the override parameter, the extensions are set according to the subscription-level settings, regardless of the parameter values that you supply in the cmdlet.

By customizing this code, you can:

- **Modify the monthly threshold for malware scanning**: Adjust the `-OnUploadCapGBPerMonth` parameter to your preferred value. This parameter sets a cap on the maximum data to be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Send malware scan results to Azure Event Grid**: Supply the Event Grid topic's resource ID in the parameter  `-MalwareScanningScanResultsEventGridTopicResourceId "<resourceId>"`.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Set `-OnUploadIsEnabled:$false` or `-SensitiveDataDiscoveryIsEnabled:$false`, respectively.
- **Disable the entire Defender for Storage plan**: Set `IsEnabled:$false`, `-OnUploadIsEnabled:$false`, and `-SensitiveDataDiscoveryIsEnabled:$false`.

> [!TIP]
> You can use the [`Get-AzSecurityDefenderForStorage`](/powershell/module/az.security/get-azsecuritydefenderforstorage) cmdlet to see the Defender for Storage settings for a storage account.

For more information about the `Update-AzSecurityDefenderForStorageRefer` cmdlet, see the [Azure PowerShell reference](/powershell/module/az.security/update-azsecuritydefenderforstorage).

---

> [!TIP]
> You can configure malware scanning to send scanning results to:
>
> - [Event Grid custom topic](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-event-grid-for-malware-scanning): For near-real-time automatic response based on every scanning result.
> - [Log Analytics workspace](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-logging-for-malware-scanning): For storing every scan result in a centralized log repository for compliance and audit.
>
> [Learn more on how to set up a response for malware scanning results](defender-for-storage-configure-malware-scan.md).

## Related content

- Learn how to [enable and configure the Defender for Storage plan at scale by using an Azure built-in policy](defender-for-storage-policy-enablement.md).
- Learn more about [using PowerShell with Defender for Cloud](powershell-onboarding.md).
