# Bug Report

## Summary

**Title**: Beam lock persists after target crate is destroyed
**ID**: BUG-0001
**Severity**: S2-High
**Priority**: P2-Next Sprint
**Status**: Resolved
**Category**: Gameplay

## Reproduction Steps

1. Start a salvage run.
2. Lock onto a crate with the beam.
3. Trigger crate destruction from a collapse event before the next pull tick.
4. Observe the beam state.

**Expected Result**: The beam lock clears and returns to idle.
**Actual Result**: The old implementation remained visually active and blocked new lock-on attempts.

## Notes

Likely affected files:

- `src/gameplay/salvage_beam.gd`
- `src/gameplay/salvage_crate.gd`

## Resolution

Story 001 now clears the active lock when the target emits `destroyed`, records
`target_destroyed` as failure feedback, and returns the beam to `idle`.
