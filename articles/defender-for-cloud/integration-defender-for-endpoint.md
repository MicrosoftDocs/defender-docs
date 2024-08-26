---
title: Understand EDR in the Defender for Servers plan in Microsoft Defender for Cloud
description: Learn about EDR integration in the Defender for Servers plan in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: concept-article
ms.date: 08/19/2024
#customer intent: I want to understand endpoint detection and response (EDR) capabilities provided by Defender for Servers plan, and what EDR solutions are available.
---

# Overview: Endpoint detection and response 

The Defender for Servers plan in Microsoft Defender for Cloud integrates endpoint detection and response (EDR) protection for supported machines. Defender for Servers:

- **Integrates Microsoft Defender for Endpoint EDR capabilities**: Defender for Servers integrates natively with [Defender for Endpoint](/defender-endpoint/microsoft-defender-endpoint) to provide EDR capabilities for machines connected to Defender for Cloud.
- **Assesses whether machines are running an EDR solution**: Defender for Servers Plan 2 can agentlessly scan connected machines (Azure VMs and AWS/GCP machines) to check whether they have an EDR solution installed and running.

> [!NOTE]
> - Agentless scanning for EDR solutions replaces the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)), which was previously use to collect machine data.
> - The MMA is set to retire in August 2024. Scanning using the MMA will be deprecated in November 2024.



## EDR protection with Defender for Endpoint

Defender for Servers native integration with Defender for Endpoint provides near real-time, actionable threat detection and response for supported machines.

Integrated features include:

- **Threat and vulnerability management**, provided by [Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management).
- **[Attack surface reduction](/defender-endpoint/attack-surface-reduction)** capabilities.
- **Threat protection**, including endpoint protection from [Internet-based network events](/defender-endpoint/network-protection) and [web threats](/defender-endpoint/web-protection-overview)
- **Next-generation protection** providing [antimalware and antivirus protection](/defender-endpoint/next-generation-protection). 
- **Threat intelligence** using data provided by Microsoft threat hunters and security teams, augmented by intelligence provided by partners. Security alerts are generated when Defender for Endpoint identifies attacker tools, techniques, and procedures.
- **Automated agent provisioning**. Defender for Cloud automatically installs the Defender for Endpoint sensor on all supported machines connected to Defender for Cloud.
- **Licensing**: Defender for Servers covers licensing for Defender for Endpoint. Licensing is charged per hour instead of per seat, lowering costs by protecting VMs only when they're in use.
- **Centralized alert monitoring**. Defender for Endpoint alerts appear in the Defender for Cloud portal. You drill down into alerts in the Defender portal for additional information such as the alert process tree, the incident graph, and a detailed machine timeline of up to six months.

### Integration architecture

A Defender for Endpoint tenant is automatically created when you use Defender for Cloud to monitor your machines.

- **Collected data:** Data collected by Defender for Endpoint is stored in the geo-location of the tenant as identified during provisioning.

    - Customer data, in pseudonymized form, might also be stored in the central storage and processing systems in the United States.
    - After you configure the location, you can't change it.
    - If you have your own license for Defender for Endpoint and need to move your data to another location, [contact Microsoft support](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview) to reset the tenant.
- **Move to a different subscription in the same tenant**: To move your Defender for Endpoint extension to a different subscription in the same tenant, delete either the `MDE.Linux' or 'MDE.Windows` extension from the virtual machine and Defender for Cloud will automatically redeploy it.
- **Move subscriptions between tenants:** If you move your Azure subscription between Azure tenants, some manual preparatory steps are required before Defender for Cloud deploys Defender for Endpoint. For full details, [contact Microsoft support](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview).



## Assessing EDR solutions

[Defender for Servers Plan 2](defender-for-servers-overview.md) provides agentless scanning of protected machines to check that machines have an EDR solution installed. Scanning checks that:

- A supported EDR solution is enabled.
- Defender for Servers plan 2 is enabled on the Azure subscription and its associated VMs.
- Supported EDR solutions are installed successfully.

### Supported EDR solutions

Defender for Servers Plan 2 can assess the state of these EDR solutions.

| EDR solution | Supported platforms |
|--|--|
| Defender for Endpoint for Windows | Windows |
| Defender for Endpoint for Linux  | Linux |
| Defender for Endpoint Unified Solution  | Windows Server 2012 R2 and Windows 2016 |
| CrowdStrike (Falcon) | Windows and Linux |
| Trellix | Windows and Linux |
| Symantec | Windows and Linux |
| Sophos |  Windows and Linux | 

### EDR solution recommendations

If a condition for EDR solution assessment isn't met, Defender for Servers provides recommendations as follows:

- `EDR solution should be installed on Virtual Machines`
- `EDR solution should be installed on EC2s`
- `EDR solution should be installed on Virtual Machines (GCP)`

Recommendations include remediation steps to fix detected issues.

## Assessing Defender for Endpoint misconfigurations

If you're using Defender for Endpoint as an EDR solution, Defender for Cloud can run some checks for misconfiguration settings, including:

- Scans that haven't run for seven days: `Both full and quick scans are out of 7 days`
- Signatures that are out-of-date: `Signature out of date`
- Anti-virus issues: `Anti-virus is off or partially configured`

## Related content

- Check out the [minimum requirements for Defender for Endpoint](/defender-endpoint/minimum-requirements), to see what the licensing, browser, hardware, software requirements are and more.
- Learn about [migrating machines from Defender for Endpoint to Defender for Cloud](/microsoft-365/security/defender-endpoint/migrating-mde-server-to-cloud).
- Watch [Defender for Servers integration with Microsoft Defender for Endpoint](episode-sixteen.md) in the Defender for Cloud in the Field video series.
