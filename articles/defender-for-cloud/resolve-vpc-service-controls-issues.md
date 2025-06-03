---
title: Resolve VPC service controls issues
description: Troubleshoot VPC service controls issues in Microsoft Defender for Cloud to ensure your resources are connected and protected.
ms.date: 05/29/2025
ms.topic: how-to
author: Elazark
ms.author: elkrieger
#customer intent: As a security professional, I want to resolve VPC service controls issues in Microsoft Defender for Cloud to ensure my resources are connected and protected.
---

# Resolve VPC service controls issues

Google Cloud Platform (GCP), Virtual Private Cloud (VPC) Service Controls provide an additional layer of security by defining perimeters that isolate and protect sensitive resources. Each perimeter can encompass one or more projects, restricting access to Google-managed services from outside the defined boundary.

In order for Microsoft Defender for Cloud to gain the ability to scan resources within these protected environments, it’s essential to configure ingress and egress policies that allow Defender for Cloud service accounts to operate within the perimeter. This ensures that security scans can be performed without compromising the integrity of the perimeter’s restrictions.

## Prerequisites

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- [A connected GCP project](quickstart-onboard-gcp.md).

- Contributor level permission for the relevant Azure subscription.

## Add ingress and egress policies

Each VPC Service Controls perimeter in GCP protects one or more projects, and any perimeter that restricts Google Services must be configured to allow Defender for Cloud to scan the relevant projects.

1. Sign in to your GCP project.

1. Navigate to **Security** > **VPC Service Controls**.

1. 