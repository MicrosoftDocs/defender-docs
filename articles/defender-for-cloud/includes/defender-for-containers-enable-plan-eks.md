---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 02/24/2025
ms.author: dacurwin
author: dcurwin
---

## Enable the plan

> [!IMPORTANT]
>
> - If you haven't connected an AWS account, [connect your AWS account to Microsoft Defender for Cloud](../tutorial-enable-container-aws.md) before you begin the following steps.
> - If you already enabled the plan on your connector, and you want to change optional configurations or enable new capabilities, go directly to step 4.

To help protect your EKS clusters, enable the Defender for Containers plan on the relevant account connector:

1. In Defender for Cloud, open **Environment settings**.

1. Select the AWS connector.

    :::image type="content" source="../media/defender-for-kubernetes-intro/select-aws-connector.png" alt-text="Screenshot of an AWS connector in the Defender for Cloud environment settings.":::

1. Select the **Defender plans** page and verify that the toggle for the **Containers** plan is set to **On**.

1. To change optional configurations for the plan, select **Settings**.

    :::image type="content" source="../media/defender-for-containers-enable-plan-eks/containers-threat-protection.png" alt-text="Screenshot of the settings for the Containers plan in the Defender for Cloud environment settings with Agentless threat protection highlighted." lightbox="../media/defender-for-containers-enable-plan-eks/containers-threat-protection.png":::

    - The [Agentless threat protection](../defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters) feature provides runtime protection to your cluster containers. The feature sends Kubernetes audit logs to Microsoft Defender. Set the **Agentless threat protection** toggle to **On** and set the retention period of your audit logs.

        > [!NOTE]
        > If you disable this configuration, control plane threat detection is disabled. Learn more about [feature availability](../supported-machines-endpoint-solutions-clouds-containers.md).

    - [K8S API access](../defender-for-containers-architecture.md#how-does-agentless-discovery-for-kubernetes-in-aws-work) sets permissions to allow API-based discovery of your Kubernetes clusters. To enable, set the **K8S API access** toggle to **On**.
    - [Registry access](../agentless-vulnerability-assessment-aws.md) sets permissions to allow vulnerability assessment of images stored in ECR To enable, set the **Registry access** toggle to **On**.

1. Continue through the remaining pages of the connector wizard.

1. If you're enabling the **Agentless discovery for Kubernetes** feature, you need to grant control plane permissions on the cluster. You can grant permissions in one of the following ways:

    - Run [this Python script](https://github.com/Azure/Microsoft-Defender-for-Cloud/blob/main/Onboarding/AWS/ReadMe.md). The script adds the Defender for Cloud role `MDCContainersAgentlessDiscoveryK8sRole` to `aws-auth ConfigMap` for the EKS clusters that you want to onboard.
    - Grant each Amazon EKS cluster the `MDCContainersAgentlessDiscoveryK8sRole` role with the ability to interact with the cluster. Sign in to all existing and newly created clusters by using [eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html) and run the following script:

      ```bash
          eksctl create iamidentitymapping \ 
          --cluster my-cluster \ 
          --region region-code \ 
          --arn arn:aws:iam::account:role/MDCContainersAgentlessDiscoveryK8sRole \ 
          --group system:masters\ 
          --no-duplicate-arns
      ```

      For more information, see [Grant IAM users access to Kubernetes with EKS access entries](https://docs.aws.amazon.com/eks/latest/userguide/access-entries.html) in the Amazon EKS user guide.

1. Azure Arc-enabled Kubernetes, the Defender sensor, and Azure Policy for Kubernetes should be installed and running on your EKS clusters. There's a dedicated Defender for Cloud recommendation to install these extensions (and Azure Arc, if necessary): **EKS clusters should have Microsoft Defender's extension for Azure Arc installed.**
 
    Follow the remediation steps provided by the recommendation:
    
    :::image type="content" source="../media/defender-for-kubernetes-intro/install-eks-components-recommendation.png" alt-text="Screenshot explaining how to remediate the EKS clusters recommendation by installing the required Defender for Containers components.":::

### View recommendations and alerts for your EKS clusters

> [!TIP]
> You can simulate container alerts by following the instructions in [this blog post](https://techcommunity.microsoft.com/t5/azure-security-center/how-to-demonstrate-the-new-containers-features-in-azure-security/ba-p/1011270).

To view the alerts and recommendations for your EKS clusters, use the filters on the alerts, recommendations, and inventory pages to filter by resource type **AWS EKS Cluster**.

:::image type="content" source="../media/defender-for-kubernetes-intro/view-alerts-for-aws-eks-clusters.png" alt-text="Screenshot of selections for using filters on the Microsoft Defender for Cloud security alerts page to view alerts related to AWS EKS clusters." lightbox="../media/defender-for-kubernetes-intro/view-alerts-for-aws-eks-clusters.png":::

## Deploy the Defender sensor

To deploy the Defender sensor on your AWS clusters:

1. Go to **Microsoft Defender for Cloud** > **Environment settings** > **Add environment** > **Amazon Web Services**.

    :::image type="content" source="../media/defender-for-kubernetes-intro/add-aws-environment.png" alt-text="Screenshot of selections for adding an AWS environment in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/add-aws-environment.png":::

1. Fill in the account details.

    :::image type="content" source="../media/defender-for-kubernetes-intro/add-aws-account-details.png" alt-text="Screenshot of the form to fill in the account details for an AWS environment in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/add-aws-account-details.png":::

1. Go  to **Select plans**, open the **Containers** plan, and make sure **Auto provision Defender's sensor for Azure Arc** is set to **On**.

    :::image type="content" source="../media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc.png" alt-text="Screenshot of selections for enabling the Defender sensor for Azure Arc in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/enable-sensor-for-azure-arc.png":::

1. Go to **Configure access** and follow the steps there.

    :::image type="content" source="../media/defender-for-kubernetes-intro/configure-access.png" alt-text="Screenshot of the page for configuring access for an AWS environment in Microsoft Defender for Cloud." lightbox="../media/defender-for-kubernetes-intro/configure-access.png":::

1. After the **Cloud Formation** template is deployed successfully, select **Create**.

> [!NOTE]
> You can exclude a specific AWS cluster from automatic provisioning. For sensor deployment, apply the `ms_defender_container_exclude_agents` tag on the resource with the value `true`. For agentless deployment, apply the `ms_defender_container_exclude_agentless` tag on the resource with the value `true`.
