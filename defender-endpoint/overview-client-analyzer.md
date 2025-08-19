---
title:  Troubleshoot sensor health using Microsoft Defender for Endpoint Client Analyzer
description: Troubleshoot sensor health on devices to identify potential configuration, environment, connectivity, or telemetry issue affecting sensor data or capability.
ms.service: defender-endpoint
f1.keywords:
- NOCSH
ms.author: ewalsh
author: emmwalshh
ms.reviewer: yongrhee
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-ngp
ms.topic: troubleshooting-general
ms.subservice: ngp
search.appverid: met150
ms.date: 06/10/2025
---

# Troubleshoot sensor health using Microsoft Defender for Endpoint Client Analyzer

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)

The [Microsoft Defender for Endpoint Client Analyzer](https://aka.ms/MDEClientAnalyzer) (MDECA) can be useful when diagnosing sensor health or reliability issues on [onboarded devices](onboard-configure.md) running either Windows, Linux, or macOS. For example, you might want to run the analyzer on a machine that appears to be unhealthy according to the displayed [sensor health status](fix-unhealthy-sensors.md) (Inactive, No Sensor Data or Impaired Communications) in the security portal.

Besides obvious sensor health issues, MDECA can collect other traces, logs, and diagnostic information for troubleshooting complex scenarios such as:

- Application compatibility (AppCompat), performance, network connectivity, or
- Unexpected behavior related to [Endpoint Data Loss Prevention](/microsoft-365/compliance/endpoint-dlp-learn-about).

## Use the client analyzer on devices running Windows, Linux, or macOS

- [Run the client analyzer on Windows](run-analyzer-windows.md)
- [Run the client analyzer on Linux](run-analyzer-linux.md)
- [Run the client analyzer on macOS](run-analyzer-macos.md)

> [!TIP]
> Watch this video to get an overview of the client analyzer: [Defender for Endpoint client analyzer overview](https://www.youtube.com/watch?v=GnqDsvYYL6w)

## Privacy notice

- The Microsoft Defender for Endpoint Client Analyzer tool is regularly used by Microsoft Customer Support Services (CSS) to collect information that will help troubleshoot issues you might be experiencing with Microsoft Defender for Endpoint.

- The collected data might contain Personally Identifiable Information (PII) and/or sensitive data, such as (but not limited to) IP addresses, PC names, and usernames.

- Once data collection is complete, the tool saves the data locally on the machine within a subfolder and compressed zip file.

- No data is automatically sent to Microsoft. If you're using the tool during collaboration on a support issue, you might be asked to send the compressed data to Microsoft CSS using Secure File Exchange to facilitate the investigation of the issue.

For more information about Secure File Exchange, see [How to use Secure File Exchange to exchange files with Microsoft Support](/troubleshoot/azure/general/secure-file-exchange-transfer-files)

For more information about our privacy statement, see [Microsoft Privacy Statement](https://privacy.microsoft.com/privacystatement).

## Requirements

- Before running the analyzer, we recommend ensuring your proxy or firewall configuration allows access to [Microsoft Defender for Endpoint service URLs](configure-environment.md#enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server).

- The analyzer can run on supported editions of [Windows](minimum-requirements.md#windows-versions-supported-by-defender-for-endpoint), [Linux](/defender-endpoint/mde-linux-prerequisites), or [macOS](microsoft-defender-endpoint-mac-prerequisites.md#system-requirements) either before of after onboarding to Microsoft Defender for Endpoint.

- For Windows devices, if you're running the analyzer directly on specific machines and not remotely via [Live Response](troubleshoot-collect-support-log.md), then SysInternals [PsExec.exe](/sysinternals/downloads/psexec) should be allowed (at least temporarily) to run. The analyzer calls into PsExec.exe tool to run cloud connectivity checks as Local System and emulate the behavior of the SENSE service.

  > [!NOTE]
  > On Windows devices, if you use the attack surface reduction rule [Block process creations originating from PSExec and WMI commands](attack-surface-reduction-rules-reference.md#block-process-creations-originating-from-psexec-and-wmi-commands), you might want to temporarily [configure an exclusion to the ASR rule](enable-attack-surface-reduction.md#exclude-files-and-folders-from-attack-surface-reduction-rules). Optionally, you can set the rule to **audit** or you can disable the rule. Making these configurations allow the analyzer to run connectivity checks to cloud without being blocked.

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
