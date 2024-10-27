---
title: Alerts for Kubernetes Clusters
description: This article lists the security alerts for containers and Kubernetes clusters visible in Microsoft Defender for Cloud.
ms.topic: reference
ms.custom: linux-related-content
ms.date: 06/03/2024
ai-usage: ai-assisted
---

# Alerts for Kubernetes Clusters

This document describes the Defender for Containers (MDC Containers) enhanced alert capabilities for threats to Kubernetes (K8s) services control plane and workload runtime. MDC Containers uses Microsoft Defender for Endpoint (MDE) and Microsoft Defender Threat Intelligence to provide comprehensive and actionable alerts to safeguard your K8s environment.

## Control plane detection

The activities of the K8s API server are continuously monitored, based on the K8s audit log.  Critical events are captured that indicate potential security threats, such as suspicious operations by service accounts or exposure of services.

Examples of suspicious operations captured by MDC Containers include:

* Privileged container deployments
* Risky service exposures to the public Internet
* Suspicious service account activities

## Workload runtime detection

MDC Containers monitors the K8s workload runtime activity to detect suspicious operations, including workload process creation events and workload DNS activity.

Examples of suspicious workload runtime activity include:

* Web shell activity
* Crypto mining activity
* Binary drift
* Workload activity detected by the MDE detection library

## K8s alerts simulation tool

MDC Containers provides a tool to simulate various attack scenarios within your K8s environment, causing alerts to be generated. The simulation tool deploys two pods in a target cluster: *attacker* and *victim*. During the simulation, the attacker "attacks" the victim using real-world techniques.

> !Note
> Although the simulation tool doesn't run any malicious components, it's recommended to run it on a dedicated cluster without production workloads.

The simulation tool runs on your local machine using a Python-based CLI that deploys Helm charts in the target cluster.

### Install the simulation tool

1. Prerequisites:

   * A user with admin permissions over the target cluster.

   * MDC Containers is enabled. Make sure the MDC Containers is running the target cluster.

   * A Helm client is installed on your local machine.

   * Python version 3.7 or above is installed on your local machine.

1. Point `kubeconfig` to the target cluster. For Azure Kubernetes Service, you can run:
    `az aks get-credentials --name [cluster-name] --resource-group [resource-group]`

1. Download the simulation tool with the following command:
    `curl -O https://raw.githubusercontent.com/microsoft/Defender-for-Cloud-Attack-Simulation/refs/heads/main/simulation.py`

### Run the simulation tool

1. Run the simulation script with the following command:
    `./simulation.py`

2. Choose a simulated attack scenario or choose to simulate all of the attack scenarios at once. The available simulated attack scenarios are:
    
| Scenario | Expected alerts |
|--|--|
| **Reconnaissance** | Possible Web Shell activity detected <br/> Suspicious access to workload identity token or service account token detected <br/> Suspicious Kubernetes service account operation detected <br/> Network scanning tool detected  |
| **Lateral Movement** | Possible Web Shell activity detected <br/> Access to cloud metadata service detected  |
| **Secrets Gathering** | Possible Web Shell activity detected <br/> Sensitive files access detected <br/> Suspicious access to workload identity token or service account token detected <br/> Possible secret reconnaissance detected  |
| **Crypto mining** | Possible Web Shell activity detected <br/> Kubernetes CPU optimization detected <br/> Command within a container accessed `ld.so.preload` <br/> Possible Crypto miners download detected <br/> A drift binary detected executing in the container <br/> Digital currency mining related behavior detected |
| **Web shell** | Possible Web Shell activity detected|

## Next steps

- [Security alerts in Microsoft Defender for Cloud](alerts-overview.md)
- [Manage and respond to security alerts in Microsoft Defender for Cloud](managing-and-responding-alerts.yml)
- [Continuously export Defender for Cloud data](continuous-export.md)
