---
title: Attack path analysis and enhanced risk-hunting for containers
description: Learn how to test attack paths and perform enhanced risk-hunting for containers with cloud security explorer in Microsoft Defender for Cloud
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 03/02/2026
---

# Attack path analysis and enhanced risk-hunting for containers

Attack path analysis is a graph-based algorithm that scans the cloud security graph. The scans expose paths that bad actors might exploit to breach your environment and reach your high-impact assets. Attack path analysis exposes attack paths and suggests recommendations for remediating issues that break the attack path and prevent a successful breach.

You can explore and investigate [attack paths](how-to-manage-attack-path.md) by sorting them based on risk level, name, environment, risk factors, entry point, target, affected resources, and active recommendations. You can also explore cloud security graph Insights on the resource. Examples of Insight types include:

- Pod exposed to the internet
- Privileged container
- Pod uses host network
- Container image is vulnerable to remote code execution

## Test the attack path and security explorer using a mock vulnerable container image for each cloud provider

## [Azure](#tab/testing-the-attack-path-and-security-explorer-using-a-mock-vulnerable-container-image-for-azure)

### Test the attack path and security explorer by using a mock vulnerable container image for Azure

If the list of attack paths has no entries, you can still test this feature by using a mock container image. Use the following steps to set up the test:

**Requirement:** An instance of Azure Container Registry (ACR) in the tested scope.

#### Import a mock vulnerable image to your Azure Container Registry

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

#### Verify deployment

1. Look for an entry with **mdc-dcspm-demo** as namespace.
1. Go to **Workloads-> Deployments**.
1. Verify `pod1` and `pod2` are created 3/3 and **ingress-controller-nginx-ingress-controller** is created 1/1.
1. Go to **Services and Ingresses**.
1. Verify that **service1** and **ingress-controller-nginx-ingress-controller** are listed. 
1. Verify one **ingress** is created with an IP address and nginx class.


## [**AWS**](#tab/testing-the-attack-path-and-security-explorer-using-a-mock-vulnerable-container-image-for-aws)

### Testing the attack path and security explorer by using a mock vulnerable container image for AWS

1. Create an ECR repository named *mdc-mock-0001*.
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

    ```azurecli
    helm install ingress-controller oci://ghcr.io/nginxinc/charts/nginx-ingress --version 1.0.1
    ```

1. Install the following Helm chart. 
The Helm chart deploys resources onto your cluster that you can use to infer attack paths. It also includes the vulnerable image.

    ```awscli
    helm install dcspmcharts oci://mcr.microsoft.com/mdc/stable/dcspmcharts --version 1.0.0 --namespace mdc-dcspm-demo --create-namespace --set image=<ACCOUNT>.dkr.ecr.<REGION>.amazonaws.com/mdc-mock-0001 --set distribution=AWS
    ```


## [**GCP**](#tab/testing-the-attack-path-and-security-explorer-using-a-mock-vulnerable-container-image-for-gcp)

### Testing the attack path and security explorer by using a mock vulnerable container image for GCP

1. Sign in to the GCP portal.
1. Search for **Artifact Registry**
1. Create a GCP repository named *mdc-mock-0001*
1. Follow the GCP documentation ,[Push and pull images](https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling) to push the image to your repository. Run these commands:

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

    1. Go to **Artifact registry**  > **Repository**
    1. Search for the image URI under **Pull by digest**.
    1. Run the following command to install the Helm chart:
    The Helm chart deploys resources onto your cluster that you can use to infer attack paths. It also includes the vulnerable image.

        ```gcloud-cli
        helm install dcspmcharts oci:/mcr.microsoft.com/mdc/stable/dcspmcharts --version 1.0.0 --namespace mdc-dcspm-demo --create-namespace --set image=<IMAGE_URI> --set distribution=GCP
        ```

---

> [!NOTE]
> It can take up to 24 hours to see results in the cloud security explorer and attack path.

After you finish testing the attack path, investigate the created attack path by going to **Attack path analysis**, and search for the attack path you created. For more information, see [Identify and remediate attack paths](how-to-manage-attack-path.md).

### Find container posture issues with cloud security explorer

You can build queries in one of the following ways:

- [Explore risks with built-in cloud security explorer templates](how-to-manage-cloud-security-explorer.md#query-templates)
- [Create custom queries with cloud security explorer](how-to-manage-cloud-security-explorer.md#build-a-query)


## Next steps

- Learn more about the [Microsoft Defender for Cloud plans](defender-for-cloud-introduction.md#cloud-workload-protection-platform-cwpp).
