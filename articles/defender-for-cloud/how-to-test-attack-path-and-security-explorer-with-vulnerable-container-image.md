---
title: Attack path analysis and enhanced risk-hunting for containers
description: Learn how to test attack paths and perform enhanced risk-hunting for containers with cloud security explorer in Microsoft Defender for Cloud
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 03/02/2026
---

# Attack path analysis and enhanced risk-hunting for containers

Attack path analysis identifies potential paths that attackers could use to reach high-impact resources in your environment. It analyzes relationships between resources and highlights issues that can be remediated to reduce risk.

This article shows how to test attack path analysis by deploying a mock vulnerable container image.

# [Azure](#tab/azure)

## Prerequisites

- [Defender CSPM enabled for your subscription](tutorial-enable-cspm-plan.md).

- Access to an Azure Kubernetes Service (AKS) cluster.

- An Azure Container Registry (ACR) that the cluster can access.

## Test the attack path and security explorer using a mock vulnerable container image

1. Pull a base image (for example, alpine) to your local environment by running the following command:

    ```azurecli
       docker pull alpine
    ```

1. Tag the image with the following label and push it to your ACR. Replace `<MYACR>` with your Azure Container Registry name:

    ```azurecli
        docker tag alpine <MYACR>.azurecr.io/mdc-mock-0001
        docker push <MYACR>.azurecr.io/mdc-mock-0001
    ```

1. If you don't have an AKS (Azure Kubernetes Service) cluster, use the following command to create a new AKS cluster:

    ```azurecli
        az aks create -n myAKSCluster -g myResourceGroup --generate-ssh-keys --attach-acr $MYACR
    ```

1. If your AKS isn't attached to your ACR, use the following Cloud Shell command line to point your AKS instance to pull images from the selected ACR:

    ```azurecli
        az aks update -n myAKSCluster -g myResourceGroup --attach-acr <acr-name>
    ```

1. Authenticate your Cloud Shell session to work with the cluster

    ```azurecli
    az aks get-credentials  --subscription <cluster-suid> --resource-group <your-rg> --name <your-cluster-name>    
    ```

