---
title: Configuring the data connectors in Microsoft Security Exposure Management
description: Learn about configuring the data connectors in Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/06/2024
---

# Configure your data connectors

To establish a connection with any of the supported external products, follow these steps:

1. Complete the applicable prerequisite steps for your external data connectors.
   Each of the connectors have explicit instructions for setting up valid credentials and creating the connection.
     - [ServiceNow CMDB](ServiceNow-data-connector.md)
     - [Qualys VM](Qualys-data-connector.md)
     - [Rapid7 VM](Rapid7-data-connector.md)
     - [Tenable](Tenable-data-connector.md)
     - Wiz (coming soon)
     - Palo Alto (coming soon)

2. Go to **Data Connectors** in the Exposure Management navigation.
3. Select **Connect** on the selected data connector from the external connectors catalog.
4. A side pane opens with the relevant connectivity details. Fill in the required fields and select **Connect**.
5. The data connector is now connected and will start ingesting data from the external source.

> [!Note]
> It may take several hours for the connectors data to propagate to all experiences after the data connector is configured.

## Allowlist IP addresses

To ensure successful connections between Exposure Management and external products, you may need to allowlist specific Microsoft IP addresses. Follow these steps to obtain the required IP addresses and configure it with the external products:

1. Identify the IP addresses:
   1. Obtain and copy the list of the IPs for your allowlist from the IP ranges under "Scuba" in the public IP ranges reference here: [Download Azure IP Ranges and Service Tags – Public Cloud from Official Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=56519)
2. Access the external product's configuration settings:
   1. Log in to the external product's administration or configuration portal.
   2. Navigate to the section where you can manage network settings or security settings.
3. Add the IP addresses to the allowlist:
   1. Locate the allowlist.
   2. Enter the IP addresses that you obtained in step 1.
   3. Save the changes to update the allowlist.
4. Verify the connection:
   1. After updating the allowlist, verify that the connection between the external product and our system is successful.
   2. Check for any error messages or connection issues and ensure that the allowlisted IP addresses are correctly configured.
5. Troubleshooting:
   1. If you encounter any issues, double-check the IP addresses and ensure they are correctly entered.
   2. Refer to the external product's documentation for additional troubleshooting steps or contact their support team for assistance.

For specific instructions on allowlisting IP addresses for each external product, please refer to their respective documentation or support resources.

## Next steps

Select the external data connector you want to configure and follow the steps to connect it to Exposure Management.

- [CMDB data connectors](ServiceNow-data-connector.md)
- [Vulnerability management data connectors](Qualys-data-connector.md)
- Cloud security data connectors (coming soon)
