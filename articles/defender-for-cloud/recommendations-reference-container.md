---
title: Reference table for all container security recommendations in Microsoft Defender for Cloud
description: This article lists all Microsoft Defender for Cloud container security recommendations that help you harden and protect your resources.
author: dcurwin
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 03/13/2024
ms.author: dacurwin
ms.custom: generated
ai-usage: ai-assisted
---

# Container security recommendations

This article lists all the container security recommendations you might see in Microsoft Defender for Cloud.

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

> [!TIP]
> If a recommendation description says *No related policy*, usually it's because that recommendation is dependent on a different recommendation.
>
> For example, the recommendation *Endpoint protection health failures should be remediated* relies on the recommendation that checks whether an endpoint protection solution is installed (*Endpoint protection solution should be installed*). The underlying recommendation *does* have a policy.
> Limiting policies to only foundational recommendations simplifies policy management.




## Azure container recommendations



### Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed

**Description**: Azure Policy extension for Kubernetes extends [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) v3, an admission controller webhook for [Open Policy Agent](https://www.openpolicyagent.org/) (OPA), to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner.
(No related policy)

**Severity**: High

**Type**: Control plane

### Azure Arc-enabled Kubernetes clusters should have the Defender extension installed

**Description**: Defender's extension for Azure Arc provides threat protection for your Arc-enabled Kubernetes clusters. The extension collects data from all control plane (master) nodes in the cluster and sends it to the [Microsoft Defender for Kubernetes backend](defender-for-containers-enable.md?pivots=defender-for-container-arc&tabs=aks-deploy-portal) in the cloud for further analysis.
(No related policy)

**Severity**: High

**Type**: Control plane

### Azure Kubernetes Service clusters should have Defender profile enabled

**Description**: Microsoft Defender for Containers provides cloud-native Kubernetes security capabilities including environment hardening, workload protection, and run-time protection.
 When you enable the SecurityProfile.AzureDefender profile on your Azure Kubernetes Service cluster, an agent is deployed to your cluster to collect security event data.
Learn more in [Introduction to Microsoft Defender for Containers](defender-for-containers-introduction.md).
(No related policy)

**Severity**: High

**Type**: Control plane

### Azure Kubernetes Service clusters should have the Azure Policy add-on for Kubernetes installed

**Description**: Azure Policy add-on for Kubernetes extends [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) v3, an admission controller webhook for [Open Policy Agent](https://www.openpolicyagent.org/) (OPA), to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner.
Defender for Cloud requires the Add-on to audit and enforce security capabilities and compliance inside your clusters. [Learn more](/azure/governance/policy/concepts/policy-for-kubernetes).
Requires Kubernetes v1.14.0 or later.
(Related policy: [Azure Policy Add-on for Kubernetes service (AKS) should be installed and enabled on your clusters](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f0a15ec92-a229-4763-bb14-0ea34a568f8d)).

**Severity**: High

**Type**: Control plane

### Azure registry container images should have vulnerabilities resolved (powered by Microsoft Defender Vulnerability Management)

**Description**: Container image vulnerability assessment scans your registry for commonly known vulnerabilities (CVEs) and provides a detailed vulnerability report for each image. Resolving vulnerabilities can greatly improve your security posture, ensuring images are safe to use prior to deployment.
(Related policy: [Vulnerabilities in Azure Container Registry images should be remediated](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f5f0f936f-2f01-4bf5-b6be-d423792fa562)).

**Severity**: High

**Type**: Vulnerability Assessment


### Azure registry container images should have vulnerabilities resolved (powered by Qualys)

**Description**: Container image vulnerability assessment scans your registry for security vulnerabilities and exposes detailed findings for each image. Resolving the vulnerabilities can greatly improve your containers' security posture and protect them from attacks.
(Related policy: [Vulnerabilities in Azure Container Registry images should be remediated](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f5f0f936f-2f01-4bf5-b6be-d423792fa562)).

**Assessment key**: dbd0cb49-b563-45e7-9724-889e799fa648

**Type**: Vulnerability Assessment


### Azure running container images should have vulnerabilities resolved (powered by Microsoft Defender Vulnerability Management)

**Description**: Container image vulnerability assessment scans your registry for commonly known vulnerabilities (CVEs) and provides a detailed vulnerability report for each image. This recommendation provides visibility to vulnerable images currently running in your Kubernetes clusters. Remediating vulnerabilities in container images that are currently running is key to improving your security posture, significantly reducing the attack surface for your containerized workloads.

**Severity**: High

**Type**: Vulnerability Assessment


### Azure running container images should have vulnerabilities resolved - (powered by Qualys)

**Description**: Container image vulnerability assessment scans container images running on your Kubernetes clusters for security vulnerabilities and exposes detailed findings for each image. Resolving the vulnerabilities can greatly improve your containers' security posture and protect them from attacks.
(No related policy)

**Assessment key**: 41503391-efa5-47ee-9282-4eff6131462c

**Type**: Vulnerability Assessment


### Container CPU and memory limits should be enforced

**Description**: Enforcing CPU and memory limits prevents resource exhaustion attacks (a form of denial of service attack).

We recommend setting limits for containers to ensure the runtime prevents the container from using more than the configured resource limit.

(Related policy: [Ensure container CPU and memory resource limits do not exceed the specified limits in Kubernetes cluster](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fe345eecc-fa47-480f-9e88-67dcc122b164)).

**Severity**: Medium

**Type**: Kubernetes Data plane

### Container images should be deployed from trusted registries only

**Description**:
Images running on your Kubernetes cluster should come from known and monitored container image registries. Trusted registries reduce your cluster's exposure risk by limiting the potential for the introduction of unknown vulnerabilities, security issues, and malicious images.

(Related policy: [Ensure only allowed container images in Kubernetes cluster](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2ffebd0533-8e55-448f-b837-bd0e06f16469)).

**Severity**: High

**Type**: Kubernetes Data plane

### [Preview] Container images in Azure registry should have vulnerability findings resolved

**Description**: Defender for Cloud scans your registry images for known vulnerabilities (CVEs) and provides detailed findings for each scanned image. Scanning and remediating vulnerabilities for container images in the registry helps maintain a secure and reliable software supply chain, reduces the risk of security incidents, and ensures compliance with industry standards.

Recommendation Azure registry container images should have vulnerabilities resolved (powered by Microsoft Defender Vulnerability Management) will be removed when the new recommendation is generally available.

The new recommendation is in preview and not used for secure score calculation.

**Severity**: High

**Type**: Vulnerability Assessment

### (Enable if required) Container registries should be encrypted with a customer-managed key (CMK)

**Description**: Recommendations to use customer-managed keys for encryption of data at rest are not assessed by default, but are available to enable for applicable scenarios. Data is encrypted automatically using platform-managed keys, so the use of customer-managed keys should only be applied when obligated by compliance or restrictive policy requirements.
To enable this recommendation, navigate to your Security Policy for the applicable scope, and update the *Effect* parameter for the corresponding policy to audit or enforce the use of customer-managed keys. Learn more in [Manage security policies](tutorial-security-policy.md).
Use customer-managed keys to manage the encryption at rest of the contents of your registries. By default, the data is encrypted at rest with service-managed keys, but customer-managed keys (CMK) are commonly required to meet regulatory compliance standards. CMKs enable the data to be encrypted with an Azure Key Vault key created and owned by you. You have full control and responsibility for the key lifecycle, including rotation and management. Learn more about CMK encryption at [Overview of customer-managed keys](/azure/container-registry/tutorial-customer-managed-keys).
(Related policy: [Container registries should be encrypted with a customer-managed key (CMK)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f5b9159ae-1701-4a6f-9a7a-aa9c8ddd0580)).

**Severity**: Low

**Type**: Control plane

### Container registries should not allow unrestricted network access

**Description**: Azure container registries by default accept connections over the internet from hosts on any network. To protect your registries from potential threats, allow access from only specific public IP addresses or address ranges. If your registry doesn't have an IP/firewall rule or a configured virtual network, it will appear in the unhealthy resources. Learn more about Container Registry network rules at [Configure public IP network rules](/azure/container-registry/container-registry-access-selected-networks) and [Restrict access to a container registry using a service endpoint in an Azure virtual network](/azure/container-registry/container-registry-vnet).
(Related policy: [Container registries should not allow unrestricted network access](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fd0793b48-0edc-4296-a390-4c75d1bdfd71)).

**Severity**: Medium

**Type**: Control plane


### Container registries should use private link

**Description**: Azure Private Link lets you connect your virtual network to Azure services without a public IP address at the source or destination. The private link platform handles the connectivity between the consumer and services over the Azure backbone network. By mapping private endpoints to your container registries instead of the entire service, you'll also be protected against data leakage risks. Learn more at: <https://aka.ms/acr/private-link>.
(Related policy: [Container registries should use private link](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fe8eef0a8-67cf-4eb4-9386-14b0e78733d4)).

**Severity**: Medium

**Type**: Control plane

### [Preview] Containers running in Azure should have vulnerability findings resolved

**Description**: Defender for Cloud creates an inventory of all container workloads currently running in your Kubernetes clusters, and provides vulnerability reports for those workloads by matching the images and the vulnerability reports created for the registry images. Scanning and remediating vulnerabilities of container workloads is critical to ensure a robust and secure software supply chain, reduce the risk of security incidents, and ensures compliance with industry standards.

The new recommendation is in preview and not used for secure score calculation.

> [!NOTE]
> Starting October 6, 2024, this recommendation was updated to report only a single container for each root controller. For example, if a cronjob creates multiple jobs, where each job is creating a pod with a vulnerable container, the recommendation will only report a single instance of the vulnerable containers within that job. This change will assist in removing duplicate reporting for identical containers that requires a single action for remediation. If you used this recommendation prior to the change, you should expect a reduction in the number of instances of this recommendation.  
> To support this improvement the assessment key for this recommendation has been updated to `c5045ea3-afc6-4006-ab8f-86c8574dbf3d`. If you are currently retrieving vulnerability reports from this recommendation via API, ensure you change the API call to use the new assessment key.

**Severity**: High

**Type**: Vulnerability Assessment

### Containers sharing sensitive host namespaces should be avoided

**Description**: To protect against privilege escalation outside the container, avoid pod access to sensitive host namespaces (host process ID and host IPC) in a Kubernetes cluster.
(Related policy: [Kubernetes cluster containers should not share host process ID or host IPC namespace](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f47a1ee2f-2a2a-4576-bf2a-e0e36709c2b8)).

**Severity**: Medium

**Type**: Kubernetes data plane

### Containers should only use allowed AppArmor profiles

**Description**: Containers running on Kubernetes clusters should be limited to allowed AppArmor profiles only.
AppArmor (Application Armor) is a Linux security module that protects an operating system and its applications from security threats. To use it, a system administrator associates an AppArmor security profile with each program.
(Related policy: [Kubernetes cluster containers should only use allowed AppArmor profiles](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f511f5417-5d12-434d-ab2e-816901e72a5e)).

**Severity**: High

**Type**: Kubernetes data plane


### Container with privilege escalation should be avoided

**Description**: Containers shouldn't run with privilege escalation to root in your Kubernetes cluster.
The AllowPrivilegeEscalation attribute controls whether a process can gain more privileges than its parent process.
(Related policy: [Kubernetes clusters should not allow container privilege escalation](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f1c6e92c9-99f0-4e55-9cf2-0c234dc48f99)).

**Severity**: Medium

**Type**: Kubernetes data plane

### Diagnostic logs in Kubernetes services should be enabled

**Description**: Enable diagnostic logs in your Kubernetes services and retain them up to a year. This enables you to recreate activity trails for investigation purposes when a security incident occurs.
(No related policy)

**Severity**: Low

**Type**: Control plane

### Immutable (read-only) root filesystem should be enforced for containers

**Description**: Containers should run with a read only root file system in your Kubernetes cluster. Immutable filesystem protects containers from changes at run-time with malicious binaries being added to PATH.
(Related policy: [Kubernetes cluster containers should run with a read only root file system](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fdf49d893-a74c-421d-bc95-c663042e5b80)).

**Severity**: Medium

**Type**: Kubernetes data plane

### Kubernetes API server should be configured with restricted access

**Description**: To ensure that only applications from allowed networks, machines, or subnets can access your cluster, restrict access to your Kubernetes API server. You can restrict access by defining authorized IP ranges, or by setting up your API servers as private clusters as explained in [Create a private Azure Kubernetes Service cluster](/azure/aks/private-clusters).
(Related policy: [Authorized IP ranges should be defined on Kubernetes Services](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f0e246bcf-5f6f-4f87-bc6f-775d4712c7ea)).

**Severity**: High

**Type**: Control plane

### Kubernetes clusters should be accessible only over HTTPS

**Description**: Use of HTTPS ensures authentication and protects data in transit from network layer eavesdropping attacks. This capability is currently generally available for Kubernetes Service (AKS), and in preview for AKS Engine and Azure Arc-enabled Kubernetes. For more info, visit <https://aka.ms/kubepolicydoc>
(Related policy: [Enforce HTTPS ingress in Kubernetes cluster](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f1a5b4dca-0b6f-4cf5-907c-56316bc1bf3d)).

**Severity**: High

**Type**: Kubernetes Data plane

### Kubernetes clusters should disable automounting API credentials

**Description**: Disable automounting API credentials to prevent a potentially compromised Pod resource to run API commands against Kubernetes clusters. For more information, see <https://aka.ms/kubepolicydoc>.
(Related policy: [Kubernetes clusters should disable automounting API credentials](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f423dd1ba-798e-40e4-9c4d-b6902674b423)).

**Severity**: High

**Type**: Kubernetes Data plane

### Kubernetes clusters should not grant CAPSYSADMIN security capabilities

**Description**: To reduce the attack surface of your containers, restrict CAP_SYS_ADMIN Linux capabilities. For more information, see <https://aka.ms/kubepolicydoc>.
(No related policy)

**Severity**: High

**Type**: Kubernetes data plane

### Kubernetes clusters should not use the default namespace

**Description**: Prevent usage of the default namespace in Kubernetes clusters to protect against unauthorized access for ConfigMap, Pod, Secret, Service, and ServiceAccount resource types. For more information, see <https://aka.ms/kubepolicydoc>.
(Related policy: [Kubernetes clusters should not use the default namespace](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f9f061a12-e40d-4183-a00e-171812443373)).

**Severity**: Low

**Type**: Kubernetes data plane

### Least privileged Linux capabilities should be enforced for containers

**Description**: To reduce attack surface of your container, restrict Linux capabilities and grant specific privileges to containers without granting all the privileges of the root user. We recommend dropping all capabilities, then adding those that are required
(Related policy: [Kubernetes cluster containers should only use allowed capabilities](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fc26596ff-4d70-4e6a-9a30-c2506bd2f80c)).

**Severity**: Medium

**Type**: Kubernetes data plane


### Microsoft Defender for Containers should be enabled

**Description**: Microsoft Defender for Containers provides hardening, vulnerability assessment and run-time protections for your Azure, hybrid, and multicloud Kubernetes environments.
You can use this information to quickly remediate security issues and improve the security of your containers.

Remediating this recommendation will result in charges for protecting your Kubernetes clusters. If you don't have any Kubernetes clusters in this subscription, no charges will be incurred.
If you create any Kubernetes clusters on this subscription in the future, they'll automatically be protected and charges will begin at that time.
Learn more in [Introduction to Microsoft Defender for Containers](container-security.md).
(No related policy)

**Severity**: High

**Type**: Control plane

### Privileged containers should be avoided

**Description**: To prevent unrestricted host access, avoid privileged containers whenever possible.

Privileged containers have all of the root capabilities of a host machine. They can be used as entry points for attacks and to spread malicious code or malware to compromised applications, hosts, and networks.
(Related policy: [Do not allow privileged containers in Kubernetes cluster](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f95edb821-ddaf-4404-9732-666045e056b4)).

**Severity**: Medium

**Type**: Kubernetes data plane

### Role-Based Access Control should be used on Kubernetes Services

**Description**: To provide granular filtering on the actions that users can perform, use [Role-Based Access Control (RBAC)](/azure/aks/concepts-identity#azure-role-based-access-control) to manage permissions in Kubernetes Service Clusters and configure relevant authorization policies.
(Related policy: [Role-Based Access Control (RBAC) should be used on Kubernetes Services](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2fac4a19c2-fa67-49b4-8ae5-0b2e78c49457)).

**Severity**: High

**Type**: Control plane

### Running containers as root user should be avoided

**Description**: Containers shouldn't run as root users in your Kubernetes cluster. Running a process as the root user inside a container runs it as root on the host. If there's a compromise, an attacker has root in the container, and any misconfigurations become easier to exploit.
(Related policy: [Kubernetes cluster pods and containers should only run with approved user and group IDs](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2ff06ddb64-5fa3-4b77-b166-acb36f7f6042)).

**Severity**: High

**Type**: Kubernetes Data plane

### Services should listen on allowed ports only

**Description**: To reduce the attack surface of your Kubernetes cluster, restrict access to the cluster by limiting services access to the configured ports.
(Related policy: [Ensure services listen only on allowed ports in Kubernetes cluster](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f233a2a17-77ca-4fb1-9b6b-69223d272a44)).

**Severity**: Medium

**Type**: Kubernetes data plane

### Usage of host networking and ports should be restricted

**Description**: Restrict pod access to the host network and the allowable host port range in a Kubernetes cluster. Pods created with the hostNetwork attribute enabled will share the node's network space. To avoid compromised container from sniffing network traffic, we recommend not putting your pods on the host network. If you need to expose a container port on the node's network, and using a Kubernetes Service node port does not meet your needs, another possibility is to specify a hostPort for the container in the pod spec.
(Related policy: [Kubernetes cluster pods should only use approved host network and port range](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f82985f06-dc18-4a48-bc1c-b9f4f0098cfe)).

**Severity**: Medium

**Type**: Kubernetes data plane

### Usage of pod HostPath volume mounts should be restricted to a known list to restrict node access from compromised containers

**Description**: We recommend limiting pod HostPath volume mounts in your Kubernetes cluster to the configured allowed host paths. If there's a compromise, the container node access from the containers should be restricted.
(Related policy: [Kubernetes cluster pod hostPath volumes should only use allowed host paths](https://portal.azure.com/#blade/Microsoft_Azure_Policy/PolicyDetailBlade/definitionId/%2fproviders%2fMicrosoft.Authorization%2fpolicyDefinitions%2f098fc59e-46c7-4d99-9b16-64990e543d75)).

**Severity**: Medium

**Type**: Kubernetes Data plane



## AWS container recommendations

### [Preview] Container images in AWS registry should have vulnerability findings resolved

**Description**: Defender for Cloud scans your registry images for known vulnerabilities (CVEs) and provides detailed findings for each scanned image. Scanning and remediating vulnerabilities for container images in the registry helps maintain a secure and reliable software supply chain, reduces the risk of security incidents, and ensures compliance with industry standards.

Recommendation AWS registry container images should have vulnerability findings resolved (powered by Microsoft Defender Vulnerability Management) will be removed by the new recommendation is generally available. 

The new recommendation is in preview and not used for secure score calculation.

**Severity**: High

**Type**: Vulnerability Assessment

### [Preview] Containers running in AWS should have vulnerability findings resolved

**Description**: Defender for Cloud creates an inventory of all container workloads currently running in your Kubernetes clusters and provides vulnerability reports for those workloads by matching the images and the vulnerability reports created for the registry images. Scanning and remediating vulnerabilities of container workloads is critical to ensure a robust and secure software supply chain, reduce the risk of security incidents, and ensures compliance with industry standards.

The new recommendation is in preview and not used for secure score calculation.

> [!NOTE]
> Starting October 6, 2024, this recommendation was updated to report only a single container for each root controller. For example, if a cronjob creates multiple jobs, where each job is creating a pod with a vulnerable container, the recommendation will only report a single instance of the vulnerable containers within that job. This change will assist in removing duplicate reporting for identical containers that requires a single action for remediation. If you used this recommendation prior to the change, you should expect a reduction in the number of instances of this recommendation.  
> To support this improvement the assessment key for this recommendation has been updated to `8749bb43-cd24-4cf9-848c-2a50f632043c`. If you are currently retrieving vulnerability reports from this recommendation via API, ensure you update the API call to use the new assessment key.

**Severity**: High

**Type**: Vulnerability Assessment

### EKS clusters should grant the required AWS permissions to Microsoft Defender for Cloud

**Description**: Microsoft Defender for Containers provides protections for your EKS clusters.
 To monitor your cluster for security vulnerabilities and threats, Defender for Containers needs permissions for your AWS account. These permissions are used to enable Kubernetes control plane logging on your cluster and establish a reliable pipeline between your cluster and Defender for Cloud's backend in the cloud.
 Learn more about [Microsoft Defender for Cloud's security features for containerized environments](defender-for-containers-introduction.md).

**Severity**: High

### EKS clusters should have Microsoft Defender's extension for Azure Arc installed

**Description**: Microsoft Defender's [cluster extension](/azure/azure-arc/kubernetes/extensions) provides security capabilities for your EKS clusters. The extension collects data from a cluster and its nodes to identify security vulnerabilities and threats.
 The extension works with [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview).
Learn more about [Microsoft Defender for Cloud's security features for containerized environments](defender-for-containers-introduction.md?tabs=defender-for-container-arch-aks).

**Severity**: High

### Microsoft Defender for Containers should be enabled on AWS connectors

**Description**: Microsoft Defender for Containers provides real-time threat protection for containerized environments and generates alerts about suspicious activities.
Use this information to harden the security of Kubernetes clusters and remediate security issues.

When you enable Microsoft Defender for Containers and deploy Azure Arc to your EKS clusters, the protections - and charges - will begin. If you don't deploy Azure Arc on a cluster, Defender for Containers won't protect it, and no charges are incurred for this Microsoft Defender plan for that cluster.

**Severity**: High

### Data plane recommendations

All the [Kubernetes data plane security recommendations](kubernetes-workload-protections.md#view-and-configure-the-bundle-of-recommendations) are supported for AWS after you [enable Azure Policy for Kubernetes](kubernetes-workload-protections.md#enable-kubernetes-data-plane-hardening).


## GCP container recommendations

### Advanced configuration of Defender for Containers should be enabled on GCP connectors

**Description**: Microsoft Defender for Containers provides cloud-native Kubernetes security capabilities including environment hardening, workload protection, and run-time protection. To ensure you the solution is provisioned properly, and the full set of capabilities are available, enable all advanced configuration settings.

**Severity**: High


### [Preview] Container images in GCP registry should have vulnerability findings resolved

**Description**: Defender for Cloud scans your registry images for known vulnerabilities (CVEs) and provides detailed findings for each scanned image. Scanning and remediating vulnerabilities for container images in the registry helps maintain a secure and reliable software supply chain, reduces the risk of security incidents, and ensures compliance with industry standards.

Recommendation GCP registry container images should have vulnerability findings resolved (powered by Microsoft Defender vulnerability Management will be removed when the new recommendation is generally available. 

The new recommendation is in preview and not used for secure score calculation.

**Severity**: High

**Type**: Vulnerability Assessment

### [Preview] Containers running in GCP should have vulnerability findings resolved

**Description**: Defender for Cloud creates an inventory of all container workloads currently running in your Kubernetes clusters and provides vulnerability reports for those workloads by matching the images and the vulnerability reports created for the registry images. Scanning and remediating vulnerabilities of container workloads is critical to ensure a robust and secure software supply chain, reduce the risk of security incidents, and ensures compliance with industry standards.

The new recommendation is in preview and not used for secure score calculation.

> [!NOTE]
> Starting October 6, 2024, this recommendation was updated to report only a single container for each root controller. For example, if a cronjob creates multiple jobs, where each job is creating a pod with a vulnerable container, the recommendation will only report a single instance of the vulnerable containers within that job. This change will assist in removing duplicate reporting for identical containers that requires a single action for remediation. If you used this recommendation prior to the change, you should expect a reduction in the number of instances of this recommendation.  
> To support this improvement the assessment key for this recommendation has been updated to `1b3abfa4-9e53-46f1-9627-51f2957f8bba`. If you are currently retrieving vulnerability reports from this recommendation via API, ensure you update the API call to use the new assessment key.

**Severity**: High

**Type**: Vulnerability Assessment

### GKE clusters should have Microsoft Defender's extension for Azure Arc installed

**Description**: Microsoft Defender's [cluster extension](/azure/azure-arc/kubernetes/extensions) provides security capabilities for your GKE clusters. The extension collects data from a cluster and its nodes to identify security vulnerabilities and threats.
 The extension works with [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview).
Learn more about [Microsoft Defender for Cloud's security features for containerized environments](defender-for-containers-introduction.md?tabs=defender-for-container-arch-aks).

**Severity**: High

### GKE clusters should have the Azure Policy extension installed

**Description**: Azure Policy extension for Kubernetes extends [Gatekeeper](https://github.com/open-policy-agent/gatekeeper) v3, an admission controller webhook for [Open Policy Agent](https://www.openpolicyagent.org/) (OPA), to apply at-scale enforcements and safeguards on your clusters in a centralized, consistent manner.
 The extension works with [Azure Arc-enabled Kubernetes](/azure/azure-arc/kubernetes/overview).

**Severity**: High

### Microsoft Defender for Containers should be enabled on GCP connectors

**Description**: Microsoft Defender for Containers provides cloud-native Kubernetes security capabilities including environment hardening, workload protection, and run-time protection. Enable Containers plan on your GCP connector, to harden the security of Kubernetes clusters and remediate security issues. Learn more about Microsoft Defender for Containers.

**Severity**: High

### GKE cluster's auto repair feature should be enabled

**Description**: This recommendation evaluates the management property of a node pool for the key-value pair, ```key: autoRepair, value: true```.

**Severity**: Medium

### GKE cluster's auto upgrade feature should be enabled

**Description**: This recommendation evaluates the management property of a node pool for the key-value pair, ```key: autoUpgrade, value: true```.

**Severity**: High

### Monitoring on GKE clusters should be enabled

**Description**: This recommendation evaluates whether the monitoringService property of a cluster contains the location Cloud Monitoring should use to write metrics.

**Severity**: Medium

### Logging for GKE clusters should be enabled

**Description**: This recommendation evaluates whether the loggingService property of a cluster contains the location Cloud Logging should use to write logs.

**Severity**: High

### GKE web dashboard should be disabled

**Description**: This recommendation evaluates the kubernetesDashboard field of the addonsConfig property for the key-value pair, 'disabled': false.

**Severity**: High

### Legacy Authorization should be disabled on GKE clusters

**Description**: This recommendation evaluates the legacyAbac property of a cluster for the key-value pair, 'enabled': true.

**Severity**: High

### Control Plane Authorized Networks should be enabled on GKE clusters

**Description**: This recommendation evaluates the masterAuthorizedNetworksConfig property of a cluster for the key-value pair, 'enabled': false.

**Severity**: High

### GKE clusters should have alias IP ranges enabled

**Description**: This recommendation evaluates whether the useIPAliases field of the ipAllocationPolicy in a cluster is set to false.

**Severity**: Low

### GKE clusters should have Private clusters enabled

**Description**: This recommendation evaluates whether the enablePrivateNodes field of the privateClusterConfig property is set to false.

**Severity**: High

### Network policy should be enabled on GKE clusters

**Description**: This recommendation evaluates the networkPolicy field of the addonsConfig property for the key-value pair, 'disabled': true.

**Severity**: Medium

## Data plane recommendations

All the [Kubernetes data plane security recommendations](kubernetes-workload-protections.md#view-and-configure-the-bundle-of-recommendations) are supported for GCP after you [enable Azure Policy for Kubernetes](kubernetes-workload-protections.md#enable-kubernetes-data-plane-hardening).

## External container registries recommendations

### [Preview] Container images in Docker Hub registry should have vulnerability findings resolved

**Description**: Defender for Cloud scans your registry images for known vulnerabilities (CVEs) and provides detailed findings for each scanned image. Remediating vulnerabilities in container images helps maintain a secure and reliable software supply chain, reduces the risk of security incidents, and ensures compliance with industry standards.",

**Severity**: High

**Type**: Vulnerability Assessment

### [Preview] Container images in Jfrog Artifactory registry should have vulnerability findings resolved

**Description**: Defender for Cloud scans your registry images for known vulnerabilities (CVEs) and provides detailed findings for each scanned image. Remediating vulnerabilities in container images helps maintain a secure and reliable software supply chain, reduces the risk of security incidents, and ensures compliance with industry standards.",

**Severity**: High

**Type**: Vulnerability Assessment

## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)
