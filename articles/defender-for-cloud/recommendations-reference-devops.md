---
title: Reference table for all security recommendations for DevOps
description: This article lists all Microsoft Defender for Cloud security recommendations that help you harden and protect your DevOps resources.
author: dcurwin
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 09/27/2023
ms.author: dacurwin
ms.custom: generated
ai-usage: ai-assisted
---

# Security recommendations for DevOps resources

This article lists the recommendations you might see in Microsoft Defender for Cloud if you connect an [Azure DevOps](quickstart-onboard-devops.md), [GitHub](quickstart-onboard-github.md), or [GitLab](quickstart-onboard-gitlab.md) environment by using the **Environment settings** page.

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

To learn about actions that you can take in response to these recommendations, see [Remediate recommendations in Defender for Cloud](implement-security-recommendations.md).

Learn more about [DevOps security](defender-for-devops-introduction.md) benefits and features.

DevOps recommendations don't affect your [secure score](secure-score-security-controls.md). To decide which recommendations to resolve first, look at the severity of each recommendation and its potential impact on your secure score.


## Azure DevOps recommendations

### Azure DevOps repositories should have GitHub Advanced Security for Azure DevOps (GHAzDO) enabled

**Description**:  DevOps security in Defender for Cloud uses a central console to empower security teams with the ability to protect applications and resources from code to cloud across Azure DevOps. With enablement of GitHub Advanced Security for Azure DevOps (GHAzDO) repositories including GitHub Advanced Security for Azure DevOps, you get findings about secrets, dependencies, and code vulnerabilities in your Azure DevOps repositories surfaced in Microsoft Defender for Cloud.

**Severity**: High

### Azure DevOps repositories should have secret scanning findings resolved

**Description**: Secrets were found in code repositories. Remediate immediately to prevent a security breach. Secrets found in repositories can leak, or be discovered by adversaries, leading to compromise of an application or service. The Microsoft Security DevOps credential scanning tool only scans builds on which it is configured to run. Therefore, results might not reflect the complete status of secrets in your repositories.

**Severity**: High

### Azure DevOps repositories should have code scanning findings resolved

**Description**: Vulnerabilities were found in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.

**Severity**: Medium

### Azure DevOps repositories should have dependency vulnerability scanning findings resolved

**Description**: Dependency vulnerabilities found in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.

**Severity**: Medium

### Azure DevOps repositories should have infrastructure as code scanning findings resolved

**Description**: Infrastructure as code security configuration issues found in repositories. The issues were detected in template files. To improve the security posture of the related cloud resources, it is highly recommended to remediate these issues.

**Severity**: Medium

### Azure DevOps pipelines shouldn't have secrets available to builds of forks

**Description**: In public repositories, it's possible that people from outside the organization create forks and run builds on the forked repository. In such a case, if this setting is enabled, outsiders can get access to build pipeline secrets that were meant to be internal.

**Severity**: High

### Azure DevOps service connections shouldn't grant access to all pipelines

**Description**: Service connections are used to create connections from Azure Pipelines to external and remote services for executing tasks in a job. Pipeline permissions control which pipelines are authorized to use the service connection. To support security of the pipeline operations, service connections shouldn't be granted access to all YAML pipelines. This helps to maintain the principle of least privilege because a vulnerability in components used by one pipeline can be used by an attacker to attack other pipelines with access to critical resources.

**Severity**: High

### Azure DevOps secure files shouldn't grant access to all pipelines

**Description**: Secure files give developers a way to store files that can be shared across pipelines. These files are typically used to store secrets such as signing certificates and SSH keys. If a secure file is granted access to all YAML pipelines, an unauthorized user can steal information from the secure files by building a YAML pipeline and accessing the secure file.

**Severity**: High

### Azure DevOps variable groups with secret variables shouldn't grant access to all pipelines

**Description**: Variable groups store values and secrets that you might want to be passed into a YAML pipeline or make available across multiple pipelines. You can share and use variable groups in multiple pipelines in the same project. If a variable group containing secrets is marked as accessible to all YAML pipelines, then an attacker can exploit the assets involving the secret variables by creating a new pipeline.

**Severity**: High

### Azure DevOps Classic Azure service connections shouldn't be used to access a subscription

