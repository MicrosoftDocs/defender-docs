---
title: Microsoft Defender Experts for XDR managed detection and response 
ms.reviewer:
description: Defender Experts for XDR provide actionable managed response to your security operations center (SOC) teams.
ms.service: defender-experts-for-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - essentials-manage
ms.topic: article
ms.custom: 
- cx-ti
- cx-dex
ms.date: 03/01/2026
---

# Managed detection and response

**Applies to:**

- [Microsoft Defender Experts for XDR](dex-xdr-overview.md)
- Microsoft Defender Experts for Servers

To learn about managed detection and response, watch this short video.

> [!VIDEO https://www.youtube.com/embed/fYzquW2hE5I]

By using a combination of automation and human expertise, Microsoft Defender Experts for XDR triage Microsoft Defender XDR incidents. They prioritize incidents on your behalf, filter out the noise, carry out detailed investigations, and provide actionable managed response recommendations to your security operations center (SOC) teams.

## Incident updates

When Defender Experts determine that an incident needs investigation (whether due to the service or detection source involved, severity level, your defined scoped coverage, or other reasons), they update the incident's **Assigned to** field to *Defender Experts*. When the experts start investigating the incident, they update its **Status** field to *In progress*.

When the experts conclude their investigation on an incident, they update the incident's **Classification** field to one of the following, depending on their findings:

- True Positive
- False Positive
- Informational, Expected Activity

They also update the **Determination** field corresponding to each classification to provide more insights on the findings that led them to determine the classification.

:::image type="content" source="media/incidents-xdr-1.png" alt-text="Screenshot of Incidents page showing the Tags, Status, Assigned to, Classification, and Determination fields." lightbox="media/incidents-xdr-1.png":::

If an incident is classified as _False Positive_ or _Informational_, _Expected Activity_, the experts update the incident's **Status** field to _Resolved_. They conclude their work on this incident and update the **Assigned to** field to _Unassigned_. The experts might share updates from their investigation and their conclusion when resolving an incident. They post these updates under _Investigation Summary_ in the incident's **Managed response** flyout panel.

Otherwise, if an incident is classified as _True Positive_, the experts identify the required response actions that need to be performed. The method in which the actions are performed depends on the permissions and access levels you give the Defender Experts for XDR service. [Learn more about granting permissions to our experts](get-started-xdr.md#grant-permissions-to-our-experts).

- If you grant Defender Experts for XDR the recommended Security Operator access permissions, the experts can perform the required response actions on the incident on your behalf. These actions, along with an **Investigation summary**, show up in the incident's [Managed response](#how-to-use-managed-response-in-defender-portal) flyout panel in your Microsoft Defender portal for you or your SOC team to review. All actions that Defender Experts for XDR complete appear under the **Completed actions** section. Any pending actions that require you or your SOC team to complete are listed under the **Pending actions** section. For more information, see the [Actions](#actions) section.

   Once the experts take all the necessary actions on the incident, they update its **Status** field to _Resolved_ and the **Assigned to** field to _Customer_.

- If you grant Defender Experts for XDR the default Security Reader access, the required response actions, along with an **Investigation summary**, show up in the incident's **Managed response** flyout panel under the **Pending actions** section in your Microsoft Defender portal for you or your SOC team to perform.

   To identify this handoff, the experts update the incident's **Status** field to _Awaiting Customer Action_ and the **Assigned to** field to _Customer_.

You can check the number of incidents that require your action in the **Defender Experts** banner at the top of the Microsoft Defender portal homepage.

   :::image type="content" source="media/view-incidents.png" alt-text="Screenshot of the Defender Experts card in Microsoft Defender portal showing the number of incidents awaiting customer action." lightbox="media/view-incidents.png":::

You can view the incidents related to Defender Experts by filtering the incident queue in the Defender portal by using several filter sets. [Learn more about adding incident queue filters](incident-queue.md#filters-).

- To view the incidents that wait in queue for the experts to start investigating, use the **Incident assignment** and **Status** filters and then select **Assigned To Defender Experts** and **Active**, respectively.
- To view the incidents that the experts are currently investigating, use the **Incident assignment** and **Status** filters and then select **Assigned To Defender Experts** and **In Progress**, respectively.

    :::image type="content" source="media/managed-detection-and-response-xdr/new-incidents-filter-1.png" alt-text="Screenshot of the Incidents queue filtered to only show those with the Assigned to Defender Experts tag." lightbox="media/managed-detection-and-response-xdr/new-incidents-filter-1.png":::

- To view the incidents the experts investigated and handed over to your team to act on pending remediation actions, use the **Status** filter and choose **Awaiting Customer Action**.

   :::image type="content" source="media/managed-detection-and-response-xdr/awaiting-customer-action-filter.png" alt-text="Screenshot of the Incidents queue in Microsoft Defender portal filtered to only show those with the Awaiting customer action tag." lightbox="media/managed-detection-and-response-xdr/awaiting-customer-action-filter.png":::

- To view the incidents the experts completed their investigation on (and either directly resolved or assigned to your team for pending remediation actions), use the **Tags** filter and choose **Defender Experts**.

   :::image type="content" source="media/managed-detection-and-response-xdr/defender-experts-tag.png" alt-text="Screenshot of the Incidents queue in Microsoft Defender portal filtered to only show the Defender Experts tag." lightbox="media/managed-detection-and-response-xdr/defender-experts-tag.png":::

## How to use managed response in Defender portal

In the Microsoft Defender portal, an incident that requires your attention by using managed response has the **Status** field set to _Awaiting Customer Action_, the **Assigned to** field set to _Customer_, and a task card on top of the **Incidents** pane. Your designated incident contacts also receive a corresponding email notification with a link to the Defender portal to view the incident. [Learn more about notification contacts](get-started-xdr.md#tell-us-who-to-contact-for-important-matters). You also receive a Teams notification informing you about the updates. [Learn more about setting up Teams](get-started-xdr.md#receive-managed-response-notifications-and-updates-in-microsoft-teams).

Select **View managed response** on the task card or on the top of the portal page (**Managed response** tab) to open a flyout panel where you can read the experts' investigation summary, complete pending actions identified by the experts, or engage with them through chat.

### Investigation summary

The **Investigation summary** section provides you with more context about the incident analyzed by the experts to provide you with visibility about its severity and potential impact if not addressed immediately. It can include the device timeline, indicators of attack, and indicators of compromise (IOCs) observed, and other details.

:::image type="content" source="media/investigation-summary.png" alt-text="Screenshot of managed response investigation summary." lightbox="media/investigation-summary.png":::

### Actions

The **Actions** tab shows task cards that contain response actions recommended by security experts.

Defender Experts for XDR currently supports the following one-click managed response actions:

|**Action**|**Description**|
|------------|-----------------|
|[Isolate device](/defender-endpoint/respond-machine-alerts##isolate-devices-from-the-network)|Isolates a device, which helps prevent an attacker from controlling it and performing further activities such as data exfiltration and lateral movement. The isolated device stays connected to Microsoft Defender for Endpoint.|
|[Quarantine file](/defender-endpoint/respond-file-alerts##stop-and-quarantine-files)|Stops running processes, quarantines the files, and deletes persistent data such as registry keys.|
|[Restrict app execution](/defender-endpoint/respond-machine-alerts##restrict-app-execution)| Restricts the execution of potentially malicious programs and locks down the device to prevent further attempts.|
|[Release from isolation](/defender-endpoint/respond-machine-alerts#isolate-devices-from-the-network)| Undoes isolation of a device.|
|[Remove app restriction](/defender-endpoint/respond-machine-alerts#restrict-app-execution)| Undoes release from isolation.|
|[Disable user](/defender-for-identity/remediation-actions#supported-actions) | Disables an identity from accessing the network and different endpoints.| 

Apart from these one-click actions, you can also receive managed responses from security experts that you need to perform manually.

> [!NOTE]
> Before performing any of the recommended managed response actions, make sure that your automated investigation and response configurations aren't already addressing them. [Learn more about automated investigation and response capabilities in Microsoft Defender XDR](m365d-autoir.md).

**To view and perform the managed response actions:**

1. Select the arrow buttons in an action card to expand it and read more information about the required action.

   :::image type="content" source="media/action-card-1.png" alt-text="Screenshot of managed response action to isolate the device prod server." lightbox="media/action-card-1.png":::

1. For cards with one-click response actions, select the required action. The **Action status** in the card changes to **In progress**, then to **Failed** or **Completed**, depending on the action's outcome.

   :::image type="content" source="media/action-card-2.png" alt-text="Screenshot of managed response action showing in-progress to isolate the device prod server." lightbox="media/action-card-2.png":::

> [!TIP]
> You can also monitor the status of in-portal response actions in the [Action center](m365d-action-center.md). If a response action fails, try doing it again from the **View device details** page or [initiate a chat](communicate-defender-experts-xdr.md#in-portal-chat) with Defender Experts.

1. For cards with required actions that you need to perform manually, select **I've completed this action** once you perform them, and then select **Yes, I've done it** in the confirmation dialog box that appears.

   :::image type="content" source="media/ive-completed-this-action.png" alt-text="Screenshot of managed response action to confirm action completion." lightbox="media/ive-completed-this-action.png":::

1. If you don't want to complete a required action right away, select **Skip**, and then select **Yes, skip this action** in the confirmation dialog box that appears.

> [!IMPORTANT]
>If you notice that any of the buttons on the action cards are grayed out, it could indicate that you don't have the necessary permissions to perform the action. Make sure that you're signed in to the Microsoft Defender portal with the appropriate permissions. Most managed response actions require that you have at least the Security Operator access. If you still encounter this issue even with the appropriate permissions, go to **View device details** and complete the steps from there.

## Access managed response through Graph API 

You can access managed response by using the [Microsoft Graph security API](/graph/api/resources/security-api-overview).

The following tables show the different managed response details in the Defender portal and their corresponding Graph security API fields.


**In the [`incident`](https://graph.microsoft.com/beta/security/incidents) resource type:**

| Defender portal field| Graph security API field | Description |
|---|---|---|
| Investigation summary | `description` | The investigation notes from Defender Experts. |


**In the [`incidentTask`](https://graph.microsoft.com/beta/security/incidentTasks) resource type:**


| Defender portal field| Graph security API field | Description |
|---|---|---|
| Action status | `actionStatus` | The execution status of the remediation action. For more information, see [incidentTaskActionStatus values](/graph/api/resources/security-incidenttask#incidenttaskactionstatus-values). |
| Action type | `actionType` | The remediation action to perform. For more information, see [incidentTaskActionType values](/graph/api/resources/security-incidenttask#incidenttaskactiontype-values). |
| Action description | `description` | Description of the remediation action. |
| Remediation action | `responseAction` | The remediation action. |
| Task title | `displayName` | Title of the task. |
| Task ID | `id` | Globally unique identifier (GUID) for the task. |
| Task source | `source` | Origin of the task. For more information, see [incidentTaskSource values](/graph/api/resources/security-incidenttask#incidenttasksource-values). |
| Task status | `status` | Current task status. This property is the only property you can update. For more information, see [incidentTaskStatus values](/graph/api/resources/security-incidenttask#incidenttaskstatus-values). |
| Created by | `createdByDisplayName` | Name of the entity that created the task. Read-only. |
| Created time | `createdDateTime` | Creation time of the task. Read-only. |
| Last modified by | `lastModifiedByDisplayName` | Name of the entity that last updated the task. Read-only. |
| Last modified time | `lastModifiedDateTime` | Last update time of the task. Read-only. |


>[!IMPORTANT]
>The `incidentTask` resource type is available in the beta version of Graph security API only.

Your approach to consuming managed response from the API might vary depending on the downstream system you intend to use and your specific requirements. The following steps are a basic implementation to help you get started:

**Starting from incidents in the Graph API**
1.	Get incidents from Graph security API.
1.	Check for incidents where **status** is *awaitingAction* or **assignedTo** is *Customer*.
1.	Continue reading the **incidentTasks** for such incidents.
1.	Synchronize the managed response information into your downstream tool (for example, ServiceNow).

**Starting from alerts in the Graph API**
1.	Get alerts from Graph security API.
1.	Check for alerts where **assignedTo** is *Customer*.
1.	Look up corresponding incident by checking **incidentId** listed on the alert.
1.	Continue reading the **incidentTasks** for such incidents.
1.	Synchronize the managed response information into your downstream tool (for example, ServiceNow).


## Get visibility to Defender Experts investigations in your SIEM or ITSM application

As Defender Experts for XDR investigate incidents and come up with remediation actions, you can see their work on incidents in your security information and event management (SIEM) and IT service management (ITSM) applications, including applications that are available out of the box.

### Microsoft Sentinel

You get incident visibility in Microsoft Sentinel by turning on its out-of-the-box Microsoft Defender XDR data connector. [Learn more](/azure/sentinel/connect-microsoft-365-defender).

After you turn on the connector, updates by Defender Experts to the **Status**, **Assigned to**, **Classification**, and **Determination** fields in Microsoft Defender XDR show up in the corresponding **Status**, **Owner**, and **Reason for closing** fields in Sentinel.

> [!NOTE]
> The status of incidents investigated by Defender Experts in Microsoft Defender XDR typically transitions from _Active_ to _In progress_ to _Awaiting Customer Action_ to _Resolved_, while in Microsoft Sentinel, it follows the _New_ to _Active_ to _Resolved_ path. The Microsoft Defender XDR Status _**Awaiting Customer Action**_ doesn't have an equivalent field in Microsoft Sentinel; instead, it's displayed as a tag in an incident in Microsoft Sentinel.

The following section describes how an incident handled by our experts is updated in Microsoft Sentinel as it progresses through the investigation journey:

1. An incident being investigated by our experts has the **Status** listed as _Active_ and the **Owner** listed as _Defender Experts_.
1. An incident that our experts confirm as a _True Positive_ has a managed response posted in Microsoft Defender XDR, and a **Tag** _Awaiting Customer Action_ and the **Owner** is listed as _Customer_. You need to act on the incident based on using the provided managed response in the Defender portal.
1. An incident that our experts confirm as a _True Positive_, with all remediation actions taken by Defender Experts, has the incident's Status updated to _Resolved_ and the **Owner** is listed as _Customer_. You can review the actions completed on the incident using the provided managed response in the Defender portal.
1. Once our experts conclude their investigation and close an incident as _False Positive_ or _Informational, Expected Activity_, the incident's **Status** is updated to _Resolved_, the **Owner** is updated to _Unassigned_, and a **Reason for closing** is provided.

   :::image type="content" source="media/microsoft-sentinel-incidents.png" alt-text="Screenshot of Microsoft Sentinel incidents." lightbox="media/microsoft-sentinel-incidents.png":::

### Other applications

You can see incidents in your SIEM or ITSM application by using the [Microsoft Defender XDR API](api-overview.md) or [connectors in Microsoft Sentinel](/azure/sentinel/data-connectors-reference).

After you configure a connector, updates by Defender Experts to an incident's **Status**, **Assigned to**, **Classification**, and **Determination** fields in Microsoft Defender XDR can synchronize with the third-party SIEM or ITSM applications, depending on how the field mapping is implemented. To illustrate, see the [connector available from Sentinel to ServiceNow](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/Servicenow/StoreApp).

### See also

- [Understanding and managing Defender Experts for XDR incident notifications](faq-incident-notifications-xdr.md)
- [Understanding managed response](faq-managed-response.md)
- [Get real-time visibility with Defender Experts for XDR reports](reports-xdr.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
