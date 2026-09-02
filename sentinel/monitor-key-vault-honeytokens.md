---
title: Deploy and monitor Azure Key Vault honeytokens with Microsoft Sentinel
description: Plant Azure Key Vault honeytoken keys and secrets, and monitor them with Microsoft Sentinel.
ms.author: guywild
author: guywi-ms
ms.reviewer: noak
ms.topic: how-to
ms.date: 06/15/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014

#Customer intent: As a security analyst, I want to deploy and monitor Azure Key Vault honeytokens using Microsoft Sentinel so that I can detect and respond to potential security threats effectively.

---

# Deploy and monitor Azure Key Vault honeytokens with Microsoft Sentinel (Community supported)

The Microsoft Sentinel Deception solution uses honeytokens—decoy keys and secrets planted in Azure Key Vault—to help detect unauthorized access attempts. When an attacker accesses a honeytoken, Microsoft Sentinel triggers an alert so you can respond quickly. This article provides guidance on community support for the honeytokens solution and links to deployment documentation.

> [!IMPORTANT]
> The Microsoft Sentinel Deception (Honey Tokens) solution is offered in a community supported model by the [Microsoft SIEM & XDR Community](https://github.com/Azure/Azure-Sentinel/wiki). Any support required can be raised on the [Microsoft Sentinel GitHub issues page](https://github.com/Azure/Azure-Sentinel/issues) where the Microsoft Sentinel community can assist.
>
> For solution documentation, review the [Honeytokens solution GitHub page](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/HoneyTokens).

<a name="azure-key-vault-honeytokens-is-now-a-community-supported-solution"></a>
## Community support for the Azure Key Vault honeytokens solution

To deploy and monitor Azure Key Vault honeytokens with Microsoft Sentinel, review the [Honeytokens solution GitHub page](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/HoneyTokens).

## Next steps

For more information, see:

- [About Microsoft Sentinel solutions](sentinel-solutions.md) - Learn what Microsoft Sentinel solutions are and how they package content.
- [Discover and deploy Microsoft Sentinel solutions](sentinel-solutions-deploy.md) - Find and install solutions from the content hub.
- [Microsoft Sentinel solutions catalog](sentinel-solutions-catalog.md) - Browse the full list of available solutions.
- [Detect threats out-of-the-box](detect-threats-built-in.md) - Use built-in analytics rules for threat detection.
- [Commonly used Microsoft Sentinel workbooks](top-workbooks.md) - Explore popular workbooks for monitoring and visualization.

<!-- The following section is used to store references to external images and links to reduce maintenance overhead and enable tooltips -->

[//]: # (*******************************)
[//]: # (EXTERNAL IMAGE REFERENCES BELOW)
[//]: # (*******************************)

[DTA-Button-MG]: https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true "Deploy ASC polices to Management Group scope."
[DTA-Button-Sub]: https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true "Deploy ASC polices to Subscription scope."

[//]: # (**************************)
[//]: # (EXTERNAL LINK LABELS BELOW)
[//]: # (**************************)

[GitHub-MG]: https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/HoneyTokens/ASCRecommendationPolicy.json
[GitHub-Sub]: https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/HoneyTokens/ASCRecommendationPolicySub.json

[DTA-MG]: https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FSolutions%2FHoneyTokens%2FASCRecommendationPolicy.json/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FSolutions%2FHoneyTokens%2FASCRecommendationPolicyUI.json
[DTA-Sub]: https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Sentinel%2Fmaster%2FSolutions%2FHoneyTokens%2FASCRecommendationPolicySub.json