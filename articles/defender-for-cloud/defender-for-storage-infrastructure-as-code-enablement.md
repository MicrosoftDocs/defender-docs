---
title: Enable Defender for Storage by using infrastructure as code
description: Use ARM templates, Bicep, or Terraform to automate Defender for Storage deployment at subscription and storage account levels.
ms.date: 05/26/2026
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
#customer intent: As a security administrator, I want to enable and configure Microsoft Defender for Storage by using infrastructure as code (IaC) templates so that I can help protect all storage accounts.
---

# Enable Defender for Storage by using infrastructure as code

## Enable Defender for Storage by using infrastructure as code

We recommend that you enable Microsoft Defender for Storage on the subscription level. Doing so helps ensure that all storage accounts currently in the subscription are protected. Protection for storage accounts that you create after enabling Defender for Storage on the subscription level starts up to 24 hours after creation.

> [!TIP]
> You can always override subscription-level settings by configuring specific storage accounts with custom settings. See [Override Defender for Storage subscription-level settings](advanced-configurations-for-malware-scanning.md#override-defender-for-storage-subscription-level-settings).

## [Enable on a subscription](#tab/enable-subscription/)

### Terraform template

To enable and configure Defender for Storage at the subscription level by using Terraform, you can use the following code snippet:

```terraform
resource "azurerm_security_center_subscription_pricing" "DefenderForStorage" {
  tier          = "Standard"
  resource_type = "StorageAccounts"
  subplan       = "DefenderForStorageV2"
 
  extension {
    name = "OnUploadMalwareScanning"
    additional_extension_properties = {
      CapGBPerMonthPerStorageAccount = "10000"
      BlobScanResultsOptions = "BlobIndexTags"
    }
  }
 
  extension {
    name = "SensitiveDataDiscovery"
  }
}
```

By customizing this code, you can:

- **Modify the monthly cap for malware scanning**: Adjust the `CapGBPerMonthPerStorageAccount` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Remove the corresponding extension block from the Terraform code.
- **Disable the entire Defender for Storage plan**: Set the `tier` property value to `"Free"`, and remove the `subPlan` and `extension` properties.

To learn more about the `azurerm_security_center_subscription_pricing` resource, refer to the [azurerm_security_center_subscription_pricing Terraform documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing). For comprehensive details on the Terraform provider for Azure, see the [Terraform AzureRM documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

### Bicep template

To enable and configure Defender for Storage at the subscription level by using Bicep (see [Bicep overview](/azure/azure-resource-manager/bicep/overview?tabs=bicep)), make sure your target scope is set to `subscription` (see [Deploy Bicep to subscription](/azure/azure-resource-manager/bicep/deploy-to-subscription?tabs=azure-cli#scope-to-subscription)). Add the following code to your Bicep template:

```bicep
targetScope = 'subscription'

resource StorageAccounts 'Microsoft.Security/pricings@2023-01-01' = {
  name: 'StorageAccounts'
  properties: {
    pricingTier: 'Standard'
    subPlan: 'DefenderForStorageV2'
    extensions: [
      {
        name: 'OnUploadMalwareScanning'
        isEnabled: 'True'
        additionalExtensionProperties: {
          CapGBPerMonthPerStorageAccount: '10000'
          BlobScanResultsOptions: 'BlobIndexTags'
        }
      }
      {
        name: 'SensitiveDataDiscovery'
        isEnabled: 'True'
      }
    ]
  }
}
```

By customizing this code, you can:

- **Modify the monthly cap for malware scanning**: Adjust the `CapGBPerMonthPerStorageAccount` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Change the `isEnabled` value to `False` under `SensitiveDataDiscovery`.
- **Disable the entire Defender for Storage plan**: Set the `pricingTier` property value to `Free`, and remove the `subPlan` and `extensions` properties.

For Bicep template details, see [Microsoft.Security pricing documentation](/azure/templates/microsoft.security/pricings?pivots=deployment-language-bicep&source=docs).

### Azure Resource Manager template

To enable and configure Defender for Storage at the subscription level by using an Azure Resource Manager template (ARM template), add this JSON snippet to the `resources` section of your ARM template:

```json
{
    "type": "Microsoft.Security/pricings",
    "apiVersion": "2023-01-01",
    "name": "StorageAccounts",
    "properties": {
        "pricingTier": "Standard",
        "subPlan": "DefenderForStorageV2",
        "extensions": [
            {
                "name": "OnUploadMalwareScanning",
                "isEnabled": "True",
                "additionalExtensionProperties": {
                    "CapGBPerMonthPerStorageAccount": "10000",
                    "BlobScanResultsOptions": "BlobIndexTags"
                }
            },
            {
                "name": "SensitiveDataDiscovery",
                "isEnabled": "True"
            }
        ]
    }
}
```

By customizing this code, you can:

- **Modify the monthly cap for malware scanning**: Adjust the `CapGBPerMonthPerStorageAccount` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Change the `isEnabled` value to `False` under `SensitiveDataDiscovery`.
- **Disable the entire Defender for Storage plan**: Set the `pricingTier` property value to `Free`, and remove the `subPlan` and `extension` properties.

For ARM template details, see [Microsoft.Security pricing documentation](/azure/templates/microsoft.security/pricings?pivots=deployment-language-arm-template&source=docs).

## [Enable on a storage account](#tab/enable-storage-account/)

### Terraform template

To enable and configure Defender for Storage at the storage account level by using Terraform, import the AzAPI provider (see [AzAPI provider documentation](https://registry.terraform.io/providers/Azure/azapi/latest/docs)) and use the following code snippet:

```terraform
resource "azurerm_storage_account" "example" { ... }

resource "azapi_resource_action" "enable_defender_for_Storage" {
  type        = "Microsoft.Security/defenderForStorageSettings@2022-12-01-preview"
  resource_id = "${azurerm_storage_account.example.id}/providers/Microsoft.Security/defenderForStorageSettings/current"
  method      = "PUT"

  body = jsonencode({
    properties = {
      isEnabled = true
      malwareScanning = {
        onUpload = {
          isEnabled     = true
          capGBPerMonth = 10000
          blobScanResultsOptions = BlobIndexTags
        }
      }
      sensitiveDataDiscovery = {
        isEnabled = true
      }
      overrideSubscriptionLevelSettings = true
    }
  })
}
```

In this code, `azapi_resource_action` is an action that's specific to the configuration of Defender for Storage. It's different from the typical resource declarations in Terraform. It's used to perform specific actions on the resource, such as enabling or disabling features.

By customizing this code, you can:

- **Modify the monthly cap for malware scanning**: Adjust the `capGBPerMonth` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Change the `isEnabled` value to `False` in the section for the `malwareScanning` or `sensitiveDataDiscovery` property.
- **Disable the entire Defender for Storage plan**: Use the following code snippet:

  ```terraform
  resource "azurerm_storage_account" "example" { ... }

  resource "azapi_resource_action" "disable_defender_for_Storage" {
    type        = "Microsoft.Security/defenderForStorageSettings@2022-12-01-preview"
    resource_id = "${azurerm_storage_account.example.id}/providers/Microsoft.Security/defenderForStorageSettings/current"
    method      = "PUT"

    body = jsonencode({
      properties = {
        isEnabled = false
        overrideSubscriptionLevelSettings = false
      }
    })
  }
  ```

  If you want to disable the Defender for Storage plan for the storage account under subscriptions with Defender for Storage enabled at the subscription level, you can change the value of `overrideSubscriptionLevelSettings` to `True`. If you want to keep some features enabled, you can modify the properties accordingly.

For further customization and control over your storage account security settings, see [Microsoft.Security/defenderForStorageSettings API documentation](/rest/api/defenderforcloud-composite/defender-for-storage/create?view=rest-defenderforcloud-composite-latest&tabs=HTTP&preserve-view=true). For comprehensive details on the Terraform provider for Azure, see [Terraform AzureRM documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs).

### Bicep template

To enable and configure Defender for Storage at the storage account level by using Bicep, add the following code to your Bicep template:

```bicep
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' ...

resource defenderForStorageSettings 'Microsoft.Security/DefenderForStorageSettings@2022-12-01-preview' = {
  name: 'current'
  scope: storageAccount
  properties: {
    isEnabled: true
    malwareScanning: {
      onUpload: {
        isEnabled: true
        capGBPerMonth: 10000
        blobScanResultsOptions: BlobIndexTags
      }
    }
    sensitiveDataDiscovery: {
      isEnabled: true
    }
    overrideSubscriptionLevelSettings: true
  }
}
```

By customizing this code, you can:

- **Modify the monthly cap for malware scanning**: Adjust the `capGBPerMonth` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Change the `isEnabled` value to `False` in the section for the `malwareScanning` or `sensitiveDataDiscovery` property.
- **Disable the entire Defender for Storage plan**: Set the `isEnabled` property value to `False`, and remove the `malwareScanning` and `sensitiveDataDiscovery` sections from the properties.

For more information, see [Microsoft.Security/DefenderForStorageSettings API documentation](/rest/api/defenderforcloud-composite/defender-for-storage/create?view=rest-defenderforcloud-composite-latest&tabs=HTTP&preserve-view=true).

### ARM template

To enable and configure Defender for Storage at the storage account level by using an Azure Resource Manager template (ARM template), add this JSON snippet to the `resources` section of your ARM template:

```json
{
    "type": "Microsoft.Security/DefenderForStorageSettings",
    "apiVersion": "2022-12-01-preview",
    "name": "current",
    "properties": {
        "isEnabled": true,
        "malwareScanning": {
            "onUpload": {
                "isEnabled": true,
                "capGBPerMonth": 10000,
                "blobScanResultsOptions": BlobIndexTags
            }
        },
        "sensitiveDataDiscovery": {
            "isEnabled": true
        },
        "overrideSubscriptionLevelSettings": true
    },
    "scope": "[resourceId('Microsoft.Storage/storageAccounts', parameters('StorageAccountName'))]"
}
```

By customizing this code, you can:

- **Modify the monthly cap for malware scanning**: Adjust the `capGBPerMonth` parameter to your preferred value. This parameter sets a cap on the maximum data that can be scanned for malware each month, per storage account. If you want to permit unlimited scanning, assign the value `-1`. The default limit is 10,000 GB.
- **Turn off the on-upload malware scanning or sensitive-data threat detection feature**: Change the `isEnabled` value to `False` in the section for the `malwareScanning` or `sensitiveDataDiscovery` property.
- **Disable the entire Defender for Storage plan**: Set the `isEnabled` property value to `False`, and remove the `malwareScanning` and `sensitiveDataDiscovery` sections from the properties.

---

> [!TIP]
> You can configure malware scanning to send scanning results to:
>
> - [Azure Event Grid custom topic](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-event-grid-for-malware-scanning): For near-real-time automatic response based on every scanning result.
> - [Log Analytics workspace](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-logging-for-malware-scanning): For storing every scan result in a centralized log repository for compliance and audit.
>
> [Learn more on how to set up a response for malware scanning results](defender-for-storage-configure-malware-scan.md).

## Next step

> [!div class="nextstepaction"]
> [Review Microsoft.Security/DefenderForStorageSettings API documentation](/rest/api/defenderforcloud-composite/defender-for-storage/create?view=rest-defenderforcloud-composite-latest&tabs=HTTP&preserve-view=true)
