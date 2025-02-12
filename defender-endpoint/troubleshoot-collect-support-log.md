---
title: Collect support logs in Microsoft Defender for Endpoint using live response
description: Learn how to collect logs using live response to troubleshoot Microsoft Defender for Endpoint issues
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-edr
ms.topic: troubleshooting
ms.subservice: edr
search.appverid: met150
ms.date: 02/03/2025
---

# Collect support logs in Microsoft Defender for Endpoint using live response

**Applies to:**
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

When contacting support, you might be asked to provide the output package of the Microsoft Defender for Endpoint Client Analyzer tool.

This article provides instructions on how to run the tool via Live Response on Windows and on Linux machines.

## Windows

1. Download and fetch the required scripts available from within the **Tools** subdirectory of the [Microsoft Defender for Endpoint Client Analyzer](https://aka.ms/MDEClientAnalyzerPreview). 

   For example, to get the basic sensor and device health logs, fetch `..\Tools\MDELiveAnalyzer.ps1`.
   - If you require additional logs related to Microsoft Defender Antivirus, then use `..\Tools\MDELiveAnalyzerAV.ps1`.
   - If you require [Microsoft Endpoint Data Loss Prevention](/purview/endpoint-dlp-learn-about) related logs, then use `..\Tools\MDELiveAnalyzerDLP.ps1`.
   - If you require network and [Windows Filter Platform](/windows-hardware/drivers/network/windows-filtering-platform-architecture-overview) related logs, then use `..\Tools\MDELiveAnalyzerNet.ps1`.
   - If you require [Process Monitor](/sysinternals/downloads/procmon) logs, then use `..\Tools\MDELiveAnalyzerAppCompat.ps1`.

2. Initiate a [Live Response session](live-response.md#initiate-a-live-response-session-on-a-device) on the machine you need to investigate.

3. Select **Upload file to library**.

   :::image type="content" source="media/upload-file.png" alt-text="The upload file" lightbox="media/upload-file.png":::

4. Select **Choose file**.

   :::image type="content" source="media/choose-file.png" alt-text="The choose file button-1" lightbox="media/choose-file.png":::

5. Select the downloaded file named `MDELiveAnalyzer.ps1`, and then select on **Confirm**.

   :::image type="content" source="media/analyzer-file.png" alt-text="The choose file button-2" lightbox="media/analyzer-file.png":::

   Repeat this step for the `MDEClientAnalyzerPreview.zip` file.

6. While still in the LiveResponse session, use the following commands to run the analyzer and collect the resulting file.

   ```console
   Putfile MDEClientAnalyzerPreview.zip
   Run MDELiveAnalyzer.ps1
   GetFile "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\MDECA\MDEClientAnalyzerResult.zip"
   ```

   [![Image of commands.](media/analyzer-commands.png)](media/analyzer-commands.png#lightbox)
   
### Additional information

- The latest preview version of MDEClientAnalyzer can be downloaded here: <https://aka.ms/MDEClientAnalyzerPreview>.

- For more information on gathering data locally on a machine in case the machine isn't communicating with Microsoft Defender for Endpoint cloud services, or doesn't appear in Microsoft Defender for Endpoint portal as expected, see [Verify client connectivity to Microsoft Defender for Endpoint service URLs](verify-connectivity.md).

- As described in [Live response command examples](live-response-command-examples.md), you might want to use the `&` symbol at the end of the command to collect logs as a background action:

   ```console
   Run MDELiveAnalyzer.ps1&
   ```

## Linux

The XMDE Client Analyzer tool can be downloaded as a [binary](https://go.microsoft.com/fwlink/?linkid=2297517) or [Python](https://aka.ms/XMDEClientAnalyzer) package that can be extracted and executed on Linux machines. Both versions of the XMDE Client Analyzer can be executed during a Live Response session.

### Prerequisites

- For installation the `unzip` package is required.

- For execution the `acl` package is required.

> [!IMPORTANT]
> Window uses the Carriage Return and Line Feed invisible characters to represent the end of one line and beginning of a new line in a file, but Linux systems uses only the Line Feed invisible character at the end of its file lines. When using the following scripts, if done on Windows, this difference can result in errors and failures of the scripts to run. A potential solution to this is to utilize the Windows Subsystem for Linux and the `dos2unix` package to reformat the script so it aligns with the Unix and Linux format standard.

### Installing the XMDE Client Analyzer

Both versions of XMDE Client Analyzer, binary and Python, a self-contained package that must be downloaded and extracted before executing, and the complete set of steps for this process can be found:

- [Running the Binary version of the Client Analyzer](/defender-endpoint/run-analyzer-macos-linux)

- [Running the Python version of the Client Analyzer](/defender-endpoint/run-analyzer-macos-linux)

Due to the limited commands available in Live Response the steps detailed must be executed in a bash script, and by splitting the installation and execution portion of these commands it's possible to run the install script once, while running the execution script multiple times.

> [!IMPORTANT]
> The example scripts assume the machine has direct internet access and can retrieve the XMDE Client Analyzer from Microsoft. If the machine does not have direct internet access then the installation scripts will need to be updated to fetch the XMDE Client Analyzer from a location the machines can access successfully.

#### Binary Client Analyzer Install Script

The following script performs the first six steps of the [Running the Binary version of the Client Analyzer](/defender-endpoint/run-analyzer-macos-linux). When complete, the XMDE Client Analyzer binary is available from the `/tmp/XMDEClientAnalyzerBinary/ClientAnalyzer` directory.

1. Create a bash file `InstallXMDEClientAnalyzer.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "Starting Client Analyzer Script. Running As:"
   whoami

   echo "Getting XMDEClientAnalyzerBinary"
   wget --quiet -O /tmp/XMDEClientAnalyzerBinary.zip https://go.microsoft.com/fwlink/?linkid=2297517
   echo '9D0552DBBD1693D2E2ED55F36147019CFECFDC009E76BAC4186CF03CD691B469 /tmp/XMDEClientAnalyzerBinary.zip' | sha256sum -c

   echo "Unzipping XMDEClientAnalyzerBinary.zip"
   unzip -q /tmp/XMDEClientAnalyzerBinary.zip -d /tmp/XMDEClientAnalyzerBinary

   echo "Unzipping SupportToolLinuxBinary.zip"
   unzip -q /tmp/XMDEClientAnalyzerBinary/SupportToolLinuxBinary.zip -d /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer

   echo "MDESupportTool installed at /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer"

   ```

#### Python Client Analyzer Install Script

The following script performs the first six steps of the [Running the Python version of the Client Analyzer](/defender-endpoint/run-analyzer-macos-linux). When complete, the XMDE Client Analyzer Python scripts are available from the `/tmp/XMDEClientAnalyzer` directory.

1. Create a bash file `InstallXMDEClientAnalyzer.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "Starting Client Analyzer Install Script. Running As:"
   whoami
  
   echo "Getting XMDEClientAnalyzer.zip"
   wget --quiet -O XMDEClientAnalyzer.zip https://aka.ms/XMDEClientAnalyzer 
   echo '36C2B13AE657456119F3DC2A898FD9D354499A33F65015670CE2CD8A937F3C66 XMDEClientAnalyzer.zip' | sha256sum -c  

   echo "Unzipping XMDEClientAnalyzer.zip"
   unzip -q XMDEClientAnalyzer.zip -d /tmp/XMDEClientAnalyzer  

   echo "Setting execute permissions on mde_support_tool.sh script"
   cd /tmp/XMDEClientAnalyzer 
   chmod a+x mde_support_tool.sh  

   echo "Performing final support tool setup"
   ./mde_support_tool.sh

   ```

#### Running the Client Analyzer Install Scripts

1. Initiate a [Live Response session](live-response.md#initiate-a-live-response-session-on-a-device) on the machine you need to investigate.

2. Select **Upload file to library**.

3. Select **Choose file**.

4. Select the downloaded file named `InstallXMDEClientAnalyzer.sh`, and then select **Confirm**.

5. While still in the LiveResponse session, use the following commands to install the analyzer:

   ```console
   run InstallXMDEClientAnalyzer.sh
   ```

### Running the XMDE Client Analyzer

Live Response doesn't support running the XMDE Client Analyzer or Python directly, so an execution script is necessary.

> [!IMPORTANT]
> The following scripts assume the XMDE Client Analyzer was installed using the same locations from the scripts mentioned earlier. If your organization has chosen to install the scripts into a different location, then the following scripts need to be updated to align with your organization's chosen installation location.

#### Binary Client Analyzer Run Script

The Binary Client Analyzer accepts command line parameters to perform different analysis tests. To provide similar capabilities during Live Response the execution script takes advantage of the `$@` bash variable to pass all input parameters provided to the script to the XMDE Client Analyzer.

1. Create a bash file `MDESupportTool.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash

   echo "cd /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer"
   cd /tmp/XMDEClientAnalyzerBinary/ClientAnalyzer

   echo "Running MDESupportTool"
   ./MDESupportTool $@

   ```

#### Python Client Analyzer Run Script

The Python Client Analyzer accepts command line parameters to perform different analysis tests. To provide similar capabilities during Live Response the execution script takes advantage of the `$@` bash variable to pass all input parameters provided to the script to the XMDE Client Analyzer.

1. Create a bash file `MDESupportTool.sh` and paste the following content into it.

   ```bash
   #! /usr/bin/bash  

   echo "cd /tmp/XMDEClientAnalyzer"
   cd /tmp/XMDEClientAnalyzer 

   echo "Running mde_support_tool"
   ./mde_support_tool.sh $@

   ```

#### Running the Client Analyzer Script

> [!NOTE]
> If you have an active Live Response session you can skip Step 1.

1. Initiate a [Live Response session](live-response.md#initiate-a-live-response-session-on-a-device) on the machine you need to investigate. 

2. Select **Upload file to library**.

3. Select **Choose file**.

4. Select the downloaded file named `MDESupportTool.sh`, and then select **Confirm**.

5. While still in the Live Response session, use the following commands to run the analyzer and collect the resulting file.

   ```
   run MDESupportTool.sh -parameters "--bypass-disclaimer -d"
   GetFile "/tmp/your_archive_file_name_here.zip"
   ```

## See also

- [Client analyzer overview](overview-client-analyzer.md)
- [Download and run the client analyzer](download-client-analyzer.md)
- [Run the client analyzer on Windows](run-analyzer-windows.md)
- [Run the client analyzer on macOS or Linux](run-analyzer-macos-linux.md)
- [Data collection for advanced troubleshooting on Windows](data-collection-analyzer.md)
- [Understand the analyzer HTML report](analyzer-report.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
