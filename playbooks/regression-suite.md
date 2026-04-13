# Regression Suite Playbook

Use this to maintain the curated regression suite and ensure bug fixes have
lasting coverage.

## Inputs

- existing regression manifest if any
- test inventory
- closed bugs
- GDD critical paths or completed sprint stories

## Modes

- `update`
- `audit`
- `report`

## Process

1. Load the current regression manifest if it exists.
2. Index existing tests.
3. Map recent fixes and critical paths to tests.
4. Flag missing regression coverage and stale or quarantined entries.
5. Update or report on `tests/regression-suite.md`.

## Recommended Roles

- primary: `agents/leads/qa-lead.md`
- consult: `agents/leads/lead-programmer.md`
