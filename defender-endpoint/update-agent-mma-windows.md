---
title: Update your agent on devices for Microsoft Defender for Endpoint
description: Learn about your options for updating or replacing your MMA agent on Windows devices for Defender for Endpoint.
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.date: 07/02/2026
ms.collection: 
- m365-security
- tier2
ms.topic: how-to
ms.reviewer: pahuijbr
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Updating MMA on Windows devices for Microsoft Defender for Endpoint

> [!IMPORTANT]
> If you've arrived on this page as a result of clicking on a notification at the [Microsoft Defender portal](https://security.microsoft.com), you have devices in your environment with outdated agents, and you need to take action (described in this article) to avoid service disruption. For more details, please reference message center post MC598631 (requires access to [Message Center](/microsoft-365/admin/manage/message-center)).


If you're using the Microsoft Monitoring Agent (MMA) on Windows devices, it's important to keep this agent updated. Microsoft recommends upgrading to the latest version of Defender for Endpoint. This article describes how to: 

- **[Update the MMA on your devices](#update-mma-on-your-devices)** (for devices running Windows 8.1 Pro or Enterprise).

- [Upgrade to the new agent for Defender for Endpoint](#upgrade-to-the-new-agent-for-defender-for-endpoint) (for devices running Windows 7 SP1 Enterprise, Windows 7 SP1 Pro, Windows Server 2008 R2 SP1, Windows Server 2012 R2, and Windows Server 2016).

## Update MMA on your devices

*This option applies to devices running Windows 8.1 Pro and Windows 8.1 Enterprise.*

- To help you identify older versions of the MMA inside of your organization, you can use the "EOSDate" column in advanced hunting. Or, follow the instructions in [Plan for end-of-support software and software versions](/defender-vulnerability-management/tvm-end-of-support-software) to use the vulnerability management feature inside of Microsoft Defender for Endpoint to track remediation.

- See [Manage and maintain the Log Analytics agent for Windows and Linux](/azure/azure-monitor/agents/agent-manage?tabs=PowerShellLinux) for instructions on how to upgrade the agent using Azure Automation or a command-line approach to use with various deployment tools and methods. 

- Update MMA by using [Microsoft Update](/windows/deployment/update/how-windows-update-works), through [Windows Server Update Services](/windows/deployment/update/waas-manage-updates-wsus) or [Configuration Manager](/intune/configmgr/osd/deploy-use/manage-windows-as-a-service). Use the method that was configured when MMA was first installed on the device.

- Download the MMA setup file:

   - **Windows 64-bit agent**: [Download the Windows 64-bit agent](https://go.microsoft.com/fwlink/?LinkId=828603)
   - **Windows 32-bit agent**: [Download the Windows 32-bit agent](https://go.microsoft.com/fwlink/?LinkId=828604)

## Upgrade to the new agent for Defender for Endpoint

*This option applies to devices running Windows 7 SP1 Enterprise, Windows 7 SP1 Pro, Windows Server 2008 R2 SP1, Windows Server 2012 R2, and Windows Server 2016.*

A new agent was released in April 2022 for Windows Server 2012 R2 and Windows Server 2016, and in May 2026 for Windows 7 SP1 and Windows Server 2008 R2 SP1. The new agent doesn't depend on MMA. There are significant benefits to moving to this new agent, such as a vastly extended feature set. 

- Microsoft Defender Vulnerability Management provides an assessment (SCID-2030) titled "Update Microsoft Defender for Endpoint core components" that allows you to track which Windows Server 2012 R2 or Windows Server 2016 machines haven't been upgraded yet.

- Use the Defender deployment tool to perform the upgrade. See [Deploy Microsoft Defender endpoint security to Windows devices using the Defender deployment tool](/defender-endpoint/defender-deployment-tool-windows).

- If you're using Microsoft Configuration Manager version 2107 (August 2021) or later to manage your servers running Windows Server 2012 R2 or Windows Server 2016, see [Migrating servers from Microsoft Monitoring Agent to the unified solution](application-deployment-via-mecm.md) to perform an **orchestrated** upgrade.

- If you're using Microsoft Configuration Manager 2207 (August 2022) or later to manage your servers running Windows Server 2012 R2 or Windows Server 2016, see [Onboarding to Microsoft Defender for Endpoint with Configuration Manager 2207 and later versions](/intune/configmgr/protect/deploy-use/defender-advanced-threat-protection) to perform an **automated** upgrade.

- If you're using Microsoft Defender for Cloud with servers running Windows Server 2012 R2 or Windows Server 2016, you can automate the upgrade by selecting **Enable unified solution**. See [Users with Defender for Servers enabled and Microsoft Defender for Endpoint deployed](/azure/defender-for-cloud/integration-defender-for-endpoint?tabs=windows).

## Important information about MMA

- If you've determined that you aren't using the MMA for Defender for Endpoint, or you've already updated your agent, no other steps are needed. 

> [!IMPORTANT]
> Defender for Endpoint devices running Windows 8.1 are still supported and remain dependent on MMA.
> 
> [Azure Monitor Agent](/azure/azure-monitor/agents/agents-overview) cannot be used as a substitute for Defender for Endpoint.

- If you are, however, still using MMA for other purposes (such as Log Analytics), MMA has been retired. See [We're retiring the Log Analytics agent in Azure Monitor on 31 August 2024](https://azure.microsoft.com/updates/were-retiring-the-log-analytics-agent-in-azure-monitor-on-31-august-2024/). Depending on your particular scenario, now might be a good time to upgrade to [Azure Monitoring Agent, the successor of MMA](/azure/azure-monitor/agents/azure-monitor-agent-migration). 

<a name="see-also"></a>
## Related content

The following resources can help you plan and execute your migration to Microsoft Defender for Endpoint:

- [Make the switch from non-Microsoft endpoint protection to Microsoft Defender for Endpoint](switch-to-mde-overview.md)

- [Microsoft Defender for Endpoint deployment overview](mde-planning-guide.md)

- [Onboard to the Microsoft Defender for Endpoint service](onboarding.md)
