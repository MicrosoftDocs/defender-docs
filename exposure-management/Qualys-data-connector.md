---
title: Integrate Qualys data connector in Microsoft Security Exposure Management
description: Learn how to the Qualys data connector in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 09/24/2024
---

# Qualys data connector

To integrate with Qualys, you have to provide basic credentials for a Qualys user with **Manager** role or a **Reader** role with full scope.

## Qualys configuration

1. To set up the Qualys integration, you need the API_URL of your Qualys instance, such as “qualysapi.qg1.apps.qualys.co.uk”. You can find it [here](https://www.qualys.com/platform-identification/).
   1. If you can't find it:
      1. Log in to your Qualys account.
      2. Go to **Help** → **About**.
      3. You'll see the required information under **Security Operations Center** (SOC).
1. You'll need credentials of a user with at least **Read Asset** permissions to successfully retrieve data from the connector. To create a user with a Read Asset role:
   1. Log in to Qualys.
   2. Go to **Administration** area.
   3. Go to the **Role Management** section.
   4. Select New Role.
   5. Provide a role name, for example, "Read Asset".
   6. For the Role permissions, check API Access.
   7. From the **Modules** drop down, choose Asset View.
   8. To limit the permissions, choose the **Change** option within the **Asset View** selected module.
   9. Make sure to enable, at least, **Read Asset** under **Asset Management Permissions**.
1. Add the newly created role to the user you intend to authenticate with in the Exposure Management Qualys Connector.
   1. Under **Administration** go to **User** **Management**.
   2. Select the user you onboarded with the Exposure Management Qualys Connector and choose **Edit**.
   3. Under **Roles and Scopes**, add the Read Asset role created in previous sections to the user assigned roles.
   4. Under **Edit** scope, select **Allow user view access to all objects** to allow this user full scope.
   5. Save the **Read Asset** role assignment to the user.

## Establish Qualys connection in Exposure Management

To establish a connection with Qualys in Exposure Management, follow these steps:

1. Open the [Data Connectors](https://security.microsoft.com/exposure-data-connectors) from the Exposure Management navigation and select **Connect** in the Qualys tile.
1. Enter your Qualys API URL and authentication credentials and select **Connect**.

## Retrieved data

Qualys connector retrieves data on compute devices, including machines and virtual machines, and vulnerability findings from Qualys on those assets. It also retrieves some networking data to identify those devices.

Only devices that were modified in the last 90 days are retrieved, based on assessing the "modified" field in the Qualys asset.

| **Category**            | **Properties**                                                                 |
|-------------------------|--------------------------------------------------------------------------------|
| **Assets/devices**      | - Gateway address<br>- FQDN<br>- IP address<br>- MAC address<br>- OS information<br>- Qualys criticality data |
| **Vulnerability findings** | Qualys retrieves CVE findings on the assets that it ingests.                    |

## Troubleshooting the Qualys data connector

Here are some common issues that might arise when configuring the Qualys Connector, and suggestions for how to resolve them.

| **Error Type**                                               | **Troubleshooting Action**                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Error code** 401: Authorization failure                    | An authorization failure indicates that credentials might not be correct, or there might not be sufficient permissions to access the Qualys data. Check your credentials and make sure they're correct and valid. Also check that your credentials have the required permissions. See the Qualys [configuration section](#qualys-configuration) for details on how to assign the appropriate role and scope. <br>You can validate your user credentials by running the following:<br>curl -u "user:password" -H "X-Requested-With: Curl" -X "POST"-d "action=list" "[https://qualysapi.qg1.apps.qualys.ca/qps/rest/2.0/search/am/hostasset](https://qualysapi.qg1.apps.qualys.ca/qps/rest/2.0/search/am/hostasset)" >output.txt |
| **Error code** 409: Possible insufficient permissions        | Qualys connector utilizes the knowledge_base API which requires specific permissions. You can see more details in the KnowledgeBase section of [this Qualys API document](https://cdn2.qualys.com/docs/qualys-api-vmpc-user-guide.pdf). <br>To validate the provided user has sufficient permissions, run the following command and verify it succeeds:<br>curl -u "user:password" -H "X-Requested-With: Curl" -X "POST"-d "action=list""[https://qualysapi.qg1.apps.qualys.ca/api/2.0/fo/knowledge_base/vuln/](https://qualysapi.qg1.apps.qualys.ca/api/2.0/fo/knowledge_base/vuln/)" >output.txt <br>In case it fails, refer to Qualys documentation to mitigate. |
| **Error code 403:** Access forbidden error                   | This error indicates that the provided credentials lack the necessary permissions to run the requested APIs. Update your credentials with the proper permissions as described in the [configuration section](#qualys-configuration), and make sure they have at minimum the Read Asset permissions. |
| **Error code 404:** Not found error                          | This error indicates that the requested endpoint wasn't found to be reachable. Verify that your Qualys API endpoint is correct, see the [configuration section](#qualys-configuration) for details. |
| **Error code 429** 'Too many requests"                       | The system periodically pulls data from the configured external providers, which might have a limit on the number of concurrent requests. We recommend creating a dedicated user or account for the connector to avoid reaching this limit. |
| 'Temporary disconnected' or 'Temporary failure' error message | In the case where this error message appears without any additional information, verify the connector configuration (API endpoint and credentials). If these are valid and the issue doesn't resolve on its own, contact Support. |
| Not seeing my assets or the vulnerabilities reported by Qualys in the ingested data | See [Retrieved data](#retrieved-data) for a description of the data expected to be retrieved by the Qualys connector. If there's still missing data, contact Support. |
| Qualys allowed IPs need to be configured to enable Exposure Management connectors to access Qualys | Read how to add the set of IPs to add to your allowlist here: [Allowlist IP addresses](configure-data-connectors.md#allowlist-ip-addresses). |

## Next steps

[Getting value from your data connectors](value-data-connectors.md).
