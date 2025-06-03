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

Organizations that use Virtual Private Cloud (VPC) Service Controls to restrict Google Services, must add ingress and egress policies per service account, that allow Defender for Cloud to scan Google Cloud Platform (GCP) projects. Without these permissions in place, Defender for Cloud can't perform disk scanning.

## Prerequisites

- A Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free one](https://azure.microsoft.com/pricing/free-trial/).

- [Microsoft Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) set up on your Azure subscription.

- [A connected GCP project](quickstart-onboard-gcp.md).

- Contributor level permission for the relevant Azure subscription.

## Add ingress and egress policies

