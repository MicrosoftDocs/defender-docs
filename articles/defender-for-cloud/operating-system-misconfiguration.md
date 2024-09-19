---
title: Set up Azure Policy guest configuration on machines protected by Microsoft Defender for Cloud
description: Learn how to install the guest configuration on machines protected by Microsoft Defender for Cloud to assess OS misconfigurations. 
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 07/31/2023
---

# Overview - OS baseline misconfigurations

Microsoft Defender for Cloud provides security recommendations to improve your organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment.

Defender for Cloud assesses and enforces security configurations using [built-in Azure policy initiatives](policy-reference.md), including its default [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction) initiative.


## Compute security baselines

The MCSB covers Azure, AWS, and GCP environments. Many of the MCSB recommendations in Defender for Cloud are provided for free as part of Defender for Cloud's [foundation posture management capabilities](concept-cloud-security-posture-management.md#cspm-features).

As part of the MCSB offering, compute security baselines assess compliance for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems in these environments.

Operating system recommendations based on MCSB compute security baselines are available when Defender for Servers Plan 2 is enabled.

With Defender for Servers Plan 2 enabled, these Azure policies are enabled on the subscription.

- "Windows machines should meet requirements of the Azure compute security baseline" 
- "Linux machines should meet requirements for the Azure compute security baseline"

Make sure you don't remove these policies or you won't be able to leverage the machine configuration extension.

## Data collection

Machine information is gathered for assessment using the Azure Policy machine configuration (formerly known as the guest configuration) of the machine. 

> [!!NOTE]
> - The older data collection method used the Log Analytics agent (also known as the Microsoft Monitoring agent (MMA). Use of this agent will be deprecated in November 2023.
> - Support for assessing misconfigurations in Docker hub and Azure virtual machine scale sets also ends in November.

## Installing the machine configuration extension

The machine configuration extension is installed as follows:

- **Azure**: On Azure machines, install by remediating the recommendation [Guest Configuration extension should be installed on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/6c99f570-2ce7-46bc-8175-cde013df43bc).
- **AWS/GCP**: On AWS and GCP machines, the machine configuration is installed by default when you select Arc provisioning in the [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md) connector.
- **On-premises**: For on-premises machines, the machine configuration is enabled by default when you [onboard on-premises VMs as Azure Arc-enabled VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).

On Azure VMs only (not Arc-enabled VMs) you must assign a managed identity to the machine by remediating recommendation [Virtual machines Guest Configuration extension should be deployed with system-assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/69133b6b-695a-43eb-a763-221e19556755).


Additional features provided by Azure Policy machine configuration outside of Defender for Cloud aren't included, and are subject to Azure Policy machine configuration pricing. For example [remediation](/azure/governance/machine-configuration/concepts/remediation-options) and [custom policies](/azure/governance/machine-configuration/how-to/create-policy-definition). [Review details](https://azure.microsoft.com/pricing/details/azure-policy/?msockid=06fc23a2aac2601229353214abbf61f1) on the Azure Policy machine configuration pricing page.


## Next step

[Review](apply-security-baseline.md) OS misconfiguration recommendations

