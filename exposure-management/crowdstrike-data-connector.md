---
title: CrowdStrike Falcon data connector for Microsoft Security Exposure Management
description: Learn how to set up and configure the CrowdStrike Falcon data connector in Microsoft Security Exposure Management.
ms.service: exposure-management
ms.author: dlanger
author: DebLanger
ms.topic: how-to
ms.date: 08/27/2025
---

# Connect CrowdStrike Falcon data connector

This article describes how to configure the CrowdStrike Falcon data connector for Microsoft Security Exposure Management. The CrowdStrike Falcon data connector enables you to integrate your CrowdStrike Falcon data insights with your extended security posture management, enhancing your visibility and control over your IT assets and risks.

> [!NOTE]
> This feature is currently in Private Preview and available for design partners. By onboarding to the Private Preview, you will have the opportunity to be among the first to enjoy this new feature and gain extended exposure insights based on the additional data and context it offers.

## Prerequisites

Before you configure the CrowdStrike data connector, ensure you have:

### Environmental Requirements

- Make sure your tenant has access to Microsoft Security Exposure Management
- Make sure the user with which you logged in to Microsoft portal has one of the following roles on the provided tenant:
  - Global Administrator
  - Security Administrator
  - Security Operator

### CrowdStrike Requirements

- A CrowdStrike Falcon environment
- CrowdStrike Falcon administrator role to create API clients
- Authentication endpoint API URL, Client ID, and Client Secret from CrowdStrike

## Supported data types

The CrowdStrike data connector imports the following data types:

- **Assets**: Information about devices and endpoints monitored by CrowdStrike
- **Vulnerabilities**: Vulnerability data detected by CrowdStrike Falcon

## Create CrowdStrike API Client

Before configuring the connector in Microsoft Security Exposure Management, you need to create an API client in CrowdStrike:

1. From your CrowdStrike CID homepage, click **Open menu**.

2. Click **Support and resources**.

3. Click **API clients and keys**.

4. Ensure the **OAuth2 API clients** tab is selected, then click **Create API client**.

5. Choose a **Client Name**.

6. From the **API SCOPES** section, select the following permissions:
   - **Assets (Read)**
   - **Vulnerabilities (Read)**

7. Click **Create**.

8. Copy and save the **Base URL**, **API Client ID**, and **Secret** that appears.

9. Close the credential window.

## Configure the CrowdStrike data connector

After creating the API client in CrowdStrike:

1. Open the **Exposure Management Connectors** page.

2. Click **Connect** in the **CrowdStrike** tile.

3. Enter your CrowdStrike API URL and authentication credentials:
   - **API Base URL**: The Base URL from your CrowdStrike API client
   - **Client ID**: Your CrowdStrike API Client ID
   - **Client Secret**: Your CrowdStrike API Client Secret

4. Click **Connect**.

## Verify the connection

After configuring the data connector:

1. Monitor the connection status in the **Data connectors** page.

2. Check the **Last sync** timestamp to ensure data is being imported.

3. Review any error messages if the connection fails.

4. Verify that CrowdStrike data appears in your exposure management dashboards and reports.

## Troubleshooting

If you encounter issues with the CrowdStrike data connector:

**Connection failures**:
- Verify your CrowdStrike API credentials are correct
- Ensure the API client has the required **Assets (Read)** and **Vulnerabilities (Read)** permissions
- Check that the API Base URL matches your CrowdStrike cloud instance
- Confirm you have CrowdStrike Falcon administrator role

**Missing data**:
- Verify that your CrowdStrike environment has asset and vulnerability data to synchronize
- Ensure the API client was created with the correct scopes

## Required API permissions

The CrowdStrike API client must have the following permissions:

- **Assets (Read)**: Access to asset information
- **Vulnerabilities (Read)**: Access to vulnerability data

## Private Preview access

This connector is currently available as a Private Preview for design partners. To access this feature:

- Your tenant ID must be allowlisted for the preview
- Contact the MSEM Connectors team for questions or to request access with additional tenants

## Next steps

After configuring the CrowdStrike data connector:

- [Review your attack surface map](enterprise-exposure-map.md) to see CrowdStrike data
- [Explore security recommendations](security-recommendations.md) based on CrowdStrike findings
- [Set up security initiatives](initiatives.md) to track remediation progress

## Related articles

- [Data connectors overview](overview-data-connectors.md)
- [Configure data connectors](configure-data-connectors.md)
- [Getting value from your data connectors](value-data-connectors.md)
