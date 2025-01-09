---
title: Address unwanted behaviors in Microsoft Defender for Endpoint with exclusions, indicators, and other techniques            
description: Learn how to use exclusions, indicators, and other techniques to address unwanted behaviors in Microsoft Defender for Endpoint.
author: denisebmsft
ms.author: deniseb
manager: deniseb 
ms.date: 11/14/2024
ms.topic: how-to
ms.service: defender-endpoint
ms.subservice: onboard
ms.localizationpriority: medium 
ms.reviewer: joshbregman
search.appverid: MET150
f1.keywords: NOCSH 
audience: ITPro
ms.custom: 
- partner-contribution
ms.collection: 
- m365-security
- tier2
---

# Address unwanted behaviors in Microsoft Defender for Endpoint with exclusions, indicators, and other techniques

The primary function of Defender for Endpoint is to prevent and detect access to malicious processes and files. Defender for Endpoint is designed to allow people in your organization to be protected from threats while remaining productive by default security settings and policies. Occasionally, unwanted behaviors might occur, such as:

- **False positives**: A false positive is when an entity, such as a file or a process, was detected and identified as malicious, even though the entity isn't a threat
- **Poor performance**: Applications experience performance issues when certain features of Defender for Endpoint are enabled
- **Application incompatibility**: Applications don't function properly when certain features of Defender for Endpoint are enabled

This article describes how to address these types of unwanted behaviors and includes some example scenarios.

> [!NOTE]
> Creating an indicator or an exclusion should only be considered after thoroughly understanding the root cause of the unexpected behavior.

## How to address unwanted behaviors with Defender for Endpoint

At a high level, the general process for addressing an unwanted behavior in Defender for Endpoint is as follows:

