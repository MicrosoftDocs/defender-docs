---
title: Understand endpoint detection and response
description: Learn about deploying Microsoft Defender for Endpoint from Microsoft Defender for Cloud to protect Azure, hybrid, and multicloud machines.
author: dcurwin
ms.author: dacurwin
ms.topic: concept-article
ms.date: 06/23/2024
#customer intent: As a reader, I want to understand how to deploy Microsoft Defender for Endpoint from Microsoft Defender for Cloud to protect Azure, hybrid, and multicloud machines.
---

# Overview: Defender for Servers endpoint detection and response 

[Defender for Servers Plan 2](defender-for-servers-overview.md) in Microsoft Defender for Cloud provides agentless scanning of protected machines to check that machines have a endpoint detection and response (EDR) solution installed, and to address any security gaps.

> [!NOTE]
> - Agentless scanning replaces older functionality that used the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) in general availability, or the Azure Monitoring Agent (AMA) in preview.
> - The MMA is set to retire in August 2024. Machine scanning using the MMA will be deprecated in November 2024.
> - The AMA preview is now deprecated.


## Defender for Endpoint integration

Defender for Servers integrates natively with [Microsoft Defender for Endpoint](/defender/defender-endpoint/microsoft-defender-endpoint) to provide Defender for Endpoint Plan 2 protection features to machines protected by Defender for Servers, including EDR capabilities.

Defender for Endpoint integration provides a number of benefits, including: 

- **Integration of Defender for Endpoint protection features**
    - Threat and vulnerability management with [Defender Vulnerability Management](/defender/defender-vulnerability-management/defender-vulnerability-management).
    - [Attack surface reduction](/defender/defender-endpoint/attack-surface-reduction) capabilities.
    - Threat protection, including endpoint protection from [Internet-based network events](/defender/defender-endpoint/network-protection) and [web threats](/defender/defender-endpoint/web-protection-overview)
    - Next-generation protection providing [antimalware and antivirus protection](/defender/defender-endpoint/next-generation-protection). 
    - [EDR capabilities](defender/defender-endpoint/overview-endpoint-detection-response) to provide real-time, actionable threat detection and response.
    - Threat intelligence using data provided by Microsoft threat hunters and security teams, augmented by intelligence provided by partners. Security alerts are generated when Defender for Endpoint identifies attacker tools, techniques, and procedures.
- **Automated agent provisioning**. Defender for Cloud automatically installs the Defender for Endpoint sensor on all supported machines connected to Defender for Cloud.
- **Licensing**: Defender for Servers covers licensing for Defender for Endpoint. Licensing is charged per hour instead of per seat, lowering costs by protecting VMs only when they're in use.
- **Centralized alert monitoring**. Defender for Endpoint alerts appear in the Defender for Cloud portal. You drill down into alerts in the Defender portal for additional information such as the alert process tree, the incident graph, and a detailed machine timeline of up to six months.


### Integration architecture

A Defender for Endpoint tenant is automatically created, when you use Defender for Cloud to monitor your machines.

- **Location:** Data collected by Defender for Endpoint is stored in the geo-location of the tenant as identified during provisioning
    - Customer data - in pseudonymized form - might also be stored in the central storage and processing systems in the United States.
    - After you configure the location, you can't change it.
    - If you have your own license for Defender for Endpoint and need to move your data to another location, [contact Microsoft support](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview) to reset the tenant.
- **Different subscription in same tenant**: To move your Defender for Endpoint extension to a different subscription in the same tenant, delete either the `MDE.Linux' or 'MDE.Windows` extension from the virtual machine and Defender for Cloud will automatically redeploy it.
- **Moving subscriptions between tenants:** If you move your Azure subscription between Azure tenants, some manual preparatory steps are required before Defender for Cloud deploys Defender for Endpoint. For full details, [contact Microsoft support](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade/overview).


## Other EDR solutions

Defender for Servers Plan 2 can assess the state of other supported EDR solutions.

| EDR solution | Supported platforms |
|--|--|
| Microsoft Defender for Endpoint for Windows | Windows |
| Microsoft Defender for Endpoint for Linux  | Linux |
| Microsoft Defender for Endpoint Unified Solution  | Windows Server 2012 R2 and Windows 2016 |
| CrowdStrike (Falcon) | Windows and Linux |
| Trellix | Windows and Linux |
| Symantec | Windows and Linux |
| Sophos |  Windows and Linux | 

## EDR solution recommendations

Defender for Servers Plan 2 provides agentless scanning of VMs to check whether an EDR solution is enabled. Agentless scanning checks whether:

- A supported EDR solution is enabled.
- Defender for Servers plan 2 is enabled on the Azure subscription and its associated VMs.
- Supported EDR solutions are installed successfully.

If a condition isn't met, Defender for Servers provides recommendations as follows:

- `EDR solution should be installed on Virtual Machines`
- `EDR solution should be installed on EC2s`
- `EDR solution should be installed on Virtual Machines (GCP)`

Recommendations include remediation steps to fix detected issues.



## Related content

- Check out the [minimum requirements for Defender for Endpoint](/defender-endpoint/minimum-requirements), to see what the licensing, browser, hardware, software requirements are and more.
- For information about migrating servers from Defender for Endpoint to Defender for Cloud, read the [Defender for Endpoint to Defender for Cloud migration guide](/microsoft-365/security/defender-endpoint/migrating-mde-server-to-cloud).
- Learn more about the integration by watching [Defender for Servers integration with Microsoft Defender for Endpoint](episode-sixteen.md) in the Defender for Cloud in the Field video series.
