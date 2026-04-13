# Test Setup Playbook

Use this once per project or engine migration to scaffold testing and CI.

## Inputs

- configured engine
- desired test framework
- current repo state

## Process

1. Detect engine and existing test infrastructure.
2. Present the directory and CI plan before writing.
3. Create missing test directories and docs.
4. Add engine-appropriate runner configuration.
5. Add CI workflow wiring if the project wants it.

## Recommended Roles

- primary: `agents/leads/lead-programmer.md`
- consult: `agents/leads/qa-lead.md`
- consult: active engine specialist
