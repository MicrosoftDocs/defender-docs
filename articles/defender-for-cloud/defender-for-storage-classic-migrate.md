---
title: Migrate from Defender for Storage (classic)
description: Learn about how to migrate from Defender for Storage (classic) to the new Defender for Storage plan to take advantage of its enhanced capabilities and pricing.
ms.date: 08/27/2024
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
---

# Move to the new Defender for Storage plan

On March 28, 2023, we introduced the new Defender for Storage plan. This plan offers several benefits not available in the Defender for Storage (classic) per-transaction or per-storage account pricing plans, such as:

- **Enhanced activity monitoring**: Continuous analysis of data plane and control plane activities for threat detection.
- **Detection of compromised or abused SAS tokens**: Continuous analysis of data plane and control plane activities for threat detection, including the detection of misconfigured and overly permissive Shared Access Signatures (SAS tokens) that might be leaked or compromised.
- **Option to enable sensitive data threat detection (add-on)**: Detection of potential exposure events and suspicious activities on resources containing sensitive data resulting in data exfiltration.
- **Option to enable malware scanning (paid add-on)**: Real-time detection of malicious files across all file types.
- **Predictable, per-storage account pricing**: A more foreseeable and flexible pricing structure for better control over coverage.
- **Granular controls at the resource level**: Enable at the subscription or resource level and exclude specific storage accounts from protected subscriptions, providing more granular control over your security coverage.

The new pricing plan charges based on the number of storage accounts you protect, simplifying calculations and allowing for easy scaling as your needs change. For detailed pricing information, see [the pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/).

To take advantage of these features, we recommend moving to the new Defender for Storage plan by February 5, 2025.

> [!NOTE]
> After February 5, 2025, you can no longer enable Defender for Storage (classic), the legacy per-transaction pricing plan, in most scenarios. The only exception is for subscriptions that already have the per-transaction pricing enabled.

## Important changes in Defender for Storage (classic)

Defender for Storage (Classic) offers two pricing structures: per-transaction and per-storage account. Beginning February 5, 2025, this plan will transition to Defender for Storage with per-storage-account pricing.

### Impact on the Defender for Storage (classic) per-transaction plan

The classic per-transaction plan will no longer be available for new storage accounts and subscriptions. Existing accounts will retain the plan without future features and updates, so we encourage you to move to the new plan for the enhanced features and simplified pricing. If your subscription or storage account already has the classic per-transaction plan enabled, it will remain active, but enabling this plan at the resource level will only be possible for these existing subscriptions.

If you have policies that enforce the classic per-transaction plan without specifying the per-transaction subplan, existing subscriptions will retain their current plan, while new subscriptions will default to the new plan. However, if you specify the per-transaction subplan, it will fail for new subscriptions. Once you switch to the new plan, you can no longer revert to the Defender for Storage (classic) per-transaction or per-storage account plans at either the subscription or storage account level.

### Impact in the Defender for Storage (Classic) per-storage account

The classic per-storage-account plan will automatically transition to the Defender for Storage plan without enabling add-on features by default. Storage accounts previously excluded from protected subscriptions in the per-transaction plan won't remain excluded when upgraded to the new plan. If you wish to disable protection on these storage accounts, you can do so in the new plan.

## Identify active Defender for Storage plans

We provide three options to find out your Defender for Storage plans enablement and configuration:

- **KQL query in Resource Graph Explorer**: Use this KQL query in the Azure portal's [Resource Graph Explorer](https://ms.portal.azure.com/#view/HubsExtension/ArgQueryBlade) to view which plans are enabled at the subscription level:

    ```kusto
    // DF-Storage Plans
    securityresources
    | where type == "microsoft.security/pricings"
    | where name == "StorageAccounts"
    | extend pricingTier = properties.pricingTier
    | extend DefenderForStoragePlan = properties.subPlan
    | extend IsInTrialPeriod = properties.freeTrialRemainingTime
    | extend MalwareScanningEnabled = properties.extensions[0].isEnabled
    | extend MalwareScanningCapping = properties.extensions[0].additionalExtensionProperties["CapGBPerMonthPerStorageAccount"]
    | extend SensitiveDataDiscoveryEnabled = properties.extensions[1].isEnabled
    | extend IsEnabled = iff(pricingTier == "Free", "Disabled", "Enabled"), 
        DefenderForStoragePlan  = iff(isnull(DefenderForStoragePlan ), "", DefenderForStoragePlan ), 
        MalwareScanningEnabled = iff(isnull(MalwareScanningEnabled), "", MalwareScanningEnabled), 
        MalwareScanningCapping = iff(isnull(MalwareScanningCapping), "", MalwareScanningCapping), 
        SensitiveDataDiscoveryEnabled = iff(isnull(SensitiveDataDiscoveryEnabled), "", SensitiveDataDiscoveryEnabled),
        IsInTrialPeriod = iff(IsInTrialPeriod == "PT0S", "", "Yes")
    | project properties, tenantId, subscriptionId, IsInTrialPeriod, IsEnabled, DefenderForStoragePlan, MalwareScanningEnabled, MalwareScanningCapping, SensitiveDataDiscoveryEnabled
    ```

