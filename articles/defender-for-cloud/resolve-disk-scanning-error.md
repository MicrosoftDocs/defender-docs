---
title: Resolve agentless scanning error
description: Troubleshoot disk scanning error in Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 05/22/2025
ms.topic: how-to
author: Elazark
ms.author: elkrieger
#customer intent: As a security professional, I want to resolve the disk scanning errors in Microsoft Defender for Cloud's GCP connector to ensure my resources are connected and protected.
---

# Resolve agentless scanning error

Once your Google Cloud Platform (GCP) project is connected to Defender for Cloud, Defender for Cloud uses [agentless machine scanning](concept-agentless-data-collection.md) to detect vulnerabilities and present recommendations and alerts to remediate detected vulnerabilities. 

If Defender for Cloud is not generating any agentless results for your Virtual Machines (VMs), this can be due to GCP organization policies that block Defender for Cloud's access to your tenant, and preventing it from scanning disks.

This article describes how to resolve the disk scanning error.

## Prerequisites

- You must have a [GCP project onboarded to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

- Access to a GCP project.

- Contributor level permission for the relevant Azure subscription.

## Manage your organizations policies

By configuring your organization policies, you can control the resources that Defender for Cloud can access in your GCP project.

1. Sign in to your GCP project.

1. Navigate to your organization > relevant GCP project.

1. Navigate to **IAM & Admin** > **Organization Policies**

1. Search for the `Compute Storage resource use restrictions` policy.

1. Select **Edit**.

1. Change the policy type to **Allow**.

1. Add `organizations/517615557103` to the allowed list.

1. Select **Save**.

## Next step

> [!div class="nextstepaction"]
> [Common GCP questions](faq-general.yml)
