# QA Plan: Sprint 02

## Scope

- production release validation for `v0.2.0`
- Linux `arm64` packaged export
- Story 001: magnetic crate pull
- Story 002: rooftop stress telegraph

## Classification

- **Sprint 02**: Release hardening

## Automated Coverage Required

- `bash scripts/dev-gate.sh`
- `bash scripts/qa-gate.sh`
- `bash scripts/release-gate.sh`
- `godot --headless --path . --quit`
- `godot --headless --path . --scene res://scenes/PrototypeMain.tscn --quit-after 5`
- `godot --headless --path . --script res://tests/runtime/story_001_runtime_check.gd`
- `godot --headless --path . --script res://tests/runtime/story_002_runtime_check.gd`
- `bash scripts/build-linux-arm64.sh`

## Manual Verification

- confirm the intended release target remains a GitHub-hosted Linux `arm64`
  prototype build and not a storefront build with additional compliance
  requirements
- verify the release workflow inputs are set to `release_type=minor` and
  `prerelease=false`
- verify the generated release notes describe Story 001 and Story 002 instead
  of a prototype dry run
- verify the release page includes the Linux `arm64` archive and checksum files

## Smoke Scope

- run the three repo gates from the candidate commit
- boot the project headlessly
- boot the prototype scene headlessly
- run both runtime story checks
- export the Linux `arm64` archive and checksum
- confirm the latest tag is `v0.1.0` before publish so the workflow computes
  `v0.2.0`

## Evidence Required For Sign-Off

- sprint-02 smoke report with dated command results
- updated release checklist for `v0.2.0`
- updated launch checklist for `v0.2.0`
- Linux `arm64` export artifact and checksum from the candidate commit
- no open bugs in `production/qa/bugs/`
