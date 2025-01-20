---
title: Microsoft Security Copilot in Microsoft Defender Threat Intelligence
description: Learn about Microsoft Defender Threat Intelligence capabilities embedded in Security Copilot.
keywords: security copilot, threat intelligence, defender threat intelligence, defender ti, Security Copilot, embedded experience, vulnerability impact assessment, threat actor profile, plugins, Microsoft plugins
ms.service: defender-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: dolmont
audience: ITPro
ms.collection:
  - Tier1
  - security-copilot
  - magic-ai-copilot
ms.custom:
- cx-ti
- cx-mdti
ms.topic: conceptual
ms.date: 01/15/2025
---

# Microsoft Security Copilot in Microsoft Defender Threat Intelligence

Microsoft Security Copilot is a cloud-based AI platform that provides natural language copilot experience. It can help support security professionals in different scenarios, like incident response, threat hunting, and intelligence gathering. For more information about what it can do, read [What is Microsoft Security Copilot?](/copilot/security/microsoft-security-copilot).

Security Copilot customers gain for each of their authenticated Copilot users access to Microsoft Defender Threat Intelligence (Defender TI). To ensure that you have access to Copilot, see the [Security Copilot purchase and licensing information](/copilot/security/faq-security-copilot).

Once you have access to Security Copilot, the key features discussed in this article become accessible in either the Security Copilot portal or the [Microsoft Defender portal](using-copilot-threat-intelligence-defender-xdr.md).


## Know before you begin

If you're new to Security Copilot, you should familiarize yourself with it by reading these articles:

- [What is Microsoft Security Copilot?](/copilot/security/microsoft-security-copilot)
- [Microsoft Security Copilot experiences](/copilot/security/experiences-security-copilot)
- [Get started with Microsoft Security Copilot](/copilot/security/get-started-security-copilot)
- [Understand authentication in Microsoft Security Copilot](/copilot/security/authentication)
- [Prompting in Microsoft Security Copilot](/copilot/security/prompting-security-copilot)

## Security Copilot integration in Defender TI

Security Copilot delivers information about threat actors, indicators of compromise (IOCs), tools, and vulnerabilities, as well as contextual threat intelligence from Defender TI. You can use the prompts and promptbooks to investigate incidents, enrich your hunting flows with threat intelligence information, or gain more knowledge about your organization's or the global threat landscape.

- Be clear and specific with your prompts. You might get better results if you include specific threat actor names or IOCs in your prompts. It might also help if you add **threat intelligence** to your prompt, like:
  - Show me threat intelligence data for Aqua Blizzard.
  - Summarize threat intelligence data for "malicious.com."
