---
title: Planning multicloud security automating connector deployment
description: Automate cloud connector deployment for multicloud environments with Microsoft Defender for Cloud.
ms.topic: how-to
author: ElazarK
ms.author: elkrieger
ms.date: 05/28/2026
#customer intent: As a cloud security architect, I want to automate connector deployment so I can onboard multicloud environments consistently at scale.
---

# Automate connector deployment

This article is part of a series to guide you in designing a solution for cloud security posture management (CSPM) and cloud workload protection platform (CWPP) across multicloud resources with Microsoft Defender for Cloud.
It explains how to create AWS and GCP connectors programmatically so you can standardize deployment workflows.

## Connector deployment automation goals

Connect AWS accounts and/or GCP projects programmatically.

## Set up automated connector deployment

You can connect AWS accounts and GCP projects to Microsoft Defender for Cloud programmatically by using the Defender for Cloud REST API.
Review the [Security Connectors REST API](/rest/api/defenderforcloud-composite/security-connectors?view=rest-defenderforcloud-composite-latest&preserve-view=true).
:::image type="content" source="media/planning-multicloud-security/security-connectors.png" alt-text="screenshot that shows a table of security connector operations." lightbox="media/planning-multicloud-security/security-connectors.png":::

- When you use the REST API to create a connector, you also need the CloudFormation template or Cloud Shell script, depending on the environment you're onboarding.
- The easiest way to get the template or script is to download it from the Defender for Cloud portal.
- The template or script changes depending on which Defender for Cloud protection plans you're enabling.

## Next step

> [!div class="nextstepaction"]
> [Review additional multicloud security resources](plan-multicloud-security-other-resources.md#)


