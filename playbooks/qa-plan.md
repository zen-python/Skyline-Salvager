# QA Plan Playbook

Use this to build a QA plan for a sprint, feature, epic, or single story before
implementation or QA hand-off begins.

## Inputs

- stories in scope
- referenced GDDs and acceptance criteria
- story types
- engine and platform context

## Process

1. Resolve the scope.
2. Read the stories and extract acceptance criteria, dependencies, and story type.
3. Classify each story as Logic, Integration, Visual/Feel, UI, or Config/Data.
4. Decide:
   - what must be automated
   - what must be manually verified
   - what belongs in smoke
   - what needs playtest sign-off
5. Write a QA plan in `production/qa/`.

## Recommended Roles

- primary: `agents/leads/qa-lead.md`
- consult: `agents/leads/lead-programmer.md`
- consult: active engine specialist when test setup is engine-specific
