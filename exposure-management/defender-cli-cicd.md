---
title: CI/CD example for Defender CLI
description: Sample GitHub Actions workflow for running agentic code scans with Defender CLI in a CI/CD pipeline.
ms.topic: how-to
ms.date: 06/01/2026
ai-usage: ai-assisted
---

# CI/CD example for Defender CLI (private preview)

This sample GitHub Actions workflow downloads Defender CLI at runtime, passes credentials as environment variables, and runs both a file system scan and an AI scan submission. Use it as a baseline and adapt the trigger, path scope, and secret names to match your repository standards.

> [!IMPORTANT]
> Don't commit credential values to source control or include them in workflow logs. Rotate secrets regularly and replace them before they expire to avoid pipeline failures.

For instructions on obtaining the required credentials and configuring them as pipeline secrets, see [Configure credentials for CI/CD](defender-cli-authentication.md#configure-credentials-for-cicd).

```yaml
name: Defender ASPM scan
on: [workflow_dispatch]

permissions:
  contents: read
  id-token: write
  security-events: write

jobs:
  scan:
    runs-on: ubuntu-latest
    env:
      DEFENDER_ASPM_TENANT_ID:     ${{ secrets.DEFENDER_ASPM_TENANT_ID }}
      DEFENDER_ASPM_CLIENT_ID:     ${{ secrets.DEFENDER_ASPM_CLIENT_ID }}
      DEFENDER_ASPM_CLIENT_SECRET: ${{ secrets.DEFENDER_ASPM_CLIENT_SECRET }}
    steps:
      - uses: actions/checkout@v4
      - name: Download Defender CLI
        run: |
          curl -fL -o defender \
            "https://cli.dfd.security.azure.net/public/v2/latest/Defender_linux-x64"
          chmod +x defender
      - run: ./defender scan fs .
      - run: ./defender scan ai-scan submit . --force
```

## Related content

- [Install and run Defender CLI](defender-cli.md)
- [Defender CLI setup](defender-cli-authentication.md)
- [Auto-fix agentic code vulnerabilities](auto-fix-ai-vulnerabilities.md)
