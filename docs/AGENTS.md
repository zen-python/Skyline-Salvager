# AGENTS Redirect

Use the root-level `AGENTS.md` for the active project instructions.

This file exists only because the operating layer was copied from the scaffold.

## Collaboration Mode

This system is collaborative, not autonomous.

- Ask before large multi-file writes, workflow transitions, or scope changes.
- Present 2-4 options when the user is making a product, design, or architecture decision.
- Prefer drafting or outlining before editing multiple source files.
- Keep artifacts explicit. If a decision matters later, write it to a design doc, ADR, sprint plan, or story.

## Primitive Replacements

The original Claude version relied on Claude-specific runtime features. Replace
them in Codex as follows:

- `CLAUDE.md` and path-scoped rules -> this `AGENTS.md` plus `docs/PATH-RULES.md`
- `AskUserQuestion` -> plain-text decision capture with short numbered options
- `Task` subagents -> Codex sub-agents when available and useful, otherwise role simulation in the main agent
- Claude hooks -> manual or scripted checkpoints in `scripts/`
- Claude status line -> `bash scripts/session-start.sh` plus explicit progress notes
- `.claude/settings.json` permissions -> Codex approval modes and sandbox settings in the Codex runtime
- slash skills -> markdown playbooks in `playbooks/`

## Delegation Rules

Use role cards from `agents/` to keep responsibilities clear.

- Directors frame decisions and guard quality bars.
- Leads translate goals into executable plans.
- Specialists produce implementation, content, tests, or focused review.
- The producer coordinates cross-domain changes and unresolved blockers.

If Codex sub-agents are available:

- only delegate bounded tasks with clear ownership
- pass the exact files and expected output
- keep write scopes disjoint
- do not spawn agents just to restate context

If sub-agents are not available:

- emulate the same structure by switching roles explicitly in the main session
- record which role produced which recommendation

## Core Workflow

The default path is:

1. `playbooks/start.md`
2. `playbooks/setup-engine.md`
3. `playbooks/brainstorm.md`
4. `playbooks/design-system.md`
5. `playbooks/create-stories.md`
6. `playbooks/story-readiness.md`
7. `playbooks/dev-story.md`
8. `playbooks/code-review.md`
9. `playbooks/story-done.md`

Use `playbooks/team-combat.md` as the reference pattern for multi-role feature work.
Use the architecture layer before implementation planning when the project has
multiple systems or open technical questions:

10. `playbooks/create-architecture.md`
11. `playbooks/architecture-decision.md`
12. `playbooks/architecture-review.md`

Use the release layer near ship:

13. `playbooks/release-checklist.md`
14. `playbooks/launch-checklist.md`

## Validation

Before commit:

1. run `bash scripts/validate-commit.sh "git commit -m draft"`
2. run the relevant tests
3. run the review playbook if code changed materially

Before push:

1. run `bash scripts/validate-push.sh "git push origin <branch>"`
2. verify no blocking findings remain

## Directory Intent

- `agents/` contains Codex role cards
- `playbooks/` contains workflow prompts and procedures
- `templates/` contains reusable project artifacts
- `scripts/` contains portable validation and context scripts
- `docs/` contains migration notes and operating guidance
