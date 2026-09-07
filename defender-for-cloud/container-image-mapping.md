---
title: Map container images from code to runtime
description: Learn how Microsoft Defender for Cloud maps container images from CI/CD pipelines to registries and Kubernetes runtime so teams can trace vulnerabilities back to the right developer and remediate faster.
ms.date: 07/03/2026
ms.topic: how-to
ms.custom: ignite-2023, msecd-doc-authoring-1013
ai-usage: ai-assisted
---

# Map container images from code to runtime

When Defender for Cloud finds a vulnerability in a container image, it can be hard to trace that image back to the original CI/CD pipeline run. This challenge is common whether the image is in a container registry or running in a Kubernetes cluster. Without pipeline context, it's harder to find the right developer and start remediation quickly. Defender Cloud Security Posture Management (CSPM) includes DevOps security capabilities that map container workloads from code to cloud, so teams can start remediation faster.

This article explains the available mapping methods, the prerequisites for each, and how to verify the resulting code-to-runtime mapping in the Azure portal. Before you begin, make sure the required Defender CSPM or Defender for Containers prerequisites are met.

## Code to runtime – technical prerequisites

The following prerequisites are required to establish **code to runtime relationships**.

### General prerequisites (all methods)

The following prerequisites apply regardless of the mapping method used:

- **Defender CSPM (Cloud Security Posture Management)** or **Defender for Containers** must be enabled in your cloud environment.  
  - A limited set of mapping capabilities is included with Defender for Containers.
- Container images must be **built through a CI/CD pipeline**.  
  - Images that are manually built and pushed aren't supported, although some manually built images might still appear in mapping results.
- Container images must be **discoverable by Defender for Cloud**, either by:
  - Being stored in a **supported container registry**, or
  - Running in a **supported Kubernetes environment**

### Option 1: Connect your code environment to Defender for Cloud

When you connect an Azure DevOps or GitHub environment to Defender for Cloud, a set of automated tools is triggered automatically. The automated tools do **not** affect your existing DevOps workflows and enable code-to-runtime mapping.

>[!NOTE]
>
> - Currently supported for **Azure DevOps** and **GitHub**
> - Container images built and deployed **prior** to connecting may have limited support

For steps to connect a code environment to Defender for Cloud, see:

- [Connect Azure DevOps to Defender for Cloud](quickstart-onboard-devops.md)
- [Connect GitHub to Defender for Cloud](quickstart-onboard-github.md)

### Option 2: Docker labels–based mapping

Docker labels-based mapping relies on metadata that is embedded directly in the container image at build time. Defender for Cloud extracts this metadata from the OCI/Docker image manifest and uses it to correlate the image to its source repository.

For more information about Docker labels-based mapping, see:

- [OCI Docker image annotations specification](https://github.com/opencontainers/image-spec/blob/main/annotations.md)
- [Add OCI/Docker labels in Azure DevOps](/azure/devops/pipelines/tasks/reference/docker-v2)
- [Add labels in GitHub](https://github.com/docker/metadata-action?tab=readme-ov-file)
- [Manually provide labels using the Dockerfile `LABEL` instruction](https://docs.docker.com/reference/dockerfile/)

>[!NOTE]
>
>- Docker labels-based mapping does **not** require a DevOps connector.
>- Mapping is performed for Kubernetes environments covered by Defender CSPM or Defender for Containers.

### Option 3: GitHub attestations-based mapping

Attestation-based mapping uses **cryptographically verifiable provenance metadata** generated during GitHub Actions workflows. These attestations link container images to their exact source repository, commit, and build identity.

For more information about attestation-based mapping, see:

- [Using artifact attestations to establish provenance for builds – GitHub Docs](https://docs.github.com/en/actions/how-tos/secure-your-work/use-artifact-attestations/use-artifact-attestations)

## Verify your code to runtime mapping (Azure portal)

Regardless of which mapping method you use (DevOps connector, Docker labels, or GitHub attestations), you can verify the resulting code-to-runtime mapping in the Azure portal. The following example shows how to view mapping results after building a container image in an Azure DevOps CI/CD pipeline and pushing it to a registry. Use [Cloud Security Explorer](how-to-manage-cloud-security-explorer.md) to view the mapping:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Cloud Security Explorer**. Container image mapping can take up to four hours to appear.

1. To see basic mapping, select **Container Images** > **+** > **Pushed by code repositories**.

    :::image type="content" source="media/container-image-mapping/simple-container-mapping.png" alt-text="Screenshot that shows how to find basic mapping of containers." lightbox="media/container-image-mapping/simple-container-mapping.png":::

1. (Optional) Select + by **Container Images** to add filters to your query, such as **Has vulnerabilities**, to show only container images with common vulnerabilities and exposures (CVEs).

1. After you run the query, you see the mapping between the container registry and the pipeline. Select **...** next to the connecting line (edge) to see more details.

    :::image type="content" source="media/container-image-mapping/mapping-results.png" alt-text="Screenshot that shows an advanced query for container mapping results." lightbox="media/container-image-mapping/mapping-results.png":::

## Next steps

- For more information, see [DevOps security in Defender for Cloud](defender-for-devops-introduction.md).
- For more information, see [Code to runtime for recommendations](code-to-runtime-mapping.md).

