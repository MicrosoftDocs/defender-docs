---
title: Integrate Rapid7 data connector in Microsoft Security Exposure Management
description: Learn how to the Rapid7 data connector in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/06/2024
---

# Rapid7 data connector

To set up the Rapid7 integration, you need the endpoint of your Rapid7 Platform API, such as “us.api.insight.rapid7.com”. The connector authenticates with API Key Auth using an Endpoint and API Key.

## Rapid7 configuration

1. **Endpoint** - Find your Rapid7 endpoint. Follow the instructions [here](https://docs.rapid7.com/insight/api-overview#endpoint )
2. **API Key** – This integration needs a user API key for a user that has permissions to fetch assets. To generate an API key, see details at [this link.](https://docs.rapid7.com/insight/managing-platform-api-keys/#api-keys-based-on-your-insight-account-role)

   > **Note:** *We have found that connecting with an organization key has been more successful than connecting with a user key. We recommend you opt for an organization key to increase the likelihood of a successful connection.*

## Establish Rapid7 connection in Exposure Management

To establish a connection with Rapid7 in Exposure Management, follow these steps:

1. Open the [Data Connectors](https://security.microsoft.com/exposure-data-connectors) from the Exposure Management navigation and select **Connect** in the Rapid7 tile.
1. Enter your Rapid7 Endpoint and API key details and select **Connect**.

## Retrieved data

Exposure Management retrieves data on compute devices from Rapid7, including machines and virtual machines. It also retrieves vulnerabilities reported by Rapid7 on those devices.

Only devices that were actively scanned in the last 90 days are retrieved, based on assessing the "last_scan_end" field in the Rapid7 asset.

| Category               | Properties                                                                 |
|------------------------|----------------------------------------------------------------------------|
| **Assets/devices, and data per each identifier** | - Rapid7 ID<br>- Hostname<br>- IP address<br>- mac Address<br>- OS information<br>- Rapid7 risk score<br>- Tags<br>- Rapid7 criticality data<br>- Cloud platform |
| **Vulnerability findings** | Rapid7 retrieves CVE findings on the assets that it ingests.             |

## Troubleshooting the Rapid7 data connector

Here are some common issues that might arise when configuring the Rapid7 Connector, and suggestions for how to resolve them.

| **Error Type**                                                    | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| 'The remote server name couldn't be resolved' error message | Verify the Rapid7 endpoint. Learn more about how to determine your Rapid7 API endpoint [here](https://docs.rapid7.com/insight/api-overview/#endpoint). |
| **Error code 401**: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the Rapid7 data. Check your API key and verify that it's valid, and that the account isn't locked. In some cases, we have found that using an organization key works more successfully than generating a user key. <br>Try testing the connection with an organization key. You can test your credentials by running the following commands:<br>`curl -l --request POST --location 'https://\<region\>.api.insight.rapid7.com/vm/v4/integration/assets?size=2&includeSame=true' --header 'X-API-Key:\<key\>' --header 'Content-Type: application/json' –header ‘Accept: application/json’`<br> `curl -l --request POST --location 'https://\<region\>.api.insight.rapid7.com/vm/v4/integration/vulnerabilities?size=2’ --header 'X-API-Key:\<key\>' --header 'Content-Type: application/json' –header ‘Accept: application/json’`<br>If these fail and describe the error, refer to the Rapid7 documentation to mitigate. |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Ensure that your API key is generated with a user that has sufficient permissions to access the Rapid7 data. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your Rapid7 endpoint is correct. Learn more about how to determine your Rapid7 API endpoint [here](https://docs.rapid7.com/insight/api-overview/#endpoint). |
| 'Temporary connectivity issues' error message                | Check the configuration details (endpoint URL and API Key) and make sure they're valid. Review the Rapid7 the [configuration section](#rapid7-configuration) for details. |
| Not seeing my assets or the vulnerabilities reported by Rapid7 in the ingested data | See [Retrieved data](#retrieved-data) for a description of the expected data to be retrieved by the Rapid7 connector. If there's still missing data, contact Support. |
| Rapid7 allowed IPs need to be configured to enable Exposure Management connectors to access Rapid7 | Read how to add the set of IPs to add to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses). |

## Next steps

[Getting value from your data connectors](value-data-connectors.md).