**Description**: Use the Azure Resource Manager (ARM) type of service connections instead of Azure Classic service connections to connect to Azure subscriptions. The ARM model offers multiple security enhancements, including stronger access control, improved auditing, ARM-based deployment/governance, access to managed identities and key vault for secrets, Entra Permissions-based authentication, and support for tags and resource groups for streamlined management.

**Severity**: Medium

### (Preview) Azure DevOps repositories should have API security testing findings resolved

**Description**: API security vulnerabilities found in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.

**Severity**: Medium

### (Preview) Azure DevOps repositories should require minimum two-reviewer approval for code pushes 

**Description**: To prevent unintended or malicious changes from being directly committed, it's important to implement protection policies for the default branch in Azure DevOps repositories. We recommend requiring at least two code reviewers to approve pull requests before the code is merged with the default branch. By requiring approval from a minimum number of two reviewers, you can reduce the risk of unauthorized modifications, which could lead to system instability or security vulnerabilities.<br/><br/> This recommendation is provided in Defender for Cloud foundational security posture, if you have connected Azure DevOps to Defender for Cloud.

**Severity**: High

### (Preview) Azure DevOps repositories should not allow requestors to approve their own Pull Requests

**Description**: To prevent unintended or malicious changes from being directly committed, it's important to implement protection policies for the default branch in Azure DevOps repositories. We recommend prohibiting pull request creators from approving their own submissions to ensure that every change undergoes objective review by someone other than the author. By doing this, you can reduce the risk of unauthorized modifications, which could lead to system instability or security vulnerabilities.<br/><br/> This recommendation is provided in Defender for Cloud foundational security posture, if you have connected Azure DevOps to Defender for Cloud.

**Severity**: High

### (Preview) Azure DevOps projects should have creation of classic pipelines disabled

**Description**: Disabling the creation of classic build and release pipelines prevents a security concern that stems from YAML and classic pipelines sharing the same resources, for example the same service connections. Potential attackers can leverage classic pipelines to create processes that evade typical defense mechanisms set up around modern YAML pipelines.

**Severity**: High

## GitHub recommendations

### GitHub organizations should not make action secrets accessible to all repositories

**Description**: For secrets used in GitHub Action workflows that are stored at the GitHub organization-level, you can use access policies to control which repositories can use organizational secrets. Organization-level secrets let you share secrets between multiple repositories. This reduces the need to create duplicate secrets. However, once a secret is made accessible to a repository, anyone with write access on repository can access the secret from any branch in a workflow. To reduce the attack surface, ensure that the secret is accessible from selected repositories only.<br/><br/> This recommendation is provided in Defender for Cloud foundational security posture, if you have connected Azure DevOps to Defender for Cloud.

**Severity**: High

### GitHub repositories should have secret scanning enabled

**Description**: GitHub scans repositories for known types of secrets, to prevent fraudulent use of secrets that were accidentally committed to repositories. Secret scanning will scan the entire Git history on all branches present in the GitHub repository for any secrets. Examples of secrets are tokens and private keys that a service provider can issue for authentication. If a secret is checked into a repository, anyone who has read access to the repository can use the secret to access the external service with those privileges. Secrets should be stored in a dedicated, secure location outside the repository for the project.

**Severity**: High

### GitHub repositories should have code scanning enabled

**Description**: GitHub uses code scanning to analyze code in order to find security vulnerabilities and errors in code. Code scanning can be used to find, triage, and prioritize fixes for existing problems in your code. Code scanning can also prevent developers from introducing new problems. Scans can be scheduled for specific days and times, or scans can be triggered when a specific event occurs in the repository, such as a push. If code scanning finds a potential vulnerability or error in code, GitHub displays an alert in the repository. A vulnerability is a problem in a project's code that could be exploited to damage the confidentiality, integrity, or availability of the project.

**Severity**: Medium

### GitHub repositories should have Dependabot scanning enabled

**Description**: GitHub sends Dependabot alerts when it detects vulnerabilities in code dependencies that affect repositories. A vulnerability is a problem in a project's code that could be exploited to damage the confidentiality, integrity, or availability of the project or other projects that use its code. Vulnerabilities vary in type, severity, and method of attack. When code depends on a package that has a security vulnerability, this vulnerable dependency can cause a range of problems.

