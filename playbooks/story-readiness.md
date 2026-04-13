# Story Readiness Playbook

Use this before implementation to decide whether a story is READY, NEEDS WORK,
or BLOCKED.

## Inputs

- story file
- related GDDs
- related ADRs
- technical preferences
- current sprint or milestone context

## Checklist

### Design Completeness

- the story traces to a concrete GDD rule, acceptance criterion, or requirement
- acceptance criteria are self-contained and testable
- no criterion depends on subjective judgment without a benchmark

### Architecture Completeness

- at least one ADR is referenced, or the story explicitly states why none apply
- referenced ADRs are accepted and still relevant
- engine notes are present when engine APIs or version-specific behaviors matter
- technical-preferences and path-rule implications are noted when relevant

### Scope Clarity

- estimate exists
- in-scope and out-of-scope boundaries are explicit
- dependencies are listed, or `None` is stated

### Open Questions

- no unresolved markers such as `TBD`, `TODO`, `UNRESOLVED`, or open `?` notes in requirements
- dependency stories exist and are not draft-only blockers

### Assets And Evidence

- referenced assets exist, or the story treats missing assets as explicit dependencies
- story type is declared
- expected test evidence is declared

## Verdict Rules

- READY: all critical checks pass
- NEEDS WORK: fixable gaps exist, but no hard blocker prevents assignment
- BLOCKED: missing dependency, draft dependency, missing accepted ADR, or unresolved critical design question

## Recommended Roles

- primary: `agents/leads/qa-lead.md`
- consult: `agents/leads/lead-programmer.md`
- consult for engine-sensitive stories: the active engine specialist

## Output

- verdict
- passing checks summary
- gaps with exact fixes
- blockers if any
