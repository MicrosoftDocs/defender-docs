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

Gated deployment is an important practice to assess container image's eligibility against security rules before deployment to a Kubernetes environment.

A security rule defines an action to take if certain conditions are met within a defined resource scope. The gated deployment admissions controller examines a container image and its vulnerability findings artifact against the security rules relevant to the resource scope. The action to be taken by the admissions controller is defined by the security rule and can either be **audit** (deploy and create a security alert for review), or **deny** (no deployment and create a security alert for review).

Multiple security rules may affect the deployment of a container image. The conditions of all of the security rules are evaluated from the most severe to the least severe vulnerability. The evaluation stops at the first condition fulfilled by a vulnerability and the action specified by that security rule is taken.