**Severity**: Medium

### GitHub repositories should have secret scanning findings resolved

**Description**: Secrets found in code repositories. This should be remediated immediately to prevent a security breach. Secrets found in repositories can be leaked or discovered by adversaries, leading to compromise of an application or service.

**Severity**: High

### GitHub repositories should have code scanning findings resolved

**Description**: Vulnerabilities found in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.

**Severity**: Medium

### GitHub repositories should have dependency vulnerability scanning findings resolved

**Description**: GitHub repositories should have dependency vulnerability scanning findings resolved.

**Severity**: Medium

### GitHub repositories should have infrastructure as code scanning findings resolved

**Description**: Infrastructure as code security configuration issues were found in repositories. The issues were detected in template files. To improve the security posture of the related cloud resources, it is highly recommended to remediate these issues.

**Severity**: Medium

### GitHub repositories should have protection policies for default branch enabled

**Description**: The default branch of the repository should be protected via branch protection policies to prevent unintended/malicious changes from being directly committed to the repository.

**Severity**: High

### GitHub repositories should have force pushes to default branch disabled

**Description**: As the default branch is typically used for deployment and other privileged activities, any changes to it should be approached with caution. Enabling force pushes can introduce unintended or malicious changes to the default branch.

**Severity**: Medium

### GitHub organizations should have secret scanning push protection enabled

**Description**: Push Protection will block commits that contain secrets thus preventing accidental exposure of secrets. To avoid the risk of credential exposure, Push Protection should be automatically enabled for every secret scanning enabled repository.

**Severity**: High

### GitHub repositories shouldn't use self hosted runners

**Description**: Self-Hosted Runners on GitHub lack guarantees of operation in ephemeral clean virtual machines and can be persistently compromised by untrusted code in a workflow. As such, Self-Hosted Runners shouldn't be utilized for action workflows.

**Severity**: High

### GitHub organizations should have actions workflow permissions set to read-only

**Description**: By default, Action workflows should be granted read-only permissions to prevent malicious users from exploiting over-permissioned workflows to access and tamper with resources.

**Severity**: High

### GitHub organizations should have more than one person with administrator permissions

**Description**: Having at least two administrators reduces the risk of losing admin access. This is useful in case of break-glass account scenarios.

**Severity**: High

### GitHub organizations should have base permissions set to no permissions or read

**Description**: Base permissions should be set to none or read for an organization to follow the principle of least privilege and prevent unnecessary access.

**Severity**: High

### (Preview) GitHub repositories should have API security testing findings resolved

**Description**: API security vulnerabilities were found in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.

**Severity**: Medium

### (Preview) GitHub organizations should not make action secrets accessible to all repositories

**Description**: For secrets used in GitHub Action workflows that are stored at the GitHub organization-level, you can use access policies to control which repositories can use organization secrets. Organization-level secrets let you share secrets between multiple repositories, reducing the need to create duplicate secrets. However, when a secret is made accessible to a repository, anyone with write access on repository can access the secret from any branch in a workflow. To reduce the attack surface, ensure that the secret is accessible from selected repositories only.

**Severity**: High

### (Preview) GitHub organizations should block Copilot suggestions that match public code

**Description**: Enabling GitHub Copilot's filter to block code suggestions matching public code on GitHub enhances security and legal compliance. It prevents the unintentional incorporation of public or open-source code, reducing the risk of legal issues and ensuring adherence to licensing terms. Additionally, it helps avoid introducing potential vulnerabilities from public code into the organization's projects, thereby maintaining higher code quality and security. When the filter is enabled, GitHub Copilot checks code suggestions with their surrounding code of about 150 characters against public code on GitHub. If there is a match or near match, the suggestion will not be shown.

**Severity**: High

### (Preview) GitHub organizations should enforce multifactor authentication for outside collaborators

**Description**: Enforcing multifactor authentication for outside collaborators in a GitHub organization is a security measure that requires collaborators to use an additional form of identification besides their password to access the organization's repositories and resources. This enhances security by protecting against unauthorized access, even if a password is compromised, and helps ensure compliance with industry standards. It involves informing collaborators about the requirement and providing support for the transition, ultimately reducing the risk of data breaches.

