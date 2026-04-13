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

echo "== Release Gate =="
echo "Root: $ROOT"

release_checklist=$(ls -t "$ROOT"/production/releases/release-checklist-*.md 2>/dev/null | head -1 || true)
launch_checklist=$(ls -t "$ROOT"/production/releases/launch-checklist-*.md 2>/dev/null | head -1 || true)

[ -n "$release_checklist" ] && pass "release checklist found: ${release_checklist#$ROOT/}" || warn "release checklist missing"
[ -n "$launch_checklist" ] && pass "launch checklist found: ${launch_checklist#$ROOT/}" || warn "launch checklist missing"

s1_count=0
s2_count=0
if [ -d "$ROOT/production/qa/bugs" ]; then
  s1_count=$(rg -n "S1|Severity: S1|\\*\\*Severity\\*\\*: S1" "$ROOT/production/qa/bugs" 2>/dev/null | wc -l | tr -d ' ' || true)
  s2_count=$(rg -n "S2|Severity: S2|\\*\\*Severity\\*\\*: S2" "$ROOT/production/qa/bugs" 2>/dev/null | wc -l | tr -d ' ' || true)
fi

if [ "${s1_count:-0}" -gt 0 ]; then
  warn "potential S1 bug references found: $s1_count"
else
  pass "no S1 bug references found"
fi

if [ "${s2_count:-0}" -gt 0 ]; then
  warn "potential S2 bug references found: $s2_count"
else
  pass "no S2 bug references found"
fi

placeholder_count=$(rg -n "placeholder|temp_|WIP_|localhost|127\\.0\\.0\\.1" "$ROOT/assets" "$ROOT/src" "$ROOT/docs" 2>/dev/null | wc -l | tr -d ' ' || true)
if [ "${placeholder_count:-0}" -gt 0 ]; then
  warn "placeholder or dev-only markers found: $placeholder_count"
else
  pass "no placeholder or localhost markers found in assets/src/docs"
fi

echo "Release gate completed."
