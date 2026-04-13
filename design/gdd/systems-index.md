# Systems Index: Skyline Salvager

## MVP Systems

| System | Purpose | Priority | Dependencies |
| --- | --- | --- | --- |
| Salvage Beam | Pull and redirect crates | MVP | Input, physics, scoring |
| Rooftop Stability | Track local structural stress and collapse thresholds | MVP | Physics, hazards |
| Extraction Lifts | Accept delivered cargo and award score | MVP | Salvage beam, scoring |
| Hazard Telegraphs | Warn about collapse or falling debris | MVP | Rooftop stability, UI/VFX |
| Score and Combo | Reward fast, efficient delivery under pressure | MVP | Extraction lifts |

## Vertical Slice Systems

| System | Purpose | Priority | Dependencies |
| --- | --- | --- | --- |
| Salvage Modules | Add alternate beam behaviors | Slice | Salvage beam |
| Contract Goals | Give each run distinct constraints | Slice | Score and combo |

## Notes

- The salvage beam and rooftop stability systems are the architectural spine.
- Any story touching beam behavior must account for rooftop stress side effects.
