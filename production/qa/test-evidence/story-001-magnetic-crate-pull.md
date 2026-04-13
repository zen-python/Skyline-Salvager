# Story 001 Test Evidence

**Story**: `production/epics/salvage/story-001-magnetic-crate-pull.md`
**Date**: 2026-04-13

## Automated Logic Coverage

File:

- `tests/unit/salvage/salvage_beam_test.gd`

Covered scenarios:

- valid lock-on inside range
- invalid lock-on outside range
- pull tick movement by one tile
- stress event emission on completed pull step
- target destruction clearing the active lock state

## Manual Smoke Notes

Scene:

- `scenes/PrototypeMain.tscn`

Manual interactions represented by the prototype scene:

- `L` acquires the current crate target
- `Space` starts the beam and advances one pull tick
- `K` destroys the selected target to simulate collapse invalidation
- `Esc` clears the beam back to idle

## Result

- logic acceptance criteria covered
- bug reproduction path from BUG-0001 covered by the target-destruction case
