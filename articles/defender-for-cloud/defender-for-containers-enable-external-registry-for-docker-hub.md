---
title: How to onboard Docker Hub container registries
description: How to onboard Docker Hub container registries to Defender for Containers
ms.service: defender-for-containers
ms.topic: how-to
ms.date: 09/25/2024
---

# How to onboard your Docker Hub container registries to Defender for Cloud Security Posture Management

Defender for Containers can connect to your organization's Docker Hub containers registry to gain the benefits of scanning your Docker Hub container images for security threats and protect the Docker Hub container registry itself within your Defender for Cloud Security Posture Management.

To enable Defender for Containers to connect to your Docker Hub containers registry, you need to:

1. Create in your Docker Hub organization account a dedicated user with access to the organization's Docker Hub container registries.
1. Generate access tokens for the Docker Hub dedicated user.
1. Configure the Defender for Cloud connector to securely access Docker Hub using the dedicated Docker Hub user name and access tokens.

## Set up the Docker Hub account user

1. Before starting, verify that you:
   1. Own an organization Docker Hub account and have the appropriate administrative permissions to create and manage a Docker Hub user on the organization scope.
   1. Have already created a dedicated user with your organization's email account, to only be used for Defender for Cloud connectivity.
        Example: defender_for_cloud_connector@myorg.com

1. Invite the dedicated user to access all repositories in your organization as an "Editor".

    :::image type="content" source="{source}" alt-text="{alt-text}":::

> [!NOTE]
> While the Editor privilege allows a user to modify registries, the next step will limit Defender for Cloud to read-only access.

1. An email is sent to the dedicated user with a link to verify the email address. Select the verify link in the email to complete the process of creating a Docker Hub user.

1. Sign in to Docker Hub with the dedicated user and generate an access token with "Read-Only" permissions. The access token will be used to enable the Defender for Cloud to securely connect to your organization's Docker Hub account and access the container registries. Save this access token and the Docker Hub user name (not the email address!) to configure the Defender for Cloud Docker Hub connector in the Azure Portal.

    :::image type="content" source="{source}" alt-text="{alt-text}":::

    :::image type="content" source="{source}" alt-text="{alt-text}":::

## Configure the Defender for Cloud Docker Hub connector

1. Under the Environment settings of Defender for Cloud, open the Docker Hub connection. In the Configure access tab of the Docker Hub connection, enter your organization name, the user name of the Docker Hub connector account, and the connector account access token.

    :::image type="content" source="{source}" alt-text="{alt-text}":::

1. Finalize connector onboarding wizard

1. Validate if the connectivity succeeded and the connection appears as “Connected” in the environments settings screen

    :::image type="content" source="{source}" alt-text="{alt-text}":::
