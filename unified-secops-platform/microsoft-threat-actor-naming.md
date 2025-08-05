---
title: How Microsoft names threat actors
ms.reviewer: 
description: Learn how Microsoft names threat actors and how to use the naming convention to identify associated intelligence.
ms.service: unified-secops-platform
ms.mktglfcycl: secure
ms.sitesec: library
ms.localizationpriority: medium
ms.author: diannegali
author: vpattnaik
manager: dansimp
audience: ITPro
ms.collection: 
- m365-security
- tier2
ms.custom:
- cx-ti
ms.topic: article
search.appverid: met150
ms.date: 7/31/2025
---

# How Microsoft names threat actors

Microsoft uses a naming taxonomy for threat actors aligned with the theme of weather. We intend to bring better clarity to customers and other security researchers with this taxonomy. We offer a more organized, articulate, and easy way to reference threat actors so that organizations can better prioritize and protect themselves. We also aim to aid security researchers, who are already confronted with an overwhelming amount of threat intelligence data.

:::image type="content" source="media/microsoft-threat-actor-naming/threat-actor-categories.png" alt-text="Nation-state actors based on Microsoft naming" lightbox="media/microsoft-threat-actor-naming/threat-actor-categories-lg.png":::

Microsoft categorizes threat actors into five key groups:

**Nation-state actors:** cyber operators acting on behalf of or directed by a nation/state-aligned program, irrespective of whether for espionage, financial gain, or retribution. Microsoft observed that most nation state actors continue to focus operations and attacks on government agencies, intergovernmental organizations, nongovernmental organizations, and think tanks for traditional espionage or surveillance objectives.

**Financially motivated actors:** cyber campaigns/groups directed by a criminal organization/person with motivations of financial gain and aren't associated with high confidence to a known non-nation state or commercial entity. This category includes ransomware operators, business email compromise, phishing, and other groups with purely financial or extortion motivations.

**Private sector offensive actors (PSOAs):** cyber activity led by commercial actors that are known/legitimate legal entities, that create and sell cyberweapons to customers who then select targets and operate the cyberweapons. These tools were observed targeting and surveiling dissidents, human rights defenders, journalists, civil society advocates, and other private citizens, threatening many global human rights efforts.

**Influence operations:** information campaigns communicated online or offline in a manipulative fashion to shift perceptions, behaviors, or decisions by target audiences to further a group or a nation's interests and objectives.

**Groups in development:** a temporary designation given to an unknown, emerging, or developing threat activity. This designation allows Microsoft to track a group as a discrete set of information until we can reach high confidence about the origin or identity of the actor behind the operation. Once criteria are met, a group in development is converted to a named actor or merged into existing names.

In this taxonomy, a weather event or *family name* represents one of the above categories. For nation-state actors, we assigned a family name to a country/region of origin tied to attribution. For example, Typhoon indicates origin or attribution to China. For other actors, the family name represents a motivation. For example, Tempest indicates financially motivated actors.

Threat actors within the same weather family are given an adjective to distinguish actor groups with distinct tactics, techniques, and procedures (TTPs), infrastructure, objectives, or other identified patterns. For groups in development, we use a temporary designation of Storm and a four-digit number where there's a newly discovered, unknown, emerging, or developing cluster of threat activity.

The following table shows how the family names map to the threat actors that we track.

|Threat actor category|Type|Family name|
|:---|:---|:---|
|Nation-state|China<br>Germany<br>India<br>Iran<br>North Korea<br>Lebanon<br>Pakistan<br>Palestinian Authority<br>Russia<br>Singapore<br>South Korea<br>Spain<br>Syria<br>Türkiye<br>Ukraine<br>United States<br>Vietnam|Typhoon<br>Gale<br>Monsoon<br>Sandstorm<br>Sleet<br>Rain<br>Whirlwind<br>Lightning<br>Blizzard<br>Squall<br>Hail<br>Derecho<br>Haze<br>Dust<br>Frost<br>Tornado<br>Cyclone|
|Financially motivated|Financially motivated|Tempest|
|Private sector offensive actors|PSOAs|Tsunami|
|Influence operations|Influence operations|Flood|
|Groups in development|Groups in development|Storm|

