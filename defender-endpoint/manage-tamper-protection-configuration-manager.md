---
title: Manage tamper protection using tenant attach with Configuration Manager, version 2006
ms.reviewer: joshbregman, mattcall, pahuijbr, hayhov, oogunrinde
description: Turn tamper protection on or off using tenant attach with Configuration Manager.
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.date: 06/16/2026
ms.topic: how-to
author: limwainstein
ms.author: lwainstein
ms.custom: 
- msecd-doc-authoring-1014
- nextgen
- admindeeplinkDEFENDER
ms.subservice: ngp
ms.collection: 
- m365-security
- mde-ngp
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender Antivirus
ai-usage: ai-assisted
---
# Manage tamper protection using tenant attach with Configuration Manager, version 2006


[Tamper protection](prevent-changes-to-security-settings-with-tamper-protection.md) helps protect certain [security settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-happens-when-tamper-protection-is-turned-on), such as virus and threat protection, from being disabled or changed. If you're part of your organization's security team, and you're using [version 2006 of Configuration Manager](/intune/configmgr/core/plan-design/changes/whats-new-in-version-2006), you can manage the tamper protection feature for devices by using a method called *tenant attach*. Tenant attach enables you to sync your on-premises-only Configuration Manager devices into the Intune admin center, and then deliver endpoint security configuration policies to on-premises collections & devices. 

Using Configuration Manager with tenant attach, you can turn on (or off) the tamper protection feature for some or all devices. 

> [!IMPORTANT]
> When tamper protection is turned on, [tamper-protected settings](prevent-changes-to-security-settings-with-tamper-protection.md#what-is-tamper-protection) can't be changed. To avoid breaking management experiences, including Intune and Configuration Manager, keep in mind that changes to tamper-protected settings might appear to succeed but are actually blocked by tamper protection. Depending on your particular scenario, you have several options available: 
> - If you must make changes to a device but find that those changes are getting blocked by tamper protection, use [troubleshooting mode](enable-troubleshooting-mode.md) to temporarily disable the tamper protection feature on the device.
> - Use [Intune](manage-tamper-protection-intune.md) or Configuration Manager to exclude devices from tamper protection. 

## Prerequisites

Make sure your environment meets the following requirements before you configure tamper protection with tenant attach.

### Supported operating systems

Tamper protection using tenant attach is supported on the following operating systems:

- Windows

<a name="turn-tamper-protection-using-tenant-attach"></a>
## Turn tamper protection on or off by using tenant attach

First, set up tenant attach. To learn more, see [Get started: Create and deploy endpoint security policies from the admin center](/intune/configmgr/tenant-attach/endpoint-security-get-started).

Then, create a new policy. To create a new policy, see <a href="/intune/intune-service/protect/endpoint-security-policy#create-endpoint-security-policies" target="_blank">Create an endpoint security policy</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:

- **Policy type**: Antivirus
- **Platform**: Windows 10, Windows 11, and Windows Server (ConfigMgr)
- **Profile**: Windows Security experience (preview)
- **Configuration settings**: Set **Enable tamper protection to prevent Microsoft Defender from being disabled** to **Enabled** under **Windows Security**

Finish selecting options and settings for your policy and deploy the policy to your devices.

:::image type="content" source="media/tamper-protect-configmgr.png" alt-text="Screenshot showing Windows Security settings with tamper protection enabled.":::

<a name="see-also"></a>
## Related content

The following resources provide more information about tamper protection:

- [Frequently asked questions (FAQs) on tamper protection](faqs-on-tamper-protection.yml)
- [Tech Community Blog: Announcing Tamper Protection for Configuration Manager Tenant Attach clients](https://techcommunity.microsoft.com/t5/microsoft-endpoint-manager-blog/announcing-tamper-protection-for-configuration-manager-tenant/ba-p/1700246#.X3QLR5Ziqq8.linkedin)
- [Troubleshoot problems with tamper protection](troubleshoot-problems-with-tamper-protection.yml)



