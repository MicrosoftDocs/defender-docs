--- 
title: 'Searching and pivoting with Microsoft Defender Threat Intelligence (Defender TI)'
description: 'Learn how to search and pivot across internet data sets, threat articles, vulnerability articles, and projects using Microsoft Defender Threat Intelligence (Defender TI).'
author: alexroland24
ms.author: aroland
manager: dolmont
ms.service: threat-intelligence 
ms.topic: how-to 
ms.date: 11/18/2024
ms.custom: 
- template-overview
- cx-ti
- cx-mdti
---

# Searching and pivoting

>[!IMPORTANT] 
> On June 30, 2024, The Microsoft Defender Threat Intelligence (Defender TI) standalone portal (`https://ti.defender.microsoft.com`) was retired and is no longer accessible. Customers can continue using Defender TI in the [Microsoft Defender portal](https://aka.ms/mdti-intel-explorer) or with [Microsoft Security Copilot](security-copilot-and-defender-threat-intelligence.md). [Learn more](https://aka.ms/mdti-standaloneportal)

Microsoft Defender Threat Intelligence (Defender TI) offers a robust and flexible search engine to streamline the investigation process. Defender TI is designed to let you pivot across various indicators from different data sources, making it easier than ever to discover relationships between disparate infrastructure. 

This article helps you understand how to conduct a search and pivot across different data sets to discover relationships between different artifacts.

:::image type="content" source="/defender/threat-intelligence/media/intel-explorer-search.png" alt-text="Intel explorer search screenshot." lightbox="/defender/threat-intelligence/media/intel-explorer-search.png":::

## Prerequisites

- A Microsoft Entra ID or personal Microsoft account. [Sign in or create an account](https://signup.microsoft.com/)
- A Defender TI premium license.

    > [!NOTE]
    > Users without a Defender TI premium license can still access our free Defender TI offering.

## Open Defender TI in the Microsoft Defender portal

1. Access the [Defender portal](https://security.microsoft.com/) and complete the Microsoft authentication process. [Learn more about the Defender portal](/defender-xdr/microsoft-365-defender-portal)
2. Navigate to **Threat intelligence** > **Intel explorer**. 

## Performing threat intelligence searches and pivots

Defender TI's **Intel explorer** search is both simple and powerful, designed to surface immediate key insights while also letting you directly interact with the data sets that comprise these insights. The search bar supports different inputs; you can search for specific artifacts and article or project names.

### Search artifact types

1. **IP address:** Search *195.161.141[.]65* in the Intel explorer search bar. This action results in an IP address search.
2. **Domain:** Search `fabrikam.com` in the Intel explorer search bar. This action results in a domain search.
3. **Host:** Search `canary.fabrikam.com` in the Intel explorer search bar. This action results in a host search.
4. **Keyword:** Search *apt29* in the Intel explorer search bar. This action results in a keyword search. Keyword searches cover any type of keyword, which might include a term or email address, among others, and they result in associations with articles, projects, and data sets.
5. **Common Vulnerabilities and Exposures (CVE) ID:** Search *CVE-2021-40444* in the Intel explorer search bar. This action results in a CVE ID keyword search.
6. **Article:** Search *Commodity Skimming & Magecart Trends in First Quarter of 2022* in the Intel explorer search bar. This action results in an article search.
7. **Tag:** Choose **Tag** from the Intel explorer search bar drop-down menu and then search *magecart*. This action results in a tag search.

    > [!NOTE]
    > This search doesn't return articles that share that tag value.

8. **Component:** Choose **Component** from the Intel explorer search bar drop-down menu and then search *cobalt strike* This action results in a component search.
9. **Tracker:** Choose **Trackers** from the Intel explorer search bar drop-down menu and then search *07d14d16d21d21d00042d41d00041d47e4e0ae17960b2a5b4fd6107fbb0926*. This action results in a tracker search. 

    > [!NOTE]
    > This example is a *JarmHash* tracker type.

10. **WHOIS email:** Choose **WHOIS** > **Email** from the Intel explorer search bar drop-down menu and then search *domains@microsoft.com*. This action results in a WHOIS email search.
11. **WHOIS name:** Choose **WHOIS** > **Name** from the Intel explorer search bar drop-down menu and then search *MSN Hostmaster*. This action results in a WHOIS name search.
12. **WHOIS organization:** Choose **WHOIS** > **Organization** from the Intel explorer search bar drop-down menu and then search *Microsoft Corporation*. This action results in a WHOIS organization search.
13. **WHOIS address:** Choose **WHOIS** > **Address** from the Intel explorer search bar drop-down menu and then search *One Microsoft Way*. This action results in a WHOIS address search.
14. **WHOIS city:** Choose **WHOIS** > **City** from the Intel explorer search bar drop-down menu and then search *Redmond*. This action results in a WHOIS city search.
15. **WHOIS state:** Choose **WHOIS** > **State** from the Intel explorer search bar drop-down menu and then search *WA*. This action results in a WHOIS state search.
16. **WHOIS postal code:** Choose **WHOIS** > **Postal code** from the Intel explorer search bar drop-down menu and then search *98052*. This action results in a WHOIS postal code search.
17. **WHOIS country:** Choose **WHOIS** > **Country** from the Intel explorer search bar drop-down menu and then search *US*. This action results in a WHOIS country/region search.
18. **WHOIS phone:** Choose **WHOIS** > **Phone** from the Intel explorer search bar drop-down menu and then search *+1.4258828080*. This action results in a WHOIS phone search.
19. **WHOIS nameserver:** Choose **WHOIS** > **Nameserver** from the Intel explorer search bar drop-down menu and then search  `ns1-03.azure-dns.com`. This action results in a WHOIS nameserver search.
20. **Certificate SHA-1:** Choose **Certificate** > **SHA-1** from the Intel explorer search bar drop-down menu and then search *35cd04a03ef86664623581cbd56e45ed07729678*. This action results in a certificate SHA-1 search.
21. **Certificate serial number:** Choose **Certificate** > **Serial number** from the Intel explorer search bar drop-down menu and then search *1137354899731266880939192213383415094395905558*. This action results in a certificate Serial Number search.
22. **Certificate issuer common name:** Choose **Certificate** > **Issuer common name** from the Intel explorer search bar drop-down menu and then search *Microsoft Azure TLS Issuing CA 05*. This action results in a certificate issuer common name search.
23. **Certificate issuer alternative name:** Choose **Certificate** > **Issuer alternative name** from the Intel explorer search bar drop-down menu and then search a certificate issuer alternative name. This action results in a certificate issuer alternative name search.
24. **Certificate subject common name:** Choose **Certificate** > **Subject common name** from the Intel explorer search bar drop-down menu and then search `*.oneroute.microsoft.com`. This action results in a certificate subject common name search.
25. **Certificate subject alternative name:** Choose **Certificate** > **Subject alternative name** from the Intel explorer search bar drop-down menu and then search `oneroute.microsoft.com`. This action results in a certificate subject alternative name search.
26. **Cookie name:** Choose **Cookie** > **Name** from the Intel explorer search bar drop-down menu and then search *ARRAffinity*. This action results in a cookie name search.
27. **Cookie domain:** Choose **Cookie** > **Domain** from the Intel explorer search bar drop-down menu and then search `portal.fabrikam.com`. This action results in a cookie domain search.

### Pivots

For any of the searches performed in the previous steps, there are artifacts with hyperlinks that you can pivot off to discover further enriched results associated with those indicators. Feel free to experiment with pivots on your own.

## Search results

The results of a threat intelligence search can be grouped into the following sections:
- [Key insights](#key-insights)
- [Summary](#summary)
- [Data sets](#data-sets)

### Key insights

Defender TI provides some basic information about the artifact at the top of the search results page. This information could include any of the following, depending on the artifact type.

:::image type="content" source="/defender/threat-intelligence/media/intel-explorer-key-insights.png" alt-text="Search results key insights." lightbox="/defender/threat-intelligence/media/intel-explorer-key-insights.png":::

- **Country/Region:** The flag next to the IP address indicates the country or region of origin for the artifact, which can help determine its reputability or security posture. In the preceding sample screenshot, the IP address is hosted on infrastructure within the United States.
- **Reputation:** In the example, the IP address is tagged *Malicious*, which indicates that Defender TI detected connections between this artifact and known adversary infrastructure. Artifacts can also be tagged as *Suspicious*, *Neutral*, or *Unknown*. 
- **First seen:** This timestamp indicates when Defender TI first observed the artifact. Understanding the lifespan of an artifact can help determine its reputability.
- **Last seen:** This timestamp indicates when Defender TI last observed the artifact. This information helps determine whether the artifact is still actively used.
- **IP block:** The IP block that includes the queried IP address artifact.
- **Registrar:** The registrar associated to the WHOIS record for the queried domain artifact.
- **Registrant:** The name of the registrant within the WHOIS data for an artifact.
- **ASN:** The autonomous system number (ASN) associated with the artifact.
- **OS:** The operating system associated with the artifact.
- **Host:** The hosting provider for the artifact. Some hosting providers are more reputable than others, so this value can help indicate the validity of an artifact.

This section also shows any tags applied to the artifact or any projects that include it. You can also add a tag to the artifact or add it to a project. 
[Learn more about using tags](using-tags.md)

### Summary

The **Summary** tab surfaces key findings about an artifact that Defender TI derives from our expansive datasets to help kickstart an investigation.

- **Reputation:** Defender TI provides proprietary reputation scores for any host, domain, or IP address. Whether validating the reputation of a known or unknown entity, this score helps you quickly understand any detected ties to malicious or suspicious infrastructure. 

  Defender TI displays reputation scores as a numerical value between zero and 100. An entity with a score of `0` doesn't have associations with suspicious activity or known indicators of compromise (IOCs), while a score of `100` indicates that the entity is malicious. Defender TI also provides a list of rules with corresponding descriptions and severity ratings. In the following example, four "high severity" rules are applicable to the domain.

  :::image type="content" source="/defender/threat-intelligence/media/reputation-score-summary-card.png" alt-text="Reputation summary card." lightbox="/defender/threat-intelligence/media/reputation-score-summary-card.png":::

  [Learn more about reputation scoring](reputation-scoring.md)

- **Analyst insights:** This section provides quick insights about the artifact that might help determine the next step in an investigation. This section lists any insights that apply to the artifact. It also lists insights that don't apply for more visibility. 

  In the following screenshot, we can quickly determine that the IP address is routable, hosts a web server, and had an open port within the past five days. Furthermore, the Defender TI displays rules that weren't triggered, which can be equally helpful when kick starting an investigation.

  :::image type="content" source="/defender/threat-intelligence/media/analyst-insights-01.png" alt-text="Analyst insights summary card." lightbox="/defender/threat-intelligence/media/analyst-insights-01.png":::

  [Learn more about analyst insights](analyst-insights.md)

- **Articles:** This section displays any articles that might provide insight on how to best investigate and ultimately disarm the impacted artifact. Researchers who study the behavior of known threat actors and their infrastructure write these articles, surfacing key findings that could help you and others mitigate risks to their organization. 

  In the following example, the searched IP address is identified as an IOC that relates to the findings within the article.

  ![Summary Tab Articles](media/summaryTabArticles.png)

  [Learn more about Defender TI articles](what-is-microsoft-defender-threat-intelligence-defender-ti.md#articles)

- **Services:** This section lists any detected services running on the IP address artifact, which is helpful when trying to understand the intended use of the entity. When you're investigating malicious infrastructure, this information could help determine the capabilities of an artifact, enabling you to proactively defend your organization based on this information.

  ![Summary Tab Services](media/summaryTabServices.png)

- **Resolutions:** Resolutions are individual Domain Name System (DNS) records captured using passive sensors distributed throughout the world. These values reveal a history of how a domain or IP address changes infrastructure over time. They can be used to discover other infrastructure and measure risk based on levels of connection. For each resolution, we provide **First seen** and **Last seen** timestamps to showcase the lifecycle of the resolutions.

  ![Summary Tab Re solutions](media/summaryTabResolutions.png)

- **Certificates:** Beyond securing your data, TLS certificates are a fantastic way for users to connect disparate network infrastructure. TLS certificates can make connections that passive DNS or WHOIS data might miss. This means more ways of correlating potential malicious infrastructure and identifying potential operational security failures of actors. For each TLS certificate, we provide the certificate name, expiration date, subject common name, and subject organization name.

  ![Summary Tab Certificates](media/summaryTabCertificates.png)

- **Projects:** Defender TI lets you create projects for organizing indicators of interest or compromise from an investigation. Projects are also created to monitor connecting artifacts for improved visibility. Projects contain a listing of all associated artifacts and a detailed history that retains the names, descriptions, collaborators, and monitoring profiles.

  When you search an IP address, domain, or host, and if that indicator is listed within a project you have access to, you can select the **Projects** tab and navigate to the project details for more context about the indicator before reviewing the other data sets for more information.

  ![Summary Tab Projects](media/summaryTabProjects.png)
 
   [Learn more about using projects](using-projects.md)

### Data sets

Data sets help you deep-dive into the tangible connections observed by Defender TI. While the **Summary** tab surfaces key findings to provide immediate context about an artifact, the various data sets, which appear as separate tabs in the search results, enables you to study these connections much more granularly. 

You can select any of the returned values to pivot quickly across related metadata and unveil insights that you might miss with traditional investigative methods.

:::image type="content" source="/defender/threat-intelligence/media/data-sets-01.png" alt-text="Sorting data sets screenshot." lightbox="/defender/threat-intelligence/media/data-sets-01.png":::

The following data sets are available in Defender TI:

- Resolutions
- WHOIS information
- TLS/SSL certificates
- Trackers
- Subdomains
- Components
- Host pairs
- Cookies
- Services
- DNS
- Reverse DNS

[Learn more about data sets](data-sets.md)

## Next steps

For more information, see:

- [Sorting, filtering, and downloading data](sorting-filtering-and-downloading-data.md)
- [Data sets](data-sets.md)
- [Reputation scoring](reputation-scoring.md)
- [Analyst insights](analyst-insights.md)
- [What is Microsoft Defender Threat Intelligence (Defender TI)?](what-is-microsoft-defender-threat-intelligence-defender-ti.md)
- [Using projects](using-projects.md)
