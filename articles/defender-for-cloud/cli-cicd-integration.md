---
title: Integrate Defender for Cloud CLI with CI/CD pipelines
description: Learn how to add the ability to integrate Microsoft Defender for Cloud CLI with popular CI/CD pipeline tools.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 12/08/2024
#customer intent: As a security administrator, I want to integrate Defender for Cloud CLI with CI/CD pipelines so that I can run static analysis tools and scan images for vulnerabilities.
---

# Integrate Defender for Cloud CLI with CI/CD pipelines

Defender for Cloud Command Line Interface (CLI) is an application you can use in continuous integration and continuous deployment (CI/CD) pipelines. It runs static analysis tools and connects code to cloud services. You can use Defender for Cloud CLI in any build process to scan images for security vulnerabilities with built-in security scanners. It sends the scan results to the Defender for Cloud portal. The Cloud Security Explorer can then access the container image and its vulnerabilities.

## Prerequisites

- An Azure Subscription with Defender for Cloud onboarded. If you don't already have an Azure account, [create one for free](https://azure.microsoft.com/free/).

- One of the following CI/CD pipeline tools: Jenkins, BitBucket Pipelines, Google Cloud Build, Bamboo, CircleCI, Travis CI, TeamCity, Oracle DevOps services, AWS CodeBuild

- For Azure DevOps, [Microsoft Security DevOps (MSDO) Extension](azure-devops-extension.yml) installed on the Azure DevOps organization.

- The [Defender CSPM](tutorial-enable-cspm-plan.md) enabled.

- Security Admin Permission to create the client ID and secret.

## Setup

In the following sections, we explain how to retrieve the Client ID and Secrets, update the CI/CD pipeline script, and add environment variables to the CI/CD pipeline.

## Retrieve the API Token

To allow security data from the Defender for Cloud CLI to be passed to the Defender for Cloud backend, the security admin in Defender for Cloud must first generate an API key from Defender for Cloud for authentication.

When tokens are generated, the security admin selects a subscription scope to be associated with the token. The data being "pushed" into Defender for Cloud from this token is scoped to the subscription the token is associated with. These API tokens are immutable and can only be generated/deleted.

From there, the security admin must securely pass the token to developers to be added to the CI/CD pipeline.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Management** > **Environment Settings** > **Integrations**.

      :::image type="content" source="media/cli-cicd/env-settings-integrations.png" alt-text="Screenshot of Integration Environment Settings in Defender for Cloud." lightbox="media/cli-cicd/env-settings-integrations.png":::

1. Select **Add integration** and then select **DevOps Ingestion**.

      :::image type="content" source="media/cli-cicd/new-devops-ingestion.png" alt-text="Screenshot of new DevOps Ingestion option." lightbox="media/cli-cicd/new-devops-ingestion.png":::

1. Enter a descriptive name for the token, the selected tenant store the token information. The client secret is generated when you enter a description for the secret and the expiration date.

      :::image type="content" source="media/cli-cicd/add-devops-ingestion.png" alt-text="Screenshot of adding DevOps Ingestion integration." lightbox="media/cli-cicd/add-devops-ingestion.png":::

1. Enable the token in the **Configuration** and create the tokens.

      :::image type="content" source="media/cli-cicd/devops-ingestion-created.png" alt-text="Screenshot of creating DevOps Ingestion and creation of tokens." lightbox="media/cli-cicd/devops-ingestion-created.png":::

1. Copy each token. They can't be edited or retrieved after you select **OK**.

      :::image type="content" source="media/cli-cicd/devops-ingestion-created-success.png" alt-text="Screenshot of successful DevOps Ingestion created." lightbox="media/cli-cicd/devops-ingestion-created-success.png":::

1. In the **Integrations** table, the new **Ingestion** is displayed.

      :::image type="content" source="media/cli-cicd/devops-ingestion-table.png" alt-text="Screenshot of DevOps Integrations table with new ingestion." lightbox="media/cli-cicd/devops-ingestion-table.png":::

## Update the CI/CD pipeline script

Each CI/CD pipeline tool has different syntax. This code is an example of a Bitbucket pipeline:

```yaml
image: atlassian/default-image:3
 
pipelines:
  default:
    - parallel:
      - step:
          name: 'MSDO trivy test'
          script:
            - curl -L -o ./msdo_linux.zip https://www.nuget.org/api/v2/package/Microsoft.Security.DevOps.Cli.linux-x64/
            - unzip ./msdo_linux.zip
            - chmod +x tools/guardian
            - chmod +x tools/Microsoft.Guardian.Cli
            - ls -lah .
            - tools/guardian init --force
            - tools/guardian run -t trivy --export-file ./ubuntu-test.sarif --publish-file-folder-path ./ubuntu-test.sarif            
```

## Pipeline variables

After securely receiving the tokens, the developer must configure an environment variable for the key. The environment variable is passed to the CLI through the shell script that the developer can receive from curl or manually copying the shell script into their repo.

|Name|Value|
|||
|GDN_PUSH_TOKEN_CLIENT_ID|&lt;Client id&gt;|
|GDN_PUSH_TOKEN_CLIENT_ID|&lt;Client id&gt;|
|GDN_PUSH_TOKEN_CLIENT_SECRET|&lt;Client Secret&gt;|
|GDN_PIPELINENAME|bitbucket, jenkins, gcp, bamboo, circle, travis, teamcity, oci, aws|
|GDN_PUSH_TOKEN_TENANT_ID|&lt;Tenant id&gt;|

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
