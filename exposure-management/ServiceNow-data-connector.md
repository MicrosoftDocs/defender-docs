---
title: Integrate ServiceNow data connector in Microsoft Security Exposure Management
description: Learn how to the ServiceNow data connector in Microsoft Security Exposure Management.
ms.topic: overview
ms.date: 10/23/2025
---

# ServiceNow data connector

To set up the ServiceNow CMDB integration, you need to provide the hostname of your ServiceNow instance and valid credentials. The connector supports both Basic Authentication and OAuth 2.0 as authentication options for read only access. Basic Authentication requires username and password to connect, and OAuth 2.0 is based on granting client credentials.

> [!Note]
> The ServiceNow connector supports Basic Authentication and OAuth 2.0 (client credentials grant). We recommend creating a dedicated user for use with data connectors in Exposure Management with least-privilege (cmdb_read) role assignment.

## Configure ServiceNow with Basic Authentication

1. Find the hostname of your ServiceNow instance. For example, "contoso.service-now.com".  
1. Create a New ServiceNow user:
   1. Follow [these steps] (https://docs.servicenow.com/en-US/bundle/vancouver-platform-administration/page/administer/users-and-groups/task/t_CreateAUser.html) to create a new user.
   1. Keep the **username (User Id) and password** you provided for future use.
   1. If there’s no password field, submit the form to create the user. Afterwards, when you select the new user, you'll receive the **Set Password** option.
   1. As you create the user, check the **Web service access only** box so that the user will be of dedicated use only for this integration.
1. Assign a **cmdb_read** role to the user you've created. See these [detailed instructions](https://docs.servicenow.com/bundle/vancouver-platform-administration/page/administer/users-and-groups/task/t_AssignARoleToAUser.html).

## Configure OAuth 2.0 authentication (client credentials flow)

Use OAuth 2.0 client credentials to avoid storing a long‑lived password and to align with modern authentication standards.

### Prerequisites

1. Create (or identify) a ServiceNow user with at minimum the cmdb_read role. For detailed instructions on creating a ServiceNow user and assigning roles, see the [Configure ServiceNow with Basic Authentication](#configure-servicenow-with-basic-authentication) section. We recommend a dedicated integration user; admin is only required temporarily if needed to install plugins.
1. Verify these plugins are installed (navigate to `sys_plugins.list`):
   - OAuth 2.0 (`com.snc.platform.security.oauth`)
   - REST API Provider (`com.glide.rest`)
   - Authentication scope (`com.glide.auth.scope`)
   - REST API Auth Scope Plugin (`com.glide.rest.auth.scope`)
1. Enable the client credentials grant:
   - Navigate to `sys_properties.list`
   - Property name: `glide.oauth.inbound.client.credential.grant_type.enabled`
   - Value: `true`
   - This property toggles support for the client credentials flow.

### Create the OAuth client (Application Registry)

1. Go to: System OAuth -> Application Registry.
1. Select: Create an OAuth API endpoint for external clients.
1. Fill mandatory fields (Name, etc.). Leave Redirect URL and Login URL blank (not used for client credentials).
1. Ensure Public Client remains unchecked (must be a confidential client).
1. Save the record.
1. In the Application Registries list view, customize the view (gear icon) to add the "OAuth Application User" column.
1. Set the OAuth Application User to the dedicated integration user (the token assumes this user's roles).
1. Open the record to copy the Client ID and generate/view the Client Secret.

### Token endpoint and grant details

- Token URL format: `https://<your-instance>.service-now.com/oauth_token.do`
- Grant type: `client_credentials`
- No redirect or authorization code is involved.
- Scopes: Not typically required; access is determined by the roles of the OAuth Application User.
- Required role on the integration user: `cmdb_read` (plus any additional roles needed for specific CI access, if applicable).

### Differences vs Basic Authentication

- Credentials rotate easily (regenerate client secret without changing the integration user password).
- Authentication is scoped to the roles of the OAuth Application User.
- Rate limits and data scope are unchanged; ensure a dedicated user to avoid API contention.
- No interactive login or redirect URLs are required.

### Troubleshooting OAuth

| Issue | Action |
|-------|--------|
| 401 Unauthorized | Confirm client ID/secret are correct; verify OAuth Application User is set; ensure `cmdb_read` role assigned; confirm property `glide.oauth.inbound.client.credential.grant_type.enabled = true`. |
| 403 Forbidden | User lacks required CMDB read role; add `cmdb_read`. |
| Invalid client | Regenerate client secret; verify you used "OAuth API endpoint for external clients". |
| Token endpoint failure | Verify plugins installed; confirm instance hostname correctness. |
| Empty or missing CMDB data | Validate the integration user can view CIs in the CMDB directly; check roles. |

For more background on ServiceNow OAuth, see ServiceNow documentation.

## Establish ServiceNow connection in Exposure Management

To establish a connection with ServiceNow in Exposure Management, follow these steps:

1. Open the [Data Connectors](https://security.microsoft.com/exposure-data-connectors) from the Exposure Management navigation and select **Connect** in the ServiceNow CMDB tile.
1. Choose your authentication method and enter the required information:
   - **For Basic Authentication**: Enter your ServiceNow instance hostname and the username and password created in the Basic Authentication configuration.
   - **For OAuth 2.0**: Choose the OAuth 2.0 authentication option and enter your instance hostname, Client ID, and Client Secret created in the OAuth configuration.
1. Select **Connect**. The system will authenticate using your chosen method and retrieve CMDB data.

:::image type="content" source="media/service-now/oauth.png" alt-text="Screenshot of connecting ServiceNow connector" lightbox="media/service-now/oauth.png":::

## Retrieved data

Exposure Management currently retrieves data on devices, their business application association, and business criticality. Additional data is also retrieved that helps identify the device, such as network adapter information and OS data.

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
| **Error code 401**: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the ServiceNow data. Check your credentials and make sure they're correct and valid. Also check that your credentials have the required permissions. See the [Configure ServiceNow with Basic Authentication](#configure-servicenow-with-basic-authentication) section for details on how to ensure the cmdb_read role is assigned. Another possible reason for this failure is the that your ServiceNow instance is configured to accept connections only from a limited range of IP addresses. In this case, see the guidance for adding the right set of IPs to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses) |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [Configure ServiceNow with Basic Authentication](#configure-servicenow-with-basic-authentication) section, and make sure they have at minimum cmdb_read role assigned. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your ServiceNow Instance hostname is correct. |
| **Error code 429** 'Too many requests"                       | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated user or account for the connector to avoid reaching this limit. |
| Bad URL error message                                        | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your ServiceNow Instance hostname is correct. |
| 'Temporary disconnected' or 'Temporary failure' error        | In the case where this error message appears without any additional information, verify the connector configuration (hostname and credentials). If these are valid and the issue doesn't resolve on its own, contact Support. |
| Not seeing some ServiceNow CMDB CIs or assets in the ingested data | See [Retrieved data](#retrieved-data) for a description of the data expected to be retrieved by the ServiceNow CMDB connector. If there's still missing data, contact Support. |
| Not seeing any data ingested from ServiceNow CMDB            | Review your connection status to ensure there are no errors. Validate that there are valid entries in your ServiceNow CMDB that correspond with the data we're retrieving. Run the sample [Advanced Hunting query](value-data-connectors.md#advanced-hunting) to check if any ServiceNow assets can be found in the Exposure Graph tables. If you're still unable to find your ServiceNow CMDB data, contact Support. |
| ServiceNow allowed IPs need to be configured to enable Exposure Management connectors to access ServiceNow | Read how to add the set of IPs to add to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses)|

## Next steps

After configuring the ServiceNow data connector:

- [Review your attack surface map](enterprise-exposure-map.md) to see ServiceNow data
- [Explore security recommendations](security-recommendations.md)
- [Set up security initiatives](initiatives.md) to track remediation progress

## Related articles

- [Data connectors overview](overview-data-connectors.md)
- [Configure data connectors](configure-data-connectors.md)
- [Getting value from your data connectors](value-data-connectors.md)
