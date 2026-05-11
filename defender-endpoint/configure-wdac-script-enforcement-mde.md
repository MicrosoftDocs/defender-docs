---
title: Allow Microsoft Defender for Endpoint Scripts with WDAC
description: Learn how to configure WDAC script enforcement to allow built-in Microsoft Defender for Endpoint PowerShell scripts to run in FullLanguage mode.
ms.service: defender-endpoint
ms.subservice: asr
ms.localizationpriority: medium
author: chrisda
ms.author: chrisda
ms.topic: how-to
ms.collection:
- m365-security
- tier2
- mde-asr
ms.custom: msecd-doc-authoring-1012
ms.date: 05/11/2026
appliesto:
- Microsoft Defender for Endpoint Plan 1 and Plan 2
- Microsoft Defender XDR
ai-usage: ai-assisted
#customer intent: As an admin, I want to configure WDAC script enforcement to allow built-in Microsoft Defender for Endpoint PowerShell scripts so that MDE features like vulnerability management and device discovery work correctly.
---

# Allow Microsoft Defender for Endpoint scripts with WDAC script enforcement

This article explains how to configure allow rules in Windows Defender Application Control (WDAC), also known as [App Control for Business](/windows/security/application-security/application-control/app-control-for-business/appcontrol), to let built-in Microsoft Defender for Endpoint PowerShell scripts run in **FullLanguage** mode. Without the appropriate WDAC allow rules, MDE features that rely on PowerShell scripts don't work as expected.

## Applies to

- Windows 10 or later
- Windows Server 2019 or later
- Devices onboarded to Microsoft Defender for Endpoint with WDAC script enforcement enabled
- Minimum Defender for Endpoint sensor version: **10.8804 or later**

## Overview

When the **ConstrainedLanguageCompatible** capability is enabled, Microsoft Defender for Endpoint adjusts how it invokes PowerShell to remain compatible with PowerShell Constrained Language Mode (CLM) that WDAC enforces.

With the appropriate WDAC allow rules in place, trusted PowerShell scripts can run in **FullLanguage** mode while WDAC script enforcement remains enabled.

This article explains how to:

- Allow built-in Microsoft Defender for Endpoint PowerShell scripts.
- Create certificate-based (Publisher) allow rules (recommended).
- Create path-based allow rules (use only when necessary).

## Before you begin

- Use the least permissive rule that meets your requirement. Prefer **Publisher (certificate-based)** rules over path-based rules.
- Plan how you update and re-sign your WDAC policy if it's signed.
- Deploy and validate all changes in a pilot device group before you enforce them broadly.

> [!WARNING]
> Broad path-based allow rules can weaken your security posture. Avoid user-writable locations and wide wildcards.

## Allow built-in Defender for Endpoint PowerShell scripts

Microsoft Defender for Endpoint uses built-in PowerShell scripts for several capabilities, including:

- [Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Device discovery](device-discovery.md)
- [Security configuration management](manage-security-policies.md)

To allow these scripts to run in **FullLanguage** mode when WDAC script enforcement is enabled, add the following **Signer**, **Publisher**, and **TBS** configuration to your WDAC policy under the `<Signers>` section:

> [!NOTE]
> TBS (To Be Signed) refers to the hash of the to-be-signed portion of a code-signing certificate. WDAC uses this value to uniquely identify issuing certificate authorities in signer rules.

```xml
<Signer Name="Microsoft Code Signing PCA 2011" ID="ID_SIGNER_S_0">
  <CertRoot Type="TBS" Value="F6F717A43AD9ABDDC8CEFDDE1C505462535E7D1307E630F9544A2D14FE8BF26E" />
  <CertPublisher Value="Microsoft Windows Defender Advanced Threat Protection" />
</Signer>
```

> [!NOTE]
> This signer configuration is intended only for built-in Microsoft Defender for Endpoint script content.

The following sample XML file shows a WDAC policy with the MDE signer included:

```xml
<?xml version="1.0" encoding="utf-8"?>
<SiPolicy xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="urn:schemas-microsoft-com:sipolicy">
  <VersionEx>10.3.0.0</VersionEx>
  <PolicyTypeID>{A244370E-44C9-4C06-B551-F6016E563076}</PolicyTypeID>
  <PlatformID>{2E07F7E4-194C-4D20-B7C9-6F44A6C5A234}</PlatformID>
  <Rules>
    <Rule>
      <Option>Enabled:Unsigned System Integrity Policy</Option>
    </Rule>
    <Rule>
      <Option>Enabled:Advanced Boot Options Menu</Option>
    </Rule>
    <Rule>
      <Option>Enabled:UMCI</Option>
    </Rule>
    <Rule>
      <Option>Enabled:Inherit Default Policy</Option>
    </Rule>
    <Rule>
      <Option>Enabled:Update Policy No Reboot</Option>
    </Rule>
    <Rule>
      <Option>Enabled:Revoked Expired As Unsigned</Option>
    </Rule>
    <Rule>
      <Option>Required:WHQL</Option>
    </Rule>
  </Rules>
  <EKUs>
    <EKU ID="ID_EKU_WINDOWS" Value="010A2B0601040182370A0306" FriendlyName="Windows EKU - 1.3.6.1.4.1.311.10.3.6" />
    <EKU ID="ID_EKU_WHQL" Value="010A2B0601040182370A0305" FriendlyName="WHQL EKU - 1.3.6.1.4.1.311.10.3.5" />
    <EKU ID="ID_EKU_ELAM" Value="010A2B0601040182373D0401" FriendlyName="Early Launch AntiMalware EKU - 1.3.6.1.4.1.311.61.4.1" />
    <EKU ID="ID_EKU_HAL_EXT" Value="010A2B0601040182373D0501" FriendlyName="Hardware Abstraction Layer EKU - 1.3.6.1.4.1.311.61.5.1" />
    <EKU ID="ID_EKU_RT_EXT" Value="010A2B0601040182370A0315" FriendlyName="Windows RT EKU - 1.3.6.1.4.1.311.10.3.21" />
    <EKU ID="ID_EKU_STORE" Value="010A2B0601040182374C0301" FriendlyName="Windows Store EKU - 1.3.6.1.4.1.311.76.3.1" />
    <EKU ID="ID_EKU_DCODEGEN" Value="010A2B0601040182374C0501" FriendlyName="Dynamic Code Generation EKU - 1.3.6.1.4.1.311.76.5.1" />
    <EKU ID="ID_EKU_AM" Value="010A2B0601040182374C0B01" FriendlyName="AntiMalware EKU - 1.3.6.1.4.1.311.76.11.1" />
    <EKU ID="ID_EKU_ENCLAVE" Value="010A2B0601040182370A032A" FriendlyName="Enclave EKU - 1.3.6.1.4.1.311.10.3.42" />
  </EKUs>
  <FileRules>
    <FileAttrib ID="ID_FILEATTRIB_REFRESH_POLICY" FriendlyName="RefreshPolicy.exe FileAttribute" FileName="RefreshPolicy.exe" MinimumFileVersion="10.0.19042.0" />
  </FileRules>
  <Signers>
    <Signer Name="Microsoft Code Signing PCA 2011" ID="ID_SIGNER_S_0">
      <CertRoot Type="TBS" Value="F6F717A43AD9ABDDC8CEFDDE1C505462535E7D1307E630F9544A2D14FE8BF26E" />
      <CertPublisher Value="Microsoft Windows Defender Advanced Threat Protection" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 Windows EKU" ID="ID_SIGNER_WINDOWS_PRODUCTION">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_WINDOWS" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 ELAM EKU" ID="ID_SIGNER_ELAM_PRODUCTION">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_ELAM" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 HAL EKU" ID="ID_SIGNER_HAL_PRODUCTION">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_HAL_EXT" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 WHQL EKU" ID="ID_SIGNER_WHQL_SHA2">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Product Root WHQL EKU SHA1" ID="ID_SIGNER_WHQL_SHA1">
      <CertRoot Type="Wellknown" Value="05" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Product Root WHQL EKU MD5" ID="ID_SIGNER_WHQL_MD5">
      <CertRoot Type="Wellknown" Value="04" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 Windows EKU" ID="ID_SIGNER_WINDOWS_PRODUCTION_USER">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_WINDOWS" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 ELAM EKU" ID="ID_SIGNER_ELAM_PRODUCTION_USER">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_ELAM" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 HAL EKU" ID="ID_SIGNER_HAL_PRODUCTION_USER">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_HAL_EXT" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 WHQL EKU" ID="ID_SIGNER_WHQL_SHA2_USER">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Product Root WHQL EKU SHA1" ID="ID_SIGNER_WHQL_SHA1_USER">
      <CertRoot Type="Wellknown" Value="05" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 Windows EKU" ID="ID_SIGNER_WINDOWS_FLIGHT_ROOT">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_WINDOWS" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 ELAM EKU" ID="ID_SIGNER_ELAM_FLIGHT">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_ELAM" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 HAL EKU" ID="ID_SIGNER_HAL_FLIGHT">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_HAL_EXT" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 WHQL EKU" ID="ID_SIGNER_WHQL_FLIGHT_SHA2">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 Windows EKU" ID="ID_SIGNER_WINDOWS_FLIGHT_ROOT_USER">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_WINDOWS" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 ELAM EKU" ID="ID_SIGNER_ELAM_FLIGHT_USER">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_ELAM" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 HAL EKU" ID="ID_SIGNER_HAL_FLIGHT_USER">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_HAL_EXT" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 WHQL EKU" ID="ID_SIGNER_WHQL_FLIGHT_SHA2_USER">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Product Root WHQL EKU MD5" ID="ID_SIGNER_WHQL_MD5_USER">
      <CertRoot Type="Wellknown" Value="04" />
      <CertEKU ID="ID_EKU_WHQL" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 Store EKU" ID="ID_SIGNER_STORE_FLIGHT_ROOT">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_STORE" />
    </Signer>
    <Signer Name="Microsoft MarketPlace PCA 2011" ID="ID_SIGNER_STORE">
      <CertRoot Type="TBS" Value="FC9EDE3DCCA09186B2D3BF9B738A2050CB1A554DA2DCADB55F3F72EE17721378" />
      <CertEKU ID="ID_EKU_STORE" />
    </Signer>
    <Signer Name="Microsoft Product Root 2010 RT EKU" ID="ID_SIGNER_RT_PRODUCTION">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_RT_EXT" />
    </Signer>
    <Signer Name="Microsoft Flighting Root 2014 RT EKU" ID="ID_SIGNER_RT_FLIGHT">
      <CertRoot Type="Wellknown" Value="0E" />
      <CertEKU ID="ID_EKU_RT_EXT" />
    </Signer>
    <Signer Name="Microsoft Standard Root 2011 RT EKU" ID="ID_SIGNER_RT_STANDARD">
      <CertRoot Type="Wellknown" Value="07" />
      <CertEKU ID="ID_EKU_RT_EXT" />
    </Signer>
    <Signer Name="MincryptKnownRootMicrosoftTestRoot2010" ID="ID_SIGNER_TEST2010">
      <CertRoot Type="Wellknown" Value="0A" />
    </Signer>
    <Signer Name="MincryptKnownRootMicrosoftTestRoot2010" ID="ID_SIGNER_TEST2010_USER">
      <CertRoot Type="Wellknown" Value="0A" />
    </Signer>
    <Signer Name="MincryptKnownRootMicrosoftDMDRoot2005" ID="ID_SIGNER_DRM">
      <CertRoot Type="Wellknown" Value="0C" />
    </Signer>
    <Signer Name="MincryptKnownRootMicrosoftProductRoot2010" ID="ID_SIGNER_DCODEGEN">
      <CertRoot Type="Wellknown" Value="06" />
      <CertEKU ID="ID_EKU_DCODEGEN" />
    </Signer>
    <Signer Name="MincryptKnownRootMicrosoftStandardRoot2011" ID="ID_SIGNER_AM">
      <CertRoot Type="Wellknown" Value="07" />
      <CertEKU ID="ID_EKU_AM" />
    </Signer>
    <Signer Name="Microsoft Standard Root 2011 Enclave EKU" ID="ID_SIGNER_ENCLAVE">
      <CertRoot Type="Wellknown" Value="07" />
      <CertEKU ID="ID_EKU_ENCLAVE" />
    </Signer>
    <Signer Name="Microsoft Code Signing PCA 2011" ID="ID_SIGNER_MICROSOFT_REFRESH_POLICY">
      <CertRoot Type="TBS" Value="F6F717A43AD9ABDDC8CEFDDE1C505462535E7D1307E630F9544A2D14FE8BF26E" />
      <CertPublisher Value="Microsoft Corporation" />
      <FileAttribRef RuleID="ID_FILEATTRIB_REFRESH_POLICY" />
    </Signer>
  </Signers>
  <SigningScenarios>
    <SigningScenario ID="ID_SIGNINGSCENARIO_KMCI" FriendlyName="Kernel Mode Signing Scenario" Value="131">
      <ProductSigners>
        <AllowedSigners>
          <AllowedSigner SignerId="ID_SIGNER_WINDOWS_PRODUCTION" />
          <AllowedSigner SignerId="ID_SIGNER_ELAM_PRODUCTION" />
          <AllowedSigner SignerId="ID_SIGNER_HAL_PRODUCTION" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_SHA2" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_SHA1" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_MD5" />
          <AllowedSigner SignerId="ID_SIGNER_WINDOWS_FLIGHT_ROOT" />
          <AllowedSigner SignerId="ID_SIGNER_ELAM_FLIGHT" />
          <AllowedSigner SignerId="ID_SIGNER_HAL_FLIGHT" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_FLIGHT_SHA2" />
          <AllowedSigner SignerId="ID_SIGNER_TEST2010" />
        </AllowedSigners>
      </ProductSigners>
    </SigningScenario>
    <SigningScenario ID="ID_SIGNINGSCENARIO_UMCI" FriendlyName="User Mode Signing Scenario" Value="12">
      <ProductSigners>
        <AllowedSigners>
          <AllowedSigner SignerId="ID_SIGNER_S_0" />
          <AllowedSigner SignerId="ID_SIGNER_WINDOWS_PRODUCTION_USER" />
          <AllowedSigner SignerId="ID_SIGNER_ELAM_PRODUCTION_USER" />
          <AllowedSigner SignerId="ID_SIGNER_HAL_PRODUCTION_USER" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_SHA2_USER" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_SHA1_USER" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_MD5_USER" />
          <AllowedSigner SignerId="ID_SIGNER_WINDOWS_FLIGHT_ROOT_USER" />
          <AllowedSigner SignerId="ID_SIGNER_ELAM_FLIGHT_USER" />
          <AllowedSigner SignerId="ID_SIGNER_HAL_FLIGHT_USER" />
          <AllowedSigner SignerId="ID_SIGNER_WHQL_FLIGHT_SHA2_USER" />
          <AllowedSigner SignerId="ID_SIGNER_STORE" />
          <AllowedSigner SignerId="ID_SIGNER_STORE_FLIGHT_ROOT" />
          <AllowedSigner SignerId="ID_SIGNER_RT_PRODUCTION" />
          <AllowedSigner SignerId="ID_SIGNER_DRM" />
          <AllowedSigner SignerId="ID_SIGNER_DCODEGEN" />
          <AllowedSigner SignerId="ID_SIGNER_AM" />
          <AllowedSigner SignerId="ID_SIGNER_RT_FLIGHT" />
          <AllowedSigner SignerId="ID_SIGNER_RT_STANDARD" />
          <AllowedSigner SignerId="ID_SIGNER_ENCLAVE" />
          <AllowedSigner SignerId="ID_SIGNER_MICROSOFT_REFRESH_POLICY" />
          <AllowedSigner SignerId="ID_SIGNER_TEST2010_USER" />
        </AllowedSigners>
      </ProductSigners>
    </SigningScenario>
  </SigningScenarios>
  <UpdatePolicySigners />
  <CiSigners>
    <CiSigner SignerId="ID_SIGNER_S_0" />
    <CiSigner SignerId="ID_SIGNER_STORE" />
  </CiSigners>
  <HvciOptions>0</HvciOptions>
  <Settings>
    <Setting Provider="PolicyInfo" Key="Information" ValueName="Name">
      <Value>
        <String>WindowsWorks_2026-03-25</String>
      </Value>
    </Setting>
    <Setting Provider="PolicyInfo" Key="Information" ValueName="Id">
      <Value>
        <String>2026-03-25</String>
      </Value>
    </Setting>
  </Settings>
</SiPolicy>
```

