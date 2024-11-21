---
title: Remediate EDR recommendations in Defender for Cloud using the MMA 
description: Learn how to remediate endpoint detection and response recommendations when using the MMA in Microsoft Defender for Cloud
ms.topic: concept-article
ms.custom: linux-related-content
ms.author: dacurwin
author: dcurwin
ms.date: 09/08/2024
#customer intent: As a reader, I want to understand the assessment checks for endpoint detection and response solutions so that I can ensure the security of my systems.
---

# Remediate EDR recommendations (MMA)

Microsoft Defender for Cloud integrates natively with [Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) to provide endpoint detection and response (EDR) capabilities for machines connected to Defender for Cloud.

As part of these [integrated EDR capabilities](integration-defender-for-endpoint.md), Defender for Cloud agentlessly scans machines to assess whether they're running an EDR solutionץ The solution can be the integrated Defender for Endpoint solution, or a [supported third-party solution](detect-endpoint-detection-response-solutions.md#supported-edr-solutions).


Based on findings, Defender for Cloud makes recommendations to address EDR solution issues. This article describes how to remediate those recommendations when you're using the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) to collect EDR solution information.

> [!NOTE]
> - This feature now [uses agentless scanning](endpoint-detection-response.md) to replace the MMA agent th
> - Use of the MMA for this feature will be deprecated in November 2024.
 
## Review recommendation conditions

Review the conditions that trigger the recommendations for EDR solutions.

### Windows Defender

| Recommendation | Appears when |
|--|--|
| **[Endpoint protection should be installed on your machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/4fb67663-9ab9-475d-b026-8c544cced439)** | [Get-MpComputerStatus](/powershell/module/defender/get-mpcomputerstatus) runs and the result is **AMServiceEnabled: False** |
| **[Endpoint protection health issues should be resolved on your machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/37a3689a-818e-4a0e-82ac-b1392b9bb000)** | [Get-MpComputerStatus](/powershell/module/defender/get-mpcomputerstatus) runs and any of the following occurs: <br><br> Any of the following properties are false: <br><br> - **AMServiceEnabled** <br> - **AntispywareEnabled** <br> - **RealTimeProtectionEnabled** <br> - **BehaviorMonitorEnabled** <br> - **IoavProtectionEnabled** <br> - **OnAccessProtectionEnabled** <br> <br> If one or both of the following properties are 7 or more: <br><br> - **AntispywareSignatureAge** <br> - **AntivirusSignatureAge** |

### Microsoft System Center endpoint protection


| Recommendation | Appears when |
|--|--|
| **Endpoint protection should be installed on your machines** | importing **SCEPMpModule ("$env:ProgramFiles\Microsoft Security Client\MpProvider\MpProvider.psd1")** and running **Get-MProtComputerStatus** results in **AMServiceEnabled = false** |
| **Endpoint protection health issues should be resolved on your machines** | **Get-MprotComputerStatus** runs and any of the following occurs: <br><br> At least one of the following properties is false: <br><br> - **AMServiceEnabled** <br> - **AntispywareEnabled** <br> - **RealTimeProtectionEnabled** <br> - **BehaviorMonitorEnabled** <br> - **IoavProtectionEnabled** <br> - **OnAccessProtectionEnabled** <br><br> If one or both of the following Signature Updates are greater or equal to 7: <br><br> - **AntispywareSignatureAge** <br> - **AntivirusSignatureAge** |

### Trend Micro


| Recommendation | Appears when |
|--|--|
| **Endpoint protection should be installed on your machines** | any of the following checks aren't met: <br><br> - **HKLM:\SOFTWARE\TrendMicro\Deep Security Agent** exists <br> - **HKLM:\SOFTWARE\TrendMicro\Deep Security Agent\InstallationFolder** exists <br> - The **dsa_query.cmd** file is found in the Installation Folder <br> - Running **dsa_query.cmd** results with **Component.AM.mode: on - Trend Micro Deep Security Agent detected** |

### Symantec endpoint protection