- Be specific when referencing an incident (for example, "incident ID 15324").
- Experiment with different prompts and variations to see what works best for your use case. Chat AI models vary, so iterate and refine your prompts based on the results you receive.
- Copilot saves your prompt sessions. To see the previous sessions, from the Security Copilot [Home menu](/copilot/security/navigating-security-copilot#home-menu), go to **My sessions**.
    
    ![Screenshot that shows the Microsoft Security Copilot Home menu with My sessions highlighted.](/defender/threat-intelligence/media/defender-ti-and-copilot/copilot-my-sessions.png)

    > [!NOTE]
    > For a walkthrough on Copilot, including the pin and share feature, read [Navigate Microsoft Security Copilot](/copilot/security/navigating-security-copilot).

[Learn more about creating effective prompts](/copilot/security/prompting-tips)

## Key features

Security Copilot lets security teams understand, prioritize, and take action on threat intelligence information immediately.

You can ask about a threat actor, attack campaign, or any other threat intelligence that you want to know more about, and Copilot generates responses based on threat analytics reports, intel profiles and articles, and other Defender TI content. 

You can also select any of the built-in prompts that are available in the Defender portal to do the following actions:

-	[Summarize](using-copilot-threat-intelligence-defender-xdr.md#summarize-the-latest-threats-related-to-your-organization) the latest threats related to your organization
-	[Prioritize](using-copilot-threat-intelligence-defender-xdr.md#prioritize-which-threats-to-focus-on) which threats to focus on based on your environment's highest exposure level to these threats
-	[Ask](using-copilot-threat-intelligence-defender-xdr.md#ask-about-the-threat-actors-targeting-the-communications-infrastructure-industry) about the threat actors targeting the communications infrastructure industry

[Learn more about using Copilot in Defender for threat intelligence](using-copilot-threat-intelligence-defender-xdr.md)


## Turn on the Security Copilot integration in Defender TI

1. Go to [Microsoft Security Copilot](https://go.microsoft.com/fwlink/?linkid=2247989) and sign in with your credentials.
2.	Make sure that the Microsoft Threat Intelligence plugin is turned on. In the prompt bar, select the **Sources** icon ![Screenshot of the Sources icon.](/defender/threat-intelligence/media/defender-ti-and-copilot/copilot-sources-icon.png).

    ![Screenshot of the prompt bar in Microsoft Security Copilot with the Sources icon highlighted.](media/defender-ti-and-copilot/copilot-prompts-bar-sources.png)
  
    In the **Manage sources** pop-up window that appears, under **Plugins**, confirm that the **Microsoft Threat Intelligence** toggle is turned on, then close the window.

    ![Screenshot of the Manage plugins pop-up window with the Microsoft Threat Intelligence plugin highlighted.](media/defender-ti-and-copilot/copilot-manage-plugins.png)

    > [!NOTE]
    > Some roles can turn the toggle on or off for plugins like Microsoft Threat Intelligence. For more information, read [Manage plugins in Microsoft Security Copilot](/copilot/security/manage-plugins).
    
    
3. Enter your prompt in the prompt bar.

### Built-in system features

Security Copilot has built-in system features that can get data from the different plugins that are turned on.

To view the list of built-in system capabilities for Defender TI:

1.	In the prompt bar, select the **Prompts** icon ![Screenshot of the prompts icon.](/defender/threat-intelligence/media/defender-ti-and-copilot/copilot-prompts-icon.png).

      ![Screenshot of the prompt bar in Microsoft Security Copilot with the Prompts icon highlighted.](media/defender-ti-and-copilot/copilot-prompts-bar-prompts.png)

2.	Select **See all system capabilities**. The *Microsoft Threat Intelligence* section lists all the available capabilities for Defender TI that you can use.

Copilot also has the following promptbooks that also deliver information from Defender TI:
- [**Check impact of an external threat article**](/copilot/security/using-promptbooks#check-impact-of-an-external-threat-article) – Analyzes an external or third-party (that is, not published in Defender TI) article to extract related IOCs, summarize the intelligence, and generate hunting queries so you can assess the potential impact of the threat reported in the article to your organization.
- [**Threat actor profile**](/copilot/security/using-promptbooks#threat-actor-profile) – Generates a report profiling a known threat actor, including suggestions to defend against their common tools and tactics.
- [**Threat Intelligence 360 report based on MDTI article**](/copilot/security/using-promptbooks#threat-intelligence-360-report-based-on-mdti-article) – Analyzes a [Defender TI article](what-is-microsoft-defender-threat-intelligence-defender-ti.md#articles) to extract related IOCs, summarize the intelligence, and generate hunting queries so you can assess the potential impact of the threat reported in the article to your organization.
- [**Vulnerability impact assessment**](/copilot/security/using-promptbooks#vulnerability-impact-assessment) – Generates a report summarizing the intelligence for a known vulnerability, including steps on how to address it.

To view these promptbooks, in the prompt bar, select the **Prompts** icon then select **See all promptbooks**. 

## Sample Defender TI prompts

You can use many prompts to get information from Defender TI. This section lists some ideas and examples.

### General information about threat intelligence trends

Get threat intelligence from threat articles and threat actors.

**Sample prompts** :

- Summarize the recent threat intelligence.
- Show me the latest threat articles.
- Get threat articles related to ransomware in the last six months.

### Threat actor mapping and infrastructure
Get information on threat actors and the tactics, techniques, and procedures (TTPs), sponsored states, industries, and IOCs associated with them.

**Sample prompts**:

- Tell me more about Silk Typhoon.
- Share the IOCs associated with Silk Typhoon.
- Share the TTPs associated with Silk Typhoon.
- Share threat actors associated with Russia.

### Vulnerability data by CVE

Get contextual information and threat intelligence on Common Vulnerabilities and Exposures (CVEs), which are derived from Defender TI articles, [threat analytics reports](/defender-xdr/threat-analytics), and data from [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management) and [Microsoft Defender External Attack Surface Management](/azure/external-attack-surface-management/overview).

**Sample prompts**:

- Share the technologies that are susceptible to the vulnerability CVE-2021-44228.
- Summarize the vulnerability CVE-2021-44228.
- Show me the latest CVEs.
- Show me threat actors associated with CVE-2021-44228.
- Show me the threat articles associated with CVE-2021-44228.

### Indicator data in relation to threat intelligence

Get detailed information about an indicator (for example, IP addresses, domains, and file hashes) based on the numerous [data sets](data-sets.md) available in Defender TI, including reputation scores, WHOIS information, domain name system (DNS), host pairs, and certificates. 

**Sample prompts**:

- What can you tell me about the domain _\<domain name\>_?
- Show me indicators related to _\<domain name\>_.
- Show me all resolutions for _\<domain name\>_.
- Show me host pairs related to _\<domain name\>_.
- Show me the reputation of the host _\<host name\>_.
- Show me all resolutions for IP address _\<IP address\>_.
- Show me the open services in _\<IP address\>_.

## Provide feedback

Your feedback on the Defender TI integration in Security Copilot helps with development. To provide feedback, in Copilot, select **How's this response?** At the bottom of each completed prompt and choose any of the following options:
- **Looks right** - Select this button if the results are accurate, based on your assessment. 
- **Needs improvement** - Select this button if any detail in the results is incorrect or incomplete, based on your assessment. 
- **Inappropriate** - Select this button if the results contain questionable, ambiguous, or potentially harmful information.

For each feedback button, you can provide more information in the next dialog box that appears. Whenever possible, and when the result is **Needs improvement**, write a few words explaining what can be done to improve the outcome. If you entered prompts specific to Defender TI and the results aren't related, then include that information.


## Privacy and data security in Security Copilot

When you interact with Security Copilot to get Defender TI data, Copilot pulls that data from Defender TI. The prompts, the data retrieved, and the output shown in the prompt results are processed and stored within the Copilot service. [Learn more about privacy and data security in Microsoft Security Copilot](/copilot/security/privacy-data-security)

### See also

- [What is Microsoft Security Copilot?](/copilot/security/microsoft-security-copilot)
- [Privacy and data security in Microsoft Security Copilot](/copilot/security/privacy-data-security)
- [Using Microsoft Security Copilot for threat intelligence](using-copilot-threat-intelligence-defender-xdr.md)
