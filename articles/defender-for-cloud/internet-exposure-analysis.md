---
title: Internet exposure analysis
description: Learn how Defender for Cloud can gather information about your multicloud compute resources without installing an agent on your machines.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 12/15/2024
ms.custom: template-concept
#customer intent: As a user, I want to understand how internet exposure analysis works in Defender for Cloud so that I can effectively limit my risks.
---

# Internet exposure analysis

Internet exposure analysis in Microsoft Defender for Cloud allows you to understand which of your multicloud resources are exposed to the internet. Exposure can result from misconfigurations, vulnerabilities, or other issues from connected devices that exist in your [cloud security graph](concept-attack-path.md#what-is-cloud-security-graph).

Understanding how you expose your resources to the internet is crucial for maintaining security and operational efficiency. Defender for Cloud can identify which resources are exposed to the internet and which aren't. Identifying these resources is crucial for maintaining a secure environment. However, this process is challenging because customers often use complex network architectures.

## How Defender for Cloud detects internet exposure

Detecting internet exposure can be as simple as checking to see if a virtual machine (VM) has been assigned a public IP address. However, the process can be much more complex. For example, a VM might not be directly exposed to the internet but could exist behind a load balancer. A load balancer is a device or service that distributes network traffic across multiple servers to ensure no single server becomes overwhelmed. 

The load balancer itself can be exposed to the internet and routes traffic to the machine. Therefore, even if the Azure resource appears not to be exposed, it is still receiving internet traffic indirectly. Defender for Cloud uses a combination of techniques to detect internet exposure. 

The following table presents a list of resources that Defender for Cloud assess for internet exposure:

| Category | Services/Resources |
|--|--|
| Virtual machines | Azure VM <br> AWS EC2 <br> GCP compute instance |
| Virtual machine clusters | Azure Virtual Machine scale set <br> GCP instance groups |
| Databases | Azure SQL <br> Azure PostgreSQL <br> Azure MySQL <br> Azure SQL managed instance <br> Azure MariaDB <br> Azure Cosmos DB <br> Azure Synapse Analytics <br> AWS RDS DB <br> GCP SQL admin instance |
| Storage | Azure Storage <br> AWS S3 buckets <br> GCP storage buckets |
| AI | Azure OpenAI <br> Azure AI services <br> Azure Search services |
| Containers | Azure AKS <br> AWS EKS <br> GCP GKE |
| API | Azure API Management operations |

The following table shows the network components Defender for Cloud assesses for internet exposure:

| Category | Services/Resources |
|----------|--------------------|
| Azure    | Application gateway <br> Load Balancer <br> Azure Firewall <br> Network Security Groups |
| AWS      | Elastic load balancer |
| GCP      | Load balancer |

## How to view internet exposured resources

