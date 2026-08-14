---
title: External attack surface management initiative in Microsoft Security Exposure Management
description: Learn how to get MDEASM insights into your corporate attack surface with the initiative in Microsoft Security Exposure Management.
ms.topic: how-to
ms.author: dlanger
author: dlanger
ms.date: 05/27/2025
ms.custom:
  - msecd-doc-authoring-1014
  - sfi-ga-nochange
  - sfi-image-nochange
ai-usage: ai-assisted
---


# External attack surface management initiative

Explore how to integrate Microsoft Defender External Attack Surface Management (MDEASM) with Microsoft Security Exposure Management (MSEM) to enhance visibility and control over your organization's external exposures. By connecting MDEASM insights to MSEM using the External attack surface management initiative in Microsoft Security Exposure Management, you can assess the risk associated with your organization's or vendor's external attack surface and manage your security posture more effectively within the Exposure Management portal.

There are two ways to use the External Attack Surface Management initiative:
- **Pre-built footprint**: Provides high-level insights using a predefined set of external assets, without requiring a full MDEASM subscription.
- **Full integration with MDEASM**: Connects directly to your MDEASM subscription for comprehensive exposure analysis and asset-level details.

## Using the EASM initiative with pre-built footprint

The pre-built footprint option for the External Attack Surface Management initiative provides high-level insights without a full connection to an MDEASM subscription and doesn't require an active MDEASM subscription.

**Prerequisites**: To configure your External Attack Surface initiative, you need to have **Global Administrator** role, or **Core security settings (manage)** permissions.

1. Go to the **Initiatives** page, select the **External Attack Surface Protection**, then choose **Open initiative page**.
1. Go to the **Connect data source** to open the settings tab.

    > [!NOTE]
    > If you previously configured the External Attack Surface Protection initiative, you can select **Switch data source** to reconfigure it with new data.

3. Choose **Search for your organization's pre-built footprint**.
4. Select the footprint you want to use from the list of available pre-built footprints and choose **Connect**.

:::image type="content" source="media/EASM/EASM-Pre-built-footprint.png" alt-text="Screenshot of side panel for EASM pre-built footprint selection" lightbox="media/EASM/EASM-Pre-built-footprint.png":::

5. In up to 1 hour, the initiative is populated with high-level metrics and scores from the selected footprint.

    > [!NOTE]
    > The pre-built footprint approach doesn't provide asset-level information or detailed exposure information.

## Using the EASM initiative with full MDEASM integration

**Prerequisites**:
Full integration with MDEASM requires a full MDEASM subscription (trial or paid) and provides comprehensive exposure analysis and asset-level details.
To configure your External Attack Surface initiative, you need to have **Global Administrator** role, or **Core security settings (manage)** permissions.

> [!NOTE]
> External attack surface assets do not support scoping, so all users with access can see all collected data.

<a name="environment-setup"></a>
### Set up the environment for full MDEASM integration

To deploy an MDEASM resource, follow these steps:

1. Log into the [Azure portal](https://portal.azure.com).
2. Create a Resource Group with the appropriate subscription and region.
3. Deploy an MDEASM Resource within that group, see, [Create a Defender EASM Azure resource](/azure/external-attack-surface-management/deploying-the-defender-easm-azure-resource). Each new resource will automatically get a free 30 day trial.

**Discover the attack surface**

You can discover your attack surface in two ways:

1. Use the **Get Started** option to search for your organization and build a preconfigured attack surface.
1. Or, create a custom discovery group by providing:

- Domains
- IP Blocks or Addresses (use example IPs such as 203.0.113.0 if needed)
- Hosts
- ASNs
- Emails
- WHOIS organization data

For more information, see [Discovering your attack surface](/azure/external-attack-surface-management/discovering-your-attack-surface)

> [!TIP]
> The easiest path is to provide a host, domain, and any known external IP addresses.

### Configure the initiative

Perform the following steps to connect the initiative to your MDEASM data source:

1. Go to the **Initiatives** page, select the **External Attack Surface Protection**, then choose **Open initiative page**.
1. Go to the **Connect data source** to open the settings tab.

    > [!NOTE]
    > If you previously configured the External Attack Surface Protection initiative, you can select **Switch data source** to reconfigure it with new data.

1. Choose **Connect your MDEASM workspace**.
1. To enable the initiative to pull data from your Defender EASM resource, enter the values from your resource's **Essentials** section on the **Overview** pane found in Azure.

   - **Resource Name**
   - **Subscription ID**
   - **Resource Group Name**
   - **Region**

    :::image type="content" source="media/EASM/EASM-full_integration.png" alt-text="Screenshot of side panel for EASM initiative"::: 

1. Select **Connect**. After validation, data will begin flowing into the graph, and metrics will calculate within 32 hours.

You can review your security initiative data through security metrics that reflect various exposure types as assessed by the External Attack Surface assessment engine. Select a metric to view additional information such as the exposed assets and their types. 

Also explore the data integrated from EASM using the [attack surface map](enterprise-exposure-map.md) to uncover insights related to your attack surface. You can search for various assets such as IP addresses, domains, hosts, and more, and review the findings on these assets.

<a name="next-steps"></a>
## Related content

- [Investigate security initiative metrics](security-metrics.md)
