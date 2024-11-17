---
title: Overview of partner integration
description: Learn about The different partners that integrate with Defender for Cloud to enhance your security posture and protect your Azure resources.
ms.topic: concept-article
ms.date: 11/17/2024
#customer intent: As a reader, I want to learn what partner solutions integrate with Defender for Cloud.
---

# Overview of partner integration

Microsoft Defender for Cloud is a Cloud Native Application Protection Platform (CNAPP) designed to safeguard cloud resources from threats, vulnerabilities, and misconfigurations. Recognizing that many customers employ multiple security solutions, Defender for Cloud offers the capability to both gather insights from and share insights with partner solutions. By integrating Defender for Cloud with their existing security tools, customers can significantly enhance their overall security posture and better protect their resources from potential threats.

Defender for Cloud can integrate with partner solutions to:

- [Ingest insights from partner integrations](#ingest-insights-from-partner-integrations)
- [Convey insights to partner integrations](#convey-insights-to-partner-integrations)
- Partner with [security solutions (legacy)](#security-solutions-legacy)

## Ingest insights from partner integrations

Defender for Cloud is capable of ingesting various types of information from partner integrations. These integrations can offer enhanced insights, enriching the user experience and providing a more comprehensive understanding of your environment's overall security posture.

Integrating with certain partners provides Defender for Cloud with the following types of information:

- [Software composition analysis (SCA)](#software-composition-analysis-sca)
- [API security testing integrations](#api-security-testing-integrations)
- [Ticketing services](#ticketing-services)

### Software composition analysis (SCA)

Software composition analysis (SCA) partners that are partnered with Defender for Cloud play a vital role in the software development process. SCA partners identify security issues by investigating resources to find out if they're free from known vulnerabilities, and compliant with their respective licenses.

| Partner name | Logo | Description | Documentation |
|--|--|--|--|
| Endor Labs | :::image type="icon" source="media/partner-integrations/endor-logo.png" border="false"::: | Endor Labs is a software supply chain security company that enhances application security by managing open-source software dependencies. Their platform helps organizations select, secure, and maintain these dependencies, streamlining the development process and reducing security risks. |  [Endor Labs Onboarding guide](https://www.endorlabs.com/lp/microsoft-defender-for-cloud) |

### API security testing integrations

Microsoft Defender for Cloud supports partner tools to help enhance the existing runtime security capabilities that are provided by Defender for APIs. This support enables full lifecycle API security, and the ability for security teams to effectively discover and remediate API security vulnerabilities before they're deployed in production. Partner application security scan results are available in Defender for Cloud, giving central security teams visibility into API health within the Defender for Cloud recommendations.

| Partner name | Logo | Description | Enablement Guide |
|--|--|--|--|
| [42Crunch](https://aka.ms/APISecurityTestingPartnershipIgnite2023) | :::image type="icon" source="media/partner-integrations/42crunch-logo.png" border="false"::: | Developers can proactively test and harden APIs within their CI/CD pipelines through static and dynamic testing of APIs against the top OWASP API risks and OpenAPI specification best practices. | [42Crunch onboarding guide](onboarding-guide-42crunch.md) |
| [StackHawk](https://aka.ms/APISecurityTestingPRStackHawk) | :::image type="icon" source="media/partner-integrations/stackhawk-logo.png" border="false"::: | StackHawk is the only modern Dynamic Application Security Testing (DAST) and API security testing tool that runs in CI/CD, enabling developers to quickly find and fix security issues before they hit production. | [StackHawk onboarding guide](https://aka.ms/APISecurityTestingOnboardingGuideStackHawk) |
| [Bright Security](https://aka.ms/APISecurityTestingPRBrightSecurity) | :::image type="icon" source="media/partner-integrations/bright-security-logo.png" border="false"::: | Bright Security's dev-centric DAST platform empowers both developers and AppSec professionals with enterprise grade security testing capabilities for web applications, APIs, and GenAI and Large Language Models (LLM) applications. Bright knows how to deliver the right tests, at the right time in the software development lifecycle, in developers and AppSec tools and stacks of choice with minimal false positives and alert fatigue. | [Bright Security onboarding guide](https://aka.ms/APISecurityTestingOnboardingGuideBrightSecurity) |

### Ticketing services

Defender for Cloud is partnered with solutions that provide ticketing services. Ticketing solutions help you create and manage tickets for security incidents and vulnerabilities that Defender for Cloud detects. Ticketing services let users easily submit, track, and fix tickets which improves communication between your IT department and end-users, ensuring quick and effective issue resolution.

| Partner name | Description | Documentation |
|--|--|--|
| ServiceNow | ServiceNow is a cloud computing platform that helps companies manage digital workflows for enterprise operations. ServiceNow provides a range of services including IT service management, customer service management, and HR service delivery. | [ServiceNow integration with Defender for Cloud](integration-servicenow.md) |

## Convey insights to partner integrations

Microsoft Defender for Cloud effectively identifies and generates distinctive security insights by continuously monitoring and analyzing your cloud environments for potential threats and vulnerabilities. Partner solutions can seamlessly integrate these insights into their own programs, enhancing the overall quality and robustness of their services.

The following table lists partners that provide integration with Defender for Cloud and utilize its data for enhanced security measures.

| Partner name | Logo | Description | Partner integration documentation |
|--|--|--|--|
| Cycode | :::image type="icon" source="media/partner-integrations/cycode-logo.png" border="false"::: | Cycode is a cybersecurity company specializing in Application Security Posture Management (ASPM). Their platform provides comprehensive visibility, risk-driven prioritization, and remediation of code vulnerabilities, ensuring the security of software delivery pipelines. | [Cycode integration page](https://cycode.com/cycode-integrations/) |
| ServiceNow |  | ServiceNow is a cloud computing company that provides a platform to help organizations manage digital workflows for enterprise operations. Their solutions include IT service management, IT operations management, and various other enterprise service management applications. | [ServiceNow integration page](https://docs.servicenow.com/bundle/washingtondc-security-management/page/product/secops-integration-vr/azure-security-center/concept/cc_asc_overview.html) |
| Elastic | :::image type="icon" source="media/partner-integrations/elastic-logo.png" border="false"::: | Elastic, formerly known as Elasticsearch, is a company that provides search-powered solutions for various use cases, including search, logging, security, observability, and analytics. | [Elastic integration page](https://www.elastic.co/docs/current/integrations/microsoft_defender_cloud) |
| IBM QRadar |  | IBM QRadar is a Security Information and Event Management (SIEM) platform that provides real-time visibility into IT infrastructure. It collects, analyzes, and correlates security events from various sources to help organizations detect, investigate, and respond to security threats. | [IBM QRadar integration page](https://www.ibm.com/docs/en/dsm?topic=microsoft-defender-cloud) |
| Datadog |  | Datadog provides a monitoring and security platform for cloud applications. It offers infrastructure monitoring, application performance monitoring, log management, and cloud security solutions. | [Datadog integration page](https://docs.datadoghq.com/integrations/microsoft_defender_for_cloud/) |
| VMware Aria |  | VMware Aria is a multicloud management portfolio that provides end-to-end solutions for managing the cost, performance, configuration, and delivery of infrastructure and applications. VMware Aria is designed to address the operational challenges of cloud-native applications and public cloud environments. <br><br> VMware  Aria automatically collects MDC data when an Azure subscription is onboarded. | [VMware Aria integration page](https://docs.vmware.com/en/VMware-Aria-Automation-for-Secure-Clouds/services/chss-getting-started/GUID-integrations-microsoft-defender.html) |
| SAFE One | :::image type="icon" source="media/partner-integrations/safeone-logo.png" border="false"::: | SAFE One is a unified platform for managing partner and first-party cyber risk. It uses AI-driven technology to provide real-time insights into cyber risk and suggests security improvements based on business effect. | [SAFE One integration page](https://docs.safe.security/docs/azure) |
| Cortex XSOAR |  | Cortex XSOAR is a security orchestration, automation, and response (SOAR) platform. It unifies automation, case management, real-time collaboration, and threat intelligence to streamline security operations. | [Cortex XSOAR integration page](https://xsoar.pan.dev/docs/reference/integrations/azure-security-center-v2) |
| VulcanCyber | :::image type="icon" source="media/partner-integrations/vulcan-logo.png" border="false"::: | VulcanCyber provides a SaaS platform for cyber risk management. It focuses on risk reporting, vulnerability data correlation, and risk prioritization to help organizations mitigate cyber threats effectively. | [VulcanCyber integration page](https://help.vulcancyber.com/en/articles/7850120-microsoft-defender-for-cloud-connector-new-revision) |
| Autobahn security |  | Autobahn Security is a SaaS platform that helps IT teams manage and remediate cybersecurity vulnerabilities more efficiently. It aggregates, filters, and prioritizes vulnerabilities from various scanners, providing easy-to-understand remediation guides to enhance network security. | [Autobahn integration page](https://support.autobahn-security.com/knowledge/integrate-ms-defender-for-cloud-with-autobahn-fit) |
| Google Security Operations SOAR |  | Google Security Operations SOAR is a platform designed to help organizations detect, investigate, and respond to security threats in real-time. It applies Google’s infrastructure and machine learning capabilities to automate and streamline security workflows, enhancing the overall security posture. | [Google Security Operations SOAR integration page](https://cloud.google.com/chronicle/docs/soar/marketplace-integrations/azure-security-center) |
| Vanta | :::image type="icon" source="media/partner-integrations/vanta-logo.png" border="false"::: | Vanta is a security and compliance automation platform that helps companies improve and demonstrate their security practices. It automates the process of obtaining and maintaining compliance certifications such as SOC 2, HIPAA, and ISO 27001. | [Vanta integration page](https://help.vanta.com/hc/en-us/articles/360050273571-Connecting-Vanta-Azure) |
| Tenable |  | Tenable is a cybersecurity company that specializes in vulnerability management and exposure management solutions. It helps organizations identify, assess, and mitigate cyber risks across their entire digital infrastructure. | [Tenable integration page](https://www.tenable.com/partners/technology) |
| TrendMicro |  | Trend Micro is a cybersecurity company that provides advanced threat protection and security solutions for businesses and consumers. It specializes in cloud and enterprise cybersecurity, offering services like attack surface management, extended detection and response (XDR), and data loss prevention. | [TrendMicro integration page](https://www.trendmicro.com/cloudoneconformity/knowledge-base/azure/SecurityCenter/) |
| Caveonix |  | Caveonix is a cybersecurity company that provides an enterprise risk management platform. It automates cybersecurity, compliance, and governance processes, helping organizations manage risks and maintain regulatory compliance efficiently. | [Caveonix integration page](https://www.caveonix.com/integrations-and-frameworks) |
| Permiso |  | Permiso is a cybersecurity company that specializes in identity-based cloud detection and response. It helps organizations monitor and secure identities across various environments, detecting suspicious or malicious activities to protect cloud infrastructures. | [Permiso integration page](https://permiso.io/integrations) |
| Kondukto | :::image type="icon" source="media/partner-integrations/kondukto-logo.png" border="false"::: | Kondukto is a cybersecurity company that specializes in application security orchestration and posture management. It provides a platform that integrates security data, automates vulnerability remediation workflows, and helps manage risks with key security performance indicators. | [Kondukto integration page](https://kondukto.io/integrations?search=defender) |
| Phoenix Security |  | Phoenix Security is a cybersecurity company that specializes in risk-based vulnerability management. It provides a platform that helps organizations identify, prioritize, and remediate vulnerabilities to minimize cyberattack risks. | [Phoenix integration page](https://kb.phoenix.security/?ht_kb=integration-with-azure-defender) |
| Nucleus | :::image type="icon" source="media/partner-integrations/nucleus-logo.png" border="false"::: | Nucleus is a cybersecurity company that unifies your security, asset, and threat data so teams can automatically prioritize and mitigate critical exposures. | [Nucleus integration page](https://nucleussec.com/Integration/) |

Security solutions providers are invited to utilize the following link to learn how to integrate their partner solutions with Defender for Cloud.

## Security solutions (legacy)

| Partner name | Description | Documentation |
|--|--|--|
| Barracuda Networks | Barracuda Networks is a cybersecurity company that provides security, networking, and storage solutions. It offers a range of products including email protection, application security, network security, and data protection to help organizations safeguard their digital environments. | [Integrate partner solutions](partner-integration.md) |
| Check Point | Check Point is a cybersecurity company that provides comprehensive security solutions for networks, endpoints, clouds, and mobile devices. It offers a range of products and services designed to protect organizations from cyber threats and ensure robust security management. | [Integrate partner solutions](partner-integration.md) |
| F5 Networks | F5 Networks is a technology company that specializes in application security, multicloud management, and application delivery networking. It provides solutions to ensure the security, availability, and performance of applications across various environments. |  [Integrate partner solutions](partner-integration.md) |
| Rapid7 | Rapid7 is a cybersecurity company that provides security data and analytics solutions. It helps organizations manage vulnerabilities, detect threats, and respond to incidents in real-time, enhancing their overall security posture. | [Integrate partner solutions](partner-integration.md) |
| Qualys | Qualys is a cybersecurity company that provides cloud-based security and compliance solutions. It helps organizations identify and manage security risks, ensuring continuous protection and compliance across their IT environments. | [Integrate partner solutions](partner-integration.md) |

Learn how to [integrate these security solutions](partner-integration.md).

## Related content

- [Connect your partner integration](integrate-partner-integrations.md)
- [Integrate partner integrations](integrate-partner-integrations.md)
