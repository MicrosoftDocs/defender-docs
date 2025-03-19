---
title: Enable gated deployment in Microsoft Defender for Containers
description: Learn how to enable gated deployment to secure your containers software supply chain using Defender for Containers.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 3/12/2025
#customer intent: As a devops person, I want to learn how to enable gated deployment to secure your containers software supply chain using Defender for Containers.
---

# Enable gated deployment in Defender for Containers

## Overview

Gated deployment is a strategy to ensure that only approved container images are deployed to Kubernetes environments using security rules. A security rule defines the action to take if certain conditions are met. The gated deployment admissions controller examines a container image and its vulnerability report against the relevant security rules. This page describes the steps to configure the security rules used by the gated deployment admission controller. 

## Prerequisites

- The **Defender for Containers** plan is enabled.
- The **Defender sensor** extension is enabled in the plan.
- The Kubernetes cluster has permissions to access container registries used to deploy container images to the cluster.

> [!NOTE]
> Gated deployment is currently available for Azure Kubernetes Services (AKS) based on container image vulnerability assessment.

## Create a gated deployment security rule

1. **Configure security rules for gated deployment**
    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability assessment** to view a list of defined security rules.

2. **Configure vulnerability assessment security rules**
    - Select **Add rule** and define the following parameters:
      - **Rule name** - a name to identify this security rule
      - **Action** - the action to take when the conditions of the security rule are met (**Audit** or **Deny**)
      - **Scope name** - a name to identify the scope of this security rule
      - **Cloud scope** - the cloud environment(s) this security rule is applied to
      - **Resource scope** - the conditions used to limit the resources in the cloud scope this security rule is applied to
    - Select **Configurations** and define the following:
      - **Add condition types** - specify the conditions that trigger the action when found in the container image - either a vulnerability level or a specific CVE id.
      - **Add allowed vulnerabilities** - specify CVE ids that are exempted from triggering the action for this security rule.
    - Select **Enable prerequisites**.
    - After reviewing the prerequisites, select **Add rule**.

## Disable or delete a gated deployment security rule

1. **Disable a gated deployment security rules**
    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability assessment** to view a list of defined security rules.
    - Select a security rule and then select **Disable**.

1. **Delete a gated deployment security rules**
    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability assessment** to view a list of defined security rules.
    - Select a security rule and then select **Delete**.
