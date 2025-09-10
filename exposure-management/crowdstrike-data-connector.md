---
title: Integrate CrowdStrike Falcon data connector in Microsoft Security Exposure Management
description: Learn how to integrate the CrowdStrike Falcon data connector in Microsoft Security Exposure Management.
ms.author: dlanger
author: DebLanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 09/01/2025
---

# CrowdStrike Falcon data connector

The CrowdStrike Falcon data connector allows you to integrate CrowdStrike Falcon data with Microsoft Security Exposure Management. To integrate with CrowdStrike Falcon, you need to provide an authentication endpoint API URL, Client ID, and Client Secret generated using the CrowdStrike portal.

> [!Note]
> We recommend creating a dedicated API client for use with data connectors in Exposure Management.

## CrowdStrike Falcon configuration

First, you need to create an API client with the required permissions to get the authentication endpoint URL, Client ID, and Client Secret.

> [!Note]
> To create an API client, you must be logged in as a CrowdStrike user with sufficient permissions to generate API clients.

### Create the CrowdStrike API Client

1. From your CrowdStrike CID homepage, click **Open menu**.
1. Click **Support and resources**.
1. Click **API clients and keys**.
1. Ensure the **OAuth2 API clients** tab is selected, then click **Create API client**.
1. Choose a **Client Name**.
1. From the **API SCOPES** section, select the following permissions:
   - **Assets (Read)**
   - **Vulnerabilities (Read)**
1. Click **Create**.
1. Copy and save the **Base URL**, **API Client ID**, and **Secret** that appears.
1. Store the credentials in a secure file.

   > [!Note]
   > Your API client options will now include the ability to regenerate or revoke the client.

1. Exit the credential window.

> [!CAUTION]
> Be sure to copy the API credentials before you close the API Client window. After you close this window, you cannot retrieve the secret from CrowdStrike.

### Getting the Authentication Endpoint URL

The authentication endpoint URL is your CrowdStrike API Base URL endpoint. This is provided when you create your API client in CrowdStrike.

## Establish CrowdStrike Falcon connection in Exposure Management

To establish a connection with CrowdStrike Falcon in Exposure Management, follow these steps:

1. Open the [Data Connectors](https://security.microsoft.com/exposure-data-connectors) from the Exposure Management navigation and select **Connect** in the CrowdStrike tile.
1. Enter your CrowdStrike API Base URL, Client ID, and Client Secret credentials and select **Connect**.

## Retrieved data

CrowdStrike connector retrieves data on compute devices, including endpoints and servers monitored by CrowdStrike Falcon, along with vulnerability findings from CrowdStrike on those assets. It also retrieves network and configuration information to identify those devices.

Only devices that were active in the last 90 days are retrieved, based on the last activity timestamp in CrowdStrike Falcon.

| **Category**            | **Properties**                                                                 |
|-------------------------|--------------------------------------------------------------------------------|
| **Assets/devices**      | - Device information<br>- Operating system details<br>- Network interfaces<br>- Agent status<br>- CrowdStrike criticality data |
| **Vulnerability findings** | CrowdStrike retrieves CVE findings on the assets that it ingests. |

## Troubleshooting the CrowdStrike data connector

Here are some common issues that might arise when configuring the CrowdStrike Connector, and suggestions for how to resolve them.

| **Error Type**                                               | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Error code 401**: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the CrowdStrike data. Check your credentials and make sure they're correct and valid. Also check that your API client has the required permissions. See the CrowdStrike [configuration section](#crowdstrike-falcon-configuration) for details on how to generate the appropriate API client with correct scopes. <br>You can validate your credentials by testing the authentication endpoint with your API client credentials. |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [configuration section](#crowdstrike-falcon-configuration), and make sure your API client has the **Assets (Read)** and **Vulnerabilities (Read)** permissions. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your CrowdStrike API Base URL is correct, see the [configuration section](#crowdstrike-falcon-configuration) for details. |
| **Error code 429** 'Too many requests"                       | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated API client for the connector to avoid reaching this limit. Make sure you have enough Remaining Rate Limit for api calls. This can be check on the response headers from CrowdStrike API, **X-Ratelimit-Remaining**.|
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
