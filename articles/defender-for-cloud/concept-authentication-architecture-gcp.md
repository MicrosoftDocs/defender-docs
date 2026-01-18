---
title: Authentication architecture for GCP connectors
description: Learn how Microsoft Defender for Cloud authenticates to Google Cloud using federated identity, short-lived tokens, and workload identity federation.
ms.topic: article
author: Elazark
ms.author: elkrieger
ms.date: 12/24/2025
ms.custom: sfi-image-nochange
---

# Authentication architecture for GCP connectors

When you connect a Google Cloud Platform (GCP) project or organization to Microsoft Defender for Cloud, the service uses federated authentication to securely access GCP APIs without storing long-lived credentials.

Authentication is performed by exchanging short-lived tokens between Microsoft Entra ID and Google Cloud Security Token Service (STS), allowing Defender for Cloud to impersonate a GCP service account with scoped permissions.

This article explains the authentication resources created during onboarding and how the federated trust model works.

## Authentication resources created in GCP

When you onboard a GCP project or organization to Defender for Cloud, a GCloud template is used to create the authentication resources required to establish trust between Microsoft Entra ID and Google Cloud.

These resources include:

- Workload identity pool and providers
- Service accounts and policy bindings

These resources enable Defender for Cloud to authenticate to GCP and access the required APIs for discovery, posture assessment, and security analysis.

## Identity provider model

Defender for Cloud authenticates to GCP using workload identity federation.

A workload identity provider is configured in GCP to trust tokens issued by Microsoft Entra ID. This trust allows Defender for Cloud to exchange Microsoft Entra tokens for Google STS tokens and impersonate a GCP service account.

The service account permissions are scoped to the connected project or organization and are limited to the access required by the enabled Defender plans.

## Cross-cloud authentication flow

The following diagram shows how Defender for Cloud authenticates to GCP using federated identity and token exchange.

:::image type="content" source="media/concept-authentication-architecture-gcp/authentication-process.png" alt-text="Diagram showing the Defender for Cloud GCP connector authentication process using federated identity and token exchange." lightbox="media/concept-authentication-architecture-gcp/authentication-process.png":::

The authentication process works as follows:

1. Microsoft Defender for Cloud's CSPM service acquires a Microsoft Entra token.
   Microsoft Entra ID signs the token using the RS256 algorithm. The token is valid for one hour.

1. The Microsoft Entra token is exchanged with Google's Security Token Service (STS).

1. Google STS validates the token with the workload identity provider. 
   Audience validation is performed, and the token is signed. A Google STS token is then returned to Defender for Cloud's CSPM service.

1. Defender for Cloud uses the Google STS token to impersonate the service account.
   The service account credentials are used to scan the GCP project or organization.

old:
1. Microsoft Defender for Cloud's CSPM service acquires a Microsoft Entra token. Microsoft Entra ID signs the token using the RS256 algorithm and is valid for 1 hour.

1. The Microsoft Entra token is exchanged with Google's STS token.

1. Google STS validates the token with the workload identity provider. The Microsoft Entra token is sent to Google's STS that validates the token with the workload identity provider. Audience validation then occurs and the token is signed. A Google STS token is then returned to Defender for Cloud's CSPM service.

1. Defender for Cloud's CSPM service uses the Google STS token to impersonate the service account. Defender for Cloud's CSPM receives service account credentials that are used to scan the project.

## Service account impersonation and access scope

After authentication completes, Defender for Cloud operates using impersonated service account credentials.

- Service account access is limited to the GCP resources that were onboarded. If you onboarded a single project, access is restricted to that project. If you onboarded a GCP organization, access is scoped to the projects included in that organization.

- Policy bindings restrict access to only the connected resources.

- Permissions granted to the service account determine which security signals Defender for Cloud can collect.

This model ensures least-privilege access while enabling continuous security assessment.

## Related articles

- [Connect your GCP project](quickstart-onboard-gcp.md)
- [Integrate GCP Cloud Logging with Pub/Sub (Preview)](logging-ingestion.md)
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md)
