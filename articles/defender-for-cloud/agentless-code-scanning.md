---
title: Configure agentless code scanning (Preview)
description: Discover how agentless code scanning in Microsoft Defender for Cloud identifies vulnerabilities in code and IaC configurations.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 06/10/2025
ms.custom: references_regions
#customer intent: As a security professional, I want to learn how agentless code scanning in Microsoft Defender for Cloud can help identify vulnerabilities in my code and IaC configurations.
---

# Configure agentless code scanning (Preview)

Agentless code scanning in Microsoft Defender for Cloud offers fast and scalable security coverage for all repositories in Azure DevOps and GitHub. Agentless code scanning automatically scans code and infrastructure-as-code (IaC) to identify vulnerabilities and misconfigurations without requiring any changes to your build or deployment pipelines. This approach simplifies setup and maintenance with a single Azure DevOps or GitHub connector, and provides broad coverage, continuous insights, and actionable security findings. It lets security and development teams focus on fixing risks smoothly without interrupting development workflows.

You can customize which scanners run, define exactly which organizations, projects, or repositories are included or excluded from scanning.

## Prerequisites

- **Supported use cases**:
  - [Security recommendations to prioritize and fix code vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud)
  - [Security recommendations to prioritize and fix Infrastructure-as-Code (IaC) misconfigurations](iac-vulnerabilities.md)

- [Supported cloud availability](support-matrix-cloud-environment.md).

- **Supported regions**: Australia East, Canada Central, Central US, East Asia, East US, North Europe, Sweden Central, UK South, West Europe.

- **Supported environments**: Azure DevOps connector and GitHub connector.

**Roles and permissions**:
- To set up and configure the connector:
  - **Project Collection Admin**: Required in Azure DevOps to perform the initial setup.
  - **Subscription Contributor**: Needed on the Azure subscription to create and configure the connector.

- To view security results:
  - **Security Admin**: Can manage security settings, policies, and alerts but can't modify the connector.
  - **Security Reader**: Can view recommendations, alerts, and policies but can't make any changes.

## Key benefits

Some of the key benefits of agentless code scanning in Microsoft Defender for Cloud are:

- **Proactive risk management**: Identify risks early in the development process. This enables secure coding practices and reduces vulnerabilities before they reach production.  
- **Effortless onboarding**: Set up quickly with minimal configuration and without pipeline changes.  
- **Enterprise-scale, centralized management**: Automatically scan code across multiple repositories using a single connector. This offers extensive coverage for large environments.  
- **Rapid insights for quick remediation**: Receive actionable vulnerability insights right after onboarding. This allows quick fixes and reduces exposure time.  
- **Developer-friendly and seamless**: Operate independently of continuous integration and continuous deployment (CI/CD) pipelines, without changes or direct developer involvement needed. This allows for continuous security monitoring without disrupting developer productivity or workflows.
- **Flexible coverage and control:** Choose which scanners run and what gets scanned. You can cover everything by default or customize settings to include or exclude specific organizations, projects, or repositories. This allows you to match security coverage to your risk profile and operational needs, without extra complexity.

## Risks detection capabilities

Agentless code scanning improves security by offering targeted security recommendations for both code and infrastructure-as-code (IaC) templates. This is in addition to the foundational cloud security posture management security recommendations provided through the connector. Key detection capabilities include:

