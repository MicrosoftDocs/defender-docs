---
title: Integrate Wiz data connector in Microsoft Security Exposure Management
description: Learn how to the Wiz data connector in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: ornat-spodek
ms.topic: overview
ms.service: exposure-management
ms.date: 08/27/2025
---

# Wiz data connector

To integrate with Wiz, you need to provide an authentication endpoint URL, and a valid Client ID and Client Secret generated using a Wiz service account.

> [!Note]
> We recommend creating a dedicated user for use with data connectors in Exposure Management.

## Wiz configuration

First, you need to create a service account with the required permissions to get the authentication endpoint URL, Client ID, and Client Secret.

> [!Note]
> To create a Service Account, you must be logged in as a Wiz user with Write (W) permission on service accounts. Project-scoped roles can create Service Accounts only on their own Projects.

### Add a service account

1. Go to the **Settings** > **Access Management** > **Service Accounts** page, then select **Add Service Account**.
1. Enter a meaningful **Name** for the account.
1. Choose the **Type** of service account to add. It should be **Custom Integration (GraphQL API)**
1. You can select to limit access to specific projects only by choosing up to 50 projects from the drop-down list. If you aren't sure which project to choose, it's better to leave it empty.
1. You can set an **Expiration date** for the service account although the recommendation is to leave it empty.
1. Set the **API Scopes** to **Read graph resource** and **Read vulnerabilities**

   > [!Note]
   > At minimum, the Service Account needs permissions of Read graph resources and Read vulnerabilities, though we recommend Read:all permissions as we may retrieve additional data as we further develop the connector.

1. Select **Add Service Account**. The secret credentials dialog shows the newly created Client ID and Client Secret for the service account.
1. Copy the Client ID and Client Secret to a secure place, such as a password management tool.
1. Select **Finish**.

### Getting the Authentication Endpoint URL

1. At the top right of the Wiz portal, select **Profile** > **Tenant Info** [Direct link](https://app.wiz.io/tenant-info/general)
1. `API Endpoint URL` - Copy the endpoint in the following form: `https://api.<TENANT_DATA_CENTER>.app.wiz.io/`

## Establish Wiz connection in Exposure Management

To establish a connection with Wiz in Exposure Management, follow these steps:

1. Open the [Data Connectors](https://security.microsoft.com/exposure-data-connectors) from the Exposure Management navigation and select **Connect** in the Wiz tile.
1. Enter your Wiz authentication data and select **Connect**.

## Retrieved data

Wiz connector retrieves data on compute devices. This data includes virtual machines and cloud resources, along with vulnerability findings and configuration data from Wiz on those assets. It also retrieves network and configuration information to identify those devices.

| **Category**            | **Properties**                                                                 |
|-------------------------|--------------------------------------------------------------------------------|
| **Assets/devices**      | - Cloud provider information<br>- Network Interfaces<br>- IP addresses<br>- Virtual Machine Properties (Device name, Cloud provider ID)<br>- Operating system details<br>- Has high or Admin Privileges<br>- Open to Internet or Internet facing<br>- Contains sensitive data<br>- Instance type<br>- Is Container Host<br>- Is Ephemeral<br>- isManaged<br>- Tags<br>- Wiz projects<br>- First seen<br>- Last seen<br>- Wiz Criticality |
| **Vulnerability findings** | Wiz retrieves CVE findings on the assets that it ingests. |

## Troubleshooting the Wiz data connector

Here are some common issues that might arise when configuring the Wiz Connector, and suggestions for how to resolve them.

| **Error Type**                                               | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Error code 401**: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the Wiz data. Check your credentials and make sure they're correct and valid. Also check that your credentials have the required permissions. See the Wiz [configuration section](#wiz-configuration) for details on how to assign the appropriate scopes. <br>You can validate your credentials by testing the authentication endpoint with your Client ID and Client Secret. |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [configuration section](#wiz-configuration). Make sure they have at minimum the "Read graph resources" and "Read vulnerabilities" permissions. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your Wiz authentication endpoint URL is correct, see the [configuration section](#wiz-configuration) for details. |
| **Error code 429** 'Too many requests"                       | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated service account for the connector to avoid reaching this limit. |
| 'Temporary disconnected' or 'Temporary failure' error message | In the case where this error message appears without any additional information, verify the connector configuration (authentication endpoint URL and credentials). If the configuration is valid and the issue doesn't resolve on its own, contact Support. |
| Not seeing my assets or the vulnerabilities reported by Wiz in the ingested data | See [Retrieved data](#retrieved-data) for a description of the expected retrieved data by the Wiz connector. If there's still missing data, contact Support. |
| Wiz allowed IPs need to be configured to enable Exposure Management connectors to access Wiz | Read how to add the set of IPs to add to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses). |

## Next steps

After configuring the Wiz data connector:

- [Review your attack surface map](enterprise-exposure-map.md) to see Wiz data
- [Explore security recommendations](security-recommendations.md)
- [Set up security initiatives](initiatives.md) to track remediation progress

## Related articles

- [Data connectors overview](overview-data-connectors.md)
- [Configure data connectors](configure-data-connectors.md)
- [Getting value from your data connectors](value-data-connectors.md)
