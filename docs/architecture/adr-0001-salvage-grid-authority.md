# ADR-0001: Salvage Grid Owns Rooftop Stress State

## Status

Accepted

## Date

2026-04-13

## Context

The salvage beam can pull crates across multiple roof tiles, and each pull can
increase local instability. We need one authoritative place to track stress so
beam logic, hazard telegraphs, and collapse triggers all read the same state.

## Decision

The salvage grid system owns rooftop stress state. Beam actions publish stress
events into the grid, and collapse or telegraph systems consume grid state
instead of maintaining their own stress counters.

## Alternatives Considered

1. Let the beam own rooftop stress directly.
   Rejected because hazard authority would be coupled to one interaction system.
2. Let the telegraph UI track its own stress values.
   Rejected because the display layer would drift from gameplay truth.

## Consequences

- Beam code stays focused on interaction logic instead of hazard authority.
- Hazard systems can remain read-only against grid stress values.
- Future systems that modify stability must go through the grid authority boundary.

## Engine Compatibility

- Target engine version: Godot `4.6.2`
- The decision is engine-compatible because it relies on ordinary GDScript data
  ownership rather than editor-only scene hacks.

## ADR Dependencies

- No prior ADR dependencies.

## GDD Requirements Addressed

- Rooftop collapse must be readable and causally linked to player actions.
- Salvage beam interactions must be able to increase local structural stress.
