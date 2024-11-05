---
title: Overview of partner integration
description: Learn about The different partners that integrate with Defender for Cloud to enhance your security posture and protect your Azure resources.
ms.topic: concept-article
ms.date: 11/05/2024
#customer intent: As a reader, I want to learn what partner solutions integrate with Defender for Cloud.
---

# Overview of partner integration

Microsoft Defender for Cloud is a Cloud Native Application Protection Platform (CNAPP) that helps customers protect their cloud resources from threats and vulnerabilities. Many customers use multiple security solutions to protect their cloud resources. Defender for Cloud integrates with partner solutions to enhance your security posture and protect your Azure resources. Integration with solutions helps you to both gain and provide insights from each security solution with Defender for Cloud.

The following are the types of partner integration available in Defender for Cloud:

- [Gain insights from partner integrations](#gain-insights-from-partner-integrations)
- [Convey insights to partner integrations](#convey-insights-to-partner-integrations)
- [Security solutions (legacy)](#security-solutions-legacy)

## Gain insights from partner integrations

Defender for Cloud has the ability to gain different types of information from partner integrations. These integrations have the ability to  provide you with additional insights that enrich the experience for Defender for Cloud's users with a broader understanding of your environments overall security posture.

Defender for Cloud can gain insights from the following types of partner integrations:

- [Software composition analysis (SCA)](#software-composition-analysis-sca)
- [API security testing integrations](#api-security-testing-integrations)
- [Ticketing services](#ticketing-services)

### Software composition analysis (SCA)

The following table shows the list of software composition analysis (SCA) partners that are partnered with Defender for Cloud. 

SCA partners play a vital role in software development by identifying security issues. This process investigates these components to find out if they're free from known vulnerabilities, and compliant with their respective licenses.

| Partner name | Description | Documentation |
|--|--|--|
| Endor Labs | Endor Labs is a software supply chain security company that enhances application security by managing open-source software dependencies. Their platform helps organizations select, secure, and maintain these dependencies, streamlining the development process and reducing security risks. |  [Integrate partner integrations](integrate-partner-integrations.md) |

### API security testing integrations

Microsoft Defender for Cloud supports partner tools to help enhance the existing runtime security capabilities that are provided by Defender for APIs. This support enables full lifecycle API security, and the ability for security teams to effectively discover and remediate API security vulnerabilities before they're deployed in production. Partner application security scan results are available in Defender for Cloud, giving central security teams visibility into API health within the Defender for Cloud recommendations. 

| Logo | Partner name | Description | Enablement Guide |
|--|--|--|--|
| :::image type="icon" source="media/partner-integrations/42crunch-logo.png" border="false"::: | [42Crunch](https://aka.ms/APISecurityTestingPartnershipIgnite2023) | Developers can proactively test and harden APIs within their CI/CD pipelines through static and dynamic testing of APIs against the top OWASP API risks and OpenAPI specification best practices. | [42Crunch onboarding guide](onboarding-guide-42crunch.md) |
| :::image type="icon" source="media/partner-integrations/stackhawk-logo.png" border="false"::: | [StackHawk](https://aka.ms/APISecurityTestingPRStackHawk) | StackHawk is the only modern Dynamic Application Security Testing (DAST) and API security testing tool that runs in CI/CD, enabling developers to quickly find and fix security issues before they hit production. | [StackHawk onboarding guide](https://aka.ms/APISecurityTestingOnboardingGuideStackHawk) |
| :::image type="icon" source="media/partner-integrations/bright-security-logo.png" border="false"::: | [Bright Security](https://aka.ms/APISecurityTestingPRBrightSecurity) | Bright Security's dev-centric DAST platform empowers both developers and AppSec professionals with enterprise grade security testing capabilities for web applications, APIs, and GenAI and LLM applications. Bright knows how to deliver the right tests, at the right time in the SDLC, in developers and AppSec tools and stacks of choice with minimal false positives and alert fatigue. | [Bright Security onboarding guide](https://aka.ms/APISecurityTestingOnboardingGuideBrightSecurity) | 

### Ticketing services

The following table lists the partner solutions that provide ticketing services to Defender for Cloud. These solutions help you to create and manage tickets for security incidents and vulnerabilities detected by Defender for Cloud. Ticketing services let users easily submit, track, and fix tickets. This improves communication between the IT department and end-users, ensuring quick and effective issue resolution.

| Partner name | Description | Documentation |
|--|--|--|
| ServiceNow | ServiceNow is a cloud computing platform that helps companies manage digital workflows for enterprise operations. ServiceNow provides a range of services including IT service management, customer service management, and HR service delivery. | [ServiceNow integration with Defender for Cloud](integration-servicenow.md) |

## Convey insights to partner integrations

The following table lists our partners that can receive data from Defender for Cloud. Defender for Cloud generates security insights that are not provided by other security solutions. Some of these solutions have partnered with with Defender for Cloud to integrate Defender for Cloud's findings within their programs to enrich their own services. By offering customers Defender for Cloud's security information, their customers are able to get a better understanding of their overall security posture.

Learn how to [connect your partner integration](integrate-partner-integrations.md) to Defender for Cloud.

| Partner name | Description | Partner integration documentation |
|--|--|--|
| Cycode | Cycode is a cybersecurity company specializing in Application Security Posture Management (ASPM). Their platform provides comprehensive visibility, risk-driven prioritization, and remediation of code vulnerabilities, ensuring the security of software delivery pipelines. | [Partner integration page](https://cycode.com/cycode-integrations/) |
| ServiceNow| ServiceNow is a cloud computing company that provides a platform to help organizations manage digital workflows for enterprise operations. Their solutions include IT service management, IT operations management, and various other enterprise service management applications. | [Partner integration page](https://docs.servicenow.com/bundle/washingtondc-security-management/page/product/secops-integration-vr/azure-security-center/concept/cc_asc_overview.html) |
| Elastic| Elastic, formerly known as Elasticsearch, is a company that provides search-powered solutions for various use cases, including search, logging, security, observability, and analytics.| [Partner integration page](https://www.elastic.co/docs/current/integrations/microsoft_defender_cloud) | 
| IBM QRadar | IBM QRadar is a Security Information and Event Management (SIEM) platform that provides real-time visibility into IT infrastructure. It collects, analyzes, and correlates security events from various sources to help organizations detect, investigate, and respond to security threats. | [Partner integration page](https://www.ibm.com/docs/en/dsm?topic=microsoft-defender-cloud) |
| Datadog | Datadog provides a monitoring and security platform for cloud applications. It offers infrastructure monitoring, application performance monitoring, log management, and cloud security solutions. | [Partner integration page](https://docs.datadoghq.com/integrations/microsoft_defender_for_cloud/) |
| VMware Aria | VMware Aria is a multicloud management portfolio that provides end-to-end solutions for managing the cost, performance, configuration, and delivery of infrastructure and applications. It's designed to address the operational challenges of cloud-native applications and public cloud environments. <br><br> VMware  Aria automatically collects MDC data when an Azure subscription is onboarded. | [Partner integration page](https://docs.vmware.com/en/VMware-Aria-Automation-for-Secure-Clouds/services/chss-getting-started/GUID-integrations-microsoft-defender.html) |
| SAFE One | SAFE One is a unified platform for managing partner and first-party cyber risk. It uses AI-driven technology to provide real-time insights into cyber risk and suggests security improvements based on business effect. | [Partner integration page](https://docs.safe.security/docs/azure) |
| Cortex XSOAR | Cortex XSOAR is a security orchestration, automation, and response (SOAR) platform. It unifies automation, case management, real-time collaboration, and threat intelligence to streamline security operations. | [Partner integration page](https://xsoar.pan.dev/docs/reference/integrations/azure-security-center-v2) |
| VulcanCyber | VulcanCyber provides a SaaS platform for cyber risk management. It focuses on risk reporting, vulnerability data correlation, and risk prioritization to help organizations mitigate cyber threats effectively. | [Partner integration page](https://help.vulcancyber.com/en/articles/7850120-microsoft-defender-for-cloud-connector-new-revision) |
| Autobahn security | Autobahn Security is a SaaS platform that helps IT teams manage and remediate cybersecurity vulnerabilities more efficiently. It aggregates, filters, and prioritizes vulnerabilities from various scanners, providing easy-to-understand remediation guides to enhance network security. | [Partner integration page](https://support.autobahn-security.com/knowledge/integrate-ms-defender-for-cloud-with-autobahn-fit) |
| Google Security Operations SOAR | Google Security Operations SOAR is a platform designed to help organizations detect, investigate, and respond to security threats in real-time. It applies Google’s infrastructure and machine learning capabilities to automate and streamline security workflows, enhancing the overall security posture. | [Partner integration page](https://cloud.google.com/chronicle/docs/soar/marketplace-integrations/azure-security-center) |
| Vanta | Vanta is a security and compliance automation platform that helps companies improve and demonstrate their security practices. It automates the process of obtaining and maintaining compliance certifications such as SOC 2, HIPAA, and ISO 27001. | [Partner integration page](https://help.vanta.com/hc/en-us/articles/360050273571-Connecting-Vanta-Azure) |
| Tenable | Tenable is a cybersecurity company that specializes in vulnerability management and exposure management solutions. It helps organizations identify, assess, and mitigate cyber risks across their entire digital infrastructure. | [Partner integration page](https://www.tenable.com/partners/technology) |
| TrendMicro | Trend Micro is a cybersecurity company that provides advanced threat protection and security solutions for businesses and consumers. It specializes in cloud and enterprise cybersecurity, offering services like attack surface management, extended detection and response (XDR), and data loss prevention. | [Partner integration page](https://www.trendmicro.com/cloudoneconformity/knowledge-base/azure/SecurityCenter/) |
| Cavenix | Caveonix is a cybersecurity company that provides an enterprise risk management platform. It automates cybersecurity, compliance, and governance processes, helping organizations manage risks and maintain regulatory compliance efficiently. | Partner integration page|
| Permiso | Permiso is a cybersecurity company that specializes in identity-based cloud detection and response. It helps organizations monitor and secure identities across various environments, detecting suspicious or malicious activities to protect cloud infrastructures. | [Partner integration page](https://permiso.io/integrations) |
| Kondukto | Kondukto is a cybersecurity company that specializes in application security orchestration and posture management. It provides a platform that integrates security data, automates vulnerability remediation workflows, and helps manage risks with key security performance indicators. | [Partner integration page](https://kondukto.io/integrations?search=defender) |
| Phoenix Security | Phoenix Security is a cybersecurity company that specializes in risk-based vulnerability management. It provides a platform that helps organizations identify, prioritize, and remediate vulnerabilities to minimize cyberattack risks. | [Partner integration page](https://kb.phoenix.security/?ht_kb=integration-with-azure-defender) |
| Nucleus | Nucleus is a cybersecurity company that provides a unified vulnerability management platform. It helps organizations centralize, prioritize, and remediate security vulnerabilities across their entire IT environment. | [Partner integration page](https://nucleussec.com/Integration/) |

## Security solutions (legacy)

Searching your page for information

Microsoft Defender for Cloud integrates with both Microsoft services and partner solutions to simplify deployment, integrate detection, unify monitoring and management, and extend capabilities. It provides streamlined provisioning, automatic collection and aggregation of security events, and advanced threat-detection capabilities.

| Partner name | Description | Documentation |
|--|--|--|
| Barracuda Networks | Barracuda Networks is a cybersecurity company that provides security, networking, and storage solutions. It offers a range of products including email protection, application security, network security, and data protection to help organizations safeguard their digital environments. | [Integrate partner solutions](partner-integration.md) |
| Check Point | Check Point is a cybersecurity company that provides comprehensive security solutions for networks, endpoints, clouds, and mobile devices. It offers a range of products and services designed to protect organizations from cyber threats and ensure robust security management. | [Integrate partner solutions](partner-integration.md) |
| F5 Networks | F5 Networks is a technology company that specializes in application security, multicloud management, and application delivery networking. It provides solutions to ensure the security, availability, and performance of applications across various environments. |  [Integrate partner solutions](partner-integration.md) |
| Rapid7 | Rapid7 is a cybersecurity company that provides security data and analytics solutions. It helps organizations manage vulnerabilities, detect threats, and respond to incidents in real-time, enhancing their overall security posture. | [Integrate partner solutions](partner-integration.md) |
| Qualys | Qualys is a cybersecurity company that provides cloud-based security and compliance solutions. It helps organizations identify and manage security risks, ensuring continuous protection and compliance across their IT environments. | [Integrate partner solutions](partner-integration.md) |

Learn how to [integrate these security solutions](partner-integration.md).

## Next step

> [!div class="nextstepaction"]
> [Integrate partner integrations](integrate-partner-integrations.md)
