---
title: Set up Microsoft Foundry for Codename MDASH - Agentic code scanner integration
description: Connect Codename MDASH - Agentic code scanner to your Microsoft Foundry project by creating a resource, deploying the required models, and providing the project endpoint and API key.
ms.topic: how-to
ms.date: 06/03/2026
ai-usage: ai-assisted
---

# Connect Microsoft Foundry (private preview)

Create an Microsoft Foundry resource to use as part of the agentic code security setup.

## Create an Microsoft Foundry resource

Before you start, make sure that you can create resources in the target Azure subscription and resource group.

1. Go to the [Azure portal](https://portal.azure.com).
1. Search for **Microsoft Foundry**, and then under **Use with Foundry**, select **Foundry**.
1. Select **Create**, and then create a new Microsoft Foundry resource.
1. Choose the subscription and resource group.
1. Enter the resource name, region, and default project name.
1. Select **Review + create**, and then select **Create**.
1. After deployment finishes, select **Go to resource**.

## Open your Foundry project

Open the project that you created so you can deploy the required models and copy the onboarding values.

1. Go to the Microsoft Foundry resource that you created.
1. Open the project, or select **Go to Foundry portal** to open the Microsoft Foundry experience.

> [!NOTE]
> Make sure the **New Foundry** toggle in the top navigation bar is enabled. If you're using the Legacy Foundry experience, select **Start Building →** at the top.

## Deploy the required models

Deploy the models required for the agentic code security integration.

1. Go to **Build** from the upper navigation menu.
1. Open **Deployments**.
1. Select **Deploy a base model**.
1. Choose and deploy each of the following models with default settings or custom settings:
   - `gpt-5.4`
   - `gpt-5.3-codex`
   - `gpt-5.4-mini`
1. Repeat the deployment for each model until all three models are deployed. Each model should be deployed only once.

> [!NOTE]
> A predefined list of model deployments is required for the integration to work. You must deploy all three models: `gpt-5.4`, `gpt-5.3-codex`, and `gpt-5.4-mini`.

## Configure the TPM rate limit

For each of the three deployed models, configure the TPM rate limit.

1. Go to **Models** > **Deployment**.
1. Select a deployed model, and then select **Edit**.
1. Update **Tokens per Minute Rate Limit** to `1,000,000` or above.
1. Select **Save**.
1. Repeat these steps for each deployed model.

> [!NOTE]
> A minimum of 1,000,000 tokens per minute (TPM) per deployment is required to support MDASH scan throughput.

## Copy the required values

Copy the values that the service needs to connect to your Foundry project.

1. Locate **Project Endpoint**, and then copy it.
1. Locate **API Key**, and then copy it.

## Configure content filtering

Configure a content filter to ensure the deployed models can operate without restrictions. Codename MDASH sends security content that default filters might misclassify as harmful and block, causing missed findings. Minimum filter thresholds are required for reliable scans.

> [!NOTE]
> Configure content filtering is intentionally permissive for MDASH scanning scenarios. Create and use a dedicated Microsoft Foundry endpoint for MDASH only. Do not use this endpoint for any other workload.

**Prerequisites:** An Microsoft Foundry resource is created, and three model deployments are completed.

1. Turn off the **New Foundry** toggle.
1. Navigate to **Guardrails + Controls** > **Content Filters**, and select **Create a content filter**.
1. Under **Input Filter**:
   1. Set all severity thresholds (**Violence**, **Hate**, **Sexual**, **Self-harm**) to the lowest possible level.
   1. Turn off **Prompt Shields for Jailbreak** and **Prompt Shields for Indirect Attack**.
1. Under **Output Filter**, apply the same configuration: set all category thresholds to the minimum level, and disable any optional protections that can be turned off, such as **Protected Material for text** and **Protected Material for code**.
1. In the **Deployment** step, associate the content filter with all three model deployments.
1. Review the summary and select **Create** to apply the filter.

## Allow Codename MDASH to access your Microsoft Foundry resource

MDASH needs to access your Microsoft Foundry endpoint to validate credentials and run agentic scans.

If your Foundry resource has public access set to **All networks**, no action is required.

When your Foundry resource networking is set to **Selected networks and private endpoints**, all inbound traffic is blocked by default, including requests from MDASH. Without allowing the required IP addresses, validation of the Foundry resource during MDASH onboarding will fail.

Choose one of the following options to configure access:

### Option 1: Run a script (recommended)

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
   "4.165.158.55"
   "4.165.158.94"
   "4.165.225.95"
   "4.165.60.196"
   "4.166.213.157"
   "4.166.65.172"
   "4.225.109.30"
   "4.225.196.217"
   "4.225.53.132"
   "4.225.55.83"
   "4.225.77.29"
   "74.241.164.71"
   "9.223.145.21"
   "9.223.149.144"
   "9.223.169.160"
   "9.223.210.9"
   "134.112.1.46"
   "134.112.1.52"
   "134.112.1.53"
   "134.112.13.185"
   "134.112.147.138"
   "134.112.167.139"
   "134.112.167.67"
   "134.112.4.189"
   "20.215.88.233"
   "20.215.92.253"
   "20.215.97.124"
   "20.215.97.127"
   "74.248.72.99"
   "74.248.74.226"
   "74.248.75.255"
   "74.248.76.190"
   "172.194.141.170"
   "172.194.217.145"
   "20.109.129.121"
   "20.29.168.222"
   "20.3.68.203"
   "20.64.140.167"
   "20.69.65.49"
   "20.69.78.214"
   "20.80.128.199"
   "20.99.137.27"
   "4.149.139.101"
   "4.149.231.71"
   "4.242.88.151"
   "4.246.21.140"
   "48.200.1.235"
   "48.200.114.83"
   "172.215.236.113"
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
   "20.69.29.166"
   "20.69.31.238"
   "4.255.166.236"
   "52.161.49.73"
   "52.161.50.212"
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

### Option 2: Configure manually

1. Go to the Azure portal and open your Microsoft Foundry resource.
1. In the left pane, select **Resource Management** > **Networking**.
1. Ensure the access setting is **Selected networks and private endpoints**. If it's set to **Disabled**, change it accordingly.
1. Under **Firewall**, locate the **Address range** section.
1. Add the required IP addresses, one entry at a time:

   `20.216.90.48/28, 20.216.90.128/27, 20.216.90.160/29, 20.174.247.104/29, 20.174.247.160/27, 20.174.247.192/26, 4.195.142.192/26, 20.45.148.16/28, 20.45.148.64/26, 52.255.25.96/27, 52.255.26.0/26, 52.255.26.64/28, 128.24.1.160/27, 172.175.149.192/26, 172.175.150.0/29, 20.40.205.0/25, 172.170.23.192/26, 52.255.25.40/29, 20.49.100.0/27, 48.204.171.64/26, 48.204.171.128/25, 172.175.177.176/28, 4.247.188.16/28, 4.247.188.32/27, 4.247.188.128/29, 74.225.41.224/27, 74.225.42.0/26, 72.145.17.128/26, 74.178.112.128/28, 74.161.235.128/26, 74.161.235.192/27, 4.226.250.176/28, 4.226.250.192/26, 4.226.251.32/29, 172.165.75.128/26, 172.165.75.192/28, 20.58.74.128/27, 20.58.74.160/28, 48.199.128.240/28, 48.209.124.0/26, 48.199.128.232/29, 48.199.133.96/27, 172.175.149.40/29, 172.175.149.64/26, 4.165.158.55, 4.165.158.94, 4.165.225.95, 4.165.60.196, 4.166.213.157, 4.166.65.172, 4.225.109.30, 4.225.196.217, 4.225.53.132, 4.225.55.83, 4.225.77.29, 74.241.164.71, 9.223.145.21, 9.223.149.144, 9.223.169.160, 9.223.210.9, 134.112.1.46, 134.112.1.52, 134.112.1.53, 134.112.13.185, 134.112.147.138, 134.112.167.139, 134.112.167.67, 134.112.4.189, 20.215.88.233, 20.215.92.253, 20.215.97.124, 20.215.97.127, 74.248.72.99, 74.248.74.226, 74.248.75.255, 74.248.76.190, 172.194.141.170, 172.194.217.145, 20.109.129.121, 20.29.168.222, 20.3.68.203, 20.64.140.167, 20.69.65.49, 20.69.78.214, 20.80.128.199, 20.99.137.27, 4.149.139.101, 4.149.231.71, 4.242.88.151, 4.246.21.140, 48.200.1.235, 48.200.114.83, 172.215.236.113, 20.165.140.244, 20.165.151.176, 20.165.151.56, 20.165.174.253, 20.165.205.170, 20.165.234.157, 20.165.236.243, 20.165.236.96, 20.165.237.202, 20.165.238.190, 20.69.29.166, 20.69.31.238, 4.255.166.236, 52.161.49.73, 52.161.50.212`

1. Select **Save**.

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
