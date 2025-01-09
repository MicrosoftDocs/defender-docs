---
title: Integrate ServiceNow data connector in Microsoft Security Exposure Management
description: Learn how to the ServiceNow data connector in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 09/24/2024
---

# ServiceNow data connector

To set up the ServiceNow CMDB integration, you need to provide the hostname of your ServiceNow instance and valid credentials. The connector authenticates with Basic Authentication using username and password for read only access.

> [!Note]
> We recommend creating a dedicated user for use with data connectors in Exposure Management.

## ServiceNow configuration

1. Find the hostname of your ServiceNow instance. For example, "contoso.service-now.com".  
1. Create a New ServiceNow user:
   1. Follow the steps [here](https://docs.servicenow.com/en-US/bundle/vancouver-platform-administration/page/administer/users-and-groups/task/t_CreateAUser.html) to create a new user.
   2. Keep the **username (User Id) and password** you provided for future use.
   3. If there’s no password field, submit the form to create the user. Afterwards, when you select on the new user, you receive the **Set Password** option.
   4. As you create the user, check the **Web service access only** box such that the user will be of dedicated use only for this integration.
1. Assign a **cmdb_read** role to the user you have created. Detailed instructions can be found [here](https://docs.servicenow.com/bundle/vancouver-platform-administration/page/administer/users-and-groups/task/t_AssignARoleToAUser.html).

> [!Note]
> The ServiceNow connector only supports Basic Authentication. OAuth authentication will be made available at a later time.

## Establish ServiceNow connection in Exposure Management

To establish a connection with ServiceNow in Exposure Management, follow these steps:

1. Open the [Data Connectors](https://security.microsoft.com/exposure-data-connectors) from the Exposure Management navigation and select **Connect** in the ServiceNow CMDB tile.
1. Enter your ServiceNow **instance details** and **credentials** (created in the ServiceNow configuration) and select **Connect**.

## Retrieved data

Exposure Management currently retrieves data on devices, their business application association, and business criticality. Additional data is also retrieved that helps identify the device, such as network adapter information and OS data.

Only devices that were active in the last 90 days are retrieved, based on assessing the "sys_updated_on" field in the ServiceNow CI.

The following fields are ingested via the connector:

| **Category**          | **Properties**                                                                 |
|-----------------------|--------------------------------------------------------------------------------|
| **Devices**           | - os<br>- osVersion<br>- osServicePack<br>- cpuType<br>- category<br>- assetTag<br>- virtual<br>- serviceNowCriticality<br>- usedFor<br>- networkAdapters (see details below)<br>- lastLoggedOnUser<br>- mostFrequentUser<br>- sysClassName<br>- uPrimaryBusinessApplication (see details below) |
| **Network Adapter**   | - name<br>- sysId<br>- macAddress<br>- ipAddress<br>- ipDefaultGateway                           |
| **Business Application** | - sysId<br>- number<br>- uCriticality<br>- businessCriticality                              |

## Troubleshooting the connector

Here are some common issues that might arise when configuring the ServiceNow Connector, and suggestions for how to resolve them.

| **Error Type**                                               | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| 'The remote server name couldn't be resolved' error message | Verify ServiceNow Instance hostname. Learn more about authentication to ServiceNow here: [Authentication (servicenow.com)](https://docs.servicenow.com/bundle/vancouver-platform-security/page/integrate/single-sign-on/concept/c_Authentication.html) |
| **Error code 401**: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the ServiceNow data. Check your credentials and make sure they are correct and valid. Also check that your credentials have the required permissions. See the ServiceNow [configuration section](#servicenow-configuration)  for details on how to ensure the cmdb_read role is assigned. Another possible reason for this failure is the that your ServiceNow instance is configured to accept connections only from a limited range of IP addresses. In this case, see the guidance for adding the right set of IPs to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses) |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [configuration section](#servicenow-configuration), and make sure they have at minimum cmdb_read role assigned. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your ServiceNow Instance hostname is correct. |
| **Error code 429** 'Too many requests"                       | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated user or account for the connector to avoid reaching this limit. |
| Bad URL error message                                        | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your ServiceNow Instance hostname is correct. |
| 'Temporary disconnected' or 'Temporary failure' error        | In the case where this error message appears without any additional information, verify the connector configuration (hostname and credentials). If these are valid and the issue does not resolve on its own, contact Support. |
| Not seeing some ServiceNow CMDB CIs or assets in the ingested data | See [Retrieved data](#retrieved-data) for a description of the data expected to be retrieved by the ServiceNow CMDB connector. If there's still missing data, contact Support. |
| Not seeing any data ingested from ServiceNow CMDB            | Review your connection status to ensure there are no errors. Validate that there are valid entries in your ServiceNow CMDB that correspond with the data we are retrieving. Run the sample [Advanced Hunting query](value-data-connectors.md#advanced-hunting) to check if any ServiceNow assets can be found in the Exposure Graph tables.If you are still unable to find your ServiceNow CMDB data, contact Support. |
| ServiceNow allowed IPs need to be configured to enable Exposure Management connectors to access ServiceNow | Read how to add the set of IPs to add to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses)|

## Next steps

[Getting value from your data connectors](value-data-connectors.md).
