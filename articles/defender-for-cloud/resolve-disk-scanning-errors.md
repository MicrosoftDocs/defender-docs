---
title: Resolve disk scanning errors
description: Troubleshoot disk scanning errors in Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 05/21/2025
ms.topic: how-to
author: Elazark
ms.author: elkrieger
#customer intent: As a security professional, I want to resolve the disk scanning errors in Microsoft Defender for Cloud's GCP connector to ensure my resources are connected and protected.
---

# Resolve disk scanning errors

Once your Google Cloud Platform (GCP) project is connected to Defender for Cloud, Defender for Cloud scans disks in your GCP project for vulnerabilities and present recommendations and insights to remediate detected vulnerabilities. However, disk scanning might fail due to organizational policies.

GCP organization policies are a common way for organization administrators to configure constraints across your organization's resources. These policies might block Defender for Cloud's access to your tenant, preventing it from scanning disks.

## Prerequisites

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- [Onboard your GCP project to Microsoft Defender for Cloud](quickstart-onboard-gcp.md).

- Access to a GCP project.

- Contributor level permission for the relevant Azure subscription.

## Manage your organizations policies

To resolve disk scanning errors, you need to check the organization policies in your GCP project.

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
