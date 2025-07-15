---
title: Integrate Defender for Cloud CLI with CI/CD pipelines
description: Learn how to add the ability to integrate Microsoft Defender for Cloud CLI with popular CI/CD pipeline tools.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 12/08/2024
#customer intent: As a security administrator, I want to integrate Defender for Cloud CLI with CI/CD pipelines so that I can run static analysis tools and scan images for vulnerabilities.
---

# Integrate Defender for Cloud CLI with CI/CD pipelines (Preview)

**Overview**

Microsoft Defender for Cloud Command‑Line Interface (Defender CLI) lets you embed security scanning directly in your continuous integration and continuous deployment (CI/CD) workflows. The CLI orchestrates several industry‑standard scanners and automatically correlates detected issues with resources monitored by Microsoft Defender for Cloud.

> Currently only results from the Trivy container‑vulnerability scanner are uploaded to Microsoft Defender for Cloud. Scan results from every other scanner still run and appear in the build logs/SARIF files, but they are not sent to the Defender for Cloud backend.

**Key capabilities**

- Container‑image vulnerability assessment with Trivy and automatic ingestion into Cloud Security Explorer.
- In‑pipeline source‑code checks such as SAST, secret‑detection, dependency analysis and IaC scanning.
- Unified, cross‑platform CLI that works with any CI runner (Azure Pipelines, GitHub Actions, Jenkins, Bitbucket, GitLab, CircleCI, Travis CI, AWS CodeBuild and more).
- Standards‑based SARIF output that integrates with pull‑request annotations and quality gates.
- Token‑based authentication scoped to a single Azure subscription for granular control.

## Prerequisites

- An Azure Subscription with Defender for Cloud onboarded. If you don't already have an Azure account, [create one for free](https://azure.microsoft.com/free/).

- One of the following CI/CD pipeline tools: Jenkins, BitBucket Pipelines, Google Cloud Build, Bamboo, CircleCI, Travis CI, TeamCity, Oracle DevOps services, AWS CodeBuild

- The [Defender CSPM](tutorial-enable-cspm-plan.md) enabled.

- Security Admin Permission to create the client ID and secret.

## Setup

In the following sections, we explain how to retrieve the Client ID and Secrets, update the CI/CD pipeline script, and add environment variables to the CI/CD pipeline.

### Retrieve the API Token

To allow security results from the Defender for Cloud CLI to be passed to the Defender for Cloud backend, the Security Admin in Microsoft Defender for Cloud must first generate an API key from Defender for Cloud for authentication.

1. Sign in to the [Azure portal](https://portal.azure.com/)and open **Microsoft Defender for Cloud**.

1. Navigate to **Management ▸ Environment settings ▸ Integrations**.

      :::image type="content" source="media/cli-cicd/env-settings-integrations.png" alt-text="Screenshot of Integration Environment Settings in Defender for Cloud." lightbox="media/cli-cicd/env-settings-integrations.png":::

1. Select **+ Add integration ▸ DevOps Ingestion (Preview)**

      :::image type="content" source="media/cli-cicd/new-devops-ingestion.png" alt-text="Screenshot of new DevOps Ingestion option." lightbox="media/cli-cicd/new-devops-ingestion.png":::
   
1. Provide a name, choose the tenant to store the secret, set an expiration date, and **enable** the token.

   :::image type="content" source="media/cli-cicd/add-devops-ingestion.png" alt-text="Screenshot of adding DevOps Ingestion integration." lightbox="media/cli-cicd/add-devops-ingestion.png":::
   
   :::image type="content" source="media/cli-cicd/devops-ingestion-created.png" alt-text="Screenshot of creating DevOps Ingestion and creation of tokens." lightbox="media/cli-cicd/devops-ingestion-created.png":::
   
1. After **Saving**, copy the **Client ID**, **Client Secret**, and **Tenant ID**. You won’t be able to retrieve them again.

   :::image type="content" source="media/cli-cicd/devops-ingestion-created-success.png" alt-text="Screenshot of successful DevOps Ingestion created." lightbox="media/cli-cicd/devops-ingestion-created-success.png":::
   
### Pipeline variables

After securely receiving the tokens, the developer must configure an environment variable for the key. The environment variable is passed to the CLI through the shell script that the developer can receive from curl or manually copying the shell script into their repo.

|Variable|Description|
|----------|----------|
|GDN_MDC_CLI_CLIENT_ID|Client ID generated above|
|GDN_MDC_CLI_CLIENT_SECRET|Client Secret generated above|
|GDN_MDC_CLI_TENANT_ID|Azure AD Tenant ID|
|GDN_PIPELINENAME|`bitbucket`, `jenkins`, `gcp`, `bamboo`, `circle`, `travis`, `teamcity`, `oci`, `aws`|
|GDN_TRIVY_ACTION|`image`|
|GDN_TRIVY_TARGET| Name of image being scanned|

### Update the CI/CD pipeline script

Below is a minimal Bitbucket Pipeline example that downloads the latest cross‑platform build, initializes the project and runs Trivy. Other examples of CI/CD pipelines can be found in this [GitHub Repository](https://github.com/microsoft/security-devops-samples/tree/main/ci-cd-integrations).

```yaml
image: atlassian/default-image:3
 
pipelines:
  default:
    - parallel:
      - step:
          name: 'Defender CLI Trivy Scan'
          script:
            - curl -L -o ./msdo_linux.zip https://www.nuget.org/api/v2/package/Microsoft.Security.DevOps.Cli.linux-x64/
            - unzip ./msdo_linux.zip
            - chmod +x tools/guardian
            - chmod +x tools/Microsoft.Guardian.Cli
            - tools/guardian init --force
            - tools/guardian run -t trivy --export-file ./ubuntu-test.sarif --publish-file-folder-path ./ubuntu-test.sarif            
```

## Review results in Cloud Security Explorer

1. After running the pipeline successfully, navigate again to Microsoft Defender for Cloud.

1. In the **Defender for Cloud** menu, select **Cloud Security Explorer**.

1. Select **Select resource types** dropdown, select **DevOps**, and then select **Done**.

    :::image type="content" source="media/cli-cicd/cloud-security-explorer.png" alt-text="Screenshot of CI/CD pipeline in Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer.png":::

1. Select the **+** icon to add a new search criteria.

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-search.png" alt-text="Screenshot of new search in Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-search.png":::

1. Choose the **Select condition** dropdown. Then select **Data**, and then select **Pushes**.

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-push.png" alt-text="Screenshot of selecting condition Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-push.png":::

1. Choose the **Select resource types** dropdown. Then select **Containers**, then **Container Images** and then select **Done**.

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-containers.png" alt-text="Screenshot of selecting container images in Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-containers.png":::

1. Select the scope selected during the creation of the integration in Environment settings.

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-scope.png" alt-text="Screenshot of selecting scope Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-scope.png":::

1. Select **Search**.

    :::image type="content" source="media/cli-cicd/cloud-security-explorer.png" alt-text="Screenshot of searching in Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer.png":::

1. See the results of pipeline to images mapping.

### Correlate with monitored containers

1. In Cloud Security Explorer, enter the following query: **CI/CD Pipeline** -> **Pipeline** + **Container Images** -> **Contained in** + **Container registers (group)**.

1. Review the **Resource names** to see the container mapping.

## Related content

- [Create your first pipeline](/azure/devops/pipelines/create-first-pipeline)

- [Overview of Microsoft Defender for Cloud DevOps security](defender-for-devops-introduction.md)

