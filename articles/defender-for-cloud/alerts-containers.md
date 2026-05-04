---
title: Kubernetes alerts in Defender for Containers
description: Learn about Kubernetes alert detection in Microsoft Defender for Containers and how to simulate Kubernetes alerts.
ms.topic: reference
ms.custom: linux-related-content
ms.date: 05/18/2026
ai-usage: ai-assisted
---

# Alerts for Kubernetes Clusters

Microsoft Defender for Containers generates security alerts for Kubernetes clusters and workloads by monitoring both the control plane and the runtime environment. To validate alert generation, you can use the Kubernetes alerts simulation tool to trigger representative alerts.

The alerts available in an environment depend on the Kubernetes distribution (AKS, EKS, GKE, or Arc-enabled), the installed components, and the specific activities being monitored.

## Control plane detection

The Kubernetes control plane manages and orchestrates all resources within the cluster. Defender for Containers monitors Kubernetes API server activity to identify suspicious operations that might affect cluster security.

Examples of suspicious control plane operations include:

- **Privileged container deployments:** Monitoring for unauthorized deployments or excessive use of privileges that could lead to host-system breaches.
- **Risky service exposures:** Identifying services unintentionally exposed to the public Internet or lacking proper access controls.
- **Suspicious service account activities:** Detecting unusual patterns such as excessive resource requests or unauthorized API calls.

## Workload runtime detection

Defender for Containers uses the [Defender sensor](defender-for-containers-introduction.md#run-time-protection-for-kubernetes-nodes-and-clusters) to monitor workload runtime activity and detect suspicious process creation or network behavior.

Key detection categories include:

- **Web shell activity:** Identifying behaviors that resemble web shell invocations on running containers.
- **Crypto mining activity:** Heuristics detect CPU optimization, suspicious download activity, and known mining processes.
- **Network scanning tools:** Identification of tools commonly used for malicious reconnaissance.
- **Binary drift detection:** Detection of workload binaries that have drifted from the original container image. For more details, see [Binary drift detection](binary-drift-detection.md).


## Kubernetes alerts simulation tool

Defender for Containers provides a Python-based CLI tool to simulate attack scenarios and verify that Kubernetes security alerts are generated.

> [!NOTE]
> The simulation tool doesn't contain malicious code. Run it on a dedicated test cluster instead of a production cluster.

### Prerequisites

Before you begin, make sure that:

- You have administrator access to the target Kubernetes cluster.

- Microsoft Defender for Containers is enabled for the target environment.

- The Defender sensor is installed on the target cluster. To verify the sensor deployment for your environment, see [Verify Defender sensor deployment](defender-for-containers-verify.md#verify-defender-sensor-deployment).

- Helm is installed on the machine where you plan to run the simulation.

- Python 3.7 or later is installed on the machine where you plan to run the simulation.

- Your `kubeconfig` file points to the target cluster.

  For Azure Kubernetes Service (AKS), you can configure access by running:

  ```azurecli
  az aks get-credentials --name <cluster-name> --resource-group <resource-group>
  ```

### Simulate Kubernetes alerts

To simulate Kubernetes alerts:

1. Download the simulation script:

   ```bash
   curl -O https://raw.githubusercontent.com/microsoft/Defender-for-Cloud-Attack-Simulation/refs/heads/main/simulation.py
   ```

1. Run the simulation script:

   ```bash
   python simulation.py
   ```
   
1. When prompted, select the attack scenario that you want to simulate, or select the option to run all scenarios.

The following scenarios are available:

| Scenario | Expected alerts |
|---|---|
| Reconnaissance | Possible Web Shell activity detected<br>Suspicious Kubernetes service account operation detected<br>Network scanning tool detected |
| Lateral movement | Possible Web Shell activity detected<br>Access to cloud metadata service detected |
| Secrets gathering | Possible Web Shell activity detected<br>Sensitive files access detected<br>Possible secret reconnaissance detected |
| Crypto mining | Possible Web Shell activity detected<br>Kubernetes CPU optimization detected<br>Command within a container accessed `ld.so.preload`<br>Possible Crypto miners download detected<br>A drift binary detected executing in the container |
| Web shell | Possible Web Shell activity detected |

> [!NOTE]
> Some alerts are generated in near real time. Others can take up to an hour to appear.

> [!NOTE]
> The simulation tool deploys test resources to the cluster. After you finish testing, remove those resources according to your organization's test environment procedures.

### Review generated alerts

To review the generated alerts:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Security alerts**.

1. Review alerts related to the simulated cluster and scenario.

## Related content

- [Validate alerts in Microsoft Defender for Cloud](alert-validation.md)

- [Overview of Microsoft Defender for Containers](defender-for-containers-introduction.md)

- [Manage and respond to security alerts in Microsoft Defender for Cloud](manage-respond-alerts.md)

- [Continuously export Defender for Cloud data](continuous-export.md)