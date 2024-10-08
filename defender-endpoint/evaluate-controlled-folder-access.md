---
title: Evaluate controlled folder access
description: See how controlled folder access can help protect files from malicious apps.
ms.service: defender-endpoint
ms.localizationpriority: medium
audience: ITPro
ms.topic: conceptual
author: denisebmsft
ms.author: deniseb
ms.reviewer: sugamar, moeghasemi
manager: deniseb
ms.subservice: asr
ms.collection: 
- m365-security
- tier2
- mde-asr
search.appverid: met150
ms.date: 06/26/2024
---

# Evaluate controlled folder access

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)
- Microsoft Defender Antivirus

**Platforms**
- Windows

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-enablesiem-abovefoldlink)

[Controlled folder access](controlled-folders.md) is a feature that helps protect your documents and files from modification by suspicious or malicious apps. Controlled folder access is supported on Windows Server 2022, Windows Server 2019, and client devices running Windows 10 or Windows 11.

It's especially useful in helping protect against [ransomware](https://www.microsoft.com/wdsi/threats) that attempts to encrypt your files and hold them hostage.

This article helps you evaluate controlled folder access. It explains how to enable audit mode so you can test the feature directly in your organization.

## Use audit mode to measure impact

Enable the controlled folder access in audit mode to see a record of what could occur if it were enabled. Test how the feature works in your organization to ensure it doesn't affect your line-of-business apps. You can also get an idea of how many suspicious attempts to modify files generally occur over a certain period of time.

To enable audit mode, use the following PowerShell cmdlet:

```PowerShell
Set-MpPreference -EnableControlledFolderAccess AuditMode
```

> [!NOTE]
> - To see how controlled folder access would work in your organization, use a management tool to deploy it to devices in your network. You can also use Group Policy, Intune, mobile device management (MDM), or Microsoft Configuration Manager to configure and deploy the setting, as described in [Protect important folders with controlled folder access](controlled-folders.md).
>
> - If your workflow involves usage of shared network folders, enabling controlled folder access can result in significant network performance reduction, if the shared network folders are accessed by an untrusted process, particularly because of many queries to the file share server. Make sure your file servers are optimized for increased network traffic, especially if you're using shared network folders for offline files.
>
> - Some types of endpoint security or asset management software inject code into every process that starts on the system. These may result in controlled folder access no longer trusting known applications like Office programs. You can see the reason for controlled folder access detections by using the [MDEClientAnalyzer](run-analyzer-windows.md) tool's `-cfa` argument. If you're affected, consider adding an [antivirus exclusion](configure-exclusions-microsoft-defender-antivirus.md) for the injecting process, or consult your management software vendor about signing all their binaries.

## Review controlled folder access events in Windows Event Viewer

The following controlled folder access events appear in Windows Event Viewer under Microsoft/Windows/Windows Defender/Operational folder.

| Event ID | Description |
| --|--|
| `5007` | Event when settings are changed |
| `1124` | Audited controlled folder access event |
| `1123` | Blocked controlled folder access event |

> [!TIP]
> You can configure a [Windows Event Forwarding subscription](/windows/win32/wec/setting-up-a-source-initiated-subscription) to collect the logs centrally. 

## Customize protected folders and apps

During your evaluation, you might want to add to the list of protected folders, or allow certain apps to modify files.

See [Protect important folders with controlled folder access](controlled-folders.md) for configuring the feature with management tools, including Group Policy, PowerShell, and MDM configuration service providers (CSPs).

## See also

- [Protect important folders with controlled folder access](controlled-folders.md)
- [Evaluate Microsoft Defender for Endpoint](evaluate-mde.md)
- [Use audit mode](overview-attack-surface-reduction.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
