---
title: Enable the Defender for Endpoint integration
description: Learn how to deploy the Microsoft Defender for Endpoint integration in Defender for Cloud to protect Azure, hybrid, and multicloud machines.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 03/13/2024
#customer intent: As a user, I want to learn how to enable the Defender for Endpoint integration in Defender for Cloud so that I can protect my Azure, hybrid, and multicloud machines.
---

# Enable Defender for Endpoint integration

The Defender for Servers plan in Microsoft Defender for Cloud [integrates natively with Microsoft Defender for Endpoint](integration-defender-for-endpoint.md) to provide Defender for Endpoint and Microsoft Defender Vulnerability Management capabilities to machines protected by Defender for Servers.

When you turn on the Defender for Servers plan, Defender for Endpoint integration is turned on by default for supported machines connected to Defender for Cloud. Integration automatically deploys the Defender for Endpoint sensor on connected machines.

This article describes how to enable Defender for Endpoint integration manually if needed.

## Prerequisites

- **Windows support**: Verify that Windows machines are [supported by Defender for Endpoint](/defender-endpoint/configure-server-endpoints#windows-server-2012-r2-and-windows-server-2016).
- **Linux servers**: For Linux servers, you must have Python installed. Python 3 is recommended for all distros, but is required for RHEL 8.x and Ubuntu 20.04 or higher. 
- **Azure VMs**: Check that VMs can connect to the Defender for Endpoint service. If machines don't have direct access, your proxy settings or firewall rules need to allow access to Defender for Endpoint URLs. Review proxy settings for [Windows](/defender-endpoint/configure-proxy-internet) and [Linux](/defender-endpoint/linux-static-proxy-configuration) machines.
- **On-premises VMs**: - We recommend [onboarding on-premises machines as Azure Arc-enabled VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm). If you [onboard on-premises VMs directly](onboard-machines-with-defender-for-endpoint.md), Defender Server Plan 1 features will be available, but most Defender for Servers Plan 2 functionlity isn't available.
- If you've moved your subscription between Azure tenants, some manual preparatory steps are also required. For details, [contact Microsoft support](https://portal.azure.com/#view/Microsoft_Azure_Support/HelpAndSupportBlade/~/overview).


## Enable integration on a subscription

If you've never enabled the Defender for Endpoint unified solution, you can turn it on manually for both Windows and Linux machines in a subscription using the [REST API call](#enable-the-microsoft-defender-for-endpoint-unified-solution-at-scale), or in the portal as follows:

1. In Defender for Cloud, select **Environment settings** and select the subscription containing the machines on which you want to deploy the Defender for Endpoint integration.

1. In **Settings and monitoring** > **Endpoint protection**, toggle the **Status** column settings to**On**. 

    :::image type="content" source="media/integration-defender-for-endpoint/enable-defender-for-endpoint.png" alt-text="Screenshot of Status toggle that enables Microsoft Defender for Endpoint." lightbox="media/integration-defender-for-endpoint/enable-defender-for-endpoint.png":::

1. Select **Continue** and **Save** to save your settings.

    The Defender for Endpoint unified sensor is deployed to all of Windows and Linux machines in the selected subscription.

    On Linux machines:
    - Defender for Cloud detects any previous Defender for Endpoint installations, and reconfigures them to integrate with Defender for Cloud.
    - To verify Defender for Endpoint sensor installation on a Linux machine, run the following shell command on each machine: `mdatp health`. If Microsoft Defender for Endpoint is installed, you'll see its health status:

    `healthy : true`

    `licensed: true`

    Also, in the Azure portal you'll see a new Azure extension on your machines called `MDE.Linux`.

    Onboarding might take up to an hour.



## Enable manually on Windows machines (plan and integration on)

If Defender for Servers is already enabled and Defender for Endpoint integration, you can manually turn on the integration for specific machines using the [REST API call](#enable-the-microsoft-defender-for-endpoint-unified-solution-at-scale), or turn on in the portal.

> [!NOTE]
> If you deploy Defender for Servers Plan 2 (and the Defender for Endpoint sensor isn't deployed on Windows 2012 R2 and 2016 servers) and then downgrade to Plan 1, the sensor won't be deployed automatically to those servers, so that your existing deployment isn't changed without your explicit consent.

Enable as follows:

1. In Defender for Cloud, select **Environment settings** and select the subscription with the Windows machines that you want to receive Defender for Endpoint.

1. In the Monitoring coverage column of the Defender for Servers plan, select **Settings**.

    The status of the Endpoint protections component is **Partial**, meaning that not all parts of the component are enabled.

1. Select **Fix** to see the components that aren't enabled.

    :::image type="content" source="./media/integration-defender-for-endpoint/fix-defender-for-endpoint.png" alt-text="Screenshot of Fix button that enables Microsoft Defender for Endpoint support.":::

1. In **Missing components** > **Unified solution**, select enable to automatically provision the Defender for Endpoint sensor on Windows Server 2012 R2 and 2016 machines connected to Microsoft Defender for Cloud.

    :::image type="content" source="./media/integration-defender-for-endpoint/enable-defender-for-endpoint-unified.png" alt-text="Screenshot of enabling the use of the Defender for Endpoint unified solution for Windows Server 2012 R2 and 2016 machines.":::

1. To save the changes, select **Save** at the top of the page. In the **Settings and monitoring** page, select **Continue**.

    Defender for Cloud onboards for all existing and new Windows Server 2012 R2 and 2016 machines to Defender for Endpoint.

    Onboarding might take up to 12 hours. For new machines created after the integration has been enabled, onboarding takes up to an hour.

## Enable manually on Linux (plan and integration on)

If Defender for Servers is already enabled and Defender for Endpoint integration is on by default, you can manually turn on the integration for specific Linux machines in the portal.

> [!NOTE]
> - Automatic deployment of the Defender for Endpoint sensor on Linux machines might not work as expected on machines running services that use [fanotify](/microsoft-365/security/defender-endpoint/microsoft-defender-endpoint-linux#system-requirements) or other incompatible components.
> - After you validate potential compatibility issues, we recommend that you manually install Defender for Endpoint on these servers.

Turn on integration as follows:

1. In Defender for Cloud, select **Environment settings** and select the subscription with the Linux machines that you want to receive Defender for Endpoint.

1. In the Monitoring coverage column of the Defender for Server plan, select **Settings**.

    The status of the Endpoint protections component is **Partial**, meaning that not all parts of the component are enabled.

1. Select **Fix** to see the components that aren't enabled.

    :::image type="content" source="./media/integration-defender-for-endpoint/fix-defender-for-endpoint.png" alt-text="Screenshot of Fix button that enables Microsoft Defender for Endpoint support.":::

1. In **Missing components** > **Linux machines**, select **Enable**.

    :::image type="content" source="./media/integration-defender-for-endpoint/enable-defender-for-endpoint-linux.png" alt-text="Screenshot of enabling the integration between Defender for Cloud and Microsoft's EDR solution, Microsoft Defender for Endpoint for Linux.":::

1. To save the changes, select **Save** at the top of the page. In the **Settings and monitoring** page, select **Continue**.

    Defender for Cloud onboards Linux machines to Defender for Endpoint. Defender for Cloud detects any previous Defender for Endpoint installations, and reconfigures them to integrate with Defender for Cloud.

    Onboarding might take up to 12 hours. For new machines created after the integration has been enabled, onboarding takes up to an hour.



    > [!NOTE]
    > The next time you open the **Missing components** page, the option to enable/disable integration for Linux machines doesn't appear. To disable Linux integration, you need to turn off Defender for Endpoint integration for the plan (disabling it for Windows too), and then turn back on for Windows machines as needed.

1. To verify Defender for Endpoint sensor installation on a Linux machine, run the following shell command on each machine.

    `mdatp health`

    If Microsoft Defender for Endpoint is installed, you'll see its health status:

    `healthy : true`

    `licensed: true`

    Also, in the Azure portal you'll see a new Azure extension on your machines called `MDE.Linux`.

#


## Enable integration on Linux in multiple subscriptions

An insight panel in the Defender for Cloud dashboard shows information about Defender for Endpoint integration in subscriptions that don't have doesn't have Defender for Endpoint integration enabled for Linux machines. 

Defender for Cloud > Workload protections > Insights panel?


If integration is enabled for Linux machines in a subscription, the insight panel doesn't show information about that subscription. 

If one or more subscriptions don't have endpoint integration for Linux machines, you see an insight panel in the Defender for Cloud dashboard. 

- The insight panel tells you about subscriptions that have Defender for Endpoint integration enabled for Windows machines, but not for Linux machines. You can use the insight panel to see the affected subscriptions with the number of affected resources in each subscription. Subscriptions that don't have Linux machines show no affected resources. You can then select the subscriptions to enable endpoint protection for Linux integration.

After you select **Enable** in the insight panel, Defender for Cloud:

- Automatically onboards your Linux machines to Defender for Endpoint in the selected subscriptions.
- Detects any previous installations of Defender for Endpoint and reconfigure them to integrate with Defender for Cloud.

Use the [Defender for Endpoint status workbook](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Workbooks/Defender%20for%20Servers%20Deployment%20Status) to verify installation and deployment status of Defender for Endpoint on a Linux machine.

### Enable with PowerShell on multiple subscriptions

Use our [PowerShell script](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/MDE%20Integration/Enable%20MDE%20Integration%20for%20Linux) from the Defender for Cloud GitHub repository to enable endpoint protection on Linux machines that are in multiple subscriptions.

### Manage automatic updates for Linux

In Windows, Defender for Endpoint version updates are provided via continuous knowledge base updates; in Linux you need to update the Defender for Endpoint package. When you use Defender for Servers with the `MDE.Linux` extension, automatic updates for Microsoft Defender for Endpoint are enabled by default. If you wish to manage the Defender for Endpoint version updates manually, you can disable automatic updates on your machines. To do so, add the following tag for machines onboarded with the `MDE.Linux` extension.

- Tag name: 'ExcludeMdeAutoUpdate'
- Tag value:  'true'

This configuration is supported for Azure VMs and Azure Arc machines, where the `MDE.Linux` extension initiates auto-update.

## Enable integration at scale

You can also enable the Defender for Endpoint unified solution at scale through the supplied REST API version 2022-05-01. For full details, see the [API documentation](/rest/api/defenderforcloud/settings/update?tabs=HTTP).

Here's an example request body for the PUT request to enable the Defender for Endpoint unified solution:

URI: `https://management.azure.com/subscriptions/<subscriptionId>/providers/Microsoft.Security/settings/WDATP?api-version=2022-05-01`

```json
{
    "name": "WDATP",
    "type": "Microsoft.Security/settings",
    "kind": "DataExportSettings",
    "properties": {
        "enabled": true
    }
}
```

## Track Defender for Endpoint deployment status

You can use the [Defender for Endpoint deployment status workbook](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Workbooks/Defender%20for%20Servers%20Deployment%20Status) to track the Defender for Endpoint deployment status on your Azure VMs and non-Azure machines that are connected via Azure Arc. The interactive workbook provides an overview of machines in your environment showing their Microsoft Defender for Endpoint extension deployment status.

## Access the Defender portal

1. Ensure the user account has the necessary permissions. Learn more in [Assign user access to Microsoft Defender Security Center](/microsoft-365/security/defender-endpoint/assign-portal-access).

1. Check whether you have a proxy or firewall that is blocking anonymous traffic. The Defender for Endpoint sensor connects from the system context, so anonymous traffic must be permitted. To ensure unhindered access to the Defender for Endpoint portal, follow the instructions in [Enable access to service URLs in the proxy server](/microsoft-365/security/defender-endpoint/configure-proxy-internet#enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server).

1. Open the [Microsoft Defender Portal](https://security.microsoft.com/). Learn about [Microsoft Defender for Endpoint in Microsoft Defender XDR](/microsoft-365/security/defender/microsoft-365-security-center-mde).

## Send a test alert

To generate a benign test alert from Defender for Endpoint, select the tab for the relevant operating system of your endpoint:

- [Test on Windows](#test-on-windows)

- [Test on Linux](#test-on-linux)

### Test on Windows

For endpoints running Windows:

1. Create a folder 'C:\test-MDATP-test'.
1. Use Remote Desktop to access your machine.
1. Open a command-line window.
1. At the prompt, copy and run the following command. The command prompt window will close automatically.

    ```powershell
    powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden (New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\\test-MDATP-test\\invoice.exe'); Start-Process 'C:\\test-MDATP-test\\invoice.exe'
    ```

    :::image type="content" source="./media/integration-defender-for-endpoint/generate-edr-alert.png" alt-text="A command prompt window with the command to generate a test alert.":::

    If the command is successful, you'll see a new alert on the workload protection dashboard and the Microsoft Defender for Endpoint portal. This alert might take a few minutes to appear.
1. To review the alert in Defender for Cloud, go to **Security alerts** > **Suspicious PowerShell CommandLine**.
1. From the investigation window, select the link to go to the Microsoft Defender for Endpoint portal.

    > [!TIP]
    > The alert is triggered with **Informational** severity.

### Test on Linux

For endpoints running Linux:

1. Download the test alert tool from: <https://aka.ms/LinuxDIY>
1. Extract the contents of the zip file and execute this shell script:

    `./mde_linux_edr_diy`

    If the command is successful, you'll see a new alert on the workload protection dashboard and the Microsoft Defender for Endpoint portal. This alert might take a few minutes to appear.

1. To review the alert in Defender for Cloud, go to **Security alerts** > **Enumeration of files with sensitive data**.
1. From the investigation window, select the link to go to the Microsoft Defender for Endpoint portal.

    > [!TIP]
    > The alert is triggered with **Low** severity.

## Remove Defender for Endpoint from a machine

To remove the Defender for Endpoint solution from your machines:

1. Disable the integration:
    1. From Defender for Cloud's menu, select **Environment settings** and select the subscription with the relevant machines.
    1. In the Defender plans page, select **Settings & Monitoring**.
    1. In the status of the Endpoint protection component, select **Off** to disable the integration with Microsoft Defender for Endpoint.
    1. Select **Continue** and **Save** to save your settings.

1. Remove the MDE.Windows/MDE.Linux extension from the machine.

1. Follow the steps in [Offboard devices from the Microsoft Defender for Endpoint service](/microsoft-365/security/defender-endpoint/offboard-machines) from the Defender for Endpoint documentation.

## Related content

- [Platforms and features supported by Microsoft Defender for Cloud](security-center-os-coverage.md)
- [Learn how recommendations help you protect your Azure resources](review-security-recommendations.md)
- View common question about the [Defender for Cloud integration with Microsoft Defender for Endpoint](faq-defender-for-servers.yml)
