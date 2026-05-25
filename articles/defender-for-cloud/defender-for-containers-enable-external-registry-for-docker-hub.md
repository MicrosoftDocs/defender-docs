---
title: Onboard Docker Hub registries to Microsoft Defender for Containers
description: Connect your Docker Hub organization to Defender for Containers for vulnerability scanning by creating a dedicated user account and access token.
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 05/25/2026
ms.custom: sfi-image-nochange
---

# Onboard Docker Hub registries to Microsoft Defender for Containers

Microsoft Defender for Containers connects to your Docker Hub organization to assess vulnerabilities in container images.

To connect Docker Hub to Defender for Containers, you need to:

- Create a dedicated user in your Docker Hub organization with access to all organization registries.
- Generate an access token for the Docker Hub dedicated user.
- Supply the Docker Hub dedicated user name and access token when configuring the Defender for Cloud Docker Hub connector.

## Before you begin

Make sure you have these prerequisites:

- You own a Docker Hub organization account and have permissions to create and manage users at the organization scope.
- You created a dedicated user with your organization email account (for example, `mdc_user@contoso.com`) for Defender for Cloud connectivity only.

## Create a user in Docker Hub

To create a user in Docker Hub:

1. Verify that you can create and manage users in your Docker Hub organization.

1. Invite the dedicated user via email to access all repositories in your organization as an "Editor".

    :::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-member.png" alt-text="Screenshot of select an invite member." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-member.png":::

    :::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-editor-type-reduced.png" alt-text="Screenshot of invite a member." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-editor-type.png":::

    > [!NOTE]
    > While the Editor privilege allows a user to modify Docker Hub registries, the access token created will allow Defender for Cloud read-only access.

1. An email is sent to the dedicated user with a link to verify the email address. Select the verify link in the email and complete the process of creating a Docker Hub dedicated user.

## Create an access token for the dedicated Docker Hub user

To create an access token for the dedicated Docker Hub user:

1. Sign in to Docker Hub as the dedicated user.
1. Generate an access token with **Read-Only** permissions.
1. Save the access token and the Docker Hub user name for later use.
1. Continue with [configure the Defender for Cloud Docker Hub connector](agentless-vulnerability-assessment-docker-hub.md#onboard-the-docker-hub-environment).

:::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-create-access-token.png" alt-text="Screenshot of create an access token." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-create-access-token.png":::

:::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-access-token-text.png" alt-text="Screenshot of view an access token." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-access-token-text.png":::