**Severity**: High

### (Preview) GitHub repositories should require minimum two-reviewer approval for code pushes

**Description**: To prevent unintended or malicious changes from being directly committed, it's important to implement protection policies for the default branch in GitHub repositories. We recommend requiring at least two code reviewers to approve pull requests before the code is merged with the default branch. By requiring approval from a minimum number of two reviewers, you can reduce the risk of unauthorized modifications, which could lead to system instability or security vulnerabilities.

**Severity**: High

### GitLab recommendations

### GitLab projects should have secret scanning findings resolved

**Description**: Secrets were found in code repositories. This should be remediated immediately to prevent a security breach. Secrets found in repositories can be leaked or discovered by adversaries, leading to compromise of an application or service.

**Severity**: High

### GitLab projects should have code scanning findings resolved

**Description**: Vulnerabilities were found in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.

**Severity**: Medium

### GitLab projects should have dependency vulnerability scanning findings resolved

**Description**: GitHub repositories should have dependency vulnerability scanning findings resolved.

**Severity**: Medium

### GitLab projects should have infrastructure as code scanning findings resolved

**Description**: Infrastructure as code security configuration issues were found in repositories. The issues shown were detected in template files. To improve the security posture of the related cloud resources, it is highly recommended to remediate these issues.

**Severity**: Medium

### Deprecated DevOps security recommendations

### Code repositories should have code scanning findings resolved

**Description**: DevOps security in Defender for Cloud has found vulnerabilities in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.
 (No related policy)

**Severity**: Medium

### Code repositories should have secret scanning findings resolved

**Description**: DevOps security in Defender for Cloud has found a secret in code repositories. This should be remediated immediately to prevent a security breach. Secrets found in repositories can be leaked or discovered by adversaries, leading to compromise of an application or service. For Azure DevOps, the Microsoft Security DevOps CredScan tool only scans builds on which it has been configured to run. Therefore, results might not reflect the complete status of secrets in your repositories.
 (No related policy)

**Severity**: High

### Code repositories should have Dependabot scanning findings resolved

**Description**: DevOps security in Defender for Cloud has found vulnerabilities in code repositories. To improve the security posture of the repositories, it is highly recommended to remediate these vulnerabilities.
 (No related policy)

**Severity**: Medium

### Code repositories should have infrastructure as code scanning findings resolved

**Description**: DevOps security in Defender for Cloud has found infrastructure as code security configuration issues in repositories. The issues shown were detected in template files. To improve the security posture of the related cloud resources, it is highly recommended to remediate these issues.
 (No related policy)

**Severity**: Medium

### GitHub repositories should have code scanning enabled

**Description**: GitHub uses code scanning to analyze code in order to find security vulnerabilities and errors in code. Code scanning can be used to find, triage, and prioritize fixes for existing problems in your code. Code scanning can also prevent developers from introducing new problems. Scans can be scheduled for specific days and times, or scans can be triggered when a specific event occurs in the repository, such as a push. If code scanning finds a potential vulnerability or error in code, GitHub displays an alert in the repository. A vulnerability is a problem in a project's code that could be exploited to damage the confidentiality, integrity, or availability of the project.
 (No related policy)

**Severity**: Medium

### GitHub repositories should have secret scanning enabled

**Description**: GitHub scans repositories for known types of secrets, to prevent fraudulent use of secrets that were accidentally committed to repositories. Secret scanning will scan the entire Git history on all branches present in the GitHub repository for any secrets. Examples of secrets are tokens and private keys that a service provider can issue for authentication. If a secret is checked into a repository, anyone who has read access to the repository can use the secret to access the external service with those privileges. Secrets should be stored in a dedicated, secure location outside the repository for the project.
 (No related policy)

**Severity**: High

### GitHub repositories should have Dependabot scanning enabled

**Description**: GitHub sends Dependabot alerts when it detects vulnerabilities in code dependencies that affect repositories. A vulnerability is a problem in a project's code that could be exploited to damage the confidentiality, integrity, or availability of the project or other projects that use its code. Vulnerabilities vary in type, severity, and method of attack. When code depends on a package that has a security vulnerability, this vulnerable dependency can cause a range of problems.
 (No related policy)

**Severity**: Medium

## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)
