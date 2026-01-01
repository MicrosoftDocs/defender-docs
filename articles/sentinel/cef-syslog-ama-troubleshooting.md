---
title: Troubleshoot CEF and Syslog via AMA connectors in Microsoft Sentinel
description: Learn how to troubleshoot issues with CEF and Syslog data collection using the Azure Monitor Agent (AMA) in Microsoft Sentinel.
author: edbaynash
ms.author: edbaynash
ms.topic: troubleshooting
ms.date: 01/01/2026
---

# Troubleshoot CEF and Syslog via AMA connectors

This article provides troubleshooting guidance for Common Event Format (CEF) and Syslog data collection using the Azure Monitor Agent (AMA) in Microsoft Sentinel. Use this guide to diagnose and resolve ingestion issues with your log forwarder machines.

## Prerequisites

Before you begin troubleshooting, familiarize yourself with the following documentation:

- [Ingest syslog and CEF messages to Microsoft Sentinel with the Azure Monitor Agent](connect-cef-syslog-ama.md)
- [CEF via AMA data connector - Configure specific appliance or device](cef-syslog-ama-overview.md)
- [Azure Monitor Agent overview](/azure/azure-monitor/agents/azure-monitor-agent-overview)

## Architecture overview

Understanding the data flow helps identify where issues might occur:

```
[Log Source] --Port 514--> [RSyslog Service] --Port 28330--> [Azure Monitor Agent] --> [Log Analytics Workspace]
```

Key components:
- **RSyslog/Syslog-ng**: Receives logs on port 514 and forwards them to AMA
- **Azure Monitor Agent**: Processes logs according to Data Collection Rules (DCR)
- **Data Collection Rule**: Defines which logs to collect and where to send them

## Initial verification steps

### Verify logs are being received

Logs may take up to 20 minutes to appear in Microsoft Sentinel after configuration.

1. Run tcpdump to verify logs are arriving at the forwarder:

   ```bash
   sudo tcpdump -i any port 514 -A -vv
   ```

2. Verify your log source is configured to send messages to the correct forwarder IP address.

3. Check for infrastructure components that might affect connectivity:
   - Firewalls
   - Load balancers
   - Network security groups

### Check Azure Monitor Agent extension status

1. In the Azure portal, navigate to your log forwarder virtual machine.
2. Select **Extensions + applications**.
3. Select the **AzureMonitorLinuxAgent** extension.
4. Verify that **Status** shows **Provisioning succeeded**.

### Verify agent version

