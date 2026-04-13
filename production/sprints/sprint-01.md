# Sprint 01 -- 2026-04-13 to 2026-04-24

## Sprint Goal

Prove the magnetic crate-pull loop with readable rooftop stress feedback.

## Milestone Context

- **Current Milestone**: Vertical Slice Prototype
- **Milestone Deadline**: 2026-05-15
- **Sprints Remaining**: 2

## Must Have

| ID | Task | Agent/Owner | Est. Days | Dependencies | Acceptance Criteria | Status |
| --- | --- | --- | --- | --- | --- | --- |
| S01-001 | Implement magnetic crate pull | lead-programmer | 3 | None | Story-001 passes readiness and smoke | Complete |
| S01-002 | Add rooftop stress telegraph | technical-artist | 2 | S01-001 | Telegraph appears before collapse thresholds are crossed | Complete |
| S01-003 | Create QA plan and smoke list | qa-lead | 1 | None | QA plan written and smoke scope agreed | Complete |

## Risks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Beam movement feels slippery | Medium | High | Keep pull targeting grid-anchored and expose tuning values |
| Collapse telegraph is unclear | Low | Medium | Story 002 now provides a dedicated warning panel with threshold-aware color changes |
