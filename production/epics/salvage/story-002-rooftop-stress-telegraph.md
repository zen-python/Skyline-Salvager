# Story 002: Rooftop Stress Telegraph

**Type**: Integration
**Estimate**: 2 days
**Dependencies**: Story 001
**In Scope**: Prototype scene telegraph UI, stress warning thresholds, readable screen-space feedback tied to grid stress
**Out of Scope**: Collapse resolution, debris simulation, shader/VFX polish, scoring changes

## Design Context

- GDD: `design/gdd/game-concept.md`
- System: `design/gdd/systems-index.md`
- ADR: `docs/architecture/adr-0001-salvage-grid-authority.md`
- Sprint: `production/sprints/sprint-01.md`

## Implementation Notes

- The telegraph reads stress state from the salvage grid and does not maintain a separate hazard counter.
- Prototype tuning defaults should provide one visible warning step before the collapse threshold is reached.
- Recommended default tuning for the prototype:
  - `collapse_threshold = 3`
  - `warning_threshold = 2`

## Acceptance Criteria

1. The playable prototype shows a screen-space rooftop stress telegraph after a pull step applies stress to a tile.
2. The telegraph displays the affected tile coordinates and the current stress value against the collapse threshold.
3. When a tile reaches the warning threshold and remains below the collapse threshold, the telegraph enters a visually distinct warning state.
4. When later pull steps affect a different tile, the telegraph updates to the newest stressed tile instead of leaving stale warning data on screen.

## Files To Create / Modify

- `src/gameplay/prototype_main.gd`
- `scenes/PrototypeMain.tscn`
- `tests/runtime/story_002_runtime_check.gd`
- `production/qa/test-evidence/story-002-rooftop-stress-telegraph.md`

## Test Evidence

- `tests/runtime/story_002_runtime_check.gd`
- `production/qa/test-evidence/story-002-rooftop-stress-telegraph.md`
