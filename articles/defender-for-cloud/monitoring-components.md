---
title: Overview of the extensions that collect data from your workloads
description: Protect your workloads with Microsoft Defender for Cloud by learning about the extensions that collect data from your workloads.
author: dcurwin
ms.author: dacurwin
ms.topic: concept-article
ms.date: 03/13/2024
---

# How does Defender for Cloud collect data?

Defender for Cloud collects data from your Azure virtual machines (VMs), Virtual Machine Scale Sets, IaaS containers, and non-Azure (including on-premises) machines to monitor for security vulnerabilities and threats. Some Defender plans require monitoring components to collect data from your workloads.

Data collection is required to provide visibility into missing updates, misconfigured OS security settings, endpoint protection status, and health and threat protection. Data collection is only needed for compute resources such as VMs, Virtual Machine Scale Sets, IaaS containers, and non-Azure computers.

You can benefit from Microsoft Defender for Cloud even if you don’t provision agents. However, you'll have limited security and the capabilities listed aren't supported.  

Data is collected using:

- [Azure Monitor Agent (AMA)](auto-deploy-azure-monitoring-agent.md)
- [Microsoft Defender for Endpoint](integration-defender-for-endpoint.md) (MDE)
- **Security components**, such as the [Azure Policy for Kubernetes](/azure/governance/policy/concepts/policy-for-kubernetes)

## Why use Defender for Cloud to deploy monitoring components?

Visibility into the security of your workloads depends on the data that the monitoring components collect. The components ensure security coverage for all supported resources.

To save you the process of manually installing the extensions, Defender for Cloud reduces management overhead by installing all required extensions on existing and new machines. Defender for Cloud assigns the appropriate **Deploy if not exists** policy to the workloads in the subscription. This policy type ensures the extension is provisioned on all existing and future resources of that type.

> [!TIP]
> Learn more about Azure Policy effects, including **Deploy if not exists**, in [Understand Azure Policy effects](/azure/governance/policy/concepts/effects).

## What plans use monitoring components?

These plans use monitoring components to collect data:

- Defender for Servers
  - [Azure Arc agent](/azure/azure-arc/servers/manage-vm-extensions) (For multicloud and on-premises servers)
  - [Microsoft Defender for Endpoint](integration-defender-for-endpoint.md)
  - Vulnerability assessment
