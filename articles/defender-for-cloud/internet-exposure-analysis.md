---
title: Internet exposure analysis
description: Learn how Defender for Cloud detects, assesses, and mitigates internet exposure for your multicloud resources to enhance security.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 01/14/2025
ms.custom: template-concept
#customer intent: As a user, I want to understand how Defender for Cloud detects and assesses internet exposure for my multicloud resources. This knowledge will help me identify and mitigate potential security risks effectively.
---

# Internet exposure analysis

Internet Exposure Analysis is a key capability that helps organizations identify which cloud resources are exposed to the public internet, both intentionally or unintentionally, and prioritize remediation based on the risk and scope of that exposure.

Defender for Cloud uses internet exposure to determine the risk level of your misconfigurations enabling high quality posture insights across attack paths, risk-based posture assessments, and signal prioritization across Defender for Cloud posture. 

## How Defender for Cloud detects internet exposure

Defender for Cloud determines if a resource is exposed to the internet by analyzing both:
1.	Control-plane configuration (e.g., public IPs, load balancers)
2.	Network-path reachability (analyzing routing, security and firewall rules) 

Detecting internet exposure can be as simple as checking if a virtual machine (VM) has a public IP address. However, the process can be more complex. Defender for Cloud attempts to locate internet-exposed resources in complex multi-cloud architectures. For example, a VM might not be directly exposed to the internet but could be behind a load balancer, which distributes network traffic across multiple servers to ensure no single server becomes overwhelmed.

The following table lists the resources that Defender for Cloud assesses for internet exposure: 

| Category | Services/Resources |
|--|--|
| Virtual machines | Azure VM <br> Amazon Web Service (AWS) EC2 <br> Google Cloud Platform (GCP) compute instance |
| Virtual machine clusters | Azure Virtual Machine Scale Set <br> GCP instance groups |
| Databases (DB) | Azure SQL <br> Azure PostgreSQL <br> Azure MySQL <br> Azure SQL Managed Instance <br> Azure MariaDB <br> Azure Cosmos DB <br> Azure Synapse <br> AWS Relational Database Service (RDS) DB <br> GCP SQL admin instance |
| Storage | Azure Storage <br> AWS S3 buckets <br> GCP storage buckets |
| AI | Azure OpenAI Service <br> Azure AI Services <br> Azure Cognitive Search |
| Containers | Azure Kubernetes Service (AKS) <br> AWS EKS <br> GCP GKE |
| API | Azure API Management Operations |

The following table lists the network components that Defender for Cloud assesses for internet exposure:

| Category | Services/Resources |
|----------|--------------------|
| Azure    | Application gateway <br> Load Balancer <br> Azure Firewall <br> Network Security Groups <br> vNet/Subnets |
| AWS      | Elastic load balancer |
| GCP      | Load balancer |

## Trusted Exposure (Public Preview)

> [!NOTE]
> Trusted Exposure currently supports multi-cloud virtual machines only including Azure VMs/VMSS, AWS EC2, and GCP compute instance.

Trusted Exposure, now available in Public Preview, allows organizations to define CIDRs (IP ranges/blocks) and individual IP addresses that are known and trusted. If a resource is exposed only to these trusted IPs, it is not considered internet-facing. In Defender CSPM, such resources are treated as having no internet exposure risk, equivalent to internal-only cloud resources.

When Trusted IPs are configured, Defender for Cloud will:

- **Suppress attack paths** originating from machines that are exposed only to trusted IPs (e.g., internal scanners, VPNs, allow-listed IPs)
- **Priority of security recommendations** will now exclude all trusted sources helping reduce noise.
  
### How it Works
- Define and apply IP addresses that are trusted using [Azure Policy](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Policy/Define%20MDC%20Trusted%20IPs) applied across your tenant scope.
- The new policy creates an IP group that contains the CIDR/IP addresses.
- Defender for Cloud reads the policy and applies it across supported resource types (currently: multi-cloud virtual machines).
- Attack Paths will not be created for exposures that originate from virtual machines exposed only to IP addressess that are “Trusted”.
- Security recommendations is deprioritized if a resource is exposed only to Trusted IPs.

- A new "Trusted Exposure" insight is available on the Cloud Security Explorer, allowing users to query all supported resources flagged as Trusted.



## Internet Exposure Width

> [!NOTE]
> Internet Exposure Width including the risk factors are applied to only multi-cloud compute instances that include - Azure VMs/VMSS, AWS EC2, and GCP compute instance. 

Internet Exposure Width represents the risks based on how broadly a resource (e.g. virtual machine) is exposed to the public internet. It plays a critical role in helping security teams understand not just whether a resource is internet-exposed, but how wide or narrow that exposure is, influencing the criticality and prioritization of security insights presented in attack paths and security recommendations.

### How It Works

Defender for cloud automatically analyzes your internet facing resources and tags them as **wide exposure** or **narrow exposure** according to the networking rules. The output is tagged either as wide exposure and  
- Attack paths that involve widely exposed resources now clearly indicate this in the title, such as "Widely internet exposed virtual machines has high permissions to storage account".
- The exposure width calculated is then used to determine the attack path generation and risk based recommendation that helps you to rightly prioritize the severity of the findings by adding specific labels to the following experiences.
- A new "Exposure width" insight is available on the Cloud Security Explorer, allowing users to query all supported resources that are widely exposed.

## How to view internet exposed resources

Defender for Cloud offers a few different ways to view internet facing resources.

- [Cloud Security Explorer](how-to-manage-cloud-security-explorer.md) - The Cloud Security Explorer allows you to run graph-based queries. From the Cloud Security Explorer page, you can run a query to identify resources exposed to the internet. The query returns all attached resources with internet exposure and provides their associated details for review.

- [Attack Path Analysis](how-to-manage-attack-path.md) - The Attack Path Analysis page lets you view attack paths that an attacker could take to reach a specific resource. With Attack Path Analysis, you can view a visual representation of the attack path and see which resources are exposed to the internet. Internet exposure often serves as an entry point for attack paths, especially when the resource has vulnerabilities. Internet facing resources often lead to targets with sensitive data.

- [Recommendations](review-security-recommendations.md) - Defender for Cloud prioritizes recommendations based on their exposure to the internet.

## Defender External Attack Surface Management integration

Defender for Cloud also integrates with Defender External Attack Surface Management to assess resources for internet exposure by attempting to contact them from an external source and seeing if they respond.

Learn more about the [Defender External Attack Surface Management integration](concept-easm.md).

## Related content

- [Investigating risk with security explorer/attack paths](concept-attack-path.md)
- [Identify and remediate attack paths](how-to-manage-attack-path.md)
- [Remediate recommendations](implement-security-recommendations.md)
