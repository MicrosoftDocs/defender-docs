---
title: CrowdStrike Falcon data connector for Microsoft Security Exposure Management
description: Learn how to set up and configure the CrowdStrike Falcon data connector in Microsoft Security Exposure Management.
ms.service: exposure-management
ms.author: dlanger
author: DebLanger
manager: ornat-spodek
ms.topic: how-to
ms.date: 09/01/2025
---

# CrowdStrike Falcon data connector

This article describes how to configure the CrowdStrike Falcon data connector for Microsoft Security Exposure Management. The CrowdStrike Falcon data connector enables you to integrate your CrowdStrike Falcon data insights with your extended security posture management, enhancing your visibility and control over your IT assets and risks.

## Prerequisites

Before you configure the CrowdStrike data connector, ensure you have:

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

4. Verify that CrowdStrike data is integrated by checking the scenarios described in [Getting value from your data connectors](value-data-connectors.md).

## Retrieved data

CrowdStrike connector retrieves data on compute devices, including endpoints and servers monitored by CrowdStrike Falcon, along with vulnerability findings from CrowdStrike on those assets. It also retrieves network and configuration information to identify those devices.

Only devices that were active in the last 90 days are retrieved, based on the last activity timestamp in CrowdStrike Falcon.

| **Category**            | **Properties**                                                                 |
|-------------------------|--------------------------------------------------------------------------------|
| **Assets/devices**      | - Device information<br>- Operating system details<br>- Network interfaces<br>- Agent status<br>- Device classification<br>- CrowdStrike criticality data |
| **Vulnerability findings** | CrowdStrike retrieves CVE findings on the assets that it ingests. |
| **Configuration data**  | - Agent configurations<br>- Policy assignments<br>- Protection status<br>- Threat detection data |

## Troubleshooting the CrowdStrike data connector

Here are some common issues that might arise when configuring the CrowdStrike Connector, and suggestions for how to resolve them.

| **Error Type**                                               | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Error code 401**: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the CrowdStrike data. Check your credentials and make sure they're correct and valid. Also check that your API client has the required permissions. See the CrowdStrike [configuration section](#create-crowdstrike-api-client) for details on how to generate the appropriate API client with correct scopes. |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [configuration section](#create-crowdstrike-api-client), and make sure your API client has the **Assets (Read)** and **Vulnerabilities (Read)** permissions. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your CrowdStrike API Base URL is correct, see the [configuration section](#create-crowdstrike-api-client) for details. |
| **Error code 429** 'Too many requests"                       | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated API client for the connector to avoid reaching this limit. |
| 'Temporary disconnected' or 'Temporary failure' error message | In the case where this error message appears without any additional information, verify the connector configuration (API Base URL and credentials). If these are valid and the issue doesn't resolve on its own, contact Support. |
| Not seeing my assets or the vulnerabilities reported by CrowdStrike in the ingested data | See [Retrieved data](#retrieved-data) for a description of the data expected to be retrieved by the CrowdStrike connector. If there's still missing data, contact Support. |
| CrowdStrike allowed IPs need to be configured to enable Exposure Management connectors to access CrowdStrike | Read how to add the set of IPs to add to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses). |

## Next steps

After configuring the CrowdStrike data connector:

- [Review your attack surface map](enterprise-exposure-map.md) to see CrowdStrike data
- [Explore security recommendations](security-recommendations.md)
- [Set up security initiatives](initiatives.md) to track remediation progress

## Related articles

- [Data connectors overview](overview-data-connectors.md)
- [Configure data connectors](configure-data-connectors.md)
- [Getting value from your data connectors](value-data-connectors.md)
