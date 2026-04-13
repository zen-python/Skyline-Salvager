# Team Combat Playbook

Use this as the reference multi-role workflow for a combat feature.

## Inputs

- feature description
- relevant combat GDD
- engine context
- current combat code and tests

## Phase 1: Design

Role: `agents/leads/game-designer.md`

Output:

- mechanic summary
- formulas
- edge cases
- acceptance criteria

## Phase 2: Architecture

Roles:

- `agents/leads/lead-programmer.md`
- `agents/specialists/engine-specialist.md`

Output:

- affected files
- interfaces
- integration points
- engine fit notes

## Phase 3: Implementation

Roles:

- `agents/specialists/gameplay-programmer.md`
- `agents/specialists/ai-programmer.md`
- `agents/specialists/technical-artist.md`
- `agents/specialists/sound-designer.md`

Run these in parallel only when ownership is clear.

## Phase 4: Validation

Roles:

- `agents/leads/qa-lead.md`
- `agents/specialists/qa-tester.md`

Output:

- test cases
- results
- open bugs
- verdict

## Coordination Rule

Use `agents/directors/producer.md` whenever:

- more than one stream blocks another
- multiple filesystems or domains overlap
- the user needs a delivery recommendation
