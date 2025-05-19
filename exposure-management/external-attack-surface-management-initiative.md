---
title: External Attack Surface Management Initiative
description: Learn how to get MDEASM insights into your corporate attack surface with the initiative in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: how-to
ms.service: exposure-management
ms.date: 05/19/2025
---


# Integrating Microsoft Defender External Attack Surface Management with Microsoft Security Exposure Management

Learn how to integrate Microsoft Defender External Attack Surface Management (MDEASM) with Microsoft Security Exposure Management (MSEM) to enhance visibility and control over your organization's external exposures. By connecting MDEASM insights to MSEM using the External Attack Surface Management initiative, you can assess the risk associated with your organization's or vendor's external attack surface and and manage your security posture more effectively within the Exposure Management portal.

There are two ways to use this initiative:
- **Pre-built footprint**: Provides high-level insights using a predefined set of external assets, without requiring a full MDEASM subscription.
- **Full integration with MDEASM**: Connects directly to your MDEASM subscription for comprehensive exposure analysis and asset-level details.

## Using the EASM initative with pre-built footprint

This approach with the initiative provides high-level insights without a full connection to the MDEASM subscription and supports pre-built footprints only, hence does not require an active MDEASM subscription.

To configure your External Attack Surface initiative, you need to have **Global Administrator** role, or **Core security settings (manage)** permissions.

1. Go to the **Initiatives** page, select the **External Attack Surface Protection**, then choose **Open initiative page**.
1. Go to the **Connect data source** to open the settings tab.

> [!NOTE]
> If you have previously configured the initiative, you can select **Switch data source** to re-configure it with new data.

3. Choose **Search for your organization's pre-built footprint**.
4. Select the footprint you want to use from the list of available pre-built footprints and choose **Connect**.

:::image type="content" source="media/EASM/EASM-Pre-built-footprint.png" alt-text="Screenshot of side panel for EASM pre-built footprint selection" lightbox="media/EASM/EASM-Pre-built-footprint.png":::

5. After 48 hours, the initiative will be populated with data from the selected footprint.

## Using the EASM initiative with full MSEADM integration

This approach requires a full MDEASM subscription and provides comprehensive exposure analysis and asset-level details.
To configure your External Attack Surface initiative, you need to have **Global Administrator** role, or **Core security settings (manage)** permissions.

### Environment setup:

If you haven’t already deployed an MDEASM resource, follow these steps:

1. Deploy an EASM resource:
   1. Log into https://portal.azure.com.
   2. Create a Resource Group with the appropriate subscription and region.
   3. Deploy a MDEASM Resource within that group, see, [Create a Defender EASM Azure resource](https://learn.microsoft.com/en-us/azure/external-attack-surface-management/deploying-the-defender-easm-azure-resource).

1. Discover the attack surface
    You can discover your attack surface in two ways:
    1. Use the **Get Started** option to search for your organization and build a preconfigured attack surface.
    1. Or, create a custom discovery group by providing:
    - Domains
    - IP Blocks or Addresses (use example IPs such as 203.0.113.0 if needed)
    - Hosts
    - ASNs
    - Emails
    - WHOIS organization data

    For more information, see, [Disovering your attack surface](https://learn.microsoft.com/en-us/azure/external-attack-surface-management/discovering-your-attack-surface)

> [!TIP]
>
> The easiest path is to provide a host, domain, and any known external IP addresses.

### Configure the initiative

1. Go to the **Initiatives** page, select the **External Attack Surface Protection**, then choose **Open initiative page**.
1. Go to the **Connect data source** to open the settings tab.

> [!NOTE]
> If you have previously configured the initiative, you can select **Switch data source** to re-configure it with new data.

1. Choose **Connect to your MDEASM workspace**.
1. Provide the following details from your Azure MDEASM resource:
   - **Resource Name**
   - **Subscription ID**
   - **Resource Group Name**
   - **Region**

:::image type="content" source="media/EASM/EASM-full_integration.png" alt-text="Screenshot of side panel for EASM initiative"::: 

1. Click **Connect**. After validation, data will begin flowing into the graph, and metrics will calculate within 48 hours.

You can review your security initiative data through security metrics that reflect various exposure types as assessed by the External Attack Surface assessment engine. You can select a metric to view additional information such as the exposed assets and their types. You can also explore the data integrated from EASM using the Attack Surface Map to uncover insights related to your attack surface. You can search for various assets such as IP addresses, domains, hosts, and more, and review the findings on these assets.

## Next steps

- [Investigate security initiative metrics](security-metrics.md)
