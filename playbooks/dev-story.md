# Dev Story Playbook

Use this to implement one story from planning through verification.

## Inputs

- story file
- referenced GDDs
- referenced ADRs
- existing codebase context

## Process

1. Read the story, GDD, and ADRs first.
2. Restate the scope and affected files.
3. Identify the active path rules for those files.
4. Propose the implementation plan.
5. Implement in small changes.
6. Run tests or manual verification.
7. Summarize what changed and what remains.

## Roles

- primary: `agents/leads/lead-programmer.md`
- consult: `agents/specialists/gameplay-programmer.md`
- consult as needed: `agents/specialists/engine-specialist.md`
- verify: `agents/specialists/qa-tester.md`
