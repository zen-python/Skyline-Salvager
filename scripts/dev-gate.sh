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

echo "== Dev Gate =="
echo "Root: $ROOT"

[ -f "$ROOT/AGENTS.md" ] || fail "missing AGENTS.md"
pass "AGENTS.md found"

[ -d "$ROOT/design" ] || warn "design/ directory not found"
[ -d "$ROOT/src" ] || warn "src/ directory not found"
[ -d "$ROOT/production" ] || warn "production/ directory not found"

if [ -x "$ROOT/scripts/validate-commit.sh" ] || [ -f "$ROOT/scripts/validate-commit.sh" ]; then
  (cd "$ROOT" && bash scripts/validate-commit.sh "git commit -m gate-check") >/dev/null 2>&1 || fail "validate-commit.sh reported a blocking issue"
  pass "commit validation wrapper ran"
else
  warn "scripts/validate-commit.sh not found"
fi

todo_count=$(rg -n "TODO|FIXME|HACK" "$ROOT/src" "$ROOT/tests" "$ROOT/design" 2>/dev/null | wc -l | tr -d ' ' || true)
if [ "${todo_count:-0}" -gt 0 ]; then
  warn "found ${todo_count} TODO/FIXME/HACK markers across src/, tests/, or design/"
else
  pass "no TODO/FIXME/HACK markers found in tracked working areas"
fi

[ -f "$ROOT/design/gdd/game-concept.md" ] && pass "game concept present" || warn "game concept missing"
[ -f "$ROOT/docs/technical-preferences.md" ] && pass "technical preferences present" || warn "technical preferences missing"

echo "Dev gate completed."