## Create certificate-based allow rules (recommended)

Certificate-based (Publisher) allow rules trust content that's signed by a specific code-signing certificate chain. Certificate-based rules provide the best balance of security and maintainability.

### Step 1: Identify the signer

Use PowerShell to inspect the digital signature of the file you want to allow (for example, the script host or executable that invokes the script):

```powershell
Get-AuthenticodeSignature -FilePath "C:\Path\To\File.exe" | Format-List
```

Record the certificate thumbprint and the Publisher attributes you plan to scope to (for example, PublisherName, ProductName, or BinaryName).

### Step 2: Add a Publisher allow rule

Use one of the following methods to add a Publisher allow rule:

- **App Control Policy Wizard (recommended):** Open your policy and add an **Allow** rule by **Publisher**, scoping it as narrowly as possible.
- **PowerShell (ConfigCI):** Use the [ConfigCI cmdlets](/powershell/module/configci/) to add a Publisher rule to your policy XML, then convert it to a binary policy.

> [!NOTE]
> When you use the [App Control Policy Wizard](/windows/security/application-security/application-control/app-control-for-business/design/appcontrol-wizard), you can add the MDE publisher during the **Policy Signing Rules List** step. Select **Add Custom**, and then add an **Allow Publisher UserMode Rule Type** that references one of the PowerShell scripts signed by MDE.
>
> PowerShell scripts signed with the `Microsoft Windows Defender Advanced Threat Protection` publisher are available on any MDE onboarded device in the following folder:
>
> `C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\DataCollection`
>
> The PsExec tool is required to start a command shell with SYSTEM account context to access this protected folder.

