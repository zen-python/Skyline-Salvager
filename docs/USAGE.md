# Usage In Codex

## Intended Runtime

This project is the first real game repo using the embedded Codex operating
layer. The minimum assumption is that Codex can read `AGENTS.md`, inspect
files, edit the workspace, run shell commands, and optionally delegate bounded
tasks.

## Open A Session

Use this directory as the root workspace when you want to build Skyline
Salvager directly.

At the beginning of a session, ask Codex to do this:

```text
Read AGENTS.md, docs/USAGE.md, docs/WORKFLOW-TRACE.md, and docs/PATH-RULES.md.
Then run bash scripts/session-start.sh and tell me the best next story task.
```

## Standard Session Flow

1. Load `AGENTS.md`.
2. Run `bash scripts/session-start.sh`.
3. Choose the next workflow from `playbooks/`.
4. Load the relevant role cards from `agents/`.
5. Produce or update artifacts in `design/`, `docs/`, `production/`, `src/`, or `tests/` in the target project.
6. Run validation scripts before commit or push.

## Current Example Flow

This repo itself is the example flow.

Start here:

- `production/epics/salvage/story-001-magnetic-crate-pull.md`
- `production/reviews/story-001-readiness.md`
- `production/reviews/story-001-code-review.md`
- `production/reviews/story-001-done.md`
- `production/qa/test-evidence/story-001-magnetic-crate-pull.md`

## How To Use The Playbooks

The playbooks are markdown procedures, not hard-coded runtime commands.

- `playbooks/create-architecture.md` for the architecture blueprint
- `playbooks/architecture-decision.md` for ADR authoring
- `playbooks/architecture-review.md` for coverage and consistency review
- `playbooks/start.md` for onboarding and project-state routing
- `playbooks/setup-engine.md` for engine selection and technical preference setup
- `playbooks/brainstorm.md` for concept definition
- `playbooks/design-system.md` for GDD authoring
- `playbooks/create-stories.md` for implementation slicing
- `playbooks/story-readiness.md` for pre-implementation gating
- `playbooks/dev-story.md` for execution
- `playbooks/code-review.md` for review
- `playbooks/story-done.md` for completion and closure review
- `playbooks/team-combat.md` for multi-role orchestration
- `playbooks/release-checklist.md` for pre-release validation
- `playbooks/launch-checklist.md` for launch-day readiness
- `playbooks/qa-plan.md` for sprint or feature test planning
- `playbooks/smoke-check.md` for pre-QA build gating
- `playbooks/soak-test.md` for endurance test protocols
- `playbooks/regression-suite.md` for regression coverage management
- `playbooks/test-setup.md` for test infrastructure scaffolding
- `playbooks/test-helpers.md` for shared test helpers
- `playbooks/test-evidence-review.md` for evidence-quality review
- `playbooks/test-flakiness.md` for flaky test diagnosis
- `playbooks/skill-test.md` for Codex playbook/plugin structural review
- `playbooks/skill-improve.md` for playbook improvement loops
- `playbooks/milestone-review.md` for milestone go/no-go review
- `playbooks/retrospective.md` for sprint or milestone retrospective analysis
- `playbooks/bug-report.md` for structured bug capture and verification
- `playbooks/bug-triage.md` for backlog prioritization and assignment
- `playbooks/reverse-document.md` for deriving docs from existing code or prototypes
- `playbooks/playtest-report.md` for structured playtest capture and analysis

Recommended prompt pattern:

```text
Read AGENTS.md, playbooks/design-system.md, agents/leads/game-designer.md,
agents/directors/creative-director.md, and docs/PATH-RULES.md.
Act on that playbook for the combat system and stop before writing until I approve.
```

## How To Emulate Claude UI Decisions

When a playbook says to stop for a decision:

1. Codex explains the trade-offs.
2. Codex presents 2-4 numbered options.
3. The user replies with the selected number.
4. Codex proceeds.

## How To Emulate Claude Subagents

If your Codex environment supports sub-agents, use them for:

- isolated review tasks
- parallel specialist analysis
- independent implementation streams

If not, keep the same structure by asking Codex to switch roles explicitly:

```text
First answer as the game-designer. Then answer as the lead-programmer.
Then synthesize as the producer.
```

## Validation Commands

Run these manually in Codex before important operations:

```bash
bash scripts/session-start.sh
bash scripts/validate-commit.sh "git commit -m draft"
bash scripts/validate-push.sh "git push origin my-branch"
bash scripts/dev-gate.sh
bash scripts/qa-gate.sh
bash scripts/release-gate.sh
```

## Optional Automation Wrappers

See `docs/AUTOMATION.md` for the wrapper layer around the manual scripts.
These wrappers are intentionally simple and read-only.

## Recommended Project Layout

When you copy this operating layer into a real game project, keep the original
artifact layout:

```text
src/
assets/
design/
docs/
tests/
prototypes/
production/
```

The templates in `templates/` assume that structure.

## Current Implementation Focus

- `src/gameplay/salvage_beam.gd`
- `src/gameplay/salvage_crate.gd`
- `src/gameplay/salvage_grid.gd`
- `scenes/PrototypeMain.tscn`
- `tests/unit/salvage/salvage_beam_test.gd`
