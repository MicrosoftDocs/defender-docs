---
title: SAP agentless data connector prerequisites checker
ms.date: 04/28/2026
ms.topic: include
ai-usage: ai-assisted
---

<!-- docutune:disable -->

**To configure and deploy the tool**:

1. Open the integration package, navigate to the **Artifacts** tab, and select the **Prerequisite checker** iflow > **Configure**.
1. Set the target destination name for the remote function call (RFC) to the SAP system you want to check. For example, `A4H-100-Sentinel-RFC`.
1. Deploy the iflow as you would otherwise for your SAP systems.
1. For best results run the checker for 24 hours to catch any anomalies like rogue overnight batch jobs, or any unknown usage spikes.

**To review the check status**:

1. In SAP Cloud Integration, open **Monitor** > **Integrations** and locate the runs of the **Prerequisite checker** iflow as per your watch period (e.g. 24h). Confirm that the runs completed with status **Completed** (HTTP 200) and that the response payload doesn't contain warnings or errors. The scheduler may produce messages with state "Discarded" due to internal workings of SAP Cloud Integration. These messages can be ignored and contain text like "Message processing has been discarded because the triggering timer event was already handled by another process."
1. Inspect the message processing log (MPL) **Attachments** and properties for the per-check results. Open the file attached to the MPL entry.

:::image type="content" source="../sap/media/preparing-sap/agentless-prerequisite-checker-status.png" alt-text="Screenshot placeholder of the Prerequisite checker iflow run status in SAP Cloud Integration Monitor." lightbox="../sap/media/preparing-sap/agentless-prerequisite-checker-status.png":::

Use the following table to interpret the results:

| Status | What it means | Next step |
|--------|---------------|-----------|
| **Completed**, no warnings | All prerequisites are met. | Continue connecting your SAP system to Microsoft Sentinel. |
| **Completed**, with warnings | Prerequisites are partially met. | Review the response details and remediate before connecting. |
| **Failed** or non-200 status | The checker couldn't reach the target SAP system or hit a configuration error. | Verify the RFC destination and credentials, then redeploy and rerun the iflow. |

If any findings remain, consult the response details for guidance on remediation steps. Legacy SAP systems often require extra SAP notes. Furthermore, see the [troubleshooting section](../sap/sap-deploy-troubleshoot.md) for common issues and resolutions.

**After completion**:

Undeploy the scheduled **Prerequisite checker** iflow once SAP system check was completed successfully. Repeat this sequence for every new SAP system that shall be onboarded.