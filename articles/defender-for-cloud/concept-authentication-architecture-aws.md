---
title: Authentication architecture for AWS connectors
description: Learn how Microsoft Defender for Cloud authenticates to AWS using short-lived credentials, federated trust, and role-based access controls.
ms.topic: conceptual
ms.date: 11/02/2025
---

# Authentication architecture for AWS connectors

When you connect an AWS account to Microsoft Defender for Cloud, Defender for Cloud uses federated authentication to securely access AWS APIs and assess configuration posture. This article explains how identity trust is established across clouds and how short-lived credentials are exchanged.

## Federated authentication overview

Defender for Cloud doesn't store long-lived AWS credentials. Instead, it requests a token from Microsoft Entra ID and exchanges it through AWS Security Token Service (STS) for short-lived AWS credentials. These temporary credentials let Defender for Cloud:

- Scan AWS configuration posture
- Collect metadata for security assessments
- Generate recommendations and alerts

AWS IAM roles created during onboarding limit all permissions.

## Resources provisioned in AWS

During onboarding, the CloudFormation template creates authentication components that Defender for Cloud requires:

- An **OpenID Connect (OIDC) identity provider** bound to Microsoft Entra ID
- One or more **IAM roles** that Defender for Cloud can assume through web identity federation

These resources create the trust boundary between Microsoft Entra ID and AWS.

## Cross-cloud authentication flow

The following diagram shows how Defender for Cloud authenticates to AWS by exchanging Microsoft Entra tokens for short-lived AWS credentials.

:::image type="content" source="media/concept-authentication-architecture-aws/architecture-authentication-across-clouds.png" alt-text="Diagram showing Microsoft Defender for Cloud obtaining a token from Microsoft Entra ID, which AWS validates and exchanges for temporary security credentials." lightbox="media/concept-authentication-architecture-aws/architecture-authentication-across-clouds.png":::

## Token validation conditions

Before AWS issues temporary credentials, it performs several checks:

- **Audience validation** ensures that the expected application is requesting access.

- **Token signature validation** verifies that Microsoft Entra ID signed the token.

- **Certificate thumbprint validation** confirms that the signer matches the trusted identity provider.

- **Role-level conditions** restrict access to the Defender for Cloud CSPM application and prevent other applications from assuming the same role.

AWS grants access only when all validation rules succeed.

## Role trust relationships

The IAM role defined by the CloudFormation template includes a trust policy that allows Defender for Cloud to assume the role through web identity federation. AWS only accepts tokens if they meet the trust relationship conditions. This policy prevents unauthorized principals from assuming the same role.

## Related articles

- [Connect your AWS account](quickstart-onboard-aws.md)
- [Prerequisites for Defender plans on AWS](aws-plan-prerequisites.md)
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md)
- [Agentless data collection](concept-agentless-data-collection.md)
