---
title: Microsoft Sentinel solutions for SAP overview
description: Learn how Microsoft Sentinel solutions address threats in SAP applications, SAP BTP, and partner integrations.
ms.author: monaberdugo
author: mberdugo
ms.topic: overview
ms.date: 08/13/2026
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security
ai-usage: ai-assisted

#Customer intent: As a security operations team member, I want to understand the Microsoft Sentinel solutions available for SAP so that I can choose the right capabilities for my SAP landscape.

---

# Microsoft Sentinel solutions for SAP

SAP systems pose a unique security challenge, as they handle sensitive information, are a prime target for attackers, and traditionally provide little visibility for security operations teams.

An SAP system breach could result in stolen files, exposed data, or a disrupted supply chain. Once an attacker is in the system, there are few controls to detect exfiltration or other bad acts. SAP activity needs to be correlated with other data throughout the organization for effective threat detection.

## Learn from recent SAP attacks

SAP cyber threats can reach beyond the SAP system itself. In April 2026, a supply chain attack on SAP Cloud Application Programming Model (CAP) showed how compromised development components can put SAP BTP environments and business data at risk. Read the [Microsoft Security blog](https://techcommunity.microsoft.com/blog/microsoftsentinelblog/the-worm-in-the-supply-chain-how-defender-for-endpoint-and-sentinel-for-sap-btp-/4526246) to learn how Defender for Endpoint and Microsoft Sentinel help detect and investigate this type of threat.

Watch the [end-to-end attack replay](https://aka.ms/sentinel-for-sap-hero-demo) to see the detection and response flow and Security Copilot assistance in action.

## Sentinel solutions and extensions for SAP

Microsoft Sentinel provides two Microsoft-owned foundation solutions for SAP. Deploy the one (or both) that matches your SAP footprint:

- [Microsoft Sentinel solution for SAP applications](sap-applications-overview.md): Monitors SAP application layers such as business logic, applications, databases, and operating systems. This is the foundation most SAP customers start with.
- [Microsoft Sentinel solution for SAP BTP](sap-btp-solution-overview.md): Monitors SAP Business Technology Platform (BTP), including BTP-based applications and services. It's independent of the SAP applications solution, so you can deploy it alongside or on its own if BTP is your only SAP footprint.

Extend the SAP applications foundation with:

- [SAP LogServ](sap-logserv-overview.md): Add infrastructure and platform logs collected by SAP SE as part of the RISE with SAP offering.
- [Partner add-ons](solution-partner-overview.md): Add SAP SE–provided and third-party partner integrations with specialized detections, connectors, and playbooks.
- [Community contributions](solution-partner-overview.md#solutions-provided-by-the-community): Adopt extension patterns, integration recipes, and scenario blueprints that customers, partners, and Microsoft engineers share in the [Sentinel for SAP community repository](https://github.com/Azure-Samples/Sentinel-For-SAP-Community) on GitHub.

## Understand the solution boundaries

The Microsoft-owned [Microsoft Sentinel solution for SAP applications](sap-applications-overview.md) and [Microsoft Sentinel solution for SAP BTP](sap-btp-solution-overview.md) are separate solutions for different SAP layers. The BTP solution isn't the agentless data connector. The connector uses SAP Integration Suite, which runs on BTP, as middleware to collect SAP application data.

## SIEM and SOAR features

The Microsoft-owned Sentinel solutions for SAP combine SIEM and SOAR to cover your SAP landscape end-to-end:

- **Security information and event management (SIEM)**: Correlate SAP application and SAP BTP activity with other signals throughout your organization. Use out-of-the-box and custom detections to monitor business risks such as privilege escalation, unapproved changes, unauthorized access, and misuse of sensitive transactions or BTP services.
- **Security orchestration, automation, and response (SOAR)**: Build automated response processes that interact with your SAP systems and BTP tenants to stop active security threats.

## Investigation support

Investigate SAP incidents just as you would any other incidents in Microsoft Sentinel and Microsoft Defender. For more information, see:

- [Navigate and investigate incidents in Microsoft Sentinel](../investigate-incidents.md)
- [Investigate and respond with Microsoft Defender XDR](/defender-xdr/incident-response-overview)

## Certification

The Microsoft-owned Microsoft Sentinel solutions for SAP are officially listed on the [SAP Business Accelerator Hub](https://api.sap.com/package/MicrosoftSentinelSolutionforSAP/overview). The certified [Microsoft Sentinel solution for SAP applications](sap-applications-overview.md) is available for:

- SAP ECC, Business Suite, and other SAP NetWeaver-based products running in any cloud or on-premises.
- SAP S/4HANA Cloud Private Edition (RISE).
- Hybrid deployments that cover the entire customer estate.

The [Microsoft Sentinel solution for SAP BTP](sap-btp-solution-overview.md) covers SAP Business Technology Platform tenants using the official audit log API. For SAP SE–owned and partner-owned solutions, see [SAP LogServ](sap-logserv-overview.md) and [Partner add-ons](solution-partner-overview.md).

## Related content

- [Microsoft Sentinel solution for SAP applications](sap-applications-overview.md)
- [Microsoft Sentinel solution for SAP BTP](sap-btp-solution-overview.md)
- [Microsoft Sentinel solution for SAP partner add-ons](solution-partner-overview.md)
