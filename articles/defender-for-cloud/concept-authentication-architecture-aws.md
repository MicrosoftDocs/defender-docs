---
title: Authentication architecture for AWS connectors
description: Learn how Microsoft Defender for Cloud authenticates to AWS using short-lived credentials, federated trust, and role-based access controls.
ms.topic: article
ms.date: 11/02/2025
---

# Authentication architecture for AWS connectors

When you connect an AWS account to Microsoft Defender for Cloud, the service uses federated authentication to securely call AWS APIs without storing long-lived credentials. Temporary access is granted through AWS Security Token Service (STS), using short-lived credentials exchanged through a cross-cloud trust relationship.

This article explains how that trust is established and how short-lived credentials are used to access AWS resources securely.

## Authentication resources created in AWS

During onboarding, the CloudFormation template creates the authentication components that Defender for Cloud requires to establish trust between Microsoft Entra ID and AWS. These typically include:

- An **OpenID Connect identity provider** bound to a Microsoft-managed Microsoft Entra application 

- One or more **IAM roles** that Defender for Cloud can assume through web identity federation

Depending on the Defender plan you enable, additional AWS resources might be created as part of the onboarding process.

## Identity provider model

Defender for Cloud authenticates to AWS using OIDC federation with a Microsoft-managed Microsoft Entra application. As a SaaS service, it operates independently of customer-managed identity providers and does not use identities from a customer’s Entra tenant to request federated AWS credentials.

The authentication resources created during onboarding establish the trust relationship required for Defender for Cloud to obtain short-lived AWS credentials through web identity federation.

## Cross-cloud authentication flow

The following diagram shows how Defender for Cloud authenticates to AWS by exchanging Microsoft Entra tokens for short-lived AWS credentials.

:::image type="content" source="media/concept-authentication-architecture-aws/architecture-authentication-across-clouds.png" alt-text="Diagram showing Microsoft Defender for Cloud obtaining a token from Microsoft Entra ID, which AWS validates and exchanges for temporary security credentials." lightbox="media/concept-authentication-architecture-aws/architecture-authentication-across-clouds.png":::

## Role trust relationships

The IAM role defined by the CloudFormation template includes a trust policy that allows Defender for Cloud to assume the role through web identity federation. AWS only accepts tokens that satisfy this trust policy, which prevents unauthorized principals from assuming the same role.

The permissions granted to Defender for Cloud are controlled separately by the IAM policies attached to each role. These policies can be scoped to follow your organization’s least-privilege requirements, as long as the minimum permissions required for the selected Defender plans are included.

:::image type="content" source="media/concept-authentication-architecture-aws/configure-access-roles.png" alt-text="Screenshot of the AWS CloudFormation identity provider entry created during onboarding." lightbox="media/concept-authentication-architecture-aws/configure-access-roles.png":::

## Token validation conditions

Before AWS issues temporary credentials, it performs several checks:

- **Audience validation** ensures that the expected application is requesting access.

- **Token signature validation** verifies that Microsoft Entra ID signed the token.

- **Certificate thumbprint validation** confirms that the signer matches the trusted identity provider.

- **Role-level conditions** restrict which federated identities can assume the role and prevent other Microsoft identities from using the same role.

AWS grants access only when all validation rules succeed.

## Related articles

- [Connect your AWS account](quickstart-onboard-aws.md)
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md)
- [Agentless data collection](concept-agentless-data-collection.md)
