---
title: Reference table for all compute security recommendations in Microsoft Defender for Cloud
description: This article lists all Microsoft Defender for Cloud compute security recommendations that help you harden and protect your resources.
author: dcurwin
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 09/02/2024
ms.author: dacurwin
ms.custom: generated
ai-usage: ai-assisted
---

# Compute security recommendations

This article lists all the multicloud compute security recommendations you might see in Microsoft Defender for Cloud.

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

To learn about actions that you can take in response to these recommendations, see [Remediate recommendations in Defender for Cloud](implement-security-recommendations.md).

> [!TIP]
> If a recommendation description says *No related policy*, usually it's because that recommendation is dependent on a different recommendation.
>
> For example, the recommendation *Endpoint protection health failures should be remediated* relies on the recommendation that checks whether an endpoint protection solution is installed (*Endpoint protection solution should be installed*). The underlying recommendation *does* have a policy.
> Limiting policies to only foundational recommendations simplifies policy management.

## Azure compute recommendations

### System updates should be installed on your machines (powered by Update Center)

**Description**: Your machines are missing system, security, and critical updates. Software updates often include critical patches to security holes. Such holes are frequently exploited in malware attacks so it's vital to keep your software updated. To install all outstanding patches and secure your machines, follow the remediation steps.

**Severity**: Low

### Machines should be configured to periodically check for missing system updates

**Description**: To ensure periodic assessments for missing system updates are triggered automatically every 24 hours, the AssessmentMode property should be set to 'AutomaticByPlatform'. Learn more about AssessmentMode property for Windows: <https://aka.ms/computevm-windowspatchassessmentmode>, for Linux: <https://aka.ms/computevm-linuxpatchassessmentmode>.

**Severity**: Low

### Adaptive application controls for defining safe applications should be enabled on your machines

**Description**: Enable application controls to define the list of known-safe applications running on your machines, and alert you when other applications run. This helps harden your machines against malware. To simplify the process of configuring and maintaining your rules, Defender for Cloud uses machine learning to analyze the applications running on each machine and suggest the list of known-safe applications.
(Related policy: [Adaptive application controls for defining safe applications should be enabled on your machines](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f47a6b606-51aa-4496-8bb7-64b11cf66adc)).

**Severity**: High

### Allowlist rules in your adaptive application control policy should be updated

**Description**: Monitor for changes in behavior on groups of machines configured for auditing by Defender for Cloud's adaptive application controls. Defender for Cloud uses machine learning to analyze the running processes on your machines and suggest a list of known-safe applications. These are presented as recommended apps to allow in adaptive application control policies.
(Related policy: [Allowlist rules in your adaptive application control policy should be updated](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f123a3936-f020-408a-ba0c-47873faf1534)).

**Severity**: High

### Authentication to Linux machines should require SSH keys

**Description**: Although SSH itself provides an encrypted connection, using passwords with SSH still leaves the VM vulnerable to brute-force attacks. The most secure option for authenticating to an Azure Linux virtual machine over SSH is with a public-private key pair, also known as SSH keys. Learn more in [Detailed steps: Create and manage SSH keys for authentication to a Linux VM in Azure](/azure/virtual-machines/linux/create-ssh-keys-detailed).
(Related policy: [Audit Linux machines that are not using SSH key for authentication](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f630c64f9-8b6b-4c64-b511-6544ceff6fd6)).

**Severity**: Medium

### Automation account variables should be encrypted

**Description**: It is important to enable encryption of Automation account variable assets when storing sensitive data.
(Related policy: [Automation account variables should be encrypted](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fmicrosoft.authorization%2fpolicydefinitions%2f3657f5a0-770e-44a3-b44e-9431ba1e9735)).

**Severity**: High

### Azure Backup should be enabled for virtual machines

**Description**: Protect the data on your Azure virtual machines with Azure Backup.
Azure Backup is an Azure-native, cost-effective, data protection solution.
It creates recovery points that are stored in geo-redundant recovery vaults.
When you restore from a recovery point, you can restore the whole VM or specific files.
(Related policy: [Azure Backup should be enabled for Virtual Machines](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f013e242c-8828-4970-87b3-ab247555486d)).

**Severity**: Low

### [(Preview) Azure Local machine(s) should meet Secured-core requirements](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f56c47221-b8b7-446e-9ab7-c7c9dc07f0ad)

