# ADR-0002: GitHub Release Publishes a Linux arm64 Export Artifact

## Status

Accepted

## Date

2026-04-13

## Context

Sprint 02 moves the repo from release planning into an actual production
release. The existing GitHub workflows validate the Godot project and publish a
tagged release, but they do not produce a downloadable game build. We need a
single supported release target that matches the current project scope without
adding storefront or multi-platform overhead.

## Decision

The production release lane targets Linux `arm64` first. The repo commits one
Godot export preset in `export_presets.cfg`, packages the exported binary
through `scripts/build-linux-arm64.sh`, verifies the export in
`release-readiness.yml`, and attaches the packaged archive plus checksum in
`release.yml`.

## Alternatives Considered

1. Publish a GitHub release with source only.
   Rejected because it does not satisfy the requirement to publish a playable
   game build.
2. Add multi-platform export support in the same sprint.
   Rejected because it expands platform scope and risk before one production
   lane is proven end to end.
3. Export manually on a developer machine and upload artifacts by hand.
   Rejected because it creates process drift from the repo’s validation and
   release automation.

## Consequences

- Release automation now has a concrete binary deliverable instead of a tag-only
  outcome.
- `release-readiness.yml` covers exportability, not only headless runtime
  checks.
- Future platform additions should be added as separate presets and workflow
  extensions, not by overloading the Linux `arm64` lane.

## Engine Compatibility

- Target engine version: Godot `4.6.2`
- Export lane depends on committed Godot export preset configuration and the
  export templates available in CI via `chickensoft-games/setup-godot@v2`.

## ADR Dependencies

- Depends on `ADR-0001`, because the packaged build must preserve the existing
  gameplay and stress-authority architecture without introducing platform-side
  logic forks.

## GDD Requirements Addressed

- the playable prototype must be distributable as a real game build
- the release process must preserve the validated Story 001 and Story 002
  behavior in the shipped artifact
