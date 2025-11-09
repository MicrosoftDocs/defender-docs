---
title: CI/CD in pipeline-scanning with Defender for Cloud CLI
description: Learn how to integrate Microsoft Defender for Cloud CLI into your CI/CD workflows for automated security scanning and standards-based SARIF output.
#customer intent: As a developer, I want to integrate Microsoft Defender for Cloud CLI into my CI/CD pipeline so that I can automate security scanning for container images.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 11/06/2025
ms.topic: concept-article
---

# CI/CD in pipeline-scanning with Defender for Cloud CLI

Microsoft Defender for Cloud Command‑Line Interface (Defender for Cloud CLI) lets you embed security scanning directly in your continuous integration and continuous deployment (CI/CD) workflows. The CLI orchestrates security scanners and can run locally for developers.

## Key capabilities

* Container‑image vulnerability assessment and automatic ingestion into Cloud Security Explorer.
* Unified, cross‑platform CLI that works with any CI runner (Azure Pipelines, GitHub Actions, Jenkins, Bitbucket, GitLab, CircleCI, Travis CI, AWS CodeBuild, and more).
* Standards‑based SARIF output that integrates with pull‑request annotations and quality gates.
* Token‑based authentication scoped to a single Azure subscription for granular control or Azure DevOps Connector authentication.

## Prerequisites

* An Azure Subscription with Defender for Cloud onboarded. If you don't already have an Azure account, [create one for free](https://azure.microsoft.com/pricing/purchase-options/azure-account).
* Defender CSPM enabled.
* One of the following CI/CD pipeline tools: Jenkins, BitBucket Pipelines, Google Cloud Build, Bamboo, CircleCI, Travis CI, TeamCity, Oracle DevOps services, or AWS CodeBuild.
* Linux terminal (or WSL) for local desktop scans.
* Security Admin permission to create the client ID and secret tokens if using token‑based authentication, or an Azure DevOps connector established if using connector‑based authentication.

## Authentication setup

Defender for Cloud CLI supports two authentication methods to align with enterprise security practices.

### Token‑based authentication

Security admins create tokens in the Microsoft Defender for Cloud (MDC) portal and configure them as environment variables in CI/CD pipelines or local terminals. This approach offers flexibility across build systems and enables targeted scoping by subscription.

### Connector-based authentication

Connector-based authentication is currently available only for Azure DevOps. When you establish a connector between Azure DevOps and Defender for Cloud, the authentication process happens automatically. You don't need to add tokens to your pipelines.

For detailed steps and examples, see:

* [Defender for Cloud CLI Authentication token-based instructions](defender-cli-authentication.md)
* [Connect your Azure DevOps organizations](quickstart-onboard-devops.md)

## Configure your CI/CD pipeline

Choose the configuration example that matches your CI/CD platform and authentication method.

### Azure DevOps (Connector-based authentication)

```yaml
- task: MicrosoftDefenderCLI@2
    inputs:
      command: 'run'
      scanType: 'image'
      imageName: $(ImageName)
      break: false
```

### GitHub (Token-based authentication)

```yaml
- name: Download Defender for Cloud CLI
  run: |
    curl -L -o defender "https://aka.ms/defender-cli_linux-x64" && chmod +x defender
- name: Run Defender for Cloud CLI Scan (Built)
  run: |
    #replace image-name with the Container image built      
    ./defender scan image '${{ image-name }}'
  continue-on-error: true
  env:
    DEFENDER_TENANT_ID: ${{ secrets.DEFENDER_TENANT_ID }}
    DEFENDER_CLIENT_ID: ${{ secrets.DEFENDER_CLIENT_ID }}
    DEFENDER_CLIENT_SECRET: ${{ secrets.DEFENDER_CLIENT_SECRET }}
```

### Jenkins (Token-based authentication)

```groovy
environment {
  DEFENDER_TENANT_ID=credentials('defender-tenant-id')
  DEFENDER_CLIENT_ID=credentials('defender-client-id')
  DEFENDER_CLIENT_SECRET=credentials('defender-client-secret')
} 

stage('Download & Run Defender for Cloud CLI') {
  steps {
    script {
      node {
        sh 'curl -L -o defender "https://aka.ms/defender-cli_linux-x64"'
        sh 'chmod +x defender'
        sh './defender scan image ${IMAGE_NAME}'
      }
    }
  }
}
```
