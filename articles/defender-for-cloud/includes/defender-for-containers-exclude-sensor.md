---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 02/16/2026
ms.author: elkrieger
author: Elazark
---

To exclude the Defender sensor from automatic provisioning, add the following tag to the cluster resource in Azure:

- `ms_defender_container_exclude_sensors = true`

For clusters connected to Azure through Azure Arc (including Amazon EKS and Google Kubernetes Engine), add the tag to the Azure Arc-enabled Kubernetes resource in Azure.