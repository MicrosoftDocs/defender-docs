---
title: Authentication architecture for AWS connectors
description: Learn how Microsoft Defender for Cloud authenticates to AWS using short-lived credentials, federated trust, and role-based access controls.
ms.topic: article
ms.date: 11/02/2025
---

# Authentication architecture for AWS connectors

When you connect an Amazon Web Services (AWS) account to Microsoft Defender for Cloud, Defender for Cloud uses federated authentication to securely access AWS APIs and assess configuration posture. This article explains how identity trust is established across clouds and how short-lived credentials are exchanged.

## Federated authentication overview

Defender for Cloud doesn't store long-lived AWS credentials. Instead, it requests a token from Microsoft Entra ID and exchanges it through AWS Security Token Service (STS) for short-lived AWS credentials. 

The identity and access management (IAM) roles that customers deploy through the onboarding template include a trust policy that defines who can assume the role. The permissions granted to Defender for Cloud are defined by the IAM policies attached to each role in the CloudFormation template.

## Authentication resources created in AWS

During onboarding, the CloudFormation template creates the authentication components that Defender for Cloud requires to establish trust between Microsoft Entra ID and AWS. These typically include:

- An **OpenID Connect (OIDC) identity provider** bound to a Microsoft-managed Microsoft Entra application  
- One or more **IAM roles** that Defender for Cloud can assume through web identity federation

Depending on the Defender offering you enable, additional AWS resources might be created as part of the onboarding process.

## Identity provider model

Defender for Cloud is a SaaS service and authenticates to AWS using OIDC federation with Microsoft-managed Microsoft Entra applications. The service can't use identities from a customer’s Entra tenant to request federated AWS credentials because it operates independently of customer-managed identity providers. Using a Microsoft-managed identity ensures that authentication is handled consistently across Defender offerings.

When you onboard an AWS account, the CloudFormation template deploys the authentication components into your AWS environment. These components include:

- An OpenID Connect (OIDC) identity provider that trusts a Microsoft-managed Entra application.

- One or more IAM roles that the customer deploys through the onboarding template, each containing a trust policy that specifies which identity can assume the role.

These resources define the trust relationship that allows Defender for Cloud to obtain short-lived AWS credentials through web identity federation.

These values are automatically generated during onboarding and are included in the CloudFormation template used to deploy the connector:

:::image type="content" source="media/concept-authentication-architecture-aws/cloudformation-identity-provider.png" alt-text="Screenshot of the AWS CloudFormation identity provider entry created during onboarding." lightbox="media/concept-authentication-architecture-aws/cloudformation-identity-provider.png":::

## Cross-cloud authentication flow

The following diagram shows how Defender for Cloud authenticates to AWS by exchanging Microsoft Entra tokens for short-lived AWS credentials.

:::image type="content" source="media/concept-authentication-architecture-aws/architecture-authentication-across-clouds.png" alt-text="Diagram showing Microsoft Defender for Cloud obtaining a token from Microsoft Entra ID, which AWS validates and exchanges for temporary security credentials." lightbox="media/concept-authentication-architecture-aws/architecture-authentication-across-clouds.png":::

## Token validation conditions

Before AWS issues temporary credentials, it performs several checks:

- **Audience validation** ensures that the expected application is requesting access.

- **Token signature validation** verifies that Microsoft Entra ID signed the token.

- **Certificate thumbprint validation** confirms that the signer matches the trusted identity provider.

- **Role-level conditions** restrict which federated identities can assume the role and prevent other Microsoft identities from using the same role.

AWS grants access only when all validation rules succeed.

## Role trust relationships

The IAM role defined by the CloudFormation template includes a trust policy that allows Defender for Cloud to assume the role through web identity federation. AWS only accepts tokens if they meet the trust relationship conditions. This policy prevents unauthorized principals from assuming the same role.

The IAM roles that customers deploy through the onboarding template include a trust policy that defines who can assume the role. The permissions granted to Defender for Cloud are defined by the IAM policies attached to each role in the CloudFormation template.

## Related articles

- [Connect your AWS account](quickstart-onboard-aws.md)
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md)
- [Agentless data collection](concept-agentless-data-collection.md)
