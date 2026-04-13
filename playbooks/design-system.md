# Design System Playbook

Use this to author or refine a game design document for one system.

## Inputs

- concept document
- systems index
- chosen system name
- engine constraints if known

## Process

1. Restate the system goal and player fantasy.
2. Define detailed rules.
3. Define formulas and named variables.
4. Enumerate edge cases.
5. Identify dependencies.
6. Expose tuning knobs and safe ranges.
7. Write acceptance criteria that QA can execute.
8. Save the result using `templates/technical-design-document.md` or the project's GDD layout.

## Roles

- primary: `agents/leads/game-designer.md`
- consult: `agents/directors/creative-director.md`
- consult: `agents/leads/qa-lead.md`
- consult when visuals matter: `agents/leads/art-director.md`

## Path Rule Reminder

If writing under `design/gdd/**`, include:

- overview
- player fantasy
- detailed rules
- formulas
- edge cases
- dependencies
- tuning knobs
- acceptance criteria
