#!/bin/bash
set -euo pipefail

ROOT="${1:-.}"
PLAYBOOK_DIR="$ROOT/playbooks"
SKILL_DIR="$ROOT/plugins/openai-codex-game-studios/skills"

fail() { echo "FAIL: $1" >&2; exit 1; }
pass() { echo "PASS: $1"; }

[ -d "$PLAYBOOK_DIR" ] || fail "playbooks directory not found: $PLAYBOOK_DIR"
if [ ! -d "$SKILL_DIR" ]; then
  pass "plugin package not embedded in this repo; skipping plugin sync check"
  exit 0
fi

playbooks_file=$(mktemp)
skills_file=$(mktemp)
trap 'rm -f "$playbooks_file" "$skills_file"' EXIT

find "$PLAYBOOK_DIR" -maxdepth 1 -type f -name '*.md' \
  | sed 's#.*/##;s/\.md$//' \
  | sort > "$playbooks_file"

find "$SKILL_DIR" -mindepth 1 -maxdepth 1 -type d \
  | sed 's#.*/##' \
  | sort > "$skills_file"

missing_skills=$(comm -23 "$playbooks_file" "$skills_file" || true)
orphan_skills=$(comm -13 "$playbooks_file" "$skills_file" || true)

if [ -n "$missing_skills" ]; then
  echo "Missing plugin skill wrappers for playbooks:" >&2
  echo "$missing_skills" >&2
  exit 1
fi

if [ -n "$orphan_skills" ]; then
  echo "Plugin skills without matching playbooks:" >&2
  echo "$orphan_skills" >&2
  exit 1
fi

pass "playbooks and plugin skill wrappers are in sync"