1. Identify which capability is causing the unwanted behavior. You need to know if there's a misconfiguration with Microsoft Defender Antivirus, endpoint detection and response, attack surface reduction, controlled folder access, and so on, in Defender for Endpoint. You can use information in the Microsoft Defender portal or on the device to make your determination.

   | Location | What to do |
   |---|---|
   | The [Microsoft Defender portal](https://security.microsoft.com) | Take one or more of the following actions to help identify what's happening: <br/>- [Investigate alerts](alerts-queue.md) <br/>- [Use advanced hunting](/defender-xdr/advanced-hunting-overview) <br/>- [View reports](threat-protection-reports.md) |
   | On the device | Take one or more of the following steps to identify the issue: <br/>- [Use performance analyzer tools](tune-performance-defender-antivirus.md) <br/>- [Review event logs and error codes](troubleshoot-microsoft-defender-antivirus.yml) <br/>- [Check your protection history](microsoft-defender-security-center-antivirus.md) |

2. Depending on your findings from the previous step, you might take one or more of the following actions:

   - [Suppress alerts in the Microsoft Defender portal](manage-suppression-rules.md)
   - [Define custom remediation actions](configure-remediation-microsoft-defender-antivirus.md)
   - [Submit a file to Microsoft for analysis](admin-submissions-mde.md)
   - [Define exclusions for Microsoft Defender Antivirus](configure-exclusions-microsoft-defender-antivirus.md)
   - [Create indicators for Defender for Endpoint](indicator-manage.md)

   Keep in mind that tamper protection affects whether exclusions can be modified or added. See [What happens when tamper protection is turned on](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on).

3. Verify that your changes have addressed the issue. 

## Examples of unwanted behaviors

This section includes several example scenarios that can be addressed by using exclusions and indicators. For more information about exclusions, see [Exclusions overview](navigate-defender-endpoint-antivirus-exclusions.md).

### An app is detected by Microsoft Defender Antivirus when the application runs

In this scenario, whenever a user runs a certain application, the application is detected by Microsoft Defender Antivirus as a potential threat. 

<!---**How to observe**: CONTENT NEEDED--->

**How to address**: Create an "allow" indicator for Microsoft Defender for Endpoint. For example, you can create an "allow" indicator for a file, such as an executable. See [Create indicators for files](indicator-file.md). 

### A custom, self-signed app is detected by Microsoft Defender Antivirus when the application runs

In this scenario, a custom app is detected by Microsoft Defender Antivirus as a potential threat. The app is updated periodically and is self-signed. 

**How to address**: Create "allow" indicators for certificates or files. See the following articles:

- [Create indicators based on certificates](indicator-certificates.md)
- [Create indicators for files](indicator-file.md)

### A custom app accesses a set of file types that is detected as malicious when the application runs

In this scenario, a custom app accesses a set file types, and the set is detected as malicious by Microsoft Defender Antivirus whenever the application runs. 

**How to observe**: When the application is running, it's detected by Microsoft Defender Antivirus as a behavior monitoring detection.

**How to address**: Define exclusions for Microsoft Defender Antivirus, such as a file or path exclusion that might include wildcards. Or define a custom file path exclusion. See the following articles:

- [Address false positives/negatives in Microsoft Defender for Endpoint](defender-endpoint-false-positives-negatives.md)
- [Configure and validate exclusions based on file extension and folder location](configure-extension-file-exclusions-microsoft-defender-antivirus.md)

### An application is detected by Microsoft Defender Antivirus as a "behavior" detection 

In this scenario, an application is detected by Microsoft Defender Antivirus because of certain behavior, even though the application isn't a threat. 

**How to address**: Define a process exclusion. See the following articles:

- [Configure and validate exclusions based on file extension and folder location](configure-extension-file-exclusions-microsoft-defender-antivirus.md)
- [Configure exclusions for files opened by processes](configure-process-opened-file-exclusions-microsoft-defender-antivirus.md)

### An app is considered a potentially unwanted application (PUA)

In this scenario, an app is detected as PUA, and you want to allow it to run. 

**How to address**: Define an exclusion for the app. See the following articles:

- [Exclude files from PUA protection](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md#exclude-files-from-pua-protection)
- [Configure and validate exclusions based on file extension and folder location](configure-extension-file-exclusions-microsoft-defender-antivirus.md)

### An app is blocked from writing to a protected folder

In this scenario, a legitimate app is blocked from writing to folders that are protected by controlled folder access.

**How to address**: Add the app to the "allowed" list for controlled folder access. See [Allow specific apps to make changes to controlled folders](customize-controlled-folders.md#allow-specific-apps-to-make-changes-to-controlled-folders).

### A third-party app is detected as malicious by Microsoft Defender Antivirus

In this scenario, a third-party app that isn't a threat is detected and identified as malicious by Microsoft Defender Antivirus.

**How to address**: Submit the app to Microsoft for analysis. See [How to submit a file to Microsoft for analysis](/defender-xdr/submission-guide#how-do-i-submit-a-file-to-microsoft-for-analysis).

### An app is incorrectly detected and identified as malicious by Defender for Endpoint

In this scenario, a legitimate app is detected and identified as malicious by an attack surface reduction rule in Defender for Endpoint. Whenever a user uses the app, the app and any downloaded content are blocked by the attack surface reduction rule, [Block JavaScript or VBScript from launching downloaded executable content](/defender-endpoint/attack-surface-reduction-rules-reference#block-javascript-or-vbscript-from-launching-downloaded-executable-content). 

<!---**How to observe**: CONTENT NEEDED--->

**How to address**: 

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Reports**. Under **Reports**, select **Security report**.

2. Scroll down to devices to find your attack surface reduction cards. For more information, see [attack surface reduction rules report](attack-surface-reduction-rules-report.md).

3. Use the information to identify the files and folder locations to be excluded.

4. Add exclusions. See [Configure and validate exclusions based on file extension and folder location](configure-extension-file-exclusions-microsoft-defender-antivirus.md). 

### Word templates that contain macros that launch other apps are blocked

In this scenario, whenever a user opens documents that were created by using Microsoft Word templates that contain macros and those macros launch other applications, the attack surface reduction rule [Block Win32 API calls from Office macros](/defender-endpoint/attack-surface-reduction-rules-reference#block-win32-api-calls-from-office-macros) blocks Microsoft Word. 

<!---**How to observe**: CONTENT NEEDED--->

**How to address**:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Reports**. Under **Reports**, select **Security report**.

2. Scroll down to devices to find your attack surface reduction cards. For more information, see [attack surface reduction rules report](attack-surface-reduction-rules-report.md).

3. Use the information to identify the files and folder locations to be excluded.

4. Add exclusions. See [Configure and validate exclusions based on file extension and folder location](configure-extension-file-exclusions-microsoft-defender-antivirus.md). 

## See also

- [Exclusions overview](navigate-defender-endpoint-antivirus-exclusions.md)
- [Managing exclusions reference](managing-exclusions.md)