### Step 3: Re-sign and deploy the policy

To finish the certificate-based rule setup:

1. Re-sign the policy if it's configured as a signed WDAC policy.
1. Deploy the updated policy using your standard deployment method (for example, Microsoft Intune, Group Policy, or Configuration Manager).

## Create path-based allow rules (use only when necessary)

Path-based allow rules trust all content in a specific folder. Use path-based rules only when certificate-based rules aren't feasible, such as for unsigned line-of-business scripts that you fully control.

### Step 1: Choose the minimal folder path

Identify the exact folder that contains the required script content. Avoid root-level paths and user-writable locations.

Common Microsoft Defender for Endpoint script locations include:

```text
C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\DataCollection
```

### Step 2: Add a path allow rule

Use one of the following methods to add a path allow rule:

- **App Control Policy Wizard:** Add an **Allow** rule by path (for example, `C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\DataCollection\*`) and export the updated policy.
- **PowerShell (ConfigCI):** Use the [ConfigCI cmdlets](/powershell/module/configci/) to add a file path rule to the policy XML.

### Step 3: Re-sign and deploy the updated policy

To finish the path-based rule setup:

1. Re-sign the policy if required.
1. Deploy the updated policy to target devices.

## Security best practices

- Prefer Publisher (certificate-based) allow rules over path-based rules.
- Scope allow rules as narrowly as possible (specific Publisher, Product, or Binary when available).
- Avoid user-writable paths and broad wildcards (for example, `C:\Users\*\Downloads\*`).
- Track who requested each allow rule, the business justification, and an expiration or review date.
- Validate all changes in a pilot ring before you enforce them broadly.

## Related content

- [App Control for Business overview](/windows/security/application-security/application-control/app-control-for-business/appcontrol)
- [ConfigCI PowerShell cmdlets](/powershell/module/configci/)
- [App Control Policy Wizard](/windows/security/application-security/application-control/app-control-for-business/design/appcontrol-wizard)
- [Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Device discovery](device-discovery.md)
- [Security configuration management](manage-security-policies.md)
- [AMSI integration with Microsoft Defender Antivirus](amsi-on-mdav.md)
- [Understand and use attack surface reduction](overview-attack-surface-reduction.md)
