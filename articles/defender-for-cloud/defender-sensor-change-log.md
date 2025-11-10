---
title: Defender Sensor for Defender for Containers Changelog
description: Learn about the version history and updates for the Defender sensor in Microsoft Defender for Containers.
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 05/08/2025
ai-usage: ai-assisted
---

# Sensor for Defender for Containers Changelog

The Sensor for Microsoft Defender for Containers changelog provides a detailed version history of sensor updates. Each version includes new features, improvements, and fixes to enhance functionality. Use this changelog to stay informed about the latest updates and plan your deployments accordingly.

For more information about deploying the sensor in Defender for Containers, see [Configure Microsoft Defender for Containers components](defender-for-containers-enable.md).

To see the version of the sensor run:

`kubectl get -n kube-system daemonsets/microsoft-defender-collector-ds -o jsonpath='{.metadata.labels.app\.kubernetes\.io/version}`


## Sensor versions available per release

### Sensor v0.8 (relevant to all AKS supported versions and Arc for K8s)

- **Sensor v0.8.39 - GA**

- **Released:** Nov, 2025

- **What's included:**

  - Bug fixes and security enhancements
    
  - New feature: Gated deployment
  
  - Added new ingestion method (when network outbound access to *.cloud-defender.microsoft.com is enabled, see more at [https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-containers-enable?tabs=k8s-…](/azure/defender-for-cloud/defender-for-containers-enable?tabs=k8s-deploy-cli%2Ck8s-deploy-asc%2Ck8s-verify-cli%2Ck8s-remove-cli%2Caks-removeprofile-api&pivots=defender-for-container-eks%22https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-containers-enable?tabs=k8s-deploy-cli%2ck8s-deploy-asc%2ck8s-verify-cli%2ck8s-remove-cli%2caks-removeprofile-api&pivots=defender-for-container-eks#:~:text=data%20and%20events.-,note,-the%20azure%20domains%22))
    
- **Sensor v0.8.30 - GA**

- **Released:** August, 2025
- **What's included:**

  - Better memory efficiency and reduction of CPU consumption
    
  - Bug fixes and security enhancements


### Sensor v0.9 (deployed by Helm or Arc for K8s via Preview mode)

- **Sensor** **0.9.44-preview**

- **Released:** Nov, 2025

- **What's included:**

  - Bug fixes and security enhancements
    
  - Added new ingestion method (when network outbound access to *.cloud-defender.microsoft.com is enabled, see more at [https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-containers-enable?tabs=k8s-…](/azure/defender-for-cloud/defender-for-containers-enable?tabs=k8s-deploy-cli%2Ck8s-deploy-asc%2Ck8s-verify-cli%2Ck8s-remove-cli%2Caks-removeprofile-api&pivots=defender-for-container-eks%22https://learn.microsoft.com/en-us/azure/defender-for-cloud/defender-for-containers-enable?tabs=k8s-deploy-cli%2ck8s-deploy-asc%2ck8s-verify-cli%2ck8s-remove-cli%2caks-removeprofile-api&pivots=defender-for-container-eks#:~:text=data%20and%20events.-,note,-the%20azure%20domains%22))
    
- **Sensor v0.9.17-Preview**

- **Released:** June, 2025

- **What's included:**

  - **Helm-based deployment support**
  Introduces a new deployment method for the sensor using Helm. This option lets you deploy and manage the sensor more easily, and access the latest capabilities in Public Preview or GA.
  
      For setup instructions and more details, see [Install Defender for Containers sensor using Helm](deploy-helm.md).
    
  - **DNS threat detections**
  This version includes new DNS-based detection capabilities, enabling the sensor to generate alerts on suspicious or malicious domains using threat intelligence (TI) feeds. This enhancement improves visibility into potential network-based threats.
  
  - Improves memory efficiency and reduces CPU consumption for large cluster deployments.
    
  - Bug fixes and security enhancements.

## Defender for Containers – Sensor Support Policy

 

The support policy here applies to all Helm-based and multicloud installations. For scenarios where the sensor is deployed as part of AKS, please refer to: [Supported Kubernetes versions in Azure Kubernetes Service (AKS) - Azure Kubernetes Service | Microsoft Learn](/azure/aks/supported-kubernetes-versions?tabs=azure-cli)

|Version|Preview Date|GA Date|End of support|
| -------- | -------- | -------- | -------- |
|0.8| |Feb 2025|Feb 2027|
|0.9|July 2025|Feb 2026|Feb 2027|
|0.10|Jan 2026|Apr 2026|Apr 2027|
|0.11|Apr 2026|Jul  2026|Jul 2027|

Each stable (GA) version is supported for 12 months from its GA release date.
After the 12-month support window ends, the version is no longer supported.
Customers are encouraged to upgrade to the latest stable or Public release prior to end of support to ensure continued support and access to new capabilities.


