# Story 001: Magnetic Crate Pull

**Type**: Logic
**Estimate**: 3 days
**Dependencies**: None
**In Scope**: Beam lock-on, pull initiation, grid movement, stress event emission
**Out of Scope**: Alternate beam modules, collapse VFX polish, scoring multiplier tuning

## Design Context

- GDD: `design/gdd/game-concept.md`
- System: `design/gdd/systems-index.md`
- ADR: `docs/architecture/adr-0001-salvage-grid-authority.md`

## Acceptance Criteria

1. The player can lock onto a valid salvage crate within beam range.
2. Activating the beam pulls the crate one grid step toward the rig every tick while the beam remains active.
3. Each completed pull step emits a rooftop stress event to the salvage grid authority.
4. Invalid targets do not start the pull state and give visible failure feedback.

## Files To Create / Modify

- `src/gameplay/salvage_beam.gd`
- `src/gameplay/salvage_crate.gd`
- `src/gameplay/salvage_grid.gd`
- `tests/unit/salvage/salvage_beam_test.gd`

## Test Evidence

- `tests/unit/salvage/salvage_beam_test.gd`
