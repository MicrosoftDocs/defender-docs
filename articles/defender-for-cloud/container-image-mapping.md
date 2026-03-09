---
title: Map container images from code to runtime
description: Learn how to map your container images from code to cloud.
ms.date: 03/09/2026
author: dlanger
ms.author: dlanger
ms.topic: how-to
ms.custom: ignite-2023
---

# Map container images from code to runtime

When a vulnerability is identified in a container image, whether it’s stored in a container registry or running in a Kubernetes cluster, security practitioners might struggle to trace it back to the CI/CD pipeline that originally built it. Without that context, it's difficult to identify the developer responsible for fixing the issue. Microsoft Defender Cloud Security Posture Management (CSPM) includes DevOps security capabilities that let you map your cloud-native applications from code to cloud. As a result, you can easily kick off developer remediation workflows and reduce the time it takes to remediate vulnerabilities in your container images.

## Code to runtime – technical prerequisites

The following prerequisites are required to establish **code to runtime relationships**.

### General prerequisites (all methods)

The following prerequisites apply regardless of the mapping method used:

- **Defender CSPM (Cloud Security Posture Management)** or **Defender for Containers** must be enabled on your cloud environment  
  - A limited set of mapping capabilities is included with Defender for Containers.
- Container images must be **built through a CI/CD pipeline**  
  - Images that are manually built and pushed are not supported (in some cases, manually built/pushed images may still have mapping).
- Container images must be **discoverable by Defender for Cloud**, either by:
  - Being stored in a **supported container registry**, or
  - Running in a **supported Kubernetes environment**

### Method 1: Connect your code environment to Defender for Cloud

When you connect your code environment to Defender for Cloud, a set of automated tools is triggered automatically. These tools do **not** affect your existing DevOps workflows and enable code-to-runtime mapping.

>[!NOTE]
>
> - Currently supported for **Azure DevOps** and **GitHub**
> - Container images built and deployed **prior** to connecting may have limited support

**Learn more:**

- [Connect Azure DevOps to Defender for Cloud](quickstart-onboard-devops.md)
- [Connect GitHub to Defender for Cloud](quickstart-onboard-github.md)

### Method 2: Docker labels–based mapping

Docker labels–based mapping relies on metadata embedded directly into the container image at build time. Defender for Cloud extracts this metadata from the OCI/Docker image manifest and uses it to correlate the image to its source repository.

**Learn more:**

- [OCI Docker image annotations specification](https://github.com/opencontainers/image-spec/blob/main/annotations.md)
- [Add OCI/Docker labels in Azure DevOps](/azure/devops/pipelines/tasks/reference/docker-v2)
- [Add labels in GitHub](https://github.com/docker/metadata-action?tab=readme-ov-file)
- [Manually provide labels using the Dockerfile `LABEL` instruction](https://docs.docker.com/reference/dockerfile/)

>[!NOTE]
>
>- This method does **not** require a DevOps connector.
>- Mapping is performed for Defender CSPM or Defender for Containers–covered Kubernetes environments.

### Method 3: GitHub ttaestations–based mapping

Attestation-based mapping uses **cryptographically verifiable provenance metadata** generated during GitHub Actions workflows. These attestations link container images to their exact source repository, commit, and build identity.

**Learn more:**

- [Using artifact attestations to establish provenance for builds – GitHub Docs](https://docs.github.com/en/actions/how-tos/secure-your-work/use-artifact-attestations/use-artifact-attestations)

## Map your container image from Azure DevOps pipelines to the container registry

After building a container image in an Azure DevOps CI/CD pipeline and pushing it to a registry, see the mapping by using the [Cloud Security Explorer](how-to-manage-cloud-security-explorer.md):

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**. It can take a maximum of 4 hours for the container image mapping to appear in the Cloud Security Explorer.

1. To see basic mapping, select **Container Images** > **+** > **Pushed by code repositories**.

    :::image type="content" source="media/container-image-mapping/simple-container-mapping.png" alt-text="Screenshot that shows how to find basic mapping of containers." lightbox="media/container-image-mapping/simple-container-mapping.png":::

1. (Optional) Select + by **Container Images** to add other filters to your query, such as **Has vulnerabilities** to filter only container images with CVEs.

1. After running your query, you'll see the mapping between container registry and Azure DevOps pipeline. Select **...** next to the edge to see more details on where the Azure DevOps pipeline was run.

    :::image type="content" source="media/container-image-mapping/mapping-results.png" alt-text="Screenshot that shows an advanced query for container mapping results." lightbox="media/container-image-mapping/mapping-results.png":::

The following is an example of an advanced query that utilizes container image mapping. Starting with a Kubernetes workload that is exposed to the internet, you can trace all container images with high severity CVEs back to the Azure DevOps pipeline where the container image was built, empowering a security practitioner to kick off a developer remediation workflow.

  :::image type="content" source="media/container-image-mapping/advanced-mapping-query.png" alt-text="Screenshot that shows basic container mapping results." lightbox="media/container-image-mapping/advanced-mapping-query.png":::

> [!NOTE]
> If your Azure DevOps organization had the Azure DevOps connector created prior to November 15, 2023, navigate to **Organization settings** > **Extensions > Shared** and install the container image mapping decorator. If you don't see the extension shared with your organization, fill out the following [form](https://aka.ms/ContainerImageMappingForm).

## Next steps

- Learn more about [DevOps security in Defender for Cloud](defender-for-devops-introduction.md).
