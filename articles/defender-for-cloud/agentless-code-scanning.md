---
title: Configure agentless code scanning for Azure DevOps
description: Discover how agentless code scanning in Microsoft Defender for Cloud identifies vulnerabilities in code and IaC configurations in Azure DevOps.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 11/10/2024
#customer intent: As a security professional, I want to learn how agentless code scanning in Microsoft Defender for Cloud can help identify vulnerabilities in my code and IaC configurations.

---

# Agentless code scanning in Microsoft Defender for Cloud

Agentless code scanning in Microsoft Defender for Cloud offers fast and scalable security coverage for all repositories. It helps security teams find weaknesses in code and infrastructure-as-code (IaC) setups in Azure DevOps. This solution works without needing agent installations, pipeline changes, or permissions from development teams. It simplifies setup and reduces ongoing maintenance.

This method runs independently from continuous integration and continuous deployment (CI/CD) pipelines. It provides continuous insights into code risks, allowing teams to quickly find and fix vulnerabilities and misconfigurations. This approach improves security across repositories without disrupting workflows or reducing productivity.

## Prerequisites

- **Release state**: Public preview
- **Pricing**: Free (during preview)
- **Supported use cases**:
  - ✔️ [Security recommendations to prioritize fix code vulnerabilities](defender-for-devops-introduction.md#manage-your-devops-environments-in-defender-for-cloud)
  - ✔️ [Security recommendations to prioritize and fix Infrastructure-as-Code (IaC) misconfigurations](iac-vulnerabilities.md)
- **Clouds**: Azure commercial clouds
- **Supported regions**: Australia East, Canada Central, Central US, East Asia, East US, North Europe, Sweden Central, UK South, West Europe
- **Supported environments**: Azure DevOps connector
- **Roles and permissions**:
  - **Security Admin**: Can create new connectors or modify existing ones.
  - **Security Reader**: Can view security recommendations, alerts, security policies, and security states but can't modify connector configurations.

## Key benefits

- **Proactive risk management**: Identify risks early in the development process. This supports secure coding practices and reduces vulnerabilities before they reach production.  
- **Effortless onboarding**: Set up quickly with minimal configuration and no pipeline changes.  
- **Enterprise-scale, centralized management**: Automatically scan code across multiple repositories using a single connector. This provides extensive coverage for large environments.  
- **Rapid insights for quick remediation**: Receive actionable vulnerability insights right after onboarding. This enables quick fixes and reduces exposure time.  
- **Developer-friendly and seamless**: Operate independently of continuous integration and continuous deployment (CI/CD) pipelines, with no changes or direct developer involvement needed. This allows for continuous security monitoring without disrupting developer productivity or workflows.

## Risks detection capabilities

Agentless code scanning improves security by offering targeted security advice for both code and Infrastructure-as-Code (IaC) templates. This is in addition to basic Cloud Security Posture Management (CSPM) recommendations provided through the connector. Key detection abilities include:  

- **Code vulnerabilities**: Find common coding errors, unsafe coding practices, and known vulnerabilities in multiple programming languages.  
- **Infrastructure-as-Code misconfigurations**: Detect security misconfigurations in IaC templates that could lead to insecure deployments.  

Creating the connector enhances security by providing a foundational set of security recommendations for repositories, pipelines, and service connections.

## Scanning tools

Agentless code scanning uses various open-source tools to find vulnerabilities and misconfigurations in code and Infrastructure-as-Code (IaC) templates:

| **Tool**              | **Supported IaC/Languages**                                  | **License** |
| --------------------- | ------------------------------------------------------------ | ----------- |
| **Bandit**            | Python                                                       | Apache 2.0  |
| **Checkov**           | Terraform IaC templates, Terraform plan files, AWS CloudFormation templates, Kubernetes manifest files, Helm chart files, Dockerfiles, Azure Azure Resource Manager (ARM) IaC templates, Azure Bicep IaC templates, AWS SAM templates (Serverless Application Model), Kustomize files, Serverless framework templates, OpenAPI specification files | Apache 2.0  |
| **ESLint**            | JavaScript, TypeScript, JSX, TSX                             | MIT         |
| **Template Analyzer** | ARM IaC templates, Bicep IaC templates                       | MIT         |
| **Terrascan**         | Terraform IaC templates (HCL2), Kubernetes manifest files (YAML/JSON), Dockerfiles, AWS CloudFormation templates (YAML/JSON), Azure ARM IaC templates, Helm chart files (v3), Kustomize files | Apache 2.0  |

These tools support a wide range of languages and IaC frameworks, ensuring thorough security analysis across your codebase.

### Supported platforms and file types

#### Version control systems

- **Azure DevOps**: Full support for repositories connected via the Azure DevOps connector.

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
| **Azure Bicep**          | .bicep files                               | Supports Bicep IaC templates, a domain-specific language  (DSL) for ARM. |
| **AWS SAM**              | YAML files                                 | Supports AWS Serverless Application Model (SAM) templates  for serverless resources. |
| **Kustomize**            | YAML files                                 | Supports configuration files for Kubernetes customization  (Kustomize). |
| **Serverless Framework** | YAML files                                 | Supports templates for the Serverless framework in  defining serverless architectures. |
| **OpenAPI**              | YAML, JSON files                           | Supports OpenAPI specification files for defining RESTful  APIs. |

## Enable agentless code scanning on your Azure DevOps organizations

To connect your Azure DevOps organizations to Defender for Cloud and enable agentless code scanning, refer to the instructions in [Connect your Azure DevOps organizations](quickstart-onboard-devops.md#connect-your-azure-devops-organization). The following visual shows the quick, straightforward setup process, guiding you through each step for seamless onboarding.

:::image type="content" source="media/agentless-code-scanning/agentless-code-scanning-setup.gif" alt-text="GIF image showing the setup process for enabling agentless code scanning":::

## How agentless code scanning works

Agentless code scanning works independently of CI/CD pipelines. It uses the Azure DevOps connector to automatically scan code and Infrastructure-as-Code (IaC) configurations. You don't need to modify pipelines or add extensions. This setup enables broad and continuous security analysis across multiple repositories. Results are processed and shown directly in Microsoft Defender for Cloud.

:::image type="content" source="media/agentless-code-scanning/agentless-code-scanning-architecture.png" alt-text="Diagram showing the architecture of agentless code scanning." lightbox="media/agentless-code-scanning/agentless-code-scanning-architecture.png":::

### Scanning process

Once you enable the agentless code scanning feature within a connector, the scanning process follows these steps:  

1. **Repository discovery**: The system automatically identifies all repositories linked through the Azure DevOps connector right after connector creation and then every 8 hours.  
1. **Code retrieval**: It securely retrieves the latest code from the default (main) branch of each repository for analysis, first after connector setup and then every 3-4 days.  
1. **Analysis**: The system uses a set of built-in scanning tools managed and updated within Microsoft Defender for Cloud to find vulnerabilities and misconfigurations in code and IaC templates.  
1. **Findings processing**: It processes scan findings through Defender for Cloud’s backend to create actionable security recommendations.  
1. **Results delivery**: The system shows findings as security recommendations in Defender for Cloud, allowing security teams to review and address issues.

### Scan frequency and duration

- **Scan frequency**:  
  - The security posture of repositories, pipelines, and service connections is assessed when you create the connector and then every 8 hours.  
  - The system scans code and Infrastructure-as-Code (IaC) templates for vulnerabilities every 3-4 days after you create the connector.  
- **Scan duration**: Scans typically finish within 15 to 60 minutes, depending on the size and complexity of the repository.

## Viewing and managing scan results

After the scans finish, you can access security findings within Microsoft Defender for Cloud.

### Accessing findings

1. Navigate to the [Security recommendations](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) tab in Microsoft Defender for Cloud.

1. Review the list of recommendations, which includes findings like:

    - [Azure DevOps repositories should have code scanning findings resolved](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/99232bb2-9b21-4bbb-8e3c-763673b9923d/showSecurityCenterCommandBar~/false) - Indicates vulnerabilities found in code repositories.
        :::image type="content" source="media/agentless-code-scanning/code-scanning-findings.png" alt-text="Screenshot of recommendation Azure DevOps repositories should have code scanning findings resolved" lightbox="media/agentless-code-scanning/code-scanning-findings.png":::

    - [Azure  DevOps repositories should have infrastructure as code scanning findings  resolved](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/6588c4d4-fbbb-4fb8-be45-7c2de7dc1b3b/showSecurityCenterCommandBar~/false) - Points to security misconfigurations detected in IaC template files within repositories.
        :::image type="content" source="media/agentless-code-scanning/infrastructure-as-code-scanning-findings.png" alt-text="Screenshot of recommendation Azure DevOps repositories should have infrastructure as code scanning findings resolved" lightbox="media/agentless-code-scanning/infrastructure-as-code-scanning-findings.png":::

    - Other security recommendations generated by the Azure DevOps connector might include:
            - [Azure   DevOps repositories should have GitHub Advanced Security for Azure DevOps   (GHAzDO) enabled](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/c7a934bf-7be6-407a-84d9-4f20e6e49592/showSecurityCenterCommandBar~/false)
            - [Azure   DevOps pipelines shouldn't have secrets available to builds of forks](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/d5711372-9b5f-4926-a711-13dcf51565a6)
            - [Azure   DevOps service connections shouldn't grant access to all pipelines](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/9245366d-393f-49c5-b8e6-258b1b1c2daa)
            - [Azure   DevOps variable groups with secret variables shouldn't grant access to   all pipelines](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/2c2c801e-6279-4d88-a419-af73f0eff4fb)
            - [Azure   DevOps Classic Azure service connections shouldn't be used to access a   subscription](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsWithRulesBlade/assessmentKey/a887e860-40ff-4b57-9ef9-5177a11091ac)
            - [(Preview)   Azure DevOps repositories should require minimum two-reviewer approval   for code pushes](https://portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/470742ea-324a-406c-b91f-fc1da6a27c0c)
            - [(Preview)   Azure DevOps repositories should not allow requestors to approve their   own Pull Requests](https://portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/98b5895a-0ad8-4ed9-8c9d-d654f5bda816)
            - [(Preview)   Azure DevOps projects should have creation of classic pipelines disabled](https://portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/9f4a17ee-7a02-4978-b968-8c36b74ac8e3)
            - [Azure   DevOps secure files shouldn't grant access to all pipelines](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/6855e9b1-c493-4a43-a6d1-74f30e72c5af)

1. Select any recommendation for detailed information, including affected files, severity levels, and remediation guidance.

## Difference between agentless code scanning and in-pipeline scanning

Agentless code scanning and in-pipeline scanning using the Microsoft Security DevOps extension both offer security scanning within Azure DevOps. They serve different needs but work well together. The following table highlights the main differences to help you choose the option that fits your security and development needs.

| **Aspect**                     | **Agentless code scanning**                                | **In-pipeline scanning**                                   |  
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |  
| **Use case fit**               | Offers broad coverage with minimal disruption to developers  | Provides detailed, pipeline-integrated scans with customizable controls |  
| **Scan scope and coverage**    | Focuses on Infrastructure-as-Code (IaC) and code vulnerability scanning, scheduled every 3-4 days | Offers extensive coverage, including binaries and container images, triggered on each pipeline run |  
| **Setup and configuration**    | Requires no further setup after creating the connector    | Requires manual installation and configuration in each Azure DevOps pipeline |  
| **Pipeline integration**       | Runs independently of (CI/CD) pipelines without modifying workflows | Integrates within the CI/CD pipeline, requiring YAML configuration in each pipeline |  
| **Scanner customization**      | Scanners can't be customized or selectively run             | Allows customization with specific scanners, categories, languages, sensitivity levels, and non-Microsoft tools |  
| **Results and feedback**       | Provides access to findings within Defender for Cloud        | Offers near real-time feedback within the CI/CD pipeline, with results also visible in Defender for Cloud |  
| **Break and fail criteria**    | Can't break builds                                          | Can be configured to break builds based on the severity of security findings |

### Scalability and performance impact

Agentless code scanning aims to minimize impact on your Azure DevOps environment:  

- **Minimal impact on resource limits**: The system sends some REST requests to pull metadata and code, but it manages scans externally. This approach reduces extra load on pipelines and repositories.  
- **Protection from rate throttling**: By reducing direct interactions, agentless scanning helps avoid triggering rate limits. This ensures smooth workflows for your teams.

## Data security, compliance, and access control for agentless code scanning

Microsoft Defender for Cloud’s agentless code scanning service ensures secure and compliant handling of your code by implementing strict data security and privacy measures:  

- **Data encryption and access control**: The system encrypts all data in transit using industry-standard protocols. Only authorized Defender for Cloud services can access your code.  
- **Data residency and retention**: Scans occur in the same geo as your Azure DevOps connector (US or EU) to comply with data protection laws. The system processes code only during scanning and securely deletes it afterward, with no long-term storage.  
- **Access to repositories**: The service generates a secure access token for Azure DevOps to perform scans. This token enables retrieval of necessary metadata and code without creating resources in your subscription. Only Defender for Cloud components have access, protecting data integrity.  
- **Compliance support**: The service aligns with regulatory and security standards for data handling and privacy, ensuring secure processing and scanning of customer code in compliance with regional data protection requirements.  

These measures ensure a secure, compliant, and efficient code scanning process, maintaining your data’s privacy and integrity.

## Limitations (public preview)  

During the **public preview** phase, the following limitations apply:  

- **No binary scanning**: The system scans only code and Infrastructure-as-Code (IaC) files. It excludes binary files.  
- **Scan frequency**: It scans repositories every 3-4 days.  
- **Repository size**: It limits scanning to repositories under 100 MB.  
- **Branch coverage**: Scans cover only the default (main) branch.  
- **Tool customization**: You can't customize scanning tools.

## Related content

- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)
- [Scan your connected GitHub repository or Azure DevOps project](iac-vulnerabilities.md)
