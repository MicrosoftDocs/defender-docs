---
title: Reference table for serverless protection security recommendations 
description: This article lists the Microsoft Defender for Cloud security recommendations for serverless protection.
author: dcurwin
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 11/30/2025
ms.author: dacurwin
ms.custom: generated
ai-usage: ai-assisted
---

# Serverless protection security recommendations

This article lists all the security recommendations you might see issued by the Microsoft Defender for Cloud plan - Defender Cloud Security Posture Management (CSPM) for serverless protection.

The recommendations that appear in your environment are based on the resources that you're protecting and on your customized configuration. You can [see the recommendations in the portal](https://portal.azure.com/#view/Microsoft_Azure_Security/SecurityMenuBlade/~/5) that apply to your resources.

To learn about actions that you can take in response to these recommendations, see [Remediate recommendations in Defender for Cloud](implement-security-recommendations.md).


> [!TIP]
> If a recommendation's description says *No related policy*, usually it's because that recommendation is dependent on a different recommendation and *its* policy.
>
> For example, the recommendation *Endpoint protection health failures should be remediated* relies on the recommendation that checks whether an endpoint protection solution is even installed (*Endpoint protection solution should be installed*). The underlying recommendation *does* have a policy. Limiting the policies to only the foundational recommendation simplifies policy management.

## Serverless protection recommendations

### (Preview) Authentication should be enabled on Azure Functions

**Description**: Defender for Cloud identified that authentication is not enabled for your Azure Functions App, and at least one HTTP triggered function is set to 'anonymous'. This poses a risk of unauthorized access to a Function. Add an Identity provider for the Function app or change the authentication type of the function itself to prevent this risk.
(No related policy)

**Severity**: High

### (Preview) Authentication should be enabled on Lambda Function URLs

**Description**: Defender for Cloud has identified that authentication is not enabled for one or more Lambda Function URLs. Publicly accessible Lambda Function URLs without authentication pose a risk of unauthorized access and potential abuse. Enforcing AWS IAM authentication on Lambda Function URLs helps mitigate these risks.
(No related policy)

**Severity**: High

### (Preview) Code Signing should be enabled on Lambda

**Description**: Defender for Cloud has identified that code signing is not enabled on Lambda, which poses a risk of unauthorized modifications to the Lambda function code. Enabling code signing ensures the integrity and authenticity of the code, preventing such modifications.
(No related policy)

**Severity**: High

### (Preview) Lambda function should be configured with automatic runtime version updates

**Description**: Defender for Cloud identified that the Lambda function is not using an automatic runtime version update. This poses a risk of exposure to outdated runtime versions with vulnerabilities. Using automatic updates keeping runtime up to date and ensures the function benefits from the latest security patches and improvements.
(No related policy)

**Severity**: Medium

### (Preview) Lambda function should implement Reserved Concurrency to prevent resource exhaustion

**Description**: Defender for Cloud identified that the Lambda function is using an outdated layer version. This poses a risk of exposure to known vulnerabilities. Keeping layers up to date ensures the function benefits from the latest security patches and improvements.
(No related policy)

**Severity**: Medium

### (Preview) Security mechanism should be used on lambda function API Gateway

**Description**: Defender for Cloud has identified that authentication is not enabled for lambda function API Gateway. This poses a risk of unauthorized access and potential abuse of the function endpoints. Enforcing authentication can help mitigate these risks.
(No related policy)

**Severity**: High

### (Preview) Overly permissive permissions should not be configured on Function App, Web App or Logic App

**Description**: Defender for Cloud identified that the Function App, Web App or Logic App Identity has overly permissive permissions. By restricting permissions, you can ensure that only necessary access is granted, reducing the risk of unauthorized access and potential security breaches.
(No related policy)

**Severity**: High

### (Preview) Restricted network access should be configured on Internet exposed Function app

**Description**: Defender for Cloud identified that the Function App is exposed to the internet without any restrictions. By restricting network access, you can ensure that only allowed networks can access the Functionapp. If the function does not require public network access, set 'Public Network Access' setting to 'disabled' or 'Enabled from selected virtual networks and IP addresses'. This action restricts the network access, reducing exposure to unauthorized access and protecting your application from potential threats.
(No related policy)

**Severity**: High











### (Preview) Azure Functions and Web Apps should use authentication

**Description**: Azure Functions and Web Apps should use authentication to ensure secure access and prevent unauthorized usage.
(No related policy).

**Severity**: High

### (Preview) Azure Functions and Web Apps should use Code Signing

**Description**: Code signing helps ensure the integrity and authenticity of your Azure Functions and Web Apps code.
(No related policy).

**Severity**: Medium

### (Preview) Lambda functions should use authentication

**Description**: AWS Lambda functions should use authentication mechanisms to ensure secure access and prevent unauthorized invocation.
(No related policy).

**Severity**: High

### (Preview) Lambda functions should use the latest runtime version

**Description**: Using the latest runtime version ensures that Lambda functions benefit from the latest security patches and features.
(No related policy).

**Severity**: Medium

### (Preview) Lambda functions with internet connectivity should use Reserved Concurrency

**Description**: Reserved concurrency limits the number of concurrent executions, helping to prevent denial-of-service attacks and manage costs.
(No related policy).

**Severity**: Medium

### (Preview) Lambda functions with internet connectivity should use a security mechanism

**Description**: Lambda functions exposed to the internet should implement security mechanisms such as API Gateway, IAM authentication, or other access controls.
(No related policy).

**Severity**: High

### (Preview) Serverless workloads should not have overly permissive permissions

**Description**: Serverless workloads should follow the principle of least privilege to minimize security risks.
(No related policy).

**Severity**: High

### (Preview) Serverless workloads should not allow unrestricted network access

**Description**: Network access to serverless workloads should be restricted to prevent unauthorized access and reduce attack surface.
(No related policy).

**Severity**: High



## Related content

- [Learn about security recommendations](security-policy-concept.md)
- [Review security recommendations](review-security-recommendations.md)
