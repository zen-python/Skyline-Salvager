# Skyline Salvager

Skyline Salvager is a Godot 4.6 prototype repo that uses the Codex game-studio
operating layer directly inside a real project.

The current implemented vertical slice is Story 001: magnetic crate pull. It
includes:

- project-level Codex workflow docs
- the copied studio playbooks, role cards, and validation scripts
- real gameplay code for beam lock-on, pull ticks, crate state, and grid stress
- a minimal prototype scene for smoke testing
- test and review artifacts showing the story flow from readiness to done

## Quick Start

1. Open this folder as the workspace root in Codex.
2. Read `AGENTS.md` and `docs/USAGE.md`.
3. Run `bash scripts/session-start.sh`.
4. Start from `docs/WORKFLOW-TRACE.md` if you want the exercised end-to-end flow.
5. Inspect `production/epics/salvage/story-001-magnetic-crate-pull.md` and the files in `production/reviews/`.

## Project Stack

- Engine: Godot 4.6
- Language: GDScript
- Renderer: Forward+
- Test target: gameplay logic and beam-state transitions

## Current Implemented Files

- `project.godot`
- `scenes/PrototypeMain.tscn`
- `src/gameplay/salvage_beam.gd`
- `src/gameplay/salvage_crate.gd`
- `src/gameplay/salvage_grid.gd`
- `src/gameplay/prototype_main.gd`
- `tests/unit/salvage/salvage_beam_test.gd`

## Workflow Evidence

- `production/reviews/story-001-readiness.md`
- `production/reviews/story-001-code-review.md`
- `production/reviews/story-001-done.md`
- `production/qa/test-evidence/story-001-magnetic-crate-pull.md`
- `production/qa/smoke-2026-04-13.md`

## GitHub Automation

This repo now includes GitHub Actions for Godot headless validation and
tag-triggered release readiness. See `docs/GITHUB-SETUP.md`.

## Notes

- The prototype focuses on grid-authoritative beam logic, not art polish.
- The previous BUG-0001 sample has been archived as resolved in
  `production/qa/bugs-resolved/`.
- The copied playbooks and role cards remain available in this repo so Codex can
  operate on the project without referencing the external scaffold.
