---
title: Microsoft Defender Threat Intelligence (Defender TI) data sets
description: Learn about data sets in Microsoft Defender Threat Intelligence (Defender TI).
author: alexroland24
ms.author: aroland
manager: dolmont
ms.service: threat-intelligence
ms.topic: conceptual
ms.date: 11/18/2024
ms.custom: 
- template-concept
- cx-ti
- cx-mdti
---

# Data sets

>[!IMPORTANT] 
> On June 30, 2024, The Microsoft Defender Threat Intelligence (Defender TI) standalone portal (`https://ti.defender.microsoft.com`) was retired and is no longer accessible. Customers can continue using Defender TI in the [Microsoft Defender portal](https://aka.ms/mdti-intel-explorer) or with [Microsoft Security Copilot](security-copilot-and-defender-threat-intelligence.md). [Learn more](https://aka.ms/mdti-standaloneportal)

Microsoft centralizes numerous data sets into Microsoft Defender Threat Intelligence (Defender TI), making it easier for Microsoft's customers and community to conduct infrastructure analysis. Microsoft's primary focus is to provide as much data as possible about internet infrastructure to support various security use cases.

Microsoft collects, analyzes, and indexes internet data to help you:

- Detect and respond to threats
- Prioritize incidents
- Proactively identify infrastructure associated with actor groups targeting your organization

Microsoft collects internet data through its passive Domain Name System (PDNS) sensor network, global proxy network of virtual users, port scans, and other sources for malware and added DNS data.

This internet data is categorized into two distinct groups: traditional and advanced. Traditional data sets include:

- [Resolutions](#resolutions)
- [WHOIS information](#whois)
- [TLS/SSL certificates](#certificates)
- [Subdomains](#subdomains)
- [DNS](#dns)
- [Reverse DNS](#reverse-dns)
- [Services](#services)

Advanced data sets include:

- [Trackers](#trackers)
- [Components](#components)
- [Host pairs](#host-pairs)
- [Cookies](#cookies)

Advanced data sets are collected from observing the Document Object Model (DOM) of crawled web pages. Additionally, components and trackers are also observed from detection rules that are triggered based on the banner responses from port scans or TLS certificate details.

:::image type="content" source="/defender/threat-intelligence/media/data-sets-01.png" alt-text="Sorting data sets screenshot." lightbox="/defender/threat-intelligence/media/data-sets-01.png":::

## Resolutions

PDNS is a record system that stores DNS resolution data for a given location, record, and timeframe. This historical resolution data set lets you view which domains resolved to an IP address and the other way around. This data set allows for time-based correlation based on domain or IP overlap.

PDNS might enable the identification of previously unknown or newly stood-up threat actor infrastructure. Proactive addition of indicators to blocklists can cut off communication paths before campaigns take place. A record resolution data is available within the **Resolutions** tab, which is located in the **Intel explorer** page in the Microsoft Defender portal. More types of DNS records are available in the **DNS** tab.

Our PDNS resolution data includes the following information:

- **Resolve**: The name of the resolving entity (either an IP address or domain)
- **Location**: The location the IP address is hosted in
- **Network**: The netblock or subnet associated with the IP address
- **ASN**: The autonomous system number (ASN) and organization name
- **First seen**: A timestamp of the date that Microsoft first observed this resolution
- **Last seen**: A timestamp of the date that Microsoft last observed this resolution
- **Source**: The source that enabled the detection of the relationship.
- **Tags**: Any tags applied to this artifact in Defender TI ([Learn more](using-tags.md))

:::image type="content" source="/defender/threat-intelligence/media/data-sets-info.png" alt-text="Data tab Resolutions." lightbox="/defender/threat-intelligence/media/data-sets-info.png":::

**Questions this data set might help answer**:

*Domains*:

- When did Defender TI first observe the domain resolving to an IP address?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions-first-seen.png" alt-text="Data sets domain first seen." lightbox="/defender/threat-intelligence/media/data-sets-resolutions-first-seen.png":::

- When was the last time Defender TI saw the domain actively resolving to an IP address?

- What IP address or addresses does the domain currently resolve to?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions-resolve.png" alt-text="Data sets domain active resolutions." lightbox="/defender/threat-intelligence/media/data-sets-resolutions-resolve.png":::

*IP addresses*:

- Is the IP address routable?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions-routable.png" alt-text="Data sets routable IPs." lightbox="/defender/threat-intelligence/media/data-sets-resolutions-routable.png":::

- What subnet is the IP address part of?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions-netblock.png" alt-text="Data sets IP address subnet." lightbox="/defender/threat-intelligence/media/data-sets-resolutions-netblock.png":::

- Is there an owner associated with the subnet?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions-owner.png" alt-text="Data sets IP address owner." lightbox="/defender/threat-intelligence/media/data-sets-resolutions-owner.png":::

- What AS is the IP address part of?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions-asn.png" alt-text="Data sets IP address ASN." lightbox="/defender/threat-intelligence/media/data-sets-resolutions-asn.png":::

- Is there geolocation?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions-geoloc.png" alt-text="Data sets IP address geolocation." lightbox="/defender/threat-intelligence/media/data-sets-resolutions-geoloc.png":::

## WHOIS

Thousands of times a day, domains are bought and/or transferred between individuals and organizations. The process is easy, only takes a few minutes, and can be as low as $7, depending on the registrar provider. Beyond payment details, one must supply additional information about themselves. Some of this information is stored as part of a WHOIS record the domain has been set up. This action would be considered a public domain registration. However, there are private domain registration services, where one can hide their personal information from their domain's WHOIS record. In these situations, the domain owner's information is safe and replaced by their registrar's information. More actor groups are performing private domain registrations to make it more difficult for analysts to find other domains that they own. Defender TI provides various data sets to find actors' shared infrastructure when WHOIS records don't provide leads.

WHOIS is a protocol that lets anyone query information about a domain, IP address, or subnet. One of the most common functions for WHOIS in threat infrastructure research is to identify or connect disparate entities based on unique data shared within WHOIS records. If you ever purchased a domain yourself, you might have noticed that the content requested from the registrars is never verified. In fact, you could have put anything in the record (and many people do), which would then be displayed to the world.

Each WHOIS record has several different sections, all of which could include different information. Commonly found sections include *registrar*, *registrant*, *administrator*, and *technical*, with each potentially corresponding to a different contact for the record. This data is duplicated across sections in most cases but there might be some slight discrepancies, especially if an actor made a mistake. When viewing WHOIS information within Defender TI, you see a condensed record that deduplicates any data and notates which part of the record it came from. We found this process greatly speeds up the analyst workflow and avoids any overlooking of data. The Defender TI's WHOIS information is powered by the WhoisIQ™ database.

Our WHOIS data includes the following information:

- **Record updated:** A timestamp that indicates the day a WHOIS record was last updated
- **Last scanned:** The date that the Defender TI system last scanned the record
- **Expiration:** The expiration date of the registration, if available
- **Created:** The age of the current WHOIS record
- **WHOIS server:** The server set up by an ICANN accredited registrar to acquire up-to-date information about domains that are registered within it
- **Registrar:** The registrar service used to register the artifact
- **Domain status:** The current status of the domain; an "active" domain is live on the internet
- **Email:** Any email addresses found in the WHOIS record, and the type of contact each one is associated with (for example, *admin* or *tech*)
- **Name:** The name of any contacts within the record, and the type of contact each is associated with
- **Organization:** The name of any organizations within the record, and the type of contact each is associated with
- **Street:** Any street addresses associated with the record, and the type of corresponding contact
- **City:** Any city listed in an address associated with the record, and the type of corresponding contact
- **State:** Any states listed in an address associated with the record, and the type of corresponding contact
- **Postal code:** Any postal codes listed in an address associated with the record, and the type of corresponding contact
- **Country:** Any countries or regions listed in an address associated with the record, and the type of corresponding contact
- **Phone:** Any phone numbers listed in the record, and the type of corresponding contact
- **Name servers:** Any name servers associated to the registered entity

### Current WHOIS lookups

Defender TI's current WHOIS repository highlights all domains in Microsoft's WHOIS collection that are currently registered and associated with the WHOIS attribute of interest. This data highlights the domain's registration and expiration date, along with the email address used to register the domain. This data is displayed in the WHOIS Search tab of the platform.

:::image type="content" source="/defender/threat-intelligence/media/data-sets-whois.png" alt-text="Data tab WHOIS." lightbox="/defender/threat-intelligence/media/data-sets-whois.png":::

### Historical WHOIS lookups

Defender TI's **WHOIS history** repository provides users with access to all known historical domain associations to WHOIS attributes based on the system's observations. This data set highlights all domains associated with an attribute that a user pivots from displaying the first time and the last time we observed the association between the domain and attribute queried. This data is displayed in a separate tab next to the **WHOIS current** tab.

:::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-history.png" alt-text="Search WHOIS history." lightbox="/defender/threat-intelligence/media/data-sets-whois-history.png":::

**Questions this data set might help answer**:

- How old is the domain?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-domain-age.png" alt-text="Data sets WHOIS domain age." lightbox="/defender/threat-intelligence/media/data-sets-whois-domain-age.png":::

- Does the information appear to be privacy protected?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-privacy.png" alt-text="Data sets WHOIS privacy protected." lightbox="/defender/threat-intelligence/media/data-sets-whois-privacy.png":::

- Does any of the data appear to be unique?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-unique.png" alt-text="Data sets WHOIS unique." lightbox="/defender/threat-intelligence/media/data-sets-whois-unique.png":::

- What name servers are used?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-ns.png" alt-text="Data sets WHOIS name servers." lightbox="/defender/threat-intelligence/media/data-sets-whois-ns.png":::

- Is this domain a sinkhole domain?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-sinkhole.png" alt-text="Data sets WHOIS sinkhole." lightbox="/defender/threat-intelligence/media/data-sets-whois-sinkhole.png":::

- Is this domain a parked domain?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-parked.png" alt-text="Data sets WHOIS parked domain." lightbox="/defender/threat-intelligence/media/data-sets-whois-parked.png":::

- Is this domain a honeypot domain?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-honeypot.png" alt-text="Data sets WHOIS honeypot domain." lightbox="/defender/threat-intelligence/media/data-sets-whois-honeypot.png":::

- Is there any history?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-record-history.png" alt-text="Data sets WHOIS history." lightbox="/defender/threat-intelligence/media/data-sets-whois-record-history.png":::

- Are there any fake privacy protection emails?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-privacy-emails.png" alt-text="Data sets WHOIS fake privacy emails." lightbox="/defender/threat-intelligence/media/data-sets-whois-privacy-emails.png":::

- Are there any fake names in the WHOIS record?

- Are other related IOCs identified from searching against potentially shared WHOIS values across domains?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-phone-01.png" alt-text="Data sets WHOIS shared value search." lightbox="/defender/threat-intelligence/media/data-sets-whois-phone-01.png":::

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-whois-phone-02.png" alt-text="Data sets WHOIS shared value search phone." lightbox="/defender/threat-intelligence/media/data-sets-whois-phone-02.png":::

## Certificates

Beyond securing your data, TLS certificates are a fantastic way for users to connect disparate network infrastructure. Modern scanning techniques let us perform data requests against every node on the internet in a matter of hours. In other words, we can associate a certificate to an IP address hosting it easily and regularly.

Much like a WHOIS record, TLS certificates require information to be supplied by the user to generate the final product. Aside from the domain, the TLS certificate includes who the certificate is being created for (unless self-signed). The user can make up the additional information. Where Microsoft's users see the most value from TLS certificates isn't necessarily the unique data someone might use when generating the certificate, but where it's hosted.

To access a TLS certificate, it needs to be associated with a web server and exposed through a particular port (most often 443). Using mass internet scans on a weekly basis, it's possible to scan all IP addresses and obtain any certificate being hosted to build a historic repository of certificate data. Having a database of IP addresses to TLS certificate mappings provides you with a way to identify overlaps in infrastructure.

To further illustrate this concept, imagine an actor setting up a server with a self-signed TLS certificate. After several days, defenders become wise to their infrastructure and block the web server hosting malicious content. Instead of destroying all their hard work, the actor merely copies all the contents (including the TLS certificate) and places them on a new server. As a user, you can now make a connection using the unique SHA-1 value of the certificate and say that both web servers (one blocked, one unknown) are connected in some way.

What makes TLS certificates more valuable is that they're capable of making connections that passive DNS or WHOIS data might miss. This means more ways of correlating potential malicious infrastructure and identifying potential operational security failures of actors. Defender TI has collected over 30 million certificates since 2013 and provides you with the tools to make correlations on certificate content and history.

TLS certificates are files that digitally bind a cryptographic key to a set of user-provided details. Defender TI uses internet scanning techniques to collect TLS certificate associations from IP addresses on various ports. These certificates are stored inside of a local database and allow us to create a timeline for where a given TLS certificate appeared on the internet.

Our certificate data includes the following information:

- **Sha1:** The SHA-1 algorithm hash for an TLS certificate asset
- **First seen:** A timestamp that displays the date that we first observed this certificate on an artifact
- **Last seen:** A timestamp that displays the date that we last observed this certificate on an artifact
- **Infrastructure:** Any related infrastructure associated with the certificate

![Data Tab Certificates List](media/dataTabCertificatesList.png)

When you expand on an SHA-1 hash, you see the following details:

- **Serial number:** The serial number associated with an TLS certificate
- **Issued:** The date when a certificate was issued
- **Expires:** The date when a certificate expires
- **Subject common name:** The subject common name for any associated TLS certificates
- **Issuer common name:** The issuer common name for any associated TLS certificates
- **Subject alternative name(s):** Any alternative common names for the certificate
- **Issuer alternative name(s):** Any other names of the issuer
- **Subject organization name:** The organization linked to the TLS certificate registration
- **Issuer organization name:** The name of the organization that orchestrated the issue of a certificate
- **SSL version:** The version of SSL/TLS that the certificate was registered with
- **Subject organization unit:** Optional metadata that indicates the department within an organization that is responsible for the certificate
- **Issuer organization unit:** Additional information about the organization issuing the certificate
- **Subject street address:** The street address where the organization is located
- **Issuer street address:** The street address where the issuer organization is located
- **Subject locality:** The city where the organization is located
- **Issuer locality:** The city where the issuer organization is located
- **Subject state/province:** The state or province where the organization is located
- **Issuer state/province:** The state or province where the issuer organization is located
- **Subject country:** The country or region where the organization is located
- **Issuer country:** The country or region where the issuer organization is located
- **Related infrastructure:** Any related infrastructure associated with the certificate

![Data Tab Certificate Details](media/dataTabCertificateDetails.png)

**Questions this data set might help answer**:

- What other infrastructure has this certificate been observed associated with?

  ![Data Sets Certificate Related Infrastructure](media/dataSetsCertificateRelatedInfrastructure.png)

- Are there any unique data points in the certificate that would serve as good pivot points?

  ![Data Sets Certificate Pivot Points](media/dataSetsCertificatePivotPoints.png)

- Is the certificate self-signed?

  ![Data Sets Certificate Self Signed](media/dataSetsCertificateSelfSigned.png)

- Is the certificate from a free provider?

  ![Data Sets CertificateFree Provider](media/dataSetsCertificateFreeProvider.png)

- Over what timeframe has the certificate been observed in use?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-cert-first-last-seen.png" alt-text="Data Sets Certificates Observation Dates." lightbox="/defender/threat-intelligence/media/data-sets-cert-first-last-seen.png":::

## Subdomains

A subdomain is an internet domain that's part of a primary domain. Subdomains are also referred to as "hosts." As an example, `learn.microsoft.com` is a subdomain of `microsoft.com`. For every subdomain, there could be a new set of IP addresses the domain resolves to, which could be great data sources for finding related infrastructure.

Our subdomain data includes the following information:

- **Hostname**: The subdomain associated with the domain that was searched
- **Tags**: Any tags applied to this artifact in Defender TI

![Data Tab Sub domains](media/dataTabSubdomains.png)

**Questions this data set might help answer**:

- Are there more subdomains associated with the higher-level domain?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-subdomains-01.png" alt-text="Data Sets Subdomains." lightbox="/defender/threat-intelligence/media/data-sets-subdomains-01.png":::

- Are any of the subdomains associated with malicious activity?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-subdomains-02.png" alt-text="Data Sets Subdomains Malicious." lightbox="/defender/threat-intelligence/media/data-sets-subdomains-02.png":::

- If I own this domain, do any of the subdomains look unfamiliar?

- Is there any pattern to the listed subdomains that are associated with other malicious domains?

- Does pivoting off each subdomain reveal new IP address space not previously associated with the target?

- What other unrelated infrastructure can I find that doesn't match the root domain?

## Trackers

Trackers are unique codes or values found within web pages and often used to track user interaction. These codes could be used to correlate a disparate group of websites to a central entity. Often, threat actors copy the source code of a victim's website they're looking to impersonate for a phishing campaign. They seldomly take the time to remove these IDs, which could allow users to identify these fraudulent sites using Defender TI's **Trackers** data set. Actors might also deploy tracker IDs to see how successful their attack campaigns are. This activity is similar to how marketers use SEO IDs, such as a Google Analytics tracker ID, to track the success of their marketing campaign.

Our tracker data set includes IDs from providers like Google, Yandex, Mixpanel, New Relic, and Clicky, and continues to grow. It includes the following information:

- **Hostname**: The hostname that hosts the infrastructure where the tracker was detected
- **First seen**: A timestamp of the date that Microsoft first observed this tracker on the artifact
- **Last Seen**: A timestamp of the date that Microsoft last observed this tracker on the artifact
- **Type**: The type of tracker that was detected (for example, *GoogleAnalyticsID* or *JarmHash*)
- **Value**: The identification value for the tracker
- **Tags**: Any tags applied to this artifact in Defender TI

![Data Tab Trackers](media/dataTabTrackers.png)

**Questions this data set might help answer**:

- Are there other resources using the same analytics IDs?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-trackers-analytics.png" alt-text="Data Sets Trackers Pivot Analytics Account." lightbox="/defender/threat-intelligence/media/data-sets-trackers-analytics.png":::

- Are these resources associated with the organization, or are they attempting to conduct an infringement attack?

- Is there any overlap between trackers–are they shared with other websites?

- What are the types of trackers found within the web page?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-trackers-types.png" alt-text="Data Sets Trackers Types." lightbox="/defender/threat-intelligence/media/data-sets-trackers-types.png":::

- What is the length of time for trackers?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-trackers-first-last-seen.png" alt-text="Data Sets Trackers Length Of Time." lightbox="/defender/threat-intelligence/media/data-sets-trackers-first-last-seen.png":::

- What is the frequency of change for tracker values–do they come, go, or remain?

- Are there any trackers linking to website cloning software (for example, *MarkOfTheWeb* or *HTTrack*)?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-trackers-httrack.png" alt-text="Data Sets Trackers HtTrack." lightbox="/defender/threat-intelligence/media/data-sets-trackers-httrack.png":::

- Are there any trackers linking to malicious command-and-control (C2) server malware (for example, *JARM*)?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-trackers-jarm.png" alt-text="Data Sets Trackers JARM." lightbox="/defender/threat-intelligence/media/data-sets-trackers-jarm.png":::

## Components

Web components are details describing a web page or server infrastructure gleaned from Microsoft performing a web crawl or scan. These components let you understand the makeup of a webpage or the technology and services driving a specific piece of infrastructure.
Pivoting on unique components can find actors' infrastructure or other compromised sites. You can also understand if a website might be vulnerable to a specific attack or compromise based on the technologies that it's running.

Our component data includes the following information:

- **Hostname:** The hostname that hosts the infrastructure where the component was detected
- **First seen:** A timestamp of the date that Microsoft first observed this component on the artifact
- **Last seen:** A timestamp of the date that Microsoft last observed this component on the artifact
- **Category:** The type of component that was detected (for example, operating system, framework, remote access, or server)
- **Name + Version:** The component name and version running on the artifact (for example, *Microsoft IIS (v8.5)*)
- **Tags:** any tags applied to this artifact in Defender TI

![Data Tab Components](media/dataTabComponents.png)

**Questions this data set might help answer**:

- What vulnerable infrastructure am I using?

    ![Data Sets Components Vulnerable Components](media/dataSetsComponentsVulnerableComponents.png)

    ![Data Sets Components Prototype Js Vulnerable Version](media/dataSetsComponentsPrototypeJsVulnerableVersion.png)

    Magento v1.9 is so dated that Microsoft couldn't locate reliable documentation for that particular version.

- What unique web components is the threat actor using that can track them to other domains?

- Are any components marked as malicious?

- How many web components were identified?

  ![Data Sets Components Number Of Components](media/dataSetsComponentsNumberOfComponents.png)

- Are there any unique or strange technologies not often seen?

  ![Data Sets Components Unique Components](media/dataSetsComponentsUniqueComponents.png)

- Are there any fake versions of specific technologies?

- What is the frequency of changes in web components--often or rarely done?

- Are there any suspicious libraries known to be abused?

- Are there any technologies with vulnerabilities associated with them?

## Host pairs

Host pairs are two pieces of infrastructure (a parent and a child) that share a connection observed from a virtual user's web crawl. The connection could range from a top-level redirect (HTTP 302) to something more complex like an iFrame or script source reference.

Our host pair data includes the following information:

- **Parent hostname**: The host that is referencing an asset or "reaching out" to the child host
- **Child hostname**: The host that is being called on by the parent host
- **First seen**: A timestamp of the date that Microsoft first observed a relationship with the host
- **Last seen**: A timestamp of the date that Microsoft last observed a relationship with the host
- **Cause**: The type of connection between the parent and child hostname; potential causes include:
  - script.src
  - link.href
  - redirect
  - img.src
  - unknown
  - xmlhttprequest
  - a.href
  - finalRedirect
  - css.import
  - parentPage
- **Tags**: Any tags applied to this artifact in Defender TI

![Data Tab Host Pairs](media/dataTabHostPairs.png)

**Questions this data set might help answer**:

- Have any of the connected artifacts been blocklisted?
- Have any of the connected artifacts been tagged (for example, phishing, APT, malicious, suspicious, specific threat actor)?
- Is this host redirecting users to malicious content?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-host-pairs-redirect.png" alt-text="Data Sets Host Pairs Malicious Redirect." lightbox="/defender/threat-intelligence/media/data-sets-host-pairs-redirect.png":::

- Are resources pulling in CSS or images to set up infringement attacks?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-host-pairs-img.png" alt-text="Data Sets Host Pairs Infringement Attack." lightbox="/defender/threat-intelligence/media/data-sets-host-pairs-img.png":::

- Are resources pulling in a script or referencing a *link.href* to set up a Magecart or skimming attack?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-host-pairs-href.png" alt-text="Data Sets Host Pairs Skimmer Reference." lightbox="/defender/threat-intelligence/media/data-sets-host-pairs-href.png":::

- Where are users being redirected from/to?

- What type of redirection is taking place?

## Cookies

Cookies are small pieces of data sent from a server to a client as the user browses the internet. These values sometimes contain a state for the application or little bits of tracking data. Defender TI highlights and indexes cookie names observed when crawling a website and lets you dig into everywhere we observed specific cookie names across its crawling and data collection. Malicious actors also use cookies to keep track of infected victims or store data they might use later.

Our cookie data includes the following information:

- **Hostname:** The host infrastructure that is associated with the cookie
- **First seen:** A timestamp of the date that Microsoft first observed this cookie on the artifact
- **Last seen:** A timestamp of the date that Microsoft last observed this cookie on the artifact
- **Name:** The cookie name (for example, *JSESSIONID* or *SEARCH_NAMESITE*).
- **Domain:** The domain associated with the cookie
- **Tags:** Any tags applied to this artifact in Defender TI

![Data Tab Cookies](media/dataTabCookies.png)

**Questions this data set might help answer**:

- What other websites are issuing the same cookies?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-cookies-issue.png" alt-text="Data Sets Cookies Domains Issuing Same Cookie." lightbox="/defender/threat-intelligence/media/data-sets-cookies-issue.png":::

- What other websites are tracking the same cookies?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-cookies-same.png" alt-text="Data Sets Cookies Domains Tracking Same Cookie." lightbox="/defender/threat-intelligence/media/data-sets-cookies-same.png":::

- Does the cookie domain match my query?

- How many cookies are associated with the artifact?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-cookies-number.png" alt-text="Data Sets Cookies Number Associated with Artifact." lightbox="/defender/threat-intelligence/media/data-sets-cookies-number.png":::

- Are there unique cookie names or domains?

- What are the time periods associated with cookies?

- What is the frequency of newly observed cookies or changes associated with cookies?

## Services

Service names and port numbers are used to distinguish the different services that run over transport protocols such as TCP, UDP, DCCP, and SCTP. Port numbers can suggest the type of application running on a particular port. However, applications or services can be changed to use a different port to obfuscate or hide the application or service on an IP address. Knowing the port and header/banner information can identify the true application/service and the combination of ports being used. Defender TI surfaces 14 days of history within the **Services** tab, displaying the last banner response associated with a port observed.

Our services data includes the following information:

- Open ports observed
- Port numbers
- Components
- Number of times the service was observed
- When the port was last scanned
- Protocol connection
- Status of the port
  - Open
  - Filtered
  - Closed
- Banner response

![Data Tab Services](media/dataTabServices.png)

**Questions this data set might help answer**:

- What applications are running on a particular port for a given IP address?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-services-ssh.png" alt-text="Data Sets Services Applications Running." lightbox="/defender/threat-intelligence/media/data-sets-services-ssh.png":::

- What version of applications are in use?

- Are there recent changes in the open, filtered, or closed status for a given port?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-services-open-close.png" alt-text="Data Sets Services Port Statuses." lightbox="/defender/threat-intelligence/media/data-sets-services-open-close.png":::

- Was a certificate associated with the connection?

  :::image type="content" source="/defender/threat-intelligence/media/data-sets-services-cert.png" alt-text="Data Sets Services Certificate Associations." lightbox="/defender/threat-intelligence/media/data-sets-services-cert.png":::

- Are vulnerable or deprecated technologies in use on a given asset?

  ![Data Sets Services Applications Running](media/dataSetsServicesApplicationsRunning.png)

  ![Data Sets Services Vulnerable Service](media/dataSetsServicesVulnerableService.png)

- Is information being exposed by a running service that could be used for nefarious purposes?

- Are security best practices being followed?

## DNS

Microsoft has been collecting DNS records over the years, providing you with insight into mail exchange (MX), nameserver (NS), text (TXT), start of authority (SOA), canonical name (CNAME), and pointer (PTR) records. Reviewing DNS records could help identify shared infrastructure used by actors across the domains they own. For example, threat actors tend to use the same name servers to segment their infrastructure or the same mail exchange servers to administer their command and control.

Our DNS data includes the following information:

- **Value**: The DNS record associated with the host
- **First seen**: A timestamp of the date that Microsoft first observed this record on the artifact
- **Last seen**: A timestamp of the date that Microsoft last observed this record on the artifact
- **Type**: The type of infrastructure associated with the record; possible options include:
  - MX
  - TXT
  - NS
  - CNAMES
  - SOA
- **Tags**: Any tags applied to this artifact in Defender TI

![Data Tab DNS](media/dataTabDNS.png)

**Questions this data set might help answer**:

- What other pieces of infrastructure are directly related to the indicator I'm searching?
- How has the infrastructure changed over time?
- Is the domain owner employing the services of a content delivery network or brand protection service?
- What other technologies might the associated organization be employing within their network?

## Reverse DNS

While a forward DNS lookup queries the IP address of a certain hostname, a reverse DNS lookup queries a specific hostname of an IP address. This data set shows similar results as the DNS one. Reviewing DNS records can help identify shared infrastructure used by actors across the domains they own. For example, actor groups tend to use the same name servers to segment their infrastructure or the same mail exchange servers to administer their command and control.

Our reverse DNS data includes the following information:

- **Value**: The value of the Reverse DNS record
- **First seen**: A timestamp of the date that Microsoft first observed this record on the artifact
- **Last seen**: A timestamp of the date that Microsoft first observed this record on the artifact
- **Type**: The type of infrastructure associated with the record; possible options include:
  - MX
  - TXT
  - NS
  - CNAMES
  - SOA
- **Tags**: Any tags applied to this artifact in Defender TI

![Data Tab Reverse DNS](media/dataTabReverseDNS.png)

**Questions this data set might help answer**:

- Which DNS records observed this host?
- How has the infrastructure that observed this host changed over time?

### See also

- [Searching and pivoting](searching-and-pivoting.md)
- [Sorting, filtering, and downloading data](sorting-filtering-and-downloading-data.md)
- [Infrastructure chaining](infrastructure-chaining.md)
- [Tutorial: Gathering threat intelligence and infrastructure chaining](gathering-threat-intelligence-and-infrastructure-chaining.md)
