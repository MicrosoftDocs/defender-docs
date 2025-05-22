---
title: Resolve agentless scan error
description: Troubleshoot disk scan error in Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 05/22/2025
ms.topic: how-to
author: Elazark
ms.author: elkrieger
#customer intent: As a security professional, I want to resolve the disk scan errors in Microsoft Defender for Cloud's GCP connector to ensure my resources are connected and protected.
---

# Resolve agentless scan error

After you connect your Google Cloud Platform (GCP) project to Defender for Cloud, Defender for Cloud utilizes [agentless machine scanning](concept-agentless-data-collection.md) to present recommendations and alerts that offer remediation steps for any detected vulnerabilities.

If Defender for Cloud doesn't generate any agentless results for your Virtual Machines (VMs) up to 24 hours after you connect the GCP project, GCP organization policies might block Defender for Cloud's access to your tenant. If your policies block Defender for Cloud, Defender for Cloud can't perform scans.

This article explains how to resolve the disk scan error.

## Prerequisites

- You must have a [GCP project onboarded to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

- Access to a GCP project.

- Contributor level permission for the relevant Azure subscription.

## Manage your organizations policies

By configuring your organization policies, you can control the resources that Defender for Cloud can access in your GCP project.

1. Sign in to your GCP project.

1. Navigate to your organization > relevant GCP project.

1. Navigate to **IAM & Admin** > **Organization Policies**

1. Search for the `Compute Storage resource use restrictions (Compute Engine disks, images, and snapshots)` policy.

1. Select **Manage policy**.

1. Change the policy type to **Allow**.

1. In the allow list, add `under:organizations/517615557103`.

1. Select **Save**.

Defender for Cloud triggers agentless disk scanning with API calls. You'll know that everything works after the next API call, which takes up to 24 hours to occur, when results for agentless scanning are generated.

## Next step

> [!div class="nextstepaction"]
> [Common GCP questions](faq-general.yml)