- **Detailed analysis with PowerShell script**: For a more detailed investigation, including information at both the subscription and resource levels (with add-ons configuration), run [this PowerShell script](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Powershell%20scripts/Analyze%20Defender%20For%20Storage%20Configuration/Analyze-DefenderForStorageConfig.ps1).
- **Workbook for subscription-level coverage details**: Use the provided workbook to see which plans are enabled at the subscription level and their configuration details. To access the workbook, see [Microsoft Defender for Storage - Price Estimation Dashboard](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Workbooks/Microsoft%20Defender%20for%20Storage%20Price%20Estimation).

## Migration methods

To enable and configure the new Microsoft Defender for Storage plan, you have several options:

- **Azure built-in policy (recommended)**: Apply [built-in policies](defender-for-storage-policy-enablement.md) to uniformly secure all existing and future storage accounts at scale within a defined scope, such as management groups.
- **Infrastructure as Code (IaC) templates**: Use [Terraform](defender-for-storage-infrastructure-as-code-enablement.md#terraform-template), [Bicep](defender-for-storage-infrastructure-as-code-enablement.md#bicep-template), or [Azure Resource Manager](defender-for-storage-infrastructure-as-code-enablement.md#azure-resource-manager-template) templates for automated deployment and configuration.
- **Azure portal**: Migrate to the new plan [through the Azure portal](defender-for-storage-azure-portal-enablement.md).
    1. Navigate to **Environment settings** in Defender for Cloud or the Defender for Cloud pane in one of the storage accounts.
    1. Under **Storage**, select **New plan available**.
    1. In the **Upgrade Defender for Storage plan** pane, choose your configuration options and then select **Upgrade subscription**.
- **REST API**: Use the [REST API](defender-for-storage-rest-api-enablement.md) to enable the new plan programmatically.

## Identify active policies

To enable the new plan, make sure to disable the old Defender for Storage policies:

- "Configure Azure Defender for Storage to be enabled"
- "Azure Defender for Storage should be enabled"
- "Configure Microsoft Defender for Storage to be enabled (per-storage account plan)"
- "Configure Microsoft Defender for Storage (Classic) to be enabled"
- "Deploy Defender for Storage (Classic) on storage accounts"

You can use the following methods to identify the active policies:

### Azure Resource Graph Explorer

To identify active policies in your subscription using [Azure Resource Graph Explorer](https://ms.portal.azure.com/#view/HubsExtension/ArgQueryBlade), run the following query that includes the old Defender for Storage policies. If you have custom policies, modify the query accordingly:

```kusto
policyresources
| where type == "microsoft.authorization/policyassignments"
| where subscriptionId == "{subscriptionId}"
| where properties['displayName'] in ("Configure Azure Defender for Storage to be enabled", "Azure Defender for Storage should be enabled", "Configure Microsoft Defender for Storage to be enabled (per-storage account plan)", "Configure Microsoft Defender for Storage (Classic) to be enabled", "Deploy Defender for Storage (Classic) on storage accounts")
```

### PowerShell

To identify active policies in your subscription using PowerShell, run:

```powershell
Get-AzPolicyAssignment -Scope "/subscriptions/{subscriptionId}"
```

## Next step

In this article, you learned about migrating to the new Microsoft Defender for Storage plan.

> [!div class="nextstepaction"]
> [Enable Defender for Storage](enable-enhanced-security.md)