1. In the **AzureMonitorLinuxAgent** extension blade, check the **Version** field.
2. Ensure the version is one of the 2-3 most recent releases. See [AMA version details](/azure/azure-monitor/agents/azure-monitor-agent-manage#agent-versions) for the latest versions.

> [!NOTE]
> New versions may take up to 5 weeks to roll out after initial release.

## Agent-level troubleshooting

### Check service status

Check the AMA service status on your log forwarder:

```bash
sudo systemctl status azuremonitoragent.service
```

Check the rsyslog service status:

```bash
sudo systemctl status rsyslog.service
```

For syslog-ng environments, check:

```bash
sudo systemctl status syslog-ng.service
```

### Verify RSyslog configuration

The RSyslog configuration consists of `/etc/rsyslog.conf` and files in `/etc/rsyslog.d/`.

1. Verify port configuration:

   ```bash
   grep -E 'imudp|imtcp' /etc/rsyslog.conf
   ```

   Expected output:

   ```
   module(load="imudp")
   input(type="imudp" port="514")
   module(load="imtcp")
   input(type="imtcp" port="514")
   ```

2. Verify the AMA forwarding configuration exists:

   ```bash
   cat /etc/rsyslog.d/10-azuremonitoragent-omfwd.conf
   ```

   The file should start with:

   ```
   # Azure Monitor Agent configuration: forward logs to azuremonitoragent
   ```

### Verify port status

Check that the required ports are listening:

```bash
sudo ss -lnp | grep -E "28330|514"
```

Expected output:

```
udp   UNCONN 0      0      0.0.0.0:514         0.0.0.0:*    users:(("rsyslogd",pid=12289,fd=5))
tcp   LISTEN 0      10     127.0.0.1:28330     0.0.0.0:*    users:(("mdsd",pid=1424,fd=1363))
tcp   LISTEN 0      25     0.0.0.0:514         0.0.0.0:*    users:(("rsyslogd",pid=12289,fd=7))
```

This confirms:
- RSyslog is listening on port 514 (TCP and UDP)
- MDSD (AMA component) is listening on port 28330 (TCP)

### Verify Data Collection Rule configuration

Check if the DCR is properly configured on the agent.

For CEF logs:

```bash
sudo grep -i -r "SECURITY_CEF_BLOB" /etc/opt/microsoft/azuremonitoragent/config-cache/configchunks
```

For Cisco ASA logs:

```bash
sudo grep -i -r "SECURITY_CISCO_ASA_BLOB" /etc/opt/microsoft/azuremonitoragent/config-cache/configchunks
```

The output should show a JSON string containing the DCR configuration.

### Review firewall rules

Ensure firewall rules allow communication between:
- Log source and RSyslog (port 514)
- RSyslog and AMA (port 28330)
- AMA and Azure endpoints

## Data Collection Rule configuration

### Enable all facilities for troubleshooting

For initial troubleshooting:

1. In the Azure portal, navigate to your Data Collection Rule.
2. Enable all syslog facilities.
3. Select all log levels.
4. If available, enable collection of messages with no facility or severity.

For more information, see [Select facilities and severities](connect-cef-syslog-ama.md).

## Test log ingestion

### Send test messages

Test CEF ingestion:

```bash
echo -n "<164>CEF:0|Mock-test|MOCK|common=event-format-test|end|TRAFFIC|1|rt=$common=event-formatted-receive_time" | nc -u -w0 localhost 514
```

Test Cisco ASA ingestion:

```bash
echo -n "<164>%ASA-7-106010: Deny inbound TCP src inet:1.1.1.1 dst inet:2.2.2.2" | nc -u -w0 localhost 514
```

### Monitor log flow

While sending test messages, monitor with tcpdump:

```bash
sudo tcpdump -i any port 514 or 28330 -A -vv
```

You should see messages arrive on port 514 and forward to port 28330.

### Verify logs in Log Analytics

After sending test messages, query your Log Analytics workspace.

For CEF logs:

```kusto
CommonSecurityLog
| where TimeGenerated > ago(1d)
| where DeviceProduct == "MOCK"
```

For Cisco ASA logs:

```kusto
CommonSecurityLog
| where TimeGenerated > ago(1d)
| where DeviceVendor == "Cisco"
| where DeviceProduct == "ASA"
```

## Common Event Format (CEF) validation

### CEF format requirements

CEF uses Syslog as a transport mechanism with this structure:

```
<Priority>Timestamp Hostname CEF:Version|Device Vendor|Device Product|Device Version|Device Event Class ID|Name|Severity|[Extension]
```

Example:

```
Jan 18 11:07:53 host CEF:0|Vendor|Product|1.0|100|EventName|5|src=10.0.0.1 dst=10.0.0.2
```

### Common CEF formatting issues

**Incorrect header format**
- Ensure the CEF version is present: `CEF:0|`
- All header fields must be present and delimited by pipe (|) characters

**Improper character escaping**
- Pipe characters (|) in header values must be escaped: `\|`
- Backslashes (\) must be escaped: `\\`
- Equal signs (=) in extensions must be escaped: `\=`

**Missing or unmapped values**
- If a value can't be mapped to a standard field, it's stored in the `AdditionalExtensions` column
- See [CEF and CommonSecurityLog field mapping](cef-name-mapping.md) for field mappings

For the complete CEF specification, search for "Implementing ArcSight Common Event Format (CEF)" documentation.

## Advanced troubleshooting

### Enable diagnostic tracing

> [!WARNING]
> Enable trace flags only for troubleshooting sessions. Trace flags generate extensive logging that can fill disk space quickly.

1. Edit the AMA configuration file:

   ```bash
   sudo vim /etc/default/azuremonitoragent
   ```

2. Add trace flags to the MDSD_OPTIONS line:

   ```bash
   export MDSD_OPTIONS="-A -c /etc/opt/microsoft/azuremonitoragent/mdsd.xml -d -r $MDSD_ROLE_PREFIX -S $MDSD_SPOOL_DIRECTORY/eh -L $MDSD_SPOOL_DIRECTORY/events -e $MDSD_LOG_DIR/mdsd.err -w $MDSD_LOG_DIR/mdsd.warn -o $MDSD_LOG_DIR/mdsd.info -T 0x2002"
   ```

3. Restart the agent:

   ```bash
   sudo systemctl restart azuremonitoragent
   ```

4. Reproduce the issue and wait a few minutes.

5. Review debug information in `/var/opt/microsoft/azuremonitoragent/log/mdsd.info`.

6. Remove the trace flag and restart the agent after troubleshooting.

### Monitor log processing in real-time

View incoming logs as they're processed:

```bash
tail -f /var/opt/microsoft/azuremonitoragent/log/mdsd.info
```

Filter for specific log types:

```bash
sudo tail -f /var/opt/microsoft/azuremonitoragent/log/mdsd.* | grep -a "CEF"
```

Review specific facility logs:

```bash
grep local0.info /var/opt/microsoft/azuremonitoragent/log/mdsd.info
```

## Collect diagnostic information

Before opening a support case, collect the following information:

### Run the AMA troubleshooter

```bash
sudo wget -O Sentinel_AMA_troubleshoot.py https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/Syslog/Sentinel_AMA_troubleshoot.py && sudo python3 Sentinel_AMA_troubleshoot.py
```

The output is saved to `/tmp/troubleshooter_output_file.log`.

### Collect detailed logs

1. Enable trace flags as described in [Enable diagnostic tracing](#enable-diagnostic-tracing).
2. Reproduce the issue by sending test messages.
3. Wait a few minutes for logs to be generated.
4. Remove trace flags and restart the agent.
5. Create an archive of `/var/opt/microsoft/azuremonitoragent/log/`.

### Information to include

- All troubleshooting steps performed
- Screenshots of configuration and errors
- Output from the AMA troubleshooter script
- Agent logs with trace flags enabled
- Sample log messages from your source system

## Related content

- [Ingest syslog and CEF messages with Azure Monitor Agent](connect-cef-syslog-ama.md)
- [CEF and Syslog via AMA connectors overview](cef-syslog-ama-overview.md)
- [Troubleshoot the Azure Monitor Agent](/azure/azure-monitor/agents/azure-monitor-agent-troubleshoot-linux-vm)
- [Data collection rules in Azure Monitor](/azure/azure-monitor/essentials/data-collection-rule-overview)
