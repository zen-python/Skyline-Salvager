# Sprint 02 -- 2026-04-27 to 2026-05-08

## Sprint Goal

Convert the validated vertical-slice prototype into a production GitHub release
at `v0.2.0` with a Linux `arm64` downloadable build artifact.

## Milestone Context

- **Current Milestone**: Vertical Slice Production Release
- **Milestone Deadline**: 2026-05-15
- **Current Release Baseline**: `v0.1.0`
- **Target Release**: `v0.2.0`
- **Release Lane**: `.github/workflows/release.yml`
- **Primary Platform**: Linux `arm64`

## Must Have

| ID | Task | Agent/Owner | Est. Days | Dependencies | Acceptance Criteria | Status |
| --- | --- | --- | --- | --- | --- | --- |
| S02-001 | Freeze release scope and production artifacts | producer | 1 | None | Sprint plan, QA plan, release checklist, and launch checklist exist for `v0.2.0` with blockers and sign-off evidence defined | In Progress |
| S02-002 | Add Linux `arm64` export lane | lead-programmer | 1 | S02-001 | `export_presets.cfg`, the build script, and release workflows produce a packaged Linux `arm64` artifact without blocking defects | In Progress |
| S02-003 | Refresh release-candidate QA evidence | qa-lead | 1 | S02-001, S02-002 | Sprint-02 smoke evidence records passing `dev`, `qa`, and `release` gates plus the Godot headless runtime checks and Linux `arm64` export used by the publish lane | Planned |
| S02-004 | Run final release-readiness verification | lead-programmer | 1 | S02-003 | The release workflow inputs, tag baseline, export artifact path, and validation commands are verified against the candidate commit with no blocking defects | Planned |
| S02-005 | Publish `v0.2.0` GitHub release | producer | 0.5 | S02-004 | `Publish Release` is dispatched with `release_type=minor` and `prerelease=false`, producing tag `v0.2.0` and a public GitHub Release with Linux `arm64` assets attached | Blocked |

## Risks

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Release docs drift from the actual GitHub workflow inputs | Medium | High | Tie the sprint tasks to `.github/workflows/release.yml`, the Linux `arm64` export lane, and the current `v0.1.0` baseline |
| Release evidence goes stale before publish day | Medium | Medium | Record a sprint-02 preflight now and rerun the same command set before dispatching the publish workflow |
| A last-minute regression appears only in the playable prototype scene | Low | High | Keep the headless scene boot and both runtime scripts in the required release checklist |

## Notes

- Planning kickoff was recorded on 2026-04-13 after Sprint 01 validation
  passed.
- Sprint 02 is the release-hardening sprint for the already implemented Story
  001 and Story 002 scope, not a new gameplay feature sprint.
