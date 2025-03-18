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

Gated deployment examines container images using the defined deployment policies applicable to the container image and deployment environment.

Policies generate security alerts if the conditions of the policy are met and can also deny deployment of a container image. The default policy of gated deployment examines the signature of the container image and its vulnerability report for authenticity. If the container image is not authenticated, a security alert is generated which can be examined and used to remediate the container image.
