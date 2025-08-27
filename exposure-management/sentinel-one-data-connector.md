---
title: Integrate SentinelOne data connector in Microsoft Security Exposure Management
description: Learn how to the SentinelOne data connector in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 08/27/2025
---

# SentinelOne data connector

The SentinelOne data connector allows you to integrate SentinelOne data with Microsoft Security Exposure Management. To integrate with SentinelOne, you need to provide an authentication endpoint API URL and a valid API Token Key generated using the SentinelOne portal.

> [!Note]
> We recommend creating a dedicated user for use with data connectors in Exposure Management.

## SentinelOne configuration

First, you need to create an API token with the required permissions to get the authentication endpoint URL and API Token Key.

> [!Note]
> To create an API Token, you must be logged in as a SentinelOne user with sufficient permissions to generate API tokens.

### Create the SentinelOne API Token

1. In the upper-right corner of the SentinelOne Console, click on your username and choose **My User**.
1. Select **Actions** > **API Token Operations** > **Generate API token**.
1. In the **API Token** window, select **Copy API Token**, then click **Close**.
1. Store the API token string in a secure file.

   > [!Note]
   > Your username options will now include Revoke API Token and Regenerate API Token.

1. Exit the credential window.

> [!CAUTION]
> Be sure to copy the API token before you close the API Token window. After you close this window, you cannot retrieve the token from SentinelOne.

### Getting the Authentication Endpoint URL

The authentication endpoint URL is your SentinelOne API URL endpoint. This is typically in the format of your SentinelOne console URL with the API path.

## Establish SentinelOne connection in Exposure Management

To establish a connection with SentinelOne in Exposure Management, follow these steps:

1. Open the [Data Connectors](https://security.microsoft.com/exposure-data-connectors) from the Exposure Management navigation and select **Connect** in the SentinelOne tile.
1. Enter your SentinelOne API URL Endpoint and API Token Key credentials and select **Connect**.

## Retrieved data

SentinelOne connector retrieves data on compute devices, including endpoints, servers, and other managed assets, along with security findings and threat detection data from SentinelOne on those assets. It also retrieves network and configuration information to identify those devices.

Only devices that were active in the last 90 days are retrieved, based on the last activity timestamp in SentinelOne.

| **Category**            | **Properties**                                                                 |
|-------------------------|--------------------------------------------------------------------------------|
| **Assets/devices**      | - Endpoint information<br>- Operating system details<br>- Network interfaces<br>- Agent status<br>- Device classification<br>- SentinelOne criticality data |
| **Security findings**   | SentinelOne retrieves threat detection findings, malware detections, and security events on the assets that it ingests. |
| **Configuration data**  | - Agent configurations<br>- Policy assignments<br>- Compliance status<br>- Protection status |

## Troubleshooting the SentinelOne data connector

Here are some common issues that might arise when configuring the SentinelOne Connector, and suggestions for how to resolve them.

| **Error Type**                                               | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Error code 401**: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the SentinelOne data. Check your credentials and make sure they're correct and valid. Also check that your API token has the required permissions. See the SentinelOne [configuration section](#sentinelone-configuration) for details on how to generate the appropriate API token. <br>You can validate your credentials by testing the authentication endpoint with your API token. |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [configuration section](#sentinelone-configuration), and make sure your API token has sufficient access permissions. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your SentinelOne API URL endpoint is correct, see the [configuration section](#sentinelone-configuration) for details. |
| **Error code 429** 'Too many requests"                       | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated API token for the connector to avoid reaching this limit. |
| 'Temporary disconnected' or 'Temporary failure' error message | In the case where this error message appears without any additional information, verify the connector configuration (API URL endpoint and API token). If these are valid and the issue doesn't resolve on its own, contact Support. |
| Not seeing my assets or the security findings reported by SentinelOne in the ingested data | See [Retrieved data](#retrieved-data) for a description of the data expected to be retrieved by the SentinelOne connector. If there's still missing data, contact Support. |
| SentinelOne allowed IPs need to be configured to enable Exposure Management connectors to access SentinelOne | Read how to add the set of IPs to add to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses). |

## Next steps

After configuring the SentinelOne data connector:

- [Review your attack surface map](enterprise-exposure-map.md) to see SentinelOne data
- [Explore security recommendations](security-recommendations.md) based on SentinelOne findings
- [Set up security initiatives](initiatives.md) to track remediation progress
- [Configure additional data connectors](configure-data-connectors.md) to enhance your exposure management
- [Getting value from your data connectors](value-data-connectors.md)

## Related articles

- [Data connectors overview](overview-data-connectors.md)
- [Configure data connectors](configure-data-connectors.md)
- [Getting value from your data connectors](value-data-connectors.md)
