---
title: Alerts for AI services
description: This article lists the security alerts for AI services visible in Microsoft Defender for Cloud.
ms.topic: reference
ms.custom: linux-related-content
ms.date: 05/01/2025
ai-usage: ai-assisted
---

# Alerts for AI services

This article lists the security alerts you might get for AI services from Microsoft Defender for Cloud and any Microsoft Defender plans you enabled. The alerts shown in your environment depend on the resources and services you're protecting, and your customized configuration. 

[Learn how to respond to these alerts](managing-and-responding-alerts.yml).

[Learn how to export alerts](continuous-export.md).

> [!NOTE]
> Alerts from different sources might take different amounts of time to appear. For example, alerts that require analysis of network traffic might take longer to appear than alerts related to suspicious processes running on virtual machines.

## AI services alerts

### Detected credential theft attempts on an Azure AI model deployment

(AI.Azure_CredentialTheftAttempt)

**Description**: The credential theft alert is designed to notify the SOC when credentials are detected within GenAI model responses to a user prompt, indicating a potential breach. This alert is crucial for detecting cases of credential leak or theft, which are unique to generative AI and can have severe consequences if successful.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Credential Access, Lateral Movement, Exfiltration

**Severity**: Medium

### A Jailbreak attempt on an Azure AI model deployment was blocked by Azure AI Content Safety Prompt Shields

(AI.Azure_Jailbreak.ContentFiltering.BlockedAttempt)

**Description**: The Jailbreak alert, carried out using a direct prompt injection technique, is designed to notify the SOC there was an attempt to manipulate the system prompt to bypass the generative AI’s safeguards, potentially accessing sensitive data or privileged functions. It indicated that such attempts were blocked by Azure Responsible AI Content Safety (also known as Prompt Shields), ensuring the integrity of the AI resources and the data security.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Privilege Escalation, Defense Evasion

**Severity**: Medium

### A Jailbreak attempt on an Azure AI model deployment was detected by Azure AI Content Safety Prompt Shields

(AI.Azure_Jailbreak.ContentFiltering.DetectedAttempt)

**Description**: The Jailbreak alert, carried out using a direct prompt injection technique, is designed to notify the SOC there was an attempt to manipulate the system prompt to bypass the generative AI’s safeguards, potentially accessing sensitive data or privileged functions. It indicated that such attempts were detected by Azure Responsible AI Content Safety (also known as Prompt Shields), but weren't blocked due to content filtering settings or due to low confidence.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Privilege Escalation, Defense Evasion

**Severity**: Medium

### Sensitive Data Exposure Detected in Azure AI Model Deployment

(AI.Azure_DataLeakInModelResponse.Sensitive)

**Description**: The sensitive data leakage alert is designed to notify the SOC that a GenAI model responded to a user prompt with sensitive information, potentially due to a malicious user attempting to bypass the generative AI’s safeguards to access unauthorized sensitive data.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Collection

**Severity**: Low

### Corrupted AI application\model\data directed a phishing attempt at a user

(AI.Azure_MaliciousUrl.ModelResponse)

**Description**: This alert indicates a corruption of an AI application developed by the organization, as it has actively shared a known malicious URL used for phishing with a user. The URL originated within the application itself, the AI model, or the data the application can access.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Impact (Defacement)

**Severity**: High

### Phishing URL shared in an AI application

(AI.Azure_MaliciousUrl.UnknownSource)

**Description**: This alert indicates a potential corruption of an AI application, or a phishing attempt by one of the end users. The alert determines that a malicious URL used for phishing was passed during a conversation through the AI application, however the origin of the URL (user or application) is unclear.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Impact (Defacement), Collection

**Severity**: High

### Phishing attempt detected in an AI application

(AI.Azure_MaliciousUrl.UserPrompt)

**Description**: This alert indicates a URL used for phishing attack was sent by a user to an AI application. The content typically lures visitors into entering their corporate credentials or financial information into a legitimate looking website. Sending this to an AI application might be for the purpose of corrupting it, poisoning the data sources it has access to, or gaining access to employees or other customers via the application's tools.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Collection

