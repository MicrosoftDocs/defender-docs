---
title: How to use DKIM for email in your custom domain
author: chrisda
ms.author: chrisda
ms.date: 05/22/2026
ms.topic: how-to

ms.localizationpriority: high
ms.assetid: 56fee1c7-dc37-470e-9b09-33fff6d94617
ms.collection:
  - m365-security
  - tier1
ms.custom:
  - seo-marvel-apr2020
description: Learn how Microsoft 365 uses DomainKeys Identified Mail (DKIM) to sign outbound mail, and how to configure DKIM signing of outbound mail using custom domains.
ms.service: defender-office-365
appliesto:
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/eop-about" target="_blank">Built-in security features for all cloud mailboxes</a>
  - ✅ <a href="https://learn.microsoft.com/defender-office-365/mdo-about#defender-for-office-365-plan-1-vs-plan-2-cheat-sheet" target="_blank">Microsoft Defender for Office 365 Plan 1 and Plan 2</a>
  - ✅ <a href="https://learn.microsoft.com/defender-xdr/microsoft-365-defender" target="_blank">Microsoft Defender XDR</a>
#customer intent: As an IT administrator responsible for Microsoft 365 email delivery and security, I want step-by-step instructions to configure, verify, rotate, and troubleshoot DKIM for custom domains so I can prevent spoofing and ensure reliable message authentication.
---

# Set up DKIM to sign mail from your cloud domain

[!INCLUDE [MDO Trial banner](../includes/mdo-trial-banner.md)]

DomainKeys Identified Mail (DKIM) is a method of [email authentication](email-authentication-about.md) that helps validate mail sent from your Microsoft 365 organization to prevent spoofed senders that are used in business email compromise (BEC), ransomware, and other phishing attacks.

The primary purpose of DKIM is to verify that a message wasn't altered in transit. Specifically:

1. One or more private keys are generated for a domain and are used by the source email system to digitally sign important parts of outbound messages. These message parts include:
   - From, To, Subject, MIME-Version, Content-Type, Date, and other message header fields (depending on the source email system).
   - The message body.
2. The digital signature is stored in the **DKIM-Signature** header field in the message header and remains valid as long as intermediate email systems don't modify the signed parts of the message. The signing domain is identified by the **d=** value in the **DKIM-Signature** header field.
3. The corresponding public keys are stored in DNS records for the signing domain (CNAME records in Microsoft 365; other email systems might use TXT records).
4. Destination email systems use the **d=** value in the **DKIM-Signature** header field to:
   - Identify the signing domain.
   - Look up the public key in the DKIM DNS record for the domain.
   - Use the public key in the DKIM DNS record for the domain to verify the message signature.

Important facts about DKIM:

- The domain that's used to DKIM sign the message isn't required to match the domain in the MAIL FROM or From addresses in the message. For more information about these addresses, see [Why internet email needs authentication](email-authentication-about.md#why-internet-email-needs-authentication).
- A message can have multiple DKIM signatures by different domains. In fact, many hosted email services sign the message using the service domain, and then sign the message again using the customer domain after the customer configures DKIM signing for the domain.

Before you get started, here's what you need to know about DKIM in Microsoft 365 based on your email domain:

- **If you use only the Microsoft Online Email Routing Address (MOERA) domain for email (for example, contoso.onmicrosoft.com)**: You don't need to do anything. Outbound messages from senders in the contoso.onmicrosoft.com domain are automatically DKIM signed by the contoso.onmicrosoft.com domain.

  However, you can also manually configure DKIM signing using the \*.onmicrosoft.com domain. For instructions, see the [Use the Defender portal to customize DKIM signing of outbound messages using the \*.onmicrosoft.com domain](#use-the-defender-portal-to-customize-dkim-signing-of-outbound-messages-using-the-onmicrosoftcom-domain) section later in this article.

  To verify outbound messages from senders in the initial \*.onmicrosoft.com domain are DKIM signed, see the [Verify DKIM signing of outbound mail from Microsoft 365](#verify-dkim-signing-of-outbound-mail-from-microsoft-365) section later in this article.

  For more information about \*.onmicrosoft.com domains, see [Why do I have an "onmicrosoft.com" domain?](/microsoft-365/admin/setup/domains-faq#why-do-i-have-an--onmicrosoft-com--domain).

- **If you use one or more custom domains for email (for example, contoso.com)**: Currently, no DKIM signing occurs for outbound mail from custom domains, so you need to do the following steps for maximum email protection:
  - **Configure DKIM signing using custom domains or subdomains**: A message needs to be DKIM signed by the domain in the From address. We also recommend configuring DMARC, and DKIM passes DMARC validation only if the domain that DKIM signed the message and the domain in the From address align.

  - **Subdomain considerations**:
    - For email services that aren't under your direct control (for example, bulk email services), we recommend using a subdomain (for example, marketing.contoso.com) instead of your main email domain (for example, contoso.com). You don't want issues with mail sent from those email services to affect the reputation of mail sent by users in your main email domain. For more information about adding subdomains, see [Can I add custom subdomains or multiple domains to Microsoft 365?](/microsoft-365/admin/setup/domains-faq#can-i-add-custom-subdomains-or-multiple-domains-to-microsoft-365).
    - Each subdomain you use to send email from Microsoft 365 requires its own DKIM configuration.

      > [!TIP]
      > Email authentication protection for _undefined_ subdomains is covered by DMARC. Any subdomains (defined or not) inherit the DMARC settings of the parent domain (which can be overridden per subdomain). For more information, see [Set up DMARC to validate the From address domain for cloud senders](email-authentication-dmarc-configure.md).

  - **If you own registered but unused domains**: If you own registered domains that aren't used for email or anything at all (also known as _parked domains_), don't publish DKIM records for those domains. The lack of a DKIM record (hence, the lack of a public key in DNS to validate the message signature) prevents DKIM validation of forged domains.

- **DKIM alone is not enough**. For the best level of email protection for your custom domains, you also need to configure SPF and DMARC as part of your overall [email authentication](email-authentication-about.md) strategy. For more information, see the [Next Steps](#next-steps) section at the end of this article.

The rest of this article describes the DKIM CNAME records you need to create for custom domains in Microsoft 365 and configuration procedures for DKIM using custom domains.

> [!TIP]
> Configuring DKIM signing using a custom domain is a mixture of procedures in Microsoft 365 and procedures at the domain registrar of the custom domain.
>
> We provide instructions to create CNAME records for different Microsoft 365 services at many domain registrars. You can use these instructions as a starting point to create the DKIM CNAME records. For more information, see [Connect your domain by adding DNS records](/Microsoft-365/admin/get-help-with-domains/create-dns-records-at-any-dns-hosting-provider).
>
> If you're unfamiliar with DNS configuration, contact your domain registrar and ask for help.

## Syntax for DKIM CNAME records

DKIM is exhaustively described in [RFC 6376](https://datatracker.ietf.org/doc/html/rfc6376).

In Microsoft 365, two public-private key pairs are generated when DKIM signing using a custom domain or subdomain is enabled. The private keys that are used to sign the message are inaccessible. The CNAME records point to the corresponding public keys that are used to verify the DKIM signature. These records are known as _selectors_.

- Only one selector is active and used when DKIM signing using a custom domain is enabled.
- The other selector is inactive. It's activated and used only after any future [DKIM key rotation](#rotate-dkim-keys), and then only after the original selector is deactivated.

The selector used to verify the DKIM signature (which infers the private key used to sign the message) is stored in the **s=** value in the **DKIM-Signature** header field (for example, `s=selector1-contoso-com`).

> [!IMPORTANT]
> Use the Defender portal or Exchange Online PowerShell to view the required CNAME values for DKIM signing of outbound messages using a custom domain. **The values presented in this article are for illustration only**. To get the required values for your custom domains or subdomains, use the procedures later in this article.

The basic syntax of the DKIM CNAME records for custom domains that send mail from Microsoft 365 is:

```text
Hostname: selector1._domainkey
Points to address or value: selector1-<CustomDomainWithDashes>._domainkey.<InitialDomainPrefix>.<DynamicPartitionCharacter>-v1.dkim.mail.microsoft

Hostname: selector2._domainkey
Points to address or value: selector2-<CustomDomainWithDashes>._domainkey.<InitialDomainPrefix>.<DynamicPartitionCharacter>-v1.dkim.mail.microsoft
```

- **Hostname**: The values are the same for all Microsoft 365 organizations: `selector1._domainkey` and `selector2._domainkey`.
- **\<CustomDomainWithDashes\>**: The custom domain or subdomain with periods replaced by dashes. For example, `contoso.com` becomes `contoso-com`, or `marketing.contoso.com` becomes `marketing-contoso-com`.
- **\<InitialDomainPrefix\>**: The custom part of the \*.onmicrosoft.com you used to enroll in Microsoft 365. For example, if you used `contoso.onmicrosoft.com`, the value is `contoso`.
- **\<DynamicPartitionCharacter\>**: A dynamically generated character that's used for both selectors (for example, r or n). The value is automatically assigned by Microsoft when you add a new custom domain and enable DKIM. The value is determined by Microsoft's internal routing logic and isn't configurable.
  - **This value is part of the updated DKIM record format for new custom domains in Microsoft 365 introduced in May 2025**. Existing custom domains and initial domains continue to use the old DKIM format:

    ```text
    Hostname: selector1._domainkey
    Points to address or value: selector1-contoso-com._domainkey.contoso.onmicrosoft.com

    Hostname: selector2._domainkey
    Points to address or value: selector2-contoso-com._domainkey.contoso.onmicrosoft.com
    ```

  - **The old and new formats can't coexist for the same selector**. To retrieve the correct DKIM CNAME values for a domain, including the assigned \<DynamicPartitionCharacter\> value, replace contoso.com with the domain value, and then run the following command in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell):

    ```powershell
    Get-DkimSigningConfig -Identity contoso.com | Format-List Name,Enabled,Status,Selector1CNAME,Selector2CNAME
    ```

- **v1**: The current CNAME format version that's used for both selectors.
- **dkim.mail.microsoft**: The parent DNS zone that's the same for both selectors.

For example, your organization has the following domains in Microsoft 365:

- **Initial domain**: cohovineyardandwinery.onmicrosoft.com
- **Custom domains**: cohovineyard.com and cohowinery.com

You need to create two CNAME records in DNS in each custom domain, for a total of four CNAME records:

- <u>CNAME records in the cohovineyard.com domain</u>:

  **Hostname**: `selector1._domainkey`<br>
  **Points to address or value**: `selector1-cohovineyard-com._domainkey.cohovineyardandwinery.n-v1.dkim.mail.microsoft`

  **Hostname**: `selector2._domainkey`<br>
  **Points to address or value**: `selector2-cohovineyard-com._domainkey.cohovineyardandwinery.n-v1.dkim.mail.microsoft`

- <u>CNAME records in the cohowinery.com domain</u>:

  **Hostname**: `selector1._domainkey`<br>
  **Points to address or value**: `selector1-cohowinery-com._domainkey.cohovineyardandwinery.r-v1.dkim.mail.microsoft`

  **Hostname**: `selector2._domainkey`<br>
  **Points to address or value**: `selector2-cohowinery-com._domainkey.cohovineyardandwinery.r-v1.dkim.mail.microsoft`

## Configure DKIM signing of outbound messages in Microsoft 365

### Use the Defender portal to enable DKIM signing of outbound messages using a custom domain

> [!TIP]
> You can use a custom domain or subdomain to DKIM sign outbound mail only after the domain is successfully added to Microsoft 365. For instructions, see [Add a domain](/microsoft-365/admin/setup/add-domain#add-a-domain).
>
> The main factor that determines when a custom domain starts DKIM signing outbound mail is the CNAME record detection in DNS.

To use the procedures in this section, the custom domain or subdomain must exist on the **DKIM** tab of the **Email authentication settings** page at <https://security.microsoft.com/authentication?viewid=DKIM>. The properties of the domain on the **DKIM** tab must contain the following values:

- The **Toggle** value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled**.
- The **Status** value is **NoDKIMKeys**.

:::image type="content" source="media/email-auth-dkim-domain-list-disabled-no-keys.png" alt-text="Screenshot of the the DKIM tab of the Email authentication page in the Defender portal with the Status value NoDKIMKeys and the Toggle value Disable highlighted." lightbox="media/email-auth-dkim-domain-list-disabled-no-keys.png":::

> [!TIP]
> In the details flyout of the domain, these same values are indicated by the following settings:
>
> - The **Status** value is **No DKIM keys saved for this domain**.
> - **Create DKIM keys** is present at the bottom of the flyout.
>
> :::image type="content" source="media/email-auth-dkim-domain-properties-create-dkim-custom.png" alt-text="Screenshot of the domain details flyout of a custom domain showing the Status value No DKIM keys saved for this domain and the Create DKIM keys button." lightbox="media/email-auth-dkim-domain-properties-create-dkim-custom.png":::

Proceed if the domain meets these requirements.

1. In the Defender portal at <https://security.microsoft.com>, go to **Email & collaboration** \> **Policies & rules** \> **Threat policies** \> **Email authentication settings** page. Or, to go directly to the **Email authentication settings** page, use <https://security.microsoft.com/authentication>.

2. On the **Email authentication settings** page, select the **DKIM** tab.

3. On the **DKIM** tab, in the row for the custom domain or subdomain entry, try to slide the **Toggle** value from :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled** to **Enabled**.

4. A **Client error** dialog opens. The error contains the required values to use in the two CNAME records you create at the domain registrar for the domain along with a lot of other text. Although you can select the text and press **CTRL** + **C** to save the information, the same information is available in a much better format in a later step.

   Select **OK** in the dialog to proceed.

5. Back on the **DKIM** tab, the **Status** value of the domain is now **CnameMissing** and the **Toggle** value is still :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled**.

   Click anywhere in the row other than the check box next to the **Name** value or on the **Toggle** value to open the details flyout for the domain.

6. In the domain details flyout that opens, do the following steps:
   - Note the **Last checked date** value.
   - Note the required CNAME record values in the **Publish CNAMEs** section and/or select **Copy**. You use these values in the next step.

   Leave the domain details flyout open.

   :::image type="content" source="media/email-auth-dkim-domain-properties-rotate-dkim-unavailable-custom.png" alt-text="Screenshot of the domain details flyout for a custom domain with DKIM signing disabled, the Publish CNAMEs section populated, and Rotate DKIM keys visible but grayed out." lightbox="media/email-auth-dkim-domain-properties-rotate-dkim-unavailable-custom.png":::

7. In another browser tab or window, go to the domain registrar for the domain, and then create the two CNAME records using the information from the previous step.

   We provide instructions to create CNAME records for different Microsoft 365 services at many domain registrars. You can use these instructions as a starting point to create the DKIM CNAME records. For more information, see [Connect your domain by adding DNS records](/Microsoft-365/admin/get-help-with-domains/create-dns-records-at-any-dns-hosting-provider).

   It takes a few minutes (or possibly longer) for Microsoft 365 to detect the new CNAME records you created.

8. After a while, return to the domain details flyout you left open in Step 6, and then select the **Sign messages for this domain with DKIM signatures** toggle.

   After a few seconds, a **security** dialog with the following text opens:

   > It may take several minutes to synchronize the status change.

   After you select **OK** to close the dialog, the following settings are shown on the domain details flyout **if** the CNAME records are detected at your domain registrar:

   - The **Sign messages for this domain with DKIM signatures** toggle is :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Enabled**.
   - The **Status** value is **Signing DKIM signatures for this domain**.
   - **Rotate DKIM keys** is available.
   - **Last checked date**: The date and time should be more recent than the original value in Step 4.

   :::image type="content" source="media/email-auth-dkim-domain-properties-rotate-dkim-available-custom.png" alt-text="Screenshot of the domain details flyout for a custom domain after DKIM is enabled for the domain." lightbox="media/email-auth-dkim-domain-properties-rotate-dkim-available-custom.png":::

### Use the Defender portal to customize DKIM signing of outbound messages using the \*.onmicrosoft.com domain

As described earlier in this article, outbound mail from senders in the initial \*.onmicrosoft.com domain is automatically DKIM signed by the initial \*.onmicrosoft.com domain. But, you can use the procedures in this section to affect DKIM signing using the \*.onmicrosoft.com domain:

- Generate new keys. The new keys are automatically added and used in the Microsoft 365 datacenters.
- Have the properties of the \*.onmicrosoft.com domain appear correctly in the details flyout of the domain on the **DKIM** tab of the **Email authentication settings** page at <https://security.microsoft.com/authentication?viewid=DKIM> or in PowerShell. This result allows future operations on the DKIM configuration for the domain (for example, [manual key rotation](#rotate-dkim-keys)).

To use the procedures in this section, the \*.onmicrosoft.com must appear on the **DKIM** tab of the **Email authentication settings** page at <https://security.microsoft.com/authentication?viewid=DKIM>. The properties of the domain on the **DKIM** tab must contain the following values:

- The **Toggle** value is :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled**.
- The **Status** value is **NoDKIMKeys**.

Proceed if the domain meets these requirements.

1. In the Defender portal at <https://security.microsoft.com>, go to **Email & collaboration** \> **Policies & rules** \> **Threat policies** \> **Email authentication settings** page. Or, to go directly to the **Email authentication settings** page, use <https://security.microsoft.com/authentication>.

2. On the **Email authentication settings** page, select the **DKIM** tab.

3. On the **DKIM** tab, in the row for the \*.onmicrosoft.com domain entry, slide the **Toggle** value :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled** to **Enabled**.

   After a moment, the **Status** value of the \*.onmicrosoft.com domain domain changes to **Valid**, but the **Toggle** value is still :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled**.

   Select **Refresh** :::image type="icon" source="media/m365-cc-sc-refresh-icon.png" border="false"::: and the **Toggle** value updates to :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Enabled**.

### Use Exchange Online PowerShell to configure DKIM signing of outbound messages

If you'd rather use PowerShell to enable DKIM signing of outbound messages using a custom domain or to customize DKIM signing for the initial \*.onmicrosoft.com domain, connect to [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) to run the following commands.

> [!TIP]
> Before you can configure DKIM signing using the custom domain, you need to add the domain to Microsoft 365. For instructions, see [Add a domain](/microsoft-365/admin/setup/add-domain#add-a-domain). To confirm that the custom domain is available for DKIM configuration, run the following command: `Get-AcceptedDomain`.
>
> As described earlier in this article, your \*.onmicrosoft.com domain is already signing outbound email from senders in the \*.onmicrosoft.com by default. Typically, unless you manually configured DKIM signing for the \*.onmicrosoft.com domain in the Defender portal or in PowerShell, the \*.onmicrosoft.com doesn't appear in the output of **Get-DkimSigningConfig**.

1. Run the following command to verify the availability and DKIM status of all domains in the organization:

   ```powershell
   Get-DkimSigningConfig | Format-List Name,Enabled,Status,Selector1CNAME,Selector2CNAME
   ```

2. For the domain where you want to configure DKIM signing, the output of the command in Step 1 determines what you need to do next:

   - The domain is listed with the following values:
     - **Enabled**: False
     - **Status**: `NoDKIMKeys` or `CnameMissing`

     Go to Step 3 to copy the selector values.

   Or

   - The domain isn't listed. Do the following steps:

     1. Replace \<Domain\> with the domain value, and then run the following command:

        ```powershell
        New-DkimSigningConfig -DomainName <Domain> -Enabled $false [-BodyCanonicalization <Relaxed | Simple>] [-HeaderCanonicalization <Relaxed | Simple>] [-KeySize <1024 | 2048>]
        ```

        - The _BodyCanonicalization_ parameter specifies the sensitivity level to changes in the message body:
          - `Relaxed`: Changes in whitespace and changes in empty lines at the end of the message body are tolerated. This value is the default.
          - `Simple`: Only changes in empty lines at the end of the message body are tolerated.
        - The _HeaderCanonicalization_ parameter specifies the sensitivity level to changes in the message header:
          - `Relaxed`: Common modifications to the message header are tolerated. For example, header field line rewrapping, changes in unnecessary whitespace or empty lines, and changes in case for header fields. This value is the default.
          - `Simple`: No changes to the header fields are tolerated.
        - The _KeySize_ parameter specifies the bit size of the public key in the DKIM record:
           - `1024` (default)
           - `2048`

        For example:

        ```powershell
        New-DkimSigningConfig -DomainName contoso.com -Enabled $false
        ```

     2. Run the command from Step 1 again to confirm that the domain is listed with the following property values:
        - **Enabled**: False
        - **Status**: `CnameMissing`

     3. Go to Step 3 to copy the selector values.

3. Copy the `Selector1CNAME` and `Selector2CNAME` values for the domain from the output of the command from Step 1.

   The CNAME records you need to create at the domain registrar for the domain look like this:

   **Hostname**: `selector1._domainkey`<br>
   **Points to address or value**: `<Selector1CNAME value>`

   **Hostname**: `selector2._domainkey`<br>
   **Points to address or value**: `<Selector2CNAME value>`

   For example:

   **Hostname**: `selector1._domainkey`<br>
   **Points to address or value**: `selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`

   **Hostname**: `selector2._domainkey`<br>
   **Points to address or value**: `selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`

4. Do one of the following steps:

   - **Custom domain**: At the domain registrar for the domain, create the two CNAME records using the information from the previous step.

     We provide instructions to create CNAME records for different Microsoft 365 services at many domain registrars. You can use these instructions as a starting point to create the DKIM CNAME records. For more information, see [Connect your domain by adding DNS records](/Microsoft-365/admin/get-help-with-domains/create-dns-records-at-any-dns-hosting-provider).

     It takes a few minutes (or possibly longer) for Microsoft 365 to detect the new CNAME records you created.

   - **\*.onmicrosoft.com domain**: Go to the next step.

5. After a while, return to Exchange Online PowerShell, replace \<Domain\> with the domain you configured, and run the following command:

   ```powershell
   Set-DkimSigningConfig -Identity \<Domain\> -Enabled $true [-BodyCanonicalization <Relaxed | Simple>] [-HeaderCanonicalization <Relaxed | Simple>]
   ```

   - The _BodyCanonicalization_ parameter specifies the sensitivity level to changes in the message body:
     - `Relaxed`: Changes in whitespace and changes in empty lines at the end of the message body are tolerated. This value is the default.
     - `Simple`: Only changes in empty lines at the end of the message body are tolerated.
   - The _HeaderCanonicalization_ parameter specifies the sensitivity level to changes in the message header:
     - `Relaxed`: Common modifications to the message header are tolerated. For example, header field line rewrapping, changes in unnecessary whitespace or empty lines, and changes in case for header fields. This value is the default.
     - `Simple`: No changes to the header fields are tolerated.

   For example:

   ```powershell
   Set-DkimSigningConfig -Identity contoso.com -Enabled $true
   ```

   Or

   ```powershell
   Set-DkimSigningConfig -Identity contoso.onmicrosoft.com -Enabled $true
   ```

   - For a custom domain, if Microsoft 365 is able to detect the CNAME records at the domain registrar, the command runs without error, and the domain is now used to DKIM sign outbound messages from the domain.

     If the CNAME records aren't detected, you get an error that contains the values to use in the CNAME records. Check for typos in the values at the domain registrar (easy to do with the dashes, periods, and underlines!), wait a while longer, and then run the command again.

   - For a \*.onmicrosoft.com domain that previously wasn't listed, the command runs without error.

6. To verify that the domain is now configured to DKIM sign messages, run the command from Step 1.

   The domain should have the following property values:

   - **Enabled**: True
   - **Status**: `Valid`

For detailed syntax and parameter information, see the following articles:

- [Get-DkimSigningConfig](/powershell/module/exchangepowershell/get-dkimsigningconfig)
- [New-DkimSigningConfig](/powershell/module/exchangepowershell/new-dkimsigningconfig)
- [Set-DkimSigningConfig](/powershell/module/exchangepowershell/set-dkimsigningconfig)

## Rotate DKIM keys

For the same reasons you should periodically change passwords, you should periodically change the DKIM key that's used for DKIM signing. Replacing the DKIM key for a domain is known as _DKIM key rotation_.

The relevant information about DKIM key rotation for a domain Microsoft 365 is shown in the output of the following command in [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell):

```powershell
Get-DkimSigningConfig -Identity <CustomDomain> | Format-List
```

- `KeyCreationTime`: The UTC date/time that the DKIM public-private key pair was created.
- `RotateOnDate`: The date/time of the previous or next DKIM key rotation.
- `SelectorBeforeRotateOnDate`: Remember, DKIM signing using a custom domain in Microsoft 365 requires two CNAME records in the domain. This property shows the CNAME record that DKIM uses before the `RotateOnDate` date-time (also known as a _selector_). The value is `selector1` or `selector2` and is different than the `SelectorAfterRotateOnDate` value.
- `SelectorAfterRotateOnDate`: Shows the CNAME record that DKIM uses after the `RotateOnDate` date-time. The value is `selector1` or `selector2` and is different than the `SelectorBeforeRotateOnDate` value.

When you do a DKIM key rotation on a domain as described in this section, the change isn't immediate. It takes four days (96 hours) for the new private key to start signing messages (the `RotateOnDate` date/time and the corresponding `SelectorAfterRotateOnDate` value). Until then, the existing private key is used (the corresponding `SelectorBeforeRotateOnDate` value).

To confirm the corresponding public key that's used to verify the DKIM signature (which infers the private key that was used to sign the message), check the `s=` value in the `DKIM-Signature` header field (the selector; for example, `s=selector1-contoso-com`).

> [!TIP]
>
> - The main factor that determines when a custom domain starts DKIM signing outbound mail is the CNAME record detection in DNS.
> - You can rotate DKIM keys only on domains with both of the following property values on the **DKIM** tab of the **Email authentication settings** page:
>   - **Toggle**: :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Enabled**
>   - **Status**: **Valid** or **CnameMissing**
> - Currently, there's no automatic DKIM key rotation for the \*.onmicrosoft.com domain.

### Use the Defender portal to rotate DKIM keys for a custom domain

1. In the Defender portal at <https://security.microsoft.com>, go to **Email & collaboration** \> **Policies & rules** \> **Threat policies** \> **Email authentication settings** page. Or, to go directly to the **Email authentication settings** page, use <https://security.microsoft.com/authentication>.

2. On the **Email authentication settings** page, select the **DKIM** tab.

3. On the **DKIM** tab, select the domain to configure by clicking anywhere in the row other than the check box next to the **Name** value or on the **Toggle** value.

   :::image type="content" source="media/email-auth-dkim-domain-list.png" alt-text="Screenshot of the DKIM tab of the Email authentication page in the Defender portal." lightbox="media/email-auth-dkim-domain-list.png":::

4. In the domain details flyout that opens, select **Rotate DKIM keys** at the bottom of the flyout.

   :::image type="content" source="media/email-auth-dkim-domain-properties-rotate-dkim-available-custom.png" alt-text="Screenshot of the domain details flyout for a custom domain where the Rotate DKIM keys button is available at the bottom of the flyout." lightbox="media/email-auth-dkim-domain-properties-rotate-dkim-available-custom.png":::

5. The settings in the details flyout change to the following values:
   - **Status**: Rotating keys for this domain and signing DKIM signatures.
   - **Publish CNAMES**: The **Points to address or value** values are blank for both selectors.
   - **Rotate DKIM keys** is grayed out.

   :::image type="content" source="media/email-auth-dkim-domain-properties-rotating-keys.png" alt-text="Screenshot of the domain details flyout for a custom domain while key rotation is in progress." lightbox="media/email-auth-dkim-domain-properties-rotating-keys.png":::

6. After four days (96 hours), the new DKIM key signs outbound messages for the custom domain. Until then, the current DKIM key is used.

   The new DKIM key signs message when the **Status** value changes to **Signing DKIM signatures for this domain**.

  To confirm the corresponding public key used to verify the DKIM signature (which infers the private key used to sign the message), check the `s=` value in the `DKIM-Signature` header field (the selector; for example, `s=selector1-contoso-com`).

#### Use Exchange Online PowerShell to rotate the DKIM keys for a domain and change the bit depth

If you'd rather use PowerShell to rotate DKIM keys for a domain, connect to [Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) to run the following commands.

1. Run the following command to verify the availability and DKIM status of all domains in the organization:

   ```powershell
   Get-DkimSigningConfig | Format-List Name,Enabled,Status,Selector1CNAME,Selector1KeySize,Selector2CNAME,Selector2KeySize,KeyCreationTime,RotateOnDate,SelectorBeforeRotateOnDate,SelectorAfterRotateOnDate
   ```

2. For the domain you want to rotate DKIM keys for, use the following syntax:

   ```powershell
   Rotate-DkimSigningConfig -Identity <CustomDomain> [-KeySize <1024 | 2048>]
   ```

   If you don't want to change the bit depth of the new DKIM keys, don't use the _KeySize_ parameter.

   This example rotates DKIM keys for the contoso.com domain and changes to a 2048-bit key.

   ```powershell
   Rotate-DkimSigningConfig -Identity contoso.com -KeySize 2048
   ```

   This example rotates DKIM keys for the contoso.com domain without changing the key bit depth.

   ```powershell
   Rotate-DkimSigningConfig -Identity contoso.com
   ```

3. Run the command from Step 1 again to confirm the following property values:

   - `KeyCreationTime`
   - `RotateOnDate`
   - `SelectorBeforeRotateOnDate`
   - `SelectorAfterRotateOnDate`

   Destination email systems use the public key in the CNAME record identified by the `SelectorBeforeRotateOnDate` property to verify the DKIM signature in messages (which infers the private key used to DKIM sign the message).

   After the `RotateOnDate` date/time, DKIM uses the new private key to sign messages, and destination email systems use the corresponding public key in the CNAME record identified by the `SelectorAfterRotateOnDate` property to verify the DKIM signature in messages.

   To confirm the corresponding public key used to verify the DKIM signature (which infers the private key that was used to sign the message), check the `s=` value in the `DKIM-Signature` header field (the selector; for example, `s=selector1-contoso-com`).

   > [!IMPORTANT]
   > If you change the bit depth of DKIM keys from 1024 to 2048 using the _KeySize_ parameter, the update applies only to the next active selector during the first key rotation. When you rotate keys again, the previously inactive selector becomes active, and the bit depth is also updated to 2048.
   >
   > When you rotate DKIM keys on a domain, the change isn't immediate. It takes four days (96 hours). While the key rotation is in progress, you can't do another key rotation.

For detailed syntax and parameter information, see the following articles:

- [Get-DkimSigningConfig](/powershell/module/exchangepowershell/get-dkimsigningconfig)
- [Rotate-DkimSigningConfig](/powershell/module/exchangepowershell/rotate-dkimsigningconfig)

## Disable DKIM signing of outbound messages using a custom domain

### Use the Defender portal to disable DKIM signing of outbound messages using a custom domain

1. In the Defender portal at <https://security.microsoft.com>, go to **Email & collaboration** \> **Policies & rules** \> **Threat policies** \> **Email authentication settings** page. Or, to go directly to the **Email authentication settings** page, use <https://security.microsoft.com/authentication>.

2. On the **Email authentication settings** page, select the **DKIM** tab.

3. On the **DKIM** tab, do either of the following steps:
   - In the entry for the domain, slide the **Toggle** value from :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Enabled** to :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled**.
   - Select the domain to configure by clicking anywhere in the row other than the check box next to the **Name** value or on the **Toggle** value. In the domain details flyout that opens, slide the **Sign messages for this domain with DKIM signatures** toggle from :::image type="icon" source="media/scc-toggle-on.png" border="false"::: **Enabled** to :::image type="icon" source="media/scc-toggle-off.png" border="false"::: **Disabled**.

#### Use Exchange Online PowerShell to disable DKIM signing of outbound messages using a custom domain

If you'd rather use PowerShell to disable DKIM signing of outbound messages using a custom domain, [connect to Exchange Online PowerShell](/powershell/exchange/connect-to-exchange-online-powershell) to run the following commands.

1. Run the following command to verify the availability and DKIM status of all domains in the organization:

   ```powershell
   Get-DkimSigningConfig | Format-List Name,Enabled,Status
   ```

   Any custom domain you can disable DKIM signing for has the following property values:

   - **Enabled**: True
   - **Status**: `Valid`

2. For the domain you want to disable DKIM signing for, use the following syntax:

   ```powershell
   Set-DkimSigningConfig -Identity <CustomDomain> -Enabled $false
   ```

   This example disables DKIM signing using the custom domain contoso.com.

   ```powershell
   Set-DkimSigningConfig -Identity contoso.com -Enabled $false
   ```

## Verify DKIM signing of outbound mail from Microsoft 365

> [!TIP]
> Before you use the methods in this section to test DKIM signing of outbound mail, wait a few minutes after any DKIM configuration changes to allow the changes to propagate.

Use any of the following methods to verify DKIM signing of outbound email from Microsoft 365:

- **Send test messages and view the related header fields from the message header in the destination email system**:

  1. Send a message from an account within your Microsoft 365 DKIM-enabled domain to a recipient in another email system (for example, outlook.com or gmail.com).

     > [!TIP]
     > Don't send mail to AOL for DKIM testing. AOL might skip the DKIM check if the SPF check passes.

  2. In the destination mailbox, view the message header. For example:
     - [View internet message headers in Outlook](https://support.microsoft.com/office/cd039382-dc6e-4264-ac74-c048563d212c).
     - Use the Message Header Analyzer at <https://mha.azurewebsites.net>.

  3. Find the **DKIM-Signature** header field in the message header. The header field looks like the following example:

     ```text
     DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contoso.com;
      s=selector1;
      h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
      bh=UErATeHehIIPIXPeUAfZWiKo0w2cSsOhb9XM9ulqTX0=;
     ```

     - **d=**: The domain that was used to DKIM sign the message.
     - **s=**: The selector (public key in the DNS record in the domain) that was used to decrypt and verify the DKIM signature of the message.

  4. Find the **Authentication-Results** header field in the message header. Although destination email systems might use slightly different formats to stamp inbound mail, the header field should include **DKIM=pass** or **DKIM=OK**. For example:

     ```text
     Authentication-Results: mx.google.com;
       dkim=pass header.i=@contoso.com header.s=selector1 header.b=NaHRSJOb;
       arc=pass (i=1 spf=pass spfdomain=contoso.com dkim=pass dkdomain=contoso.com dmarc=pass fromdomain=contoso.com);
       spf=pass (google.com: domain of michelle@contoso.com designates 0000:000:0000:0000::000 as permitted sender) smtp.mailfrom=michelle@contoso.com
     ```

     > [!TIP]
     > The DKIM signature is omitted under either of the following conditions:
     >
     > - The sender and recipient email addresses are in the same domain.
     > - The sender and recipient email addresses are in different domains controlled by the same organization.
     >
     > In both cases, the **DKIM-Signature** header field doesn't exist in the message header, and the **Authentication-Results** header field looks like the following example:
     >
     > ```text
     > authentication-results: dkim=none (message not signed)
     >  header.d=none;dmarc=none action=none header.from=contoso.com;
     > ```

- **Use the test in Microsoft 365 help**: This feature requires a Global Administrator<sup>\*</sup> account, and isn't available in Microsoft 365 Government Community Cloud (GCC), GCC High, DoD, or Office 365 operated by 21Vianet.

  > [!IMPORTANT]
  > <sup>\*</sup> Microsoft strongly advocates for the principle of least privilege. Assigning accounts only the minimum permissions necessary to perform their tasks helps reduce security risks and strengthens your organization's overall protection. Global Administrator is a highly privileged role that you should limit to emergency scenarios or when you can't use a different role.

  <div class="nextstepaction">
  <p><a href="https://admin.microsoft.com/AdminPortal/?searchSolutions=DKIM#/homepage" data-linktype="external">Run Tests: DKIM</a></p>
  </div>

  :::image type="content" source="media/email-auth-dkim-m365-test.png" alt-text="Screenshot of the DKIM diagnostics test in Microsoft 365 help." lightbox="media/email-auth-dkim-m365-test.png":::

## DKIM signing of mail from your custom domain at other email services

Some email service providers or software-as-a-service providers let you enable DKIM signing for your mail that originates from the service, but the methods depend entirely on the email service.

> [!TIP]
> As mentioned earlier in this article, we recommend using subdomains for email systems or services you don't directly control.

For example, your email domain in Microsoft 365 is contoso.com, and you use the Adatum bulk mailing service for marketing email. If Adatum supports DKIM signing of messages from senders in your domain at their service, the messages might contain the following elements:

```text
Return-Path: <communication@adatum.com>
 From: <sender@marketing.contoso.com>
 DKIM-Signature: s=s1024; d=marketing.contoso.com
 Subject: This a message from the Adatum infrastructure, but with a DKIM signature authorized by marketing.contoso.com
```

In this example, the following steps are required:

1. Adatum gives Contoso a public key to use for DKIM signing of outbound Contoso mail from their service.
2. Contoso publishes the public DKIM key in DNS at the domain registrar for the marketing.contoso.com subdomain (a TXT record or a CNAME record).
3. When Adatum sends mail from senders in the marketing.contoso.com domain, the messages are DKIM signed using the private key that corresponds to the public key they gave to Contoso in the first step.
4. If the destination email system checks DKIM on inbound messages, the messages pass DKIM because they're DKIM signed.
5. If the destination email system checks DMARC on inbound messages, the domain in the DKIM signature (the **d=** value in the **DKIM-Signature** header field) matches the domain in the From address that's shown in email clients, so the messages can also pass DMARC:

   **From**: `sender@marketing.contoso.com`<br>
   **d=**: marketing.contoso.com

## Troubleshoot DKIM DNS configuration

The following sections describe common mistakes that prevent DKIM from working and how to fix them.

### Wrong CNAME hostname format

- **Symptom**: The DKIM toggle doesn't enable in the Defender portal. Status remains **CnameMissing**.
- **What went wrong**: The CNAME hostname was entered with the full domain appended (for example, `selector1._domainkey.contoso.com.contoso.com`) or without the `_domainkey` prefix.
- **Fix**: The **hostname** (also called "Name" or "Record name") should contain only the subdomain part. Most DNS providers automatically append your domain zone.

  **Correct**: `selector1._domainkey`

  **Incorrect** (hostname includes the domain, which results in a double-domain): `selector1._domainkey.contoso.com` (if your DNS zone is already contoso.com)

> [!TIP]
> Some DNS providers (like GoDaddy) automatically append the domain zone to the value you enter. If your domain zone is `contoso.com` and you enter `selector1._domainkey.contoso.com`, the actual record becomes `selector1._domainkey.contoso.com.contoso.com`. Enter only `selector1._domainkey` in the hostname field.

### Missing selector2 CNAME record

- **Symptom**: DKIM signing enables successfully, but key rotation fails later. Or the Defender portal shows a warning about an incomplete configuration.
- **What went wrong**: Only `selector1._domainkey` was created. The `selector2._domainkey` CNAME record is missing.
- **Why it matters**: Microsoft 365 requires **both** selector CNAME records. `selector2` is used during key rotation. Without it, you can't rotate DKIM keys.
- **Fix**: Create both CNAME records:

  ```text
  selector1._domainkey     selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft
  selector2._domainkey     selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft
  ```

> [!IMPORTANT]
> Always create **both** CNAME records, even though only one selector is active at any given time. The inactive selector is needed for seamless key rotation.

### TXT record instead of a CNAME record

- **Symptom**: DKIM status remains **CnameMissing** even though you added a DNS record. DNS lookups for `selector1._domainkey.contoso.com` return a TXT record.
- **What went wrong**: A TXT record containing the DKIM public key was created directly, instead of a CNAME record pointing to Microsoft's DKIM infrastructure.
- **Why it matters**: Microsoft 365 manages the DKIM keys and handles key rotation automatically. The CNAME record delegates key management to Microsoft. A TXT record requires you to manually manage keys and rotation, which isn't supported for Microsoft 365.
- **Fix**: Delete the TXT record and create a **CNAME** record instead:

  |Record type|Hostname|Points to|
  |---|---|---|
  |**CNAME** (correct)|`selector1._domainkey`|`selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|
  |**TXT** (incorrect, not supported)|`selector1._domainkey`|`v=DKIM1; k=rsa; p=MIGfMA0GCS...`|

> [!NOTE]
> Other non-Microsoft email systems might use TXT records for DKIM. For Microsoft 365, **always use CNAME records** that point to the Microsoft DKIM infrastructure.

### TTL set too low

- **Symptom**: DKIM verification intermittently fails on the receiving side with `dkim=temperror` or `dkim=fail` (key lookup timeout).
- **What went wrong**: The TTL (Time to Live) on the DKIM CNAME records is set too low (for example, 60 or 300 seconds), causing frequent DNS lookups that might time out.
- **Recommended TTL**: **3600 seconds** (1 hour) minimum.
- **Fix**: Update the TTL on both DKIM CNAME records to at least 3600:

  ```text
  selector1._domainkey  3600  CNAME  selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft
  selector2._domainkey  3600  CNAME  selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft
  ```

### Domain mismatch in CNAME target value

- **Symptom**: DKIM status shows **CnameMissing** or DKIM signing fails. The `Get-DkimSigningConfig` output shows different values than what's in DNS.
- **What went wrong**: The CNAME target value doesn't match what Microsoft 365 generated. Common errors include incorrect domain replacement (dots vs. dashes), wrong initial domain prefix, or missing the dynamic partition character.
- **Key rules for the CNAME target**:
  - Dots (`.`) in your domain are replaced with **dashes** (`-`).
  - The initial domain prefix is your \*.onmicrosoft.com prefix (without `.onmicrosoft.com`).
  - A dynamic character is assigned by Microsoft.
- **Fix**: Always use the exact CNAME values from the Defender portal or PowerShell. Don't construct them manually:

  ```powershell
  Get-DkimSigningConfig -Identity contoso.com | Format-List Selector1CNAME, Selector2CNAME
  ```

  **Example**: For the domain `sub.contoso.com` with initial domain `contoso.onmicrosoft.com`:

  |Component|Correct value|Common mistake|
  |---|---|---|
  |Domain with dashes|`sub-contoso-com`|`sub.contoso.com` (kept dots)|
  |Initial domain prefix|`contoso`|`contoso.onmicrosoft.com` (included suffix)|
  |Full CNAME target|`selector1-sub-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|`selector1-sub.contoso.com._domainkey.contoso.onmicrosoft.com`|

### Trailing dot missing or extra in CNAME target

- **Symptom**: DNS provider shows the record as created, but Microsoft 365 can't detect it.
- **What went wrong**: Some DNS providers require a trailing dot (`.`) at the end of the CNAME target to indicate a fully qualified domain name (FQDN). Others add it automatically, and adding it manually creates a double-dot.
- **Fix**: Check your DNS provider's requirements. See [DNS provider-specific CNAME examples](#dns-provider-specific-cname-examples).

### Common DKIM DNS mistakes at a glance

|Mistake|Symptom|Fix|
|---|---|---|
|Hostname includes full domain|Status: CnameMissing|Enter only `selector1._domainkey` (no domain suffix)|
|Missing selector2|Key rotation fails|Create both CNAME records|
|TXT record instead of CNAME|Status: CnameMissing|Delete TXT, create CNAME|
|TTL too low|Intermittent `dkim=temperror`|Set TTL to at least 3600 seconds|
|Wrong domain format in target|Status: CnameMissing|Use exact values from `Get-DkimSigningConfig`|
|Trailing dot issue|Record exists but not detected|Follow DNS provider-specific formatting|

### Verify DNS propagation

Use `nslookup` or `dig` to confirm the CNAME records resolve correctly.

**Windows (nslookup)**:

```cmd
nslookup -type=CNAME selector1._domainkey.contoso.com
nslookup -type=CNAME selector2._domainkey.contoso.com
```

**Expected output** (successful):

```text
selector1._domainkey.contoso.com  canonical name = selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft
```

**macOS/Linux (dig)**:

```bash
dig CNAME selector1._domainkey.contoso.com +short
dig CNAME selector2._domainkey.contoso.com +short
```

> [!NOTE]
> DNS propagation can take a few minutes to 48 hours depending on your DNS provider and TTL settings. If the records don't resolve immediately, wait and try again.

### DKIM still not working after verification

If you completed all verification steps and DKIM still isn't working, use the following table to identify the issue:

|Issue|Possible cause|Resolution|
|---|---|---|
|Status stays CnameMissing after 48 hours|DNS records are incorrect or in the wrong zone.|Double-check the values by using `Get-DkimSigningConfig` output. Verify records are in the correct DNS zone for the domain.|
|DKIM passes but DMARC still fails|DKIM domain alignment issue: the `d=` domain in the DKIM signature doesn't match the From address domain.|Ensure DKIM is configured for the exact domain used in the From address (including subdomains).|
|DKIM fails after message forwarding|Message body or headers were modified by an intermediary.|Configure the intermediary as a [trusted ARC sealer](email-authentication-arc-configure.md).|
|DKIM toggle immediately goes back to Disabled|CNAME records are detected but keys can't be generated (rare).|Contact [Microsoft Support](/microsoft-365/admin/get-help-support) with the output of `Get-DkimSigningConfig -Identity contoso.com`.|
|DKIM works for one domain but not another|The second domain has its own DNS zone and needs its own CNAME records.|Each domain or subdomain that sends email needs its own pair of DKIM CNAME records.|

## DNS provider-specific CNAME examples

The following examples show how to create the DKIM CNAME records at popular DNS providers. In all examples, the custom domain is **contoso.com** and the initial domain is **contoso.onmicrosoft.com**.

> [!IMPORTANT]
> The CNAME target values in the following examples are **examples only**. Your actual values include a dynamic partition character assigned by Microsoft. Always get your exact values from:
>
> - The Defender portal: **DKIM** page \> domain details \> **Publish CNAMEs** section.
> - PowerShell: `Get-DkimSigningConfig -Identity contoso.com | Format-List Selector1CNAME, Selector2CNAME`

### GoDaddy

1. Sign in to [GoDaddy DNS Management](https://dcc.godaddy.com/manage/dns).
1. Select your domain (**contoso.com**).
1. Select **Add Record**.

|Field|Record 1|Record 2|
|---|---|---|
|**Type**|CNAME|CNAME|
|**Name**|`selector1._domainkey`|`selector2._domainkey`|
|**Value**|`selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|`selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|
|**TTL**|1 Hour|1 Hour|

> [!NOTE]
> GoDaddy automatically appends your domain zone to the **Name** field. Don't include `.contoso.com` in the Name. Enter only `selector1._domainkey`.

### Cloudflare

1. Sign in to the [Cloudflare dashboard](https://dash.cloudflare.com).
1. Select your domain (**contoso.com**) \> **DNS** \> **Records**.
1. Select **Add record**.

|Field|Record 1|Record 2|
|---|---|---|
|**Type**|CNAME|CNAME|
|**Name**|`selector1._domainkey`|`selector2._domainkey`|
|**Target**|`selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|`selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|
|**Proxy status**|**DNS only** (gray cloud, proxy OFF)|**DNS only** (gray cloud, proxy OFF)|
|**TTL**|Auto (or 1 hour)|Auto (or 1 hour)|

> [!CAUTION]
> **Disable the Cloudflare proxy (orange cloud) for DKIM CNAME records.** DKIM CNAME records must resolve directly to the Microsoft DKIM infrastructure. If the proxy is enabled, DNS lookups return Cloudflare's IP addresses instead of the CNAME target, and DKIM verification fails. Set the proxy status to **DNS only** (gray cloud icon).

### Amazon Route 53

1. Sign in to the [AWS Management Console](https://console.aws.amazon.com/route53/).
1. Go to **Hosted zones** \> select **contoso.com**.
1. Select **Create record**.

|Field|Record 1|Record 2|
|---|---|---|
|**Record name**|`selector1._domainkey`|`selector2._domainkey`|
|**Record type**|CNAME|CNAME|
|**Value**|`selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft.`|`selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft.`|
|**TTL**|3600|3600|
|**Routing policy**|Simple routing|Simple routing|

> [!NOTE]
> Route 53 requires a **trailing dot** (`.`) at the end of the CNAME target value to indicate a fully qualified domain name. If you omit the trailing dot, Route 53 appends the hosted zone name to the target, which creates an incorrect value.

### Azure DNS

1. Sign in to the [Azure portal](https://portal.azure.com).
1. Go to **DNS zones** \> select **contoso.com**.
1. Select **+ Record set**.

|Field|Record 1|Record 2|
|---|---|---|
|**Name**|`selector1._domainkey`|`selector2._domainkey`|
|**Type**|CNAME|CNAME|
|**Alias**|`selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|`selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft`|
|**TTL**|1 hour|1 hour|
|**TTL unit**|Hours|Hours|

> [!NOTE]
> Azure DNS doesn't require a trailing dot for CNAME targets. The portal handles FQDN formatting automatically. Don't add a trailing dot in the Azure portal.

#### Azure DNS via CLI

```azurecli
# Create selector1 CNAME
az network dns record-set cname set-record \
  --resource-group MyDNSResourceGroup \
  --zone-name contoso.com \
  --record-set-name "selector1._domainkey" \
  --cname "selector1-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft"

# Create selector2 CNAME
az network dns record-set cname set-record \
  --resource-group MyDNSResourceGroup \
  --zone-name contoso.com \
  --record-set-name "selector2._domainkey" \
  --cname "selector2-contoso-com._domainkey.contoso.n-v1.dkim.mail.microsoft"

# Set TTL to 3600 seconds
az network dns record-set cname update \
  --resource-group MyDNSResourceGroup \
  --zone-name contoso.com \
  --name "selector1._domainkey" \
  --set ttl=3600

az network dns record-set cname update \
  --resource-group MyDNSResourceGroup \
  --zone-name contoso.com \
  --name "selector2._domainkey" \
  --set ttl=3600
```

### DNS provider requirements summary

|Provider|Trailing dot needed?|Auto-appends domain?|Proxy/CDN notes|
|---|---|---|---|
|**GoDaddy**|No|Yes (auto-appends zone)|N/A|
|**Cloudflare**|No|Yes (auto-appends zone)|**Must disable proxy** (DNS only / gray cloud)|
|**Route 53**|**Yes** (required)|No|N/A|
|**Azure DNS**|No (portal handles it)|Yes (auto-appends zone)|N/A|
|**Namecheap**|No|Yes (auto-appends zone)|N/A|
|**Google Domains / Cloud DNS**|No|Yes (auto-appends zone)|N/A|

## Next steps

As described in [How SPF, DKIM, and DMARC work together to authenticate email message senders](email-authentication-about.md#how-spf-dkim-and-dmarc-work-together-to-authenticate-email-message-senders), DKIM alone isn't enough to prevent spoofing of your Microsoft 365 domain. You also need to configure SPF and DMARC for the best possible protection. For instructions, see:

- [Set up SPF to identify valid email sources for your custom cloud domains](email-authentication-spf-configure.md)
- [Set up DMARC to validate the From address domain for cloud senders](email-authentication-dmarc-configure.md)

For mail coming _into_ Microsoft 365, you might also need to configure trusted ARC sealers if you use services that modify messages in transit before delivery to your organization. For more information, see [Configure trusted ARC sealers](email-authentication-arc-configure.md).

To diagnose and fix email authentication failures, see [Troubleshoot email authentication in Microsoft 365](email-authentication-troubleshoot.md).

> [!TIP]
> Exchange 2016 and Exchange 2019 are known to modify messages that flow through them, which can affect DKIM.
