---
title: Enable Kubernetes gated deployment in Microsoft Defender for Containers
description: Learn how to enable gated deployment to secure your containers software supply chain using Defender for Containers.
ms.topic: how-to
ms.author: dacurwin
author: dcurwin
ms.date: 3/12/2025
#customer intent: As a devops person, I want to learn how to enable gated deployment to secure your containers software supply chain using Defender for Containers.
---

# Enable gated deployment in Defender for Containers

Gated deployment is an important practice to ensure that only container images meeting the organization's security policies are deployed to Kubernetes environments, based on the definition of security rules. A security rule defines the action to take if certain conditions are met for the associated scope. The gated deployment admissions controller examines a container image and its vulnerability findings artifact against the relevant security rules. This page describes the steps to configure the security rules used by the gated deployment admission controller. 

## Prerequisites

- The **Defender for Containers** plan is enabled and the **Defender sensor** and the **Security findings** extensions are enabled in the plan.
- The **Registry access** extension is enabled in Defender for Containers or Defender CSPM.
- The Kubernetes cluster has permissions to access container registries used to deploy container images to the cluster.

> [!NOTE]
> Gated deployment is currently available for **Azure Kubernetes Services (AKS)** version **1.31** and higher , based on container image vulnerability assessment, available for **ACR** container registries.

While gated deployment is available when the prerequisites are fulfilled, the predefined security rules must be activated using the security rules wizard in the portal for gated deployment to be activated.

## Create a gated deployment security rule

1. **Configure security rules for gated deployment**
    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability assessment** to view a list of defined security rules.

2. **Configure vulnerability assessment security rules**
    - Select **Add rule** and define the following parameters:
      - **Rule name** - a name to identify this security rule
      - **Action** - the action to take when the conditions of the security rule are met (**Audit** or **Deny**)
      - **Scope name** - a name to identify the scope of this security rule
      - **Cloud scope** - the cloud environments this security rule is applied to
      - **Resource scope** - the conditions used to limit the resources in the cloud scope this security rule is applied to
    - Select **Configurations** and define the following:
      - **Add condition types** - specify the conditions that trigger the action when found in the container image - either a vulnerability level or a specific CVE ID.
      - **Add allowed vulnerabilities** - specify the CVE IDs that are exempted from triggering the action for this security rule
    - Select **Enable prerequisites**.
    - After reviewing the prerequisites, select **Add rule**.

## Disable or delete a gated deployment security rule

1. **Disable a gated deployment security rule**
    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability assessment** to view a list of defined security rules.
    - Select a security rule and then select **Disable**.

1. **Delete a gated deployment security rule**
    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability assessment** to view a list of defined security rules.
    - Select a security rule and then select **Delete**.
