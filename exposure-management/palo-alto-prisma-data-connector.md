---
title: Integrate Palo Alto Prisma data connector in Microsoft Security Exposure Management
description: Learn how to integrate the Palo Alto Prisma data connector in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 09/09/2025
---

# Palo Alto Prisma data connector?

To integrate with Palo Alto Prisma, you need to provide an authentication endpoint API URL, and a valid Access Key and Secret Key generated using a Palo Alto service account.

> [!Note]
> We recommend creating a dedicated service account for use with data connectors in Exposure Management.

## Palo Alto Prisma configuration

First, you need to create a service account with the required permissions to get the Access Key and Secret Key.

> [!Note]
> To create a Palo Alto API Client, you must be logged in as a user with the System Admin role.

### Add an API Client

1. Log in to your Palo Alto Prisma account with the required permissions.
2. Go to **Settings** > **Access Control** > **Access keys**.
3. Click **Add**, then **Access key**.
4. Enter a meaningful **Access Key Name**, then click **Save**.
5. Copy and save the **Access Key ID** and **Secret Access Key** that appears.
6. Close the credential window.

## Establish Palo Alto Prisma connection in Exposure Management

To establish a connection with Palo Alto Prisma in Exposure Management, follow these steps:

1. Open the [Exposure Management Connectors](https://security.microsoft.com/exposure-data-connectors) page and click **Connect** in the Palo Alto tile.
2. Enter your Palo Alto **Endpoint** and authentication credentials, then click **Connect**.

## Retrieved data

The Palo Alto Prisma connector retrieves data on your IT assets and risks, providing extended exposure insights based on the additional data and context it offers.

| **Category**            | **Properties**                                                                 |
|-------------------------|--------------------------------------------------------------------------------|
| **Assets/devices**      | - Cloud provider information<br>- Resource type<br>- Network interfaces<br>- IP address<br>- Public DNS name<br>- Operating system details<br>- Internet facing<br>- Palo Alto criticality data |
| **Vulnerability findings** | Palo Alto Prisma retrieves CVE findings on the assets that it ingests. |

## Troubleshooting the Palo Alto Prisma data connector

Here are some common issues that might arise when configuring the Palo Alto Prisma Connector, and suggestions for how to resolve them.

| **Error Type**                                               | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Authorization failure**                                    | Check your credentials and make sure they're correct and valid. Also check that your credentials have the required permissions. See the Palo Alto [configuration section](#palo-alto-prisma-configuration) for details on how to assign the appropriate roles. |
| **Access forbidden error**                                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [configuration section](#palo-alto-prisma-configuration). |
| **Not found error**                                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your Palo Alto authentication endpoint URL is correct, see the [configuration section](#palo-alto-prisma-configuration) for details. |
| **Too many requests**                                        | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated service account for the connector to avoid reaching this limit. |
| 'Temporary disconnected' or 'Temporary failure' error message | Verify the connector configuration (authentication endpoint URL and credentials). If the configuration is valid and the issue doesn't resolve on its own, contact Support. |
| Not seeing my assets or the vulnerabilities reported by Palo Alto Prisma in the ingested data | See [Retrieved data](#retrieved-data) for a description of the expected retrieved data by the Palo Alto Prisma connector. If there's still missing data, contact Support. |

## Next steps

After configuring the Palo Alto Prisma data connector:

- [Review your attack surface map](enterprise-exposure-map.md) to see Palo Alto Prisma data
- [Explore security recommendations](security-recommendations.md)
- [Set up security initiatives](initiatives.md) to track remediation progress

## Related articles

- [Data connectors overview](overview-data-connectors.md)
- [Configure data connectors](configure-data-connectors.md)
- [Getting value from your data connectors](value-data-connectors.md)
