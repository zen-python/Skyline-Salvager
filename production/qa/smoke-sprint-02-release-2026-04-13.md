# Smoke Check: Sprint 02 Release Publish

**Date**: 2026-04-13
**Scope**: published Linux `arm64` release verification
**Verdict**: PASS

## Published Release

- **Tag**: `v0.3.0`
- **Channel**: GitHub Release
- **Workflow Run**: `24364745072`

## Verified Outcomes

- `Skyline CI` for commit `91ec4b1` completed successfully before release
- `Publish Release` completed successfully
- release asset `skyline-salvager-linux-arm64.tar.gz` uploaded
- release asset `skyline-salvager-linux-arm64.tar.gz.sha256` uploaded

## Notes

- the sprint kickoff target was `v0.2.0`
- the publish workflow computed `v0.3.0` because `v0.2.0` already existed on
  the remote when the new release was dispatched
