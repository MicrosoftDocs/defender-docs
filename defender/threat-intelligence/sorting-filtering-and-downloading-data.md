--- 
title: 'Sorting, filtering, and downloading data using Microsoft Defender Threat Intelligence (Defender TI)'
description: 'Learn how to sort, filter, and download data using Microsoft Defender Threat Intelligence (Defender TI).'
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

# Sorting, filtering, and downloading data

>[!IMPORTANT] 
> On June 30, 2024, The Microsoft Defender Threat Intelligence (Defender TI) standalone portal (`https://ti.defender.microsoft.com`) was retired and is no longer accessible. Customers can continue using Defender TI in the [Microsoft Defender portal](https://aka.ms/mdti-intel-explorer) or with [Microsoft Security Copilot](security-copilot-and-defender-threat-intelligence.md). [Learn more](https://aka.ms/mdti-standaloneportal)

Microsoft Defender Threat Intelligence (Defender TI) lets you access our vast collection of crawling data in an indexed and pivot table format. These data sets can be large, returning expansive amounts of historic and recent data. By letting you appropriately sort and filter the data, we help you surface the connections of interest easily.

In this how-to article, you learn how to sort and filter data for the following data sets:
- Resolutions
- WHOIS information
- Certificates
- Subdomains
- Trackers
- Components
- Host pairs
- Cookies
- Services
- Domain Name System (DNS)
- Reverse DNS

:::image type="content" source="/defender/threat-intelligence/media/data-sets-01.png" alt-text="Sorting data sets screenshot." lightbox="/defender/threat-intelligence/media/data-sets-01.png":::

[Learn more about data sets](data-sets.md)

You also learn how to download indicators or artifacts from the following features:

- Projects
- Articles
- Data sets

## Prerequisites

- A Microsoft Entra ID or personal Microsoft account. [Sign in or create an account](https://signup.microsoft.com/)
- A Defender TI premium license.

    > [!NOTE]
    > Users without a Defender TI premium license can still access our free Defender TI offering.

## Open Defender TI in the Microsoft Defender portal

1. Access the [Defender portal](https://security.microsoft.com/) and complete the Microsoft authentication process. [Learn more about the Defender portal](/defender-xdr/microsoft-365-defender-portal)
2. Navigate to **Threat intelligence** > **Intel explorer**.

## Sorting data

The sorting function on each data tab lets you quickly sort our data sets by the column values. By default, most results are sorted by **Last seen** (descending) so that the most recently observed results appear at the top of the list. This default sorting order immediately provides insight on the current infrastructure of an artifact.

Currently, all data sets are sortable by the following **First seen** and **Last seen** values:

- Last seen (descending) - Default
- Last seen (ascending)
- First seen (ascending)
- First seen (descending)

Data can be sorted across each data set tab for each IP, domain, or host entity that is searched or pivoted on.

1. Search a domain, IP address, or host in **Intel explorer** search bar.
2. Go to the **Resolutions** tab, then apply the sorting preferences to the **First seen** and **Last seen** columns.

   :::image type="content" source="/defender/threat-intelligence/media/data-sets-first-seen-last-seen.png" alt-text="Sorting Resolutions." lightbox="/defender/threat-intelligence/media/data-sets-first-seen-last-seen.png":::


## Filtering data

Data filtering lets you access a select group of data based on a particular metadata value. For instance, you can choose to view IP resolutions discovered from a select source only, or components of a particular type (for example, servers or frameworks). Data filtering enables you to narrow the query results to items of particular interest. 

Because Defender TI provides specific metadata that coincides with particular data types, the filter options are different for each data set.

### Resolution filters

The following filters apply to resolution data:
- **System tag**: Defender TI creates these tags based on insights discovered by our research team. [Learn more](using-tags.md#system-tags)
- **Tag**: Custom tags that Defender TI users applied. [Learn more](using-tags.md#custom-tags)
- **ASN**: Results that relate to a designated autonomous system number (ASN).
- **Network**: Results that relate to designated network.
- **Source**: The data source that produced the result (for example, *riskiq*, *emerging_threats*).

To filter resolution data:
1. Search a domain, IP address, or host in the **Intel explorer** search bar. 
2. Go to the **Resolutions** tab
3. Apply filters to each of the types of filter options noted previously.

   :::image type="content" source="/defender/threat-intelligence/media/data-sets-resolutions.png" alt-text="Filters Resolutions." lightbox="/defender/threat-intelligence/media/data-sets-resolutions.png":::

### Tracker filters

The following filters apply to tracker data:
- **Type**: The identified tracker type for each artifact (for example, *JarmFuzzyHash* or *GoogleAnalyticsID*).
- **Address**: The IP address that directly observed the tracker or has a resolving host that observed the tracker. This filter appears when you search an IP address.
- **Hostname**: The host that observed this tracker value. This filter appears when you search a domain or host.

To filter tracker data:
1. Search a domain, IP address, or host in the **Intel explorer** search bar. 
2. Go to the **Trackers** tab
3. Apply filters to each of the types of filter options noted previously.
   
   :::image type="content" source="/defender/threat-intelligence/media/data-sets-trackers.png" alt-text="Filters Trackers." lightbox="/defender/threat-intelligence/media/data-sets-trackers.png":::

### Component filters

The following filters apply to component data:
- **Ipaddressraw:** The IP address that coincides with the returned hostname.
- **Type:** The designated component type (for example, remote access or operating system).
- **Name:** The name of the detected component (for example, *Cobalt Strike* or *PHP*).

To filter component data:
1. Search a domain, IP address, or host in the **Intel explorer** search bar. 
2. Go to the **Components** tab
3. Apply filters to each of the types of filter options noted previously.
   
      :::image type="content" source="/defender/threat-intelligence/media/data-sets-components.png" alt-text="Filters Components." lightbox="/defender/threat-intelligence/media/data-sets-components.png":::

### Host pair filters

The following filters apply to host pair data:
- **Direction:** The direction of the observed connection, indicating whether the parent redirects to the child or the other way around.
- **Parent hostname:** The hostname of the parent artifact.
- **Cause:** The detected cause of the host parent-child relationship (for example, *redirect* or  *iframe.src*).
- **Child hostname:** The hostname of the child artifact.

To filter host pair data:
1. Search a domain, IP address, or host in the **Intel explorer** search bar. 
2. Go to the **Host pairs** tab
3. Apply filters to each of the types of filter options noted previously.

   :::image type="content" source="/defender/threat-intelligence/media/data-sets-host-pairs.png" alt-text="Filters Host pairs." lightbox="/defender/threat-intelligence/media/data-sets-host-pairs.png":::

### DNS and reverse DNS filters

The following filters apply to DNS and reverse DNS data:

- **Record Type:** The type of record detected in the DNS record (for example, *NS* or *CNAME*).
- **Value:** The designated value of the record (for example, *nameserver.host.com*).

To filter DNS and reverse DNS data:
1. Search a domain, IP address, or host in the **Intel explorer** search bar. 
2. Go to the **DNS** and **Reverse DNS** tabs
3. Apply filters to each of the types of filter options noted previously.

   :::image type="content" source="/defender/threat-intelligence/media/data-sets-dns.png" alt-text="Filters DNS." lightbox="/defender/threat-intelligence/media/data-sets-dns.png":::

## Downloading data

There are various sections in Defender TI where you can export data as a CSV file. Look out for and select **Download** ![Download icon](media/downloadIcon.png) in the following sections:

- Most data set tabs
- Projects
- Intel articles

When you download data from the **Resolutions**, **DNS**, and **Reverse DNS** the following headers are exported:

| Header                    | Description                     |
|----------------------------|----------------------------|
| **Resolve**                | A record associated with the domain searched (resolving IP address) or domain that resolves to an IP address when the IP address is searched |
| **Location**               | Country or region the IP address is hosted in |
| **Network**                | Netblock or subnet |
| **autonomousSystemNumber** | ASN |
| **firstSeen**              | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft first observed the resolution |
| **lastSeen**               | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft last observed the resolution |
| **Source**                 | Source that observed this resolution |
| **Tags**                   | System or custom tags associated with the artifact |

When you download data from the **Subdomains** tab, the following headers are exported:

| Header                   | Description                    |
|----------------------------|----------------------------|
| **hostname**               | Subdomain of the domain searched |
| **tags**                   | System or custom tags associated with the artifact |

When you download data from the **Trackers** tab, the following headers are  exported:

| Header                  | Description                     |
|----------------------------|----------------------------|
| **hostname**               | Hostname that observed or is currently observing the tracker |
| **firstSeen**              | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft first observed the hostname was using the tracker |
| **lastSeen**               | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft last observed the hostname was using the tracker |
| **attributeType**          | Tracker type |
| **attributeValue**         | Tracker value |
| **Tags**                   | System or custom tags associated with the artifact |

When you download data from the **Components** tab, the following headers are  exported:

| Header                     | Description                     |
|----------------------------|----------------------------|
| **hostname**               | Hostname that observed or is currently observing the component |
| **firstSeen**              | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft first observed the hostname was using the component  |
| **lastSeen**               | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft last observed the hostname was using the component |
| **category**               | Component type |
| **name**                   | Component name |
| **version**                | Component version |
| **Tags**                   | System or custom tags associated with the artifact |

When you download data from the **Host pairs** tab, the following headers are  exported:

| Header                     | Description                     |
|----------------------------|----------------------------|
| **parentHostname**         | The hostname that is reaching out to the child hostname |
| **childHostname**          | The hostname that is feeding assets they host to the parent hostname. |
| **firstSeen**              | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft first observed the relationship between the parent and child hostname |
| **lastSeen**               | Date and time (in *mm/dd/yyyy hh:mm* format) when Microsoft last observed the relationship between the parent and child hostname |
| **attributeCause**         | The cause of the relationship between the parent and child hostname |
| **Tags**                   | System or custom tags associated with the artifact |


When you download data from the **Cookies** tab, the following headers are exported:

| Header                     | Description                     |
|----------------------------|----------------------------|
| **hostname**               | Hostname that observed the cookie name |
| **firstSeen**              | Date and time (in *mm/dd/yyyy hh:mm* format) when the cookie name was first observed to the hostname originating from the cookie domain |
| **lastSeen**               | Date and time (in *mm/dd/yyyy hh:mm* format) when the cookie name was last observed to the hostname originating from the cookie domain |
| **cookieName**             | Cookie name |
| **cookieDomain**           | The domain name's server the cookie name originated from |
| **Tags**                   | System or custom tags associated with the artifact |

When you download project lists from **Intel projects** (**My projects**, **Team projects**, and **Shared projects**), the following headers are exported:

| Header                     | Description                     |
|----------------------------|----------------------------|
| **name**                   | Project name |
| **artifacts (count)**      | Artifact count within the project |
| **created by (user)**      | User who created the project |
| **created on**             | When the project was created |
| **tags**                   | System or custom tags associated with the artifact |
| **collaborators**          | Who were added as collaborators to the project; this header is only visible for projects downloaded from the **My projects** and **Shared projects** pages |

When you download project details (artifacts) from a project, the following headers are exported:

| Header                     | Description                     |
|----------------------------|----------------------------|
| **artifact**               | Artifact value (for example, IP address, domain, host, WHOIS value, or certificate SHA-1) |
| **type**                   | Artifact type (for example, IP, domain, host, WHOIS organization, WHOIS phone, or certificate SHA-1) |
| **created**                | Date and time (in *mm/dd/yyyy hh:mm* format) when the artifact was added to the project |
| **creator**                | Email address of user who added the artifact |
| **context**                | How the artifact was added to the project |
| **tags**                   | System or custom tags associated with the artifact |
| **collaborators**          | Who were added as collaborators to the project; this header is only visible for projects downloaded from the **My projects** and **Shared projects** pages |

Downloading threat intelligence public or riskiq indicators exports the following headers:

| Header                     | Description                     |
|----------------------------|----------------------------|
| **type**                | Indicator type (for example, IP address, certificate, domain, or SHA-256) |
| **value**               | Indicator value (for example, IP address, domain, or hostname) |
| **source**              | Indicator source (RiskIQ or OSINT) |

### See also

- [Data sets](data-sets.md)