The following table lists publicly disclosed threat actor names with their origin or threat actor category, previous names, and corresponding names used by other security vendors where available. This page will be updated as more info on other vendors' names become available.  

|Threat actor name|Origin/Threat actor category|Other names|
|:-----|:-----|:---|
|Amethyst Rain|Lebanon|VolcanicTimber, Volatile Cedar|
|[Antique Typhoon](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/)|China|Storm-0558|
|[Aqua Blizzard](https://www.microsoft.com/en-us/security/blog/2022/02/04/actinium-targets-ukrainian-organizations/)|Russia|ACTINIUM, PRIMITIVE BEAR, Gamaredon, Armageddon, UNC530, shuckworm, SectorC08|
|Berry Sandstorm|Iran|Storm-0852|
|Blue Tsunami|Israel, Private sector offensive actor||
|Brass Typhoon|China|BARIUM, WICKED PANDA, APT41|
|Brocade Typhoon|China|BORON, GOTHIC PANDA, UPS, APT3, OLDCARP, TG-0110, Red Sylvan, CYBRAN|
|Burgundy Sandstorm|Iran|REMIX KITTEN, Cadelle, Chafer|
|[Cadet Blizzard](https://www.microsoft.com/en-us/security/blog/2023/06/14/cadet-blizzard-emerges-as-a-novel-and-distinct-russian-threat-actor/)|Russia|DEV-0586, EMBER BEAR|
|Canary Typhoon|China|CIRCUIT PANDA, APT24, Palmerworm, BlackTech|
|Canvas Cyclone|Vietnam|BISMUTH, OCEAN BUFFALO, OceanLotus, APT32|
|Caramel Tsunami|Israel, Private sector offensive actor|DEV-0236|
|[Carmine Tsunami](https://www.microsoft.com/en-us/security/blog/2023/04/11/dev-0196-quadreams-kingspawn-malware-used-to-target-civil-society-in-europe-north-america-the-middle-east-and-southeast-asia/)|Private sector offensive actor||
|Charcoal Typhoon|China|CHROMIUM, AQUATIC PANDA, ControlX, RedHotel, BRONZE UNIVERSITY|
|Checkered Typhoon|China|CHLORINE, DEEP PANDA, ATG50, APT19, TG-3551, Red Gargoyle|
|Cinnamon Tempest|China, Financially motivated|DEV-0401, HighGround|
|Circle Typhoon|China|DEV-0322, EMISSARY PANDA, APT6, APT27|
|[Citrine Sleet](https://www.microsoft.com/en-us/security/blog/2024/08/30/north-korean-threat-actor-citrine-sleet-exploiting-chromium-zero-day/)|North Korea|Storm-0139, Storm-1222, LABYRINTH CHOLLIMA|
|Copper Typhoon|China|Tonto Team, Earth Akhlut, Sharp-R|
|Cotton Sandstorm|Iran|NEPTUNIUM, HAYWIRE KITTEN, Vice Leaker|
|[CovertNetwork-1658](https://www.microsoft.com/en-us/security/blog/2024/10/31/chinese-threat-actor-storm-0940-uses-credentials-from-password-spray-attacks-from-a-covert-network/)|Covert network|ORB07|
|Crescent Typhoon|China|CESIUM|
|Crimson Sandstorm|Iran|CURIUM, IMPERIAL KITTEN, Tortoise Shell, HOUSEBLEND, TA456|
|Cuboid Sandstorm|Iran|DEV-0228, IMPERIAL KITTEN|
|[Denim Tsunami](https://www.microsoft.com/en-us/security/blog/2022/07/27/untangling-knotweed-european-private-sector-offensive-actor-using-0-day-exploits/)|Austria, Private sector offensive actor|DEV-0291|
|[Diamond Sleet](https://www.microsoft.com/en-us/security/blog/2023/11/22/diamond-sleet-supply-chain-compromise-distributes-a-modified-cyberlink-installer/)|North Korea|ZINC, LABYRINTH CHOLLIMA, Black Artemis, Lazarus|
|Emerald Sleet|North Korea|THALLIUM, VELVET CHOLLIMA, RGB-D5, Black Banshee, Kimsuky, Greendinosa|
|Fallow Squall|Singapore|PLATINUM, PARASITE, RUBYVINE, GINGERSNAP|
|[Flax Typhoon](https://www.microsoft.com/en-us/security/blog/2023/08/24/flax-typhoon-using-legitimate-software-to-quietly-access-taiwanese-organizations/)|China|Storm-0919, ETHEREAL PANDA|
|[Forest Blizzard](https://www.microsoft.com/en-us/security/blog/tag/forest-blizzard-strontium/)|Russia|STRONTIUM, FANCY BEAR, Sednit, ATG2, Sofacy, Blue Athena, Z-Lom Team, Operation Pawn Storm, Tsar Team, CrisisFour, HELLFIRE, APT28|
|Ghost Blizzard|Russia|BROMINE, BERSERK BEAR, TG-4192, Koala Team, Blue Kraken, Crouching Yeti, Dragonfly|
|Gingham Typhoon|China|GADOLINIUM, KRYPTONITE PANDA, TEMP.Periscope, Leviathan, JJDoor, APT40, Feverdream|
|Granite Typhoon|China|GALLIUM, PHANTOM PANDA|
|Gray Sandstorm|Iran|DEV-0343|
|Hazel Sandstorm|Iran|EUROPIUM, HELIX KITTEN, COBALT GYPSY, Crambus, OilRig, APT34|
|Heart Typhoon|China|HELIUM, AURORA PANDA, APT17, Hidden Lynx, ATG3, Red Typhoon, KAOS, TG-8153, SportsFans, DeputyDog, Tailgater|
|Hexagon Typhoon|China|HYDROGEN, NUMBERED PANDA, Calc Team, Red Anubis, APT12, DNS-Calc, HORDE|
|Houndstooth Typhoon|China|HASSIUM, DRAGNET PANDA, isoon, deepclif|
|Jade Sleet|North Korea|Storm-0954, LABYRINTH CHOLLIMA|
|[Jasper Sleet](https://www.microsoft.com/en-us/security/blog/2025/06/30/jasper-sleet-north-korean-remote-it-workers-evolving-tactics-to-infiltrate-organizations/)|North Korea|Storm-0287|
|Lace Tempest|Financially motivated|DEV-0950|
|Lemon Sandstorm|Iran|RUBIDIUM, PIONEER KITTEN|
|Leopard Typhoon|China|LEAD, WICKED PANDA, TG-2633, TG-3279, Mana, KAOS, Red Diablo, Winnti Group|
|Lilac Typhoon|China|DEV-0234|
|[Linen Typhoon](https://www.microsoft.com/en-us/security/blog/2025/07/22/disrupting-active-exploitation-of-on-premises-sharepoint-vulnerabilities/)|China|IODINE, EMISSARY PANDA, Red Phoenix, Hippo, Lucky Mouse, BOWSER, APT27, Wekby2, UNC215, TG-3390|
|Luna Tempest|Financially motivated||
|Magenta Dust|Türkiye|PROMETHIUM, StrongPity, SmallPity|
|Manatee Tempest|Russia|DEV-0243, INDRIK SPIDER|
|[Mango Sandstorm](https://www.microsoft.com/en-us/security/blog/2023/04/07/mercury-and-dev-1084-destructive-attack-on-hybrid-environment/)|Iran|MERCURY, STATIC KITTEN, SeedWorm, TEMP.Zagros, MuddyWater|
|[Marbled Dust](https://www.microsoft.com/en-us/security/blog/2025/05/12/marbled-dust-leverages-zero-day-in-output-messenger-for-regional-espionage/)|Türkiye|SILICON, COSMIC WOLF, Sea Turtle, UNC1326|
|Marigold Sandstorm|Iran|DEV-500, VENGEFUL KITTEN|
|[Midnight Blizzard](https://www.microsoft.com/en-us/security/blog/tag/midnight-blizzard-nobelium/)|Russia|NOBELIUM, COZY BEAR, UNC2452, APT29|
|[Mint Sandstorm](https://www.microsoft.com/en-us/security/blog/tag/mint-sandstorm-phosphorus/)|Iran|PHOSPHORUS, CHARMING KITTEN, Parastoo, Newscaster, APT35|
|[Moonstone Sleet](https://www.microsoft.com/en-us/security/blog/2024/05/28/moonstone-sleet-emerges-as-new-north-korean-threat-actor-with-new-bag-of-tricks/)|North Korea|Storm-1789, LABYRINTH CHOLLIMA|
|Mulberry Typhoon|China|MANGANESE, KEYHOLE PANDA, Backdoor-DPD, COVENANT, CYSERVICE, Bottle, Red Horus, Red Naga, Auriga, APT5, ATG48, TG-2754, tabcteng|
|Mustard Tempest|Financially motivated|DEV-0206, INDRIK SPIDER|
|[Neva Flood](https://blogs.microsoft.com/on-the-issues/2024/09/17/russian-election-interference-efforts-focus-on-the-harris-walz-campaign/)|Russia, Influence operations|Storm-1516, CopyCop|
|Night Tsunami|Israel|DEV-0336|
|Nylon Typhoon|China|NICKEL, VIXEN PANDA, Playful Dragon, RedRiver, ke3chang, APT15, Mirage|
|[Octo Tempest](https://www.microsoft.com/en-us/security/blog/2023/10/25/octo-tempest-crosses-boundaries-to-facilitate-extortion-encryption-and-destruction/)|Financially motivated| SCATTERED SPIDER, 0ktapus|
|Onyx Sleet|North Korea|PLUTONIUM, SILENT CHOLLIMA, StoneFly, Tdrop2 campaign, DarkSeoul, Black Chollima, Andariel, APT45|
|Opal Sleet|North Korea|OSMIUM, VELVET CHOLLIMA, Planedown, Konni, APT43|
|Patched Lightning||Storm-0113|
|[Peach Sandstorm](https://www.microsoft.com/en-us/security/blog/2024/08/28/peach-sandstorm-deploys-new-custom-tickler-malware-in-long-running-intelligence-gathering-operations/)|Iran|HOLMIUM, REFINED KITTEN, APT33, Elfin|
|Pearl Sleet|North Korea|LAWRENCIUM|
|Periwinkle Tempest|Russia|DEV-0193, WIZARD SPIDER|
|Phlox Tempest|Israel, Financially motivated|DEV-0796|
|Pink Sandstorm|Iran|AMERICIUM, SPECTRAL KITTEN, Agrius, Deadwood, BlackShadow, SharpBoys, FireAnt, Justice Blade|
|Pinstripe Lightning||NIOBIUM, RENEGADE JACKAL, Desert Falcons, Scimitar, Arid Viper|
|Pistachio Tempest|Financially motivated|DEV-0237|
|[Plaid Rain](https://www.microsoft.com/en-us/security/blog/2022/06/02/exposing-polonium-activity-and-infrastructure-targeting-israeli-organizations/)|Lebanon|POLONIUM, INCENDIARY JACKAL|
|Pumpkin Sandstorm|Iran|DEV-0146|
|Purple Typhoon|China|POTASSIUM, STONE PANDA, GOLEM, Evilgrab, AEON, LIVESAFE, ChChes, APT10, Haymaker, Webmonder, Foxtrot, Foxmail, MenuPass, Red Apollo|
|Raspberry Typhoon|China|RADIUM, LOTUS PANDA, LotusBlossom, APT30|
|Red Sandstorm|Iran|Storm-0842, BANISHED KITTEN, Void Manticore|
|Ruby Sleet|North Korea|CERIUM, VELVET CHOLLIMA|
|Ruza Flood|Russia, Influence operations||
|Salmon Typhoon|China|SODIUM, MAVERICK PANDA, APT4|
|Salt Typhoon|China|OPERATOR PANDA, GhostEmperor, FamousSparrow|
|Sangria Tempest|Ukraine, Financially motivated|ELBRUS, CARBON SPIDER|
|Sapphire Sleet|North Korea|COPERNICIUM, STARDUST CHOLLIMA, Genie Spider, BlueNoroff, CageyChameleon, CryptoCore|
|Satin Typhoon|China|SCANDIUM, DYNAMITE PANDA, COMBINE, TG-0416, SILVERVIPER, Red Wraith, APT18, Elderwood Group, Wekby|
|[Seashell Blizzard](https://www.microsoft.com/en-us/security/blog/2025/02/12/the-badpilot-campaign-seashell-blizzard-subgroup-conducts-multiyear-global-access-operation/)|Russia|IRIDIUM, VOODOO BEAR, BE2, UAC-0113, Blue Echidna, Sandworm, PHANTOM, BlackEnergy Lite, APT44|
|[Secret Blizzard](https://www.microsoft.com/en-us/security/blog/2024/12/04/frequent-freeloader-part-i-secret-blizzard-compromising-storm-0156-infrastructure-for-espionage/)|Russia|KRYPTON, VENOMOUS BEAR, Uroburos, Snake, Blue Python, Turla, WRAITH, ATG26|
|Sefid Flood|Iran, Influence operations||
|Shadow Typhoon|China|Storm-0062, DarkShadow, Oro0lxy|
|Silk Typhoon|China|HAFNIUM, MURKY PANDA, timmy|
|Smoke Sandstorm|Iran|IMPERIAL KITTEN, UNC1549|
|Spandex Tempest|Financially motivated|MONTY SPIDER, TA505|
|[Star Blizzard](https://www.microsoft.com/en-us/security/blog/tag/star-blizzard-seaborgium/)|Russia|SEABORGIUM, COLDRIVER, Callisto Group, BlueCharlie, TA446|
|Storm-0216|Financially motivated|TUNNEL SPIDER, UNC2198|
|Storm-0230|Group in development|WIZARD SPIDER, Conti Team 1|
|Storm-0247|China|ToddyCat, Websiic|
|Storm-0252|Group in development|CHATTY SPIDER|
|Storm-0288|Group in development|FIN8|
|Storm-0302|Group in development|NARWHAL SPIDER, TA544|
|[Storm-0408](https://www.microsoft.com/en-us/security/blog/2025/03/06/malvertising-campaign-leads-to-info-stealers-hosted-on-github/)|Group in development||
|[Storm-0485](https://www.microsoft.com/en-us/security/blog/2025/05/29/defending-against-evolving-identity-attack-techniques/)|Group in development||
|[Storm-0501](https://www.microsoft.com/en-us/security/blog/2024/07/29/ransomware-operators-exploit-esxi-hypervisor-vulnerability-for-mass-encryption/)|Financially motivated||
|Storm-0538|Group in development|SKELETON SPIDER, FIN6|
|[Storm-0539](https://www.microsoft.com/en-us/security/blog/2024/05/23/cyber-signals-inside-the-growing-risk-of-gift-card-fraud/)|Financially motivated||
|[Storm-0569](https://www.microsoft.com/en-us/security/blog/2022/11/17/dev-0569-finds-new-ways-to-deliver-royal-ransomware-various-payloads/)|Financially motivated||
|Storm-0671|Group in development|UNC2596, Tropicalscorpius|
|[Storm-0940](https://www.microsoft.com/en-us/security/blog/2024/10/31/chinese-threat-actor-storm-0940-uses-credentials-from-password-spray-attacks-from-a-covert-network/)|China||
|[Storm-0978](https://www.microsoft.com/en-us/security/blog/2023/07/11/storm-0978-attacks-reveal-financial-and-espionage-motives/)|Russia|RomCom, Underground Team|
|[Storm-1101](https://www.microsoft.com/en-us/security/blog/2023/03/13/dev-1101-enables-high-volume-aitm-campaigns-with-open-source-phishing-kit/)|Group in development||
|[Storm-1113](https://www.microsoft.com/en-us/security/blog/2023/12/28/financially-motivated-threat-actors-misusing-app-installer/)|Financially motivated|APOTHECARY SPIDER|
|[Storm-1152](https://blogs.microsoft.com/on-the-issues/2023/12/13/cybercrime-cybersecurity-storm-1152-fraudulent-accounts/)|Financially motivated||
|[Storm-1175](https://www.microsoft.com/en-us/security/blog/2024/07/29/ransomware-operators-exploit-esxi-hypervisor-vulnerability-for-mass-encryption/)|China, Financially motivated||
|Storm-1194|Group in development|MONTI|
|[Storm-1249](https://www.microsoft.com/en-us/security/blog/2025/05/29/defending-against-evolving-identity-attack-techniques/)|Group in development||
|Storm-1516|Russia, Influence operations||
|[Storm-1567](https://www.microsoft.com/en-us/security/blog/2023/10/11/automatic-disruption-of-human-operated-attacks-through-containment-of-compromised-user-accounts/)|Financially motivated|PUNK SPIDER|
|[Storm-1674](https://www.microsoft.com/en-us/security/blog/2023/12/28/financially-motivated-threat-actors-misusing-app-installer/)|Financially motivated||
|[Storm-1679](https://blogs.microsoft.com/on-the-issues/2024/09/17/russian-election-interference-efforts-focus-on-the-harris-walz-campaign/)|Influence operations||
|[Storm-1811](https://www.microsoft.com/en-us/security/blog/2024/05/15/threat-actors-misusing-quick-assist-in-social-engineering-attacks-leading-to-ransomware/)|Financially motivated|CURLY SPIDER|
|[Storm-1865](https://www.microsoft.com/en-us/security/blog/2025/03/13/phishing-campaign-impersonates-booking-com-delivers-a-suite-of-credential-stealing-malware/)|Group in development||
|Storm-1982|China|SneakyCheff, UNK_SweetSpecter|
|[Storm-2035](https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/final/en-us/microsoft-brand/documents/5bc57431-a7a9-49ad-944d-b93b7d35d0fc.pdf)|Iran, Influence operations||
|[Storm-2077](https://www.microsoft.com/en-us/security/blog/2024/11/22/microsoft-shares-latest-intelligence-on-north-korean-and-chinese-threat-actors-at-cyberwarcon/#storm-2077)|China|TAG-100|
|[Storm-2372](https://www.microsoft.com/en-us/security/blog/2025/02/13/storm-2372-conducts-device-code-phishing-campaign/)|Group in development||
|[Storm-2603](https://www.microsoft.com/en-us/security/blog/2025/07/22/disrupting-active-exploitation-of-on-premises-sharepoint-vulnerabilities/)|China||
|Strawberry Tempest|Financially motivated|DEV-0537, SLIPPY SPIDER, LAPSUS$|
|Sunglow Blizzard||DEV-0665|
|Swirl Typhoon|China|TELLURIUM, STALKER PANDA, Tick, Bronze Butler, REDBALDKNIGHT|
|Taffeta Typhoon|China|TECHNETIUM, TURBINE PANDA, TG-0055, Red Kobold, JerseyMikes, APT26, BEARCLAW|
|Taizi Flood|China, Influence operations|Dragonbridge, Spamouflage|
|Tumbleweed Typhoon|China|THORIUM, Karst|
|Twill Typhoon|China|TANTALUM, MUSTANG PANDA, BRONZE PRESIDENT, LuminousMoth|
|[Vanilla Tempest](https://www.microsoft.com/en-us/security/blog/2022/10/25/dev-0832-vice-society-opportunistic-ransomware-campaigns-impacting-us-education-sector/)|Financially motivated|DEV-0832, VICE SPIDER, Vice Society |
|Velvet Tempest|Financially motivated|DEV-0504, ALPHA SPIDER|
|[Violet Typhoon](https://www.microsoft.com/en-us/security/blog/2025/07/22/disrupting-active-exploitation-of-on-premises-sharepoint-vulnerabilities/)|China|ZIRCONIUM, JUDGMENT PANDA, Chameleon, APT31, WebFans|
|[Void Blizzard](https://www.microsoft.com/en-us/security/blog/2025/05/27/new-russia-affiliated-actor-void-blizzard-targets-critical-sectors-for-espionage/)|Russia|Laundry Bear|
|Volga Flood|Russia, Influence operations|Storm-1841, Rybar|
|[Volt Typhoon](https://www.microsoft.com/security/blog/2023/05/24/volt-typhoon-targets-us-critical-infrastructure-with-living-off-the-land-techniques)|China|VANGUARD PANDA, BRONZE SILHOUETTE|
|Wheat Tempest|Financially motivated|GOLD, Gatak|
|Wisteria Tsunami|India, Private sector offensive actor|DEV-0605, MintedSoil|
|Yulong Flood|China, Influence operations|Storm-1852|
|Zigzag Hail|Korea|DUBNIUM, SHADOW CRANE, Nemim, TEMPLAR, TieOnJoe, Fallout Team, Purple Pygmy, Dark Hotel, Egobot, Tapaoux, PALADIN, APT-C-60|

Read our announcement about this taxonomy for more information: [https://aka.ms/threatactorsblog](https://aka.ms/threatactorsblog)

## Putting intelligence into the hands of security professionals

[Intel profiles in Microsoft Defender Threat Intelligence](/defender-xdr/defender-threat-intelligence) bring crucial insights about threat actors. These insights enable security teams to get the context they need as they prepare for and respond to threats.

Additionally, the Microsoft Defender Threat Intelligence Intel Profiles API provides the most up-to-date threat actor infrastructure visibility in the industry today. Updated information is crucial in enabling threat intelligence and security operations (SecOps) teams to streamline their advanced threat hunting and analysis workflows. Learn more about this API in the documentation: [Use the threat intelligence APIs in Microsoft Graph (preview)](/graph/api/resources/security-threatintelligence-overview).

## Resources

Use the following query on Microsoft Defender XDR and other Microsoft security products supporting the Kusto query language (KQL) to get information about a threat actor using the old name, new name, or industry name:

```kusto
let TANames = externaldata(PreviousName: string, NewName: string, Origin: string, OtherNames: dynamic)[@"https://raw.githubusercontent.com/microsoft/mstic/master/PublicFeeds/ThreatActorNaming/MicrosoftMapping.json"] with(format="multijson", ingestionMapping='[{"Column":"PreviousName","Properties":{"Path":"$.Previous name"}},{"Column":"NewName","Properties":{"Path":"$.New name"}},{"Column":"Origin","Properties":{"Path":"$.Origin/Threat"}},{"Column":"OtherNames","Properties":{"Path":"$.Other names"}}]'); 
let GetThreatActorAlias = (Name: string) { 
TANames 
| where Name =~ NewName or Name =~ PreviousName or OtherNames has Name 
}; 
GetThreatActorAlias("ZINC")
```

The following files containing the comprehensive mapping of old threat actor names with their new names are also available:

- [JSON format](https://github.com/microsoft/mstic/blob/master/PublicFeeds/ThreatActorNaming/MicrosoftMapping.json)
- [Downloadable Excel](https://download.microsoft.com/download/4/5/2/45208247-c1e9-432d-a9a2-1554d81074d9/Microsoft-threat-actor-list.xlsx)
