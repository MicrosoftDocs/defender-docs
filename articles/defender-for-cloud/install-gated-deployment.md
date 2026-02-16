---
title: Deploy the gated deployment agent
description: Learn how to deploy gated deployment infrastructure as code for managed cluster API.
#customer intent: As a Kubernetes administrator, I want to deploy gated deployment infrastructure as code for managed cluster API so that I can enforce security policies for container images in my Kubernetes environment.
author: Elazark
ms.author: elkrieger
ms.date: 02/16/2026
ms.topic: how-to
---

# Deploy the gated deployment agent

Microsoft Defender for Cloud's gated deployment agent is a Kubernetes admission controller that enforces container image security policies at deployment time. Gated deployment acts a gatekeeper for container images for known security issues at deployment time and decides whether they’re allowed to run.