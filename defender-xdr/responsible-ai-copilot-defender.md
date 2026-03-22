---
title: Responsible AI FAQs for Microsoft Copilot in Defender
description: Learn about how Microsoft applies responsible AI principles to Microsoft Copilot in Microsoft Defender.
ms.service: defender-xdr
f1.keywords:
- NOCSH
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
audience: ITPro
ms.collection: 
- m365-security
- tier1
- security-copilot
- magic-ai-copilot 
ms.topic: concept-article
search.appverid:
- MOE150
- MET150
ms.date: 03/25/2025
#customer intent: I want to learn about how Microsoft applies responsible AI principles to Microsoft Copilot in Microsoft Defender.
---

# Responsible AI FAQs for Microsoft Copilot in Microsoft Defender

## Overview

An AI system includes not only the technology, but also the people who use it, the people affected by it, and the environment in which it's deployed. Microsoft's Responsible AI FAQs are intended to help you understand how AI technology works, the choices system owners and users can make that influence system performance and behavior, and the importance of thinking about the whole system, including the technology, the people, and the environment. You can use Responsible AI FAQs to better understand specific AI systems and features that Microsoft develops.

Responsible AI FAQs are part of a broader effort to put Microsoft's AI principles into practice. To find out more, see [Microsoft AI principles](https://www.microsoft.com/ai/responsible-ai).

## Responsible AI FAQs

### What is Microsoft Copilot in Microsoft Defender?

Microsoft Copilot in Defender is the integration of Security Copilot in the Microsoft Defender portal. It is a security solution that uses AI to help security analysts investigate and respond to threats. Copilot in Defender is designed to help security analysts work more efficiently and effectively by providing them with relevant information and recommendations. 

Copilot in Defender draws context from the data in the workloads that it monitors, and uses that context to provide recommendations to security analysts.

### What can Copilot in Defender do?

Copilot in Defender helps security analysts working in the Microsoft Defender portal by providing them with relevant information and recommendations. For example, Copilot in Defender can help security analysts by:

- Providing them with summaries of incidents or entities that they are investigating.
- Providing them with recommendations for how to respond to threats.
- Providing them with help in executing tasks like technical analysis of scripts or files, KQL query creation, or creation of incident reports.
- Providing them with information about threats, threat actors, and vulnerabilities that they need to be aware of.

### What is Copilot in Defender's intended use?

Copilot in Defender is intended for use by security analysts who are responsible for investigating and responding to threats. Copilot in Defender also provides recommendations to threat intelligence analysts about the latest threats, threat actors, and vulnerabilities that they need to be aware of to protect their organization.

### How was Copilot in Defender evaluated? What metrics are used to measure performance?

Copilot in Defender underwent substantial testing prior to being released. Testing included red teaming, which is the practice of rigorously testing the product to identify failure modes and scenarios that might cause Security Copilot to do or say things outside of its intended uses or that don't support the [Microsoft AI Principles](https://www.microsoft.com/ai/responsible-ai).

Now that it is released, user feedback is critical in helping Microsoft improve the system. You have the option of providing feedback whenever you receive output from Copilot in Defender. When a response is inaccurate, incomplete, or unclear, use the "Off-target" and "Report" buttons to flag any objectionable output. You can also confirm when responses are useful and accurate using the "Confirm" button. These buttons appear at the bottom of every Copilot in Defender response and your feedback goes directly to Microsoft to help us improve the platform's performance.

### What are the limitations of Copilot in Defender? How can users minimize the impact of Copilot in Defender’s limitations when using the system?

- The system is designed to generate responses and respond to prompts related to the security domain like incident investigation and threat intelligence. Prompts outside the scope of security might result in responses that lack accuracy and comprehensiveness.

- Copilot in Defender might generate code or include code in responses, which could potentially expose sensitive information or vulnerabilities if not used carefully. Responses might appear to be valid but might not actually be semantically or syntactically correct or might not accurately reflect the intent of the developer. Users should always take the same precautions as they would with any code they write that uses material users didn't independently originate, including precautions to ensure its suitability. These include rigorous testing, IP scanning, and checking for security vulnerabilities.

- Matches with Public Code: Copilot in Defender is capable of generating new code, which it does in a probabilistic way. While the probability that it might produce code that matches code in the training set is low, a Security Copilot suggestion might contain some code snippets that match code in the training set. Users should always take the same precautions as they would with any code they write that uses material developers didn't independently originate, including precautions to ensure its suitability. These include rigorous testing, IP scanning, and checking for security vulnerabilities.

- The system might not be able to process long prompts, such as hundreds of thousands of characters.

- Use of the platform might be subject to usage limits or capacity throttling. Even with shorter prompts, generating responses, and checking them before displaying them to the user can take time (up to several minutes) and require high GPU capacity.

- Like any AI-powered technology, Copilot in Defender doesn’t get everything right. However, you can help improve its responses by providing your observations using the feedback tool, which is built into the platform.

### How is Microsoft approaching responsible AI for Copilot in Defender?

At Microsoft, we take our commitment to responsible AI seriously. Security Copilot is being developed in accordance with our [AI principles](https://www.microsoft.com/ai/principles-and-approach). We're working with OpenAI to deliver an experience that encourages responsible use. For example, we have and will continue to collaborate with OpenAI on foundational model work. We have designed the Copilot in Defender user experience to keep humans at the center. We developed a safety system that is designed to mitigate failures and prevent misuse with things like harmful content annotation, operational monitoring, and other safeguards. The invite-only early access program is also a part of our approach to responsible AI. We're taking user feedback from those with early access to Security Copilot to improve the tool before making it broadly available.

Responsible AI is a journey, and we'll continually improve our systems along the way. We're committed to making our AI more reliable and trustworthy, and your feedback will help us do so.

### Do you comply with the EU AI Act?

We are committed to compliance with the EU AI Act. Our multi-year effort to define, evolve, and implement our Responsible AI Standard and internal governance has strengthened our readiness. To find out more, see [Microsoft's compliance with the EU AI Act](https://www.microsoft.com/trust-center/compliance/eu-ai-act).

At Microsoft, we recognize the importance of regulatory compliance as a cornerstone of trust and reliability in AI technologies. We're committed to creating responsible AI by design. Our goal is to develop and deploy AI that will have a beneficial impact on and earn trust from society.

Our work is guided by a core set of principles: fairness, reliability and safety, privacy and security, inclusiveness, transparency, and accountability. Microsoft's Responsible AI Standard takes these six principles and breaks them down into goals and requirements for the AI we make available.

Our Responsible AI Standard takes into account regulatory proposals and their evolution, including the initial proposal for the EU AI Act. We developed our most recent products and services in the AI space such as Microsoft Copilot and Microsoft Azure OpenAI Service in alignment with our Responsible AI Standard. As final requirements under the EU AI Act are defined in more detail, we look forward to working with policymakers to ensure feasible implementation and application of the rules, to demonstrating our compliance, and to engaging with our customers and other stakeholders to support compliance across the ecosystem.

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
