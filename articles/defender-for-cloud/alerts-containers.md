---
title: Alerts for Kubernetes Clusters
description: This article lists the security alerts for containers and Kubernetes clusters visible in Microsoft Defender for Cloud.
ms.topic: reference
ms.custom: linux-related-content
ms.date: 06/03/2024
ai-usage: ai-assisted
---

# Alerts for Kubernetes Clusters

Defender for Containers provides enhanced alert capabilities for threats to the Kubernetes (K8s) control plane and workload runtime. Microsoft Defender for Endpoint (MDE) and Microsoft Defender Threat Intelligence also detect threats relevant to K8s containers, and combined with the Defender sensor, give enriched context for comprehensive and actionable alerts to safeguard your K8s environment.

## Control plane detection

In Kubernetes, the control plane manages and orchestrates all the resources within the cluster. Defender for Containers identifies potential threats in the control plane that can compromise the security and integrity of the entire cluster by monitoring the activities of the K8s API server. Critical events are captured that indicate potential security threats, such as suspicious operations by service accounts or exposure of services.

Examples of suspicious operations captured by Defender for Containers include:

* **Privileged container deployments** can be a security risk as they grant containers elevated privileges within the host system. Privileged containers are monitored for unauthorized deployments, excessive use of privileges, and potential misconfigurations that could lead to security breaches.
* **Risky service exposures to the public Internet** can expose the Kubernetes cluster to potential attacks. The cluster is monitored for services that are unintentionally exposed, misconfigured with overly permissive access controls, or lacking proper security measures.
* **Suspicious service account activities** can indicate unauthorized access or malicious behavior within the cluster. The cluster is monitored for unusual patterns such as excessive resource requests, unauthorized API calls, or access to sensitive data.

## Workload runtime detection

Defender for Containers uses the [Defender sensor](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters) to monitor the K8s workload runtime activity to detect suspicious operations, including workload process creation events.

Examples of suspicious workload runtime activity include:

* **Web shell activity** - Defender for Containers monitors the activity on the running containers to identify behaviors that resemble web shell invocations.
* **Crypto mining activity** - Defender for Containers uses several heuristics to identify crypto mining activity on the running containers, including suspicious download activity, CPU optimization, suspicious process execution, and more.
* **Network scanning tools** – Defender for Containers identifies usage of scanning tools that have been used for malicious activities.
* **Binary drift detection** - Defender for Cloud identifies execution of workload binaries that have drifted from the original container image. For more information, read about [Binary drift detection](binary-drift-detection.md).

## K8s alerts simulation tool

Defender for Containers provides a tool to simulate various attack scenarios within your K8s environment, causing alerts to be generated. The simulation tool deploys two pods in a target cluster: *attacker* and *victim*. During the simulation, the attacker "attacks" the victim using real-world techniques.

> !Note
> Although the simulation tool doesn't run any malicious components, it's recommended to run it on a dedicated cluster without production workloads.

The simulation tool runs using a Python-based CLI that deploys Helm charts in the target cluster.

### Install the simulation tool

1. Prerequisites:

   * A user with admin permissions over the target cluster.

   * Defender for Containers is enabled and the Defender sensor is also installed. You can check that the Defender sensor is installed by running:
    `kubectl get ds microsoft-defender-collector-ds -n kube-system`

   * A Helm client is installed on your local machine.

   * Python version 3.7 or above is installed on your local machine.

1. Point `kubeconfig` to the target cluster. For Azure Kubernetes Service, you can run:
    `az aks get-credentials --name [cluster-name] --resource-group [resource-group]`

2. Download the simulation tool with the following command:
    `curl -O https://raw.githubusercontent.com/microsoft/Defender-for-Cloud-Attack-Simulation/refs/heads/main/simulation.py`

### Run the simulation tool

1. Run the simulation script with the following command:
    `python simulation.py`

2. Choose a simulated attack scenario or choose to simulate all of the attack scenarios at once. The available simulated attack scenarios are:
    
| Scenario | Expected alerts |
|--|--|
| **Reconnaissance** | Possible Web Shell activity detected <br/> Suspicious Kubernetes service account operation detected <br/> Network scanning tool detected  |
| **Lateral Movement** | Possible Web Shell activity detected <br/> Access to cloud metadata service detected  |
| **Secrets Gathering** | Possible Web Shell activity detected <br/> Sensitive files access detected <br/> Possible secret reconnaissance detected  |
| **Crypto mining** | Possible Web Shell activity detected <br/> Kubernetes CPU optimization detected <br/> Command within a container accessed `ld.so.preload` <br/> Possible Crypto miners download detected <br/> A drift binary detected executing in the container |
| **Web shell** | Possible Web Shell activity detected|

> !Note
> While some alerts are triggered in near real-time, others may take up to an hour.

## Next steps

- [Security alerts in Microsoft Defender for Cloud](alerts-overview.md)
- [Manage and respond to security alerts in Microsoft Defender for Cloud](managing-and-responding-alerts.yml)
- [Continuously export Defender for Cloud data](continuous-export.md)
