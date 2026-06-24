---
title: Configure automatic attack disruption in Microsoft Defender XDR
description: Learn how to configure automatic attack disruption prerequisites in Microsoft Defender XDR, including Defender for Endpoint, Identity, Cloud Apps, and Sentinel integration.
ms.author: guywild
author: guywi-ms
ms.topic: how-to
ms.service: defender-xdr
ms.localizationpriority: medium
ms.date: 05/31/2026
ms.collection:
- m365-security
- tier2
ms.custom:
  - autoir
  - admindeeplinkDEFENDER
  - sfi-ga-nochange
ms.reviewer: Ofer Shreiber
ai-usage: ai-assisted

#customer intent: As a security administrator, I want to configure automatic attack disruption prerequisites so that my environment is protected from high-impact attacks with automated containment actions.
---

# Configure automatic attack disruption in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender XDR includes powerful [automated attack disruption](automatic-attack-disruption.md) capabilities that can protect your environment from sophisticated, high-impact attacks.

Configure automatic attack disruption capabilities in <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender</a>. After you're all set up, you can view and manage containment actions in Incidents and the Action center. And, if necessary, you can make changes to settings.

## Prerequisites

The following are prerequisites for configuring automatic attack disruption in Microsoft Defender:

|Requirement|Details|
|---|---|
|Subscription requirements|One of these subscriptions: <ul><li>Microsoft 365 E5 or A5</li><li>Microsoft 365 E3 with the Microsoft Defender Suite add-on</li><li>Microsoft 365 E3 with the Enterprise Mobility + Security E5 add-on</li><li>Microsoft 365 A3 with the Microsoft 365 A5 Security add-on</li><li>Windows 10 Enterprise E5 or A5</li><li>Windows 11 Enterprise E5 or A5</li><li>Enterprise Mobility + Security (EMS) E5 or A5</li><li>Office 365 E5 or A5</li><li>Microsoft Defender for Endpoint (Plan 2)</li><li>Microsoft Defender for Identity</li><li>Microsoft Defender for Cloud Apps</li><li>Defender for Office 365 (Plan 2)</li><li>Microsoft Defender for Business</li></ul> <p> See [Microsoft Defender licensing requirements](./prerequisites.md#licensing-requirements).|
|Deployment requirements|<ul><li>Deployment of Defender products (for example, Defender for Endpoint, Defender for Office 365, Defender for Identity, and Defender for Cloud Apps)</li><ul><li>The wider the deployment, the greater the protection coverage is. For example, if a Microsoft Defender for Cloud Apps signal is used in a certain detection, then this product is required to detect the relevant specific attack scenario.</li><li>Similarly, the relevant product should be deployed to execute an automated response action. For example, Microsoft Defender for Endpoint is required to automatically contain a device. </li></ul><li>Microsoft Defender for Endpoint's device discovery is set to 'standard discovery' (prerequisite for the automatic initiation of the "Contain Device" action)</li><li>For attack disruption actions in [external platforms](#microsoft-sentinel-prerequisites-for-external-platforms-preview) such as Okta or AWS (preview): Microsoft Sentinel analytic workspace connected to the unified security operations portal with the relevant provider connector deployed.</li></ul>|
|Permissions|To configure automatic attack disruption capabilities, you must have one of the following roles assigned in either Microsoft Entra ID (<https://portal.azure.com>) or in the Microsoft 365 admin center (<https://admin.microsoft.com>): <ul><li>Global Administrator</li><li>Security Administrator</li><li>User Administrator</li><li>Authentication Administrator</li><li>Privileged Authentication Administrator</li><li>Directory Writers</li> <li>Helpdesk Administrator</li><li>Security Operator</li></ul>To work with automated investigation and response capabilities, such as by reviewing, approving, or rejecting pending actions, see [Required permissions for Action center tasks](m365d-action-center.md#required-permissions-for-action-center-tasks).|

### Microsoft Defender for Endpoint prerequisites

#### Minimum Sense Client version (MDE client)

The Minimum Sense Agent version required for the **Contain User** action to work is v10.8470. You can identify the Sense Agent version on a device by running the following PowerShell command: 

```powershell
Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Advanced Threat Protection\' -Name "InstallLocation"
```

Or

```powershell
Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status' -Name "MsSenseDllVersion"
```

#### Automation setting for your organization's devices

Review the automation settings for your device group policies to determine whether automated investigations run and whether remediation actions are taken automatically or only after approval. You must be a global administrator or security administrator to perform the following procedure:

1. Go to the Microsoft Defender portal ([https://security.microsoft.com](https://security.microsoft.com)) and sign in.

2. Go to **System** \> **Settings** \> **Endpoints** \> **Device groups** under **Permissions**.

3. Review your device group policies and look at the **Remediation level** column. **Full - remediate threats automatically** is the recommended setting.

You can also create or edit your device groups to set the appropriate remediation level for each group. Selecting the **Semi automation** level allows triggering of automatic attack disruption without the need for manual approval. To exclude a device group from automated containment, you can set its automation level to **no automated response**. This setting isn't highly recommended and should only be done for a limited number of devices.

> [!NOTE]
> Attack disruption can act on devices independent of a device's Microsoft Defender Antivirus operating state. The operating state can be in Active, Passive, or EDR Block Mode.

### Microsoft Defender for Identity prerequisites

#### Set up auditing in domain controllers

To set up auditing on domain controllers, see [Configure audit policies for Windows event logs](/defender-for-identity/deploy/configure-windows-event-collection). Ensure required audit events are configured on domain controllers where the Defender for Identity sensor is deployed.

#### Validate action accounts

Defender for Identity allows you to take remediation actions targeting on-premises Active Directory accounts when an identity is compromised. To take these actions, Defender for Identity needs to have the required permissions to do so. By default, the Defender for Identity sensor impersonates the LocalSystem account of the domain controller and performs the actions. Since the default can be changed, validate that Defender for Identity has the required permissions or uses the default LocalSystem account.

You can find more information on the action accounts in [Configure Microsoft Defender for Identity action accounts](/defender-for-identity/deploy/manage-action-accounts).

The Defender for Identity sensor needs to be deployed on the domain controller where the Active Directory account is to be turned off.

> [!NOTE]
> If you have automation in place to activate or block a user, check if the automation can interfere with disruption. For example, if there's an automation in place to regularly check and enforce that all active employees have enabled accounts, this could unintentionally activate accounts that were deactivated by attack disruption while an attack is detected. 

### Microsoft Defender for Cloud Apps prerequisites

#### Microsoft Office 365 connector

Microsoft Defender for Cloud Apps must be connected to Microsoft Office 365 through the connector. To connect Defender for Cloud Apps, see [Connect Microsoft 365 to Microsoft Defender for Cloud Apps](/defender-cloud-apps/protect-office-365#connect-microsoft-365-to-microsoft-defender-for-cloud-apps). 


> [!IMPORTANT]
> To ensure full functionality of the capability, it is mandatory to properly configure the Microsoft 365 connector. As part of the setup process, all checkboxes within the Microsoft 365 connector must be selected, including the option to enable Microsoft Entra ID apps. Failure to select all required options may result in:
> - Partial or degraded functionality
> - Inability to perform critical actions (such as app governance or disruption flows)
> - Increased likelihood of operation failures 

### Microsoft Defender for Office 365 prerequisites

#### Mailboxes location

Mailboxes are required to be hosted in Exchange Online.

#### Mailbox audit logging

The following mailbox events need to be audited by minimum:

- MailItemsAccessed
- UpdateInboxRules
- MoveToDeletedItems
- SoftDelete
- HardDelete

Review [manage mailbox auditing](/purview/audit-mailboxes) to learn about managing mailbox auditing.

### Microsoft Sentinel prerequisites for external platforms (preview)

Your Microsoft Sentinel analytic workspace must be connected to the unified security operations portal to enable attack disruption actions for Okta and AWS.

- For Okta integration and setup steps, see [Enable attack disruption actions in Okta with Microsoft Sentinel](okta-attack-disruption.md).
- For AWS integration and setup steps, see [Enable attack disruption actions on AWS with Microsoft Sentinel](/azure/sentinel/aws-disruption?toc=/defender-xdr/toc.json&bc=/defender-xdr/breadcrumb/toc.json).

## Next steps

- [View details and results](autoad-results.md)
- [Set and manage attack disruption exclusions](automatic-attack-disruption-exclusions.md)
- [Get email notifications for response actions](m365d-response-actions-notifications.md)
