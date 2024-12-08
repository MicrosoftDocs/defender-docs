---
author: jbrotsos
ms.author: jamesbrotsos
ms.service: defender-for-cloud
title: Integrate Defender for Cloud CLI with CI/CD Pipelines
description: Adding the ability to integrate Defender for Cloud CLI with popular CI/CD pipeline tools.
ms.topic: how-to
ms.date: 11/25/2024
feedback_help_link_url: https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/bd-p/MicrosoftDefenderCloud
feedback_help_link_type: ask-the-community
feedback_product_url: https://feedback.azure.com/d365community/forum/0f853254-0425-ec11-b6e6-000d3a4f07b8
adobe-target: true
featureFlags:
- show_learn_banner
learn_banner_products:
- azure
manager: raynew
titleSuffix: Microsoft Defender for Cloud
---


# Integrate Defender for Cloud CLI with CI/CD Pipelines

Defender for Cloud CLI is a command line application that can be integrated into CI/CD pipelines to run static analysis tools and help connect "code-to-cloud." Defender for Cloud CLI can run in any build process and scan images for vulnerabilities using built in security scanners. The scan results are pushed into MDC portal so that the container image and its vulnerabilities can be retrieved by the Cloud Security Explorer.

## Prerequisites

- An Azure Subscription with Defender for Cloud onboarded. If you don't already have an Azure account, [create one for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).

- One of the following CI/CD pipeline tools: Jenkins, BitBucket Pipelines, Google Cloud Build, Bamboo, CircleCI, Travis CI, TeamCity, Oracle DevOps services, AWS CodeBuild

- For Azure DevOps, [Microsoft Security DevOps (MSDO) Extension](/azure/defender-for-cloud/azure-devops-extension) installed on the Azure DevOps organization.

- [Defender CSPM](/azure/defender-for-cloud/tutorial-enable-cspm-plan) enabled.

- Security Admin Permission to create client ID & secret.

## Setup

1. Retrieve the Client ID & Secrets

1. Update the CI/CD pipeline script

1. Add Environment variables to CI/CD pipeline

## Retrieving the API Token

To allow security data from the Defender for Cloud CLI to be passed to MDC backend, the security admin in MDC first must generate an API key from MDC for authentication.

When tokens are generated, the security admin selects a subscription scope to be associated with the token. The data being "pushed" into MDC from this token will be scoped to the subscription the token is associated with. These API tokens are immutable and can only be generated/deleted.

From there, the security admin must securely pass the token to developers to be added to the CI/CD pipeline.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Management** > **Environment Settings** > **Integrations**

  :::image type="content" source="media/cli-cicd/env-settings-integrations.png" alt-text="Screenshot of Integration Enviornment Settings." lightbox="media/cli-cicd/env-settings-integrations.png":::

1. Select **Add integration** and select **DevOps Ingestion**

  :::image type="content" source="media/cli-cicd/new-devops-ingestion.png" alt-text="Screenshot of New DevOps Ingestion." lightbox="media/cli-cicd/new-devops-ingestion.png":::

1. Enter a descriptive name for the token, the selected tenant store the token information. The client secret will be generated when you enter a description for the secret and the expiration date.

  :::image type="content" source="media/cli-cicd/add-devops-ingestion.png" alt-text="Screenshot of adding DevOps Ingestion." lightbox="media/cli-cicd/add-devops-ingestion.png":::

1. Enable the token in the Configuration and create the tokens.

  :::image type="content" source="media/cli-cicd/devops-ingestion-created.png" alt-text="Screenshot of creating DevOps Ingestion." lightbox="media/cli-cicd/devops-ingestion-created.png":::

1. Copy each token, they cannot be edited or retrieved after you click OK

  :::image type="content" source="media/cli-cicd/devops-ingestion-created-success.png" alt-text="Screenshot of successful DevOps Ingestion created." lightbox="media/cli-cicd/devops-ingestion-created-success.png":::

1. In the **Integrations** table, the new Ingestion will be displayed.

  :::image type="content" source="media/cli-cicd/devops-ingestion-table.png" alt-text="Screenshot of DevOps Ingestion Table." lightbox="media/cli-cicd/devops-ingestion-table.png":::

## Update the CI/CD pipeline script

Each CI/CD pipeline tool has different syntax. This is an example of a Bitbucket pipeline.


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

## Pipeline Variables

After securely receiving the tokens, the developer must configure an environment variable for the key. The environment variable will be passed to the CLI through the shell script that the developer can receive from curl or manually copying the shell script into their repo.

|Name|Value|
|||
|GDN_PUSH_TOKEN_CLIENT_ID|&lt;Client id&gt;|
|GDN_PUSH_TOKEN_CLIENT_ID|&lt;Client id&gt;|
|GDN_PUSH_TOKEN_CLIENT_SECRET|&lt;Client Secret&gt;|
|GDN_PIPELINENAME|bitbucket, jenkins, gcp, bamboo, circle, travis, teamcity, oci, aws|
|GDN_PUSH_TOKEN_TENANT_ID|&lt;Tenant id&gt;|

## Review Results in Cloud Security Explorer

1. After running the pipeline successfully, navigate again to Microsoft Defender for Cloud.

1. In the **Defender for Cloud** menu, select **Cloud Security Explorer**.

1. Click **Select resource types** dropdown, select **DevOps** and click **Done**

  :::image type="content" source="media/cli-cicd/cloud-security-explorer.png" alt-text="Screenshot of Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer.png":::

1. Select + icon to add a new search criteria

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-search.png" alt-text="Screenshot of new search in Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-search.png":::

1. Click **Select condition** dropdown, Select Data, Select Pushes

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-push.png" alt-text="Screenshot of selecting condition Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-push.png":::

1. Click **Select resource types** dropdown, select Containers, Container Images and click **Done**

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-containers.png" alt-text="Screenshot of selecting containger images in Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-containers.png":::

1. Select the scope selected during the creation of the integration in the Environment settings

    :::image type="content" source="media/cli-cicd/cloud-security-explorer-scope.png" alt-text="Screenshot of selecting scope Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer-scope.png":::

1. Click Search

    :::image type="content" source="media/cli-cicd/cloud-security-explorer.png" alt-text="Screenshot of searching in Cloud Security Explorer." lightbox="media/cli-cicd/cloud-security-explorer.png":::

1. See results of Pipeline to images mapping 


## Correlating with Monitored Containers


1. In Cloud Security Explorer, enter the below query: **CI/CD Pipeline** -> **Pipeline** + **Container Images** -> **Contained in** + **Container registers (group)**    

1. Review the Resource names to see the container mapping.

  :::image type="content" source="media/cli-cicd/container-images.png" alt-text="Screenshot of correlating Monitored Containers." lightbox="media/cli-cicd/container-images.png":::
