---
title: Enable Microsoft Defender for Storage with Azure PowerShell
description: Learn how to enable Defender for Storage on your Azure subscription for Defender for Cloud by using Azure PowerShell.
ms.topic: install-set-up-deploy
ms.date: 06/30/2025
---

# Enable and configure Microsoft Defender for Storage with Azure PowerShell

We recommend that you enable Microsoft Defender for Storage on the subscription level. Doing so helps ensure that all storage accounts currently in the subscription are protected. Protection for storage accounts that you create after enabling Defender for Storage on the subscription level starts up to 24 hours after creation.

> [!TIP]
> You can always [configure specific storage accounts](advanced-configurations-for-malware-scanning.md#override-defender-for-storage-subscription-level-settings) with custom configurations that differ from the settings configured at the subscription level. That is, you can override subscription-level settings.

Before you work with Azure PowerShell, perform the following steps:

1. If you don't have it already, [install the Az PowerShell module](/powershell/azure/install-azure-powershell).

1. Use the `Connect-AzAccount` cmdlet to sign in to your Azure account. [Learn more about signing in to Azure by using Azure PowerShell](/powershell/azure/authenticate-azureps).

1. Use these commands to register your subscription to the Microsoft Defender for Cloud resource provider:

    ```powershell
    Set-AzContext -Subscription <subscriptionId>
    Register-AzResourceProvider -ProviderNamespace 'Microsoft.Security'
    ```

    Replace `<subscriptionId>` with your subscription ID.

## [Enable on a subscription](#tab/enable-subscription/)

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

If no extension properties are provided for the cmdlet, both malware scanning and sensitive data discovery are enabled by default.

By customizing this code, you can:

To modify the monthly threshold for on-upload malware scanning in your storage accounts, adjust the `CapGBPerMonthPerStorageAccount` property to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value -1. The default limit is set at 10,000 GB.

If you want to turn off the on-upload malware scanning or sensitive data threat detection features, you can change the `isEnabled` value to `False` on the `OnUploadMalwareScanning` or `SensitiveDataDiscovery` extension properties respectively.

To disable the entire Defender plan, set the `-PricingTier` property value to `Free` and remove the `-SubPlan` and extension properties.

> [!TIP]
> You can use the [GetAzSecurityPricing](/powershell/module/az.security/get-azsecuritypricing) cmdlet to see all of the Defender for Cloud plans that are enabled for the subscription.

Refer to the Azure PowerShell reference for details on the [Set-AzSecurityPricing](/powershell/module/az.security/set-azsecuritypricing) cmdlet.

## [Enable on a storage account](#tab/enable-storage-account/)

Enable and configure Defender for Storage at the storage account level using the `Update-AzSecurityDefenderForStorage`  cmdlet. In this example, replace the `<SubscriptionId>`, `<ResourceGroupName>`, and `<StorageAccountName>` with your own Azure subscription ID, resource group, and storage account names:

```powershell
Update-AzSecurityDefenderForStorage -ResourceId "/subscriptions/<SubscriptionId>/resourcegroups/<ResourceGroupName>/providers/Microsoft.Storage/storageAccounts/<StorageAccountName>" -IsEnabled -OverrideSubscriptionLevelSetting -OnUploadIsEnabled -OnUploadCapGbPerMonth 7000 -SensitiveDataDiscoveryIsEnabled
```

> [!NOTE]
> With Defender for Storage enabled at the subscription level, the `-OverrideSubscriptionLevelSetting` parameter is necessary to override the settings at the subscription level. If the override parameter isn't used, the extensions are set according to the subscription level settings, regardless of the parameter values supplied in the cmdlet.

To modify the monthly threshold for malware scanning the storage account, adjust the `-OnUploadCapGBPerMonth` parameter to your preferred value. This parameter sets a cap on the maximum data to be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value -1. The default limit is set at 10,000 GB.

The malware scan results can be sent to the Event Grid by supplying the Event Grid topic resource ID in the parameter  `-MalwareScanningScanResultsEventGridTopicResourceId "<resourceId>"`.

If you want to turn off the on-upload malware scanning or sensitive data threat detection features for the storage account, set `-OnUploadIsEnabled:$false` or `-SensitiveDataDiscoveryIsEnabled:$false` respectively.

To disable the entire Defender plan for the storage account, set `IsEnabled:$false`, `-OnUploadIsEnabled:$false`, and `-SensitiveDataDiscoveryIsEnabled:$false`.

> [!TIP]
> You can use the [Get-AzSecurityDefenderForStorage](/powershell/module/az.security/get-azsecuritydefenderforstorage) cmdlet to see the Defender for Storage settings for a storage account.

Refer to the Azure PowerShell reference for details on the [Update-AzSecurityDefenderForStorage](/powershell/module/az.security/update-azsecuritydefenderforstorage) cmdlet.

---

[Learn more about using PowerShell with Defender for Cloud](powershell-onboarding.md).

> [!TIP]
> You can configure malware scanning to send scanning results to:
>
> - [Event Grid custom topic](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-event-grid-for-malware-scanning): For near-real-time automatic response based on every scanning result.
> - [Log Analytics workspace](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-logging-for-malware-scanning): For storing every scan result in a centralized log repository for compliance and audit.
>
> [Learn more on how to set up a response for malware scanning results](defender-for-storage-configure-malware-scan.md).

## Related content

- Learn how to [enable and configure the Defender for Storage plan at scale with an Azure built-in policy](defender-for-storage-policy-enablement.md).
