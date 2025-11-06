---
title: Defender CLI Authentication
description: Learn how to securely integrate Azure DevOps with Microsoft Defender for Cloud using connector-based authentication. Simplify token management and enhance security.
#customer intent: As a DevOps engineer, I want to integrate Azure DevOps with Microsoft Defender for Cloud using a connector so that I can automate authentication securely.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 11/06/2025
ms.topic: concept-article
---

# Defender CLI authentication

Defender CLI supports two authentication methods to align with enterprise security practices: connector-based authentication for Azure DevOps, which handles authentication automatically, and token-based authentication, which provides flexibility across different build systems and local environments.

## Connector Based (ADO only)
Connector‑based authentication integrates Azure DevOps directly with Microsoft Defender for Cloud through a secure connector. Once the connection is established, authentication is managed automatically, removing the need to store or inject tokens in your pipelines.  
This method is the preferred authentication method for Azure DevOps. [Learn on how to create a connector](/quickstart-onboard-devops.md).

## Token Based

Token‑based authentication allows security admins to generate tokens in the Microsoft Defender for Cloud portal and configure them as environment variables in CI/CD pipelines or local terminals. This method provides flexibility across different build systems and ensures secure, scoped access without embedding credentials in scripts.  

1. Sign in to the Azure portal and open Microsoft Defender for Cloud.

1. Navigate to **Management ▸ Environment settings ▸ Integrations**.

   :::image type="content" source="media/cli-cicd/env-settings-integrations.png" alt-text="Screenshot of Integration Environment Settings in Defender for Cloud.":::

1. Select **+ Add integration ▸ DevOps Ingestion (Preview)**

   :::image type="content" source="media/cli-cicd/new-devops-ingestion.png" alt-text="Screenshot of new DevOps Ingestion option.":::

1. Enter an application name.
   1. Choose the tenant to store the secret.
   1. Set an expiration date, and enable the token.
   1. Select **Save**.

   :::image type="content" source="media/cli-cicd/add-devops-ingestion.png" alt-text="Screenshot of new DevOps Ingestion option.":::  
   :::image type="content" source="media/cli-cicd/devops-ingestion-created.png" alt-text="Screenshot of creating DevOps Ingestion and creation of tokens."::: 
 
1. After saving, copy the Client ID, Client Secret, and Tenant ID. You can't retrieve them again.

   :::image type="content" source="media/cli-cicd/devops-ingestion-created-success.png" alt-text="Screenshot of new DevOps Ingestion option.":::
