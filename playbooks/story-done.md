# Story Done Playbook

Use this at the end of implementation to decide whether a story can be marked
complete.

## Inputs

- story file
- implementation files
- linked GDDs and ADRs
- tests or manual evidence

## Process

1. Read the story in full.
2. Extract acceptance criteria, story type, evidence expectations, and referenced files.
3. Verify each acceptance criterion by code inspection, tests, or explicit manual confirmation.
4. Check implementation drift against GDD and ADR expectations.
5. Check whether touched files exceeded the stated scope.
6. Require code review before final closure when code changed materially.
7. Produce a completion verdict and list any follow-up work.

## Evidence Rules

- Logic stories should have automated tests.
- Integration stories should have integration tests or explicit playtest evidence.
- Visual/Feel and UI stories should have manual evidence and sign-off notes.
- Config/Data stories should show smoke or validation evidence.

## Deviation Categories

- BLOCKING: contradicts GDD or ADR, or critical evidence is missing
- ADVISORY: equivalent outcome with minor drift or missing non-critical evidence
- OUT OF SCOPE: files changed outside the declared boundary

## Recommended Roles

- primary: `agents/leads/lead-programmer.md`
- verify: `agents/leads/qa-lead.md`
- consult: `playbooks/code-review.md`
- consult for engine-sensitive work: the active engine specialist

## Output

- verdict
- criterion-to-evidence summary
- blocking deviations
- advisory follow-ups
- recommended next story if one is already ready
