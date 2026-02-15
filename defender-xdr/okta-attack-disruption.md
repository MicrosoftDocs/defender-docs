---
title: Enable attack disruption actions in Okta
description: Learn how to configure your Okta integration with Microsoft Defender XDR to enable automatic attack disruption capabilities.
ms.service: defender-xdr
ms.author: monaberdugo
author: mberdugo
ms.localizationpriority: medium
ms.reviewer: Ofer Shreiber
ms.collection:
  - m365-security
  - tier2
ms.topic: how-to
ms.date: 02/15/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender XDR
---

# Enable attack disruption actions in Okta (preview)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

Microsoft Defender XDR's [automatic attack disruption](automatic-attack-disruption.md) capabilities can help protect your Okta-managed identities by automatically responding to threats. When an identity managed by Okta is compromised, Defender XDR can take remediation actions directly in Okta to contain the attack, limit lateral movement, and reduce overall impact.

This article describes how to set up the Okta integration with Microsoft Defender for Identity to enable attack disruption actions in your Okta environment.

## Prerequisites

Before you begin, make sure the following prerequisites are met:

### Okta requirements

You have an Okta account with admin privileges and a developer or enterprise license.

### Microsoft requirements

- Your Microsoft Sentinel analytic workspace is connected to the unified security operations portal
- The Okta connector for Microsoft Sentinel is deployed and enabled.

> [!NOTE]
> During public preview, only the Okta single sign-in connector is supported.

## Step 1: Create the Okta integration

To create the integration from an Okta account with admin privileges, follow these steps:

1. [Find your Okta domain](https://developer.okta.com/docs/guides/find-your-domain/main/#find-your-okta-domain)
1. [Create an Okta API key](https://help.okta.com/en-us/content/topics/security/api.htm#create-okta-api-token)

  - Provide a friendly name for your token
  - Make sure to keep the generated token value to be used later when creating the integration.

> [!NOTE]
> This token is a secret that allows connecting to your Okta environment and performing actions. Don't share its value or save it in any visible or public location.

## Step 2: Create the integration from the Defender portal

1. Log in to the [Defender portal](https://security.microsoft.com/)
1. Navigate **Microsoft Sentinel** -> **Configuration** -> **Automation**.
1. In the **Integrations profiles** tab, select **+Create** to create a new integration.

    :::image type="content" source="./media/okta-attack-disruption/create-new-integration.png" alt-text="Screenshot of the Integrations profile tab in the Automation page with the Create button highlighted.":::

1. Fill in the following values, then select **Create**:

   1. **Integration name**
   1. **Description**
   1. **Base API URL**: Enter your full Okta domain starting with `https://`
   1. **Authentication method**: Select API Key
  
      1. **API key name**
      1. **API key**: Enter `SSWS <API-Key>`, replacing `<API-Key>` with the value of the API token you generated in Okta. There should be a space between `SSWS` and your API Key. For more information, see the [Okta documentation for API Key usage](https://developer.okta.com/docs/reference/core-okta-api/#authentication)
      1. **API key identifier**: Leave empty
      1. Enable the **Send SPI key in header** switch.

   :::image type="content" source="./media/okta-attack-disruption/integration-details.png" alt-text="Screenshot of the integration details form with fields for Integration name, Description, Base API URL, and Authentication method." lightbox="./media/okta-attack-disruption/integration-details.png":::

## Related content

- [Automatic attack disruption in Microsoft Defender XDR](automatic-attack-disruption.md)
- [Configure automatic attack disruption](configure-attack-disruption.md)
- [How Microsoft Defender for Identity protects your Okta accounts](/defender-for-identity/okta-defender-for-identity-overview)
- [Connect Okta to Microsoft Defender for Identity](/defender-for-identity/okta-integration)
