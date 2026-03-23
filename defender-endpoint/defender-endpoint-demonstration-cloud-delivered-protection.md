---
title: Microsoft Defender for Endpoint Cloud-delivered protection demonstration
description: See how Cloud-delivered protection can automatically detect and delete malicious files. 
search.appverid: met150
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.reviewer: yongrhee
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier2
- demo
ms.topic: article
ms.subservice: ngp
ms.date: 10/20/2025
appliesto:
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
  - Microsoft Defender Antivirus

---
# Cloud-delivered protection demonstration


Cloud-delivered protection for Microsoft Defender Antivirus, also referred to as Microsoft Advanced Protection Service (MAPS), provides you with strong, fast protection in addition to our standard real-time protection.

## Prerequisites 

- Microsoft Defender Real-time protection is enabled
- Cloud-delivered protection is enabled by default, however you may need to re-enable it if it has been disabled as part of previous organizational policies. For more information, see [Enable cloud-delivered protection in Microsoft Defender Antivirus](/windows/threat-protection/windows-defender-antivirus/enable-cloud-protection-windows-defender-antivirus?ocid=wd-av-demo-cloud-middle).
- You can also download and use the [PowerShell script](https://www.powershellgallery.com/packages/WindowsDefender_InternalEvaluationSettings/) to enable this setting and others on Windows 10 and Windows 11.

### Supported operating systems 

- Windows 11
-  Windows 10
-  Windows 8.1
-  Windows 7 SP1

### Scenario

1. Download and extract the [zipped folder that contains the test file](https://go.microsoft.com/fwlink/?linkid=2298135). The password is *infected*.

   > [!IMPORTANT]
   > The test file isn't malicious, it's just a harmless file simulating a virus.

1. If you see file blocked by Microsoft Defender SmartScreen, select on "View downloads" button.

   :::image type="content" source="media/cloud-delivered-protection-smartscreen-block.png" alt-text="SmartScreen blocks an unsafe download, and provides a button to select to view the **Downloads** list details.":::

1. In Downloads menu right select on the blocked file and select on **Download unsafe file**.

   :::image type="content" source="media/cloud-delivered-protection-smartscreen-block-view-downloads.png" alt-text="Lists the download as unsafe, but provides an option to proceed with the download":::

1. Navigate to the location where the file was downloaded. Attempt to open or execute the file by double clicking it. You should see that Microsoft Defender Antivirus found a virus and deleted the file.

   > [!NOTE]
   >
   > In some cases, you might also see **Threat Found** notification from Microsoft Defender Security Center.

   :::image type="content" source="media/cloud-delivered-protection-smartscreen-threat-found-notification.png" alt-text="Microsoft Defender Antivirus Threats found notification provides options to get details":::

1. If the file executes, or if you see that it was blocked by Microsoft Defender SmartScreen,  cloud-delivered protection isn't working. For more information, see [Configure and validate network connections for Microsoft Defender Antivirus](/windows/threat-protection/windows-defender-antivirus/configure-network-connections-windows-defender-antivirus?ocid=wd-av-demo-cloud-middle).

## See also

[Utilize Microsoft cloud-delivered protection in Microsoft Defender Antivirus](/windows/threat-protection/windows-defender-antivirus/utilize-microsoft-cloud-protection-windows-defender-antivirus?ocid=wd-av-demo-cloud-bottom)

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)

