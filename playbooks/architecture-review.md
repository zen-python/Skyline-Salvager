# Architecture Review Playbook

Use this to validate whether the existing architecture covers all design
requirements and remains internally consistent.

## Inputs

- all in-scope GDDs
- systems index
- all ADRs
- architecture blueprint if present
- technical preferences

## Process

1. Extract technical requirements from each GDD.
2. Build a traceability matrix from requirement to ADR.
3. Classify each requirement:
   - covered
   - partial
   - gap
4. Check ADR-to-ADR consistency:
   - ownership conflicts
   - interface conflicts
   - dependency cycles
   - budget conflicts
5. Check engine compatibility consistency across ADRs.
6. Produce a pass, concerns, or fail verdict.

## Recommended Roles

- primary: `agents/directors/technical-director.md`
- consult: `agents/leads/lead-programmer.md`
- consult: the active engine specialist
- consult for sequencing implications: `agents/directors/producer.md`

## Output

- requirements traceability matrix
- uncovered requirements
- cross-ADR conflicts
- verdict and required fixes
