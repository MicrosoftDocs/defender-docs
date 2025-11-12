---
title: Onboard Windows devices using the Defender deployment tool
description: Learn how to onboard and offboard Windows devices using the Defender deployment tool.
ms.service: defender-endpoint
ms.localizationpriority: medium
audience: ITPro
ms.topic: install-set-up-deploy
author: paulinbar
ms.author: painbar
ms.custom: nextgen
ms.reviewer: pahuijbr
manager: bagol
ms.collection: 
- m365-security
- tier3
ms.subservice: onboard
search.appverid: met150
ms.date: 11/06/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---

# Onboard Windows devices using the Defender deployment tool

The Defender deployment tool is a lightweight, self-updating application designed to streamline onboarding for all Windows versions supported by Defender for Endpoint. The tool takes care of prerequisites, automates migrations from older solutions, and can remove the need for complex onboarding scripts, separate downloads, and manual installations.

Using the tool's user interface, administrators can double-click the tool and follow an interactive installation and onboarding sequence. The tool also provides automation options with advanced command-line parameters so that you can integrate with orchestration platforms or custom deployment tools that include the use of group policies.

The deployment tool offers the following functionality:

- Prerequisite handling: The tool checks for required updates and remediates blocking issues, ensuring that devices are ready for onboarding to Defender.
- Log: All operations are logged locally in a detailed log.
- Avoidance of redundant installations: If Defender for Endpoint is already present, the tool skips redundant installations.
- UI feedback: Provides UI feedback with error descriptions instead of exit codes.
- Passive mode support: On server operating systems and Windows 7, Defender Antivirus can be set to passive mode. This can be helpful when migrating from non-Microsoft antimalware solutions.
- Automation: The tool supports a wide range of command-line options.
- Device handling: Virtual Desktop Infrastructure (VDI) device support ensures that devices deleted and recreated under the same hostname can appear as a single device in the Defender portal.
- Help: Built-in help function.
- Configuration files: You can generate reusable configuration files which make bulk deployments more efficient and less error-prone.
- The ability to work without connectivity: When connectivity is temporarily unavailable, offline onboarding and offboarding is possible.

## Prerequisites and system requirements

- To download the tool, you need an account that has the manage portal settings permission.
- A Defender for Endpoint tenant with public preview features enabled.
- To run the tool, you need to be an administrator (add here the least privileged admin role).
- [Network connectivity to Microsoft Defender cloud services](./configure-environment.md), including the definitionupdates.microsoft.com URL.

### Operating systems

- Windows 11
- Windows 10, version 1607 and newer
- Windows Server 2019 and newer
- Windows Server 2012*, 2012 R2 and 2016 (with minimum November 2018 monthly update rollup installed)
- Windows 7 SP1* and Windows Server 2008 R2* with the KB4474419 update for SHA2 code signing [2019 SHA-2 Code Signing Support requirement for Windows and WSUS - Microsoft Support](https://support.microsoft.com/en-us/topic/2019-sha-2-code-signing-support-requirement-for-windows-and-wsus-64d1c82d-31ee-c273-3930-69a4cde8e64f) and .NET framework 3.5 or later installed

> [!NOTE]
> *For Windows 7 SP1, Windows Server 2008 R2, and Windows Server 2012, the Defender release that will be installed is currently in public preview. For more information, please reference [New Defender on legacy Windows operating systems]

## Using the deployment tool to onboard and offboard devices

### Scenario 1: Standard deployment for single devices

#### Onboarding

#### Offboarding

### Scenario 2: Customized or large-scale deployment

## Options