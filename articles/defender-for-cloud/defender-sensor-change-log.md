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

### Sensor v0.8.30 (relevant to all AKS versions <= 1.33)

- **Released:** August, 2025
- **What's included:**

  - Better memory efficiency and reduction of CPU consumption
    
  - Bug fixes and security enhancements


### Sensor v0.9.17 Preview (relevant to deploying via Helm)

- **Released:** June 17, 2025
- **What's included:**

  - **Helm-based deployment support**
  Introduces a new deployment method for the sensor using Helm. This option lets you deploy and manage the sensor more easily, and access the latest capabilities in Public Preview or GA.
  
      For setup instructions and more details, see [Install Defender for Containers sensor using Helm](deploy-helm.md).
    
  - **DNS threat detections**
    This version includes new DNS-based detection capabilities, enabling the sensor to generate alerts on suspicious or malicious domains using threat intelligence (TI) feeds. This enhancement improves visibility into potential network-based threats.

  - Improves memory efficiency and reduces CPU consumption for large cluster deployments.

  - Bug fixes and security enhancements.
