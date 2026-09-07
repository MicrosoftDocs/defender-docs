---
title: Manage system extensions using Jamf
description: Configure Jamf policies to approve system extensions, grant Full Disk Access, and enable network extensions for Microsoft Defender for Endpoint on macOS.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.reviewer: joshbregman
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-macos
ms.topic: how-to
ms.subservice: macos
ms.date: 07/02/2026
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016
ai-usage: ai-assisted
---

# Manage system extensions using Jamf

This article describes how to use Jamf to approve system extensions, grant Full Disk Access through Privacy Preferences Policy Control, and configure the network extension policy for Microsoft Defender for Endpoint on macOS. Complete the prerequisites for deploying Microsoft Defender for Endpoint before you follow these procedures.

<a name="jamf"></a>
## Configure system extensions in Jamf

<a name="jamf-system-extensions-policy"></a>
### Configure the Jamf system extensions policy

To approve the system extensions, perform the following steps:

1. Select **Computers > Configuration Profiles**, and then select **Options > System Extensions**.

1. Select **Allowed System Extensions** from the **System Extension Types** drop-down list.

1. Use **UBF8T346G9** for Team ID.

1. Add the following bundle identifiers to the **Allowed System Extensions** list:

   - com.microsoft.wdav.epsext
   - com.microsoft.wdav.netext
    
    :::image type="content" source="media/jamf-system-extensions-approval.png" alt-text="Approving system extensions in Jamf." lightbox="media/jamf-system-extensions-approval.png":::

<a name="privacy-preferences-policy-control-also-known-as-full-disk-access"></a>
### Configure Privacy Preferences Policy Control for Full Disk Access

Add the following Jamf payload to grant Full Disk Access to the Microsoft Defender for Endpoint Security Extension. The Privacy Preferences Policy Control payload is a prerequisite for running the extension on your device.

1. Select **Options > Privacy Preferences Policy Control**.

1. Use **com.microsoft.wdav.epsext** as the Identifier and **Bundle ID** as Bundle type.

1. Set Code Requirement to the following value:

   ```text
   identifier com.microsoft.wdav.epsext and anchor apple generic and certificate 1[field.1.2.840.113635.100.6.2.6] /* exists */ and certificate leaf[field.1.2.840.113635.100.6.1.13] /* exists */ and certificate leaf[subject.OU] = UBF8T346G9
   ```

1. Set **App or service** to **SystemPolicyAllFiles** and access to **Allow**.

   :::image type="content" source="media/privacy-preferences-policy-control.png" alt-text="Privacy preferences policy control." lightbox="media/privacy-preferences-policy-control.png":::

<a name="network-extension-policy"></a>
### Configure the Network Extension policy in Jamf

As part of the Endpoint Detection and Response capabilities, Microsoft Defender for Endpoint on macOS inspects socket traffic and reports this information to the Microsoft Defender portal. The following policy allows the network extension to inspect socket traffic and report this information to the Microsoft Defender portal:

> [!NOTE]
> Jamf doesn't have built-in support for content filtering policies, which are a prerequisite for enabling the network extensions that Microsoft Defender for Endpoint on macOS installs on the device. Furthermore, Jamf sometimes changes the content of the policies being deployed. Because of these limitations, the following steps provide a workaround that involves signing the configuration profile.

1. Save the following content to your device as **com.microsoft.network-extension.mobileconfig** using a text editor:

```xml
   <?xml version="1.0" encoding="UTF-8"?><!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1">
    <dict>
        <key>PayloadUUID</key>
        <string>DA2CC794-488B-4AFF-89F7-6686A7E7B8AB</string>
        <key>PayloadType</key>
        <string>Configuration</string>
        <key>PayloadOrganization</key>
        <string>Microsoft Corporation</string>
        <key>PayloadIdentifier</key>
        <string>DA2CC794-488B-4AFF-89F7-6686A7E7B8AB</string>
        <key>PayloadDisplayName</key>
        <string>Microsoft Defender Network Extension</string>
        <key>PayloadDescription</key>
        <string/>
        <key>PayloadVersion</key>
        <integer>1</integer>
        <key>PayloadEnabled</key>
        <true/>
        <key>PayloadRemovalDisallowed</key>
        <true/>
        <key>PayloadScope</key>
        <string>System</string>
        <key>PayloadContent</key>
        <array>
            <dict>
                <key>PayloadUUID</key>
                <string>2BA070D9-2233-4827-AFC1-1F44C8C8E527</string>
                <key>PayloadType</key>
                <string>com.apple.webcontent-filter</string>
                <key>PayloadOrganization</key>
                <string>Microsoft Corporation</string>
                <key>PayloadIdentifier</key>
                <string>CEBF7A71-D9A1-48BD-8CCF-BD9D18EC155A</string>
                <key>PayloadDisplayName</key>
                <string>Approved Network Extension</string>
                <key>PayloadDescription</key>
                <string/>
                <key>PayloadVersion</key>
                <integer>1</integer>
                <key>PayloadEnabled</key>
                <true/>
                <key>FilterType</key>
                <string>Plugin</string>
                <key>UserDefinedName</key>
                <string>Microsoft Defender Network Extension</string>
                <key>PluginBundleID</key>
                <string>com.microsoft.wdav</string>
                <key>FilterSockets</key>
                <true/>
                <key>FilterDataProviderBundleIdentifier</key>
                <string>com.microsoft.wdav.netext</string>
                <key>FilterDataProviderDesignatedRequirement</key>
                <string>identifier "com.microsoft.wdav.netext" and anchor apple generic and certificate 1[field.1.2.840.113635.100.6.2.6] /* exists */ and certificate leaf[field.1.2.840.113635.100.6.1.13] /* exists */ and certificate leaf[subject.OU] = UBF8T346G9</string>
            </dict>
        </array>
    </dict>
</plist>
```

1. Verify that the XML configuration profile content was copied correctly into the **com.microsoft.network-extension.mobileconfig** file by running the **plutil** utility in terminal. This command checks whether the mobileconfig file is a valid property list (plist):

```BashCopy
$ plutil -lint <PathToFile>/com.microsoft.network-extension.mobileconfig
```

For example, the following command validates a profile stored in the *Documents* folder:

```BashCopy
$ plutil -lint ~/Documents/com.microsoft.network-extension.mobileconfig
```

1. Verify that the **plutil -lint** command outputs **OK**. The following sample output confirms the profile file is valid:

```BashCopy
<PathToFile>/com.microsoft.network-extension.mobileconfig: OK
```

1. Follow the instructions in [Jamf technical articles](https://learn.jamf.com/bundle/technical-articles/page/Welcome.html) to create a signing certificate using Jamf's built-in certificate authority.

1. After the Jamf signing certificate is created and installed on your device, run the following command from terminal to sign the configuration profile. Replace `<CertificateName>` with the name of your signing certificate, `<PathToFile>` with the path to the unsigned mobileconfig file, and `<PathToSignedFile>` with the desired output path for the signed file:

```BashCopy
$ security cms -S -N "<CertificateName>" -i <PathToFile>/com.microsoft.network-extension.mobileconfig -o <PathToSignedFile>/com.microsoft.network-extension.signed.mobileconfig
```

For example, the following command signs a profile stored in the *Documents* folder using a certificate named *SigningCertificate* and saves the signed output to the same folder:

```BashCopy
$ security cms -S -N "SigningCertificate" -i ~/Documents/com.microsoft.network-extension.mobileconfig -o ~/Documents/com.microsoft.network-extension.signed.mobileconfig
```

1. From the Jamf portal, navigate to **Configuration Profiles** and select the **Upload** button. Select **com.microsoft.network-extension.signed.mobileconfig** when prompted to choose a configuration profile file to upload.
