#!/bin/bash
set -euo pipefail

ROOT="${1:-.}"

if [ ! -d "$ROOT" ]; then
  echo "ERROR: project root not found: $ROOT" >&2
  exit 1
fi

pass() { echo "PASS: $1"; }
warn() { echo "WARN: $1"; }
fail() { echo "FAIL: $1"; exit 1; }

echo "== QA Gate =="
echo "Root: $ROOT"

[ -d "$ROOT/tests" ] || fail "tests/ directory missing"
pass "tests/ directory found"

latest_plan=$(ls -t "$ROOT"/production/qa/qa-plan-*.md 2>/dev/null | head -1 || true)
if [ -n "$latest_plan" ]; then
  pass "QA plan found: ${latest_plan#$ROOT/}"
else
  warn "no QA plan found under production/qa/"
fi

latest_smoke=$(ls -t "$ROOT"/production/qa/smoke-*.md 2>/dev/null | head -1 || true)
if [ -n "$latest_smoke" ]; then
  pass "smoke report found: ${latest_smoke#$ROOT/}"
else
  warn "no smoke report found under production/qa/"
fi

open_bugs=0
if [ -d "$ROOT/production/qa/bugs" ]; then
  open_bugs=$(rg -n "^\\*\\*Status\\*\\*: Open|^Status: Open" "$ROOT/production/qa/bugs" 2>/dev/null | wc -l | tr -d ' ' || true)
fi

if [ "${open_bugs:-0}" -gt 0 ]; then
  warn "open bug count: $open_bugs"
else
  pass "no open bugs detected in production/qa/bugs/"
fi

if [ -d "$ROOT/tests/unit" ] || [ -d "$ROOT/tests/integration" ]; then
  pass "test subdirectories present"
else
  warn "tests/unit or tests/integration not found"
fi

echo "QA gate completed."
