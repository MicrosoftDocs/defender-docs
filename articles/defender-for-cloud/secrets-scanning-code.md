---
# Required metadata
# For more information, see https://review.learn.microsoft.com/en-us/help/platform/learn-editor-add-metadata?branch=main
# For valid values of ms.service, ms.prod, and ms.topic, see https://review.learn.microsoft.com/en-us/help/platform/metadata-taxonomies?branch=main

title: Protecting code repository secrets
description: Describes how to interpret secret scanning results from code repositories in Defender for Cloud
author:      laragoldstein13 # GitHub alias
ms.author:   lgoldstein # Microsoft alias
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date:     11/04/2024
---


Defender for Cloud notifies organizations about exposed secrets in code repositories from GitHub and Azure DevOps. Secret detection helps you to quickly detect, prioritize, and remediate exposed secrets such as tokens, passwords, keys, or credentials stored in any file within the code repository. 

If secrets are detected, Defender for Cloud can assist your security team to prioritize and take actionable remediation steps to minimize the risk of lateral movement by identifying the target resource that the secret can access. 

## How does code repository secret scanning work?

Secrets scanning for code repositories relies on GitHub Advanced Security for GitHub and Azure DevOps. GitHub Advanced Security scans the entire Git history on all branches present in your repository for secrets, even if the repository is archived. 

To learn more, visit GitHub Advanced Security documentation for [GitHub](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/about-secret-scanning) and [Azure DevOps.](/azure/devops/repos/security/github-advanced-security-secret-scanning?view=azure-devops)  

## What’s supported?

Code repository secret scanning is available with the necessary GitHub Advanced Security license. Viewing the findings in Defender for Cloud is provided as part of Foundational Cloud Security Posture Management. To detect lateral movement possibilities to runtime resources, Defender Cloud Security Posture Management is required.  

At this time, attack paths for exposed are only available for Azure DevOps repositories.  

## How does code repository scanning mitigate risk?

Secrets scanning helps reduce risk with the following mitigations: 
- Preventing lateral movement: Discovery of exposed secrets within code repositories poses a significant risk of unauthorized access as threat actors can leverage these secrets to compromise critical resources. 
- Eliminating secrets that aren’t needed: By knowing that specific secrets do not have access to any resources in your tenant, you can safely work with developers to remove these secrets. Additionally, you will know when secrets are expired. 
- Strengthening secrets security: Getting recommendations to use secret management systems such as Azure Key Vault. 

## How do I identify and remediate secrets issues?

There are several ways to identify and remediate exposed secrets. However, not every method listed below is supported for every secret. 
- Review secrets recommendations: When secrets are found on assets, a recommendation is triggered for the relevant code repository on the Defender for Cloud Recommendations page.  
- Review secrets with cloud security explorer: Use cloud security explorer to query the cloud security graph for code repositories that contain secrets.  
- Review attack paths: Attack path analysis scans the cloud security graph to expose exploitable paths that attacks might use to breach your environment and reach high-impact assets.  

### Security recommendations

The following secrets security recommendations are available: 

- Azure DevOps repositories: [Azure DevOps repositories should have secret scanning findings resolved](https://portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/b5ef903f-8655-473b-9784-4f749eeb25c6) 

- GitHub repositories: [GitHub repositories should have secret scanning findings resolved](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/dd98425c-1407-40cc-8a2c-da5d0a2f80da) 

### Attack path scenarios

Attack path analysis is a graph-based algorithm that scans your cloud security graph to expose exploitable paths that attackers might use to reach high-impact assets. Potential attack paths include: 

Azure DevOps repository contains an exposed secret with lateral movement to a SQL database. 

Publicly accessible Azure DevOps repository contains an exposed secret with lateral movement to a Storage Account.  

### Cloud security explorer queries

To investigate exposed secrets and lateral movement possibilities, you can use the following queries:  

[Code repositories contain secrets](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityGraph.ReactView/query/%7B%22type%22%3A%22securitygraphquery%22%2C%22version%22%3A2%2C%22properties%22%3A%7B%22source%22%3A%7B%22type%22%3A%22datasource%22%2C%22properties%22%3A%7B%22sources%22%3A%5B%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22code_repository%22%7D%7D%5D%2C%22conditions%22%3A%7B%22type%22%3A%22conditiongroup%22%2C%22properties%22%3A%7B%22operator%22%3A%22and%22%2C%22conditions%22%3A%5B%7B%22type%22%3A%22connection%22%2C%22properties%22%3A%7B%22name%22%3A%22contains%22%2C%22direction%22%3A%22outgoing%22%2C%22target%22%3A%7B%22type%22%3A%22datasource%22%2C%22properties%22%3A%7B%22sources%22%3A%5B%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22connection_string%22%7D%7D%2C%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22key%22%7D%7D%2C%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22sas_token%22%7D%7D%5D%7D%7D%7D%7D%5D%7D%7D%7D%7D%7D%7D) 

[Azure DevOps repositories contain secrets that can authenticate to Object Storage or Managed Databases](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityGraph.ReactView/query/%7B%22type%22%3A%22securitygraphquery%22%2C%22version%22%3A2%2C%22properties%22%3A%7B%22source%22%3A%7B%22type%22%3A%22datasource%22%2C%22properties%22%3A%7B%22sources%22%3A%5B%7B%22type%22%3A%22entity%22%2C%22properties%22%3A%7B%22source%22%3A%22azuredevopsrepository%22%7D%7D%5D%2C%22conditions%22%3A%7B%22type%22%3A%22conditiongroup%22%2C%22properties%22%3A%7B%22operator%22%3A%22and%22%2C%22conditions%22%3A%5B%7B%22type%22%3A%22connection%22%2C%22properties%22%3A%7B%22name%22%3A%22contains%22%2C%22direction%22%3A%22outgoing%22%2C%22target%22%3A%7B%22type%22%3A%22datasource%22%2C%22properties%22%3A%7B%22sources%22%3A%5B%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22connection_string%22%7D%7D%2C%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22sas_token%22%7D%7D%5D%2C%22conditions%22%3A%7B%22type%22%3A%22conditiongroup%22%2C%22properties%22%3A%7B%22operator%22%3A%22and%22%2C%22conditions%22%3A%5B%7B%22type%22%3A%22connection%22%2C%22properties%22%3A%7B%22name%22%3A%22can%20authenticate%20to%22%2C%22direction%22%3A%22outgoing%22%2C%22target%22%3A%7B%22type%22%3A%22datasource%22%2C%22properties%22%3A%7B%22sources%22%3A%5B%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22managed_database%22%7D%7D%2C%7B%22type%22%3A%22family%22%2C%22properties%22%3A%7B%22source%22%3A%22object_storage%22%7D%7D%5D%7D%7D%7D%7D%5D%7D%7D%7D%7D%7D%7D%5D%7D%7D%7D%7D%7D%7D) 


## How do I mitigate secrets issues effectively?

It’s important to be able to prioritize secrets and identify which ones need immediate attention. To help you do this, Defender for Cloud provides: 

Providing rich metadata for every secret, such as the file path, line number, column, commit hash, file URL, GitHub Advanced Security alert URL, and an indication to whether the target resource that the secrets provide access to exists. 

Combining secrets metadata with cloud assets context. This helps you to start with assets that are exposed to the internet or contain secrets that might compromise other sensitive assets. Secrets scanning findings are incorporated into risk-based recommendation prioritization. 

## Related content
[Protecting cloud deployment secrets](secrets-scanning-cloud-deployment.md)
[Protecting VM secrets](secrets-scanning-servers.md)
[DevOps security overview](defender-for-devops-introduction.md)