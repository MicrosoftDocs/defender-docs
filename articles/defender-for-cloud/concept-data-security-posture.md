---
title: Overview - Data security posture management
description: Explore how Microsoft Defender for Cloud enhances data security posture management across multicloud environments, ensuring comprehensive protection.
ms.author: dacurwin
author: dcurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 02/05/2025
#customer intent: As a security professional, I want to understand how Defender for Cloud enhances data security in a multicloud environment so that I can effectively protect sensitive data.
---

# Overview - About data security posture management

Organizations move data to the cloud at an exponential rate using multiple data stores such as object stores and managed/hosted databases as digital transformation accelerates. The cloud's dynamic and complex nature increases data threat surfaces and risks. Security teams face challenges with data visibility and protecting the cloud data estate.

Data security posture management in Microsoft Defender for Cloud helps you reduce data risk and respond to data breaches. With data security posture management, you can:

- Automatically discover sensitive data resources across multiple clouds.
- Evaluate data sensitivity, data exposure, and how data flows across the organization.
- Proactively and continuously uncover risks that might lead to data breaches.
- Detect suspicious activities that might indicate ongoing threats to sensitive data resources.

## Automatic discovery

Data security posture management finds managed and shadow data resources across clouds. It includes different types of object stores and databases.

- Use the sensitive data discovery extension included in the Defender Cloud Security Posture Management (CSPM) and Defender for Storage plans to discover sensitive data.
- Additionally, you can discover hosted databases and data flows in Cloud Security Explorer and Attack Paths. This functionality is available in the Defender CSPM plan, and isn't dependent on the sensitive data discovery extension.

## Smart sampling

Defender for Cloud uses smart sampling to discover a selected number of assets in your cloud data stores. Smart sampling discovers evidence of sensitive data issues while saving on discovery costs and time.

## Data security posture management in Defender CSPM

Defender CSPM provides visibility and contextual insights into your organizational security posture. Adding data security posture management to the Defender CSPM plan enables you to proactively identify and prioritize critical data risks, distinguishing them from less risky issues.

### Attack paths

Attack path analysis helps you address security issues that pose immediate threats and have the greatest potential for exploitation in your environment. Defender for Cloud analyzes which security issues are part of potential attack paths attackers could use to breach your environment. It also highlights the security recommendations that need resolution to mitigate the risks.

You can discover data breach risks by attack paths of internet-exposed VMs that have access to sensitive data stores. Hackers can exploit exposed VMs to move laterally across the enterprise and access these stores.

### Cloud Security Explorer

Cloud Security Explorer helps you identify security risks in your cloud environment by running graph-based queries on Cloud Security Graph, Defender for Cloud's context engine. You can prioritize your security team's concerns while considering your organization's specific context and conventions.

Use Cloud Security Explorer query templates to find insights about misconfigured data resources. You can also build your own queries. These resources are publicly accessible and contain sensitive data across multicloud environments. You can run queries to examine security issues and get environment context into your asset inventory, exposure to the internet, access controls, data flows, and more. Review [cloud graph insights](attack-path-reference.md#cloud-security-graph-components-list).

## Data security posture management in Defender for Storage

Defender for Storage monitors Azure storage accounts using advanced threat detection capabilities. It detects potential data breaches by identifying harmful attempts to access or exploit data and suspicious configuration changes that could lead to a breach.

When Defender for Storage detects early suspicious signs, it generates security alerts, allowing security teams to respond quickly and mitigate.

Apply sensitivity information types and Microsoft Purview sensitivity labels on storage resources to easily prioritize alerts and recommendations that focus on sensitive data.

[Learn more about sensitive data discovery](defender-for-storage-data-sensitivity.md) in Defender for Storage.

## Data sensitivity settings

Data sensitivity settings define what is considered sensitive data in your organization. Defender for Cloud bases data sensitivity values on:

- **Predefined sensitive information types**: Defender for Cloud uses the built-in sensitive information types in [Microsoft Purview](/microsoft-365/compliance/sensitive-information-type-learn-about). This approach ensures consistent classification across services and workloads. Defender for Cloud enables some of these types by default. You can [modify these defaults](data-sensitivity-settings.md). Of these built-in sensitive information types, there's a subset supported by sensitive data discovery. You can view a [reference list](sensitive-info-types.md) of this subset, which also lists which information types are supported by default.
- **Custom information types/labels**: You can optionally import custom sensitive information types and [labels](/microsoft-365/compliance/sensitivity-labels) that you defined in the Microsoft Purview compliance portal.
- **Sensitive data thresholds**: In Defender for Cloud, you can set the threshold for sensitive data labels. The threshold determines minimum confidence level for a label to be marked as sensitive in Defender for Cloud. Thresholds make it easier to explore sensitive data.

When discovering resources for data sensitivity, Defender for Cloud bases results on these settings.

Enable data security posture management with the sensitive data discovery component in the Defender CSPM or Defender for Storage plans. This feature allows Defender for Cloud to identify data resources containing sensitive data. Defender for Cloud labels resources in accordance with data sensitivity settings.

Changes in sensitivity settings take effect the next time Defender for Cloud discovers resources.

## Sensitive data discovery

Sensitive data discovery identifies sensitive resources and their related risks, then helps prioritize and remediate those risks.

Defender for Cloud considers a resource sensitive if it detects a Sensitive Information Type (SIT) and you configure the SIT to be considered sensitive. Check out [the list of SITs that are considered sensitive by default](sensitive-info-types.md).

The sensitive data discovery process operates by sampling the resource’s data. It uses the sample data to identify sensitive resources with high confidence without performing a full scan of all assets in the resource.

The Microsoft Purview classification engine powers the sensitive data discovery process. It uses a common set of SITs and labels for all datastores, regardless of their type or hosting cloud vendor.

Sensitive data discovery detects sensitive data at the cloud workload level. Sensitive data discovery aims to identify various types of sensitive information, but it might not detect all types.

To get complete data cataloging scanning results with all SITs available in the cloud resource, use the scanning features from Microsoft Purview.

### For cloud storage

Defender for Cloud's scanning algorithm selects containers that might contain sensitive information and samples up to 20 MB for each file scanned within the container.

### For cloud Databases

Defender for Cloud selects certain tables and samples between 300 to 1,024 rows using nonblocking queries.

## Next step

> [!div class="nextstepaction"]
> [Prepare and review requirements for data security posture management.](concept-data-security-posture-prepare.md) 
