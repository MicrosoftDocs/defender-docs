---
title: Overview of Microsoft Defender for Containers
description: Learn about Microsoft Defender for Containers, a cloud-native solution that secures your containerized assets across multicloud and on-premises environments.
ms.topic: overview
author: dcurwin
ms.author: dacurwin
ms.date: 03/10/2025
#customer intent: As a security admin, I want to understand container security to protect my containerized assets.
---

# Container protection in Defender for Cloud

Microsoft Defender for Containers is a cloud-native solution to enhance, monitor, and maintain the security of your containerized assets (Kubernetes clusters, nodes, workloads, registries, images, and more) and their applications across multicloud and on-premises environments.

Defender for Containers assists you with four core domains of container security:

- [**Security posture management**](#security-posture-management) runs continuous monitoring of cloud APIs, Kubernetes APIs, and Kubernetes workloads to discover cloud resources, provide comprehensive inventory capabilities, detect misconfigurations with mitigation guidelines, provide contextual risk assessment, and empowers users to perform enhanced risk hunting capabilities through the Defender for Cloud security explorer.

- [**Vulnerability assessment**](#vulnerability-assessment) -  performs agentless vulnerability assessment of [container registry images, running containers, and supported K8s nodes](support-matrix-defender-for-containers.md) with remediation guidelines, zero configuration, daily re-scans, coverage for OS and language packages, and exploitability insights. The vulnerability findings artifact is signed with a Microsoft certificate for integrity and authenticity and is associated with the container image in the registry for validation needs.

- [**Run-time threat protection**](#run-time-protection-for-kubernetes-nodes-and-clusters) - a rich threat detection suite for Kubernetes clusters, nodes, and workloads, powered by Microsoft leading threat intelligence, provides mapping to MITRE ATT&CK framework for easy understanding of risk and relevant context, and automated response. Security operators can also investigate and respond to threats to Kubernetes services through the [Microsoft Defender XDR portal](/defender-xdr/investigate-respond-container-threats).

- **Deployment & monitoring** - Monitors your Kubernetes clusters for missing sensors and provides frictionless at-scale deployment for sensor-based capabilities, support for standard Kubernetes monitoring tools, and management of unmonitored resources.

You can learn more by watching this video from the Defender for Cloud in the Field video series: [Microsoft Defender for Containers](episode-three.md).

## Microsoft Defender for Containers plan availability

| Aspect | Details |
|--|--|
| Release state: | General availability (GA)<br> Certain features are in preview. For a full list, see the [containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md)|
| Feature availability | Refer to the [Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md) for additional information on feature release state and availability|
| Pricing: | **Microsoft Defender for Containers** is billed as shown on the [pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/) |
| Required roles and permissions: | * To deploy the required components, see the [permissions for each of the components](monitoring-components.md#defender-for-containers-extensions)<br> * **Security admin** can dismiss alerts<br> * **Security reader** can view vulnerability assessment findings<br> See also [Roles for remediation](permissions.md#roles-used-to-automatically-configure-agents-and-extensions) and [Azure Container Registry roles and permissions](/azure/container-registry/container-registry-roles) |
| Clouds: | View the [containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md) to see cloud availability.|

## Security posture management

### Agentless capabilities

- **Agentless discovery for Kubernetes** - provides zero footprint, API-based discovery of your Kubernetes clusters, configurations, and deployments.

- **Agentless vulnerability assessment** - provides vulnerability assessment for [cluster nodes](kubernetes-nodes-va.md) and for [all container images](agentless-vulnerability-assessment-azure.md), including recommendations for registry and runtime, quick scans of new images, daily refresh of results, exploitability insights, and more. Vulnerability information is added to the security graph for contextual risk assessment and calculation of attack paths, and hunting capabilities.

- **Comprehensive inventory capabilities**  - enables you to explore resources, pods, services, repositories, images, and configurations through [security explorer](how-to-manage-cloud-security-explorer.md#build-a-query-with-the-cloud-security-explorer) to easily monitor and manage your assets.

- **[Enhanced risk-hunting](how-to-manage-cloud-security-explorer.md)** - enables security admins to actively hunt for posture issues in their containerized assets through queries (built-in and custom) and [security insights](attack-path-reference.md#insights) in the [security explorer](how-to-manage-cloud-security-explorer.md)

- **Control plane hardening** - continuously assesses the configurations of your clusters and compares them with the initiatives applied to your subscriptions. When it finds misconfigurations, Defender for Cloud generates security recommendations that are available on Defender for Cloud's Recommendations page. The recommendations let you investigate and remediate issues.

  You can use the resource filter to review the outstanding recommendations for your container-related resources, whether in asset inventory or the recommendations page:

  For details included with this capability, review [container recommendations](recommendations-reference-container.md ), and look for recommendations with type "Control plane"

### Sensor-based capabilities

**Binary drift detection** - Defender for Containers provides a sensor-based capability that alerts you about potential security threats by detecting unauthorized external processes within containers. You can define drift policies to specify conditions under which alerts should be generated, helping you distinguish between legitimate activities and potential threats. For more information, see [Binary drift protection (preview)](binary-drift-detection.md).

**Kubernetes data plane hardening** - To protect the workloads of your Kubernetes containers with best practice recommendations, you can install the [Azure Policy for Kubernetes](/azure/governance/policy/concepts/policy-for-kubernetes). Learn more about [monitoring components](monitoring-components.md) for Defender for Cloud.

With the policies defined for your Kubernetes cluster, every request to the Kubernetes API server is monitored against the predefined set of best practices before being persisted to the cluster. You can then configure it to enforce the best practices and mandate them for future workloads.

For example, you can mandate that privileged containers shouldn't be created, and any future requests to do so are blocked.

You can learn more about [Kubernetes data plane hardening](kubernetes-workload-protections.md).

## Vulnerability assessment

Defender for Containers scans the cluster node OS and application software, container images in Azure Container Registry (ACR), Amazon AWS Elastic Container Registry (ECR), Google Artifact Registry (GAR), Google Container Registry (GCR), and [supported external image registries](support-matrix-defender-for-containers.md#vulnerability-assessment-va-features) to provide agentless vulnerability assessment.

Now for [public preview in the AKS environment](agentless-vulnerability-assessment-azure.md#how-vulnerability-assessment-for-images-and-containers-works), Defender for Containers also performs a daily scan of all running containers to provide an updated vulnerability assessment, agnostic to the container's image registry.

Vulnerability information powered by Microsoft Defender Vulnerability Management is added to the [cloud security graph](concept-attack-path.md#what-is-cloud-security-graph) for contextual risk, calculation of attack paths, and hunting capabilities.

Learn more about [vulnerability assessments for Defender for Containers supported environments](agentless-vulnerability-assessment-azure.md), including [vulnerability assessment for cluster nodes.](kubernetes-nodes-va.md)

## Run-time protection for Kubernetes nodes and clusters

Defender for Containers provides real-time threat protection for [supported containerized environments](support-matrix-defender-for-containers.md#runtime-protection-features) and generates alerts for suspicious activities. You can use this information to quickly remediate security issues and improve the security of your containers.

Threat protection is provided for Kubernetes at the cluster, node, and workload levels. Both sensor-based coverage that requires the [Defender sensor](defender-for-cloud-glossary.md#defender-sensor) and agentless coverage based on analysis of the Kubernetes audit logs are used to detect threats. Security alerts are only triggered for actions and deployments that occur after you enable Defender for Containers on your subscription.

Examples of security events that Microsoft Defenders for Containers monitors include:

- Exposed Kubernetes dashboards
- Creation of high privileged roles
- Creation of sensitive mounts

For more information about alerts detected by Defender for Containers, including an alert simulation tool, see [alerts for Kubernetes clusters](alerts-containers.md).

Defender for Containers includes threat detection with over 60 Kubernetes-aware analytics, AI, and anomaly detections based on your runtime workload.

Defender for Cloud monitors the attack surface of multicloud Kubernetes deployments based on the [MITRE ATT&CK&reg; matrix for Containers](https://www.microsoft.com/security/blog/2021/04/29/center-for-threat-informed-defense-teams-up-with-microsoft-partners-to-build-the-attck-for-containers-matrix/), a framework developed by the [Center for Threat-Informed Defense](https://mitre-engenuity.org/cybersecurity/center-for-threat-informed-defense/) in close partnership with Microsoft.

Defender for Cloud is [integrated with Microsoft Defender XDR](concept-integration-365.md). When Defender for Containers is enabled, security operators can use [Defender XDR to investigate and respond](/defender-xdr/investigate-respond-container-threats) to security issues in supported Kubernetes services.

## Learn more

Learn more about Defender for Containers in the following blogs:

- [Introducing Microsoft Defender for Containers](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/introducing-microsoft-defender-for-containers/ba-p/2952317)
- [Demonstrating Microsoft Defender for Cloud](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/how-to-demonstrate-the-new-containers-features-in-microsoft/ba-p/3281172)

## Next steps

In this overview, you learned about the core elements of container security in Microsoft Defender for Cloud. To enable the plan, see:

- [Enable Defender for Containers](defender-for-containers-enable.md)
- Check out [common questions](faq-defender-for-containers.yml) about Defender for Containers.