**Description**: Ensure that all Azure Local machine(s) meet the Secured-core requirements. (Related policy: Guest Configuration extension should be installed on machines - Microsoft Azure.

**Severity**: Low

### [(Preview) Azure Local machine(s) should have consistently enforced application control policies](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f7384fde3-11b0-4047-acbd-b3cf3cc8ce07)

**Description**: At a minimum, apply the Microsoft WDAC base policy in enforced mode on all Azure Local machine(s). Applied Windows Defender Application Control (WDAC) policies must be consistent across servers in the same cluster. (Related policy: Guest Configuration extension should be installed on machines - Microsoft Azure.

**Severity**: High

### [(Preview) Azure Local systems should have encrypted volumes](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fae95f12a-b6fd-42e0-805c-6b94b86c9830)

**Description**: Use BitLocker to encrypt the OS and data volumes on Azure Local systems. (Related policy: Guest Configuration extension should be installed on machines - Microsoft Azure.

**Severity**: High

### Container hosts should be configured securely

**Description**: Remediate vulnerabilities in security configuration settings on machines with Docker installed to protect them from attacks.
(Related policy: [Vulnerabilities in container security configurations should be remediated](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fe8cbc669-f12d-49eb-93e7-9273119e9933)).

**Severity**: High

### Diagnostic logs in Azure Stream Analytics should be enabled

**Description**: Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation purposes when a security incident occurs or your network is compromised.
(Related policy: [Diagnostic logs in Azure Stream Analytics should be enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2ff9be5368-9bf5-4b84-9e0a-7850da98bb46)).

**Severity**: Low

### Diagnostic logs in Batch accounts should be enabled

**Description**: Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation purposes when a security incident occurs or your network is compromised.
(Related policy: [Diagnostic logs in Batch accounts should be enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f428256e6-1fac-4f48-a757-df34c2b3336d)).

**Severity**: Low

### Diagnostic logs in Event Hubs should be enabled

**Description**: Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation purposes when a security incident occurs or your network is compromised.
(Related policy: [Diagnostic logs in Event Hubs should be enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f83a214f7-d01a-484b-91a9-ed54470c9a6a)).

**Severity**: Low

### Diagnostic logs in Logic Apps should be enabled

**Description**: To ensure you can recreate activity trails for investigation purposes when a security incident occurs or your network is compromised, enable logging. If your diagnostic logs aren't being sent to a Log Analytics workspace, Azure Storage account, or Azure Event Hubs, ensure you've configured diagnostic settings to send platform metrics and platform logs to the relevant destinations. Learn more in Create diagnostic settings to send platform logs and metrics to different destinations.
(Related policy: [Diagnostic logs in Logic Apps should be enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f34f95f76-5386-4de7-b824-0d8478470c9d)).

**Severity**: Low

### Diagnostic logs in Service Bus should be enabled

**Description**: Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation purposes when a security incident occurs or your network is compromised.
(Related policy: [Diagnostic logs in Service Bus should be enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2ff8d36e2f-389b-4ee4-898d-21aeb69a0f45)).

**Severity**: Low

### Diagnostic logs in Virtual Machine Scale Sets should be enabled

**Description**: Enable logs and retain them for up to a year. This enables you to recreate activity trails for investigation purposes when a security incident occurs or your network is compromised.
(Related policy: [Diagnostic logs in Virtual Machine Scale Sets should be enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f7c1b1214-f927-48bf-8882-84f0af6588b1)).

**Severity**: High

### EDR configuration issues should be resolved on virtual machines

**Description**: To protect virtual machines from the latest threats and vulnerabilities, resolve all identified configuration issues with the installed Endpoint Detection and Response (EDR) solution. Currently, this recommendation only applies to resources with Microsoft Defender for Endpoint enabled.

This agentless endpoint recommendation is available if you have Defender for Servers Plan 2 or the Defender CSPM plan. [Learn more](endpoint-detection-response.md) about agentless endpoint protection recommendations.

- These new agentless endpoint recommendations support Azure and multicloud machines. On-premises servers aren't supported.
- These new agentless endpoint recommendations replace existing recommendations Endpoint protection should be installed on your machines (preview)](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/4fb67663-9ab9-475d-b026-8c544cced439) and [Endpoint protection health issues should be resolved on your machines (preview).
- These older recommendations use the MMA/AMA agent and will be replaced as the agents are [phased out in Defender for Servers](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/microsoft-defender-for-cloud---strategy-and-plan-towards-log-analytics-agent-mma/3883341).

**Severity**: Low

### EDR solution should be installed on Virtual Machines

**Description**: Installing an Endpoint Detection and Response (EDR) solution on virtual machines is important for protection against advanced threats. EDRs aid in preventing, detecting, investigating, and responding to these threats. Microsoft Defender for Servers can be used to deploy Microsoft Defender for Endpoint.

- If a resource is classified as "Unhealthy", it indicates the absence of a supported EDR solution.
- If an EDR solution is installed but not discoverable by this recommendation, it can be exempted
- Without an EDR solution, the virtual machines are at risk of advanced threats.

This agentless endpoint recommendation is available if you have Defender for Servers Plan 2 or the Defender CSPM plan. [Learn more](endpoint-detection-response.md) about agentless endpoint protection recommendations.

- These new agentless endpoint recommendations support Azure and multicloud machines. On-premises servers aren't supported.
- These new agentless endpoint recommendations replace existing recommendations Endpoint protection should be installed on your machines (preview)](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/4fb67663-9ab9-475d-b026-8c544cced439) and [Endpoint protection health issues should be resolved on your machines (preview).
- These older recommendations use the MMA/AMA agent and will be replaced as the agents are [phased out in Defender for Servers](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/microsoft-defender-for-cloud---strategy-and-plan-towards-log-analytics-agent-mma/3883341).

**Severity**: High

### Endpoint protection health issues on virtual machine scale sets should be resolved

**Description**: On virtual machine scale sets, remediate endpoint protection health failures to protect them from threats and vulnerabilities.
(Related policy: [Endpoint protection solution should be installed on virtual machine scale sets](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f26a828e1-e88f-464e-bbb3-c134a282b9de)).

**Severity**: Low

### Endpoint protection should be installed on virtual machine scale sets

**Description**: Install an endpoint protection solution on your virtual machines scale sets, to protect them from threats and vulnerabilities.
(Related policy: [Endpoint protection solution should be installed on virtual machine scale sets](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f26a828e1-e88f-464e-bbb3-c134a282b9de)).

**Severity**: High

### File integrity monitoring should be enabled on machines

**Description**: Defender for Cloud has identified machines that are missing a file integrity monitoring solution. To monitor changes to critical files, registry keys, and more on your servers, enable file integrity monitoring.
When the file integrity monitoring solution is enabled, create data collection rules to define the files to be monitored. To define rules, or see the files changed on machines with existing rules, go to the [file integrity monitoring management page](https://aka.ms/FimMMA).
(No related policy)

**Severity**: High

### Guest Attestation extension should be installed on supported Linux virtual machine scale sets

**Description**: Install Guest Attestation extension on supported Linux virtual machine scale sets to allow Microsoft Defender for Cloud to proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This assessment only applies to trusted launch enabled Linux virtual machine scale sets.

- Trusted launch requires the creation of new virtual machines.
- You can't enable trusted launch on existing virtual machines that were initially created without it.

Learn more about [Trusted launch for Azure virtual machines](/azure/virtual-machines/trusted-launch).
(No related policy)

**Severity**: Low

### Guest Attestation extension should be installed on supported Linux virtual machines

**Description**: Install Guest Attestation extension on supported Linux virtual machines to allow Microsoft Defender for Cloud to proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This assessment only applies to trusted launch enabled Linux virtual machines.

- Trusted launch requires the creation of new virtual machines.
- You can't enable trusted launch on existing virtual machines that were initially created without it.

Learn more about [Trusted launch for Azure virtual machines](/azure/virtual-machines/trusted-launch).
(No related policy)

**Severity**: Low

### Guest Attestation extension should be installed on supported Windows virtual machine scale sets

**Description**: Install Guest Attestation extension on supported virtual machine scale sets to allow Microsoft Defender for Cloud to proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This assessment only applies to trusted launch enabled virtual machine scale sets.

- Trusted launch requires the creation of new virtual machines.
- You can't enable trusted launch on existing virtual machines that were initially created without it.

Learn more about [Trusted launch for Azure virtual machines](/azure/virtual-machines/trusted-launch).
(No related policy)

**Severity**: Low

### Guest Attestation extension should be installed on supported Windows virtual machines

**Description**: Install Guest Attestation extension on supported virtual machines to allow Microsoft Defender for Cloud to proactively attest and monitor the boot integrity. Once installed, boot integrity will be attested via Remote Attestation. This assessment only applies to trusted launch enabled virtual machines.

- Trusted launch requires the creation of new virtual machines.
- You can't enable trusted launch on existing virtual machines that were initially created without it.

Learn more about [Trusted launch for Azure virtual machines](/azure/virtual-machines/trusted-launch).
(No related policy)

**Severity**: Low

### Guest Configuration extension should be installed on machines

**Description**: To ensure secure configurations of in-guest settings of your machine, install the Guest Configuration extension. In-guest settings that the extension monitors include the configuration of the operating system, application configuration or presence, and environment settings. Once installed, in-guest policies will be available such as [Windows Exploit guard should be enabled](/azure/governance/machine-configuration/overview).
(Related policy: [Virtual machines should have the Guest Configuration extension](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fmicrosoft.authorization%2fpolicyDefinitions%2fae89ebca-1c92-4898-ac2c-9f63decb045c)).

**Severity**: Medium

### [(Preview) Host and VM networking should be protected on Azure Local systems](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2faee306e7-80b0-46f3-814c-d3d3083ed034)

**Description**: Protect data on the Azure Local host's network and on virtual machine network connections. (Related policy: Guest Configuration extension should be installed on machines - Microsoft Azure.

**Severity**: Low

### Install endpoint protection solution on virtual machines

**Description**: Install an endpoint protection solution on your virtual machines, to protect them from threats and vulnerabilities.
(Related policy: [Monitor missing Endpoint Protection in Azure Security Center](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2faf6cd1bd-1635-48cb-bde7-5b15693900b9)).

**Severity**: High

### Linux virtual machines should enable Azure Disk Encryption or EncryptionAtHost

**Description**: By default, a virtual machine's OS and data disks are encrypted-at-rest using platform-managed keys; temp disks and data caches aren't encrypted, and data isn't encrypted when flowing between compute and storage resources. Use Azure Disk Encryption or EncryptionAtHost to encrypt all this data. Visit [Overview of managed disk encryption options](/azure/virtual-machines/disk-encryption-overview#comparison) to compare encryption offerings. This policy requires two prerequisites to be deployed to the policy assignment scope. For details, visit [Understanding Azure Machine Configuration](/azure/governance/machine-configuration/overview).
(Related policy: [[Preview]: Linux virtual machines should enable Azure Disk Encryption or EncryptionAtHost](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fmicrosoft.authorization%2fpolicyDefinitions%2fca88aadc-6e2b-416c-9de2-5a0f01d1693f)).

Replaces the older recommendation *Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources*. The recommendation enables you to audit VM encryption compliance.

**Severity**: High

### Linux virtual machines should enforce kernel module signature validation

**Description**: To help mitigate against the execution of malicious or unauthorized code in kernel mode, enforce kernel module signature validation on supported Linux virtual machines. Kernel module signature validation ensures that only trusted kernel modules will be allowed to run. This assessment only applies to Linux virtual machines that have the Azure Monitor Agent installed.
(No related policy)

**Severity**: Low

### Linux virtual machines should use only signed and trusted boot components

**Description**: With Secure Boot enabled, all OS boot components (boot loader, kernel, kernel drivers) must be signed by trusted publishers. Defender for Cloud has identified untrusted OS boot components on one or more of your Linux machines. To protect your machines from potentially malicious components, add them to your allowlist or remove the identified components.
(No related policy)

**Severity**: Low

### Linux virtual machines should use Secure Boot

**Description**: To protect against the installation of malware-based rootkits and boot kits, enable Secure Boot on supported Linux virtual machines. Secure Boot ensures that only signed operating systems and drivers will be allowed to run. This assessment only applies to Linux virtual machines that have the Azure Monitor Agent installed.
(No related policy)

**Severity**: Low

### Log Analytics agent should be installed on Linux-based Azure Arc-enabled machines

**Description**: Defender for Cloud uses the Log Analytics agent (also known as OMS) to collect security events from your Azure Arc machines. To deploy the agent on all your Azure Arc machines, follow the remediation steps.
(No related policy)

**Severity**: High

As use of the AMA and MMA is phased out in Defender for Servers, recommendations that rely on those agents, like this one, will be removed. Instead, Defender for Servers features will use the Microsoft Defender for Endpoint agent, or agentless scanning, with no reliance on the MMA or AMA.

Estimated deprecation: July 2024

### Log Analytics agent should be installed on virtual machine scale sets

**Description**: Defender for Cloud collects data from your Azure virtual machines (VMs) to monitor for security vulnerabilities and threats. Data is collected using the [Log Analytics agent](/azure/azure-monitor/platform/log-analytics-agent), formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your workspace for analysis. You'll also need to follow that procedure if your VMs are used by an Azure managed service such as Azure Kubernetes Service or Azure Service Fabric. You cannot configure auto-provisioning of the agent for Azure virtual machine scale sets. To deploy the agent on virtual machine scale sets (including those used by Azure managed services such as Azure Kubernetes Service and Azure Service Fabric), follow the procedure in the remediation steps.
(Related policy: [Log Analytics agent should be installed on your virtual machine scale sets for Azure Security Center monitoring](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fa3a6ea0c-e018-4933-9ef0-5aaa1501449b)).

As use of the AMA and MMA is phased out in Defender for Servers, recommendations that rely on those agents, like this one, will be removed. Instead, Defender for Servers features will use the Microsoft Defender for Endpoint agent, or agentless scanning, with no reliance on the MMA or AMA.

Estimated deprecation: July 2024

**Severity**: High

### Log Analytics agent should be installed on virtual machines

**Description**: Defender for Cloud collects data from your Azure virtual machines (VMs) to monitor for security vulnerabilities and threats. Data is collected using the [Log Analytics agent](/azure/azure-monitor/platform/log-analytics-agent), formerly known as the Microsoft Monitoring Agent (MMA), which reads various security-related configurations and event logs from the machine and copies the data to your Log Analytics workspace for analysis. This agent is also required if your VMs are used by an Azure managed service such as Azure Kubernetes Service or Azure Service Fabric. We recommend configuring [auto-provisioning](enable-data-collection.md) to automatically deploy the agent. If you choose not to use auto-provisioning, manually deploy the agent to your VMs using the instructions in the remediation steps.
(Related policy: [Log Analytics agent should be installed on your virtual machine for Azure Security Center monitoring](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fa4fe33eb-e377-4efb-ab31-0784311bc499)).

As use of the AMA and MMA is phased out in Defender for Servers, recommendations that rely on those agents, like this one, will be removed. Instead, Defender for Servers features will use the Microsoft Defender for Endpoint agent, or agentless scanning, with no reliance on the MMA or AMA.

Estimated deprecation: July 2024

**Severity**: High

### Log Analytics agent should be installed on Windows-based Azure Arc-enabled machines

**Description**: Defender for Cloud uses the Log Analytics agent (also known as MMA) to collect security events from your Azure Arc machines. To deploy the agent on all your Azure Arc machines, follow the remediation steps.
(No related policy)

**Severity**: High

As use of the AMA and MMA is phased out in Defender for Servers, recommendations that rely on those agents, like this one, will be removed. Instead, Defender for Servers features will use the Microsoft Defender for Endpoint agent, or agentless scanning, with no reliance on the MMA or AMA.

Estimated deprecation: July 2024

### Machines should be configured securely

**Description**: Remediate vulnerabilities in security configuration on your machines to protect them from attacks.
(Related policy: [Vulnerabilities in security configuration on your machines should be remediated](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fe1e5fd5d-3e4c-4ce1-8661-7d1873ae6b15)).

This recommendation helps you to improve server security posture. Defender for Cloud enhances the Center for Internet Security (CIS) benchmarks by providing security baselines that are powered by Microsoft Defender Vulnerability Management.

**Severity**: Low

### Machines should be restarted to apply security configuration updates

**Description**: To apply security configuration updates and protect against vulnerabilities, restart your machines. This assessment only applies to Linux virtual machines that have the Azure Monitor Agent installed.
(No related policy)

**Severity**: Low

### Machines should have a vulnerability assessment solution

**Description**: Defender for Cloud regularly checks your connected machines to ensure they're running vulnerability assessment tools. Use this recommendation to deploy a vulnerability assessment solution.
(Related policy: [A vulnerability assessment solution should be enabled on your virtual machines](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f501541f7-f7e7-4cd6-868c-4190fdad3ac9)).

**Severity**: Medium

### Machines should have vulnerability findings resolved

**Description**: Resolve the findings from the vulnerability assessment solutions on your virtual machines.
(Related policy: [A vulnerability assessment solution should be enabled on your virtual machines](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f501541f7-f7e7-4cd6-868c-4190fdad3ac9)).

**Severity**: Low

### Management ports of virtual machines should be protected with just-in-time network access control

**Description**: Defender for Cloud has identified some overly permissive inbound rules for management ports in your Network Security Group. Enable just-in-time access control to protect your VM from internet-based brute-force attacks. Learn more in [Understanding just-in-time (JIT) VM access](just-in-time-access-overview.md).
(Related policy: [Management ports of virtual machines should be protected with just-in-time network access control](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fb0f33259-77d7-4c9e-aac6-3aabcfae693c)).

**Severity**: High

### Microsoft Defender for Servers should be enabled

**Description**: Microsoft Defender for servers provides real-time threat protection for your server workloads and generates hardening recommendations as well as alerts about suspicious activities.
You can use this information to quickly remediate security issues and improve the security of your servers.

Remediating this recommendation will result in charges for protecting your servers. If you don't have any servers in this subscription, no charges will be incurred.
If you create any servers on this subscription in the future, they will automatically be protected and charges will begin at that time.
Learn more in [Introduction to Microsoft Defender for servers](defender-for-servers-introduction.md).
(Related policy: [Azure Defender for servers should be enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fmicrosoft.authorization%2fpolicyDefinitions%2f4da35fc9-c9e7-4960-aec9-797fe7d9051d)).

**Severity**: High

### Microsoft Defender for Servers should be enabled on workspaces

**Description**: Microsoft Defender for servers brings threat detection and advanced defenses for your Windows and Linux machines.
With this Defender plan enabled on your subscriptions but not on your workspaces, you're paying for the full capability of Microsoft Defender for servers but missing out on some of the benefits.
When you enable Microsoft Defender for servers on a workspace, all machines reporting to that workspace will be billed for Microsoft Defender for servers - even if they're in subscriptions without Defender plans enabled. Unless you also enable Microsoft Defender for servers on the subscription, those machines won't be able to take advantage of just-in-time VM access, adaptive application controls, and network detections for Azure resources.
Learn more in [Introduction to Microsoft Defender for servers](defender-for-servers-introduction.md).
(No related policy)

**Severity**: Medium

### Secure Boot should be enabled on supported Windows virtual machines

**Description**: Enable Secure Boot on supported Windows virtual machines to mitigate against malicious and unauthorized changes to the boot chain. Once enabled, only trusted bootloaders, kernel, and kernel drivers will be allowed to run. This assessment only applies to trusted launch enabled Windows virtual machines.

- Trusted launch requires the creation of new virtual machines.
- You can't enable trusted launch on existing virtual machines that were initially created without it.

Learn more about [Trusted launch for Azure virtual machines](/azure/virtual-machines/trusted-launch).
(No related policy)

**Severity**: Low

### Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign

**Description**: Service Fabric provides three levels of protection (None, Sign, and EncryptAndSign) for node-to-node communication using a primary cluster certificate. Set the protection level to ensure that all node-to-node messages are encrypted and digitally signed.
(Related policy: [Service Fabric clusters should have the ClusterProtectionLevel property set to EncryptAndSign](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f617c02be-7f02-4efd-8836-3180d47b6c68)).

**Severity**: High

### Service Fabric clusters should only use Azure Active Directory for client authentication

**Description**: Perform Client authentication only via Azure Active Directory in Service Fabric
(Related policy: [Service Fabric clusters should only use Azure Active Directory for client authentication](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fb54ed75b-3e1a-44ac-a333-05ba39b99ff0)).

**Severity**: High

### System updates on virtual machine scale sets should be installed

**Description**: Install missing system security and critical updates to secure your Windows and Linux virtual machine scale sets.
(Related policy: [System updates on virtual machine scale sets should be installed](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fc3f317a7-a95c-4547-b7e7-11017ebdf2fe)).

As use of the Azure Monitor Agent (AMA) and the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) is phased out in Defender for Servers, recommendations that rely on those agents, like this one, will be removed. Instead, Defender for Servers features will use the Microsoft Defender for Endpoint agent, or agentless scanning, with no reliance on the MMA or AMA.

Estimated deprecation: July 2024. These recommendations are [replaced by new ones](release-notes-archive.md#two-recommendations-related-to-missing-operating-system-os-updates-were-released-to-ga).

**Severity**: High

### System updates should be installed on your machines

**Description**: Install missing system security and critical updates to secure your Windows and Linux virtual machines and computers
(Related policy: [System updates should be installed on your machines](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fmicrosoft.authorization%2fpolicyDefinitions%2f86b3d65f-7626-441e-b690-81a8b71cff60)).

As use of the Azure Monitor Agent (AMA) and the Log Analytics agent (also known as the Microsoft Monitoring Agent (MMA)) is phased out in Defender for Servers, recommendations that rely on those agents, like this one, will be removed. Instead, Defender for Servers features will use the Microsoft Defender for Endpoint agent, or agentless scanning, with no reliance on the MMA or AMA.

Estimated deprecation: July 2024. These recommendations are [replaced by new ones](release-notes-archive.md#two-recommendations-related-to-missing-operating-system-os-updates-were-released-to-ga).

**Severity**: High

### System updates should be installed on your machines (powered by Update Center)

**Description**: Your machines are missing system, security, and critical updates. Software updates often include critical patches to security holes. Such holes are frequently exploited in malware attacks so it's vital to keep your software updated. To install all outstanding patches and secure your machines, follow the remediation steps.
(No related policy)

**Severity**: High

### Virtual machines and virtual machine scale sets should have encryption at host enabled

**Description**: Use encryption at host to get end-to-end encryption for your virtual machine and virtual machine scale set data. Encryption at host enables encryption at rest for your temporary disk and OS/data disk caches. Temporary and ephemeral OS disks are encrypted with platform-managed keys when encryption at host is enabled. OS/data disk caches are encrypted at rest with either customer-managed or platform-managed key, depending on the encryption type selected on the disk. Learn more at [Use the Azure portal to enable end-to-end encryption using encryption at host](/azure/virtual-machines/disks-enable-host-based-encryption-portal). (Related policy: [Virtual machines and virtual machine scale sets should have encryption at host enabled](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2ffc4d8e41-e223-45ea-9bf5-eada37891d87)).

**Severity**: Medium

### Virtual machines should be migrated to new Azure Resource Manager resources

**Description**: Virtual machines (classic) are deprecated and these VMs should be migrated to Azure Resource Manager.
Because Azure Resource Manager now has full IaaS capabilities and other advancements, we deprecated the management of IaaS virtual machines (VMs) through Azure Service Manager (ASM) on February 28, 2020. This functionality will be fully retired on March 1, 2023.

To view all affected classic VMs make sure to select all your Azure subscriptions under 'directories + subscriptions' tab.

Available resources and information about this tool & migration:
[Overview of Virtual machines (classic) deprecation, step by step process for migration & available Microsoft resources.](/azure/virtual-machines/classic-vm-deprecation?toc=/azure/virtual-machines/windows/toc.json&bc=/azure/virtual-machines/windows/breadcrumb/toc.json)
[Details about Migrate to Azure Resource Manager migration tool.](/azure/virtual-machines/migration-classic-resource-manager-deep-dive?toc=/azure/virtual-machines/windows/toc.json&bc=/azure/virtual-machines/windows/breadcrumb/toc.json)
[Migrate to Azure Resource Manager migration tool using PowerShell.](/azure/virtual-machines/windows/migration-classic-resource-manager-ps)
(Related policy: [Virtual machines should be migrated to new Azure Resource Manager resources](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f1d84d5fb-01f6-4d12-ba4f-4a26081d403d)).

**Severity**: High

### Virtual machines guest attestation status should be healthy

**Description**: Guest attestation is performed by sending a trusted log (TCGLog) to an attestation server. The server uses these logs to determine whether boot components are trustworthy. This assessment is intended to detect compromises of the boot chain, which might be the result of a ```bootkit``` or ```rootkit``` infection.
This assessment only applies to Trusted Launch enabled virtual machines that have the Guest Attestation extension installed.
(No related policy)

**Severity**: Medium

### Virtual machines' Guest Configuration extension should be deployed with system-assigned managed identity

**Description**: The Guest Configuration extension requires a system assigned managed identity. Azure virtual machines in the scope of this policy will be non-compliant when they have the Guest Configuration extension installed but do not have a system assigned managed identity. [Learn more](/azure/governance/machine-configuration/overview)
(Related policy: [Guest Configuration extension should be deployed to Azure virtual machines with system assigned managed identity](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fd26f7642-7545-4e18-9b75-8c9bbdee3a9a)).

**Severity**: Medium

### Virtual machine scale sets should be configured securely

**Description**: On virtual machine scale sets, remediate vulnerabilities to protect them from attacks.
(Related policy: [Vulnerabilities in security configuration on your virtual machine scale sets should be remediated](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f3c735d8a-a4ba-4a3a-b7cf-db7754cf57f4)).

**Severity**: High

### Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources

**Description**: By default, a virtual machine's OS and data disks are encrypted-at-rest using platform-managed keys;
temp disks and data caches aren't encrypted, and data isn't encrypted when flowing between compute and storage resources.
For a comparison of different disk encryption technologies in Azure, see [Overview of managed disk encryption options](/azure/virtual-machines/disk-encryption-overview#comparison).
Use Azure Disk Encryption to encrypt all this data.
Disregard this recommendation if:

You're using the encryption-at-host feature, or server-side encryption on Managed Disks meets your security requirements. Learn more in [server-side encryption of Azure Disk Storage](/azure/virtual-machines/disk-encryption).

(Related policy: [Disk encryption should be applied on virtual machines](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f0961003e-5a0a-4549-abde-af6a37f2724d))

**Severity**: High

### vTPM should be enabled on supported virtual machines

**Description**: Enable virtual TPM device on supported virtual machines to facilitate Measured Boot and other OS security features that require a TPM. Once enabled, vTPM can be used to attest boot integrity. This assessment only applies to trusted launch enabled virtual machines.

- Trusted launch requires the creation of new virtual machines.
- You can't enable trusted launch on existing virtual machines that were initially created without it.

Learn more about [Trusted launch for Azure virtual machines](/azure/virtual-machines/trusted-launch).
(No related policy)

**Severity**: Low

### Vulnerabilities in security configuration on your Linux machines should be remediated (powered by Guest Configuration)

**Description**: Remediate vulnerabilities in security configuration on your Linux machines to protect them from attacks.
(Related policy: [Linux machines should meet requirements for the Azure security baseline](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2ffc9b3da7-8347-4380-8e70-0a0361d8dedd)).

**Severity**: Low

### Vulnerabilities in security configuration on your Windows machines should be remediated (powered by Guest Configuration)

**Description**: Remediate vulnerabilities in security configuration on your Windows machines to protect them from attacks.
(No related policy)

**Severity**: Low

### Windows Defender Exploit Guard should be enabled on machines

**Description**: Windows Defender Exploit Guard uses the Azure Policy Guest Configuration agent. Exploit Guard has four components that are designed to lock down devices against a wide variety of attack vectors and block behaviors commonly used in malware attacks while enabling enterprises to balance their security risk and productivity requirements (Windows only).
(Related policy: [Audit Windows machines on which Windows Defender Exploit Guard is not enabled](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fmicrosoft.authorization%2fpolicyDefinitions%2fbed48b13-6647-468e-aa2f-1af1d3f4dd40)).

**Severity**: Medium

### Windows virtual machines should enable Azure Disk Encryption or EncryptionAtHost

**Description**: By default, a virtual machine's OS and data disks are encrypted-at-rest using platform-managed keys; temp disks and data caches aren't encrypted, and data isn't encrypted when flowing between compute and storage resources. Use Azure Disk Encryption or EncryptionAtHost to encrypt all this data. Visit [Overview of managed disk encryption options](/azure/virtual-machines/disk-encryption-overview#comparison) to compare encryption offerings. This policy requires two prerequisites to be deployed to the policy assignment scope. For details, visit [Understanding Azure Machine Configuration](/azure/governance/machine-configuration/overview).
(Related policy: [[Preview]: Windows virtual machines should enable Azure Disk Encryption or EncryptionAtHost](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f3dc5edcd-002d-444c-b216-e123bbfa37c0)).

Replaces the older recommendation Virtual machines should encrypt temp disks, caches, and data flows between Compute and Storage resources. The recommendation enables you to audit VM encryption compliance.

**Severity**: High

### Windows web servers should be configured to use secure communication protocols

**Description**: To protect the privacy of information communicated over the Internet, your web servers should use the latest version of the industry-standard cryptographic protocol, Transport Layer Security (TLS). TLS secures communications over a network by using security certificates to encrypt a connection between machines.
(Related policy: [Audit Windows web servers that are not using secure communication protocols](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f5752e6d6-1206-46d8-8ab1-ecc2f71a8112)).

**Severity**: High

## AWS Compute recommendations

### Amazon EC2 instances managed by Systems Manager should have a patch compliance status of COMPLIANT after a patch installation

**Description**: This control checks whether the compliance status of the Amazon EC2 Systems Manager patch compliance is COMPLIANT or NON_COMPLIANT after the patch installation on the instance.
It only checks instances managed by AWS Systems Manager Patch Manager.
It doesn't check whether the patch was applied within the 30-day limit prescribed by PCI DSS requirement '6.2'.
It also doesn't validate whether the patches applied were classified as security patches.
You should create patching groups with the appropriate baseline settings and ensure in-scope systems are managed by those patch groups in Systems Manager. For more information about patch groups, see [AWS Systems Manager User Guide](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-patch-group-tagging.html).

**Severity**: Medium

### Amazon EFS should be configured to encrypt file data at rest using AWS KMS

**Description**: This control checks whether Amazon Elastic File System is configured to encrypt the file data using AWS KMS. The check fails in the following cases:
*"[Encrypted](https://docs.aws.amazon.com/efs/latest/ug/API_DescribeFileSystems.html)" is set to "false" in the DescribeFileSystems response.
 The "[KmsKeyId](https://docs.aws.amazon.com/efs/latest/ug/API_DescribeFileSystems.html)" key in the [DescribeFileSystems](https://docs.aws.amazon.com/efs/latest/ug/API_DescribeFileSystems.html) response doesn't match the KmsKeyId parameter for [efs-encrypted-check](https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html).
 Note that this control doesn't use the "KmsKeyId" parameter for [efs-encrypted-check](https://docs.aws.amazon.com/config/latest/developerguide/efs-encrypted-check.html). It only checks the value of "Encrypted". For an added layer of security for your sensitive data in Amazon EFS, you should create encrypted file systems.
 Amazon EFS supports encryption for file systems at-rest. You can enable encryption of data at rest when you create an Amazon EFS file system.
To learn more about Amazon EFS encryption, see [Data encryption in Amazon EFS](https://docs.aws.amazon.com/efs/latest/ug/encryption.html) in the Amazon Elastic File System User Guide.

**Severity**: Medium

### Amazon EFS volumes should be in backup plans

**Description**: This control checks whether Amazon Elastic File System (Amazon EFS) file systems are added to the backup plans in AWS Backup. The control fails if Amazon EFS file systems aren't included in the backup plans.
 Including EFS file systems in the backup plans helps you to protect your data from deletion and data loss.

**Severity**: Medium

### Application Load Balancer deletion protection should be enabled

**Description**: This control checks whether an Application Load Balancer has deletion protection enabled. The control fails if deletion protection isn't configured.
Enable deletion protection to protect your Application Load Balancer from deletion.

**Severity**: Medium

### Auto Scaling groups associated with a load balancer should use health checks

**Description**: Auto Scaling groups that are associated with a load balancer are using Elastic Load Balancing health checks.
 PCI DSS doesn't require load balancing or highly available configurations. This is recommended by AWS best practices.

**Severity**: Low

### AWS accounts should have Azure Arc auto provisioning enabled

**Description**: For full visibility of the security content from Microsoft Defender for servers, EC2 instances should be connected to Azure Arc. To ensure that all eligible EC2 instances automatically receive Azure Arc, enable autoprovisioning from Defender for Cloud at the AWS account level. Learn more about [Azure Arc](/azure/azure-arc/servers/overview), and [Microsoft Defender for Servers](plan-defender-for-servers.md).

**Severity**: High

### CloudFront distributions should have origin failover configured

**Description**: This control checks whether an Amazon CloudFront distribution is configured with an origin group that has two or more origins.
CloudFront origin failover can increase availability. Origin failover automatically redirects traffic to a secondary origin if the primary origin is unavailable or if it returns specific HTTP response status codes.

**Severity**: Medium

### CodeBuild GitHub or Bitbucket source repository URLs should use OAuth

**Description**: This control checks whether the GitHub or Bitbucket source repository URL contains either personal access tokens or a user name and password.
Authentication credentials should never be stored or transmitted in clear text or appear in the repository URL. Instead of personal access tokens or user name and password, you should use OAuth to grant authorization for accessing GitHub or Bitbucket repositories.
 Using personal access tokens or a user name and password could expose your credentials to unintended data exposure and unauthorized access.

**Severity**: High

### CodeBuild project environment variables should not contain credentials

**Description**: This control checks whether the project contains the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
Authentication credentials `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` should never be stored in clear text, as this could lead to unintended data exposure and unauthorized access.

**Severity**: High

### DynamoDB Accelerator (DAX) clusters should be encrypted at rest

**Description**: This control checks whether a DAX cluster is encrypted at rest.
 Encrypting data at rest reduces the risk of data stored on disk being accessed by a user not authenticated to AWS. The encryption adds another set of access controls to limit the ability of unauthorized users to access to the data.
 For example, API permissions are required to decrypt the data before it can be read.

**Severity**: Medium

### DynamoDB tables should automatically scale capacity with demand

**Description**: This control checks whether an Amazon DynamoDB table can scale its read and write capacity as needed. This control passes if the table uses either on-demand capacity mode or provisioned mode with auto scaling configured.
 Scaling capacity with demand avoids throttling exceptions, which helps to maintain availability of your applications.

**Severity**: Medium

### EC2 instances should be connected to Azure Arc

**Description**: Connect your EC2 instances to Azure Arc in order to have full visibility to Microsoft Defender for Servers security content. Learn more about [Azure Arc](/azure/azure-arc/servers/overview), and about [Microsoft Defender for Servers](plan-defender-for-servers.md) on hybrid-cloud environment.

**Severity**: High

### EC2 instances should be managed by AWS Systems Manager

**Description**: Status of the Amazon EC2 Systems Manager patch compliance is 'COMPLIANT' or 'NON_COMPLIANT' after the patch installation on the instance.
 Only  instances managed by AWS Systems Manager Patch Manager are checked. Patches that were applied within the 30-day limit prescribed by PCI DSS requirement '6' aren't checked.

**Severity**: Medium

### EDR configuration issues should be resolved on EC2s

**Description**: To protect virtual machines from the latest threats and vulnerabilities, resolve all identified configuration issues with the installed Endpoint Detection and Response (EDR) solution. Currently, this recommendation only applies to resources with Microsoft Defender for Endpoint enabled.

This agentless endpoint recommendation is available if you have Defender for Servers Plan 2 or the Defender CSPM plan. [Learn more](endpoint-detection-response.md) about agentless endpoint protection recommendations.

- These new agentless endpoint recommendations support Azure and multicloud machines. On-premises servers aren't supported.
- These new agentless endpoint recommendations replace existing recommendations Endpoint protection should be installed on your machines (preview)](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/4fb67663-9ab9-475d-b026-8c544cced439) and [Endpoint protection health issues should be resolved on your machines (preview).
- These older recommendations use the MMA/AMA agent and will be replaced as the agents are [phased out in Defender for Servers](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/microsoft-defender-for-cloud---strategy-and-plan-towards-log-analytics-agent-mma/3883341).

**Severity**: High

### EDR solution should be installed on EC2s

**Description**: To protect EC2s, install an Endpoint Detection and Response (EDR) solution. EDRs help prevent, detect, investigate, and respond to advanced threats. Use Microsoft Defender for Servers to deploy Microsoft Defender for Endpoint. If resource is classified as "Unhealthy", it doesn't have a supported EDR solution installed. If you have an EDR solution installed which isn't discoverable by this recommendation, you can exempt it.

This agentless endpoint recommendation is available if you have Defender for Servers Plan 2 or the Defender CSPM plan. [Learn more](endpoint-detection-response.md) about agentless endpoint protection recommendations.

- These new agentless endpoint recommendations support Azure and multicloud machines. On-premises servers aren't supported.
- These new agentless endpoint recommendations replace existing recommendations Endpoint protection should be installed on your machines (preview)](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/4fb67663-9ab9-475d-b026-8c544cced439) and [Endpoint protection health issues should be resolved on your machines (preview).
- These older recommendations use the MMA/AMA agent and will be replaced as the agents are [phased out in Defender for Servers](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/microsoft-defender-for-cloud---strategy-and-plan-towards-log-analytics-agent-mma/3883341).

**Severity**: High

### Instances managed by Systems Manager should have an association compliance status of COMPLIANT

**Description**: This control checks whether the status of the AWS Systems Manager association compliance is COMPLIANT or NON_COMPLIANT after the association is run on an instance. The control passes if the association compliance status is COMPLIANT.
A State Manager association is a configuration that is assigned to your managed instances. The configuration defines the state that you want to maintain on your instances. For example, an association can specify that antivirus software must be installed and running on your instances, or that certain ports must be closed.
After you create one or more State Manager associations, compliance status information is immediately available to you in the console or in response to AWS CLI commands or corresponding Systems Manager API operations. For associations, "Configuration" Compliance shows statuses of Compliant or Non-compliant and the severity level assigned to the association, such as *Critical* or *Medium*. To learn more about State Manager association compliance, see [About State Manager association compliance](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-compliance-about.html#sysman-compliance-about-association) in the AWS Systems Manager User Guide.
You must configure your in-scope EC2 instances for Systems Manager association. You must also configure the patch baseline for the security rating of the vendor of patches, and set the autoapproval date to meet PCI DSS *3.2.1* requirement *6.2*. For more guidance on how to [Create an association](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-state-assoc.html), see Create an association in the AWS Systems Manager User Guide. For more information on working with patching in Systems Manager, see [AWS Systems Manager Patch Manager](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-patch.html) in the AWS Systems Manager User Guide.

**Severity**: Low

### Lambda functions should have a dead-letter queue configured

**Description**: This control checks whether a Lambda function is configured with a dead-letter queue. The control fails if the Lambda function isn't configured with a dead-letter queue.
As an alternative to an on-failure destination, you can configure your function with a dead-letter queue to save discarded events for further processing.
 A dead-letter queue acts the same as an on-failure destination. It's used when an event fails all processing attempts or expires without being processed.
A dead-letter queue allows you to look back at errors or failed requests to your Lambda function to debug or identify unusual behavior.
From a security perspective, it's important to understand why your function failed and to ensure that your function doesn't drop data or compromise data security as a result.
 For example, if your function can't communicate to an underlying resource, that could be a symptom of a denial of service (DoS) attack elsewhere in the network.

**Severity**: Medium

### Lambda functions should use supported runtimes

**Description**: This control checks that the Lambda function settings for runtimes match the expected values set for the supported runtimes for each language. This control checks for the following runtimes:
 **nodejs14.x**, **nodejs12.x**, **nodejs10.x**, **python3.8**, **python3.7**, **python3.6**, **ruby2.7**, **ruby2.5**, **java11**, **java8**, **java8.al2**, **go1.x**, **dotnetcore3.1**, **dotnetcore2.1**
[Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) are built around a combination of operating system, programming language, and software libraries that are subject to maintenance and security updates. When a runtime component is no longer supported for security updates, Lambda deprecates the runtime. Even though you can't create functions that use the deprecated runtime, the function is still available to process invocation events. Make sure that your Lambda functions are current and don't use out-of-date runtime environments.
To learn more about the supported runtimes that this control checks for the supported languages, see [AWS Lambda runtimes](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) in the AWS Lambda Developer Guide.

**Severity**: Medium

### Management ports of EC2 instances should be protected with just-in-time network access control

**Description**: Microsoft Defender for Cloud identified some overly permissive inbound rules for management ports in your network. Enable just-in-time access control to protect your Instances from internet-based brute-force attacks. [Learn more](just-in-time-access-usage.yml).

**Severity**: High

### Unused EC2 security groups should be removed

**Description**: Security groups should be attached to Amazon EC2 instances or to an ENI.
 Healthy finding can indicate there are unused Amazon EC2 security groups.

**Severity**: Low

## GCP Compute recommendations

### Compute Engine VMs should use the Container-Optimized OS

**Description**: This recommendation evaluates the config property of a node pool for the key-value pair, 'imageType': 'COS.'

**Severity**: Low

### EDR configuration issues should be resolved on GCP virtual machines

**Description**: To protect virtual machines from the latest threats and vulnerabilities, resolve all identified configuration issues with the installed Endpoint Detection and Response (EDR) solution. Currently, this recommendation only applies to resources with Microsoft Defender for Endpoint  enabled.

This agentless endpoint recommendation is available if you have Defender for Servers Plan 2 or the Defender CSPM plan. [Learn more](endpoint-detection-response.md) about agentless endpoint protection recommendations.

- These new agentless endpoint recommendations support Azure and multicloud machines. On-premises servers aren't supported.
- These new agentless endpoint recommendations replace existing recommendations Endpoint protection should be installed on your machines (preview)](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/4fb67663-9ab9-475d-b026-8c544cced439) and [Endpoint protection health issues should be resolved on your machines (preview).
- These older recommendations use the MMA/AMA agent and will be replaced as the agents are [phased out in Defender for Servers](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/microsoft-defender-for-cloud---strategy-and-plan-towards-log-analytics-agent-mma/3883341).

**Severity**: High

### EDR solution should be installed on GCP Virtual Machines

**Description**: To protect virtual machines, install an Endpoint Detection and Response (EDR) solution. EDRs help prevent, detect, investigate, and respond to advanced threats. Use Microsoft Defender for Servers to deploy Microsoft Defender for Endpoint. If resource is classified as "Unhealthy", it doesn't have a supported EDR solution installed. If you have an EDR solution installed which isn't discoverable by this recommendation, you can exempt it.

This agentless endpoint recommendation is available if you have Defender for Servers Plan 2 or the Defender CSPM plan. [Learn more](endpoint-detection-response.md) about agentless endpoint protection recommendations.

- These new agentless endpoint recommendations support Azure and multicloud machines. On-premises servers aren't supported.
- These new agentless endpoint recommendations replace existing recommendations Endpoint protection should be installed on your machines (preview)](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/4fb67663-9ab9-475d-b026-8c544cced439) and [Endpoint protection health issues should be resolved on your machines (preview).
- These older recommendations use the MMA/AMA agent and will be replaced as the agents are [phased out in Defender for Servers](https://techcommunity.microsoft.com/blog/microsoftdefendercloudblog/microsoft-defender-for-cloud---strategy-and-plan-towards-log-analytics-agent-mma/3883341).

**Severity**: High

### Ensure 'Block Project-wide SSH keys' is enabled for VM instances

**Description**: It's recommended to use Instance specific SSH key(s) instead of using common/shared project-wide SSH key(s) to access Instances.
Project-wide SSH keys are stored in Compute/Project-meta-data. Project wide SSH keys can be used to log in into all the instances within project. Using project-wide SSH keys eases the SSH key management but if compromised, poses the security risk that can affect all the instances within project.
 It's recommended to use Instance specific SSH keys that can limit the attack surface if the SSH keys are compromised.

**Severity**: Medium

### Ensure Compute instances are launched with Shielded VM enabled

**Description**: To defend against advanced threats and ensure that the boot loader and firmware on your VMs are signed and untampered, it's recommended that Compute instances are launched with Shielded VM enabled.
Shielded VMs are VMs on Google Cloud Platform hardened by a set of security controls that help defend against ```rootkits``` and ```bootkits```.
Shielded VM offers verifiable integrity of your Compute Engine VM instances, so you can be confident your instances haven't been compromised by boot- or kernel-level malware or rootkits.
Shielded VM's verifiable integrity is achieved through the use of Secure Boot, virtual trusted platform module (vTPM)-enabled Measured Boot, and integrity monitoring.
Shielded VM instances run firmware that is signed and verified using Google's Certificate Authority, ensuring that the instance's firmware is unmodified and establishing the root of trust for Secure Boot.
Integrity monitoring helps you understand and make decisions about the state of your VM instances and the Shielded VM vTPM enables Measured Boot by performing the measurements needed to create a known good boot baseline, called the integrity policy baseline.
The integrity policy baseline is used for comparison with measurements from subsequent VM boots to determine if anything has changed.
Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails.

**Severity**: High

### Ensure 'Enable connecting to serial ports' is not enabled for VM Instance

**Description**: Interacting with a serial port is often referred to as the serial console, which is similar to using a terminal window, in that input and output is entirely in text mode and there's no graphical interface or mouse support.
If you enable the interactive serial console on an instance, clients can attempt to connect to that instance from any IP address. Therefore interactive serial console support should be disabled.
A virtual machine instance has four virtual serial ports. Interacting with a serial port is similar to using a terminal window, in that input and output is entirely in text mode and there's no graphical interface or mouse support.
The instance's operating system, BIOS, and other system-level entities often write output to the serial ports, and can accept input such as commands or answers to prompts.
Typically, these system-level entities use the first serial port (port 1) and serial port 1 is often referred to as the serial console.
The interactive serial console doesn't support IP-based access restrictions such as IP allowlists. If you enable the interactive serial console on an instance, clients can attempt to connect to that instance from any IP address.
This allows anybody to connect to that instance if they know the correct SSH key, username, project ID, zone, and instance name.
Therefore interactive serial console support should be disabled.

**Severity**: Medium

### Ensure 'log_duration' database flag for Cloud SQL PostgreSQL instance is set to 'on'

**Description**: Enabling the log_hostname setting causes the duration of each completed statement to be logged.
 This doesn't logs the text of the query and thus behaves different from the log_min_duration_statement flag.
 This parameter can't be changed after session start.
 Monitoring the time taken to execute the queries can be crucial in identifying any resource hogging queries and assessing the performance of the server.
 Further steps such as load balancing and use of optimized queries can be taken to ensure the performance and stability of the server.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure 'log_executor_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off'

**Description**: The PostgreSQL executor is responsible to execute the plan handed over by the PostgreSQL planner.
 The executor processes the plan recursively to extract the required set of rows.
 The "log_executor_stats" flag controls the inclusion of PostgreSQL executor performance statistics in the PostgreSQL logs for each query.
 The "log_executor_stats" flag enables a crude profiling method for logging PostgreSQL executor performance statistics, which even though can be useful for troubleshooting, it might increase the number of logs significantly and have performance overhead.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure 'log_min_error_statement' database flag for Cloud SQL PostgreSQL instance is set to 'Error' or stricter

**Description**: The "log_min_error_statement" flag defines the minimum message severity level that is considered as an error statement.
 Messages for error statements are logged with the SQL statement.
 Valid values include "DEBUG5," "DEBUG4," "DEBUG3," "DEBUG2," "DEBUG1," "INFO," "NOTICE," "WARNING," "ERROR," "LOG," "FATAL," and "PANIC."
 Each severity level includes the subsequent levels mentioned above.
 Ensure a value of ERROR or stricter is set.
 Auditing helps in troubleshooting operational problems and also permits forensic analysis.
 If "log_min_error_statement" isn't set to the correct value, messages might not be classified as error messages appropriately.
 Considering general log messages as error messages would make is difficult to find actual errors and considering only stricter severity levels as error messages might skip actual errors to log their SQL statements.
 The "log_min_error_statement" flag should be set to "ERROR" or stricter.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure 'log_parser_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off'

**Description**: The PostgreSQL planner/optimizer is responsible to parse and verify the syntax of each query received by the server.
 If the syntax is correct a "parse tree" is built up else an error is generated.
 The "log_parser_stats" flag controls the inclusion of parser performance statistics in the PostgreSQL logs for each query.
 The "log_parser_stats" flag enables a crude profiling method for logging parser performance statistics, which even though can be useful for troubleshooting, it might increase the number of logs significantly and have performance overhead.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure 'log_planner_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off'

**Description**: The same SQL query can be executed in multiple ways and still produce different results.
 The PostgreSQL planner/optimizer is responsible to create an optimal execution plan for each query.
 The "log_planner_stats" flag controls the inclusion of PostgreSQL planner performance statistics in the PostgreSQL logs for each query.
 The "log_planner_stats" flag enables a crude profiling method for logging PostgreSQL planner performance statistics, which even though can be useful for troubleshooting, it might increase the number of logs significantly and have performance overhead.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure 'log_statement_stats' database flag for Cloud SQL PostgreSQL instance is set to 'off'

**Description**: The "log_statement_stats" flag controls the inclusion of end to end performance statistics of a SQL query in the PostgreSQL logs for each query.
 This can't be enabled with other module statistics (*log_parser_stats*, *log_planner_stats*, *log_executor_stats*).
 The "log_statement_stats" flag enables a crude profiling method for logging end to end performance statistics of a SQL query.
 This can be useful for troubleshooting but might increase the number of logs significantly and have performance overhead.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure that Compute instances do not have public IP addresses

**Description**: Compute instances shouldn't be configured to have external IP addresses.
To reduce your attack surface, Compute instances shouldn't have public IP addresses. Instead, instances should be configured behind load balancers, to minimize the instance's exposure to the internet.
Instances created by GKE should be excluded because some of them have external IP addresses and can't be changed by editing the instance settings.
These VMs have names that start with ```gke-``` and are labeled ```goog-gke-node```.

**Severity**: High

### Ensure that instances are not configured to use the default service account

**Description**: It's recommended to configure your instance to not use the default Compute Engine service account because it has the Editor role on the project.
The default Compute Engine service account has the Editor role on the project, which allows read and write access to most Google Cloud Services.
To defend against privilege escalations if your VM is compromised, and to prevent an attacker from gaining access to all of your projects, it's recommended to not use the default Compute Engine service account.
Instead, you should create a new service account and assigning only the permissions needed by your instance.
The default Compute Engine service account is named `[PROJECT_NUMBER]- compute@developer.gserviceaccount.com`.
VMs created by GKE should be excluded. These VMs have names that start with ```gke-``` and are labeled ```goog-gke-node```.

**Severity**: High

### Ensure that instances are not configured to use the default service account with full access to all Cloud APIs

**Description**: To support principle of least privileges and prevent potential privilege escalation, it's recommended that instances aren't assigned to default service account "Compute Engine default service account" with Scope "Allow full access to all Cloud APIs."
Along with ability to optionally create, manage, and use user managed custom service accounts, Google Compute Engine provides default service account "Compute Engine default service account" for an instance to access necessary cloud services.

"Project Editor" role is assigned to "Compute Engine default service account" hence, This service account has almost all capabilities over all cloud services except billing.
However, when "Compute Engine default service account" assigned to an instance it can operate in three scopes.

- Allow default access: Allows only minimum access required to run an Instance (Least Privileges).
- Allow full access to all Cloud APIs: Allow full access to all the cloud APIs/Services (Too much access).
- Set access for each API: Allows Instance administrator to choose only those APIs that are needed to perform specific business functionality expected by instance.

When an instance is configured with "Compute Engine default service account" with Scope "Allow full access to all Cloud APIs," based on IAM roles assigned to the user(s) accessing Instance,
it might allow user to perform cloud operations/API calls that user isn't supposed to perform leading to successful privilege escalation.

VMs created by GKE should be excluded. These VMs have names that start with ```gke-``` and are labeled ```goog-gke-node```.

**Severity**: Medium

### Ensure that IP forwarding is not enabled on Instances

**Description**: Compute Engine instance can't forward a packet unless the source IP address of the packet matches the IP address of the instance. Similarly, GCP won't deliver a packet whose destination IP address is different than the IP address of the instance receiving the packet.
 However, both capabilities are required if you want to use instances to help route packets.
Forwarding of data packets should be disabled to prevent data loss or information disclosure.
Compute Engine instance can't forward a packet unless the source IP address of the packet matches the IP address of the instance. Similarly, GCP won't deliver a packet whose destination IP address is different than the IP address of the instance receiving the packet.
 However, both capabilities are required if you want to use instances to help route packets. To enable this source and destination IP check, disable the canIpForward field, which allows an instance to send and receive packets with nonmatching destination or source IPs.

**Severity**: Medium

### Ensure that the 'log_checkpoints' database flag for Cloud SQL PostgreSQL instance is set to 'on'

**Description**: Ensure that the log_checkpoints database flag for the Cloud SQL PostgreSQL instance is set to on.
Enabling log_checkpoints causes checkpoints and restart points to be logged in the server log. Some statistics are included in the log messages, including the number of buffers written and the time spent writing them.
 This parameter can only be set in the postgresql.conf file or on the server command line. This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure that the 'log_lock_waits' database flag for Cloud SQL PostgreSQL instance is set to 'on'

**Description**: Enabling the "log_lock_waits" flag for a PostgreSQL instance creates a log for any session waits that take longer than the allotted "deadlock_timeout" time to acquire a lock.
 The deadlock timeout defines the time to wait on a lock before checking for any conditions. Frequent run overs on deadlock timeout can be an indication of an underlying issue.
 Logging such waits on locks by enabling the log_lock_waits flag can be used to identify poor performance due to locking delays or if a specially crafted SQL is attempting to starve resources through holding locks for excessive amounts of time.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure that the 'log_min_duration_statement' database flag for Cloud SQL PostgreSQL instance is set to '-1'

**Description**: The "log_min_duration_statement" flag defines the minimum amount of execution time of a statement in milliseconds where the total duration of the statement is logged. Ensure that "log_min_duration_statement" is disabled, that is, a value of -1 is set.
 Logging SQL statements might include sensitive information that shouldn't be recorded in logs. This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure that the 'log_min_messages' database flag for Cloud SQL PostgreSQL instance is set appropriately

**Description**: The "log_min_error_statement" flag defines the minimum message severity level that is considered as an error statement.
 Messages for error statements are logged with the SQL statement.
 Valid values include "DEBUG5," "DEBUG4," "DEBUG3," "DEBUG2," "DEBUG1," "INFO," "NOTICE," "WARNING," "ERROR," "LOG," "FATAL," and "PANIC."
 Each severity level includes the subsequent levels mentioned above.
 To effectively turn off logging failing statements, set this parameter to PANIC.
 ERROR is considered the best practice setting. Changes should only be made in accordance with the organization's logging policy.
Auditing helps in troubleshooting operational problems and also permits forensic analysis.
 If "log_min_error_statement" isn't set to the correct value, messages might not be classified as error messages appropriately.
 Considering general log messages as error messages would make it difficult to find actual errors, while considering only stricter severity levels as error messages might skip actual errors to log their SQL statements.
 The "log_min_error_statement" flag should be set in accordance with the organization's logging policy.
 This recommendation is applicable to PostgreSQL database instances.

**Severity**: Low

### Ensure that the 'log_temp_files' database flag for Cloud SQL PostgreSQL instance is set to '0'

**Description**: PostgreSQL can create a temporary file for actions such as sorting, hashing, and temporary query results when these operations exceed "work_mem."
 The "log_temp_files" flag controls logging names and the file size when it's deleted.
 Configuring "log_temp_files" to 0 causes all temporary file information to be logged, while positive values log only files whose size is greater than or equal to the specified number of kilobytes.
 A value of "-1" disables temporary file information logging.
 If all temporary files aren't logged, it might be more difficult to identify potential performance issues that might be due to either poor application coding or deliberate resource starvation attempts.

**Severity**: Low

### Ensure VM disks for critical VMs are encrypted with Customer-Supplied Encryption Key

**Description**: Customer-Supplied Encryption Keys (CSEK) are a feature in Google Cloud Storage and Google Compute Engine.
 If you supply your own encryption keys, Google uses your key to protect the Google-generated keys used to encrypt and decrypt your data.
 By default, Google Compute Engine encrypts all data at rest.
 Compute Engine handles and manages this encryption for you without any additional actions on your part.
 However, if you wanted to control and manage this encryption yourself, you can provide your own encryption keys.
By default, Google Compute Engine encrypts all data at rest. Compute Engine handles and manages this encryption for you without any additional actions on your part.
However, if you wanted to control and manage this encryption yourself, you can provide your own encryption keys.
If you provide your own encryption keys, Compute Engine uses your key to protect the Google-generated keys used to encrypt and decrypt your data.
Only users who can provide the correct key can use resources protected by a customer-supplied encryption key.
Google doesn't store your keys on its servers and can't access your protected data unless you provide the key.
This also means that if you forget or lose your key, there's no way for Google to recover the key or to recover any data encrypted with the lost key.
At least business critical VMs should have VM disks encrypted with CSEK.

**Severity**: Medium

### GCP projects should have Azure Arc auto provisioning enabled

**Description**: For full visibility of the security content from Microsoft Defender for servers, GCP VM instances should be connected to Azure Arc. To ensure that all eligible VM instances automatically receive Azure Arc, enable autoprovisioning from Defender for Cloud at the GCP project level. Learn more about [Azure Arc](/azure/azure-arc/servers/overview), and [Microsoft Defender for Servers](plan-defender-for-servers.md).

**Severity**: High

### GCP VM instances should be connected to Azure Arc

**Description**: Connect your GCP Virtual Machines to Azure Arc in order to have full visibility to Microsoft Defender for Servers security content. Learn more about [Azure Arc](/azure/azure-arc/), and about [Microsoft Defender for Servers](plan-defender-for-servers.md) on hybrid-cloud environment.

**Severity**: High

### GCP VM instances should have OS config agent installed

**Description**: To receive the full Defender for Servers capabilities using Azure Arc autoprovisioning, GCP VMs should have OS config agent enabled.

**Severity**: High

### GKE cluster's auto repair feature should be enabled

**Description**: This recommendation evaluates the management property of a node pool for the key-value pair, 'key': 'autoRepair,' 'value': true.

**Severity**: Medium

### GKE cluster's auto upgrade feature should be enabled

**Description**: This recommendation evaluates the management property of a node pool for the key-value pair, 'key': 'autoUpgrade,' 'value': true.

**Severity**: High

### Monitoring on GKE clusters should be enabled

**Description**: This recommendation evaluates whether the monitoringService property of a cluster contains the location Cloud Monitoring should use to write metrics.

**Severity**: Medium

## Related content

- [learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)
