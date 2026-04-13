---
title: Kubernetes data plane hardening
description: Learn how to use Microsoft Defender for Cloud's set of Kubernetes data plane hardening security recommendations
ms.topic: how-to
author: Elazark
ms.author: elkrieger
ms.date: 03/23/2026
---

# Configure Kubernetes data plane hardening in Defender for Cloud

Kubernetes data plane hardening helps enforce secure configurations for workloads running in your cluster, such as restricting privileged containers, enforcing resource limits, and limiting network access.

In Microsoft Defender for Cloud, data plane hardening is implemented by using [Azure Policy](defender-for-cloud-glossary.md#azure-policy-for-kubernetes) for Kubernetes to evaluate and enforce these configurations. Azure Policy is deployed as part of Defender for Containers when automatic provisioning is enabled.

If Azure Policy for Kubernetes is turned off in the Defender for Containers plan settings, you can deploy it by remediating the relevant recommendation. You can also deploy Azure Policy manually by using [Azure CLI](defender-for-containers-deploy-azure-cli.md) or [Helm](deploy-helm.md) if you didn't use automatic provisioning or if you excluded clusters from automatic provisioning.

If Azure Policy for Kubernetes is turned off in the Defender for Containers plan settings, you can deploy it by remediating the relevant recommendation. You can also deploy Azure Policy manually by using [Azure CLI](defender-for-containers-deploy-azure-cli.md) or [Helm](deploy-helm.md) if you disabled automatic provisioning during enablement or excluded specific clusters from automatic provisioning.

After Azure Policy for Kubernetes is deployed, Defender for Cloud generates data plane hardening recommendations based on your cluster configuration. This page shows how to review these recommendations, configure policy parameters, and enforce them on your clusters.

## Prerequisites

To begin, make sure that:

- [Defender for Containers is enabled on your subscription](defender-for-containers-enable-portal.md).
- You have added the [required FQDN/application rules for Azure policy](/azure/aks/outbound-rules-control-egress#azure-policy).
- (For non AKS clusters) Your Kubernetes cluster is [connected to Azure Arc](/azure/azure-arc/kubernetes/quickstart-connect-cluster).

## Deploy Azure Policy for Kubernetes by remediating recommendations

If Azure Policy for Kubernetes isn't deployed or was turned off in the Defender for Containers plan settings, you can install it by remediating the relevant recommendation in Defender for Cloud.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for the relevant recommendation:

   - **Azure:** Azure Kubernetes Service clusters should have the Azure Policy add-on for Kubernetes installed
   - **GCP:** GKE clusters should have the Azure Policy extension installed
   - **AWS/Arc-enabled Kubernetes:** Azure Arc-enabled Kubernetes clusters should have the Azure Policy extension installed
   
   :::image type="content" source="./media/kubernetes-workload-protections/azure-kubernetes-service-clusters-recommendation.png" alt-text="Screenshot showing the Azure Kubernetes service clusters recommendation." lightbox="media/kubernetes-workload-protections/azure-kubernetes-service-clusters-recommendation.png":::

1. Select a recommendation.

1. In the **Take action** tab, select **Fix**.
   
   :::image type="content" source="media/kubernetes-workload-protections/azure-kubernetes-service-clusters-recommendation-fix.png" alt-text="Screenshot of a recommendation with the Fix button highlighted." lightbox="media/kubernetes-workload-protections/azure-kubernetes-service-clusters-recommendation-fix.png":::

1. Select **Fix** to remediate the selected resources.

1. Repeat for each recommendation.

## Review data plane hardening recommendations

After you deploy Azure Policy for Kubernetes Defender for Cloud evaluates your cluster configuration and generates data plane hardening recommendations. This process can take up to 30 minutes.

> Microsoft components, such as the Defender sensor, are deployed in the `kube-system` namespace by default and aren't marked as noncompliant. Third-party components installed in other namespaces might be flagged. To exclude specific namespaces, configure Azure policy exclusions.

The following table lists common data plane hardening recommendations:

| Recommendation name | Security control | Configuration required |
|---------------------|------------------|------------------------|
| Container CPU and memory limits should be enforced | Protect applications against DDoS attack | **Yes** |
| Container images should be deployed from trusted registries only | Remediate vulnerabilities | **Yes** |
| Least privileged Linux capabilities should be enforced for containers | Manage access and permissions | **Yes** |
| Containers should only use allowed AppArmor profiles | Remediate security configurations | **Yes** |
| Services should listen on allowed ports only | Restrict unauthorized network access | **Yes** |
| Usage of host networking and ports should be restricted | Restrict unauthorized network access | **Yes** |
| Usage of pod HostPath volume mounts should be restricted to a known list | Manage access and permissions | **Yes** |
| Container with privilege escalation should be avoided | Manage access and permissions | No |
| Containers sharing sensitive host namespaces should be avoided | Manage access and permissions | No |
| Immutable (read-only) root filesystem should be enforced for containers | Manage access and permissions | No |
| Kubernetes clusters should be accessible only over HTTPS | Encrypt data in transit | No |
| Kubernetes clusters should disable automounting API credentials | Manage access and permissions | No |
| Kubernetes clusters shouldn't use the default namespace | Implement security best practices | No |
| Kubernetes clusters shouldn't grant CAP_SYS_ADMIN capabilities | Manage access and permissions | No |
| Privileged containers should be avoided | Manage access and permissions | No |
| Running containers as root user should be avoided | Manage access and permissions | No |

### View recommendations for a cluster

To view data plane hardening recommendations for a specific cluster:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Defender for Cloud** > **Inventory**.

1. Set the resource type filter to **Kubernetes service** and select **Apply**.
  
    :::image type="content" source="media/kubernetes-workload-protections/resource-type-kubernetes-service.png" alt-text="Screenshot of using the resource type filter to select kubernetes service." lightbox="media/kubernetes-workload-protections/resource-type-kubernetes-service.png":::

1. Select the relevant cluster.

1. Review the available recommendations. Data plane hardening recommendations show the number of affected Kubernetes components.

1. Select a recommendation to view affected resources.
   
   :::image type="content" source="media/kubernetes-workload-protections/resource-health-recommendation.png" alt-text="Screenshot of selecting a recommendation from the Resource health page." lightbox="media/kubernetes-workload-protections/resource-health-recommendation.png":::

1. Select the **Take action** tab to review remediation options.

    :::image type="content" source="media/kubernetes-workload-protections/take-action-tab.png" alt-text="Use the Take action tab to view remediation steps for a recommendation." lightbox="media/kubernetes-workload-protections/take-action-tab.png":::

## Configure policy parameters

Some recommendations require parameter configuration to be effective. For example, the recommendation **Container images should be deployed from trusted registries only** requires you to define a list of trusted registries.

If required parameters aren't configured, resources are shown as unhealthy.

To configure policy parameters:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the relevant subscription.

1. Select **Security policies**.
   
   :::image type="content" source="media/kubernetes-workload-protections/security-policies-page.png" alt-text="Screenshot of the Security policies page." lightbox="media/kubernetes-workload-protections/security-policies-page.png":::

1. On the **Standards** tab, select the relevant security standard.

1. Select the relevant policy assignment's 3-dot menu and select **Manage effect and parameters**.
   
   :::image type="content" source="media/kubernetes-workload-protections/select-manage-effect-and-parameters.png" alt-text="Screenshot of selecting the 3-dot menu and then selecting Manage effect and aparameters." lightbox="media/kubernetes-workload-protections/select-manage-effect-and-parameters.png":::

1. Update the required parameter values.
   
   :::image type="content" source="media/kubernetes-workload-protections/manage-effect-and-parameters.png" alt-text="Screenshot of the paraments panel." lightbox="media/kubernetes-workload-protections/manage-effect-and-parameters.png":::

1. Select **Save**.

## Enforce data plane hardening policies

By default, policies evaluate resources in audit mode. To enforce a policy, set its effect to **Deny**.

To enforce a recommendation:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.

1. Search for and select the relevant data plane hardening recommendation.

1. On the **Take action** tab, select **Deny**.

   :::image type="content" source="./media/kubernetes-workload-protections/enforce-workload-protection-example.png" alt-text="Screenshot showing the Deny option for Azure Policy parameter." lightbox="media/kubernetes-workload-protections/enforce-workload-protection-example.png":::

1. Set the scope.

1. Select **Change to deny**.

## Test policy enforcement

You can validate data plane hardening policies by deploying test workloads.

- A compliant deployment that meets data plane hardening requirements  
- A noncompliant deployment that violates multiple policies  

Deploy the following example YAML files to verify that compliant workloads are deployed successfully and noncompliant workloads are flagged or blocked, depending on policy enforcement settings.

### Compliant deployment example

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-healthy-deployment
  labels:
    app: redis
spec:
  replicas: 3
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
      annotations:
        container.apparmor.security.beta.kubernetes.io/redis: runtime/default
    spec:
      containers:
      - name: redis
        image: <customer-registry>.azurecr.io/redis:latest
        ports:
        - containerPort: 80
        resources:
          limits:
            cpu: 100m
            memory: 250Mi
        securityContext:
          privileged: false
          readOnlyRootFilesystem: true
          allowPrivilegeEscalation: false
          runAsNonRoot: true
          runAsUser: 1000
---
apiVersion: v1
kind: Service
metadata:
  name: redis-healthy-service
spec:
  type: LoadBalancer
  selector:
    app: redis
  ports:
  - port: 80
    targetPort: 80
```

### Noncompliant deployment example

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-unhealthy-deployment
  labels:
    app: redis
spec:
  replicas: 3
  selector:
    matchLabels:
      app: redis
  template:
    metadata:      
      labels:
        app: redis
    spec:
      hostNetwork: true
      hostPID: true 
      hostIPC: true
      containers:
      - name: redis
        image: redis:latest
        ports:
        - containerPort: 9001
          hostPort: 9001
        securityContext:
          privileged: true
          readOnlyRootFilesystem: false
          allowPrivilegeEscalation: true
          runAsUser: 0
          capabilities:
            add:
              - NET_ADMIN
        volumeMounts:
        - mountPath: /test-pd
          name: test-volume
          readOnly: true
      volumes:
      - name: test-volume
        hostPath:
          # directory location on host
          path: /tmp
---
apiVersion: v1
kind: Service
metadata:
  name: redis-unhealthy-service
spec:
  type: LoadBalancer
  selector:
    app: redis
  ports:
  - port: 6001
    targetPort: 9001
```

## Next steps

In this article, you learned how to configure Kubernetes data plane hardening.

For related material, see the following pages:

- [Defender for Cloud recommendations for compute](recommendations-reference-compute.md)
- [Alerts for AKS cluster level](alerts-containers.md)
