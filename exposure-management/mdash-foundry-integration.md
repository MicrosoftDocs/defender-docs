---
title: Set up Microsoft Foundry for Codename MDASH - Agentic code scanner integration
description: Connect Codename MDASH - Agentic code scanner to your Microsoft Foundry project by creating a resource, deploying the required models, and providing the project endpoint and API key.
ms.topic: how-to
ms.date: 08/13/2026
ai-usage: ai-assisted
---

# Connect Microsoft Foundry (Preview)

Create an Microsoft Foundry resource to use as part of the agentic code security setup. Microsoft Foundry hosts and serves the AI models that codename MDASH uses during agentic scans. 

## Prerequisites

- An Azure account with an active subscription. If you don't have one, create a [free Azure account, which includes a free trial subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn). 
- Access to a role that allows you to create a Foundry resource, such as **Owner** on the subscription or resource group. For more information about permissions, see [Role-based access control for Microsoft Foundry](/azure/foundry/concepts/rbac-foundry).

## Create an Microsoft Foundry resource

To create a Microsoft Foundry project, follow these steps.

1. Sign in to [Microsoft Foundry](https://ai.azure.com).
1. In the navigation bar, make sure the **New Foundry** toggle is on.
1. In the dropdown, select **Create a new project**.
1. Enter a **Project name**, such as `my-foundry-project`.
1. Select **Advanced options** to configure the resource group and location.
    - **Resource group**: Create a new resource group or select an existing one. If you create a new resource group, you can more easily manage the project and all its resources together.
    - **Location**: Select the region where the project will be created.
1. Select **Create project**.

Wait for the project to be created. When the project overview page appears, your project is ready. 

## Copy the required values

From the Foundry project's **home** page, copy the values that the service needs to connect to your Foundry project.

1. Locate **Project Endpoint**, and then copy it.
1. Locate **API Key**, and then copy it.

## Deploy the required models

Deploy the models required for the agentic code security integration.

1. Go to **Build** from the upper navigation menu.
1. From the menu, select **Models**, or **Deployments**.
1. Select the **Deployments** tab.
1. Select **Deploy a base model**.
1. Choose and deploy the following models with default or custom settings:
   - **GPT-General profile**: Deploy all three models:
     - `gpt-5.4`
     - `gpt-5.3-codex`
     - `gpt-5.4-mini`

     Deploy each model only once.

   - **MAI-Augmented profile (Preview)**:  To use this profile, deploy the three models listed previously and:
      
    - `MAI-Cyber-1-Flash`
        
> [!IMPORTANT]
> A predefined list of model deployments is required for the integration to work. You must deploy all three models: `gpt-5.4`, `gpt-5.3-codex`, and `gpt-5.4-mini`.
> > If you use **custom settings** when deploying the required models, avoid selecting **DataZoneBatch**, **GlobalBatch**, or **DeveloperTier**.

## Configure the TPM rate limit

For each of the three deployed models, configure the TPM rate limit.

1. Go to **Models** > **Deployment**.
1. Select a deployed model, and then select **Edit**.
1. Update **Tokens per Minute Rate Limit** to `1,000,000` or above.
1. Select **Save**.
1. Repeat these steps for each deployed model.

> [!NOTE]
> A minimum of 1,000,000 tokens per minute (TPM) is required for each model deployment.
> > To use concurrent scans, increase the TPM rate limit to at least 5,000,000 for each of the three required model deployments.
> Higher TPM allocations beyond the 5,000,000 TPM requirement can increase the number of concurrent scans available to your organization.
>  For more information about quota limits and requesting additional capacity, see [Azure OpenAI in Microsoft Foundry Models quotas and limits](/azure/foundry/openai/quotas-limits).

## Configure content filtering

Configure a content filter to ensure the deployed models can operate without restrictions. Codename MDASH sends security content that default filters might misclassify as harmful and block, causing missed findings. Minimum filter thresholds are required for reliable scans.

> [!WARNING]
> Configure content filtering is intentionally permissive for MDASH scanning scenarios. Create and use a dedicated Microsoft Foundry endpoint for MDASH only. Do not use this endpoint for any other workload.

### Prerequisites 

- A Microsoft Foundry resource is created, and three model deployments are completed. 
- The same setup applies to the new MAI-Cyber-1-Flash model, which is part of the MAI-Augmented profile (Preview).

### Create a content filter

To create a content filter, follow these steps:

1. Turn off the **New Foundry** toggle.
1. Navigate to **Guardrails + Controls** > **Content Filters**, and select **Create a content filter**.
1. Under **Input Filter**:
   1. Set all severity thresholds (**Violence**, **Hate**, **Sexual**, **Self-harm**) to the lowest possible level.
   1. Turn off **Prompt Shields for Jailbreak** and **Prompt Shields for Indirect Attack**.
1. Under **Output Filter**, apply the same configuration: set all category thresholds to the minimum level, and disable any optional protections that can be turned off, such as **Protected Material for text** and **Protected Material for code**.
1. In the **Deployment** step, associate the content filter with all three model deployments.
1. Review the summary and select **Create** to apply the filter.

## Allow Codename MDASH to access your Microsoft Foundry resource

Codename MDASH needs to access your Microsoft Foundry endpoint to validate credentials and run agentic scans. When your Foundry resource networking is set to **Selected networks and private endpoints**, all inbound traffic is blocked by default, including requests from MDASH. Without allowing the required IP addresses, validation of the Foundry resource during MDASH onboarding will fail.

> [!NOTE]
> If your Foundry resource has public access set to **All networks**, no action is required and you can continue to the next step.

To allow Codename MDASH to access your Microsoft Foundry resource, you should run script to configure access:

### Run a script 

Run the following script to automatically add the required IP addresses to your Foundry resource.

Before you run the script, make sure that:

- Azure CLI is installed.
- `jq` is installed.
- You're signed in to Azure CLI.
- The correct Azure subscription is selected.
- You have **Contributor** or **Owner** permissions on the Microsoft Foundry resource.

```bash
az account set --subscription <subscription-id>
```

Copy the following script and save it as `foundry-ip-rules.sh`.

```bash
#!/bin/bash
set -euo pipefail

# Replace with your Microsoft Foundry resource details.
RESOURCE_GROUP="<foundry-resource-group>"
RESOURCE_NAME="<foundry-resource-name>"
API_VERSION="2024-10-01"

IPS=(
   # ASPM Web API
   "20.216.90.48/28"
   "20.216.90.128/27"
   "20.216.90.160/29"
   "20.174.247.104/29"
   "20.174.247.160/27"
   "20.174.247.192/26"
   "4.195.142.192/26"
   "20.45.148.16/28"
   "20.45.148.64/26"
   "52.255.25.96/27"
   "52.255.26.0/26"
   "52.255.26.64/28"
   "128.24.1.160/27"
   "172.175.149.192/26"
   "172.175.150.0/29"
   "20.40.205.0/25"
   "172.170.23.192/26"
   "52.255.25.40/29"
   "20.49.100.0/27"
   "48.204.171.64/26"
   "48.204.171.128/25"
   "172.175.177.176/28"
   "4.247.188.16/28"
   "4.247.188.32/27"
   "4.247.188.128/29"
   "74.225.41.224/27"
   "74.225.42.0/26"
   "72.145.17.128/26"
   "74.178.112.128/28"
   "74.161.235.128/26"
   "74.161.235.192/27"
   "4.226.250.176/28"
   "4.226.250.192/26"
   "4.226.251.32/29"
   "172.165.75.128/26"
   "172.165.75.192/28"
   "20.58.74.128/27"
   "20.58.74.160/28"
   "48.199.128.240/28"
   "48.209.124.0/26"
   "48.199.128.232/29"
   "48.199.133.96/27"
   "172.175.149.40/29"
   "172.175.149.64/26"

   # ScannerService. Single hosts for Cognitive Services require bare IPs, not /32.
   "104.211.200.71"
   "104.211.201.192"
   "104.211.201.50"
   "104.211.201.51"
   "104.46.233.33"
   "104.46.233.67"
   "104.46.233.87"
   "130.33.185.234"
   "130.33.202.119"
   "130.33.219.176"
   "131.145.18.141"
   "134.112.1.46"
   "134.112.1.52"
   "134.112.1.53"
   "134.112.13.185"
   "134.112.147.138"
   "134.112.167.139"
   "134.112.167.67"
   "134.112.4.189"
   "135.149.44.23"
   "135.235.144.150"
   "135.235.144.187"
   "135.235.146.170"
   "145.133.61.218"
   "172.165.59.10"
   "172.194.141.170"
   "172.194.217.145"
   "172.215.236.113"
   "20.109.129.121"
   "20.11.91.116"
   "20.11.95.165"
   "20.162.184.22"
   "20.162.24.144"
   "20.162.24.92"
   "20.162.24.93"
   "20.162.65.100"
   "20.162.91.186"
   "20.165.140.244"
   "20.165.151.176"
   "20.165.151.56"
   "20.165.174.253"
   "20.165.205.170"
   "20.165.234.157"
   "20.165.236.243"
   "20.165.236.96"
   "20.165.237.202"
   "20.165.238.190"
   "20.167.12.148"
   "20.167.37.165"
   "20.167.37.233"
   "20.167.74.246"
   "20.167.93.128"
   "20.174.110.86"
   "20.174.145.41"
   "20.174.210.75"
   "20.174.40.24"
   "20.174.40.25"
   "20.174.40.30"
   "20.174.40.31"
   "20.174.45.75"
   "20.174.52.243"
   "20.174.56.196"
   "20.189.201.102"
   "20.190.97.30"
   "20.199.156.152"
   "20.199.156.153"
   "20.199.242.246"
   "20.199.243.150"
   "20.199.243.168"
   "20.199.243.221"
   "20.204.190.14"
   "20.204.220.227"
   "20.204.223.221"
   "20.208.161.207"
   "20.208.174.42"
   "20.208.174.48"
   "20.208.174.51"
   "20.208.195.174"
   "20.208.208.109"
   "20.208.219.170"
   "20.208.219.196"
   "20.208.219.212"
   "20.208.219.222"
   "20.208.71.207"
   "20.210.129.166"
   "20.210.74.194"
   "20.210.75.93"
   "20.211.143.180"
   "20.215.88.233"
   "20.215.92.253"
   "20.215.97.124"
   "20.215.97.127"
   "20.216.114.95"
   "20.216.73.20"
   "20.216.73.42"
   "20.216.83.177"
   "20.216.83.184"
   "20.216.83.209"
   "20.216.83.215"
   "20.227.117.88"
   "20.227.13.139"
   "20.227.80.166"
   "20.235.160.115"
   "20.235.160.129"
   "20.235.161.145"
   "20.235.161.49"
   "20.235.28.183"
   "20.235.31.237"
   "20.250.52.249"
   "20.250.82.4"
   "20.250.94.217"
   "20.254.10.208"
   "20.254.129.190"
   "20.26.65.37"
   "20.26.76.115"
   "20.26.97.68"
   "20.27.1.12"
   "20.27.145.27"
   "20.29.168.222"
   "20.3.68.203"
   "20.41.237.152"
   "20.41.238.3"
   "20.41.248.161"
   "20.41.248.217"
   "20.42.238.134"
   "20.42.238.143"
   "20.42.238.250"
   "20.45.68.1"
   "20.45.69.146"
   "20.45.72.33"
   "20.45.72.62"
   "20.49.172.249"
   "20.63.209.151"
   "20.63.209.208"
   "20.63.218.158"
   "20.63.218.90"
   "20.64.140.167"
   "20.68.110.201"
   "20.68.110.82"
   "20.69.29.166"
   "20.69.31.238"
   "20.69.65.49"
   "20.69.78.214"
   "20.70.106.32"
   "20.70.113.167"
   "20.70.113.215"
   "20.70.120.212"
   "20.70.67.48"
   "20.70.81.135"
   "20.70.81.159"
   "20.70.88.61"
   "20.70.90.144"
   "20.70.97.185"
   "20.70.98.111"
   "20.78.145.97"
   "20.78.154.200"
   "20.78.154.213"
   "20.78.25.32"
   "20.80.128.199"
   "20.89.225.114"
   "20.89.240.224"
   "20.89.248.208"
   "20.90.207.64"
   "20.90.229.224"
   "20.90.24.42"
   "20.90.28.144"
   "20.99.137.27"
   "23.101.236.20"
   "4.149.139.101"
   "4.149.231.71"
   "4.158.11.9"
   "4.165.158.55"
   "4.165.158.94"
   "4.165.225.95"
   "4.165.60.196"
   "4.166.213.157"
   "4.166.65.172"
   "4.187.235.192"
   "4.188.118.37"
   "4.188.118.72"
   "4.190.16.208"
   "4.195.101.238"
   "4.198.0.78"
   "4.224.155.228"
   "4.224.155.241"
   "4.224.191.134"
   "4.224.191.229"
   "4.224.191.56"
   "4.225.109.30"
   "4.225.196.217"
   "4.225.53.132"
   "4.225.55.83"
   "4.225.77.29"
   "4.226.115.190"
   "4.226.20.93"
   "4.226.22.143"
   "4.226.22.220"
   "4.226.46.240"
   "4.237.164.83"
   "4.242.88.151"
   "4.246.21.140"
   "4.247.232.121"
   "4.250.139.38"
   "4.254.89.110"
   "4.254.89.39"
   "4.255.166.236"
   "40.74.64.247"
   "40.81.155.253"
   "48.200.1.235"
   "48.200.114.83"
   "48.218.193.214"
   "48.218.239.115"
   "51.104.35.80"
   "51.104.58.106"
   "51.104.58.107"
   "51.107.172.134"
   "51.107.172.254"
   "51.107.225.181"
   "51.107.235.167"
   "51.107.236.148"
   "51.107.236.31"
   "51.11.18.122"
   "51.141.124.15"
   "51.141.124.22"
   "51.142.161.229"
   "52.140.53.223"
   "52.140.54.240"
   "52.161.49.73"
   "52.161.50.212"
   "52.185.180.52"
   "52.185.181.164"
   "74.161.66.49"
   "74.162.141.79"
   "74.162.141.97"
   "74.162.141.99"
   "74.162.165.123"
   "74.162.165.169"
   "74.162.165.209"
   "74.176.139.232"
   "74.176.169.132"
   "74.241.164.71"
   "74.243.11.239"
   "74.243.12.147"
   "74.243.13.0"
   "74.243.13.4"
   "74.243.13.9"
   "74.248.72.99"
   "74.248.74.226"
   "74.248.75.255"
   "74.248.76.190"
   "85.210.182.96"
   "9.223.145.21"
   "9.223.149.144"
   "9.223.169.160"
   "9.223.210.9"
   "98.70.233.44"
)

SUBSCRIPTION=$(az account show --query id -o tsv)
BASE_URL="https://management.azure.com/subscriptions/$SUBSCRIPTION/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.CognitiveServices/accounts/$RESOURCE_NAME"

NEW_RULES=$(printf '%s\n' "${IPS[@]}" | jq -R '{value: .}' | jq -s '.')

echo "Reading current network rules ..."
CURRENT_ACLS=$(az rest --method get \
   --url "$BASE_URL?api-version=$API_VERSION" \
   --query properties.networkAcls)

MERGED_ACLS=$(jq -n \
   --argjson cur "$CURRENT_ACLS" \
   --argjson new "$NEW_RULES" '
   {
       defaultAction: ($cur.defaultAction // "Deny"),
       ipRules: ((($cur.ipRules // []) + $new) | unique_by(.value)),
       virtualNetworkRules: ($cur.virtualNetworkRules // [])
   }')

echo "Applying $(jq 'length' <<<"$NEW_RULES") IP rules in one request ..."
az rest --method patch \
   --url "$BASE_URL?api-version=$API_VERSION" \
   --headers "Content-Type=application/json" \
   --body "$(jq -n --argjson acls "$MERGED_ACLS" '{properties: {networkAcls: $acls}}')" \
   --output none

echo "Done."
```

Update `RESOURCE_GROUP` and `RESOURCE_NAME`, and then run the script:

```bash
chmod +x foundry-ip-rules.sh
./foundry-ip-rules.sh
```

## Defender portal onboarding

Complete Defender portal onboarding from the getting started page. For more information, see [Step 3: Defender portal onboarding](ai-code-security-onboarding.md#step-3-defender-portal-onboarding).

## Disconnect Foundry

To replace a connected Foundry with a different one, or to remove the connection, you can disconnect at any time.

1. Go to the **Initiative** and select **Settings** (top-right).
1. Select **Disconnect** next to the connected Foundry resource, then confirm by selecting **Disconnect**.

Once disconnected, you can leave it as is, or reconnect at any time to the same Foundry or to a different one.

> [!NOTE]
> - Disconnecting the connected Foundry without providing an alternative will disable the use of the agentic code scanning.
> - Disconnecting only removes the connection from the agentic code scanner. The Microsoft Foundry resource itself isn't deleted.

## Related content

- [Agentic code security overview](ai-code-security-overview.md)
- [Set up agentic code security](ai-code-security-onboarding.md)
- [Install and run Defender CLI](defender-cli.md)
- [Trigger an on-demand agentic scan](trigger-on-demand-scan.md)
- [View results in the initiative](mdash-initiative.md)
- [Scan and secure your source code](/security/zero-trust/prioritizing-defense/scan-secure-source-code)

