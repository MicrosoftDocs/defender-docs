---
title: Manage devices in Microsoft Defender for Business
description: Learn how to add, remove, and manage devices in Defender for Business, endpoint protection for small and medium sized businesses.
search.appverid: MET150
author: chrisda
ms.author: chrisda
manager: deniseb
audience: Admin
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.date: 05/30/2025
ms.reviewer: nehabha
f1.keywords: NOCSH
ms.collection:
- SMB
- m365-security
- m365-initiative-defender-business
- tier1
---

# Manage devices in Microsoft Defender for Business

In Defender for Business, you can manage devices as follows:

- [View a list of onboarded devices](#view-the-list-of-onboarded-devices) to see their risk level, exposure level, and health state
- [Take action on a device](#take-action-on-a-device-that-has-threat-detections) that has threat detections
- [View the state of Microsoft Defender Antivirus](#view-the-state-of-microsoft-defender-antivirus)
- [Onboard a device to Defender for Business](#onboard-a-device)
- [Offboard a device from Defender for Business](#offboard-a-device)

## View the list of onboarded devices

:::image type="content" source="/defender/media/defender-business/mdb-device-inventory.png" alt-text="Screenshot of device inventory":::

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Assets** \> **Devices**. Or, to go directly to the **Device inventory** page, use <https://security.microsoft.com/machines>.
2. On the **Device inventory** page, you can see the list of devices and view some information about them.
3. Select a device from the list to open the details flyout for the device, where you can learn more about the status of the device and take actions.

If no devices are listed, see [Onboard devices to Defender for Business](mdb-onboard-devices.md)

## Take action on a device that has threat detections

:::image type="content" source="/defender/media/defender-business/mdb-selected-device.png" alt-text="Screenshot of a selected device with details and actions available.":::

1. In the Microsoft Defender portal at <https://security.microsoft.com>, go to **Assets** \> **Devices**. Or, to go directly to the **Device inventory** page, use <https://security.microsoft.com/machines>.
2. On the **Device inventory** page, select a device from the list.
3. In the details flyout that opens, select :::image type="icon" source="media/m365-cc-sc-more-actions-icon.png" border="false"::: **More**, and then select an available action (for example, **Run antivirus scan** or **Initiate Automated Investigation**).

## View the state of Microsoft Defender Antivirus

Microsoft Defender Antivirus is a key component of next-generation protection in Defender for Business. To view the state of Microsoft Defender Antivirus, you have several options:

- Use the [Device health report](mdb-reports.md#device-health-report).
- Use one of the methods described in [How to confirm the state of Microsoft Defender Antivirus](/defender-endpoint/microsoft-defender-antivirus-compatibility#how-to-confirm-the-state-of-microsoft-defender-antivirus).

Microsoft Defender Antivirus has one of the following states on devices:

- **Active mode** (*recommended*): Microsoft Defender Antivirus is the exclusive antivirus app on a device onboarded to Defender for Business. Files are scanned and threats are remediated. Detection information is reported in the Microsoft Defender portal and in the Windows Security app on Windows devices.

  We recommend active mode so devices onboarded to Defender for Business get all of the following types of protection:

  - **Real-time protection**: Locates and stops malware from running on devices.
  - **Cloud protection**: Works with Microsoft Defender Antivirus and the Microsoft cloud to identify new threats, sometimes even before a single device is affected.
  - **Network protection**: Helps protect against phishing scams, exploit-hosting sites, and malicious content on the internet.
  - **Web content filtering**: Regulates access to websites based on content categories (such as adult content, high bandwidth, and legal liability) across all browsers.
  - **Protection from potentially unwanted applications**: For example:
    - Advertising software.
    - Bundled software that offers to install other, unsigned software.
    - Evasion software that attempts to evade security features.

- **Passive mode**: A non-Microsoft antivirus/antimalware product is installed on a device onboarded to Defender for Business. Microsoft Defender Antivirus can detect threats and can receive security intelligence and platform updates. But Microsoft Defender Antivirus doesn't remediate threats.

   You can automatically switch to active mode by uninstalling the non-Microsoft antivirus/antimalware product.

- **Disabled mode**: Also known as *uninstalled mode*. A non-Microsoft antivirus/antimalware product is installed on a device that isn't onboarded to Defender for Business. Microsoft Defender Antivirus isn't currently running on the device; it might be automatically disabled or manually disabled. Microsoft Defender Antivirus can't detect or remediate threats on the device.

  You can switch to active mode by doing the following steps:

  1. Uninstall the non-Microsoft antivirus/antimalware solution.
  2. Onboard the device to Defender for Business.

### What to expect when threats are detected by Microsoft Defender Antivirus

When Microsoft Defender Antivirus detects threat, the following things happen:

- Users receive [notifications in Windows](https://support.microsoft.com/windows/8942c744-6198-fe56-4639-34320cf9444e).
- Detections are listed in the [Windows Security app](/windows/security/operating-system-security/system-security/windows-defender-security-center/windows-defender-security-center) on the **Protection history** page.
- If you [secured your Windows devices](/microsoft-365/business-premium/m365bp-protect-managed-devices), the threat detections and insights are available on the **Threats and antivirus** page in the Microsoft 365 admin center at <https://admin.microsoft.com/Adminportal/Home#/activethreats>.

  > [!TIP]
  > In Microsoft 365 Business Premium, if you have more than 800 devices [enrolled in Microsoft Intune](/intune/intune-service/fundamentals/deployment-guide-enroll), you're prompted to view threat detections and insights from Microsoft Intune instead of from the **Threats and antivirus** page.

In most cases, users don't need to take any further action. As soon as a malicious file or program is detected on a device, Microsoft Defender Antivirus blocks it and prevents it from running. Plus, newly detected threats are added to the antivirus and antimalware engine so that other devices and users are also protected.

If a user needs to take action (for example, approve the removal of a malicious file), the action is shown in the notification they receive. To learn more about actions that Microsoft Defender Antivirus takes on a user's behalf, or actions users might need to take, see [Protection History](https://support.microsoft.com/office/f1e5fd95-09b4-46d1-b8c7-1059a1e09708).

To learn more about different threats, visit the [Microsoft Security Intelligence Threats](https://www.microsoft.com/wdsi/threats) site where you can take the following actions:

- View current information about top threats.
- View the latest threats for a specific region.
- Search the threat encyclopedia for details about a specific threat.

## Onboard a device

For more information, see [Onboard devices to Defender for Business](mdb-onboard-devices.md).

## Offboard a device

For more information, see [Offboarding a device](mdb-offboard-devices.md).

## Next steps

- [View and manage incidents in Defender for Business](mdb-view-manage-incidents.md)
- [Respond to and mitigate threats in Defender for Business](mdb-respond-mitigate-threats.md)
- [Review remediation actions in the Action center](mdb-review-remediation-actions.md)
- [Create or edit device groups](mdb-create-edit-device-groups.md)
