#!/usr/bin/env bash
set -euo pipefail

WORKFLOW_FILE=".github/workflows/MSecD-Shared-RequireWriterReview.yml"

if [[ ! -f "$WORKFLOW_FILE" ]]; then
  echo "ERROR: Missing workflow file: $WORKFLOW_FILE"
  exit 1
fi

require_pattern() {
  local pattern="$1"
  local description="$2"
  if ! grep -qE -- "$pattern" "$WORKFLOW_FILE"; then
    echo "FAIL: Missing expected workflow behavior: $description"
    exit 1
  fi
}

# Step 1: mutation error handling helpers should exist.
require_pattern "github_post_comment\(\)" "checked comment mutation helper"
require_pattern "github_add_label\(\)" "checked label-add mutation helper"
require_pattern "github_delete_label\(\)" "checked label-delete mutation helper"

# Step 2: approver parsing should be centralized.
require_pattern "find_approvers_file\(\)" "centralized approvers file discovery"
require_pattern "list_approver_entries\(\)" "centralized approver entry parsing"

# Step 3: retry/backoff + rate-limit visibility should exist.
require_pattern "github_get_with_retry\(\)" "retry helper for team resolution"
require_pattern "github_membership_http_code\(\)" "retry helper for membership lookups"
require_pattern "Low GitHub rate limit headroom" "rate-limit headroom warning logging"

# Step 4: policy constants should be centralized.
require_pattern "SIGN_OFF_COMMAND:" "centralized sign-off command constant"
require_pattern "QUALIFIES_LABEL:" "centralized qualifies label constant"
require_pattern "BLOCKED_LABEL:" "centralized blocked label constant"

# Step 5: operator summary should always emit.
require_pattern "- name: Write policy summary" "policy summary step"
require_pattern "if: always\(\)" "always-on summary step condition"

# Hardening: API reads should fail fast when fetch fails.
require_pattern "PR_HTTP_CODE" "PR fetch HTTP status check"
require_pattern "COMMENTS_HTTP_CODE" "comment fetch HTTP status check"

# Hardening: sign-off parsing should only consider exact command.
require_pattern 'first_line == \$signoff_cmd' "exact sign-off command parsing"

echo "PASS: require-writer-review regression checks passed."