- [Code vulnerabilities](recommendations-reference-devops.md#azure-devops-repositories-should-have-code-scanning-findings-resolved): Find common coding errors, unsafe coding practices, and known vulnerabilities in multiple programming languages.
- [Infrastructure-as-Code misconfigurations](recommendations-reference-devops.md#azure-devops-repositories-should-have-infrastructure-as-code-scanning-findings-resolved): Detect security misconfigurations in IaC templates that could lead to insecure deployments. 

Creating the connector enhances security by providing foundational cloud security posture management recommendations for repositories, pipelines, and service connections.

## Scanning tools

Agentless code scanning uses various open-source tools to find vulnerabilities and misconfigurations in code and Infrastructure-as-Code (IaC) templates:

| **Tool**              | **Supported IaC/Languages**                                  | **License** |
| --------------------- | ------------------------------------------------------------ | ----------- |
| **[Bandit](https://github.com/PyCQA/bandit)**            | Python                                                       | [Apache 2.0](https://github.com/PyCQA/bandit/blob/master/LICENSE)  |
| **[Checkov](https://github.com/bridgecrewio/checkov)**           | Terraform IaC templates, Terraform plan files, AWS CloudFormation templates, Kubernetes manifest files, Helm chart files, Dockerfiles, Azure Azure Resource Manager (ARM) IaC templates, Azure Bicep IaC templates, AWS SAM templates (Serverless Application Model), Kustomize files, Serverless framework templates, OpenAPI specification files | [Apache 2.0](https://github.com/bridgecrewio/checkov/blob/main/LICENSE)  |
| **[ESLint](https://github.com/eslint/eslint)**            | JavaScript, TypeScript, JSX, TSX                             | [MIT](https://github.com/eslint/eslint/blob/main/LICENSE)         |
| **[Template Analyzer](https://github.com/Azure/template-analyzer)** | ARM IaC templates, Bicep IaC templates                       | [MIT](https://github.com/Azure/template-analyzer/blob/main/LICENSE.txt)         |

These tools support a wide range of languages and infrastructure-as-code (IaC) frameworks, ensuring thorough security analysis across your codebase.

### Supported systems and file types

#### Version control systems

- **Azure DevOps**: Full support for repositories connected via the Azure DevOps connector.

- **GitHub**: Full support for repositories connected via the GitHub connector.

#### Programming languages

- Python
- JavaScript/TypeScript

#### Infrastructure-as-Code (IaC) platforms and configurations

| **IaC   Platform**       | **Supported   file types**                 | **Notes**                                                    |
| ------------------------ | ------------------------------------------ | ------------------------------------------------------------ |
| **Terraform**            | `.tf`, `.tfvars`                           | Supports Terraform IaC templates in HCL2 language,  including variable files in `.tfvars`. |
| **Terraform Plan**       | JSON files                                 | Includes JSON files representing planned configurations,  used for analysis and scanning. |
| **AWS CloudFormation**   | JSON, YAML files                           | Supports AWS CloudFormation templates for defining AWS  resources. |
| **Kubernetes**           | YAML, JSON files                           | Supports Kubernetes manifest files for defining  configurations in clusters. |
| **Helm**                 | Helm chart directory structure, YAML files | Follows Helm’s standard chart structure; supports Helm v3  chart files. |
| **Docker**               | Files named Dockerfile                     | Supports Dockerfiles for container configurations.           |
| **Azure ARM Templates**  | JSON files                                 | Supports Azure Resource Manager (ARM) IaC templates in  JSON format. |
| **Azure Bicep**          | `.bicep` files                               | Supports Bicep IaC templates, a domain-specific language (DSL) for ARM. |
| **AWS SAM**              | YAML files                                 | Supports AWS Serverless Application Model (SAM) templates  for serverless resources. |
| **Kustomize**            | YAML files                                 | Supports configuration files for Kubernetes customization  (Kustomize). |
| **Serverless Framework** | YAML files                                 | Supports templates for the Serverless framework in  defining serverless architectures. |
| **OpenAPI**              | YAML, JSON files                           | Supports OpenAPI specification files for defining RESTful  APIs. |

## Enable agentless code scanning on your Azure DevOps and GitHub organizations

You can connect both Azure DevOps and GitHub organizations to Defender for Cloud to enable agentless code scanning. Follow the steps in [Connect your Azure DevOps organizations](quickstart-onboard-devops.md#connect-your-azure-devops-organization) or [Connect your GitHub organizations](quickstart-onboard-github.md#connect-your-github-environment) to get started. 

:::image type="content" source="media/agentless-code-scanning/agentless-code-scanning-setup.gif" alt-text="GIF image showing the setup process for enabling agentless code scanning" lightbox="media/agentless-code-scanning/agentless-code-scanning-setup.gif":::

### Customize scanner coverage and scope

For both GitHub and Azure DevOps, you can control which scanners run and specify exactly which repositories are included or excluded from agentless scanning.

:::image type="content" source="media/agentless-code-scanning/custom-settings-agentless-scanning.png" alt-text="Screenshot showing the custom settings of agentless code scanning." lightbox="media/agentless-code-scanning/custom-settings-agentless-scanning.png":::

- **Select scanners:** Turn each code and infrastructure-as-code (IaC) scanner on or off based on your needs.

- **Set scanning scope:** Decide if you want to scan all repositories by default, or define a custom scope to include or exclude specific organizations, projects, or repositories.
    - **Exclusion mode:** Scan everything except what you list.
    - **Inclusion mode:** Only scan what you list.

- **Custom scope options:** 
    - For **GitHub**, set scope by owner or repository.
    - For **Azure DevOps**, set scope by organization, project, or repository.

- **Auto-discover new repositories:** Autodiscovery of new repositories is always limited to the organizations or projects included in the connector’s scope. It's enabled by default when using exclusion mode and no custom scope list is set. Newly created repositories are scanned automatically. 

    Autodiscovery isn't available in inclusion mode, because only the listed repositories are scanned.

    This allows you to match scanning to your security needs, keep coverage up to date as your environment grows, and avoid unnecessary scans or unscanned areas.

## How agentless code scanning works

Agentless code scanning works independently of CI/CD pipelines. It uses the Azure DevOps or GitHub connector to automatically scan code and infrastructure-as-code (IaC) configurations. You don't need to modify pipelines or add extensions. This setup enables broad and continuous security analysis across multiple repositories. Results are processed and shown directly in Microsoft Defender for Cloud.

:::image type="content" source="media/agentless-code-scanning/agentless-code-scanning-architecture.png" alt-text="Diagram showing the architecture of agentless code scanning." lightbox="media/agentless-code-scanning/agentless-code-scanning-architecture.png":::

### Scanning process

Once you enable the agentless code scanning feature within a connector, the scanning process includes these steps:

1. **Repository discovery**: The system automatically identifies all repositories linked through the Azure DevOps and GitHub connector immediately after connector creation and then every 8 hours.

1. **Code retrieval**: It securely retrieves the latest code from the default (main) branch of each repository for analysis, initially after connector setup and then every 3-4 days.

1. **Analysis**: The system uses a set of built-in scanning tools managed and updated within Microsoft Defender for Cloud to find vulnerabilities and misconfigurations in code and infrastructure-as-code (IaC) templates.

1. **Findings processing**: It processes scan findings through Defender for Cloud’s backend to create actionable security recommendations.

1. **Results delivery**: The system shows findings as [security recommendations](recommendations-reference-devops.md) in Defender for Cloud, allowing security teams to review and address issues.

### Scan frequency and duration

- **Scan frequency**:
    - The security posture of repositories, pipelines, and service connections is assessed when you create the connector and then every eight hours.
    - The system scans code and infrastructure-as-code (IaC) templates for vulnerabilities after you create the connector and then every 2-4 days.  
- **Scan duration**: Scans typically finish within 15 to 60 minutes, depending on the size and complexity of the repository.

## View and manage scan results

After the scans finish, you can access security findings within Microsoft Defender for Cloud.

### Access findings

1. Navigate to the [Security recommendations](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) tab in Microsoft Defender for Cloud.

1. Review recommendations for both Azure DevOps and GitHub repositories, such as:
    - [Repositories should have code scanning findings resolved](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/99232bb2-9b21-4bbb-8e3c-763673b9923d/showSecurityCenterCommandBar~/false) - Indicates vulnerabilities found in code repositories.
     :::image type="content" source="media/agentless-code-scanning/code-scanning-findings.png" alt-text="Screenshot of recommendation Azure DevOps repositories should have code scanning findings resolved." lightbox="media/agentless-code-scanning/code-scanning-findings.png":::

   - [Repositories should have infrastructure as code scanning findings resolved](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/6588c4d4-fbbb-4fb8-be45-7c2de7dc1b3b/showSecurityCenterCommandBar~/false) - Flags security misconfigurations in IaC templates.  
     :::image type="content" source="media/agentless-code-scanning/infrastructure-as-code-scanning-findings.png" alt-text="Screenshot of recommendation Azure DevOps repositories should have infrastructure as code scanning findings resolved." lightbox="media/agentless-code-scanning/infrastructure-as-code-scanning-findings.png":::

1. For the full range of recommendations supported for both platforms, see: [Azure DevOps and GitHub security recommendations](/azure/defender-for-cloud/recommendations-reference-devops).

   Recommendations include items such as requiring multi-reviewer approvals, restricting secret access, and enforcing best practices for both Azure DevOps and GitHub environments.

   Select any recommendation to view details on affected files, severity, and remediation steps.

## Difference between agentless code scanning and in-pipeline scanning

Agentless code scanning and in-pipeline scanning using the Microsoft Security DevOps extension both offer security scanning within Azure DevOps and GitHub. They serve different needs but complement each other. The following table highlights the main differences to help you choose the option that best suits your security and development needs.

| **Aspect**                     | **Agentless code scanning**                                | **In-pipeline scanning**                                   |  
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |  
| **Use case fit**               | Offers broad coverage with minimal disruption to developers  | Provides detailed, pipeline-integrated scans with customizable controls |  
| **Scan scope and coverage**    | Focuses on Infrastructure-as-Code (IaC) and code vulnerability scanning, scheduled every 2-4 days | Offers extensive coverage, including binaries and container images, triggered on each pipeline run |  
| **Setup and configuration**    | Requires no further setup after creating the connector    | Requires manual installation and configuration in each CI/CD pipeline |  
| **Pipeline integration**       | Runs independently of (CI/CD) pipelines without modifying workflows | Integrates within the CI/CD pipeline, requiring configuration in each pipeline |  
| **Scanner customization**      | Allows you to select which scanners run             | Allows customization with specific scanners, categories, languages, sensitivity levels, and non-Microsoft tools |  
| **Results and feedback**       | Provides access to findings within Defender for Cloud        | Offers near real-time feedback within the CI/CD pipeline, with results also visible in Defender for Cloud |  
| **Break and fail criteria**    | Can't break builds                                          | Can be configured to break builds based on the severity of security findings |

### Scalability and performance impact

Agentless code scanning avoids creating resources in the subscription and doesn't require scanning during the pipeline process. It uses the Azure DevOps and GitHub REST API to pull metadata and code. This means API calls count toward Azure DevOps and GitHub rate limits, but you don't incur direct data transfer costs. The service manages scans to ensure they stay within Azure DevOps and GitHub rate limits without interrupting the development environment. This method provides efficient, high-performance scanning across repositories without affecting DevOps workflows. For more information, see [Azure DevOps rate and usage limits](/azure/devops/integrate/concepts/rate-limits) and [Rate limits for the GitHub REST API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api).

## Data security, compliance, and access control for agentless code scanning

Microsoft Defender for Cloud’s agentless code scanning service ensures secure and compliant handling of your code by implementing strict data security and privacy measures:  

- **Data encryption and access control**: The system encrypts all data in transit using industry-standard protocols. Only authorized Defender for Cloud services can access your code.  
- **Data residency and retention**: Scans occur in the same geo as your Azure DevOps and GitHub connectors (US or EU) to comply with data protection laws. The system processes code only during scanning and securely deletes it afterward, with no long-term storage.  
- **Access to repositories**: The service generates a secure access token for Azure DevOps and GitHub to perform scans. This token enables retrieval of necessary metadata and code without creating resources in your subscription. Only Defender for Cloud components have access, protecting data integrity.  
- **Compliance support**: The service aligns with regulatory and security standards for data handling and privacy, ensuring secure processing and scanning of customer code in compliance with regional data protection requirements.  

These measures ensure a secure, compliant, and efficient code scanning process, maintaining your data’s privacy and integrity.

## Limitations (public preview)  

During the **public preview** phase, the following limitations apply:  

- **No binary scanning**: Only code (SAST) and IaC scanning tools are executed.  
- **Scan frequency**: It scans repositories upon enablement, and then after every 2-4 days.  

- **Repository size**: It limits scanning to repositories under 1 GB.

- **Branch coverage**: Scans cover only the default branch (usually `main`).  
- **Tool customization**: You can't customize scanning tools.

## Related content

- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Connect Azure DevOps environments to Defender for Cloud](quickstart-onboard-devops.md)
