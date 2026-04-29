---
title: 	Application card for Microsoft Sentinel MCP server
titleSuffix: Microsoft Security
description: Learn about the capabilities, intended uses, limitations, and responsible AI practices for Microsoft Sentinel's Model Context Protocol (MCP) server.
author: poliveria
ms.author: pauloliveria
ms.revieweer: macasgra
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: concept-article
ms.custom:
- msecd-doc-authoring-1012
- responsible-ai-transparency
ms.date: 04/29/2026
ai-usage: ai-assisted

#customer intent: As a security analyst or SOC engineer, I want to understand Microsoft Sentinel MCP Server's capabilities, intended uses, and limitations so that I can deploy and use it responsibly in my security operations.

---

# Application card: Microsoft Sentinel MCP Server

## What is an Application card?

Microsoft's Application and Platform cards are intended to help you understand how our AI technology works, the choices application owners can make that influence application performance and behavior, and the importance of considering the whole application, including the technology, the people, and the environment. Application cards are created for AI applications and platform cards are created for AI platform services. These resources can support the development or deployment of your own applications and can be shared with users or stakeholders impacted by them.

As part of its commitment to responsible AI, Microsoft adheres to [six core principles](https://www.microsoft.com/ai/principles-and-approach): fairness, reliability and safety, privacy and security, inclusiveness, transparency, and accountability. These principles are embedded in the [Responsible AI Standard](https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/final/en-us/microsoft-brand/documents/Microsoft-Responsible-AI-Standard-General-Requirements.pdf), which guides teams in designing, building, and testing AI applications. Application and Platform cards play a key role in operationalizing these principles by offering transparency around capabilities, intended uses, and limitations. For further insight, readers are encouraged to explore Microsoft's [Responsible AI Transparency Report](https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/msc/documents/presentations/CSR/Responsible-AI-Transparency-Report-2025.pdf) and either the [Microsoft Enterprise AI Services Code of Conduct](/legal/ai-code-of-conduct) (for organizations) or the [Code of Conduct section in the Microsoft Services Agreement](https://www.microsoft.com/servicesagreement#3_codeOfConduct) (for individuals), both of which outline how to engage with AI responsibly.

## 1. Overview

Microsoft Sentinel MCP Server is a server-side application built on the Model Context Protocol (MCP). MCP is an open protocol that manages how AI language models interact with external tools, memory, and context in a safe, structured, and stateful way. Microsoft Sentinel MCP Server provides a unified, hosted interface that enables security teams to bring AI into their daily security operations. It connects AI models with structured security data in the Microsoft Sentinel data lake and Microsoft Defender. Analysts can query, analyze, and act on security data using natural language rather than writing complex queries manually. This approach removes barriers to threat hunting, incident triage, and security investigations by letting AI agents discover relevant data, analyze entities, and build automation workflows on behalf of security practitioners.

The application is designed for enterprise security teams, including security analysts, security researchers, threat hunters, and Security Operations Center (SOC) engineers. These professionals can connect compatible AI-powered clients—such as Visual Studio Code, Microsoft Security Copilot, Microsoft Copilot Studio, Microsoft Foundry, ChatGPT, and Claude—to the Microsoft Sentinel MCP Server. They can use natural language prompts to interact with security data. This approach eliminates the need for code-first integration, understanding complex data schemas, or writing well-formed Kusto Query Language (KQL) queries.

For more information, see [What is Microsoft Sentinel's support for MCP?](sentinel-mcp-overview.md) and [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md).

## 2. Key terms

The following table provides a glossary of key terms related to Microsoft Sentinel MCP Server.

| Term | Description |
|---|---|
| Data lake | A centralized, cloud-native storage system that ingests, stores, and analyzes large volumes of diverse security data at scale. Microsoft Sentinel data lake provides cost-effective long-term retention and advanced analytics for security data. |
| Entity | A discrete object of interest in a security investigation, such as a user account, URL, domain, IP address, file, or device. Entity analysis helps analysts understand the risk and context around these objects. |
| Kusto Query Language (KQL) | A query language used to retrieve and analyze data from Microsoft Sentinel data lake and other Azure data stores. KQL allows users to filter, aggregate, and visualize large datasets. |
| Model Context Protocol (MCP) | An open protocol that manages how AI language models interact with external tools, memory, and context. MCP uses a client-server architecture comprising an MCP host (the AI application), an MCP client (which maintains a connection to a server), and an MCP server (which provides context and tools to clients). |
| MCP client | A component within an AI-powered application (such as Visual Studio Code or ChatGPT) that maintains a connection to an MCP server and retrieves context for the host application to use. |
| MCP host | The AI application that coordinates and manages one or more MCP clients. Examples include Visual Studio Code, Microsoft Security Copilot, and ChatGPT. |
| MCP server | A program that provides context, tools, and structured data access to MCP clients. Microsoft Sentinel MCP Server is a fully hosted MCP server that requires no infrastructure deployment. |
| Microsoft Entra | Microsoft's identity and access management service, used for authentication and authorization when connecting to the Microsoft Sentinel MCP Server. |
| Security Copilot | Microsoft's AI-powered security assistant that integrates with Microsoft Sentinel MCP tools to help security professionals investigate threats, triage incidents, and build automated security workflows. |
| Security Operations Center (SOC) | A centralized team within an organization responsible for monitoring, detecting, analyzing, and responding to cybersecurity threats and incidents. |
| Tool collection | A logical grouping of related, scenario-focused MCP tools within the Microsoft Sentinel MCP Server. Available collections include data exploration, agent creation, and triage. |

## 3. Key features or capabilities

The key features and capabilities described here outline what Microsoft Sentinel MCP Server is designed to do and how it performs across supported tasks.

| Feature | Description |
|---|---|
| Unified, hosted interface for AI-driven security operations | Microsoft Sentinel MCP Server is fully hosted and requires no infrastructure deployment from the customer. It uses Microsoft Entra for identity and authentication, allowing security teams to connect compatible clients and immediately begin performing AI-powered security operations without managing servers or networking infrastructure. |
| Natural language data exploration | The data exploration tool collection enables security analysts to search for relevant tables, retrieve data, and query the Microsoft Sentinel data lake by using natural language prompts. This feature removes the need to understand complex data schemas or write well-formed KQL queries manually, accelerating threat discovery and investigation. |
| AI-powered entity analysis | The entity analyzer tools use AI to assess risk for user accounts, URLs, and domains by reasoning over authentication patterns, behavioral anomalies, threat intelligence, and organizational activity data. They deliver a verdict and detailed insights in a single action, eliminating the manual data collection effort traditionally required for entity enrichment. |
| Accelerated security agent creation | The agent creation tool collection enables SOC engineers to describe their automation intent in natural language and quickly build Microsoft Security Copilot agents with the right AI model instructions and tool configurations. This feature dramatically reduces the weeks of effort typically required to manually automate security playbooks. |
| Incident triage and threat hunting | The triage tool collection integrates AI models with Microsoft Defender APIs to support rapid incident prioritization and proactive threat hunting. Analysts can fetch incidents, alerts, evidence, and entity data, and run advanced hunting queries—all through natural language prompts, reducing mean time to resolution, risk exposure, and dwell time. |
| Custom MCP tool creation | Security teams can save their own KQL queries from advanced hunting as [custom MCP tools](sentinel-mcp-create-custom-tool.md), enabling deterministic agentic workflows with granular control over the data accessible to AI agents. This extensibility allows organizations to tailor the server to their unique security processes. |
| Cost-effective, context-rich data integration | Microsoft Sentinel MCP Server natively integrates with the Microsoft Sentinel data lake, which provides [cost-effective long-term retention](https://www.microsoft.com/en-us/security/pricing/microsoft-sentinel/cost-estimator) of security data for up to 12 years. This feature lets security teams build comprehensive security context without needing to choose between data coverage and cost. |
| Multiplatform compatibility | Microsoft Sentinel MCP Server works with multiple AI-powered clients and automation platforms, including Visual Studio Code, Microsoft Security Copilot, Microsoft Copilot Studio, Microsoft Foundry, ChatGPT (by OpenAI), Claude (by Anthropic), and Azure Logic Apps. |

## 4. Intended uses

Microsoft Sentinel MCP Server can be used in multiple scenarios across a variety of industries. Some examples of use cases include:

- **Interactive exploration of long-term security data:** Security analysts and threat hunters can use natural language prompts to search and retrieve relevant data from tables in the Microsoft Sentinel data lake without needing to memorize table names, understand schemas, or write KQL queries. For example, an analyst investigating identity-based attacks can correlate file activity with sensitivity labels to uncover signs of data exfiltration, policy violations, or suspicious user behavior that might have gone unnoticed during an original retention window. This interactive approach accelerates threat discovery and investigation while reducing reliance on manual query formulation.

- **Automated entity analysis during investigations:** SOC engineers and analysts can use entity analyzer tools to analyze and triage entities such as URLs, users, and domains across all of an organization's security data. The tools retrieve, reason over, and clearly present comprehensive verdicts and analyses, making it easy to automate what is traditionally a manual context-gathering effort. This reduces response times and can be integrated into Azure Logic Apps playbooks for automated incident enrichment.
- **Building Security Copilot agents through natural language:** SOC engineers can describe their automation intent in natural language to quickly build Security Copilot agents with the right AI model instructions and tools that reason over security data. For example, an engineer can create an agent that generates a comprehensive post-incident report from Microsoft Defender, Microsoft Purview, and Microsoft Sentinel incidents, aggregating summaries, insights, entities, and alerts with actionable remediation steps.
- **Rapid incident triage and threat hunting:** Security teams need to prioritize incidents and hunt over organizational data without worrying about interoperability among platforms and tools. The triage collection integrates AI models with APIs to fetch incidents, alerts, evidence, and entities, and to run advanced hunting queries. This reduces mean time to resolution, risk exposure, and dwell time, and empowers teams to use AI for faster decision-making.
- **Custom deterministic workflows for security automation:** Security teams can create custom MCP tools from saved KQL queries in advanced hunting, enabling agents to retrieve and reason over specific data relevant to their organization's processes. This gives teams granular control over the data accessible to AI agents and creates predictable, repeatable agentic workflows.

## 5. Models and training data

Microsoft Sentinel MCP Server leverages a variety of AI models to power the experience that users see. The server itself is model-agnostic—it provides tools and structured data access that AI models consume through the MCP protocol. The AI model used depends on the client application connecting to the server. Some examples include [GPT-4o and other Azure OpenAI Service models](/azure/ai-services/openai/concepts/models), [Claude Sonnet](https://www.anthropic.com/claude/sonnet) (when used through Visual Studio Code with GitHub Copilot or the Claude client), and models available through [Microsoft Security Copilot](/copilot/security/microsoft-security-copilot). To learn more about the data used to train the foundation models behind Microsoft Sentinel MCP Server, refer to the linked model cards to find the relevant data cards.

## 6. Performance

Microsoft Sentinel MCP Server is designed to perform reliably when used for security-focused workflows that require access to structured tabular data in the Microsoft Sentinel data lake and Microsoft Defender. The server operates within a client-server architecture where the AI model (running in the connected client) sends natural language prompts, and the MCP tools retrieve, process, and return structured security data. The intended inputs are natural language text prompts describing security investigation requests, table searches, entity analysis tasks, or agent creation instructions. The expected outputs are structured data results including table schemas, KQL query results, entity verdicts and analyses, incident and alert details, and agent configuration YAML.

The server's performance depends on the correct configuration of the connected client, proper onboarding to the Microsoft Sentinel data lake and relevant Microsoft Defender products, and the availability and freshness of the underlying security data. Each tool collection has specific product prerequisites—for example, the triage collection requires Microsoft Defender XDR, Microsoft Defender for Endpoint, or Microsoft Sentinel onboarded to the Defender portal, while the agent creation collection requires Microsoft Security Copilot. Entity analyzer tools might require several minutes to generate results and support a maximum analysis window of seven days for user entities to ensure accuracy.

Microsoft Sentinel MCP Server supports English language prompts only. For optimal performance, customers located in the following countries and regions can use the tools: Australia, Canada, Europe, India, Japan, Norway, Southeast Asia, Switzerland, United Kingdom, and United States. Specific quotas and limits apply to each tool collection, including a 120-second MCP streaming limit, an 800-character query window for data lake tools, and throughput limits for the entity analyzer (200 runs per hour, 500 runs per day per tenant). Regular API throttling and advanced hunting quotas apply to the triage tool collection.

## 7. Limitations

Understanding Microsoft Sentinel MCP Server's limitations is crucial to determine if it's used within safe and effective boundaries. While we encourage customers to use Microsoft Sentinel MCP Server in their innovative solutions or applications, it's important to note that Microsoft Sentinel MCP Server wasn't designed for every possible scenario. We encourage users to refer to either the [Microsoft Enterprise AI Services Code of Conduct](/legal/ai-code-of-conduct) (for organizations) or the [Code of Conduct section in the Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) (for individuals) and the following considerations when choosing a use case:

- **Domain-specific scope:** Microsoft Sentinel MCP Server only supports queries and operations related to security data in the Microsoft Sentinel data lake and Microsoft Defender. Prompts outside this domain—such as general-purpose questions, non-security data analysis, or tasks unrelated to threat hunting and incident response—might result in empty, irrelevant, or inaccurate responses. Users shouldn't rely on it as a general-purpose AI assistant.

- **English-only language support:** Microsoft Sentinel MCP Server was developed and evaluated for English language prompts only. Using prompts in other languages might result in degraded performance, inaccurate tool selection, or incomplete results. Users should exercise caution when operating outside the intended language scope.
- **Data freshness dependency:** Results from the MCP tools depend on the current state of the data in the Microsoft Sentinel data lake. If data is outdated, incomplete, or not yet ingested, responses might be limited or inaccurate. Users should ensure that their data connectors are properly configured and that data ingestion is current before relying on results for critical security decisions.
- **Plugin and client configuration dependency:** Tools using the MCP server must be properly configured to access the correct plugins, data sources, and workspaces. Misconfiguration—such as using an invalid workspace ID, connecting with an incompatible client version, or lacking the required Security reader role—can lead to failed tool invocations or missing results. Users should follow the documented setup and [troubleshooting guidance](troubleshoot-sentinel-mcp.md).
- **Entity analyzer constraints:** The user entity analyzer (`analyze_user_entity`) only supports users with a Microsoft Entra object ID form factor. On-premises Active Directory-only users aren't supported. Additionally, the user analyzer requires specific tables (`AlertEvidence`, `SigninLogs`, `CloudAppEvents`, `IdentityInfo`) to be present in the data lake. Missing tables reduce the accuracy of the analysis or generate errors. The entity analyzer also has concurrency limits and result expiration (one hour), requiring fresh queries after expiration.
- **Regional availability:** Microsoft Sentinel MCP Server is optimized for customers in specific regions (Australia, Canada, Europe, India, Japan, Norway, Southeast Asia, Switzerland, United Kingdom, and United States). Performance outside these regions might not meet expectations.
- **Model-dependent output quality:** Because Microsoft Sentinel MCP Server is model-agnostic, the quality and accuracy of the final output depends on the AI model used in the connected client. Some models might not reason effectively over a large combination of tools or might produce less accurate KQL queries. Users should select newer reasoning models for best performance.
- **Prerelease status of certain features:** Some tool collections (such as triage and custom tools) are in preview. These features might be substantially modified before general availability. Microsoft makes no warranties, expressed or implied, with respect to prerelease information.

## 8. Evaluations

Microsoft Sentinel MCP is evaluated through automated checks integrated into the Microsoft Security Graph deployment process. These evaluations are executed as part of every deployment to assess service reliability, correctness, and safety before rollout.

As part of this process, Microsoft Sentinel MCP undergoes automated static evaluations that act as deployment gates. These evaluations validate correct operation of MCP tools and orchestration logic, including tool invocation and executable outputs, to detect regressions that could impact supported security investigation workflows.

Microsoft Sentinel MCP is also validated against representative security investigation scenarios to ensure correct end-to-end behavior across common tool-driven workflows, such as semantic table discovery, query execution, and multistep tool orchestration.

Evaluations are fully automated and consistently applied across deployments. Microsoft Sentinel MCP doesn't rely on standalone manual grading or ad-hoc evaluation processes. Safety and quality are primarily enforced through automated evaluations, tool grounding, role-based access control, and monitored deployment practices.

## 9. Safety components and mitigations

- **Microsoft Entra authentication and role-based access control:** Microsoft Sentinel MCP Server requires authentication through Microsoft Entra, ensuring that only authorized users can access the tools and data. Users must have at least a Security reader role to list and invoke tools. The triage collection enforces existing permissions, meaning users can only access data their role grants them. This prevents unauthorized data access and enforces the principle of least privilege.

- **Domain-scoped tool design:** The MCP tools are purpose-built for security operations and are scoped exclusively to Microsoft Sentinel data lake and Microsoft Defender data. This design limits the attack surface by preventing the tools from being used for general-purpose data access or operations outside the security domain. Tool descriptions are security-optimized to guide AI models toward appropriate tool selection.
- **Structured, scenario-focused tool collections:** Tools are organized into logical, scenario-focused collections (data exploration, agent creation, triage) with security-optimized descriptions. This helps AI models correctly identify and select the right tools for specific tasks, reducing the risk of incorrect or unintended tool invocations.
- **Harmful content annotation and monitoring:** Microsoft Sentinel MCP Server incorporates harmful content annotation and operational monitoring as part of its safety system. These components are designed to detect and mitigate instances where the application might produce inappropriate, harmful, or off-topic content.
- **Invite-only early access and iterative improvement:** For features in preview, Microsoft uses an invite-only early access model to collect user feedback before broad availability. This approach allows the team to identify and address safety and performance issues in controlled environments before general release.
- **Query and rate limiting:** The server enforces specific quotas and rate limits (such as 120-second streaming limits, 800-character query windows, and entity analyzer run limits) to prevent abuse, excessive resource consumption, and denial-of-service scenarios. These limits ensure the service remains stable and available for all users.
- **Tenant isolation and multi-tenancy controls:** Data access is scoped to each customer's own tenant and workspace. The server supports multi-tenancy configuration through tenant-specific headers, ensuring that data from one organization isn't accessible to another.
- **Human-in-the-loop design:** Microsoft Sentinel MCP Server is designed to keep humans at the center of security decision-making. The tools provide AI-generated insights, recommendations, and verdicts, but security analysts are expected to review and validate all outputs before acting on them. This design encourages responsible use and reduces the risk of automated errors leading to adverse security outcomes.

## 10. Best practices for deploying and adopting Microsoft Sentinel MCP Server

Responsible AI is a shared commitment between Microsoft and its customers. While Microsoft builds AI applications with safety, fairness, and transparency at the core, customers play a critical role in deploying and using these technologies responsibly within their own contexts. To support this partnership, we offer the following best practices for deployers and end users to help customers implement responsible AI effectively.

### Deployers and end users should

- **Exercise caution and evaluate outcomes when using Microsoft Sentinel MCP Server for consequential decisions or in sensitive domains:** Consequential decisions are those that might have a legal or significant impact on a person's access to education, employment, financial platforms, government benefits, healthcare, housing, insurance, legal platforms, or that could result in physical, psychological, or financial harm. Sensitive domains—such as financial platforms, healthcare, and housing—require particular care due to the potential for disproportionate impact on different groups of people. When using AI for decisions in these areas, make sure that impacted stakeholders can understand how decisions are made, appeal decisions, and update any relevant input data.

- **Evaluate legal and regulatory considerations:** Customers need to evaluate potential specific legal and regulatory obligations when using any AI platforms and solutions, which might not be appropriate for use in every industry or scenario. Additionally, AI platforms or solutions aren't designed for and might not be used in ways prohibited in applicable terms of service and relevant codes of conduct.

### End users should

- **Exercise human oversight when appropriate:** Human oversight is an important safeguard when interacting with AI applications. While we continuously improve our AI applications, AI might still make mistakes. The outputs generated might be inaccurate, incomplete, biased, misaligned, or irrelevant to your intended goals. This could happen due to various reasons, such as ambiguity in the inputs or limitations of the underlying models. As such, users should review the responses generated by Microsoft Sentinel MCP Server and verify that they match their expectations and requirements.

- **Be aware of the risk of overreliance:** Overreliance on AI happens when users accept incorrect or incomplete AI outputs, mainly because mistakes in AI outputs might be hard to detect. For the end user, overreliance could result in decreased productivity, loss of trust, application abandonment, financial loss, psychological harm, physical harm, among others. In the context of Microsoft Sentinel MCP Server, overreliance might lead analysts to act on incorrect threat assessments, misclassified entities, or fabricated query results without proper verification, potentially resulting in missed threats or misdirected incident response efforts.
- **Exercise caution when designing agentic AI in sensitive domains:** Users should exercise caution when designing or deploying agentic AI applications in sensitive domains where agent actions are irreversible or highly consequential. Take extra precautions when creating autonomous agentic AI as described further in either the [Microsoft Enterprise AI Services Code of Conduct](/legal/ai-code-of-conduct) (for organizations) or the [Code of Conduct section in the Microsoft Services Agreement](https://www.microsoft.com/servicesagreement) (for individuals).
- **Write specific, detailed prompts:** Good prompts deliver good results. If prompts produce slow responses or outputs that lack ground truth, try writing more specific prompts. For example, a prompt that says "For user \<UPN\>, baseline their network, file, sign-in, and device events over 90 days and compare with +/- 10 minutes to find anomalies or suspicious activities to help me triage the severity and priority of this alert" is far more effective than "What is risky about \<UPN\>?".
- **Specify workspaces when working with multiple environments:** If you work with multiple Microsoft Sentinel data lake workspaces, be specific about which workspace ID you want tools to operate against. Use the `list_sentinel_workspaces` tool to identify available workspaces and include the workspace ID in your prompts to ensure consistent results.
- **Provide feedback to help improve the application:** Microsoft welcomes user feedback on Microsoft Sentinel MCP Server to help identify and address issues. Users can submit feedback through their Microsoft account representative or through the standard Microsoft support channels.

### Deployers should

- **Ensure proper onboarding and prerequisites:** Before deploying Microsoft Sentinel MCP Server, verify that your organization is onboarded to the Microsoft Sentinel data lake, the required Microsoft Defender products, and (where applicable) Microsoft Security Copilot. Ensure that users have the appropriate roles (Security reader at minimum) and that data connectors are properly configured to provide fresh, complete data for the tools to reason over.

- **Keep MCP clients compatible and up to date:** Microsoft Sentinel MCP Server implements the latest authorization specifications from MCP. Ensure that your connected clients (Visual Studio Code, Security Copilot, Copilot Studio, Foundry, ChatGPT, or Claude) are updated to the latest versions to prevent connectivity and authentication issues.
- **Configure tool collections for your security needs:** Deploy only the tool collections relevant to your organization's workflows. Use custom MCP tools to prescribe exactly what data agents can access, enforcing deterministic workflows with granular data control. This helps maintain a predictable, auditable security automation environment.
- **Monitor and audit usage:** Use Microsoft Sentinel data lake's auditing capabilities to track tool usage, data access, and query events. Regularly review audit logs to detect anomalous usage patterns or unauthorized access attempts. Familiarize your team with the [troubleshooting guide](troubleshoot-sentinel-mcp.md) to resolve predictable issues quickly.
- **Test in controlled environments before broad deployment:** Use the invite-only early access and preview features in controlled environments first, testing with representative prompts and data. Validate that tool outputs meet your organization's accuracy and performance standards before enabling broad access.
- **Configure rate limits and concurrency appropriately:** When using entity analyzer tools—especially in Azure Logic Apps with For Each loops—enable concurrency control and start with a low degree of parallelism (for example, 5) to prevent timeouts and avoid exceeding the entity analyzer's throughput limits. Adjust as needed based on your organization's usage patterns.
- **Plan for regional availability:** Deploy Microsoft Sentinel MCP Server for teams located in supported regions (Australia, Canada, Europe, India, Japan, Norway, Southeast Asia, Switzerland, United Kingdom, and United States) for optimal performance. Alert users in other regions about potential performance limitations.

## 11. Learn more about Microsoft Sentinel MCP Server

For more guidance or to learn more about the responsible use of Microsoft Sentinel MCP Server, we recommend reviewing the following documentation:

- [What is Microsoft Sentinel's support for MCP?](sentinel-mcp-overview.md)
- [Get started with Microsoft Sentinel MCP server](sentinel-mcp-get-started.md)
- [Tool collection in Microsoft Sentinel MCP server](sentinel-mcp-tools-overview.md)
- [Microsoft Sentinel MCP server pricing, limits, and availability](sentinel-mcp-billing.md)
- [Microsoft Sentinel MCP tool collection best practices and troubleshooting](troubleshoot-sentinel-mcp.md)
- [What is Microsoft Sentinel?](../overview.md)

### Learn more about responsible AI

- [Microsoft AI principles](https://www.microsoft.com/ai/principles-and-approach)
- [Microsoft responsible AI resources](https://www.microsoft.com/ai/responsible-ai)
- [Microsoft Azure Learning courses on responsible AI](/training/paths/responsible-ai-business-principles/)

