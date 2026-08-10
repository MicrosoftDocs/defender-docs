---
title: Enroll Microsoft Defender for Endpoint on macOS devices into Jamf Pro
description: Learn how to enroll macOS devices into Jamf Pro for Microsoft Defender for Endpoint management using enrollment invitations or prestage enrollments.
ms.service: defender-endpoint
author: paulinbar
ms.author: painbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: how-to
ms.subservice: macos
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016

ai-usage: ai-assisted
---
# Enroll Microsoft Defender for Endpoint on macOS devices into Jamf Pro

Learn how to enroll macOS devices into Jamf Pro for centralized management with Microsoft Defender for Endpoint. This article covers two methods—Enrollment Invitations and Prestage Enrollments—and the steps to complete enrollment.

<a name="enroll-macos-devices"></a>
## Choose an enrollment method

There are multiple methods of enrolling macOS devices in Jamf Pro.

This article covers two enrollment methods: Enrollment Invitations and Prestage Enrollments.

- [Method 1:  Enrollment Invitations](#enrollment-method-1-enrollment-invitations)
- [Method 2:  Prestage Enrollments](#enrollment-method-2-prestage-enrollments)

For a complete list, see [About Computer Enrollment](https://docs.jamf.com/9.9/casper-suite/administrator-guide/About_Computer_Enrollment.html).

## Enrollment Method 1: Enrollment Invitations

With this method, you send an email link to device users. They use the link to enroll their macOS device in Jamf Pro.

1. In the Jamf Pro dashboard, navigate to **Enrollment invitations**.

   :::image type="content" source="media/a347307458d6a9bbfa88df7dbe15398f.png" alt-text="The configuration settings1" lightbox="media/a347307458d6a9bbfa88df7dbe15398f.png":::

1. Select **+ New**.

   :::image type="content" source="media/b6c7ad56d50f497c38fc14c1e315456c.png" alt-text="The close up of a logo description automatically generated" lightbox="media/b6c7ad56d50f497c38fc14c1e315456c.png":::

1. Under **Specify Recipients for the Invitation**, in the **Email Addresses** field, enter the recipient email addresses.

    :::image type="content" source="media/718b9d609f9f77c8b13ba88c4c0abe5d.png" alt-text="The configuration settings2" lightbox="media/718b9d609f9f77c8b13ba88c4c0abe5d.png":::

    :::image type="content" source="media/ae3597247b6bc7c5347cf56ab1e820c0.png" alt-text="The configuration settings3" lightbox="media/ae3597247b6bc7c5347cf56ab1e820c0.png":::

    For example: janedoe@contoso.com

    :::image type="content" source="media/4922c0fcdde4c7f73242b13bf5e35c19.png" alt-text="The configuration settings4" lightbox="media/4922c0fcdde4c7f73242b13bf5e35c19.png":::

1. Configure the message for the invitation.

   :::image type="content" source="media/ce580aec080512d44a37ff8e82e5c2ac.png" alt-text="The configuration settings5" lightbox="media/ce580aec080512d44a37ff8e82e5c2ac.png":::

   :::image type="content" source="media/5856b765a6ce677caacb130ca36b1a62.png" alt-text="The configuration settings6" lightbox="media/5856b765a6ce677caacb130ca36b1a62.png":::

   :::image type="content" source="media/3ced5383a6be788486d89d407d042f28.png" alt-text="The configuration settings7" lightbox="media/3ced5383a6be788486d89d407d042f28.png":::

   :::image type="content" source="media/54be9c6ed5b24cebe628dc3cd9ca4089.png" alt-text="The configuration settings8" lightbox="media/54be9c6ed5b24cebe628dc3cd9ca4089.png":::

## Enrollment Method 2: Prestage Enrollments

With this method, new macOS devices enroll in Jamf Pro during initial setup.

1. In the Jamf Pro dashboard, navigate to **Prestage enrollments**.

   :::image type="content" source="media/6fd0cb2bbb0e60a623829c91fd0826ab.png" alt-text="The configuration settings9" lightbox="media/6fd0cb2bbb0e60a623829c91fd0826ab.png":::

1. Follow the instructions in [Computer PreStage Enrollments](https://docs.jamf.com/9.9/casper-suite/administrator-guide/Computer_PreStage_Enrollments.html).

<a name="enroll-macos-device"></a>
## Complete device enrollment on macOS

Complete the following steps on the macOS device to finish enrollment and install the MDM profile.

1. Select **Continue**. In the **System Preferences** window, install the CA certificate.

   :::image type="content" source="media/jamfpro-ca-certificate.png" alt-text="The Jamf Pro enrollment1" lightbox="media/jamfpro-ca-certificate.png":::

1. After the CA certificate installs, go back to the browser window. Select **Continue** to install the MDM profile.

   :::image type="content" source="media/jamfpro-install-mdm-profile.png" alt-text="The Jamf Pro enrollment2" lightbox="media/jamfpro-install-mdm-profile.png":::

1. Select **Allow** to downloads from JAMF.

   :::image type="content" source="media/jamfpro-download.png" alt-text="The Jamf Pro enrollment3" lightbox="media/jamfpro-download.png":::

1. Select **Continue** to proceed with the MDM Profile installation.

   :::image type="content" source="media/jamfpro-install-mdm.png" alt-text="The Jamf Pro enrollment4" lightbox="media/jamfpro-install-mdm.png":::

1. Select **Continue** to install the MDM Profile.

   :::image type="content" source="media/jamfpro-mdm-unverified.png" alt-text="The Jamf Pro enrollment5" lightbox="media/jamfpro-mdm-unverified.png":::

1. Select **Continue**  to complete the configuration.

   :::image type="content" source="media/jamfpro-mdm-profile.png" alt-text="The Jamf Pro enrollment6" lightbox="media/jamfpro-mdm-profile.png":::
   


