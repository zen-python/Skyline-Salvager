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

## Consequences

- Beam code stays focused on interaction logic instead of hazard authority.
- Hazard systems can remain read-only against grid stress values.
- Future systems that modify stability must go through the grid authority boundary.

## GDD Requirements Addressed

- Rooftop collapse must be readable and causally linked to player actions.
- Salvage beam interactions must be able to increase local structural stress.
