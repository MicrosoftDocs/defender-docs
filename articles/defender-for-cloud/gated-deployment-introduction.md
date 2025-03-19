---
title: Defender for Containers gated deployment of container images to a Kubernetes cluster
description: Understand Defender for Containers gated deployment of container images to a Kubernetes cluster.
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
ms.date: 3/12/2025
#customer intent: As a devops person, I want to understand how Defender for Containers gated deployment helps secure a Kubernetes cluster.
---

# Defender for Containers gated deployment of container images to a Kubernetes cluster

Gated deployment is a strategy to review container images before deployment to a Kubernetes environment against security rules.

A security rule defines an action to take if certain conditions are met within a defined resource scope. The gated deployment admissions controller examines a container image and its vulnerability report against the security rules relevant to the resource scope. The action to be taken by the admissions controller is defined by the security rule can be either **audit** (deploy and create a security alert for review), or **deny** (no deployment and create a security alert for review).
