---
title: Configure Microsoft Defender for Containers components
description: Configure the container protections of Microsoft Defender for Containers
ms.topic: how-to
author: dcurwin
ms.author: dacurwin
ms.custom: devx-track-azurecli
zone_pivot_groups: k8s-host
ms.date: 06/29/2023
---

# Configure Microsoft Defender for Containers components

[Microsoft Defender for Containers](defender-for-containers-introduction.md) is the cloud-native solution for securing your containers. It helps protect your clusters whether they're running in:

- **Azure Kubernetes Service (AKS)**: Microsoft's managed service for developing, deploying, and managing containerized applications.

- **Amazon Elastic Kubernetes Service (EKS) in a connected Amazon Web Services (AWS) account**: Amazon's managed service for running Kubernetes on AWS without needing to install, operate, and maintain your own Kubernetes control plane or nodes.

- **Google Kubernetes Engine (GKE) in a connected Google Cloud Platform (GCP) project**: Google's managed environment for deploying, managing, and scaling applications by using GCP infrastructure.

- **Other Kubernetes distributions** (using Azure Arc-enabled Kubernetes): Cloud Native Computing Foundation (CNCF) certified Kubernetes clusters hosted on-premises or on infrastructure as a service (IaaS). For more information, see [Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md#on-premises-arc-enabled-kubernetes-clusters).

You can first learn how to connect and help protect your containers in these articles:

- [Protect your Azure containers with Defender for Containers](tutorial-enable-containers-azure.md)
- [Protect your on-premises Kubernetes clusters with Defender for Containers](tutorial-enable-containers-arc.md)
- [Protect your Amazon Web Services (AWS) containers with Defender for Containers](tutorial-enable-container-aws.md)
- [Protect your Google Cloud Platform (GCP) containers with Defender for Containers](tutorial-enable-container-gcp.md)

You can also learn more by watching these videos from the *Defender for Cloud in the field* video series:

- [Microsoft Defender for Containers in a multicloud environment](episode-nine.md)
- [Protecting containers in GCP with Defender for Containers](episode-ten.md)

::: zone pivot="defender-for-container-arc"
> [!NOTE]
> Defender for Containers support for Azure Arc-enabled Kubernetes clusters is a preview feature. The preview feature is available on a self-service, opt-in basis.
>
> Previews are provided *as is* and *as available*. They're excluded from the service-level agreements and the limited warranty.
>
> To learn more about the supported operating systems, feature availability, outbound proxy, and more, see [Containers support matrix in Defender for Cloud](support-matrix-defender-for-containers.md).
::: zone-end

::: zone pivot="defender-for-container-aks"
[!INCLUDE [Prerequisites](./includes/defender-for-container-prerequisites-aks.md)]
::: zone-end

::: zone pivot="defender-for-container-arc,defender-for-container-eks,defender-for-container-gke"
[!INCLUDE [Prerequisites](./includes/defender-for-container-prerequisites-arc-eks-gke.md)]
::: zone-end

::: zone pivot="defender-for-container-aks"
[!INCLUDE [Enable plan for AKS](./includes/defender-for-containers-enable-plan-aks.md)]
::: zone-end

::: zone pivot="defender-for-container-arc"
[!INCLUDE [Enable plan for Arc](./includes/defender-for-containers-enable-plan-arc.md)]
::: zone-end

::: zone pivot="defender-for-container-eks"
[!INCLUDE [Enable plan for EKS](./includes/defender-for-containers-enable-plan-eks.md)]
::: zone-end

::: zone pivot="defender-for-container-gke"
[!INCLUDE [Enable plan for GKE](./includes/defender-for-containers-enable-plan-gke.md)]
::: zone-end

## Simulate security alerts from Microsoft Defender for Containers

A full list of supported alerts is available in the [reference table of all Defender for Cloud security alerts](alerts-containers.md).

To simulate a security alert:

1. Run the following command from the cluster:

    ```console
    kubectl get pods --namespace=asc-alerttest-662jfi039n
    ```

    The expected response is `No resource found`.

    Within 30 minutes, Defender for Cloud detects this activity and triggers a security alert.

    > [!NOTE]
    > Azure Arc isn't a prerequisite for simulating agentless alerts for Defender for Containers.

1. In the Azure portal, go to **Microsoft Defender for Cloud** > **Security alerts** and look for the alert on the relevant resource.

    :::image type="content" source="media/defender-for-kubernetes-azure-arc/sample-kubernetes-security-alert.png" alt-text="Screenshot of a sample alert from Microsoft Defender for Kubernetes." lightbox="media/defender-for-kubernetes-azure-arc/sample-kubernetes-security-alert.png":::

::: zone pivot="defender-for-container-arc,defender-for-container-eks,defender-for-container-gke"
[!INCLUDE [Remove the sensor](./includes/defender-for-containers-remove-extension.md)]
::: zone-end

::: zone pivot="defender-for-container-aks"
[!INCLUDE [Assign a custom workspace](./includes/defender-for-containers-assign-workspace-aks.md)]
::: zone-end

::: zone pivot="defender-for-container-arc"
[!INCLUDE [Assign a custom workspace](./includes/defender-for-containers-assign-workspace-arc.md)]
::: zone-end

::: zone pivot="defender-for-container-aks"
[!INCLUDE [Remove the sensor](./includes/defender-for-containers-remove-profile.md)]
::: zone-end

## Learn more

Check out the following blogs:

- [Protect your Google Cloud workloads with Microsoft Defender for Cloud](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/protect-your-google-cloud-workloads-with-microsoft-defender-for/ba-p/3073360)
- [Introducing Microsoft Defender for Containers](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/introducing-microsoft-defender-for-containers/ba-p/2952317)
- [A new name for multicloud security: Microsoft Defender for Cloud](https://techcommunity.microsoft.com/t5/microsoft-defender-for-cloud/a-new-name-for-multi-cloud-security-microsoft-defender-for-cloud/ba-p/2943020)

## Next steps

Now that you've enabled Defender for Containers, you can:

- [Scan your Azure Container Registry images for vulnerabilities](agentless-vulnerability-assessment-azure.md)
- [Scan your AWS images for vulnerabilities with Microsoft Defender Vulnerability Management](agentless-vulnerability-assessment-aws.md)
- [Scan your GCP images for vulnerabilities with Microsoft Defender Vulnerability Management](agentless-vulnerability-assessment-gcp.md)
- Check out [common questions](faq-defender-for-containers.yml) about Defender for Containers.
