---
title: Resolve VPC service controls issues
description: Troubleshoot VPC service controls issues in Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 06/04/2025
ms.topic: how-to
author: Elazark
ms.author: elkrieger
#customer intent: As a security professional, I want to resolve VPC service controls issues in Microsoft Defender for Cloud to ensure my resources are connected and protected.
---

# Resolve VPC service controls issues

Google Cloud Platform (GCP) Virtual Private Cloud (VPC) Service Controls provide an extra layer of security by defining perimeters that isolate and protect sensitive resources. Each perimeter can encompass one or more projects, restricting access to Google-managed services from outside the defined boundary.

For Microsoft Defender for Cloud to scan resources within these protected environments, configure ingress and egress policies that allow Defender for Cloud service accounts to operate within the perimeter. This configuration ensures that security scans can be performed without compromising the integrity of the perimeter’s restrictions.

If you're unsure whether your Defender for Cloud account is experiencing issues with VPC Service Controls, you can check your [GCP Logs Explorer](troubleshooting-guide.md#defender-api-calls-to-gcp) to find out.

## Prerequisites

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- [A connected GCP project](quickstart-onboard-gcp.md).

- Contributor level permission for the relevant Azure subscription.

## Add ingress and egress policies

Each VPC Service Controls perimeter in GCP protects one or more projects. Configure any perimeter that restricts Google Services to allow Defender for Cloud to scan the relevant projects.

1. Sign in to your GCP project.

1. Navigate to **Security** > **VPC Service Controls**.

1. Select **Edit**.

1. Under the Ingress policy, add the following service accounts:

   - `serviceAccount:mdc-agentless-scanning@guardians-prod-diskscanning.iam.gserviceaccount.com`
   - `serviceAccount:microsoft-defender-cspm@eu-secure-vm-project.iam.gserviceaccount.com`

    > [!NOTE]
    > If the microsoft-defender-cspm service account name was changed when the GCP project was connected to MDC, make sure to edit the service account with the correct name. The name can be found by navigating to **IAM & Admin permissions** in your GCP project.

1. Under the Egress policy, add the following service accounts:

   - `serviceAccount:mdc-agentless-scanning@guardians-prod-diskscanning.iam.gserviceaccount.com`

1. Select **Save**.

Defender for Cloud triggers agentless disk scanning with API calls. You'll know that everything works after the next API call, which takes up to 24 hours to occur, when results for agentless scanning are generated.

## Next step

> [!div class="nextstepaction"]
> [Microsoft Defender for Cloud troubleshooting guide](troubleshooting-guide.md)