**Severity**: High

### Suspicious user agent detected

(AI.Azure_AccessFromSuspiciousUserAgent)

**Description**: The user agent of a request accessing one of your Azure AI resources contained anomalous values indicative of an attempt to abuse or manipulate the resource. The suspicious user agent in question has been mapped by Microsoft threat intelligence as suspected of malicious intent and hence your resources were likely compromised.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Execution, Reconnaissance, Initial access

**Severity**: Medium

### ASCII Smuggling prompt injection detected

(AI.Azure_ASCIISmuggling)

**Description**: ASCII smuggling technique allows an attacker to send invisible instructions to an AI model. These attacks are commonly attributed to indirect prompt injections, where the malicious threat actor is passing hidden instructions to bypass the application and model guardrails. These attacks are usually applied without the user's knowledge given their lack of visibility in the text and can compromise the application tools or connected data sets.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Impact

**Severity**: High

### Access from a Tor IP

(AI.Azure_AccessFromAnonymizedIP)

**Description**: An IP address from the Tor network accessed one of the AI resources. Tor is a network that allows people to access the Internet while keeping their real IP hidden. Though there are legitimate uses, it is frequently used by attackers to hide their identity when they target people's systems online.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Execution

**Severity**: High

### Access from suspicious IP

(AI.Azure_AccessFromSuspiciousIP)

**Description**: An IP address accessing one of your AI services was identified by Microsoft Threat Intelligence as having a high probability of being a threat. While observing malicious Internet traffic, this IP came up as involved in attacking other online targets.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Execution

**Severity**: High

### Suspected wallet attack - recurring requests

(AI.Azure_DOWDuplicateRequests)

**Description**: Wallet attacks are a family of attacks common for AI resources that consist of threat actors excessively engage with an AI resource directly or through an application in hopes of causing the organization large financial damages. This detection tracks high volumes of identical requests targeting the same AI resource which may be caused due to an ongoing attack.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Impact

**Severity**: Medium

### Suspected wallet attack - volume anomaly

(AI.Azure_DOWVolumeAnomaly)

**Description**: Wallet attacks are a family of attacks common for AI resources that consist of threat actors excessively engage with an AI resource directly or through an application in hopes of causing the organization large financial damages. This detection tracks high volumes of requests and responses by the resource that are inconsistent with its historical usage patters.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Impact

**Severity**: Medium

### Access anomaly in AI resource

(AI.Azure_AccessAnomaly)

**Description**: This alert track anomalies in access patterns to an AI resource. Changes in request parameters by users or applications such as user agents, IP ranges, authentication methods, etc. can indicate a compromised resource that is now being accessed by malicious actors. This alert may trigger when requests are valid if they represent significant changes in the pattern of previous access to a certain resource.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Execution, Reconnaissance, Initial access

**Severity**: Medium

### Suspicious invocation of a high-risk 'Initial Access' operation by a service principal detected (AI resources)

(AI.Azure_AnomalousOperation.InitialAccess)

**Description**: This alert detects a suspicious invocation of a high-risk operation in your subscription, which might indicate an attempt to access restricted resources. The identified AI-resource related operations are designed to allow administrators to efficiently access their environments. While this activity might be legitimate, a threat actor might utilize such operations to gain initial access to restricted AI resources in your environment. This can indicate that the service principal is compromised and is being used with malicious intent.

**[MITRE tactics](alerts-reference.md#mitre-attck-tactics)**: Initial access

**Severity**: Medium

> [!NOTE]
> For alerts that are in preview: [!INCLUDE [Legalese](./includes/defender-for-cloud-preview-legal-text.md)]

## Next steps

- [Security alerts in Microsoft Defender for Cloud](alerts-overview.md)
- [Manage and respond to security alerts in Microsoft Defender for Cloud](managing-and-responding-alerts.yml)
- [Continuously export Defender for Cloud data](continuous-export.md)
