# Release Checklist: v0.2.0

## Status

CONDITIONAL GO

## Release Target

- **Channel**: GitHub Release
- **Platform**: Linux `arm64` prototype build distribution via repository
  release page
- **Release Type**: `minor`
- **Prerelease**: `false`
- **Expected Tag**: `v0.2.0`
- **Current Baseline Tag**: `v0.1.0`

## Code Health

- [x] `bash scripts/dev-gate.sh` passes
- [x] no TODO, FIXME, or HACK markers found in tracked working areas
- [x] no open S1 or S2 bug references remain in release-facing artifacts
- [x] `export_presets.cfg` is committed for Linux `arm64`

## Build Verification

- [ ] rerun `godot --headless --path . --quit` against the final candidate commit
- [ ] rerun `godot --headless --path . --scene res://scenes/PrototypeMain.tscn --quit-after 5`
- [ ] rerun `godot --headless --path . --script res://tests/runtime/story_001_runtime_check.gd`
- [ ] rerun `godot --headless --path . --script res://tests/runtime/story_002_runtime_check.gd`
- [ ] rerun `bash scripts/build-linux-arm64.sh` against the final candidate
  commit

## Quality Gates

- [x] `bash scripts/qa-gate.sh` passes
- [x] `bash scripts/release-gate.sh` passes
- [x] sprint-02 QA plan exists at `production/qa/qa-plan-sprint-02.md`
- [x] sprint-02 preflight smoke evidence exists at
  `production/qa/smoke-sprint-02-preflight-2026-04-13.md`
- [x] Linux `arm64` build automation exists at `scripts/build-linux-arm64.sh`

## Content Readiness

- [x] Story 001 and Story 002 are implemented and have review artifacts
- [x] release scope is limited to the validated vertical slice
- [ ] confirm generated release notes communicate the shipped scope clearly
- [ ] confirm the archive name and checksum match the published Linux `arm64`
  artifact

## Platform And Distribution

- [x] `.github/workflows/release.yml` supports manual publish with semantic
  version bumps and Linux `arm64` asset upload
- [x] `.github/workflows/release-readiness.yml` mirrors the validation suite
  and Linux `arm64` export
- [ ] dispatch `Publish Release` with `release_type=minor`
- [ ] verify GitHub creates annotated tag `v0.2.0`
- [ ] verify GitHub publishes the release entry with generated notes
- [ ] verify GitHub publishes `skyline-salvager-linux-arm64.tar.gz`
- [ ] verify GitHub publishes the matching SHA-256 checksum file

## Blockers

- final candidate validation has not yet been rerun against the exact publish
  commit
- the `Publish Release` workflow has not yet been dispatched for `v0.2.0`

## Go Or No-Go Framing

Go once the final candidate command set passes and the publish workflow is run
with the documented inputs.
