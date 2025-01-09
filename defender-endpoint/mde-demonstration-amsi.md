---
title: AMSI demonstrations with Microsoft Defender for Endpoint
description: Demonstration of AMSI detection by Microsoft Defender for Endpoint
author: emmwalshh
ms.author: ewalsh
ms.reviewer: yongrhee
ms.localizationpriority: medium
ms.service: defender-endpoint
ms.subservice: ngp
audience: ITPro
ms.collection: 
- m365-security
ms.topic: how-to
ms.date: 10/16/2024
search.appverid: met150
ms.custom: 
- partner-contribution
---

# AMSI demonstrations with Microsoft Defender for Endpoint

**Applies to:**

- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender for Business](https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-business)
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender Antivirus](microsoft-defender-antivirus-windows.md)

Microsoft Defender for Endpoint utilizes the [Antimalware Scan Interface (AMSI)](/defender-endpoint/amsi-on-mdav) to enhance protection against fileless malware, dynamic script-based attacks, and other nontraditional cyber threats. In this article, we describe how to test the AMSI engine with a benign sample.

## Scenario requirements and setup

- Windows 10 or newer
- Windows Server 2016, or newer
- Microsoft Defender Antivirus (as primary) and these capabilities need to be enabled:
  - Real-Time Protection (RTP) 
  - Behavior Monitoring (BM)  
  - Turn on script scanning
    

## Testing AMSI with Defender for Endpoint

In this demonstration article, you have two engine choices to test AMSI:

- PowerShell
- VBScript

### Test AMSI with PowerShell

1. Save the following PowerShell script as `AMSI_PoSh_script.ps1`:

   :::image type="content" source="media/mde-demonstrations-amsi/test-amsi-powershell-save-script.png" alt-text="Screenshot showing PowerShell script to save as AMSI_PoSh_script.ps1" lightbox="media/mde-demonstrations-amsi/test-amsi-powershell-save-script.png":::

2. On your device, open PowerShell as an administrator.

3. Type `Powershell -ExecutionPolicy Bypass AMSI_PoSh_script.ps1`, and then press **Enter**.

   The result should be as follows:

   :::image type="content" source="media/mde-demonstrations-amsi/test-amsi-powershell-results.png" alt-text="Screenshot showing the results of the AMSI test sample. It should show a threat was detected." lightbox="media/mde-demonstrations-amsi/test-amsi-powershell-results.png":::

   
### Testing AMSI with VBScript

1. Save the following VBScript as `AMSI_vbscript.vbs`:

   :::image type="content" source="media/mde-demonstrations-amsi/test-amsi-vbscript-save-script.png" alt-text="Screenshot showing VBScript to save as AMSI_vbscript.vbs" lightbox="media/mde-demonstrations-amsi/test-amsi-vbscript-save-script.png":::

2. On your Windows Device, open Command Prompt as an administrator.

2. Type `wscript AMSI_vbscript.js`, and then press **Enter**.

   The result should be as follows:

   :::image type="content" source="media/mde-demonstrations-amsi/test-amsi-vbscript-results.png" alt-text="Screenshot showing the AMSI test results. It should show that antivirus software blocked the script." lightbox="media/mde-demonstrations-amsi/test-amsi-vbscript-results.png":::

   
### Verifying the test results

In your protection history, you should be able to see the following information:

:::image type="content" source="media/mde-demonstrations-amsi/verifying-results.png" alt-text="Screenshot showing the AMSI test results. The information should show that a threat was blocked and cleaned." lightbox="media/mde-demonstrations-amsi/verifying-results.png":::

### Get the list of Microsoft Defender Antivirus threats

You can view detected threats by using the Event log or PowerShell.

#### Use the Event log

1. Go to **Start**, and search for `EventVwr.msc`. Open Event Viewer in the list of results.

2. Go to **Applications and Services Logs** > **Microsoft** > **Windows** > **Windows Defender operational events**.

3. Look for `event ID 1116`. You should see the following information:

   :::image type="content" source="media/mde-demonstrations-amsi/eventid1116.png" alt-text="Screenshot showing Event ID 1116, which says malware or unwanted software was detected." lightbox="media/mde-demonstrations-amsi/eventid1116.png":::

##### Use PowerShell

1. On your device, open PowerShell.

2. Type the following command: `Get-MpThreat`.

   You might see the following results:

   :::image type="content" source="media/mde-demonstrations-amsi/get-mpthreat-results.png" alt-text="Screenshot showing the results of the Get-MpThreat command. It should show that an AMSI threat was detected." lightbox="media/mde-demonstrations-amsi/get-mpthreat-results.png":::


## See also

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]