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
ms.date: 01/07/2025
appliesto:
- ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
- <a href="https://learn.microsoft.com/unified-secops-platform/" target="_blank">Microsoft's unified security operations platform</a>
---
# Investigate and respond to container threats in the Microsoft Defender portal

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

> [!IMPORTANT]
> Some information in this article relates to a prereleased product, which may be substantially modified before it’s commercially released. Microsoft makes no warranties expressed or implied, with respect to the information provided here

Security operations can now investigate and respond to container-related alerts in near real-time and hunt for related activities with the integration of cloud-native response actions and investigation logs in the Microsoft Defender portal. The availability of attack paths can also help analysts immediately investigate and address critical security issues to prevent a potential breach.

As organizations use containers and Kubernetes on platforms like Azure Kubernetes Service (AKS), Google Kubernetes Engine (GKE), ad Amazon Elastic Kubernetes Service (EKS), the attack surface expands, increasing security challenges. Containers can also be targeted by threat actors and used for malicious purposes.

Security operations center (SOC) analysts can now easily track container threats with near real-time alerts and immediately respond to these threats by isolating or terminating container pods. This integration allows analysts to instantly mitigate a container attack from their environment in a click.

Analysts can then investigate the full scope of the attack with the ability to hunt for related activities within the incident graph. They can also further apply preventive actions with the availability of potential attack paths in the incident graph. Using the information from the attack paths allows security teams to inspect the paths and prevent possible breaches. In addition, Threat analytics reports specific to container threats and attacks are available for analysts to gain more information and apply recommendations for container attack response and prevention.

## Prerequisites

Users on AKS, EKS, and GKE platforms can take advantage of the cloud response actions, cloud-related investigation logs, and attack paths in the Microsoft Defender portal with the following licenses:

|Required license|Actions|
|---|---|
|[Microsoft Defender for Containers](/azure/defender-for-cloud/defender-for-containers-introduction)|View container-related alerts </br>View container-related data for investigation in advanced hunting </br>Isolate pod </br>Terminate pod|
|[Microsoft Defender for Cloud Security Posture Management](/azure/defender-for-cloud/concept-cloud-security-posture-management)|View attack paths in the incident graph|
|[Microsoft Security Copilot](/copilot/security/microsoft-security-copilot)|View and apply guided responses to investigate and remediate container threats|

The following Microsoft Defender for Containers are required for the cloud response actions in the Microsoft Defender portal:

-	Defender sensor 
-	Kubernetes API access

For more information about these components, see [Configure Microsoft Defender for Containers components](/azure/defender-for-cloud/defender-for-containers-enable).

### Network policy requirement

The **isolate pod** response action supports Kubernetes cluster version 1.27 and later. The following network plugins are also required:

|Network plugin|Minimum version required|
|---|:---:|
|Azure-NPM|1.5.34|
|Calico|3.24.1|
|Cilium|1.13.1|
|AWS-node|1.15.1|

The **isolate pod** response action requires a network policy enforcer for your Kubernetes cluster. The following documentation provides specific steps on how to install and check network policies depending on your platform:

- Azure Kubernetes Service: [Secure traffic between pods by using network policies in AKS](/azure/aks/use-network-policies)
- Google Kubernetes Engine: [Control communication between Pods and Services using network policies](https://cloud.google.com/kubernetes-engine/docs/how-to/network-policy)
- Amazon Kubernetes Engine: [Limit pod traffic with Kubernetes network policies](https://docs.aws.amazon.com/eks/latest/userguide/cni-network-policy.html)

To verify your network plugins are supported, follow the steps to access your platform's Cloud Shell and check your network plugins in the [Troubleshoot issues](#troubleshoot-issues) section.

The **terminate pod** response action functions regardless of the presence of a network policy.

## Permissions

To perform any of the response actions, users must have the following permissions for Microsoft Defender for Cloud in the Microsoft Defender XDR unified role-based access control:

|Permission name|Level|
|:---|:---:|
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

The [CloudProcessEvents](advanced-hunting-cloudprocessevents-table.md) table contains information about process events in multi-cloud hosted environments such as Azure Kubernetes Service, Amazon Elastic Kubernetes Service, and Google Kubernetes Engine. 

The [CloudAuditEvents](advanced-hunting-cloudauditevents-table.md) table contains cloud audit events from cloud platforms protected by Microsoft Defender for Cloud. It also contains Kubeaudit logs, which holds information about Kubernetes-related events.

## Troubleshoot issues

The following section addresses issues that you might encounter when investigating and responding to container threats. 

### The isolate pod action is not available

If the isolate pod action is grayed out, you need to verify that you have the necessary permissions to perform this action. Refer to the [Permissions](#permissions) section to check and validate that you have the correct permissions.

See [Permissions in Microsoft Defender XDR Unified role-based access control (RBAC)](custom-permissions-details.md) for more information.

### The isolate pod action failed

1. Check the Kubernetes cluster version. The isolate pod action supports Kubernetes clusters from version 1.27 and later.
2. Check that you are using the required network plugins and that it matches the minimum versions supported. To check your plugins, access the Cloud Shell in your platform and run the command to check your network plugins.
3. Ensure the target pod is in a valid or active state.

Learn how to access the Cloud Shell and check your network plugins by following these steps based on your platform:

*On Microsoft Azure*

1. Sign in to the Azure portal then navigate to your cluster.
2. Above the **Essential** information, select **Connect** button and follow the instructions. 
3. The Cloud Shell opens at the bottom of your browser. In the command line interface, run the following command to check your network plugins:

      > kubectl get pods --all-namespaces -o json | jq -r '.items[].metadata.labels["k8s-app"]' | uniq | grep -E 'azure-npm|calico-node|cilium|aws-node' | head -n 1

The results should mention any of the specified plugins in the network policy requirement. An empty line means that the supported plugin is not installed.

*On Google Cloud Platform*

1. Navigate your cluster in Google Cloud Portal. 
2. Select **Connect** above the name of the cluster. In the small window that appears, copy the following command and run it in your local terminal.
	
	  > kubectl get pods --all-namespaces -o json | jq -r '.items[].metadata.labels["k8s-app"]' | uniq | grep -E 'azure-npm|calico-node|cilium|aws-node' | head -n 1
	
3. You can also choose **Run in Cloud Shell** to run a shell session that opens at the bottom of your browser. You can copy the command in the interface to check your network plugins.

The results should mention any of the specified plugins in the network policy requirement. An empty line means that the supported plugin is not installed.

*On Amazon Web Services*

1. Navigate to your cluster in AWS Cloud Portal. 
2. Select **CloudShell** on the top-right corner. A Cloud Shell session opens at the bottom of your browser, which provides a command-line interface to manage your AWS resources.
3. Connect to your cluster by running the following command:</br></br>
    > aws eks --region &lt;cluster region&gt; update-kubeconfig --name &lt;cluster name&gt;**
   
   > [!NOTE]
   > Ensure that the aws-node is deleted or disabled for the Calico and Cilium plugins.

### The terminate pod action failed

You need to confirm that the target pod's state is active or valid. To check if the pod is active, run the following command in the Cloud Shell:

  > kubectl get pod &lt;pod-name&gt;

## See also

- [Microsoft Defender for Containers architecture](/azure/defender-for-cloud/defender-for-containers-architecture?tabs=defender-for-container-arch-aks)
- [Kubeaudit events in advanced hunting](/azure/defender-for-cloud/kubeaudit-events-advanced-hunting)