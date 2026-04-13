# Test Flakiness Playbook

Use this to detect nondeterministic tests from CI or local result history.

## Inputs

- CI logs or result history
- existing regression suite
- quarantined tests if any

## Modes

- scan
- registry
- specific log path

## Process

1. Locate result history.
2. Parse per-test pass and fail patterns.
3. Identify intermittent failures.
4. Recommend:
   - quarantine
   - fix
   - collect more data
5. Update reports or quarantine notes.

## Recommended Roles

- primary: `agents/leads/qa-lead.md`
- consult: `agents/leads/lead-programmer.md`