- [Defender for SQL servers on machines](defender-for-sql-on-machines-vulnerability-assessment.md)
  - [Azure Arc agent](/azure/azure-arc/servers/manage-vm-extensions) (For multicloud and on-premises servers)
  - [Azure Monitor Agent](#azure-monitor-agent-ama)
  - Automatic SQL server discovery and registration
- Defender for Containers
  - [Azure Arc agent](/azure/azure-arc/servers/manage-vm-extensions) (For multicloud and on-premises servers)
  - [Defender sensor, Azure Policy for Kubernetes, Kubernetes audit log data](defender-for-containers-introduction.md)

## Availability of extensions

[!INCLUDE [Legalese](./includes/defender-for-cloud-preview-legal-text.md)]

### Azure Monitor Agent (AMA)

[!INCLUDE [azure-monitor-agent-availability](includes/azure-monitor-agent-availability.md)]

Learn more about [using the Azure Monitor Agent with Defender for Cloud](auto-deploy-azure-monitoring-agent.md).

### Microsoft Defender for Endpoint

| Aspect | Linux | Windows |
|--|--|--|
| Release state: | Generally available (GA) | Generally available (GA) |
| Relevant Defender plan: | [Microsoft Defender for Servers](defender-for-servers-introduction.md) | [Microsoft Defender for Servers](defender-for-servers-introduction.md) |
| Required roles and permissions (subscription-level): | - To enable/disable the integration: [Security Admin](/azure/role-based-access-control/built-in-roles#security-admin) or [Owner](/azure/role-based-access-control/built-in-roles#owner)<br>- To view Defender for Endpoint alerts in Defender for Cloud: [Security reader](/azure/role-based-access-control/built-in-roles), [Reader](/azure/role-based-access-control/built-in-roles), **Resource Group Contributor**, **Resource Group Owner**, [Security Admin](/azure/role-based-access-control/built-in-roles#security-admin), **Subscription owner**, or **Subscription Contributor** | - To enable/disable the integration: [Security Admin](/azure/role-based-access-control/built-in-roles#security-admin) or [Owner](/azure/role-based-access-control/built-in-roles#owner)<br>- To view Defender for Endpoint alerts in Defender for Cloud: [Security reader](/azure/role-based-access-control/built-in-roles), [Reader](/azure/role-based-access-control/built-in-roles), **Resource Group Contributor**, **Resource Group Owner**, [Security Admin](/azure/role-based-access-control/built-in-roles#security-admin), **Subscription owner**, or **Subscription Contributor** |
| Supported destinations: | :::image type="icon" source="./media/icons/yes-icon.png"::: Azure Arc-enabled machines<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Azure virtual machines | :::image type="icon" source="./media/icons/yes-icon.png"::: Azure Arc-enabled machines<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Azure VMs running Windows Server 2022, 2019, 2016, 2012 R2, 2008 R2 SP1, [Azure Virtual Desktop](/azure/virtual-desktop/overview), [Windows 10 Enterprise multi-session](/azure/virtual-desktop/windows-10-multisession-faq)<br>:::image type="icon" source="./media/icons/no-icon.png"::: Azure VMs running Windows 10 |
| Policy-based: | :::image type="icon" source="./media/icons/no-icon.png"::: No | :::image type="icon" source="./media/icons/no-icon.png"::: No |
| Clouds: | :::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/no-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet | :::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet |

Learn more about [Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint/microsoft-defender-endpoint).

### Vulnerability assessment

| Aspect                                               | Details                                                                                                                                                                            |
|------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Release state:                                       | Generally available (GA)                                                                                                                                                           |
| Relevant Defender plan:                              | [Microsoft Defender for Servers](defender-for-servers-introduction.md)                                                                                                             |
| Required roles and permissions (subscription-level): | [Owner](/azure/role-based-access-control/built-in-roles#owner)                                                                                                                      |
| Supported destinations:                              | :::image type="icon" source="./media/icons/yes-icon.png"::: Azure virtual machines<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Azure Arc-enabled machines       |
| Policy-based:                                        | :::image type="icon" source="./media/icons/yes-icon.png"::: Yes                                                                                                                    |
| Clouds:                                              | :::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/no-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet |

### Guest Configuration

| Aspect                                               | Details                                                                                                                                                                            |
|------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Release state:                                       | Preview                                                                                                                                                                            |
| Relevant Defender plan:                              | No plan required                                                                                                    |
| Required roles and permissions (subscription-level): | [Owner](/azure/role-based-access-control/built-in-roles#owner)                                                                                                                      |
| Supported destinations:                              | :::image type="icon" source="./media/icons/yes-icon.png"::: Azure virtual machines                                                                                                 |
| Clouds:                                              | :::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/no-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet |

Learn more about Azure's [Guest Configuration extension](/azure/governance/machine-configuration/overview).

### Defender for Containers extensions

This table shows the availability details for the components required by the protections offered by [Microsoft Defender for Containers](defender-for-containers-introduction.md).

By default, the required extensions are enabled when you enable Defender for Containers from the Azure portal.

| Aspect                                               | Azure Kubernetes Service clusters                                                      | Azure Arc-enabled Kubernetes clusters                                                       |
|------------------------------------------------------|----------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Release state:                                       | • Defender sensor: GA<br> • Azure Policy for Kubernetes: Generally available (GA) | • Defender sensor: Preview<br> • Azure Policy for Kubernetes: Preview |
| Relevant Defender plan:                              | [Microsoft Defender for Containers](defender-for-containers-introduction.md)           | [Microsoft Defender for Containers](defender-for-containers-introduction.md)                |
| Required roles and permissions (subscription-level): | [Owner](/azure/role-based-access-control/built-in-roles#owner) or [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator)                          | [Owner](/azure/role-based-access-control/built-in-roles#owner) or [User Access Administrator](/azure/role-based-access-control/built-in-roles#user-access-administrator)                               |
| Supported destinations:                              | The AKS Defender sensor only supports [AKS clusters that have RBAC enabled](/azure/aks/concepts-identity#kubernetes-rbac).                                                                                   | [See Kubernetes distributions supported for Arc-enabled Kubernetes](supported-machines-endpoint-solutions-clouds-containers.md?tabs=azure-aks#kubernetes-distributions-and-configurations)             |
| Policy-based:                                        | :::image type="icon" source="./media/icons/yes-icon.png"::: Yes                        | :::image type="icon" source="./media/icons/yes-icon.png"::: Yes                             |
| Clouds:                                              | **Defender sensor**:<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/no-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet<br>**Azure Policy for Kubernetes**:<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet|**Defender sensor**:<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/no-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet<br>**Azure Policy for Kubernetes**:<br>:::image type="icon" source="./media/icons/yes-icon.png"::: Commercial clouds<br>:::image type="icon" source="./media/icons/no-icon.png"::: Azure Government, Microsoft Azure operated by 21Vianet|

Learn more about the [roles used to provision Defender for Containers extensions](permissions.md#roles-used-to-automatically-configure-agents-and-extensions).

## Troubleshooting

- To identify manual onboarding issues, see [How to troubleshoot Operations Management Suite onboarding issues](https://techcommunity.microsoft.com/t5/system-center-blog/operations-management-suite-onboarding-troubleshooting-steps/ba-p/349464).

## Next steps

This page explained what monitoring components are and how to enable them.

Learn more about:

- [Setting up email notifications](configure-email-notifications.md) for security alerts
- Protecting workloads with [the Defender plans](defender-for-cloud-introduction.md#protect-cloud-workloads)
