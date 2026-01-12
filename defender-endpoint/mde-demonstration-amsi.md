---
title: AMSI demonstrations with Microsoft Defender for Endpoint
description: Demonstration of AMSI detection by Microsoft Defender for Endpoint
author: KesemSharabi
ms.author: kesharab
ms.reviewer: yongrhee
ms.localizationpriority: medium
ms.service: defender-endpoint
ms.subservice: ngp
audience: ITPro
ms.collection: 
- m365-security
ms.topic: how-to
ms.date: 10/20/2025
search.appverid: met150
ms.custom: 
- partner-contribution
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business

---
# AMSI demonstrations with Microsoft Defender for Endpoint


Microsoft Defender for Endpoint utilizes the [Antimalware Scan Interface (AMSI)](/defender-endpoint/amsi-on-mdav) to enhance protection against fileless malware, dynamic script-based attacks, and other nontraditional cyber threats. In this article, we describe how to test the AMSI engine with a benign sample.

## Prerequsites

- Microsoft Defender Antivirus (as primary) and these capabilities need to be enabled:
  - Real-Time Protection (RTP) 
  - Behavior Monitoring (BM)  
  - Turn on script scanning

### Supported operating systems

- Windows 10 and later
- Windows Server 2016 and later

## Testing AMSI with Defender for Endpoint

In this demonstration article, you have two engine choices to test AMSI:

- PowerShell
- VBScript

### Test AMSI with PowerShell

1. Save the following PowerShell script as `AMSI_PoSh_script.ps1`:

   ```powershell
   $testString = "AMSI Test Sample: " + "7e72c3ce-861b-4339-8740-0ac1484c1386"
   Invoke-Expression $testString
   ```powershell
   
1. On your device, open PowerShell as an administrator.

1. Type `Powershell -ExecutionPolicy Bypass AMSI_PoSh_script.ps1`, and then press **Enter**.

   The result should be as follows:

    ```powershell
       Invoke-Expression : At line:1 char:1

       + AMSI Test Sample: 7e72c3ce-861b-4339-8740-8ac1484c1386

       + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

       This script contains malicious content and has been blocked by your antivirus software.

       At C:\Users\Admin\Desktop\AMSI_PoSh_script.ps1:3 char:1

       + Invoke-Expression $testString

       + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

       + CategoryInfo          : ParserError: (:) [Invoke-Expression], ParseException
       
       + FullyQualifiedErrorId : ScriptContainedMaliciousContent,Microsoft.PowerShell.Commands.InvokeExpressionCommand
        ```

### Testing AMSI with VBScript

1. Save the following VBScript as `AMSI_vbscript.vbs`:

   ```vbscript
   REM Save this sample AMSI vbscript as AMSI_vbscript.vbs
   Dim result
   result = eval("AMSI Test Sample: " + "7e72c3ce-861b-4339-8740-0ac1484c1386")
   WScript.Echo result
   ```
   
1. On your Windows Device, open Command Prompt as an administrator.

1. Type `wscript AMSI_vbscript.vbs`, and then press **Enter**.

   The result should be as follows:

    ```vbscript
    Windows Script Host

    Script: C:\Users\Admin\Desktop\AMSI_vbscript.vbs

    Line: 3

    Char: 1

    Error: This script contains malicious content and has been blocked by your antivirus software.: 'eval'

    Code: 800A802D

    Source: Microsoft VBScript runtime error
   ```

### Verifying the test results

In your protection history, you should be able to see the following information:

```vbscript
Threat blocked

Detected: Virus: Win32/MpTest!amsi

Status: Cleaned

This threat or app was cleaned or quarantined before it became active on your device.

Details: This program is dangerous and replicates by infecting other files.

Affected items:

amsi: \Device\HarddiskVolume3\Windows\System32\WindowsPowershell\v1.0\powershell.exe

or

amsi: C:\Users\Admin\Desktop\AMSI_vbscript.vbs

and/or you might see:

Threat blocked

Detected: Virus: Win32/MpTest!amsi

Status: Cleaned

This threat or app was cleaned or quarantined before it became active on your device.

Details: This program is dangerous and replicates by infecting other files
```

### Get the list of Microsoft Defender Antivirus threats

You can view detected threats by using the Event log or PowerShell.

#### Use the Event log

1. Go to **Start**, and search for `EventVwr.msc`. Open Event Viewer in the list of results.

1. Go to **Applications and Services Logs** > **Microsoft** > **Windows** > **Windows Defender operational events**.

1. Look for `event ID 1116`. You should see the following information:

    ```powershell
    
    Microsoft Defender Antivirus has detected malware or other potentially unwanted software.
    
    For more information please see the following: https://go.microsoft.com/fwlink/?linkid=37020&name=Virus:Win32/MpTest!amsi&t
    
    Name: Virus:Win32/MpTest!amsi
    
    ID: 2147694217
    
    Severity: Severe
    
    Category: Virus
    
    Path: \Device\HarddiskVolume3\Windows\System32\WindowsPowerShell\v1.0\powershell.exe or C:\Users\Admin\Desktop\AMSI_jscri
    
    Detection Origin: Local machine or Unknown
    
    Detection Type: Concrete
    
    Detection Source: System
    
    User: NT AUTHORITY\SYSTEM
    
    Process Name: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe or C:\Windows\System32\cscript.exe or C:\Windows\Sy
    
    Security intelligence Version: AV: 1.419.221.0, AS: 1.419.221.0, NIS: 1.419.221.0
    
    Engine Version: AM: 1.1.24080.9, NIS: 1.1.24080.9
    ```

#### Use PowerShell 

1. On your device, open PowerShell.

1. Type the following command: `Get-MpThreat`.

   You might see the following results:

    ```powershell
    CategoryID     : 42

    DidThreatExecute : True

    IsActive       : True

    Resources      :

    RollupStatus   : 97

    SchemaVersion  : 1.0.0.0

    SeverityID     : 5

    ThreatID       : 2147694217

    ThreatName     : Virus:Win32/MpTest!amsi

    TypeID         : 0

    PSComputerName :
    ```


## See also

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
