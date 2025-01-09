---
title: Identity-managed devices with Conditional Access app control | Microsoft Defender for Cloud Apps
description: This article provides information about how to configure access and session policies for Conditional Access app control to check for identity-managed devices.
ms.date: 12/24/2023
ms.topic: how-to
---

# Identity-managed devices with Conditional Access app control

You might want to add conditions to your policy about whether a device is managed or not. To identify the state of a device, configure access and session policies to check for specific conditions, depending on whether you have Microsoft Entra or not.

## Check for device management with Microsoft Entra

If you have Microsoft Entra, have your policies check for Microsoft Intune-compliant devices, or Microsoft Entra hybrid joined devices.

Microsoft Entra Conditional Access enables Intune-compliant and Microsoft Entra hybrid joined device information to be passed directly to Defender for Cloud Apps. From there, create an access or session policy that considers the device state. For more information, see the [What is a device identity?](/entra/identity/devices/overview)

> [!NOTE]
> Some browsers may require additional configuration such as installing an extension. For more information, see [Conditional Access browser support](/azure/active-directory/conditional-access/concept-conditional-access-conditions).

## Check for device management without Microsoft Entra

If you don't have Microsoft Entra, check for the presence of client certificates in a trusted chain. Use either existing client certificates already deployed in your organization or roll out new client certificates to managed devices.

Make sure that the client certificate is installed in the user store and not the computer store. You then use the presence of those certificates to set access and session policies.

Once the certificate is uploaded and a relevant policy is configured, when an applicable session traverses Defender for Cloud Apps and Conditional Access app control,  Defender for Cloud Apps requests the browser to present the SSL/TLS client certificates. The browser serves the SSL/TLS client certificates that are installed with a private key. This combination of certificate and private key is done by using the PKCS #12 file format, typically .p12 or .pfx.

When a client certificate check is performed, Defender for Cloud Apps checks for the following conditions:

- The selected client certificate is valid and is under the correct root or intermediate CA.
- The certificate isn't revoked (if CRL is enabled).

> [!NOTE]
> Most major browsers support performing a client certificate check. However, mobile and desktop apps often leverage built-in browsers that may not support this check and therefore affect authentication for these apps.

###  Configure a policy to apply device management via client certificates

To request authentication from relevant devices using client certificates, you need an X.509 root or intermediate certificate authority (CA) SSL/TLS certificate, formatted as a *.PEM* file.  Certificates must contain the public key of the CA, which is then used to sign the client certificates presented during a session.

Upload your root or intermediate CA certificates to Defender for Cloud Apps in the **Settings > Cloud Apps > Conditional Access App Control > Device identification** page.

After the certificates are uploaded, you can create access and session policies based on **Device tag** and **Valid client certificate**.

**To test how this works**, use our sample root CA and client certificate, as follows:

1. Download the sample [root CA](https://github.com/microsoft/Microsoft-Cloud-App-Security/blob/master/Doc%20Assets/Proxy/Samples/SampleRootCA.crt.pem) and [client certificate](https://github.com/microsoft/Microsoft-Cloud-App-Security/blob/master/Doc%20Assets/Proxy/Samples/SampleClientCert.pfx).
1. Upload the root CA to Defender for Cloud Apps.
1. Install the client certificate onto the relevant devices. The password is `Microsoft`.

## Related content

For more information, see [Protect apps with Microsoft Defender for Cloud Apps Conditional Access app control](proxy-intro-aad.md).