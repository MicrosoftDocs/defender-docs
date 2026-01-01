---
title: Syslog and CEF via AMA installations and troubleshooting
description: Validate and troubleshoot Syslog and CEF ingestion with the Azure Monitor Agent (AMA) for Microsoft Sentinel, from network checks to DCR verification and diagnostics.
author: EdB-MSFT
ms.author: edbaynash
ms.service: microsoft-sentinel
ms.topic: troubleshoot
ms.date: 01/01/2026
ms.custom: sentinel-data-connectors, has-external-links

#Customer intent: As a security engineer, I want a clear checklist to validate and fix Syslog and CEF ingestion via the Azure Monitor Agent so that Microsoft Sentinel receives the expected data.
---

## Overview
Use this guide to install, validate, and troubleshoot Syslog and CEF ingestion through the Azure Monitor Agent (AMA). Follow the ordered steps to identify where flow is breaking: source → forwarder (rsyslog/syslog-ng) → AMA → Log Analytics → Microsoft Sentinel.

## Prerequisites
- You can sign in to the Azure portal and to the Log Analytics workspace used by Microsoft Sentinel.
- You can connect via SSH to the log forwarder VM where AMA and rsyslog or syslog-ng run.
- You have permission to view and redeploy the AMA extension and DCRs.

## Key references
- [Syslog and CEF via AMA connectors for Microsoft Sentinel](/azure/sentinel/cef-syslog-ama-overview)
- [Ingest Syslog and CEF with AMA](/azure/sentinel/connect-cef-syslog-ama)
- [Configure specific appliance or device for CEF via AMA](/azure/sentinel/connect-cef-syslog-ama?tabs=portal#configure-specific-appliance)
- [Configure specific device for Syslog via AMA](/azure/sentinel/connect-cef-syslog-ama?tabs=portal#configure-specific-device)
- [Azure Monitor Agent overview](/azure/azure-monitor/agents/agents-overview)


## Table schema note
CEF StartTime and EndTime aren’t populated by default because vendor formats vary. If needed, extract start/end from `AdditionalExtension` in a custom transformation.

## How CEF via AMA works
CEF/ASA ingestion requires three components working together: 
1. A Data Collection Rule (DCR) targeting the workspace
1. The AMA extension on the forwarder, 
1. The installation script that configures rsyslog/syslog-ng to listen on port 514 and forward to AMA (port 28330 or Unix socket).

## Troubleshooting steps
Follow the steps in order. Each step states what it checks and why it matters.

### Check logs are being received
Confirm the forwarder actually receives Syslog/CEF packets on port 514 before deeper agent checks.
- Allow up to 20 minutes for first-time ingestion.
- On the forwarder VM, run:

```bash
sudo tcpdump -i any port 514 -A -vv
```

### Check AMA extension status in Azure
Ensure the AMA extension deployed successfully; a failed extension stops ingestion.
- Azure portal > VM > **Extensions + applications** > **AzureMonitorLinuxAgent**. StatusProvisioning must be **succeeded**.

### Check AMA extension version in Azure
Validate the AMA version is current enough to process Syslog/CEF reliably.
- In the same blade, confirm **Version** is one of the latest. See [AMA version details](/azure/azure-monitor/agents/agents-overview#linux-agent-versions).

### Run AMA Linux basic troubleshooting
Address known AMA health issues (connectivity, dependencies, permissions) before moving on.
- Follow [Troubleshoot the Azure Monitor Agent on Linux](/azure/azure-monitor/agents/azure-monitor-agent-troubleshoot-linux-vm-rsyslog).

### Check AMA service status locally
Confirm AMA is running so it can forward syslog to Azure.

```bash
sudo systemctl status azuremonitoragent.service
```

### Check the rsyslog status locally
Ensure the syslog daemon that receives device traffic is running.

```bash
sudo systemctl status rsyslog.service    # or syslog-ng
```

### Fix rsyslog config
If the daemon is stopped or misconfigured, correct it so it can listen and forward.

### Check the rsyslog configuration
Verify listeners and AMA forwarding are configured correctly.

```bash
grep -E 'imudp|imtcp' /etc/rsyslog.conf
cat /etc/rsyslog.d/10-azuremonitoragent-omfwd.conf
```

Expect port 514 listeners for UDP/TCP and a header beginning `# Azure Monitor Agent configuration: forward logs to azuremonitoragent`.

### Check port status
Confirm services are bound to expected ports to keep the local pipeline intact.

```bash
sudo ss -lnp | grep -E "28330|514"
```

Expected: rsyslog on 514 TCP/UDP, mdsd (AMA) on 28330/TCP.

### Check firewall rules
Verify no firewall blocks any hop: source → rsyslog (514), rsyslog → AMA (local/28330), AMA → Azure (outbound per [network requirements](/azure/azure-monitor/agents/agent-network-requirements)).

### Check CEF/ASA DCR configuration in Azure
Ensure the correct DCRs are applied locally so AMA knows to collect CommonSecurityLog or Cisco ASA streams.

```bash
sudo grep -i -r "SECURITY_CEF_BLOB" /etc/opt/microsoft/azuremonitoragent/config-cache/configchunks
sudo grep -i -r "SECURITY_CISCO_ASA_BLOB" /etc/opt/microsoft/azuremonitoragent/config-cache/configchunks
```

If missing, redeploy from the connector or recreate the DCR.

### Fix firewall rules (if needed)
Align firewall rules based on findings from step 10 to restore connectivity.

### Enable all CEF/ASA DCR facilities (temporary)
Broaden collection during troubleshooting to avoid missing events because of narrow facility/severity filters.

### Enable all DCR options (temporary)
Turn on all relevant options in the connector/DCR, restart the agent, and retest. Narrow scope after validation.

### Send CEF/ASA test message while running tcpdump
Validate end-to-end flow with known-good samples and watch packets traverse 514 → 28330.

```bash
# CEF test
echo -n "<164>CEF:0|Mock-test|MOCK|common=event-format-test|end|TRAFFIC|1|rt=$common=event-formatted-receive_time" | nc -u -w0 localhost 514

# ASA test
echo -n "<164>%ASA-7-106010: Deny inbound TCP src inet:1.1.1.1 dst inet:2.2.2.2" | nc -u -w0 localhost 514

# Trace ingress/forwarding
sudo tcpdump -i any port 514 or 28330 -A -vv
```

Query results in Log Analytics:

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

### Check CEF/ASA log format
Validate message structure so headers and extensions parse into CommonSecurityLog instead of falling into `AdditionalExtensions`.
- Seven CEF header fields present; pipe (`|`) delimiters unescaped in headers.
- Escape backslash `\\` and equals `\=` in extensions.
- See ArcSight/MicroFocus CEF specification.

### Send compliant CEF/ASA logs
Ensure sources emit properly formatted CEF/ASA logs; misformatted events will not parse correctly.

### Collect logs
Gather evidence before escalation.
- Save validation steps, screenshots, and dumps.
- Run the AMA troubleshooter:

```bash
sudo wget -O Sentinel_AMA_troubleshoot.py https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/Syslog/Sentinel_AMA_troubleshoot.py && sudo python3 Sentinel_AMA_troubleshoot.py
```

Output is typically `/tmp/troubleshooter_output_file.log`. Include it in cases.

### Debugging the Azure Monitoring Agent
Use AMA tracing when deeper inspection is required; disable afterward to avoid excess logs.

### Enable trace flags in MDSD process
Turn on targeted tracing to capture ingest and query pipeline details.

```bash
# Option A: add trace flags to MDSD_OPTIONS
export MDSD_OPTIONS="-A -c /etc/opt/microsoft/azuremonitoragent/mdsd.xml -d -r $MDSD_ROLE_PREFIX -S $MDSD_SPOOL_DIRECTORY/eh -L $MDSD_SPOOL_DIRECTORY/events -T 0x1002"

# Option B (recommended): dedicated trace flag variable
export MDSD_TRACE_FLAGS="0x1002"

sudo systemctl restart azuremonitoragent

# Watch incoming logs
sudo tail -f -n 100 /var/opt/microsoft/azuremonitoragent/log/mdsd.info
```

> [!WARNING]
> Remove trace flags after debugging to prevent excessive logging and disk fill.

### Review facility collection and log types
Observe live ingestion to verify facilities and severities are captured.

```bash
grep local0.info /var/opt/microsoft/azuremonitoragent/log/mdsd.info
sudo tail -f /var/opt/microsoft/azuremonitoragent/log/mdsd.* | grep -a "CEF"
```

### Test results for ASA log ingestion
Example diagnostic output showing Cisco ASA events uploaded as `SECURITY_CISCO_ASA_BLOB`.

```
2022-01-18T22:00:14.8650520Z: virtual bool Pipe::SyslogCiscoASAPipeStage::PreProcess(std::shared_ptr<CanonicalEntity>) (.../mdsd/PipeStages.cc +604) [PipeStage] Processing CiscoASA event '%ASA-1-105003: (Primary) Monitoring on 123'
2022-01-18T22:00:14.8651330Z: virtual void ODSUploader::execute(const MdsTime&) (.../mdsd/ODSUploader.cc +325) Uploading 1 SECURITY_CISCO_ASA_BLOB rows to ODS.
2022-01-18T22:00:14.8653090Z: int ODSUploader::UploadFixedTypeLogs(const string&, const string&, const std::function<void(bool, long unsigned int, int, long unsigned int)>&, int, uint64_t) (.../mdsd/ODSUploader.cc +691) Uploading to ODS with request 2a350138-7390-4fa5-8e37-a09c801b65ac Host https:// 1b1b1b1b-2222-cccc-3333-4d4d4d4d4d4d.ods.opinsights.azure.com for datatype SECURITY_CISCO_ASA_BLOB. Payload: {"DataType":"SECURITY_CISCO_ASA_BLOB","IPName":"SecurityInsights","ManagementGroupId":"00000000-0000-0000-0000-000000000002","sourceHealthServiceId":"00001111-aaaa-2222-bbbb-3333cccc4444","type":"JsonData","DataItems":[{"Facility":"local0","SeverityNumber":"6","Timestamp":"2022-01-14T23:28:49.775619Z","HostIP":"127.0.0.1","Message":" (Primary) Monitoring on 123","ProcessId":"","Severity":"info","Host":"localhost","ident":"%ASA-1-105003"}]} Uncompressed size: 443. Request size: 322
```

### Test results for CEF log ingestion
Example diagnostic output showing CEF events uploaded as `SECURITY_CEF_BLOB`.

```
2022-01-14T23:09:13.9087860Z: int ODSUploader::UploadFixedTypeLogs(const string&, const string&, const std::function<void(bool, long unsigned int, int, long unsigned int)>&, int, uint64_t) (.../mdsd/ODSUploader.cc +691) Uploading to ODS with request 6ca17f8a-f46e-42d6-8d39-7c67132605c1 Host https://contoso-ods.region.ods.opinsights.azure.com for datatype SECURITY_CEF_BLOB. Payload: {"DataType":"SECURITY_CEF_BLOB","IPName":"SecurityInsights","ManagementGroupId":"00000000-0000-0000-0000-000000000002","sourceHealthServiceId":"00001111-aaaa-2222-bbbb-3333cccc4444","type":"JsonData","DataItems":[{"Facility":"local0","SeverityNumber":"6","Timestamp":"2022-01-14T23:08:49.731862Z","HostIP":"127.0.0.1","Message":"0|device1|PAN-OS|8.0.0|general|SYSTEM|3|rt=Nov 04 2018 07:15:46 GMTcs3Label=Virtual","ProcessId":"","Severity":"info","Host":"localhost","ident":"CEF"}]} Uncompressed size: 482. Request size: 350
```

### Test commands to generate logs
Use additional samples to validate ingestion.

```bash
# CEF sample
echo "<134>$(date +"%b %d %T") localhost CEF: 0|device1|PAN-OS|8.0.0|general|SYSTEM|3|rt=Nov 04 2018 07:15:46 GMTcs3Label=Virtual" | nc -v -u -w 0 localhost 514

# ASA samples
echo "<134>$(date +"%b %d %T") localhost : %ASA-1-105003: (Primary) Monitoring on 123" | nc -v -u -w 0 localhost 514
echo "<134>$(date +"%b %d %T") HOSTNAMEHERE : %ASA-6-302013: Built inbound TCP connection 6529754 for Outside:10.10.10.10/53674 (10.10.10.10/53674)(LOCAL\\tdgreen) to Inside:10.10.10.10/2910 (10.10.10.10/2910) (tdgreen)" | nc -v localhost 514
```

### Logs dump (optional)
Persist selected messages locally for offline comparison of AMA formatting versus default syslog formatting.

```bash
if ( $msg contains "test" ) then
  *.* action(type="omfile" File="/tmp/tmp-ama-template.log" action.resumeRetryCount="100" template="AMA_RSYSLOG_TraditionalForwardFormat")

if ( $msg contains "test" ) then
  *.* action(type="omfile" File="/tmp/tmp-default-format.log" action.resumeRetryCount="100" template="RSYSLOG_FileFormat")
```

Restart rsyslog:

```bash
sudo systemctl restart rsyslog
sudo tail -f /tmp/tmp-ama-template.log
sudo tail -f /tmp/tmp-default-format.log
```

### Network forwarding (optional)
Forward matching traffic to another destination for live capture (uncomment the forwarding stanza in `11-test.conf`), then listen with:

```bash
while true; do nc -ulp 1337; done
```

### Example of DCR
Use the connector to generate a fresh DCR; ensure required streams, facilities, and destinations are present. Example:

```json
{
  "type": "Microsoft.Insights/dataCollectionRules",
  "apiVersion": "2021-04-01",
  "kind": "Linux",
  "properties": {
    "dataSources": {
      "syslog": [
        {
          "streams": ["Microsoft-CommonSecurityLog", "Microsoft-CiscoAsa"],
          "facilityNames": ["local0"],
          "logLevels": ["Info"],
          "name": "sysLogsDataSource"
        }
      ]
    },
    "destinations": {
      "logAnalytics": [
        {
          "workspaceResourceId": "<workspace-id>",
          "name": "la-default"
        }
      ]
    },
    "dataFlows": [
      {
        "streams": ["Microsoft-CommonSecurityLog", "Microsoft-CiscoAsa"],
        "destinations": ["la-default"]
      }
    ]
  }
}
```

## Reference materials
- [Syslog and CEF via AMA connectors for Microsoft Sentinel](/azure/sentinel/cef-syslog-ama-overview)
- [Ingest Syslog and CEF with AMA](/azure/sentinel/connect-cef-syslog-ama)
- [Configure specific appliance or device for CEF via AMA](/azure/sentinel/connect-cef-syslog-ama?tabs=portal#configure-specific-appliance)
- [Configure specific device for Syslog via AMA](/azure/sentinel/connect-cef-syslog-ama?tabs=portal#configure-specific-device)
- [Troubleshoot the Azure Monitor Agent on Linux](/azure/azure-monitor/agents/azure-monitor-agent-troubleshoot-linux-vm-rsyslog)
- [Structure of a data collection rule in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-overview)
- [CommonEventFormat mapping for CommonSecurityLog](/azure/sentinel/cef-name-mapping)
- [Network requirements for Azure Monitor Agent](/azure/azure-monitor/agents/agent-network-requirements)
