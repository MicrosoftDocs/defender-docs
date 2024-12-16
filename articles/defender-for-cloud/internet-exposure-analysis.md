---
title: Internet exposure analysis
description: Learn how Defender for Cloud detects, assesses, and mitigates internet exposure for your multicloud resources to enhance security.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 12/16/2024
ms.custom: template-concept
#customer intent: As a user, I want to understand how Defender for Cloud detects and assesses internet exposure for my multicloud resources. This knowledge will help me identify and mitigate potential security risks effectively.
---

# Internet exposure analysis

Internet exposure analysis in Microsoft Defender for Cloud lets you understand which of your multicloud resources are exposed to the internet. Exposure can result from misconfigurations, vulnerabilities, or other issues from connected devices in your [cloud security graph](concept-attack-path.md#what-is-cloud-security-graph).

Understanding how you expose your resources to the internet is crucial for maintaining security and operational efficiency. Defender for Cloud can identify which resources are exposed to the internet and which aren't. Identifying these resources is crucial for maintaining a secure environment. This process is challenging because customers often use complex network architectures.

## How Defender for Cloud detects internet exposure

Detecting internet exposure can be as simple as checking if a virtual machine (VM) has a public  Internet Protocol (IP) address. However, the process can be much more complex. For example, a VM might not be directly exposed to the internet but could be behind a load balancer. A load balancer is a device or service that distributes network traffic across multiple servers to ensure that no single server becomes overwhelmed. 

The load balancer itself can be exposed to the internet and route traffic to the machine. Therefore, even if the Azure resource appears not to be exposed, it still receives Internet traffic indirectly. Defender for Cloud uses a combination of techniques to detect Internet exposure.

Another example is an Amazon Web Services (AWS) VM that receives traffic from the internet through an IP address. Complex architectures can indirectly expose these types of VMs. 

The following table lists the resources that Defender for Cloud assesses for Internet exposure:

| Category | Services/Resources |
|--|--|
| Virtual machines | Azure VM <br> AWS EC2 <br> Google Cloud Project (GCP) compute instance |
| Virtual machine clusters | Azure Virtual Machine scale set <br> GCP instance groups |
| Databases | Azure SQL <br> Azure PostgreSQL <br> Azure MySQL <br> Azure SQL managed instance <br> Azure MariaDB <br> Azure Cosmos DB <br> Azure Synapse Analytics <br> AWS RDS DB <br> GCP SQL admin instance |
| Storage | Azure Storage <br> AWS S3 buckets <br> GCP storage buckets |
| AI | Azure OpenAI <br> Azure AI services <br> Azure Search services |
| Containers | Azure AKS <br> AWS EKS <br> GCP GKE |
| API | Azure API Management operations |

The following table lists the network components that Defender for Cloud assesses for Internet exposure:

| Category | Services/Resources |
|----------|--------------------|
| Azure    | Application gateway <br> Load Balancer <br> Azure Firewall <br> Network Security Groups |
| AWS      | Elastic load balancer |
| GCP      | Load balancer |

## How to view internet exposed resources

Defender for Cloud offers a few different ways to view Internet-exposed resources.

- [Cloud Security Explorer](how-to-manage-cloud-security-explorer.md) - The Cloud Security Explorer lets you run graph-based queries on the Cloud Security Graph. On the Cloud Security Explorer page, you can run a query to find resources exposed to the Internet. This query returns all your attached resources exposed to the Internet and lets you view any associated details.

- [Attack Path Analysis](how-to-manage-attack-path.md) -  The Attack Path Analysis page lets you view attack paths that an attacker could take to reach a specific resource. With the Attack Path Analysis, you can view a visual representation of the attack path and see which resources are exposed to the internet. Internet exposure often serves as an entry point for attack paths, especially when the resource has known vulnerabilities. Internet-exposed resources often lead to targets with sensitive data.

- [Recommendations](review-security-recommendations.md) - Defender for Cloud provides recommendations for Internet-exposed resources. These recommendations are based on the security posture of the resource and the potential risks associated with the exposure.

Defender for Cloud uses its [risk prioritization](risk-prioritization.md) feature to show you the recommendations and attack paths that pose the highest level of risk first.

## Related content

- [Investigating risk with security explorer/attack paths](concept-attack-path.md)
- [Identify and remediate attack paths](how-to-manage-attack-path.md)
- [Remediate recommendations](implement-security-recommendations.md)