| Recommendation | Appears when |
|--|--|
| **Endpoint protection should be installed on your machines** | any of the following checks aren't met: <br> <br> - **HKLM:\Software\Symantec\Symantec Endpoint Protection\CurrentVersion\PRODUCTNAME = "Symantec Endpoint Protection"** <br> - **HKLM:\Software\Symantec\Symantec Endpoint Protection\CurrentVersion\public-opstate\ASRunningStatus = 1** <br> Or <br> - **HKLM:\Software\Wow6432Node\Symantec\Symantec Endpoint Protection\CurrentVersion\PRODUCTNAME = "Symantec Endpoint Protection"** <br> - **HKLM:\Software\Wow6432Node\Symantec\Symantec Endpoint Protection\CurrentVersion\public-opstate\ASRunningStatus = 1**|
| **Endpoint protection health issues should be resolved on your machines** | any of the following checks aren't met: <br> <br> - Check Symantec Version >= 12: Registry location: **HKLM:\Software\Symantec\Symantec Endpoint Protection\CurrentVersion" -Value "PRODUCTVERSION"** <br> - Check Real-Time Protection status: **HKLM:\Software\Wow6432Node\Symantec\Symantec Endpoint Protection\AV\Storages\Filesystem\RealTimeScan\OnOff == 1** <br> - Check Signature Update status: **HKLM\Software\Symantec\Symantec Endpoint Protection\CurrentVersion\public-opstate\LatestVirusDefsDate <= 7 days** <br> - Check Full Scan status: **HKLM:\Software\Symantec\Symantec Endpoint Protection\CurrentVersion\public-opstate\LastSuccessfulScanDateTime <= 7 days** <br> - Find signature version number Path to signature version for Symantec 12: **Registry Paths+ "CurrentVersion\SharedDefs" -Value "SRTSP"** <br> - Path to signature version for Symantec 14: **Registry Paths+ "CurrentVersion\SharedDefs\SDSDefs" -Value "SRTSP"** <br><br> Registry Paths: <br> <br> - **"HKLM:\Software\Symantec\Symantec Endpoint Protection" + $Path;** <br> - **"HKLM:\Software\Wow6432Node\Symantec\Symantec Endpoint Protection" + $Path** |

### McAfee endpoint protection for Windows


| Recommendation | Appears when |
|--|--| 
| **Endpoint protection should be installed on your machines** | any of the following checks aren't met: <br><br> - **HKLM:\SOFTWARE\McAfee\Endpoint\AV\ProductVersion** exists <br> - **HKLM:\SOFTWARE\McAfee\AVSolution\MCSHIELDGLOBAL\GLOBAL\enableoas = 1**|
| **Endpoint protection health issues should be resolved on your machines** | any of the following checks aren't met: <br> <br> - McAfee Version: **HKLM:\SOFTWARE\McAfee\Endpoint\AV\ProductVersion >= 10** <br> - Find Signature Version: **HKLM:\Software\McAfee\AVSolution\DS\DS -Value "dwContentMajorVersion"** <br> - Find Signature date: **HKLM:\Software\McAfee\AVSolution\DS\DS -Value "szContentCreationDate" >= 7 days** <br> - Find Scan date: **HKLM:\Software\McAfee\Endpoint\AV\ODS -Value "LastFullScanOdsRunTime" >= 7 days** |

### McAfee Endpoint Security for Linux Threat Prevention

| Recommendation | Appears when |
|--|--|  
| **Endpoint protection should be installed on your machines** | any of the following checks aren't met: <br> <br> - File **/opt/McAfee/ens/tp/bin/mfetpcli** exists <br> - **"/opt/McAfee/ens/tp/bin/mfetpcli --version"** output is: **McAfee name = McAfee Endpoint Security for Linux Threat Prevention and McAfee version >= 10** |
| **Endpoint protection health issues should be resolved on your machines** | any of the following checks aren't met: <br> <br> - **"/opt/McAfee/ens/tp/bin/mfetpcli --listtask"** returns **Quick scan, Full scan** and both of the scans <= 7 days <br> - **"/opt/McAfee/ens/tp/bin/mfetpcli --listtask"** returns **DAT and engine Update time** and both of them <= 7 days <br> - **"/opt/McAfee/ens/tp/bin/mfetpcli --getoasconfig --summary"** returns **On Access Scan** status |

### Sophos Antivirus for Linux

| Recommendation | Appears when |
|--|--|
| **Endpoint protection should be installed on your machines** | any of the following checks aren't met: <br> <br> - File **/opt/sophos-av/bin/savdstatus** exits or search for customized location **"readlink $(which savscan)"** <br> - **"/opt/sophos-av/bin/savdstatus --version"** returns Sophos name = **Sophos Anti-Virus and Sophos version >= 9** |
| **Endpoint protection health issues should be resolved on your machines** | any of the following checks aren't met: <br> <br> - **"/opt/sophos-av/bin/savlog --maxage=7 \| grep -i "Scheduled scan .\* completed" \| tail -1"**, returns a value <br> - **"/opt/sophos-av/bin/savlog --maxage=7 \| grep "scan finished"** \| tail -1", returns a value <br> - **"/opt/sophos-av/bin/savdstatus --lastupdate"** returns lastUpdate, which should be <= 7 days <br> - **"/opt/sophos-av/bin/savdstatus -v"** is equal to **"On-access scanning is running"** <br> - **"/opt/sophos-av/bin/savconfig get LiveProtection"** returns enabled | 

## Troubleshoot

- You can troubleshoot issues using the Microsoft Antimalware extension logs, available at:
**%Systemdrive%\WindowsAzure\Logs\Plugins\Microsoft.Azure.Security.IaaSAntimalware(Or PaaSAntimalware)\1.5.5.x(version#)\CommandExecution.log**.
- For more help resources:
- Reach out to the [Azure Community Support](https://azure.microsoft.com/support/community/).
- To file an Azure support incident, go the [Azure support site](https://azure.microsoft.com/support/options/) and select Get support.
- For information about using Azure Support, read the [Microsoft Azure support common questions](https://azure.microsoft.com/support/faq/).
