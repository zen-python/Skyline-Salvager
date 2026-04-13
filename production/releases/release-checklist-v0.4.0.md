# Release Checklist: v0.4.0

## Status

PUBLISHED

## Release Target

- **Channel**: GitHub Release
- **Platform**: Linux `arm64` prototype build distribution via repository
  release page
- **Release Type**: `minor`
- **Prerelease**: `true`
- **Published Tag**: `v0.4.0`
- **Prior Tag Baseline**: `v0.3.0`

## Code Health

- [x] `bash scripts/dev-gate.sh` passed before publish
- [x] no TODO, FIXME, or HACK markers were found in tracked working areas
- [x] no open S1 or S2 bug references remained in release-facing artifacts
- [x] `export_presets.cfg` remained committed for Linux `arm64`

## Build Verification

- [x] `godot --headless --path . --quit`
- [x] `godot --headless --path . --scene res://scenes/PrototypeMain.tscn --quit-after 2`
- [x] `godot --headless --path . --script res://tests/runtime/story_001_runtime_check.gd`
- [x] `godot --headless --path . --script res://tests/runtime/story_002_runtime_check.gd`
- [x] `.github/workflows/release.yml` reran validation and `bash scripts/build-linux-arm64.sh`

## Quality Gates

- [x] `bash scripts/qa-gate.sh` passed before publish
- [x] `bash scripts/release-gate.sh` passed before publish
- [x] publish workflow run `24367062888` completed successfully
- [x] release publish evidence exists at
  `production/qa/smoke-sprint-02-release-v0.4.0-2026-04-13.md`
- [x] release shipped as a prerelease because art-direction sign-off for the
  in-world telegraph and HUD polish remains pending

## Content Readiness

- [x] Story 001 and Story 002 validation still passed on the release candidate
- [x] the graphical prototype playfield shipped in the release candidate
- [x] generated release notes were published
- [x] Linux `arm64` archive and checksum were attached to the release

## Platform And Distribution

- [x] `.github/workflows/release.yml` published Linux `arm64` assets
- [x] `.github/workflows/release-readiness.yml` verifies Linux `arm64` export
- [x] GitHub created annotated tag `v0.4.0`
- [x] GitHub published the prerelease entry with generated notes
- [x] GitHub published `skyline-salvager-linux-arm64.tar.gz`
- [x] GitHub published the matching SHA-256 checksum file

## Outcome

The Linux `arm64` graphical prototype prerelease shipped successfully on
2026-04-13 as `v0.4.0`.
