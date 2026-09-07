---
title: Enhance Security Psture with Security Recommendations - Microsoft Defender for IoT
description: Learn about how to find security recommendations for devices detected by Microsoft Defender for IoT.
ms.date: 07/03/2026
ms.topic: how-to
ms.custom: msecd-doc-authoring-1016
  - enterprise-iot
  - sfi-image-nochange
ai-usage: ai-assisted
---

# Enhance security posture with security recommendations

Microsoft Defender for IoT provides security recommendations for your network. Use these recommendations to find unhealthy devices. Then build mitigation plans to lower your attack surface and reduce risk in OT/IoT networks.

> [!IMPORTANT]
> The **Recommendations** page is currently in **PREVIEW**. See the [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) for additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

## View security recommendations

To see all current recommendations for your organization, go to the Defender for IoT **Recommendations** page in the Azure portal. For example:

:::image type="content" source="media/recommendations/recommendations.png" alt-text="Screenshot of the Recommendations page on the Azure portal." lightbox="media/recommendations/recommendations.png":::

The **Active recommendations** widget shows how many recommendations need action. Review unhealthy devices regularly and take the suggested actions. Try to keep the number of active recommendations as low as possible.

> [!NOTE]
> Only recommendations that are relevant to your environment are shown in the grid, with at least one healthy or unhealthy device found. You won't see recommendations that aren't related to any devices in your network.

Recommendations are shown in a grid with details in the following columns:

|Column name  |Description  |
|---------|---------|
|**Severity**     | Indicates the urgency of the suggested mitigation step.         |
|**Name**     |  The recommendation's name, which indicates a summary of the suggested mitigation step.  |
|**Unhealthy devices**     | The number of detected devices where the recommended step is relevant.        |
|**Healthy devices**     |   The number of detected devices where the recommended step is covered and no action is required.      |
|**Last update time**     | The last time the recommendation was triggered on a detected device.        |

Do either of the following to modify the recommendation data listed:

- Select :::image type="icon" source="media/how-to-manage-device-inventory-on-the-cloud/edit-columns-icon.png" border="false"::: **Edit columns** to add or remove columns from the grid.
- Filter the list by entering a keyword in the **Search** box. You can also select **Add filter** to filter by any column.

To export a CSV file of all recommendations for your network, select :::image type="icon" source="media/how-to-manage-device-inventory-on-the-cloud/export-button.png" border="false" :::**Export**.

## View recommendation details

Select a recommendation in the grid to see more details. The recommendation name is shown as the page title. The left side shows the severity, the number of unhealthy devices, and the last update time.

On the recommendation details page, the left pane also shows the following information:

- **Description**: More context for the recommended mitigation step
- **Remediation steps**: The full list of mitigation steps recommended for unhealthy devices

Switch between the **Unhealthy devices** and **Healthy devices** tabs to review the statuses of detected devices in your network for the selected recommendation.

For example:

:::image type="content" source="media/release-notes/recommendations.png" alt-text="Screenshot of the Review PLC operating mode recommendation page." lightbox="media/release-notes/recommendations.png":::

### View recommendation details by device

You might want to review all recommendations for a specific device in order to handle them all together.

You can also find recommendations on the **Device details** page for each detected device. To open this page, go to the [**Device inventory** page](how-to-manage-device-inventory-for-organizations.md#view-the-device-inventory). You can also select a device from the healthy or unhealthy devices list on a recommendation details page.

On a device details page, select the **Recommendations** tab to view a list of security recommendations specific for the selected device.

For example:

:::image type="content" source="media/recommendations/recommendations-device-details.png" alt-text="Screenshot of the Recommendations tab on a device details page." lightbox="media/recommendations/recommendations-device-details.png":::

## Supported security recommendations

The following recommendations appear for OT devices in the Azure portal. They are grouped by detection source, starting with OT network sensors:

|Name  |Description  |
|---------|---------|
| **OT network sensors** | |
|**Review PLC operating mode**     | Devices with this recommendation are found with PLCs set to unsecure operating mode states. <br><br>We recommend setting PLC operating modes to the **Secure Run** state if access is no longer required to the PLC to reduce the threat of malicious PLC programming.        |
|**Review unauthorized devices**     | Devices with this recommendation must be identified and authorized as part of the network baseline. <br><br>We recommend taking action to identify any indicated devices. Disconnect any devices from your network that remain unknown even after investigation to reduce the threat of rogue or potentially malicious devices.        |
| **Secure your vulnerable \<vendor> devices** | Devices with this recommendation are found with one or more vulnerabilities with a critical severity and are organized by vendor. <br><br> We recommend that you follow the steps listed by the device vendor or CISA (Cybersecurity & Infrastructure Agency). <br><br> To see required remediation steps: <br><br> 1. Choose a device from the list of unhealthy devices to see its full list of vulnerabilities. <br> 2. From the **Vulnerabilities** tab, choose the link in the **Name** column for the critical CVE you're mitigating. Full details are opened in the NVD (National Vulnerability Database). <br> 3. Scroll to the NVD **References to Advisories, Solutions, and Tools** section and choose any of the listed links for more information. An advisory page opens, either from the vendor or from CISA. <br> 4. Find and perform the remediation steps listed for your scenario. Some vulnerabilities can't be remediated with a patch.  |
| **Set a secure password for devices with missing authentication** | Devices with this recommendation are found without authentication based on successful sign-ins. <br><br> We recommend that you enable authentication, and that you set a stronger password with minimum length and complexity. |
| **Set a stronger password with minimum length and complexity** | Devices with this recommendation are found with weak passwords based on successful sign-ins. <br><br> We recommend that you change the device password to a password that has eight or more characters and that contains characters from 3 of the following categories: <br><br> - Uppercase letters <br> - Lowercase letters <br> - Special characters <br> - Numbers (0-9) |
| **Disable insecure administration protocol**| Devices with this recommendation are exposed to malicious threats because they use Telnet, which isn't a secured and encrypted communication protocol. <br><br>We recommend that you switch to a more secure protocol, such as SSH, disable the server altogether, or apply network access restrictions.|

Additional recommendations not listed in the preceding table might appear on the **Recommendations** page. These recommendations apply to the [Defender for IoT micro agent](../device-builders/index.yml).

The following Defender for Endpoint recommendations apply to Enterprise IoT customers. They're available only in Microsoft 365 Defender:

- **Require authentication for VNC management interface**
- **Disable insecure administration protocol – Telnet**
- **Remove insecure administration protocols SNMP V1 and SNMP V2**
- **Require authentication for VNC management interface**

For more information, see [Security recommendations](/microsoft-365/security/defender-vulnerability-management/tvm-security-recommendation).

## Next step

> [!div class="nextstepaction"]
> [View the device inventory](how-to-manage-device-inventory-for-organizations.md#view-the-device-inventory)