# Architecture Decision Playbook

Use this to author or retrofit a single Architecture Decision Record.

## Inputs

- decision title
- relevant GDDs
- existing ADRs
- engine context
- affected systems and constraints

## Process

1. State the problem the ADR is resolving.
2. Identify 2-3 alternatives.
3. Check for conflicts with existing ADRs or architectural stances.
4. Record dependencies and ordering constraints.
5. Record engine compatibility and version-sensitive assumptions.
6. Write the decision, consequences, and linked GDD requirements.

## ADR Sections

- Status
- Date
- Context
- Decision
- Alternatives Considered
- Consequences
- Engine Compatibility
- ADR Dependencies
- GDD Requirements Addressed

## Retrofit Mode

When an ADR exists already:

- preserve existing decision text
- add only missing structural sections
- never silently rewrite the accepted decision

## Recommended Roles

- primary: `agents/directors/technical-director.md`
- consult: `agents/leads/lead-programmer.md`
- consult: the active engine specialist

## Output

- new or updated ADR in `docs/architecture/`
- explicit follow-up ADRs if this decision unlocks more work
