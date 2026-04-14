---
title: Troubleshoot Microsoft Defender Antivirus Security intelligence not getting updated
description: Learn how to troubleshoot Microsoft Defender Antivirus Security intelligence not getting updated.
author: chrisda
ms.author: chrisda
ms.date: 01/10/2025
ms.topic: troubleshooting
ms.service: defender-endpoint
ms.subservice: ngp
ms.localizationpriority: medium
ms.collection: # Useful for querying on a set of strategic or high-priority content.
ms.custom:
- partner-contribution
ms.reviewer:
appliesto:
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
  - Microsoft Defender Antivirus
---

# Troubleshoot Microsoft Defender Antivirus Security intelligence not getting updated

## Symptom

When you update Microsoft Defender Antivirus security intelligence, you might see the error **Protection definition update failed**.

:::image type="content" source="media/protection-definition-update-failed.png" alt-text="Screenshot of Protection definition update failed.":::

These error codes might also appear:

- 0x8024402c
- 0x80240022
- 0X80004002
- 0x80070422
- 0x80072efd
- 0x80070005
- 0x80072f78
- 0x80072ee2
- 0x8007001B

The following screenshot shows the error **Signature Update failed**.

:::image type="content" source="media/signature-update-failed.png" alt-text="Screenshot showing signature update failed." lightbox="media/signature-update-failed.png":::

## Solution

1. Check the URLs required for the Security intelligence updates. You can get them via the firewall and/or proxy. See [Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).

1. Verify that Microsoft Defender Antivirus is your primary antivirus. If you have a non-Microsoft antivirus solution that uses the Windows Security Center (WSC) API, it disables Microsoft Defender Antivirus. When Microsoft Defender Antivirus is disabled, updates can't occur.

1. If Microsoft Defender Antivirus is the primary antivirus and the services are running, follow these steps:
   1. Verify you can manually update Security Intelligence manually by downloading and installing updates from <https://www.microsoft.com/wdsi/defenderupdates>.
   1. If manual updates work, try updating through the Microsoft Malware Protection Center (MMPC).
      1. Open an elevated Command Prompt (a Command Prompt window you opened by selecting **Run as administrator**). For example:
         1. Open the **Start** menu, and then type **cmd**.
         2. Right-click on the **Command Prompt** result, and then select **Run as administrator**.

      1. In the elevated Command Prompt, run the following commands.

         > [!TIP]
         > The first command changes the directory to the latest version of \<antimalware platform version\> in `%ProgramData%\Microsoft\Windows Defender\Platform\<antimalware platform version>`. If that path doesn't exist, it goes to `%ProgramFiles%\Microsoft Defender`.

         ```dos
         (set "_done=" & if exist "%ProgramData%\Microsoft\Windows Defender\Platform\" (for /f "delims=" %d in ('dir "%ProgramData%\Microsoft\Windows Defender\Platform" /ad /b /o:-n 2^>nul') do if not defined _done (cd /d "%ProgramData%\Microsoft\Windows Defender\Platform\%d" & set _done=1)) else (cd /d "%ProgramFiles%\Windows Defender")) >nul 2>&1

         MpCmdRun.exe -SignatureUpdate -MMPC
         ```

         For more information, see [Manage the sources for Microsoft Defender Antivirus protection updates](manage-protection-updates-microsoft-defender-antivirus.md).

   1. If The MpCmdRun command works, the issue might caused by one of the following issues:
      - The Security intelligence [fallback order](manage-protection-updates-microsoft-defender-antivirus.md#fallback-order) is set to a WSUS server without **Security intelligence** approved updates.

        Review `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\WUServer (REG_SZ)`. Once you find the WUServer, verify that WSUS server has the MDAV security intelligence [(KB2267602 for MDAV and KB2461484 for SCEP)](microsoft-defender-antivirus-updates.md#security-intelligence-updates) approved.

      - The specified UNC share might be stale.

        Review [Manage how and where Microsoft Defender Antivirus receives updates](manage-protection-updates-microsoft-defender-antivirus.md#create-a-unc-share-for-security-intelligence).

      - The Windows Update service is having issues.

        Review [Guidance for troubleshooting Windows Update issues](/troubleshoot/windows-client/installing-updates-features-roles/troubleshoot-windows-update-issues) and [Troubleshoot problems updating Windows](https://support.microsoft.com/windows/troubleshoot-problems-updating-windows-188c2b0f-10a7-d72f-65b8-32d177eb136c).
