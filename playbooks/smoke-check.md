# Smoke Check Playbook

Use this after implementation and before QA hand-off to decide whether a build
is fit for broader testing.

## Inputs

- current sprint or quick-check scope
- test setup
- latest QA plan
- target platform notes

## Process

1. Detect the engine and test environment.
2. Confirm tests and smoke lists exist.
3. Run the automated suite appropriate to the project.
4. Verify critical paths and platform-specific checks.
5. Produce a PASS or FAIL report in `production/qa/`.

## Recommended Roles

- primary: `agents/leads/qa-lead.md`
- consult: `agents/leads/lead-programmer.md`
- consult: active engine specialist for runner or platform issues
