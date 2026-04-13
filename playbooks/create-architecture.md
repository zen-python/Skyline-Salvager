# Create Architecture Playbook

Use this to produce the project's architecture blueprint before implementation
scales beyond a few isolated stories.

## Inputs

- concept document
- systems index
- all in-scope GDDs
- technical preferences
- existing ADRs if any
- engine reference docs or engine-specific constraints

## Process

1. Read the systems index and all relevant GDDs.
2. Extract technical requirements from each system.
3. Build a layer map:
   - presentation
   - feature
   - core
   - foundation
   - platform
4. Define module ownership for each major system.
5. Define data flow for critical scenarios.
6. Define API boundaries and integration contracts.
7. Identify decisions that must become ADRs.
8. Write the architecture blueprint in `docs/architecture/architecture.md`.

## Engine Awareness

- verify engine-sensitive assumptions before fixing module boundaries
- flag post-cutoff or risky engine APIs explicitly
- route engine-specific questions to the active engine specialist

## Recommended Roles

- primary: `agents/directors/technical-director.md`
- consult: `agents/leads/lead-programmer.md`
- consult: the active engine specialist
- consult for sequencing risk: `agents/directors/producer.md`

## Output

- architecture layer map
- module ownership map
- data-flow summary
- API boundaries
- required ADR list
