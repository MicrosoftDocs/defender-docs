---
title: Investigate and respond to container threats in the Microsoft Defender portal
description: Investigate and respond to container attacks and threats with cloud investigation and response actions in the Microsoft Defender portal.
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
  - m365-security
  - tier1
ms.topic: conceptual
search.appverid: 
  - MOE150
  - MET150
ms.date: 11/18/2024
appliesto:
- ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
- <a href="https://learn.microsoft.com/unified-secops-platform/" target="_blank">Microsoft's unified security operations platform</a>
---
# Investigate and respond to container threats in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information in this article relates to a prereleased product, which may be substantially modified before it’s commercially released. Microsoft makes no warranties expressed or implied, with respect to the information provided here

Security operations can now investigate and respond to container-related alerts in near real-time in the Microsoft Defender portal with the integration of cloud-native response actions and investigation logs to hunt for related activities. The availability of attack paths can also help analysts immediately investigate and address critical security issues to prevent a potential breach.

As organizations use containers and Kubernetes on platforms like Azure Kubernetes Service (AKS), Google Kubernetes Engine (GKE), ad Amazon Elastic Kubernetes Service (EKS), the attack surface expands, increasing security challenges. Containers can also be targeted by threat actors and used for malicious purposes.

Security operations center (SOC) analysts can now easily track container threats with near real-time alerts and immediately respond to these threats by isolating or terminating container pods. This integration allows analysts to instantly mitigate a container attack from their environment in a click.

Analysts can then investigate the full scope of the attack with the ability to hunt for related activities within the incident graph. They can also further apply preventive actions with the availability of potential attack paths in the incident graph. Using the information from the attack paths allows security teams to inspect the paths and prevent possible breaches. In addition, Threat analytics reports specific to container threats and attacks are available for analysts to gain more information and apply recommendations for container attack response and prevention.

## Prerequisites

The following licenses are required to view and resolve container-related alerts in the Microsoft Defender portal:

- [Microsoft Defender for Containers](/azure/defender-for-cloud/defender-for-containers-introduction)
- [Microsoft Defender XDR](prerequisites.md#licensing-requirements)

> [!NOTE]
> The **isolate pod** response action requires a network policy enforcer. Check whether your Kubernetes cluster has a network policy installed.

Users on the [Microsoft Defender for Cloud Security Posture Management](/azure/defender-for-cloud/concept-cloud-security-posture-management) plan can view attack paths in the incident graph.

Users with provisioned access to [Microsoft Security Copilot](/copilot/security/microsoft-security-copilot) can also take advantage of the [guided responses](security-copilot-m365d-guided-response.md) to investigate and remediate container threats.

## Permissions

To perform any of the response actions, users must have the following permissions for Microsoft Defender for Cloud in the Microsoft Defender XDR unified role-based access control:

|Permission name|Level|
|:---|:---|
|Alerts|Manage|
|Response|Manage|

For more information on these permissions, see [Permissions in Microsoft Defender XDR Unified role-based access control (RBAC)](custom-permissions-details.md).

## Investigate container threats

To investigate container threats in the Microsoft Defender portal:

1. Select **Investigation & response > Incidents and alerts** in the left-hand navigation menu to open the incident or alert queues.
2. In the queue, select **Filter** and choose **Microsoft Defender for Cloud > Microsoft Defender for Containers** under Service source.
   :::image type="content" source="/defender/media/defender-containers/incident-queue-small.png" alt-text="Incident queue filtered to show container-related incidents." lightbox="/defender/media/defender-containers/incident-queue.png":::
3. In the incident graph, select the pod/service/cluster entity you need to investigate. Select **Kubernetes service details**, **Kubernetes pod details**, **Kubernetes cluster details**, or **Container registry details** to view relevant information about the service, pod, or registry.

Using [Threat analytics](threat-analytics.md) reports, analysts can utilize threat intelligence from expert Microsoft security researchers to learn about active threat actors and campaigns exploiting containers, new attack techniques that might affect containers, and prevalent threats that affect containers.

Access threat analytics reports from **Threat intelligence > Threat analytics**. You can also open a specific report from the incident page by selecting **View threat analytics report** under **Related threats** on the incident side pane.

:::image type="content" source="/defender/media/defender-containers/view-threat-analytics-small.png" alt-text="Highlighting how to view threat analytics reports from the incident page." lightbox="/defender/media/defender-containers/view-threat-analytics.png":::

Threat analytics reports also contain relevant mitigation, recovery, and prevention methods that analysts can assess and apply to their environment. Using the information in threat analytics reports helps SOC teams defend and protect their environment from container attacks. Here’s an example of an analyst report about a container attack.

:::image type="content" source="/defender/media/defender-containers/threat-analytics-sample-small.png" alt-text="Sample page of a container attack threat analytics report." lightbox="/defender/media/defender-containers/threat-analytics-sample.png":::

## Respond to container threats

You can **isolate** or **terminate** a pod once you determine that a pod is compromised or malicious. In the incident graph, select the pod then go to **Actions** to view the available response actions. You can also find these response actions on the entity side pane.

:::image type="content" source="/defender/media/defender-containers/container-actions-small.png" alt-text="Highlighting the cloud response actions in an incident." lightbox="/defender/media/defender-containers/container-actions.png":::

You can release a pod from isolation with the **release from isolation** action once your investigation is complete. This option appears on the side pane for isolated pods.

Details of all response actions can be viewed in the [Action center](m365d-action-center.md). In the Action center page, select the response action you want to inspect to view more information about the action like which entity was acted on, when the action was done, and view the comments on the action. For isolated pods, the **release from isolation** action is also available in the Action center details pane.

:::image type="content" source="/defender/media/defender-containers/action-center-sample-small.png" alt-text="Sample of cloud response actions listed in the Action center." lightbox="/defender/media/defender-containers/action-center-sample.png":::

## Hunt for container-related activities

To determine the full scope of a container attack, you can deepen your investigation with the **Go hunt** action available in the incident graph. You can immediately view all process events and activities related to container-related incidents from the incident graph.

:::image type="content" source="/defender/media/defender-containers/azure-go-hunt-small.png" alt-text="Highlighting the go hunt action in the incident graph." lightbox="/defender/media/defender-containers/azure-go-hunt.png":::

In the [Advanced hunting](advanced-hunting-overview.md) page, you can extend your search for container-related activities using the **CloudProcessEvents** and **CloudAuditEvents** tables.

The [CloudProcessEvents](advanced-hunting-cloudprocessevents-table.md) table contains information about process events in multi-cloud hosted environments such as Azure Kubernetes Service, Amazon Elastic Kubernetes Service, and Google Kubernetes Engine. On the other hand, the [CloudAuditEvents](advanced-hunting-cloudauditevents-table.md) table contains cloud audit events from cloud platforms protected by Microsoft Defender for Cloud. It also contains Kubeaudit logs, which holds information about Kubernetes-related events.

## See also

- [Microsoft Defender for Containers architecture](/azure/defender-for-cloud/defender-for-containers-architecture?tabs=defender-for-container-arch-aks)
- [Kubeaudit events in advanced hunting](/azure/defender-for-cloud/kubeaudit-events-advanced-hunting)