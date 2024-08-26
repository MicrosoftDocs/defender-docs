---
title: How to onboard Docker Hub container registries
description: How to onboard Docker Hub container registries to Defender for Containers
ms.service: defender-for-containers
ms.topic: how-to
ms.date: 09/25/2024
---

# How to onboard your Docker Hub container registries to Defender for Cloud Security Posture Management

Defender for Containers can connect to your organization's Docker Hub container registries to gain the benefits of scanning your Docker Hub container images for security threats and protect the Docker Hub container registries themselves through Defender for Cloud Security Posture Management.

To enable Defender for Containers to connect to your Docker Hub containers registry, you need to:

1. Create in your Docker Hub organization account a dedicated user with access to the organization's Docker Hub container registries.
1. Generate an access token for the Docker Hub dedicated user.
1. Supply the Docker Hub dedicated user name and access token when configuring the Defender for Cloud Docker Hub connector.

## Create a user in Docker Hub

1. Before starting, verify that you:
   * Own an organization Docker Hub account and have the appropriate administrative permissions to create and manage a Docker Hub user on the organization scope.
   * Have already a dedicated user with your organization's email account (for example `mdc_user@myorg.com`), to be used only for Defender for Cloud connectivity.

1. Invite the dedicated user to access all repositories in your organization as an "Editor".

    :::image type="content" source="./media/how-to-setup-docker-hub-external-registry/docker-hub-invite-member.png" alt-text="Select invite member" lightbox="media/how-to-setup-docker-hub-external-registry/docker-hub-invite-member.png:::

    :::image type="content" source="./media/how-to-setup-docker-hub-external-registry/docker-hub-invite-editor-type.png" alt-text="Invite member" lightbox="media/how-to-setup-docker-hub-external-registry/docker-hub-invite-editor-type.png:::

    > [!NOTE]
    > While the Editor privilege allows a user to modify Docker Hub registries, the access token created will allow Defender for Cloud read-only access.

1. An email is sent to the dedicated user with a link to verify the email address. Select the verify link in the email to complete the process of creating a Docker Hub user.

## Create an access token for the dedicated Docker Hub user

Sign in to Docker Hub as the dedicated user and generate an access token with "Read-Only" permissions. The access token will be used to enable the Defender for Cloud to securely connect to your organization's Docker Hub account. Save this access token and the Docker Hub user name for use when configuring the Defender for Cloud Docker Hub connector.

    :::image type="content" source="./media/how-to-setup-docker-hub-external-registry/docker-hub-create-access-token.png" alt-text="Create access token" lightbox="media/how-to-setup-docker-hub-external-registry/docker-hub-create-access-token.png:::

    :::image type="content" source="./media/how-to-setup-docker-hub-external-registry/docker-hub-access-token-text.png" alt-text="View access token" lightbox="media/how-to-setup-docker-hub-external-registry/docker-hub-access-token-text.png:::
