---
title: Syslog and CEF via AMA installations and troubleshooting
description: Troubleshoot Syslog and CEF ingestion with the Azure Monitor Agent (AMA) for Microsoft Sentinel, including validation, configuration, and common fixes.
author: EdB-MSFT
ms.author: edbaynash
ms.service: microsoft-sentinel
ms.topic: troubleshoot
ms.date: 12/31/2025
ms.custom: sentinel-data-connectors, has-external-links


#Customer intent: As a security engineer, I want to quickly validate and fix Syslog and CEF ingestion via the Azure Monitor Agent so that my Microsoft Sentinel workspace receives the expected data.
---

## Overview
Use this guide to validate and troubleshoot Syslog and Common Event Format (CEF) ingestion through the Azure Monitor Agent (AMA). Steps are written for incident responders and admins who need a fast, repeatable checklist.

## Before you start
- You can sign in to the Azure portal and the Log Analytics workspace used by Microsoft Sentinel.
- You can SSH to the log forwarder VM where AMA and rsyslog or syslog-ng run.

> [!TIP]
> Keep a terminal on the forwarder open. You’ll run most checks there.

## Key references
- [Syslog and CEF via AMA connectors for Microsoft Sentinel](/azure/sentinel/cef-syslog-ama-overview)
- [Ingest Syslog and CEF with AMA](/azure/sentinel/connect-cef-syslog-ama)
- [Configure specific appliance or device for CEF via AMA](/azure/sentinel/connect-cef-syslog-ama?tabs=portal#configure-specific-appliance)
- [Configure specific device for Syslog via AMA](/azure/sentinel/connect-cef-syslog-ama?tabs=portal#configure-specific-device)
- [Azure Monitor Agent overview](/azure/azure-monitor/agents/agents-overview)

## Fast path checklist
1. Confirm source logs reach the forwarder on port 514.
2. Verify AMA extension status and version in Azure.
3. Check local services and port bindings.
4. Validate rsyslog/syslog-ng configuration and AMA forwarding.
5. Confirm DCR presence and facilities/severities.
6. Send test CEF/ASA messages and query CommonSecurityLog.
7. Collect diagnostics if ingestion still fails.

## Troubleshoot AMA ingestion issues for CEF and ASA
Follow the steps in order. Stop when the issue is resolved.

### 1. Verify logs reach the forwarder
Confirm that devices actually deliver Syslog/CEF packets to the forwarder on port 514 before checking the agent pipeline.
- Allow up to 20 minutes for first-time ingestion.
- On the forwarder VM, confirm traffic on port 514:

```bash
sudo tcpdump -i any port 514 -A -vv
```

If you don’t see traffic, recheck the device configuration, IP/hostname, and any intermediate firewalls or load balancers.

### 2. Check AMA extension status and version in Azure
Validate that the AMA extension deployed correctly and is on a supported version so it can process incoming Syslog/CEF traffic.
- In the Azure portal, open the log collector VM > **Extensions + applications** > **AzureMonitorLinuxAgent**.
- StatusProvisioning must be **succeeded**.
- Version should match one of the latest available AMA versions. See [AMA version details](/azure/azure-monitor/agents/agents-overview#linux-agent-versions).

### 3. Run AMA Linux basic troubleshooting
Rule out known AMA health issues (connectivity, dependencies, permissions) that can block Syslog/CEF ingestion.
Follow [Troubleshoot the Azure Monitor Agent on Linux](/azure/azure-monitor/agents/azure-monitor-agent-troubleshoot-linux-vm-rsyslog) to fix agent health issues before continuing.

### 4. Check local service status
Confirm the required daemons are running: AMA for forwarding to Azure, and rsyslog/syslog-ng for receiving from devices.
On the forwarder VM:

```bash
sudo systemctl status azuremonitoragent.service
sudo systemctl status rsyslog.service    # or syslog-ng
```

Resolve any failed services, then proceed.

### 5. Validate rsyslog or syslog-ng configuration
Ensure the syslog daemon is listening on the right ports and forwarding to AMA; misconfiguration here prevents any upstream ingestion.
- Confirm listeners on port 514 in `/etc/rsyslog.conf` (or syslog-ng equivalent):

```bash
grep -E 'imudp|imtcp' /etc/rsyslog.conf
```

Expected defaults (rsyslog):
```
module(load="imudp")
input(type="imudp" port="514")
module(load="imtcp")
input(type="imtcp" port="514")
```

- Ensure the AMA forwarder config exists:

```bash
cat /etc/rsyslog.d/10-azuremonitoragent-omfwd.conf
```

Header should start with:
```
# Azure Monitor Agent configuration: forward logs to azuremonitoragent
```

### 6. Confirm port bindings
Verify the services are bound to the expected ports (514 for intake, 28330 for AMA) so messages flow through the local pipeline.
Check active listeners for rsyslog and AMA (mdsd component):

```bash
sudo ss -lnp | grep -E "28330|514"
```

Expected defaults:
- rsyslog listening on 514 TCP/UDP
- mdsd listening on 28330/TCP

### 7. Validate firewall rules
Ensure network paths are open from sources to rsyslog, from rsyslog to AMA, and from AMA to Azure; blocked ports stop ingestion.
Ensure connectivity for:
- Log source → rsyslog (port 514 TCP/UDP)
- rsyslog → AMA (local socket/28330)
- AMA → Azure (outbound per [network requirements](/azure/azure-monitor/agents/agent-network-requirements)).

### 8. Verify CEF or ASA DCR presence on the VM
Confirm the correct DCRs are applied locally so AMA knows what streams (CommonSecurityLog/CiscoASA) to collect and send.
Check cached DCR chunks:

```bash
sudo grep -i -r "SECURITY_CEF_BLOB" /etc/opt/microsoft/azuremonitoragent/config-cache/configchunks
sudo grep -i -r "SECURITY_CISCO_ASA_BLOB" /etc/opt/microsoft/azuremonitoragent/config-cache/configchunks
```

If absent, redeploy from the connector or recreate the DCR.

### 9. Temporarily enable all facilities and severities
Broaden collection during troubleshooting to avoid missing events due to overly narrow facility/severity filters; later tighten scope.
For troubleshooting, select all facilities (including messages with no facility/severity) in the connector UI or DCR. After validation, narrow to required facilities and severities.

### 10. Send test messages and trace with tcpdump
Generate known-good test events to validate end-to-end flow (device → rsyslog → AMA → Log Analytics) and observe packet forwarding.
Send CEF and ASA test events from the forwarder while tracing:

```bash
# CEF test
echo -n "<164>CEF:0|Mock-test|MOCK|common=event-format-test|end|TRAFFIC|1|rt=$common=event-formatted-receive_time" | nc -u -w0 localhost 514

# ASA test
echo -n "<164>%ASA-7-106010: Deny inbound TCP src inet:1.1.1.1 dst inet:2.2.2.2" | nc -u -w0 localhost 514

# Trace ingress/forwarding
sudo tcpdump -i any port 514 or 28330 -A -vv
```

Query in Log Analytics after a few minutes:

```kusto
// CEF test
CommonSecurityLog
| where TimeGenerated > ago(1d)
| where DeviceProduct == "MOCK"
| take 10
```

```kusto
// ASA test
CommonSecurityLog
| where TimeGenerated > ago(1d)
| where DeviceVendor == "Cisco" and DeviceProduct == "ASA"
| take 10
```

### 11. Check CEF or ASA log format
Validate message formatting so headers and extensions parse into CommonSecurityLog instead of falling into AdditionalExtensions.
Ensure sources emit valid CEF or ASA formatting:
- All seven CEF header fields are present and pipe (`|`) delimiters are unescaped in headers.
- Escape backslash `\\` and equals `\=` in extensions.
- Values that cannot be mapped per CEF/CommonSecurityLog mapping go to `AdditionalExtensions`.

Reference: ArcSight/MicroFocus CEF specification.

### 12. Collect diagnostics and enable AMA tracing (when needed)
Capture structured diagnostics to speed investigation and support cases, and enable temporary tracing when deeper inspection is needed.
- Run the AMA troubleshooter:

```bash
sudo wget -O Sentinel_AMA_troubleshoot.py https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/Syslog/Sentinel_AMA_troubleshoot.py && sudo python3 Sentinel_AMA_troubleshoot.py
```

Output is typically saved to `/tmp/troubleshooter_output_file.log`. Include it in support cases.

- Temporarily enable AMA trace flags for deeper logging:

```bash
# Option A: add trace flags to MDSD_OPTIONS
export MDSD_OPTIONS="-A -c /etc/opt/microsoft/azuremonitoragent/mdsd.xml -d -r $MDSD_ROLE_PREFIX -S $MDSD_SPOOL_DIRECTORY/eh -L $MDSD_SPOOL_DIRECTORY/events -e $MDSD_LOG_DIR/mdsd.err -w $MDSD_LOG_DIR/mdsd.warn -o $MDSD_LOG_DIR/mdsd.info -T 0x2002"

# Option B (recommended): set dedicated trace flag variable
export MDSD_TRACE_FLAGS="0x1002"

sudo systemctl restart azuremonitoragent

# Monitor incoming events
sudo tail -f -n 100 /var/opt/microsoft/azuremonitoragent/log/mdsd.info
```

> [!WARNING]
> Remove trace flags after debugging to avoid excessive logging and disk usage.

### 13. Review facility collection and live flow
Observe live ingestion to confirm facilities are being captured and events are flowing continuously.
- Check for facility/severity presence:

```bash
grep local0.info /var/opt/microsoft/azuremonitoragent/log/mdsd.info
```

- Watch incoming data in real time:

```bash
sudo tail -f /var/opt/microsoft/azuremonitoragent/log/mdsd.* | grep -a "CEF"
```

### 14. Optional: dump matching logs locally for offline review
Persist selected messages locally to compare AMA-formatted output versus default syslog formatting when troubleshooting parsing.
Create `/etc/rsyslog.d/11-test.conf` to capture messages containing `test`:

```bash
if ( $msg contains "test" ) then
  *.* action(type="omfile" File="/tmp/tmp-ama-template.log" action.resumeRetryCount="100" template="AMA_RSYSLOG_TraditionalForwardFormat")

if ( $msg contains "test" ) then
  *.* action(type="omfile" File="/tmp/tmp-default-format.log" action.resumeRetryCount="100" template="RSYSLOG_FileFormat")
```

Restart rsyslog and view:

```bash
sudo systemctl restart rsyslog
sudo tail -f /tmp/tmp-ama-template.log
sudo tail -f /tmp/tmp-default-format.log
```

### 15. Example DCR (trimmed)
Review a representative DCR structure to confirm required streams, facilities, and destinations are present when creating or auditing rules.
Use the connector to generate a fresh DCR; the following illustrates required sections:

```json
{
  "type": "Microsoft.Insights/dataCollectionRules",
  "kind": "Linux",
  "properties": {
    "dataSources": {
      "syslog": [
        {
          "streams": ["Microsoft-CommonSecurityLog", "Microsoft-CiscoAsa"],
          "facilityNames": ["local0"],
          "logLevels": ["Info"],
          "name": "sysLogsDataSource-<id>"
        }
      ]
    },
    "destinations": {
      "logAnalytics": [ { "workspaceResourceId": "<workspace-id>", "name": "la-default" } ]
    },
    "dataFlows": [ { "streams": ["Microsoft-CommonSecurityLog", "Microsoft-CiscoAsa"], "destinations": ["la-default"] } ]
  }
}
```

## Reference materials
- [Syslog and CEF via AMA connectors for Microsoft Sentinel](/azure/sentinel/cef-syslog-ama-overview)
- [Ingest Syslog and CEF with AMA](/azure/sentinel/connect-cef-syslog-ama)
- [Troubleshoot the Azure Monitor Agent on Linux](/azure/azure-monitor/agents/azure-monitor-agent-troubleshoot-linux-vm-rsyslog)
- [Structure of a data collection rule in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-overview)
- [CommonEventFormat mapping for CommonSecurityLog](/azure/sentinel/cef-name-mapping)
- [Network requirements for Azure Monitor Agent](/azure/azure-monitor/agents/agent-network-requirements)