1. Install the [ngnix ingress Controller](https://docs.nginx.com/nginx-ingress-controller/installation/installing-nic/installation-with-helm/) :

    ```azurecli
    helm install ingress-controller oci://ghcr.io/nginxinc/charts/nginx-ingress --version 1.0.1
    ```

1. Deploy the mock vulnerable image to expose the vulnerable container to the internet by running the following command:

    ```azurecli
    helm install dcspmcharts  oci://mcr.microsoft.com/mdc/stable/dcspmcharts --version 1.0.0 --namespace mdc-dcspm-demo --create-namespace --set image=<your-image-uri> --set distribution=AZURE
    ```

### Verify deployment

1. Look for an entry with **mdc-dcspm-demo** as namespace.

1. Go to **Workloads** > **Deployments**.

1. Verify `pod1` and `pod2` are created 3/3 and **ingress-controller-nginx-ingress-controller** is created 1/1.

1. Go to **Services and Ingresses**.

1. Verify that **service1** and **ingress-controller-nginx-ingress-controller** are listed. 

1. Verify one **ingress** is created with an IP address and nginx class.

# [AWS](#tab/aws)

## Prerequisites

- [Defender CSPM enabled for your AWS account](tutorial-enable-cspm-plan.md).

- Access to an Amazon Elastic Kubernetes Service (EKS) cluster.

- An Amazon Elastic Container Registry (ECR) repository that the cluster can access.

## Test the attack path and security explorer using a mock vulnerable container image

1. Create an Amazon ECR repository named `mdc-mock-0001`.

1. In your AWS account, select **Command line or programmatic access**.

1. Select **Option 1: Set AWS environment variables (Short-term credentials)**. 

1. Copy the values for the following credentials:
   * *AWS_ACCESS_KEY_ID*
   * *AWS_SECRET_ACCESS_KEY*
   * *AWS_SESSION_TOKEN*

1. Run the following command to get the authentication token for your Amazon ECR registry. Replace `<REGION>` with the region of your registry and `<ACCOUNT>` with your AWS account ID.

    ```awscli
    aws ecr get-login-password --region <REGION> | docker login --username AWS --password-stdin <ACCOUNT>.dkr.ecr.<REGION>.amazonaws.com
    ```

1. Create a Docker image that is tagged as vulnerable by name. The image name must include *mdc-mock-0001*. 

1. Push the image to your ECR registry. Replace `<ACCOUNT>` and `<REGION>` with your AWS account ID and region.

    ```awscli
    docker pull alpine
    docker tag alpine <ACCOUNT>.dkr.ecr.<REGION>.amazonaws.com/mdc-mock-0001
    docker push <ACCOUNT>.dkr.ecr.<REGION>.amazonaws.com/mdc-mock-0001
    ```

1. Connect to your EKS cluster.

1. Configure `kubectl` to work with your EKS cluster. Replace `<your-region>` and `<your-cluster-name>` with your EKS cluster region and name.

    ```awscli
    aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>
    ```

1. Check if `kubectl` is correctly configured by running:

    ```awscli
    kubectl get nodes
    ```

1. Install the [ngnix ingress Controller](https://docs.nginx.com/nginx-ingress-controller/installation/installing-nic/installation-with-helm/) :

    ```awscli
    helm install ingress-controller oci://ghcr.io/nginxinc/charts/nginx-ingress --version 1.0.1
    ```

1. Install the following Helm chart. 
The Helm chart deploys resources onto your cluster that you can use to infer attack paths. It also includes the vulnerable image.

    ```awscli
    helm install dcspmcharts oci://mcr.microsoft.com/mdc/stable/dcspmcharts --version 1.0.0 --namespace mdc-dcspm-demo --create-namespace --set image=<ACCOUNT>.dkr.ecr.<REGION>.amazonaws.com/mdc-mock-0001 --set distribution=AWS
    ```

## [GCP](#tab/gcp)

## Prerequisites

- [Defender CSPM enabled for your GCP project](tutorial-enable-cspm-plan.md).

- Access to a Google Kubernetes Engine (GKE) cluster.

- A Google Artifact Registry repository that the cluster can access.

## Test the attack path and security explorer using a mock vulnerable container image

1. Sign in to the GCP portal.

1. Search for **Artifact Registry**.

1. Create a GCP repository named *mdc-mock-0001*.

1. Follow the GCP documentation, [Push and pull images](https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling), to push the image to your repository. Run these commands:

    ```docker
    docker pull alpine
    docker tag alpine <LOCATION>-docker.pkg.dev/<PROJECT_ID>/<REGISTRY>/<REPOSITORY>/mdc-mock-0001
    docker push <LOCATION>-docker.pkg.dev/<PROJECT_ID>/<REGISTRY>/<REPOSITORY>/mdc-mock-0001
    ```

1. Go to **Kubernetes Engine** > **Clusters**. 

1. Select the **Connect** button.

1. Run the following command in the Cloud Shell:

   ```gcloud-cli
   gcloud container clusters get-credentials contra-bugbash-gcp --zone us-central1-c --project onboardingc-demo-gcp-1
   ```

1. Check if `kubectl` is correctly configured by running:

    ```gcloud-cli
    kubectl get nodes
    ```

1. To install the Helm chart, follow these steps:

    1. Go to **Artifact registry** > **Repository**.
    1. Search for the image URI under **Pull by digest**.
    1. Run the following command to install the Helm chart:
    The Helm chart deploys resources onto your cluster that you can use to infer attack paths. It also includes the vulnerable image.

        ```gcloud-cli
        helm install dcspmcharts oci:/mcr.microsoft.com/mdc/stable/dcspmcharts --version 1.0.0 --namespace mdc-dcspm-demo --create-namespace --set image=<IMAGE_URI> --set distribution=GCP
        ```
---

> [!NOTE]
> It can take up to 24 hours for results to appear in Attack path analysis and Cloud Security Explorer.

## View attack paths

After deploying the mock scenario, you can view the generated attack path in **Microsoft Defender for Cloud**:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Attack path analysis**.

1. Locate the attack path related to the deployed resources.

Learn how to [identify and remediate attack paths](how-to-manage-attack-path.md).

## Investigate container risks with Cloud Security Explorer

After deploying the mock vulnerable image, you can use Cloud Security Explorer to identify related risks and explore how they contribute to attack paths.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Cloud Security Explorer**.

You can build queries in one of the following ways:

- [Use built-in query templates](how-to-manage-cloud-security-explorer.md#query-templates)

- [Create custom queries](how-to-manage-cloud-security-explorer.md#build-a-query)
