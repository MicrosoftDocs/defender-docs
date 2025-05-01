---
title: Containers software supply chain security using Defender for Containers
description: Understand how Defender for Containers can secure your containers software supply chain.
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
ms.date: 3/19/2025
#customer intent: As a devops person, I want to understand how Defender for Containers can secure my containers software supply chain.
---

# Containers software supply chain (CSSC) security using Defender for Containers

In today's cloud-native environments, securing the container software supply chain is crucial to protect applications from vulnerabilities and threats. Microsoft Defender for Containers collaborates within the [Microsoft Containers Secure Supply Chain (CSSC) framework](/azure/security/container-secure-supply-chain) to provide comprehensive security capabilities to safeguard your containerized applications throughout their lifecycle. From development to deployment, Defender for Containers helps you identify and mitigate risks, ensuring that your container images and runtime environments are secure.

With Defender for Containers, you can:
- Scan container images for vulnerabilities and security threats.
- Sign the vulnerability findings artifact upon each image rescan to ensure vulnerabilities weren't introduced within your organization's CSSC. The vulnerability findings artifact is signed with a Microsoft certificate for integrity and authenticity and is associated with the container image in the registry for validation needs.
- Create security rules to control deployment of container images based on vulnerabilities detected in the container image.
- Assess container images during deployment against security rules that implement organizational security policies.
- Maintain compliance by using security policies.
- Gain visibility into your container security posture.

By integrating Defender for Containers into your DevOps processes and applying the security guardrails it offers, you can enhance the security of your container software supply chain and build resilient, secure applications.
