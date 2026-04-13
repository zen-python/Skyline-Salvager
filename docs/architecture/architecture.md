# Skyline Salvager Architecture

## Date

2026-04-13

## Scope

This blueprint covers the currently shipped vertical-slice prototype and the
Sprint 02 production release path for Linux `arm64`.

## Layer Map

### Presentation

- `scenes/PrototypeMain.tscn`
- `src/gameplay/prototype_main.gd`

Responsibilities:

- present the playable prototype scene
- display rooftop stress telegraph feedback
- translate player input into gameplay actions without owning gameplay state

### Feature

- `src/gameplay/salvage_beam.gd`
- `src/gameplay/salvage_crate.gd`

Responsibilities:

- implement beam targeting and pull behavior
- model crate interaction state
- publish stress-causing actions into the grid authority

### Core

- `src/gameplay/salvage_grid.gd`

Responsibilities:

- own rooftop stress state
- provide authoritative tile stress reads for telegraph and future collapse
  logic
- act as the single consistency boundary for structural stress updates

### Foundation

- `tests/unit/salvage/salvage_beam_test.gd`
- `tests/runtime/story_001_runtime_check.gd`
- `tests/runtime/story_002_runtime_check.gd`
- `scripts/dev-gate.sh`
- `scripts/qa-gate.sh`
- `scripts/release-gate.sh`

Responsibilities:

- validate logic and runtime behavior
- enforce repo health gates before release
- prevent release drift between implementation and production artifacts

### Platform

- `export_presets.cfg`
- `scripts/build-linux-arm64.sh`
- `.github/workflows/release-readiness.yml`
- `.github/workflows/release.yml`

Responsibilities:

- define Linux `arm64` export settings
- build and package the release artifact
- verify exportability in CI before release
- publish the packaged binary and checksum to GitHub Releases

## Module Ownership Map

- gameplay logic: `src/gameplay/`
- release evidence and planning: `production/`
- release automation and export configuration: `scripts/`, `.github/workflows/`,
  and `export_presets.cfg`

## Critical Data Flow

1. Player input in the prototype scene triggers beam targeting and pull
   behavior.
2. Pull steps update crate position and emit stress events into the salvage
   grid.
3. Presentation reads stress state from the grid to render the rooftop warning
   telegraph.
4. Release automation reruns the validation gates and runtime checks, exports a
   Linux `arm64` binary, packages it, and uploads the archive to the GitHub
   release tied to the computed semantic version tag.

## API Boundaries

- `src/gameplay/salvage_grid.gd` remains the authority for rooftop stress.
- Presentation code may read stress state but must not own or duplicate stress
  counters.
- Release workflows call `scripts/build-linux-arm64.sh` instead of embedding
  ad hoc export commands in multiple places.

## Required ADRs

- `docs/architecture/adr-0001-salvage-grid-authority.md`
- `docs/architecture/adr-0002-linux-arm64-release-lane.md`
