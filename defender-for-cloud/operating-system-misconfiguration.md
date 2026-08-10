---
title: Operating system misconfigurations
description: Apply security recommendations to harden operating system baseline configurations with Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to review and remediate operating system baseline misconfigurations so I can reduce risk across my environment.
ai-usage: ai-assisted
---

# Operating system misconfigurations

Microsoft Defender for Cloud provides security recommendations to improve organizational security posture and reduce risk. An important element in risk reduction is to harden machines across your business environment. This article explains how to assess and remediate operating system baseline misconfigurations using the Azure Machine Configuration extension and Defender Vulnerability Management.

## Assessment (Azure Machine Configuration extension)

Defender for Cloud uses [built-in Azure policy initiatives](policy-reference.md) to assess and apply security configurations. The default initiative is the [Microsoft Cloud Security Benchmark (MCSB)](/security/benchmark/azure/introduction).

MCSB includes compute security baselines for [Windows](/azure/governance/policy/samples/guest-configuration-baseline-windows) and [Linux](/azure/governance/policy/samples/guest-configuration-baseline-linux) operating systems.

These OS baseline recommendations aren't part of the [free security posture features](concept-cloud-security-posture-management.md#cspm-plans) in Defender for Cloud.

- The recommendations are available when Defender for Servers Plan 2 is enabled.
- When Defender for Servers Plan 2 is enabled, relevant Azure policies are enabled on the subscription:

  - "Windows machines should meet requirements of the Azure compute security baseline"
  - "Linux machines should meet requirements for the Azure compute security baseline"

- Make sure you don't remove these policies or you won't be able to leverage the machine configuration extension that's used to collect machine data.

### Data collection

Machine information is gathered for assessment using the Azure machine configuration extension (formerly known as the Azure Policy guest configuration) running on the machine.

### Installing the machine configuration extension

The machine configuration extension is installed as follows:

- **Azure**: On Azure machines, install by remediating the recommendation [Guest Configuration extension should be installed on machines](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/6c99f570-2ce7-46bc-8175-cde013df43bc).
- **AWS/GCP**: On AWS and GCP machines, the machine configuration is installed by default when you select Arc provisioning in the [AWS](quickstart-onboard-aws.md) or [GCP](quickstart-onboard-gcp.md) connector.
- **On-premises**: For on-premises machines, the machine configuration is enabled by default when you [onboard on-premises VMs as Azure Arc-enabled VMs](/azure/azure-arc/servers/learn/quick-enable-hybrid-vm).
- **Azure VMs**: On Azure VMs only (not Arc-enabled VMs) you must assign a managed identity to the machine by remediating recommendation [Virtual machines Guest Configuration extension should be deployed with system-assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Security/RecommendationsBlade/assessmentKey/69133b6b-695a-43eb-a763-221e19556755).

### What's not included

Additional features provided by the machine configuration extension outside Defender for Cloud aren't included and are subject to Azure Policy machine configuration pricing.

- For example, [remediation](/azure/governance/machine-configuration/concepts/remediation-options) and [custom policies](/azure/governance/machine-configuration/how-to/create-policy-definition).
- Review [Azure Policy machine configuration pricing details](https://azure.microsoft.com/pricing/details/azure-policy/?msockid=06fc23a2aac2601229353214abbf61f1).

## Assessment (Defender Vulnerability Management)

Defender for Cloud integrates with Microsoft Defender for Endpoint and Microsoft Defender Vulnerability Management. This integration gives machines vulnerability protection and endpoint detection and response (EDR) features.

As part of the integration with Defender Vulnerability Management, [security baselines assessment](/defender-vulnerability-management/tvm-security-baselines) is provided.

- Security baselines assessment uses custom baseline profiles.
- Each profile is a template of device settings and benchmarks to compare them against.

<a name="support"></a>
### Supported systems and requirements

The following requirements and limitations apply to security baselines assessment:

- Assessing devices against the Defender Vulnerability Management security baselines assessment profiles is currently available in public preview.
- Defender for Servers Plan 2 must be enabled, and the Defender for Endpoint agent must be running on machines you want to assess.
- Assessment is supported for machines running security baseline profiles:

  - windows_server_2008_r2
  - windows_server_2016
  - windows_server_2019
  - windows_server_2022

### Reviewing recommendations

To review recommendations made by security baseline assessments, search for the recommendation **Machines should be configured securely (powered by MDVM)", and view the recommendation for all resources.

## Next steps

- [Install the Azure Policy machine configuration](security-baseline-guest-configuration.md).
- Remediate OS baseline misconfigurations by using [Apply security baseline remediations](apply-security-baseline.md).


