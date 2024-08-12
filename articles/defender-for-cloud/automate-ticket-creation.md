---
title: Automate ticket creation
description: Learn how to automate the ticket creation process with Defender for Cloud and ServiceNow.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/12/2024
ai-usage: ai-assisted
#customer intent: As a user, I want to learn about the integration that exists between ServiceNow and Microsoft Defender for Cloud so that I can protect my Azure, hybrid, and multicloud machines.
---

# Automate ticket creation

As part of the governance capabilities within Defender for Cloud, you can enable a bi-directional integration between ServiceNow and Defender for Cloud, for the creation of ITSM incidents, changes or problem tickets. 

Tickets can be initiated manually or automatically by leveraging governance automation rules.

## Prerequisites

- Have an [application registry in ServiceNow](https://www.opslogix.com/knowledgebase/servicenow/kb-create-a-servicenow-api-key-and-secret-for-the-scom-servicenow-incident-connector).

- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md) on your Azure subscription.

- [Connect ServiceNow to Defender for Cloud](connect-servicenow.md).

- One of the following roles are required: Security Admin, Contributor, or Owner.

## Automate the ticket creation process

