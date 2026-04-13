# Release Checklist Playbook

Use this to generate a pre-release checklist for a platform or release target.

## Inputs

- target platform
- current milestone or release scope
- bug state
- test state
- build and distribution constraints

## Process

1. Load project context and target platforms.
2. Scan for TODO, FIXME, and HACK markers.
3. Review available test evidence and known blockers.
4. Produce a checklist covering:
   - code health
   - build verification
   - quality gates
   - content readiness
   - platform requirements
   - store and distribution
   - launch readiness
5. Write the checklist into `production/releases/` after approval.

## Platform Extensions

- PC: controller support, resolution scaling, storefront SDKs
- Console: certification, suspend/resume, storage, user switching
- Mobile: permissions, store compliance, battery, touch coverage

## Recommended Roles

- primary: `agents/directors/producer.md`
- consult: `agents/leads/qa-lead.md`
- consult: `agents/directors/technical-director.md`

## Output

- release checklist
- blocker summary
- go/no-go framing
