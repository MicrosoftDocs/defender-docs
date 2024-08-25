---
title: How to onboard Docker Hub container registries
description: How to onboard Docker Hub container registries to Defender for Containers
ms.topic: how-to
author: a-ehorwitz
ms.author: dacurwin
ms.custom: devx-track-azurecli
ms.date: 09/25/2024
---

# How to onboard your Docker Hub container registries to Defender for Cloud Security Posture Management

Defender for Containers can connect to your organization's Docker Hub containers registry to gain the benefits of scanning your Docker Hub container images for security threats and protect the Docker Hub container registry itself within your Defender for Cloud Security Posture Management.

To enable Defender for Containers to connect to your Docker Hub containers registry, you need to:

1. Create in your Docker Hub organization account a dedicated user with access to the organization's Docker Hub container registries.
1. Generate access tokens for the Docker Hub user.
1. Configure the Defender for Cloud connector to securely access Docker Hub using the dedicated Docker Hub user name and access tokens.

## Set up the organization Docker Hub account

1. Before starting, verify that you own an organization Docker Hub account and have the appropriate administrative permissions to create and manage a Docker Hub user on the organization scope.

1. Create a dedicated user with your organization's email account, making sure it is a designated user for Defender for Containers connectivity only and not an account that be deactivated in the future.

    Example: MDC_User @myorg.com  

1. Enable the user to access all repositories in your organization

   :::image type="content" source="{source}" alt-text="{alt-text}":::

1. Generate Access Token for this user to enable a secure connection for the Defender for Containers Docker Hub connector to your organization's Docker Hub account. Save this access token for later use to configure the Defender for Containers Docker Hub connector.

    :::image type="content" source="{source}" alt-text="{alt-text}":::

    :::image type="content" source="{source}" alt-text="{alt-text}":::

1. Invite the dedicated user to be the type “Member” of your Docker Hub organization, with “Read-Only” permissions.

    :::image type="content" source="{source}" alt-text="{alt-text}":::

## Set up the Defender for Cloud Docker Hub connector

Under the Environment settings of Defender for Cloud, open the Docker Hub connection. In the Configure access tab of the Docker Hub connection, enter your organization name, the user name of the Docker Hub connector account, and the connector account access token.

    :::image type="content" source="{source}" alt-text="{alt-text}":::

Finalize connector onboarding wizard

Validate if the connectivity succeeded and the connection appears as “Connected” in the environments settings screen

    :::image type="content" source="{source}" alt-text="{alt-text}":::
