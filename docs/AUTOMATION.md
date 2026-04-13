# Optional Automation Wrappers

These wrappers do not replace Codex approvals or human review. They exist to
make common checkpoints repeatable when you use the scaffold in a real project.

## Scripts

- `scripts/dev-gate.sh`
- `scripts/qa-gate.sh`
- `scripts/release-gate.sh`

Each script accepts an optional target project root. If omitted, the current
directory is used.

## Usage

### Development Gate

```bash
bash scripts/dev-gate.sh
bash scripts/dev-gate.sh examples/skyline-salvager
```

Checks:

- project structure
- core planning artifacts
- commit validation script
- TODO/FIXME/HACK counts

### QA Gate

```bash
bash scripts/qa-gate.sh
bash scripts/qa-gate.sh examples/skyline-salvager
```

Checks:

- test directory presence
- latest QA plan
- latest smoke report
- open bug count

### Release Gate

```bash
bash scripts/release-gate.sh
bash scripts/release-gate.sh examples/skyline-salvager
```

Checks:

- release and launch checklists
- open high-severity bugs
- stand-in asset or WIP markers
- dev/test leftovers like loopback host URLs

## Operating Model

Use the wrappers as preflight checks, not as a substitute for the playbooks.

Recommended cadence:

1. run `dev-gate.sh` before commits or large feature merges
2. run `qa-gate.sh` before asking QA or Codex to do broader test review
3. run `release-gate.sh` before generating or signing a release checklist

## Codex Prompt Pattern

```text
Run bash scripts/qa-gate.sh examples/skyline-salvager.
Summarize the warnings, then use playbooks/qa-plan.md to tell me what needs fixing first.
```

## Design Constraints

- wrappers are intentionally read-only
- wrappers only aggregate and surface signals already represented in the scaffold
- wrappers should fail loudly on missing critical structure and warn on softer gaps
