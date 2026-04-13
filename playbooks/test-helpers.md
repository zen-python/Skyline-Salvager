# Test Helpers Playbook

Use this to create shared test helpers and mocks once patterns start repeating.

## Inputs

- engine and language
- existing test files
- target system or `all`

## Process

1. Detect engine and current test framework.
2. Sample representative test files.
3. Extract repeated setup, assertions, and mock patterns.
4. Generate helpers in `tests/helpers/`.
5. Keep helper APIs aligned with the existing test style.

## Recommended Roles

- primary: `agents/leads/lead-programmer.md`
- consult: `agents/leads/qa-lead.md`
- consult: active engine or language sub-specialist
