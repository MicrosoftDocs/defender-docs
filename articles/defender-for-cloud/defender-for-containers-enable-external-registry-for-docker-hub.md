---
title: How to onboard Docker Hub container registries
description: How to onboard Docker Hub container registries to Defender for Containers
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 09/25/2024
---

# How to onboard your Docker Hub container registries to Defender for Cloud Security Posture Management

Microsoft Defender for Containers connects to your organization's Docker Hub container registries using Defender for Cloud Security Posture Management to assess vulnerabilities in your Docker Hub container images.

To enable Defender for Containers to connect to your Docker Hub containers registry, you need to:

- Create in your Docker Hub organization account a dedicated user with access to all of the organization's container registries.
- Generate an access token for the Docker Hub dedicated user.
- Supply the Docker Hub dedicated user name and access token when configuring the Defender for Cloud Docker Hub connector.

## Create a user in Docker Hub

1. Before starting, verify that you:
   - Own an organization Docker Hub account and have the appropriate permissions for creation and management of a Docker Hub user on the organization scope.
   - Have already a dedicated user with your organization's email account (for example `mdc_user@contoso.com`), to be used only for Defender for Cloud connectivity.

2. Invite the dedicated user via email to access all repositories in your organization as an "Editor".

    :::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-member.png" alt-text="Screenshot of select an invite member." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-member.png":::

    :::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-editor-type-reduced.png" alt-text="Screenshot of invite a member." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-invite-editor-type.png":::

    > [!NOTE]
    > While the Editor privilege allows a user to modify Docker Hub registries, the access token created will allow Defender for Cloud read-only access.

3. An email is sent to the dedicated user with a link to verify the email address. Select the verify link in the email and complete the process of creating a Docker Hub dedicated user.

## Create an access token for the dedicated Docker Hub user

Sign in to Docker Hub as the dedicated user and generate an access token with "Read-Only" permissions. The access token is used to enable the Defender for Cloud to securely connect to your organization's Docker Hub account. Save this access token and the Docker Hub user name to [configure the Defender for Cloud Docker Hub connector](agentless-vulnerability-assessment-docker-hub.md#onboard-the-docker-hub-environment).

:::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-create-access-token.png" alt-text="Screenshot of create an access token." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-create-access-token.png":::

:::image type="content" source="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-access-token-text.png" alt-text="Screenshot of view an access token." lightbox="media/defender-for-containers-enable-external-registry-for-docker-hub/docker-hub-access-token-text.png":::
